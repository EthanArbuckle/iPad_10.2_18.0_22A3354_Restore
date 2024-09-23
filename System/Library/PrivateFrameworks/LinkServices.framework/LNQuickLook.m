@implementation LNQuickLook

- (LNQuickLook)initWithItems:(id)a3
{
  id v5;
  LNQuickLook *v6;
  uint64_t v7;
  NSArray *items;
  uint64_t v9;
  NSMutableDictionary *editedPreviewItems;
  LNQuickLook *v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQuickLook.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

  }
  v14.receiver = self;
  v14.super_class = (Class)LNQuickLook;
  v6 = -[LNQuickLook init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "if_map:", &__block_literal_global_6799);
    v7 = objc_claimAutoreleasedReturnValue();
    items = v6->_items;
    v6->_items = (NSArray *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    editedPreviewItems = v6->_editedPreviewItems;
    v6->_editedPreviewItems = (NSMutableDictionary *)v9;

    v6->_editingMode = 0;
    v11 = v6;
  }

  return v6;
}

- (void)presentOverViewController:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  -[LNQuickLook setCompletionHandler:](self, "setCompletionHandler:", v7);
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v8 = (void *)getQLPreviewControllerClass_softClass;
  v21 = getQLPreviewControllerClass_softClass;
  if (!getQLPreviewControllerClass_softClass)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getQLPreviewControllerClass_block_invoke;
    v17[3] = &unk_1E45DDB30;
    v17[4] = &v18;
    __getQLPreviewControllerClass_block_invoke((uint64_t)v17);
    v8 = (void *)v19[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v18, 8);
  v10 = objc_alloc_init(v9);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setDataSource:", self);
  if (-[LNQuickLook editingMode](self, "editingMode"))
    objc_msgSend(v10, "setAppearanceActions:", 4);
  objc_msgSend(v10, "reloadData");
  objc_msgSend(v10, "setCurrentPreviewItemIndex:", 0);
  objc_msgSend(v10, "setModalPresentationStyle:", 2);
  -[LNQuickLook setPreviewController:](self, "setPreviewController:", v10);
  -[LNQuickLook setViewControllerForPresenting:](self, "setViewControllerForPresenting:", v6);
  v11 = v6;
  objc_msgSend(v11, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v11;
  if (v12)
  {
    v14 = v11;
    do
    {
      objc_msgSend(v14, "parentViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "parentViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v13;
    }
    while (v15);
  }
  objc_msgSend(v13, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityElementsHidden:", 1);

  objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  UIViewController *viewControllerForPresenting;
  void *v7;
  _QWORD v8[5];
  void (**v9)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[UIViewController presentedViewController](self->_viewControllerForPresenting, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    viewControllerForPresenting = self->_viewControllerForPresenting;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__LNQuickLook_cancelPresentationWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E45DD1E0;
    v8[4] = self;
    v9 = v4;
    -[UIViewController dismissViewControllerAnimated:completion:](viewControllerForPresenting, "dismissViewControllerAnimated:completion:", 1, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQuickLook finishWithError:](self, "finishWithError:", v7);

    v4[2](v4);
  }

}

- (void)finishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[LNQuickLook completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LNQuickLook completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNQuickLook editedItems](self, "editedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
  -[LNQuickLook setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  void *v3;
  int64_t v4;

  -[LNQuickLook items](self, "items", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;

  -[LNQuickLook items](self, "items", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  int64_t v4;

  v4 = -[LNQuickLook editingMode](self, "editingMode", a3, a4);
  if (v4 == 2)
    return 1;
  else
    return 2 * (v4 == 1);
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
  -[LNQuickLook editedPreviewItems](self, "editedPreviewItems");
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[LNQuickLook viewControllerForPresenting](self, "viewControllerForPresenting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    do
    {
      objc_msgSend(v4, "parentViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "parentViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v6;
    }
    while (v7);
  }
  else
  {
    v6 = v4;
  }
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityElementsHidden:", 0);

  objc_msgSend(v9, "setDataSource:", 0);
  -[LNQuickLook setPreviewController:](self, "setPreviewController:", 0);
  -[LNQuickLook finishWithError:](self, "finishWithError:", 0);

}

- (id)editedItems
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[LNQuickLook items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__LNQuickLook_editedItems__block_invoke;
  v6[3] = &unk_1E45DCF40;
  v6[4] = self;
  objc_msgSend(v3, "if_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)editingMode
{
  return self->_editingMode;
}

- (void)setEditingMode:(int64_t)a3
{
  self->_editingMode = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSMutableDictionary)editedPreviewItems
{
  return self->_editedPreviewItems;
}

- (void)setEditedPreviewItems:(id)a3
{
  objc_storeStrong((id *)&self->_editedPreviewItems, a3);
}

- (QLPreviewController)previewController
{
  return self->_previewController;
}

- (void)setPreviewController:(id)a3
{
  objc_storeStrong((id *)&self->_previewController, a3);
}

- (UIViewController)viewControllerForPresenting
{
  return self->_viewControllerForPresenting;
}

- (void)setViewControllerForPresenting:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerForPresenting, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerForPresenting, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_editedPreviewItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

id __26__LNQuickLook_editedItems__block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:", v8);
  return v9;
}

uint64_t __55__LNQuickLook_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithError:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __29__LNQuickLook_initWithItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "url");
}

@end
