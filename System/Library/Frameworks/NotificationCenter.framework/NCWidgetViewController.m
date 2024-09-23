@implementation NCWidgetViewController

void __48___NCWidgetViewController__enqueueProxyRequest___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __48___NCWidgetViewController__enqueueProxyRequest___block_invoke_2;
  v2[3] = &unk_24DB73EA8;
  v3 = *(id *)(a1 + 32);
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v4);

}

void __48___NCWidgetViewController__enqueueProxyRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

}

void __71___NCWidgetViewController__processInputItems_initialActiveDisplayMode___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  UIEdgeInsets *v17;
  NSString *v18;
  UIEdgeInsets *v19;
  NSString *v20;
  NSString *v21;
  CGRect *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  id v33;

  v33 = a2;
  objc_msgSend(v33, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("NCExtensionItemUserInfoWidgetIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v9 = objc_msgSend(v8, "copy");
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 1056);
      *(_QWORD *)(v10 + 1056) = v9;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("NCExtensionItemUserInfoContainerIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      v13 = objc_msgSend(v12, "copy");
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 1064);
      *(_QWORD *)(v14 + 1064) = v13;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("NCExtensionItemUserInfoDefaultMargins"));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](v16, "length"))
    {
      v17 = (UIEdgeInsets *)(*(_QWORD *)(a1 + 32) + 1072);
      *v17 = UIEdgeInsetsFromString(v16);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("NCExtensionItemUserInfoInitialLayoutMargins"));
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](v18, "length"))
    {
      v19 = (UIEdgeInsets *)(*(_QWORD *)(a1 + 32) + 1104);
      *v19 = UIEdgeInsetsFromString(v18);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("NCExtensionItemUserInfoInitialBounds"));
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = (CGRect *)(*(_QWORD *)(a1 + 32) + 992);
      *v22 = CGRectFromString(v20);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("NCExtensionItemUserInfoInitialActiveDisplayMode"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      if (*(_QWORD *)(a1 + 120))
        **(_QWORD **)(a1 + 120) = objc_msgSend(v23, "integerValue");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    }

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("NCExtensionItemUserInfoInitialMaxLessSize"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v25 != 0;

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("NCExtensionItemUserInfoInitialMaxMoreSize"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v26 != 0;

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("NCExtensionItemUserInfoInitialVisibilityState"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040) = objc_msgSend(v27, "integerValue");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
    }

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("NCExtensionItemUserInfoSnapshotTimestampsEnabled"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1024) = objc_msgSend(v29, "BOOLValue");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
    }

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)
    || (v31 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24)) != 0)
  {
    v32 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v32, "removeObjectForKey:", CFSTR("NCExtensionItemUserInfoWidgetIdentifier"));
    objc_msgSend(v32, "removeObjectForKey:", CFSTR("NCExtensionItemUserInfoContainerIdentifier"));
    objc_msgSend(v32, "removeObjectForKey:", CFSTR("NCExtensionItemUserInfoDefaultMargins"));
    objc_msgSend(v32, "removeObjectForKey:", CFSTR("NCExtensionItemUserInfoInitialBounds"));
    objc_msgSend(v32, "removeObjectForKey:", CFSTR("NCExtensionItemUserInfoInitialActiveDisplayMode"));
    objc_msgSend(v32, "removeObjectForKey:", CFSTR("NCExtensionItemUserInfoInitialMaxLessSize"));
    objc_msgSend(v32, "removeObjectForKey:", CFSTR("NCExtensionItemUserInfoInitialMaxMoreSize"));
    objc_msgSend(v32, "removeObjectForKey:", CFSTR("NCExtensionItemUserInfoInitialVisibilityState"));
    objc_msgSend(v32, "removeObjectForKey:", CFSTR("NCExtensionItemUserInfoSnapshotTimestampsEnabled"));
    objc_msgSend(v33, "setUserInfo:", v32);

    v31 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v31)
    {
      v31 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v31)
      {
        v31 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        if (v31)
        {
          v31 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
          if (v31)
          {
            v31 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
            if (v31)
            {
              v31 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
              if (v31)
              {
                v31 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
                if (v31)
                  v31 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) != 0;
              }
            }
          }
        }
      }
    }
  }
  *a4 = v31;

}

void __60___NCWidgetViewController_beginRequestWithExtensionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_remoteViewControllerProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__setLargestAvailableDisplayMode:", *(_QWORD *)(a1 + 32));

}

void __60___NCWidgetViewController__closeTransactionWithAppearState___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_remoteViewControllerProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__closeTransactionForAppearanceCallWithState:withIdentifier:", *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

void __42___NCWidgetViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_closeTransactionWithAppearState:", 1);

}

void __55___NCWidgetViewController__requestPreferredViewHeight___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_remoteViewControllerProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__requestPreferredViewHeight:", *(double *)(a1 + 32));

}

void __55___NCWidgetViewController__requestPreferredViewHeight___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_contentProvidingViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutBelowIfNeeded");

}

void __78___NCWidgetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_contentProvidingViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutBelowIfNeeded");

}

uint64_t __63___NCWidgetViewController__performUpdateWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, 1);
  return result;
}

void __70___NCWidgetViewController__clientLargestSupportedDisplayModeDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_remoteViewControllerProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__setLargestAvailableDisplayMode:", *(_QWORD *)(a1 + 32));

}

void __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke(id *a1)
{
  void *v2;
  const void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[24];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
      objc_msgSend(MEMORY[0x24BDE57D8], "activateBackground:", 1);
    objc_msgSend(a1[5], "path");
    v3 = (const void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x24BDBCED8]);
    v5 = (void *)objc_msgSend(v4, "initWithObjectsAndKeys:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE5880], 0);
    if (objc_msgSend(a1[6], "isEqualToString:", CFSTR("com.apple.atx")))
    {
      objc_msgSend(v5, "setObject:forKey:", CFSTR("com.apple.atx"), *MEMORY[0x24BDE5870]);
      v6 = *MEMORY[0x24BDD92A8];
      v7 = *MEMORY[0x24BDD92A0];
      v19[0] = *MEMORY[0x24BDD93D8];
      v19[1] = v7;
      v20[0] = v6;
      v20[1] = &unk_24DB76350;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v8, *MEMORY[0x24BDE5878]);

    }
    CAMLEncodeLayerTreeToPathWithOptions();
    CFRelease(v3);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke_117;
    block[3] = &unk_24DB73FB8;
    v15 = a1[7];
    v16 = 0;
    v17 = a1[8];
    v9 = 0;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v10 = NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_ERROR))
      __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke_cold_1(v10);
    v11 = NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219951000, v11, OS_LOG_TYPE_DEFAULT, "Attempt to snapshot a layer not attached to a context", buf, 2u);
    }
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke_119;
    v12[3] = &unk_24DB73FE0;
    v13 = a1[8];
    dispatch_async(MEMORY[0x24BDAC9B8], v12);
    v9 = v13;
  }

}

void __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke_117(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  if (v2)
    objc_msgSend(v2, "removeFromSuperview");
  v3 = (void *)a1[5];
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("NCWidgetErrorDomain"), 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke_119(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BDD0FC8];
  v6[0] = CFSTR("The layer being encoded isn't attached to a context");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("NCWidgetErrorDomain"), 2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

}

void __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219951000, log, OS_LOG_TYPE_ERROR, "The layer being encoded must be attached to a context", v1, 2u);
}

@end
