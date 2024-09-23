@implementation WFSelectMusicActionUIKitUserInterface

- (void)showWithSelectMultiple:(BOOL)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  _QWORD block[5];
  BOOL v10;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSelectMusicActionUIKitUserInterface.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[WFSelectMusicActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v7);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__WFSelectMusicActionUIKitUserInterface_showWithSelectMultiple_completionHandler___block_invoke;
  block[3] = &unk_24E3437E0;
  v10 = a3;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFSelectMusicActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __81__WFSelectMusicActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFSelectMusicActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)finishWithOutput:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFSelectMusicActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFSelectMusicActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFSelectMusicActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__WFSelectMusicActionUIKitUserInterface_mediaPicker_didPickMediaItems___block_invoke;
  v8[3] = &unk_24E3439C0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (void)mediaPickerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__WFSelectMusicActionUIKitUserInterface_mediaPickerDidCancel___block_invoke;
  v3[3] = &unk_24E343958;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
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

void __62__WFSelectMusicActionUIKitUserInterface_mediaPickerDidCancel___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithOutput:error:", 0, v2);

}

uint64_t __71__WFSelectMusicActionUIKitUserInterface_mediaPicker_didPickMediaItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithOutput:error:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __81__WFSelectMusicActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithOutput:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __82__WFSelectMusicActionUIKitUserInterface_showWithSelectMultiple_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPMediaPickerControllerClass_softClass;
  v9 = getMPMediaPickerControllerClass_softClass;
  if (!getMPMediaPickerControllerClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPMediaPickerControllerClass_block_invoke;
    v5[3] = &unk_24E343A50;
    v5[4] = &v6;
    __getMPMediaPickerControllerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  v4 = (void *)objc_msgSend([v3 alloc], "initWithMediaTypes:", 255);
  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  objc_msgSend(v4, "setPreferredContentSize:", 540.0, 620.0);
  objc_msgSend(v4, "setAllowsPickingMultipleItems:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setShowsCloudItems:", 1);
  objc_msgSend(*(id *)(a1 + 32), "presentContent:", v4);

}

@end
