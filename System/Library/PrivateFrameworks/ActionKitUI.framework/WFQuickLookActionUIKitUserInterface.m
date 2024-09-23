@implementation WFQuickLookActionUIKitUserInterface

- (void)showWithItems:(id)a3 fullScreen:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  BOOL v18;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFQuickLookActionUIKitUserInterface.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemsData"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFQuickLookActionUIKitUserInterface.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  -[WFQuickLookActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v11);
  v12 = (void *)MEMORY[0x24BDD1620];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke;
  v17[3] = &unk_24E3428A8;
  v17[4] = self;
  v18 = a4;
  v14 = (id)objc_msgSend(v12, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v9, v13, v17);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFQuickLookActionUIKitUserInterface setExitError:](self, "setExitError:", v5);

  v8[1] = 3221225472;
  v8[2] = __79__WFQuickLookActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v8[3] = &unk_24E343510;
  v9 = v4;
  v7.receiver = self;
  v7.super_class = (Class)WFQuickLookActionUIKitUserInterface;
  v8[0] = MEMORY[0x24BDAC760];
  v6 = v4;
  -[WFActionUserInterface cancelPresentationWithCompletionHandler:](&v7, sel_cancelPresentationWithCompletionHandler_, v8);

}

- (void)finishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WFQuickLookActionUIKitUserInterface completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFQuickLookActionUIKitUserInterface completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
  -[WFQuickLookActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)previewControllerDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[WFActionUserInterface viewControllerForPresenting](self, "viewControllerForPresenting");
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

  objc_msgSend(v10, "setDataSource:", 0);
  -[WFQuickLookActionUIKitUserInterface setDataSource:](self, "setDataSource:", 0);
  -[WFQuickLookActionUIKitUserInterface setPreviewController:](self, "setPreviewController:", 0);
  -[WFQuickLookActionUIKitUserInterface exitError](self, "exitError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFQuickLookActionUIKitUserInterface finishWithError:](self, "finishWithError:", v9);

}

- (BOOL)previewController:(id)a3 canShareItem:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  char v16;
  _BYTE v18[24];
  id v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v7 = objc_opt_class();
  v8 = v5;
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v18 = 136315906;
      *(_QWORD *)&v18[4] = "WFEnforceClass";
      *(_WORD *)&v18[12] = 2114;
      *(_QWORD *)&v18[14] = v8;
      *(_WORD *)&v18[22] = 2114;
      v19 = (id)objc_opt_class();
      LOWORD(v20) = 2114;
      *(_QWORD *)((char *)&v20 + 2) = v7;
      v11 = v19;
      _os_log_impl(&dword_21EB60000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", v18, 0x2Au);

    }
    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  objc_msgSend(v9, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributionSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "isContentManaged");

  if (v14)
    v15 = 2;
  else
    v15 = 1;
  v16 = objc_msgSend(v13, "isAllowedToBeSentToDestinationWithManagedLevel:", v15, *(_OWORD *)v18, *(_QWORD *)&v18[16], v19, v20);

  return v16;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (WFContentCollection)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (QLPreviewController)previewController
{
  return self->_previewController;
}

- (void)setPreviewController:(id)a3
{
  objc_storeStrong((id *)&self->_previewController, a3);
}

- (NSError)exitError
{
  return self->_exitError;
}

- (void)setExitError:(id)a3
{
  objc_storeStrong((id *)&self->_exitError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitError, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __79__WFQuickLookActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  char v9;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke_2;
  block[3] = &unk_24E343808;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = *(_BYTE *)(a1 + 40);
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  char v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke_3;
  v3[3] = &unk_24E3428A8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  return objc_msgSend(v1, "generatePreviewControllerDataSource:", v3);
}

void __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setDataSource:", v3);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke_4;
  v12[3] = &unk_24E342880;
  v12[4] = &v17;
  v12[5] = &v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);

  v5 = objc_alloc_init(MEMORY[0x24BEC2F30]);
  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", v6);

  objc_msgSend(v5, "setIsContentManaged:", v14[3] > v18[3]);
  objc_msgSend(v5, "setOverrideParentApplicationDisplayIdentifier:", *MEMORY[0x24BEC17D8]);
  objc_msgSend(v5, "reloadData");
  objc_msgSend(v5, "setCurrentPreviewItemIndex:", 0);
  objc_msgSend(v5, "setModalPresentationStyle:", 2 * (*(_BYTE *)(a1 + 40) == 0));
  objc_msgSend(*(id *)(a1 + 32), "setPreviewController:", v5);
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForPresenting");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  for (i = v7; ; i = (void *)v10)
  {
    objc_msgSend(i, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    objc_msgSend(i, "parentViewController");
    v10 = objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(i, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityElementsHidden:", 1);

  objc_msgSend(v7, "presentViewController:animated:completion:", v5, 1, 0);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

}

void __82__WFQuickLookActionUIKitUserInterface_showWithItems_fullScreen_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "attributionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToBeSentToDestinationWithManagedLevel:", 1);

  if (v4)
  {
    v5 = a1 + 32;
    v6 = v9;
LABEL_5:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24);
    goto LABEL_6;
  }
  objc_msgSend(v9, "attributionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAllowedToBeSentToDestinationWithManagedLevel:", 2);

  v6 = v9;
  if (v8)
  {
    v5 = a1 + 40;
    goto LABEL_5;
  }
LABEL_6:

}

@end
