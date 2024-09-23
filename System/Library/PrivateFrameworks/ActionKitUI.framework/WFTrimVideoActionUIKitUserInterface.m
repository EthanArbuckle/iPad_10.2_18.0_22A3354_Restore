@implementation WFTrimVideoActionUIKitUserInterface

- (id)copyFileToDealWithBadUIVideoEditorControllerSandboxHandling:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BE194F8];
  objc_msgSend(a3, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileWithURL:options:", v5, 13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTrimVideoActionUIKitUserInterface setCopiedFile:](self, "setCopiedFile:", v6);

  -[WFTrimVideoActionUIKitUserInterface copiedFile](self, "copiedFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)showWithVideo:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  WFTrimVideoActionUIKitUserInterface *v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTrimVideoActionUIKitUserInterface.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileRepresentation"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTrimVideoActionUIKitUserInterface.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[WFTrimVideoActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v9);
  v10 = -[WFTrimVideoActionUIKitUserInterface copyFileToDealWithBadUIVideoEditorControllerSandboxHandling:](self, "copyFileToDealWithBadUIVideoEditorControllerSandboxHandling:", v7);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__WFTrimVideoActionUIKitUserInterface_showWithVideo_completionHandler___block_invoke;
  block[3] = &unk_24E3439C0;
  v15 = v10;
  v16 = self;
  v11 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)dismissEditor:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, a4);
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFTrimVideoActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __79__WFTrimVideoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFTrimVideoActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFTrimVideoActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFTrimVideoActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFTrimVideoActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)videoEditorController:(id)a3 didSaveEditedVideoToPath:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WFTrimVideoActionUIKitUserInterface *v10;

  v6 = a3;
  v7 = a4;
  if (!-[WFTrimVideoActionUIKitUserInterface hasSaved](self, "hasSaved"))
  {
    -[WFTrimVideoActionUIKitUserInterface setHasSaved:](self, "setHasSaved:", 1);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __86__WFTrimVideoActionUIKitUserInterface_videoEditorController_didSaveEditedVideoToPath___block_invoke;
    v8[3] = &unk_24E3439C0;
    v9 = v7;
    v10 = self;
    -[WFTrimVideoActionUIKitUserInterface dismissEditor:completionHandler:](self, "dismissEditor:completionHandler:", v6, v8);

  }
}

- (void)videoEditorControllerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__WFTrimVideoActionUIKitUserInterface_videoEditorControllerDidCancel___block_invoke;
  v3[3] = &unk_24E343958;
  v3[4] = self;
  -[WFTrimVideoActionUIKitUserInterface dismissEditor:completionHandler:](self, "dismissEditor:completionHandler:", a3, v3);
}

- (void)videoEditorController:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__WFTrimVideoActionUIKitUserInterface_videoEditorController_didFailWithError___block_invoke;
  v8[3] = &unk_24E3439C0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[WFTrimVideoActionUIKitUserInterface dismissEditor:completionHandler:](self, "dismissEditor:completionHandler:", a3, v8);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFTrimVideoActionUIKitUserInterface finishWithResult:error:](self, "finishWithResult:error:", 0, v4);

}

- (WFFileRepresentation)copiedFile
{
  return self->_copiedFile;
}

- (void)setCopiedFile:(id)a3
{
  objc_storeStrong((id *)&self->_copiedFile, a3);
}

- (BOOL)hasSaved
{
  return self->_hasSaved;
}

- (void)setHasSaved:(BOOL)a3
{
  self->_hasSaved = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_copiedFile, 0);
}

uint64_t __78__WFTrimVideoActionUIKitUserInterface_videoEditorController_didFailWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

void __70__WFTrimVideoActionUIKitUserInterface_videoEditorControllerDidCancel___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithResult:error:", 0, v2);

}

void __86__WFTrimVideoActionUIKitUserInterface_videoEditorController_didSaveEditedVideoToPath___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc(MEMORY[0x24BDD17B8]);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "initWithURL:readonly:", v3, 1);

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v4, 0);
}

uint64_t __79__WFTrimVideoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__WFTrimVideoActionUIKitUserInterface_showWithVideo_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x24BEBDAF8]);
  objc_msgSend(v10, "setVideoPath:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v10, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setHasSaved:", 0);
  objc_msgSend(*(id *)(a1 + 40), "viewControllerForPresenting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setModalPresentationStyle:", 7);
  objc_msgSend(v10, "popoverPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceView:", v4);

  objc_msgSend(v2, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6 * 0.5;
  objc_msgSend(v2, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMargins");
  objc_msgSend(v3, "setSourceRect:", v7, v9, 0.0, 0.0);

  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "presentViewController:animated:completion:", v10, 1, 0);

}

@end
