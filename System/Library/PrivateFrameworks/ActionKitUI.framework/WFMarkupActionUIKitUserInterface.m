@implementation WFMarkupActionUIKitUserInterface

- (void)showWithPreviewItems:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMarkupActionUIKitUserInterface.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previewItems"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMarkupActionUIKitUserInterface.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "if_map:", &__block_literal_global_2715);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMarkupActionUIKitUserInterface setPreviewItems:](self, "setPreviewItems:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  -[WFMarkupActionUIKitUserInterface setEditedPreviewItems:](self, "setEditedPreviewItems:", v11);

  -[WFMarkupActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v9);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__WFMarkupActionUIKitUserInterface_showWithPreviewItems_completionHandler___block_invoke_2;
  block[3] = &unk_24E343958;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)finishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[WFMarkupActionUIKitUserInterface completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFMarkupActionUIKitUserInterface completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[WFMarkupActionUIKitUserInterface editedItems](self, "editedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
  -[WFMarkupActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFMarkupActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __76__WFMarkupActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFMarkupActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFMarkupActionUIKitUserInterface previewItems](self, "previewItems", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;

  -[WFMarkupActionUIKitUserInterface previewItems](self, "previewItems", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  return 2;
}

- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v7 = a4;
  v8 = a5;
  -[WFMarkupActionUIKitUserInterface editedPreviewItems](self, "editedPreviewItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v12;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_msgSend(v9, "setObject:forKey:", v8, v11);
}

- (void)previewControllerDidDismiss:(id)a3
{
  -[WFMarkupActionUIKitUserInterface finishWithError:](self, "finishWithError:", 0);
}

- (id)editedItems
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[WFMarkupActionUIKitUserInterface previewItems](self, "previewItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__WFMarkupActionUIKitUserInterface_editedItems__block_invoke;
  v6[3] = &unk_24E342E10;
  v6[4] = self;
  objc_msgSend(v3, "if_compactMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)previewItems
{
  return self->_previewItems;
}

- (void)setPreviewItems:(id)a3
{
  objc_storeStrong((id *)&self->_previewItems, a3);
}

- (NSMutableDictionary)editedPreviewItems
{
  return self->_editedPreviewItems;
}

- (void)setEditedPreviewItems:(id)a3
{
  objc_storeStrong((id *)&self->_editedPreviewItems, a3);
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
  objc_storeStrong((id *)&self->_editedPreviewItems, 0);
  objc_storeStrong((id *)&self->_previewItems, 0);
}

id __47__WFMarkupActionUIKitUserInterface_editedItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "editedPreviewItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v3, "previewItemURL");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17B8]), "initWithURL:", v8);
  return v9;
}

uint64_t __76__WFMarkupActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithError:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __75__WFMarkupActionUIKitUserInterface_showWithPreviewItems_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v2 = (void *)getQLPreviewControllerClass_softClass;
  v10 = getQLPreviewControllerClass_softClass;
  if (!getQLPreviewControllerClass_softClass)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getQLPreviewControllerClass_block_invoke;
    v6[3] = &unk_24E343A50;
    v6[4] = &v7;
    __getQLPreviewControllerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v7, 8);
  v4 = objc_alloc_init(v3);
  objc_msgSend(v4, "setDataSource:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setAppearanceActions:", 4);
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForPresenting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

uint64_t __75__WFMarkupActionUIKitUserInterface_showWithPreviewItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "url");
}

@end
