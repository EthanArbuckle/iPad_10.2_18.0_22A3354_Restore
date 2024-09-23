@implementation WFSelectFilesUIKitUserInterface

- (void)retrieveFilesWithConsumingBundleID:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  _QWORD block[6];

  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSelectFilesActionUIKitUserInterface.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[WFSelectFilesUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v10);
  -[WFSelectFilesUIKitUserInterface setConsumingBundleID:](self, "setConsumingBundleID:", v9);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__WFSelectFilesUIKitUserInterface_retrieveFilesWithConsumingBundleID_options_completionHandler___block_invoke;
  block[3] = &unk_24E3438C0;
  block[4] = self;
  block[5] = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (id)supportedPickerContentTypesWithOptions:(unint64_t)a3
{
  uint64_t *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if ((a3 & 8) != 0)
  {
    v6[0] = *MEMORY[0x24BDF83C0];
    v3 = v6;
  }
  else
  {
    v5 = *MEMORY[0x24BDF8430];
    v3 = &v5;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)finishWithResults:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFSelectFilesUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFSelectFilesUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFSelectFilesUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFSelectFilesUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __75__WFSelectFilesUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFSelectFilesUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)documentPickerWasCancelled:(id)a3
{
  -[WFSelectFilesUIKitUserInterface cancelPresentationWithCompletionHandler:](self, "cancelPresentationWithCompletionHandler:", &__block_literal_global_5124);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  _QWORD v4[5];
  _QWORD v5[5];

  v4[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73__WFSelectFilesUIKitUserInterface_documentPicker_didPickDocumentsAtURLs___block_invoke;
  v5[3] = &unk_24E343908;
  v5[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__WFSelectFilesUIKitUserInterface_documentPicker_didPickDocumentsAtURLs___block_invoke_2;
  v4[3] = &unk_24E343B20;
  objc_msgSend(a4, "if_mapAsynchronously:completionHandler:", v5, v4);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSelectFilesUIKitUserInterface finishWithResults:error:](self, "finishWithResults:error:", 0, v4);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)consumingBundleID
{
  return self->_consumingBundleID;
}

- (void)setConsumingBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumingBundleID, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

void __73__WFSelectFilesUIKitUserInterface_documentPicker_didPickDocumentsAtURLs___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v5 = (void *)MEMORY[0x24BE00FB0];
  v6 = *(void **)(a1 + 32);
  v7 = a4;
  v8 = a2;
  objc_msgSend(v6, "consumingBundleID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getResultWithFileURL:consumingBundleID:resultBlock:", v8, v9, v7);

}

uint64_t __73__WFSelectFilesUIKitUserInterface_documentPicker_didPickDocumentsAtURLs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResults:error:", a2, 0);
}

uint64_t __75__WFSelectFilesUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResults:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __96__WFSelectFilesUIKitUserInterface_retrieveFilesWithConsumingBundleID_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc(MEMORY[0x24BEBD560]);
  objc_msgSend(*(id *)(a1 + 32), "supportedPickerContentTypesWithOptions:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "initForOpeningContentTypes:asCopy:", v3, 0);

  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  objc_msgSend(v4, "setAllowsMultipleSelection:", (*(_QWORD *)(a1 + 40) >> 1) & 1);
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "presentContent:", v4);

}

@end
