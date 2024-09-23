@implementation WFGetDropboxFileActionUIKitUserInterface

- (id)selectedStorageServiceForName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE01018];
  v4 = a3;
  objc_msgSend(v3, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storageServiceWithName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)showWithServiceName:(id)a3 directoryPath:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  WFGetDropboxFileActionUIKitUserInterface *v24;
  id v25;
  id v26;
  unint64_t v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[WFGetDropboxFileActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v12);
  objc_msgSend(MEMORY[0x24BEC1308], "accessSpecifierForCurrentConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    getWFActionsLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFGetDropboxFileActionUIKitUserInterface showWithServiceName:directoryPath:options:completionHandler:]";
      v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_21EB60000, v15, OS_LOG_TYPE_FAULT, "%s Could not get bundle identifier for the calling process. +[NSXPCConnection currentConnection] is %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 57, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGetDropboxFileActionUIKitUserInterface finishWithResults:error:](self, "finishWithResults:error:", 0, v17);

  }
  -[WFGetDropboxFileActionUIKitUserInterface selectedStorageServiceForName:](self, "selectedStorageServiceForName:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__WFGetDropboxFileActionUIKitUserInterface_showWithServiceName_directoryPath_options_completionHandler___block_invoke;
  block[3] = &unk_24E342C68;
  v26 = v12;
  v27 = a5;
  v23 = v18;
  v24 = self;
  v25 = v11;
  v19 = v11;
  v20 = v12;
  v21 = v18;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)finishWithResults:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFGetDropboxFileActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFGetDropboxFileActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  else
  {
    -[WFGetDropboxFileActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);
  }

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFGetDropboxFileActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __84__WFGetDropboxFileActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFGetDropboxFileActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFGetDropboxFileActionUIKitUserInterface finishWithResults:error:](self, "finishWithResults:error:", 0, v4);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __84__WFGetDropboxFileActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResults:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __104__WFGetDropboxFileActionUIKitUserInterface_showWithServiceName_directoryPath_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  WFFilePickerViewController *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  uint64_t v15;
  id v16;

  v2 = (*(_QWORD *)(a1 + 64) >> 1) & 1;
  v3 = [WFFilePickerViewController alloc];
  v4 = *(_QWORD *)(a1 + 32);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __104__WFGetDropboxFileActionUIKitUserInterface_showWithServiceName_directoryPath_options_completionHandler___block_invoke_2;
  v14 = &unk_24E342810;
  v5 = *(id *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = v5;
  v6 = -[WFFilePickerViewController initForPickingFilesAtPath:service:allowsMultipleSelection:completionHandler:](v3, "initForPickingFilesAtPath:service:allowsMultipleSelection:completionHandler:", CFSTR("/"), v4, v2, &v11);
  v7 = objc_alloc(MEMORY[0x24BEBD7A0]);
  v8 = (void *)objc_msgSend(v7, "initWithRootViewController:", v6, v11, v12, v13, v14);
  objc_msgSend(v8, "setModalPresentationStyle:", 2);
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "presentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v9);

  objc_msgSend(v6, "navigateToSubdirectoryAtPath:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "presentContent:", v8);

}

void __104__WFGetDropboxFileActionUIKitUserInterface_showWithServiceName_directoryPath_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "if_map:", &__block_literal_global_516);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithResults:error:", v3, 0);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);
  }

}

id __104__WFGetDropboxFileActionUIKitUserInterface_showWithServiceName_directoryPath_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  v3 = (void *)MEMORY[0x24BE00FB0];
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v2;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  objc_msgSend(v3, "resultWithMetadata:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
