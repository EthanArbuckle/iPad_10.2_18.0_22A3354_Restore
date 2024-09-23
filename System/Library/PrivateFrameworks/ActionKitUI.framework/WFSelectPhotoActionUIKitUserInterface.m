@implementation WFSelectPhotoActionUIKitUserInterface

- (void)showWithPhotoPickerTypes:(id)a3 selectMultiple:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD block[4];
  id v15;
  WFSelectPhotoActionUIKitUserInterface *v16;
  id v17;
  BOOL v18;

  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSelectPhotoActionUIKitUserInterface.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[WFSelectPhotoActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v10);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__WFSelectPhotoActionUIKitUserInterface_showWithPhotoPickerTypes_selectMultiple_completionHandler___block_invoke;
  block[3] = &unk_24E342CE8;
  v16 = self;
  v17 = v10;
  v18 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)finishWithOutput:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFSelectPhotoActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFSelectPhotoActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFSelectPhotoActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFSelectPhotoActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __81__WFSelectPhotoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFSelectPhotoActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WFSelectPhotoActionUIKitUserInterface *v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__WFSelectPhotoActionUIKitUserInterface_picker_didFinishPicking___block_invoke;
  v8[3] = &unk_24E3439C0;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSelectPhotoActionUIKitUserInterface finishWithOutput:error:](self, "finishWithOutput:error:", 0, v4);

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

void __65__WFSelectPhotoActionUIKitUserInterface_picker_didFinishPicking___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "if_map:", &__block_literal_global_308);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 40);
    v6 = (id)v2;
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v4 = objc_claimAutoreleasedReturnValue();
    v3 = v5;
    v2 = 0;
    v6 = (id)v4;
  }
  objc_msgSend(v3, "finishWithOutput:error:", v2, v4);

}

uint64_t __65__WFSelectPhotoActionUIKitUserInterface_picker_didFinishPicking___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetIdentifier");
}

uint64_t __81__WFSelectPhotoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithOutput:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __99__WFSelectPhotoActionUIKitUserInterface_showWithPhotoPickerTypes_selectMultiple_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "systemPhotoLibraryWithError:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;

  if (v3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3B88]), "initWithPhotoLibrary:", v3);
    objc_msgSend(v5, "setSelectionLimit:", *(_BYTE *)(a1 + 56) == 0);
    objc_msgSend(v5, "setDisabledCapabilities:", 16);
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_compactMap:", &__block_literal_global_2130);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x24BDE3B90], "anyFilterMatchingSubfilters:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFilter:", v8);

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3B98]), "initWithConfiguration:", v5);
    objc_msgSend(v9, "setDelegate:", *(_QWORD *)(a1 + 40));
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "presentationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v10);

    objc_msgSend(*(id *)(a1 + 40), "presentContent:", v9);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

id __99__WFSelectPhotoActionUIKitUserInterface_showWithPhotoPickerTypes_selectMultiple_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE01070]))
  {
    objc_msgSend(MEMORY[0x24BDE3B90], "imagesFilter");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE01078]))
  {
    objc_msgSend(MEMORY[0x24BDE3B90], "livePhotosFilter");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE01080]))
    {
      v4 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDE3B90], "videosFilter");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
LABEL_8:

  return v4;
}

@end
