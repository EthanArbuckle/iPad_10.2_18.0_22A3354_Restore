@implementation WFSaveDropboxFileActionUIKitUserInterface

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

- (void)showWithServiceName:(id)a3 input:(id)a4 managedLevel:(unint64_t)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  WFSaveDropboxFileActionUIKitUserInterface *v23;
  id v24;
  unint64_t v25;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSaveDropboxFileActionUIKitUserInterface.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[WFSaveDropboxFileActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v14);
  -[WFSaveDropboxFileActionUIKitUserInterface selectedStorageServiceForName:](self, "selectedStorageServiceForName:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke;
  block[3] = &unk_24E342C68;
  v21 = v15;
  v22 = v13;
  v23 = self;
  v24 = v14;
  v25 = a5;
  v16 = v13;
  v17 = v14;
  v18 = v15;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFSaveDropboxFileActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __85__WFSaveDropboxFileActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFSaveDropboxFileActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)cancel
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;

  -[WFSaveDropboxFileActionUIKitUserInterface saveOperation](self, "saveOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[WFSaveDropboxFileActionUIKitUserInterface completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFSaveDropboxFileActionUIKitUserInterface completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v6);

  }
  -[WFSaveDropboxFileActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);
  -[WFSaveDropboxFileActionUIKitUserInterface setSaveOperation:](self, "setSaveOperation:", 0);
}

- (WFFileStorageServiceOperation)saveOperation
{
  return self->_saveOperation;
}

- (void)setSaveOperation:(id)a3
{
  objc_storeStrong((id *)&self->_saveOperation, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_saveOperation, 0);
}

uint64_t __85__WFSaveDropboxFileActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke(uint64_t a1)
{
  WFFilePickerViewController *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;

  v2 = [WFFilePickerViewController alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke_2;
  v12[3] = &unk_24E342C40;
  v16 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v13 = v4;
  v14 = v5;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 64);
  v15 = v6;
  v17 = v7;
  v8 = -[WFFilePickerViewController initForSavingFilesAtPath:service:completionHandler:](v2, "initForSavingFilesAtPath:service:completionHandler:", CFSTR("/"), v3, v12);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  v10 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v9, "presentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", v10);

  objc_msgSend(*(id *)(a1 + 48), "presentContent:", v9);
}

void __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];

  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "if_compactMap:", &__block_literal_global_1942);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 64);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke_4;
    v9[3] = &unk_24E343B20;
    v6 = *(void **)(a1 + 48);
    v9[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "saveFiles:withManagedLevel:toPath:options:progress:completionHandler:", v4, v5, v3, 0, 0, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSaveOperation:", v7);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v4);
  }

}

void __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "saveOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCancelled");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id))v9)[2](v9, v10, v5);

    }
    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setSaveOperation:", 0);
  }

}

id __110__WFSaveDropboxFileActionUIKitUserInterface_showWithServiceName_input_managedLevel_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE194F8];
  objc_msgSend(a2, "wrappedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileWithURL:options:", v4, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
