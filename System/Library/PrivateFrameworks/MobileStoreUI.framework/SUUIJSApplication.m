@implementation SUUIJSApplication

- (SUUIJSApplication)initWithAppContext:(id)a3 applicationController:(id)a4
{
  id v6;
  SUUIJSApplication *v7;
  SUUIJSApplication *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SUUIJSApplication;
  v7 = -[IKJSObject initWithAppContext:](&v10, sel_initWithAppContext_, a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_applicationController, v6);

  return v8;
}

- (BOOL)pageRenderMetricsEnabled
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__SUUIJSApplication_pageRenderMetricsEnabled__block_invoke;
  v4[3] = &unk_2511F4720;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(MEMORY[0x24BDAC9B8], v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __45__SUUIJSApplication_pageRenderMetricsEnabled__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "applicationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "pageRenderMetricsEnabled");

}

- (void)launchFailed
{
  id v2;

  -[SUUIJSApplication applicationController](self, "applicationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_showErrorViewForLaunchFailure, 0, 0);

}

- (void)launchComplete:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIJSApplication applicationController](self, "applicationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__jsLaunchFinishedWithLaunchMetrics_, v4, 0);

}

- (void)sendDocumentMessage:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "appBridge");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__SUUIJSApplication_sendDocumentMessage_::__block_invoke;
    block[3] = &unk_2511F4798;
    v12 = v10;
    v13 = v7;
    v14 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __43__SUUIJSApplication_sendDocumentMessage_::__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v3 = a1[5];
  v7[0] = CFSTR("SUUIDocumentMessageNameKey");
  v7[1] = CFSTR("SUUIDocumentMessagePayloadKey");
  v5 = a1[6];
  v8[0] = v3;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("SUUIAppDocumentDidSendMessageNotification"), v4, v6);

}

- (BOOL)isRunningTests
{
  NSObject *v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v2 = MEMORY[0x24BDAC9B8];
  dispatch_assert_queue_not_V2(MEMORY[0x24BDAC9B8]);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SUUIJSApplication_isRunningTests__block_invoke;
  block[3] = &unk_2511FA508;
  block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

void __35__SUUIJSApplication_isRunningTests__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "launchedToTest");

}

- (SUUIApplicationController)applicationController
{
  return (SUUIApplicationController *)objc_loadWeakRetained((id *)&self->_applicationController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationController);
}

@end
