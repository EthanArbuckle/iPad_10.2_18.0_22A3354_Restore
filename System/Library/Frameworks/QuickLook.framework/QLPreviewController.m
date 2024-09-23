@implementation QLPreviewController

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  objc_super v13;

  v6 = a4;
  if (sel_print_ == a3 || sel__printDocument_ == a3)
  {
    -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shareableURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[QLPreviewController canPerformPrintForItem:atURL:](self, "canPerformPrintForItem:atURL:", v8, v9);
LABEL_10:
    v11 = v10;

    goto LABEL_11;
  }
  if (sel_export_ == a3)
  {
    -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shareableURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[QLPreviewController canPerformExportForItem:atURL:](self, "canPerformExportForItem:atURL:", v8, v9);
    goto LABEL_10;
  }
  v13.receiver = self;
  v13.super_class = (Class)QLPreviewController;
  v11 = -[QLPreviewController canPerformAction:withSender:](&v13, sel_canPerformAction_withSender_, a3, v6);
LABEL_11:

  return v11;
}

- (void)_printDocument:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__QLPreviewController_DocumentMenu___printDocument___block_invoke;
  v7[3] = &unk_24C724638;
  v6 = v5;
  v8 = v6;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "prepareShareableURL:", v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __52__QLPreviewController_DocumentMenu___printDocument___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject **v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "shareableURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v5 = *(id *)(a1 + 32);
    v6 = v2;
    QLRunInMainThread();

    objc_destroyWeak(&v7);
  }
  else
  {
    v3 = (NSObject **)MEMORY[0x24BE7BF48];
    v4 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_ERROR, "Could not get share URL to update document menu. This could lead to no button to dismiss. #AnyItemViewController", buf, 2u);
    }
  }

}

void __52__QLPreviewController_DocumentMenu___printDocument___block_invoke_92(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "printItem:atURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)export:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__QLPreviewController_DocumentMenu__export___block_invoke;
  v7[3] = &unk_24C724638;
  v6 = v5;
  v8 = v6;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "prepareShareableURL:", v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __44__QLPreviewController_DocumentMenu__export___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject **v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "shareableURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v5 = *(id *)(a1 + 32);
    v6 = v2;
    QLRunInMainThread();

    objc_destroyWeak(&v7);
  }
  else
  {
    v3 = (NSObject **)MEMORY[0x24BE7BF48];
    v4 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_ERROR, "Could not get share URL to update document menu. This could lead to no button to dismiss. #AnyItemViewController", buf, 2u);
    }
  }

}

void __44__QLPreviewController_DocumentMenu__export___block_invoke_94(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "exportItem:atURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_topNavigationItem
{
  void *v2;
  void *v3;

  -[QLPreviewController _topViewController](self, "_topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateTitleMenuAndDocumentProperties
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  if (_UIBarsDesktopNavigationBarEnabled())
  {
    -[QLPreviewController _topNavigationItem](self, "_topNavigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __73__QLPreviewController_DocumentMenu__updateTitleMenuAndDocumentProperties__block_invoke;
      v6[3] = &unk_24C724638;
      v5 = v4;
      v7 = v5;
      objc_copyWeak(&v8, &location);
      objc_msgSend(v5, "prepareShareableURL:", v6);
      objc_destroyWeak(&v8);

      objc_destroyWeak(&location);
    }
  }
}

void __73__QLPreviewController_DocumentMenu__updateTitleMenuAndDocumentProperties__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject **v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "shareableURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v5 = *(id *)(a1 + 32);
    v6 = v2;
    QLRunInMainThread();

    objc_destroyWeak(&v7);
  }
  else
  {
    v3 = (NSObject **)MEMORY[0x24BE7BF48];
    v4 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_ERROR, "Could not get share URL to update document menu. This could lead to no button to dismiss. #AnyItemViewController", buf, 2u);
    }
  }

}

void __73__QLPreviewController_DocumentMenu__updateTitleMenuAndDocumentProperties__block_invoke_95(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "updateTitleMenuWithItem:", *(_QWORD *)(a1 + 32));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "createDocumentPropertiesWithItem:shareableURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)updateTitleMenuWithItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke;
  v7[3] = &unk_24C7246B0;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  -[QLPreviewController _topNavigationItem](self, "_topNavigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleMenuProvider:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

id __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BEBD528];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke_2;
  v11[3] = &unk_24C724688;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v12 = *(id *)(a1 + 32);
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "elementWithProvider:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BEBD748];
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "menuWithChildren:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  return v9;
}

void __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke_3;
    v5[3] = &unk_24C724660;
    objc_copyWeak(&v9, a1 + 6);
    v8 = v3;
    v6 = a1[4];
    v7 = a1[5];
    objc_msgSend(WeakRetained, "saveEditsIfNecessary:", v5);

    objc_destroyWeak(&v9);
  }
  else
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, MEMORY[0x24BDBD1A8]);
  }

}

void __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke_3(id *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  objc_copyWeak(&v5, a1 + 7);
  v4 = a1[6];
  v2 = a1[4];
  v3 = a1[5];
  QLRunInMainThread();

  objc_destroyWeak(&v5);
}

void __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  NSObject **v10;
  NSObject *v11;
  uint8_t v12[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "saveURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "editedFileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_5;
    objc_msgSend(*(id *)(a1 + 32), "lastSavedEditedCopy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "editedCopy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "originalContentWasUpdated");

      if ((v7 & 1) != 0)
      {
LABEL_5:
        if (v3)
        {
LABEL_6:
          objc_msgSend(WeakRetained, "updateDocumentPropertiesMetadataForItem:withShareableURL:", *(_QWORD *)(a1 + 32), v3);
          objc_msgSend(WeakRetained, "titleMenuElementsForItem:atURL:withSuggestedActions:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 40));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          objc_msgSend(WeakRetained, "updateDocumentPropertiesActivityProviderWithShareableURL:", v3);
          objc_msgSend(WeakRetained, "updateDocumentPropertiesDragItemsProviderWithItem:shareableURL:", *(_QWORD *)(a1 + 32), v3);

LABEL_15:
          goto LABEL_16;
        }
LABEL_10:
        v10 = (NSObject **)MEMORY[0x24BE7BF48];
        v11 = *MEMORY[0x24BE7BF48];
        if (!*MEMORY[0x24BE7BF48])
        {
          QLSInitLogging();
          v11 = *v10;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_ERROR, "Could not get share URL to update document menu. This could lead to no button to dismiss. #AnyItemViewController", v12, 2u);
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_15;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "editedFileURL");
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
    if (v9)
      goto LABEL_6;
    goto LABEL_10;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_16:

}

- (void)createDocumentPropertiesWithItem:(id)a3 shareableURL:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x24BEBD568];
  v7 = a4;
  v8 = a3;
  v10 = (id)objc_msgSend([v6 alloc], "initWithURL:", v7);
  -[QLPreviewController _topNavigationItem](self, "_topNavigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDocumentProperties:", v10);

  -[QLPreviewController updateDocumentPropertiesActivityProviderWithShareableURL:](self, "updateDocumentPropertiesActivityProviderWithShareableURL:", v7);
  -[QLPreviewController updateDocumentPropertiesDragItemsProviderWithItem:shareableURL:](self, "updateDocumentPropertiesDragItemsProviderWithItem:shareableURL:", v8, v7);

}

- (void)updateDocumentPropertiesActivityProviderWithShareableURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __94__QLPreviewController_DocumentMenu__updateDocumentPropertiesActivityProviderWithShareableURL___block_invoke;
  v8[3] = &unk_24C7246D8;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  -[QLPreviewController _topNavigationItem](self, "_topNavigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActivityViewControllerProvider:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

id __94__QLPreviewController_DocumentMenu__updateDocumentPropertiesActivityProviderWithShareableURL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "previewCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentMenuActionWillBegin");

    objc_msgSend(v3, "activityControllerForURL:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateDocumentPropertiesDragItemsProviderWithItem:(id)a3 shareableURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v12 = MEMORY[0x24BDAC760];
  objc_copyWeak(&v15, &location);
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  -[QLPreviewController _topNavigationItem](self, "_topNavigationItem", v12, 3221225472, __100__QLPreviewController_DocumentMenu__updateDocumentPropertiesDragItemsProviderWithItem_shareableURL___block_invoke, &unk_24C724700);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "documentProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDragItemsProvider:", &v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

id __100__QLPreviewController_DocumentMenu__updateDocumentPropertiesDragItemsProviderWithItem_shareableURL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "itemProviderForItem:shareableURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD580]), "initWithItemProvider:", v4);
    objc_msgSend(v5, "setLocalObject:", *(_QWORD *)(a1 + 32));
    v8[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (void)updateDocumentPropertiesMetadataForItem:(id)a3 withShareableURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDDA890]);
  objc_msgSend(v6, "previewItemContentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setType:", v9);

  objc_msgSend(v6, "previewItemTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v10);

  objc_msgSend(v6, "fetcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemSize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSize:", objc_msgSend(v12, "unsignedIntegerValue"));

  v13 = objc_alloc_init(MEMORY[0x24BDDA8A0]);
  objc_msgSend(v13, "setType:", 0);
  v14 = objc_alloc(MEMORY[0x24BDDA898]);
  objc_msgSend(v6, "MIMEType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initByReferencingFileURL:MIMEType:properties:", v7, v15, v13);
  objc_msgSend(v8, "setThumbnail:", v16);

  v17 = objc_alloc(MEMORY[0x24BDE5EF0]);
  QLCGSizeFromQLItemThumbnailSize();
  v19 = v18;
  v21 = v20;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "scale");
  v24 = (void *)objc_msgSend(v17, "initWithFileAtURL:size:scale:representationTypes:", v7, -1, v19, v21, v23);

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDE5EF8], "sharedGenerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __94__QLPreviewController_DocumentMenu__updateDocumentPropertiesMetadataForItem_withShareableURL___block_invoke;
  v30[3] = &unk_24C724750;
  objc_copyWeak(&v32, &location);
  v26 = v13;
  v31 = v26;
  objc_msgSend(v25, "generateBestRepresentationForRequest:completionHandler:", v24, v30);

  v27 = objc_alloc_init(MEMORY[0x24BDDA8B0]);
  objc_msgSend(v27, "setOriginalURL:", v7);
  objc_msgSend(v27, "setSpecialization:", v8);
  -[QLPreviewController _topNavigationItem](self, "_topNavigationItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "documentProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setMetadata:", v27);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

void __94__QLPreviewController_DocumentMenu__updateDocumentPropertiesMetadataForItem_withShareableURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = v3;
    v6 = *(id *)(a1 + 32);
    QLRunInMainThread();

  }
}

void __94__QLPreviewController_DocumentMenu__updateDocumentPropertiesMetadataForItem_withShareableURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_topNavigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "copy");

  v5 = objc_alloc(MEMORY[0x24BDDA898]);
  objc_msgSend(*(id *)(a1 + 40), "UIImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPlatformImage:properties:", v6, *(_QWORD *)(a1 + 48));
  objc_msgSend(v11, "specialization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setThumbnail:", v7);

  objc_msgSend(*(id *)(a1 + 32), "_topNavigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMetadata:", v11);

}

- (id)titleMenuElementsForItem:(id)a3 atURL:(id)a4 withSuggestedActions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  QLPreviewController *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  QLPreviewController *v49;
  uint64_t v50;
  uint64_t v51;
  id obj;
  uint8_t buf[16];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = self;
  v46 = v9;
  v47 = v8;
  -[QLPreviewController saveToFilesActionForItem:atURL:](self, "saveToFilesActionForItem:atURL:", v8, v9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v12, "addObject:", v13);
  -[QLPreviewController saveToPhotosActionForItem:atURL:](self, "saveToPhotosActionForItem:atURL:", v8, v46);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v12, "addObject:", v14);
  -[QLPreviewController lockPDFActionForItem:atURL:](self, "lockPDFActionForItem:atURL:", v47, v46);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v12, "addObject:", v15);
  v41 = (void *)v15;
  v42 = (void *)v14;
  v43 = (void *)v13;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x24BEBD748], "menuWithTitle:image:identifier:options:children:", &stru_24C72A1F8, 0, 0, 1, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v16);

  }
  v44 = v12;
  v45 = v11;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(MEMORY[0x24BDD1488], "mainBundleSupportsPrintCommand");
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v10;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  v19 = v49;
  v20 = 0x24BEBD000uLL;
  if (v18)
  {
    v21 = v18;
    v22 = *(_QWORD *)v55;
    v51 = *MEMORY[0x24BEBE5C8];
    v50 = *MEMORY[0x24BEBE5A0];
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v55 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v23);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v26 = 0;
          goto LABEL_21;
        }
        v25 = v24;
        v26 = v25;
        if (!v25)
          goto LABEL_21;
        objc_msgSend(v25, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqual:", v51);

        if (v28)
        {
          if (-[QLPreviewController canPerformAction:withSender:](v19, "canPerformAction:withSender:", sel_print_, v19))
          {
            if (v48)
            {
              v29 = v17;
              v30 = v26;
              goto LABEL_22;
            }
            -[QLPreviewController printActionForItem:atURL:](v19, "printActionForItem:atURL:", v47, v46);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
              objc_msgSend(v17, "addObject:", v36);

          }
          else
          {
            v35 = *MEMORY[0x24BE7BF48];
            if (!*MEMORY[0x24BE7BF48])
            {
              QLSInitLogging();
              v35 = *MEMORY[0x24BE7BF48];
            }
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20D4F5000, v35, OS_LOG_TYPE_DEFAULT, "Print can be offered by a responder in the responder chain but QuickLook only shows its own #AnyItemViewController", buf, 2u);
            }
          }
        }
        else
        {
          objc_msgSend(v26, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v31, "isEqual:", v50) & 1) == 0)
          {

LABEL_21:
            v29 = v17;
            v30 = v24;
LABEL_22:
            objc_msgSend(v29, "addObject:", v30);
            goto LABEL_23;
          }
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "bundleIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.DocumentsApp"));

          if ((v34 & 1) != 0)
          {
            v19 = v49;
            v20 = 9863680000;
            goto LABEL_21;
          }
          v37 = *MEMORY[0x24BE7BF48];
          if (!*MEMORY[0x24BE7BF48])
          {
            QLSInitLogging();
            v37 = *MEMORY[0x24BE7BF48];
          }
          v19 = v49;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D4F5000, v37, OS_LOG_TYPE_DEFAULT, "QuickLook only shows document-related suggested items in its title menu when presented from Files #AnyItemViewController", buf, 2u);
          }
          v20 = 9863680000;
        }
LABEL_23:

        ++v23;
      }
      while (v21 != v23);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      v21 = v38;
    }
    while (v38);
  }

  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(*(id *)(v20 + 1864), "menuWithTitle:image:identifier:options:children:", &stru_24C72A1F8, 0, 0, 1, v17);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v39);

  }
  return v45;
}

- (void)presentError:(id)a3 forAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  objc_msgSend(a3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    QLLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v13 = v9;
  QLRunInMainThread();

}

void __60__QLPreviewController_DocumentMenu__presentError_forAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, *(_QWORD *)(a1 + 32), 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v2);
  objc_msgSend(v5, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredAction:", v4);

  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)handleShortcutsActionOutputFile:(id)a3 forAction:(id)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  QLRunInMainThread();

}

void __79__QLPreviewController_DocumentMenu__handleShortcutsActionOutputFile_forAction___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BEBD560]);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initForExportingURLs:asCopy:", v4, 1);

  objc_msgSend(v5, "_setIsContentManaged:", objc_msgSend(*(id *)(a1 + 40), "isContentManaged"));
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v5, 1, 0);

}

- (id)saveToFilesActionForItem:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;

  v6 = a3;
  v7 = a4;
  QLLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("folder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x24BEBD388];
  v11 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke;
  v24[3] = &unk_24C7247A0;
  objc_copyWeak(&v26, &location);
  v12 = v7;
  v25 = v12;
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v8, v9, 0, v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saveURL");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v12;
  v17 = v16;

  if (FPURLMightBeInFileProvider())
  {
    v18 = (void *)MEMORY[0x24BEBD528];
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke_2;
    v21[3] = &unk_24C724818;
    v22 = v17;
    v23 = v13;
    objc_msgSend(v18, "elementWithProvider:", v21);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = v13;
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v19;
}

void __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "previewCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentMenuActionWillBegin");

    v5 = objc_alloc(MEMORY[0x24BEBD560]);
    v8[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initForExportingURLs:asCopy:", v6, 1);

    objc_msgSend(v7, "_setIsContentManaged:", objc_msgSend(v3, "isContentManaged"));
    objc_msgSend(v3, "presentViewController:animated:completion:", v7, 1, 0);

  }
}

void __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke_3;
  v7[3] = &unk_24C7247F0;
  v9 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v4, "fetchItemForURL:completionHandler:", v5, v7);

}

void __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v6 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  QLRunInMainThread();

}

void __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke_4(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1[6];
  if (a1[4])
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(a1[6], MEMORY[0x24BDBD1A8]);
  }
  else
  {
    v3[0] = a1[5];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  }
}

- (void)exportItem:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject **v15;
  NSObject *v16;
  void *v17;
  NSObject **v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[6];
  id v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  id v45;
  __int128 buf;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE v51[128];
  _QWORD v52[4];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v35 = v6;
  if (objc_msgSend(v6, "previewItemType") == 2 && objc_msgSend(v6, "editingMode"))
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC13F8]), "initWithSurface:", 1);
    v8 = objc_alloc(MEMORY[0x24BEC1400]);
    v9 = (void *)MEMORY[0x24BDF8238];
    v33 = v7;
    objc_msgSend(v7, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "typeWithFilenameExtension:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "initWithFileURL:type:", v7, v11);

    v31 = (void *)v12;
    v52[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFiles:", v13);

    objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v14, "contextualActionsForContext:error:", v36, &v45);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v45;

    if (v34)
    {
      v15 = (NSObject **)MEMORY[0x24BE7BF48];
      v16 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v16 = *v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v34;
        _os_log_impl(&dword_20D4F5000, v16, OS_LOG_TYPE_DEFAULT, "Fetching contextual actions from Shortcuts failed with error: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      objc_msgSend(v17, "filteredContextualActions:forContext:byType:error:", v32, v36, 0, &v44);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v44;

      if (v34)
      {
        v18 = (NSObject **)MEMORY[0x24BE7BF48];
        v19 = *MEMORY[0x24BE7BF48];
        if (!*MEMORY[0x24BE7BF48])
        {
          QLSInitLogging();
          v19 = *v18;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v34;
          _os_log_impl(&dword_20D4F5000, v19, OS_LOG_TYPE_DEFAULT, "Filtering fetched contextual actions from Shortcuts failed with error: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v20 = v30;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v41;
          v23 = *MEMORY[0x24BEC1890];
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v41 != v22)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_msgSend(v25, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "isEqualToString:", v23);

              if (v27)
              {
                -[QLPreviewController previewCollection](self, "previewCollection");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "documentMenuActionWillBegin");

                objc_initWeak(&location, self);
                *(_QWORD *)&buf = 0;
                *((_QWORD *)&buf + 1) = &buf;
                v47 = 0x3032000000;
                v48 = __Block_byref_object_copy_;
                v49 = __Block_byref_object_dispose_;
                v50 = (id)objc_opt_new();
                v29 = *(void **)(*((_QWORD *)&buf + 1) + 40);
                if (v29)
                {
                  v37[0] = MEMORY[0x24BDAC760];
                  v37[1] = 3221225472;
                  v37[2] = __54__QLPreviewController_DocumentMenu__exportItem_atURL___block_invoke;
                  v37[3] = &unk_24C724840;
                  objc_copyWeak(&v38, &location);
                  v37[4] = v25;
                  v37[5] = &buf;
                  objc_msgSend(v29, "runAction:withContext:completionHandler:", v25, v36, v37);
                  objc_destroyWeak(&v38);
                }
                _Block_object_dispose(&buf, 8);

                objc_destroyWeak(&location);
              }
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
          }
          while (v21);
        }

      }
    }

    v7 = v33;
  }

}

void __54__QLPreviewController_DocumentMenu__exportItem_atURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)*MEMORY[0x24BDD0B88] && objc_msgSend(v6, "code") == 3072)
  {

  }
  else
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != (void *)*MEMORY[0x24BDD1100] || objc_msgSend(v6, "code") != -128;

    if (v6 && v9)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "presentError:forAction:", v6, *(_QWORD *)(a1 + 32));
      goto LABEL_17;
    }
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  WeakRetained = v5;
  v11 = objc_msgSend(WeakRetained, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(WeakRetained);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
        v16 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v16, "handleShortcutsActionOutputFile:forAction:", v15, *(_QWORD *)(a1 + 32), (_QWORD)v19);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(WeakRetained, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }
LABEL_17:

  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = 0;

}

- (BOOL)canPerformExportForItem:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject **v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  void *v22;
  NSObject **v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  char v32;
  void *v33;
  QLPreviewController *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  id v45;
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  _QWORD v49[4];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "previewItemType") == 2 && objc_msgSend(v6, "editingMode"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC13F8]), "initWithSurface:", 1);
    v9 = objc_alloc(MEMORY[0x24BEC1400]);
    v10 = (void *)MEMORY[0x24BDF8238];
    objc_msgSend(v7, "pathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "typeWithFilenameExtension:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithFileURL:type:", v7, v12);

    v49[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFiles:", v14);

    objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v15, "contextualActionsForContext:error:", v8, &v45);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v45;

    v39 = (void *)v16;
    if (v17)
    {
      v18 = (NSObject **)MEMORY[0x24BE7BF48];
      v19 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v19 = *v18;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v17;
        _os_log_impl(&dword_20D4F5000, v19, OS_LOG_TYPE_DEFAULT, "Fetching contextual actions from Shortcuts failed with error: %@ #AnyItemViewController", buf, 0xCu);
      }
      v20 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      objc_msgSend(v21, "filteredContextualActions:forContext:byType:error:", v16, v8, 0, &v44);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v44;

      v38 = v22;
      if (v17)
      {
        v23 = (NSObject **)MEMORY[0x24BE7BF48];
        v24 = *MEMORY[0x24BE7BF48];
        if (!*MEMORY[0x24BE7BF48])
        {
          QLSInitLogging();
          v24 = *v23;
        }
        v20 = 0;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v17;
          _os_log_impl(&dword_20D4F5000, v24, OS_LOG_TYPE_DEFAULT, "Filtering fetched contextual actions from Shortcuts failed with error: %@ #AnyItemViewController", buf, 0xCu);
          v20 = 0;
        }
      }
      else
      {
        v35 = self;
        v36 = v13;
        v37 = v8;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v25 = v22;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v41;
          v29 = *MEMORY[0x24BEC1890];
          while (2)
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v41 != v28)
                objc_enumerationMutation(v25);
              objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "isEqualToString:", v29);

              if ((v32 & 1) != 0)
              {
                -[QLPreviewController previewCollection](v35, "previewCollection");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "documentMenuActionWillBegin");

                v20 = 1;
                goto LABEL_25;
              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
            if (v27)
              continue;
            break;
          }
        }

        v20 = 0;
LABEL_25:
        v13 = v36;
        v8 = v37;
      }

    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)printActionForItem:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  char v20;
  id location;
  id v22;
  char v23;

  v6 = a3;
  v7 = a4;
  -[QLPreviewController printer](self, "printer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v22 = v8;
  v9 = -[QLPreviewController canPerformPrintForItem:customPrinter:shouldUseDefaultPrinter:](self, "canPerformPrintForItem:customPrinter:shouldUseDefaultPrinter:", v6, &v22, &v23);
  v10 = v22;

  if (v9)
  {
    QLLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("printer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x24BEBD388];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __62__QLPreviewController_DocumentMenu__printActionForItem_atURL___block_invoke;
    v16[3] = &unk_24C724868;
    objc_copyWeak(&v19, &location);
    v17 = v7;
    v18 = v10;
    v20 = v23;
    objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __62__QLPreviewController_DocumentMenu__printActionForItem_atURL___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "printItemAtURL:withCustomPrinter:shouldUseDefaultPrinter:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

}

- (BOOL)canPerformPrintForItem:(id)a3 atURL:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v9;
  char v10;

  v5 = a3;
  -[QLPreviewController printer](self, "printer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v9 = v6;
  LOBYTE(self) = -[QLPreviewController canPerformPrintForItem:customPrinter:shouldUseDefaultPrinter:](self, "canPerformPrintForItem:customPrinter:shouldUseDefaultPrinter:", v5, &v9, &v10);

  v7 = v9;
  return (char)self;
}

- (BOOL)canPerformPrintForItem:(id)a3 customPrinter:(id *)a4 shouldUseDefaultPrinter:(BOOL *)a5
{
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;

  objc_msgSend(a3, "previewItemContentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = 0;
  if ((objc_msgSend(v8, "conformsToType:", *MEMORY[0x24BDF8460]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDF6CE0], "printableUTIs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = objc_msgSend(v10, "containsObject:", v7);

    if (*a5 || *a4)
      v9 = 1;
  }

  return v9;
}

- (void)printItemAtURL:(id)a3 withCustomPrinter:(id)a4 shouldUseDefaultPrinter:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  QLPreviewPrinter *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  char v17;

  v8 = a3;
  v9 = a4;
  -[QLPreviewController previewCollection](self, "previewCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "documentMenuActionWillBegin");

  v11 = objc_alloc_init(MEMORY[0x24BDF6CE0]);
  objc_msgSend(v11, "setIsContentManaged:", -[QLPreviewController isContentManaged](self, "isContentManaged"));
  v12 = objc_msgSend(v8, "startAccessingSecurityScopedResource");
  objc_msgSend(v11, "setPrintingItem:", v8);
  if (v9 && !a5)
  {
    v13 = -[QLPreviewPrinter initWithPreviewPrinter:]([QLPreviewPrinter alloc], "initWithPreviewPrinter:", v9);
    objc_msgSend(v11, "setPrintPageRenderer:", v13);

  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __94__QLPreviewController_DocumentMenu__printItemAtURL_withCustomPrinter_shouldUseDefaultPrinter___block_invoke;
  v15[3] = &unk_24C724890;
  v17 = v12;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v11, "presentAnimated:completionHandler:", 1, v15);

}

uint64_t __94__QLPreviewController_DocumentMenu__printItemAtURL_withCustomPrinter_shouldUseDefaultPrinter___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "stopAccessingSecurityScopedResource");
  return result;
}

- (void)printItem:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  id v11;
  unsigned __int8 v12;

  v6 = a4;
  v7 = a3;
  -[QLPreviewController printer](self, "printer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v11 = v8;
  v9 = -[QLPreviewController canPerformPrintForItem:customPrinter:shouldUseDefaultPrinter:](self, "canPerformPrintForItem:customPrinter:shouldUseDefaultPrinter:", v7, &v11, &v12);

  v10 = v11;
  if (v9)
    -[QLPreviewController printItemAtURL:withCustomPrinter:shouldUseDefaultPrinter:](self, "printItemAtURL:withCustomPrinter:shouldUseDefaultPrinter:", v6, v10, v12);

}

- (id)activityControllerForURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDF67E0]);
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithActivityItems:applicationActivities:", v6, 0);

  objc_msgSend(v7, "setIsContentManaged:", -[QLPreviewController isContentManaged](self, "isContentManaged"));
  -[QLPreviewController excludedActivityTypesForCurrentPreviewItem](self, "excludedActivityTypesForCurrentPreviewItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExcludedActivityTypes:", v8);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__QLPreviewController_DocumentMenu__activityControllerForURL___block_invoke;
  v10[3] = &unk_24C7248B8;
  v10[4] = self;
  objc_msgSend(v7, "setCompletionWithItemsHandler:", v10);
  if (objc_msgSend(v4, "startAccessingSecurityScopedResource"))
    -[QLPreviewController setAccessedUrlForSharingController:](self, "setAccessedUrlForSharingController:", v4);

  return v7;
}

uint64_t __62__QLPreviewController_DocumentMenu__activityControllerForURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shareSheetDidDismiss");
}

- (id)lockPDFActionForItem:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "previewItemType") == 11)
  {
    QLLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("lock"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x24BEBD528];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke;
    v15[3] = &unk_24C724688;
    objc_copyWeak(&v18, &location);
    v11 = v8;
    v16 = v11;
    v12 = v9;
    v17 = v12;
    objc_msgSend(v10, "elementWithProvider:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "previewCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke_2;
  v7[3] = &unk_24C724930;
  v8 = a1[4];
  v9 = a1[5];
  objc_copyWeak(&v11, a1 + 6);
  v6 = v3;
  v10 = v6;
  objc_msgSend(v5, "shouldDisplayLockActivityWithCompletionHandler:", v7);

  objc_destroyWeak(&v11);
}

void __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke_2(id *a1, char a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;

  v7 = a2;
  v3 = a1[4];
  v4 = a1[5];
  objc_copyWeak(&v6, a1 + 7);
  v5 = a1[6];
  QLRunInMainThread();

  objc_destroyWeak(&v6);
}

void __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (void *)MEMORY[0x24BEBD388];
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke_4;
    v8[3] = &unk_24C7248E0;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    objc_destroyWeak(&v9);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), MEMORY[0x24BDBD1A8]);
  }
}

void __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "previewCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentMenuActionWillBegin");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "previewCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestLockForCurrentItem");

}

- (id)saveToPhotosActionForItem:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  QLPreviewController *v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "previewItemType") != 2
    && objc_msgSend(v6, "previewItemType") != 3
    && objc_msgSend(v6, "previewItemType") != 1)
  {
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "previewItemType") == 1)
  {
    objc_msgSend(v6, "previewItemContentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    if ((objc_msgSend(v9, "conformsToType:", *MEMORY[0x24BDF82D0]) & 1) != 0)
    {

LABEL_16:
      v16 = 0;
      goto LABEL_17;
    }
    v10 = objc_msgSend(v9, "conformsToType:", *MEMORY[0x24BDF8460]);

    if ((v10 & 1) != 0)
      goto LABEL_16;
  }
  -[QLPreviewController previewCollection](self, "previewCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isRemote");

  if (!v12)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("square.and.arrow.down"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "previewItemType") == 2
    || objc_msgSend(v6, "previewItemType") == 3
    || objc_msgSend(v6, "previewItemType") == 1)
  {
    QLLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_initWeak(&location, self);
  v15 = (void *)MEMORY[0x24BEBD388];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __69__QLPreviewController_DocumentMenu__saveToPhotosActionForItem_atURL___block_invoke;
  v18[3] = &unk_24C724980;
  objc_copyWeak(&v22, &location);
  v19 = v7;
  v20 = self;
  v21 = v6;
  objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v14, v13, 0, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

LABEL_17:
  return v16;
}

void __69__QLPreviewController_DocumentMenu__saveToPhotosActionForItem_atURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "previewCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentMenuActionWillBegin");

    objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", *(_QWORD *)(a1 + 32), 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "previewCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 48), "previewItemType");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __69__QLPreviewController_DocumentMenu__saveToPhotosActionForItem_atURL___block_invoke_2;
    v10[3] = &unk_24C724958;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v8, "saveIntoPhotoLibraryMediaWithURLWrapper:previewItemType:completionHandler:", v7, v9, v10);

    objc_destroyWeak(&v12);
  }

}

void __69__QLPreviewController_DocumentMenu__saveToPhotosActionForItem_atURL___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject **v6;
  NSObject *v7;
  id WeakRetained;
  uint8_t v9[16];

  v5 = a3;
  if (a2)
  {
    v6 = (NSObject **)MEMORY[0x24BE7BF48];
    v7 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_DEFAULT, "Saved item to photos #AnyItemViewController", v9, 2u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "presentSaveToPhotoError:forItem:", v5, *(_QWORD *)(a1 + 32));

  }
}

- (void)presentSaveToPhotoError:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (NSObject **)MEMORY[0x24BE7BF48];
  v9 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    objc_msgSend(v6, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v11;
    _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_ERROR, "Error saving item to photos: %@ #AnyItemViewController", buf, 0xCu);

  }
  if (objc_msgSend(v7, "previewItemType") == 2
    || objc_msgSend(v7, "previewItemType") == 3
    || objc_msgSend(v7, "previewItemType") == 1)
  {
    QLLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Error"), v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BEBD3A8];
  QLLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __69__QLPreviewController_DocumentMenu__presentSaveToPhotoError_forItem___block_invoke;
  v18[3] = &unk_24C7249A8;
  v18[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v16);

  v17 = v13;
  QLRunInMainThread();

}

uint64_t __69__QLPreviewController_DocumentMenu__presentSaveToPhotoError_forItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __69__QLPreviewController_DocumentMenu__presentSaveToPhotoError_forItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (id)excludedActivityTypesForCurrentPreviewItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BE7BF88];
  -[QLPreviewController currentPreviewItem](self, "currentPreviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemWithPreviewItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "previewItemType") == 3)
    objc_msgSend(v3, "addObject:", *MEMORY[0x24BDF74E0]);
  -[QLPreviewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "excludedActivityTypesForPreviewController:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v10);

  }
  objc_msgSend(v3, "addObject:", *MEMORY[0x24BDF7490]);
  objc_msgSend(v3, "addObject:", *MEMORY[0x24BDF74E8]);

  return v3;
}

- (id)printInfoForDocumentInteractionController:(id)a3
{
  void *v3;
  void *v4;

  -[QLPreviewController currentItemProvider](self, "currentItemProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)activityItemForDocumentInteractionController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  QLPreviewPrinter *v16;
  void *v17;
  QLPreviewPrinter *v18;
  void *v19;

  v4 = a3;
  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "previewItemType");

  if (v6 == 3)
  {
    gotLoadHelper_x8__OBJC_CLASS___PUVideoComplementItemSource(v7);
    v9 = objc_alloc(*(Class *)(v8 + 3488));
    objc_msgSend(v4, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithVideoComplementBundleAtURL:", v10);

  }
  else
  {
    -[QLPreviewController currentItemProvider](self, "currentItemProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = (void *)objc_opt_new();
      -[QLPreviewController setCurrentItemProvider:](self, "setCurrentItemProvider:", v13);

    }
    -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController currentItemProvider](self, "currentItemProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActivityPreviewItem:", v14);

    v16 = [QLPreviewPrinter alloc];
    -[QLPreviewController printer](self, "printer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[QLPreviewPrinter initWithPreviewPrinter:](v16, "initWithPreviewPrinter:", v17);
    -[QLPreviewController currentItemProvider](self, "currentItemProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPrinter:", v18);

    -[QLPreviewController currentItemProvider](self, "currentItemProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)additionalActivitiesForDocumentInteractionController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_opt_new();
  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "previewItemType");

  if (v6 == 3)
  {
    gotLoadHelper_x8__OBJC_CLASS___PUUISaveToCameraRollActivity(v7);
    v8 = (void *)objc_opt_new();
    objc_msgSend(v4, "addObject:", v8);

  }
  -[QLPreviewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "additionalActivitiesTypesForPreviewController:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v12);

  }
  return v4;
}

- (id)activityItemsConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editedFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "lastSavedEditedCopy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "editedCopy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = objc_msgSend(v3, "originalContentWasUpdated");

      if ((v8 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
    objc_msgSend(v3, "editedFileURL");
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
LABEL_7:
  -[QLPreviewController itemProviderForItem:shareableURL:](self, "itemProviderForItem:shareableURL:", v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BEBD3A0]);
  v19[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithItemProviders:", v12);

  -[QLPreviewController title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__QLPreviewController_Activity__activityItemsConfiguration__block_invoke;
  v17[3] = &unk_24C724A10;
  v18 = v14;
  v15 = v14;
  objc_msgSend(v13, "setMetadataProvider:", v17);

  return v13;
}

id __59__QLPreviewController_Activity__activityItemsConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  if (objc_msgSend(a2, "isEqual:", *MEMORY[0x24BEBDF68]))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDDA8B0]);
    objc_msgSend(v3, "setTitle:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v3 = *(id *)(a1 + 32);
  }
  return v3;
}

- (id)itemProviderForItem:(id)a3 shareableURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  id v31;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDD15F0]);
  objc_msgSend(v6, "previewItemTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSuggestedName:", v9);

  objc_msgSend(v6, "fetcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shareableItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "previewItemContentType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  objc_initWeak(location, self);
  v14 = MEMORY[0x24BDAC760];
  if (v7)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke;
    aBlock[3] = &unk_24C724A60;
    objc_copyWeak(&v31, location);
    v15 = v6;
    v29 = v15;
    v16 = v7;
    v30 = v16;
    v17 = _Block_copy(aBlock);
    if (v13)
    {
      objc_msgSend(v8, "registerFileRepresentationForContentType:visibility:openInPlace:loadHandler:", v13, 0, 1, v17);
    }
    else if (v12)
    {
      objc_msgSend(v8, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v12, 1, 0, v17);
    }
    else
    {
      v20 = objc_opt_class();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_3;
      v24[3] = &unk_24C724A88;
      objc_copyWeak(&v27, location);
      v25 = v15;
      v26 = v16;
      objc_msgSend(v8, "registerObjectOfClass:visibility:loadHandler:", v20, 0, v24);

      objc_destroyWeak(&v27);
    }

    objc_destroyWeak(&v31);
    v14 = MEMORY[0x24BDAC760];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_5;
    v21[3] = &unk_24C724AB0;
    objc_copyWeak(&v23, location);
    v22 = v6;
    v18 = _Block_copy(v21);
    if (v13)
    {
      objc_msgSend(v8, "registerDataRepresentationForContentType:visibility:loadHandler:", v13, 0, v18);
    }
    else if (v12)
    {
      objc_msgSend(v8, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v12, 0, v18);
    }

    objc_destroyWeak(&v23);
  }
  objc_destroyWeak(location);

  return v8;
}

uint64_t __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "internalCurrentPreviewItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      v11 = objc_loadWeakRetained((id *)(a1 + 48));
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_2;
      v13[3] = &unk_24C724A38;
      v14 = v3;
      objc_msgSend(v11, "shareableURLForCurrentPreviewItem:", v13);

    }
    else
    {
      (*((void (**)(id, _QWORD, uint64_t, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), 1, 0);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0BA0];
    v16[0] = CFSTR("QLPreviewController not available anymore.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLPreviewController"), 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, void *))v3 + 2))(v3, 0, 0, v10);
  }

  return 0;
}

uint64_t __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "internalCurrentPreviewItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      v11 = objc_loadWeakRetained((id *)(a1 + 48));
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_4;
      v13[3] = &unk_24C724A38;
      v14 = v3;
      objc_msgSend(v11, "shareableURLForCurrentPreviewItem:", v13);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), 0);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0BA0];
    v16[0] = CFSTR("QLPreviewController not available anymore.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLPreviewController"), 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v3 + 2))(v3, 0, v10);
  }

  return 0;
}

uint64_t __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_5(uint64_t a1, void *a2)
{
  id *v3;
  void (**v4)(id, void *, _QWORD);
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "fetcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shareableItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7, 0);

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0BA0];
    v12[0] = CFSTR("QLPreviewController not available anymore.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLPreviewController"), 0, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *, void *))v4)[2](v4, 0, v6);
  }

  return 0;
}

- (QLPreviewController)initWithPreviewItems:(id)a3
{
  id v4;
  QLPreviewController *v5;
  QLPreviewItemStore *v6;
  QLPreviewItemStore *previewItemStore;
  QLPreviewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLPreviewController;
  v5 = -[QLPreviewController init](&v10, sel_init);
  if (v5)
  {
    v6 = -[QLPreviewItemStore initWithPreviewItems:]([QLPreviewItemStore alloc], "initWithPreviewItems:", v4);
    previewItemStore = v5->_previewItemStore;
    v5->_previewItemStore = v6;

    -[QLPreviewItemStore setDelegate:](v5->_previewItemStore, "setDelegate:", v5);
    -[QLPreviewController setDataSource:](v5, "setDataSource:", v5->_previewItemStore);
    v8 = v5;
  }

  return v5;
}

+ (QLPreviewController)controllerWithItemStore:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = (void *)v4[164];
  v4[164] = v3;
  v6 = v3;

  objc_msgSend(v4, "setDataSource:", v6);
  return (QLPreviewController *)v4;
}

- (QLPreviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  QLPreviewController *v4;
  QLPreviewController *v5;
  uint64_t v6;
  QLToolbarController *toolbarController;
  uint64_t v8;
  QLPreviewItemStore *previewItemStore;
  id v10;
  uint64_t v11;
  UIColor *backgroundColor;
  uint64_t v13;
  UIColor *fullscreenBackgroundColor;
  QLPreviewController *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)QLPreviewController;
  v4 = -[QLPreviewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_currentPreviewItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[QLPreviewController setAutomaticallyAdjustsScrollViewInsets:](v4, "setAutomaticallyAdjustsScrollViewInsets:", 0);
    v5->_presentationMode = 0;
    v5->_willTransitionToInternalView = 0;
    -[QLPreviewController setAllowInteractiveTransitions:](v5, "setAllowInteractiveTransitions:", 1);
    v5->_changingCurrentPreview = 0;
    v6 = objc_opt_new();
    toolbarController = v5->_toolbarController;
    v5->_toolbarController = (QLToolbarController *)v6;

    v8 = objc_opt_new();
    previewItemStore = v5->_previewItemStore;
    v5->_previewItemStore = (QLPreviewItemStore *)v8;

    -[QLPreviewItemStore setItemProvider:](v5->_previewItemStore, "setItemProvider:", v5);
    -[QLPreviewItemStore setDelegate:](v5->_previewItemStore, "setDelegate:", v5);
    -[QLPreviewController setModalPresentationCapturesStatusBarAppearance:](v5, "setModalPresentationCapturesStatusBarAppearance:", 1);
    v10 = (id)objc_msgSend(MEMORY[0x24BE7BED0], "sharedManager");
    v5->_whitePointAdaptivityStyle = 0;
    v5->_canChangeCurrentPage = 1;
    v5->_canShowToolbar = 1;
    v5->_canShowNavBar = 1;
    v5->_deferredSetIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v11 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v11;

    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v13 = objc_claimAutoreleasedReturnValue();
    fullscreenBackgroundColor = v5->_fullscreenBackgroundColor;
    v5->_fullscreenBackgroundColor = (UIColor *)v13;

    -[QLPreviewController _registerForApplicationStateChangesNotifications](v5, "_registerForApplicationStateChangesNotifications");
    v15 = v5;
  }

  return v5;
}

- (void)loadView
{
  id v3;

  v3 = (id)objc_opt_new();
  -[QLPreviewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)QLPreviewController;
  -[QLPreviewController viewDidLoad](&v10, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[QLPreviewController setTransitioningDelegate:](self, "setTransitioningDelegate:", self);
  -[QLPreviewController toggleChromelessIfNeeded](self, "toggleChromelessIfNeeded");
  objc_initWeak(&location, self);
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__QLPreviewController_viewDidLoad__block_invoke;
  v7[3] = &unk_24C724AD8;
  objc_copyWeak(&v8, &location);
  v6 = (id)-[QLPreviewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v5, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __34__QLPreviewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateNavigationBarBehaviorStyle");

}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = -[QLPreviewController parentIsNavigationController](self, "parentIsNavigationController");
    v4 = v10;
    if (v5)
    {
      -[QLPreviewController _savePreviousNavigationVCState](self, "_savePreviousNavigationVCState");
      -[QLPreviewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "windowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "statusBarManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewController setPreviousStatusBarHidden:](self, "setPreviousStatusBarHidden:", objc_msgSend(v9, "isStatusBarHidden"));

      v4 = v10;
    }
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[5];
  _QWORD v33[5];

  v3 = a3;
  self->_viewWillAppearPerformed = 0;
  -[QLPreviewController presentationController](self, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[QLPreviewController presentationController](self, "presentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

  }
  -[QLPreviewController setQuickLookVisibility:animated:](self, "setQuickLookVisibility:animated:", 3, v3);
  -[QLPreviewController originalLeftBarButtonItems](self, "originalLeftBarButtonItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[QLPreviewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leftBarButtonItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    v12 = (void *)v11;
    if (v11)
      v13 = v11;
    else
      v13 = MEMORY[0x24BDBD1A8];
    -[QLPreviewController setOriginalLeftBarButtonItems:](self, "setOriginalLeftBarButtonItems:", v13);

  }
  -[QLPreviewController originalRightBarButtonItems](self, "originalRightBarButtonItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[QLPreviewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rightBarButtonItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    v18 = (void *)v17;
    if (v17)
      v19 = v17;
    else
      v19 = MEMORY[0x24BDBD1A8];
    -[QLPreviewController setOriginalRightBarButtonItems:](self, "setOriginalRightBarButtonItems:", v19);

  }
  -[QLPreviewController _reloadDataIfNeeded](self, "_reloadDataIfNeeded");
  v20 = -[QLPreviewController _computePresentationMode](self, "_computePresentationMode");
  if (v20 == 1)
  {
    -[QLPreviewController navigationController](self, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "navigationBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTranslucent:", 1);

  }
  -[QLPreviewController _setPresentationMode:](self, "_setPresentationMode:", v20);
  self->_enqueuedWhitePointAdaptivityStyle = self->_whitePointAdaptivityStyle;
  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  self->_whitePointAdaptivityStyle = objc_msgSend(v23, "defaultWhitePointAdaptivityStyle");

  v32[4] = self;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __38__QLPreviewController_viewWillAppear___block_invoke;
  v33[3] = &unk_24C724B00;
  v33[4] = self;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __38__QLPreviewController_viewWillAppear___block_invoke_2;
  v32[3] = &unk_24C724B28;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v33, v32, 0.5);
  -[QLPreviewController _presentPreviewCollection](self, "_presentPreviewCollection");
  -[QLPreviewController traitCollection](self, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[QLPreviewController _isToolbarVisibleForTraitCollection:](self, "_isToolbarVisibleForTraitCollection:", v24))
  {

  }
  else
  {
    -[QLPreviewController toolbarController](self, "toolbarController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isHidden");

    if ((v26 & 1) != 0)
      goto LABEL_19;
  }
  -[QLPreviewController internalNavigationController](self, "internalNavigationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "toolbar");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLToolbarController setOriginalToolbar:](self->_toolbarController, "setOriginalToolbar:", v28);

LABEL_19:
  -[QLPreviewController currentPreviewItem](self, "currentPreviewItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    -[QLPreviewController previewItemAtIndex:wasUpdatedWithLifecycleState:withError:](self, "previewItemAtIndex:wasUpdatedWithLifecycleState:withError:", self->_currentPreviewItemIndex, 2, 0);
  self->_overlayHidden = self->_fullScreen;
  -[QLPreviewController traitCollection](self, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController updateOverlayAnimated:animatedButtons:forceRefresh:withTraitCollection:](self, "updateOverlayAnimated:animatedButtons:forceRefresh:withTraitCollection:", 0, v3, 1, v30);

  -[QLPreviewController _updateBackgroundColor](self, "_updateBackgroundColor");
  -[QLPreviewController showNoDataViewIfNeeded](self, "showNoDataViewIfNeeded");
  -[QLPreviewController _updateToolbarSuperview](self, "_updateToolbarSuperview");
  self->_viewWillAppearPerformed = 1;
  v31.receiver = self;
  v31.super_class = (Class)QLPreviewController;
  -[QLPreviewController viewWillAppear:](&v31, sel_viewWillAppear_, v3);
}

uint64_t __38__QLPreviewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsWhitePointAdaptivityStyleUpdate");
}

_QWORD *__38__QLPreviewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[128] != result[127])
    return (_QWORD *)objc_msgSend(result, "_setPreferredWhitePointAdaptivityStyle:");
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  QLPreviewController *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject **v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UITapGestureRecognizer *v20;
  UITapGestureRecognizer *multiTapDebugGestureRecognizer;
  void *v22;
  void *v23;
  uint8_t v24[16];
  objc_super v25;

  v3 = a3;
  if (-[QLPreviewController presentationMode](self, "presentationMode") == 3)
  {
    -[QLPreviewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v7 = (QLPreviewController *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[QLPreviewController _setPresentationMode:](self, "_setPresentationMode:", 2);
  }
  if (self->_willTransitionToInternalView)
  {
    self->_willTransitionToInternalView = 0;
  }
  else if (-[QLPreviewController presentationMode](self, "presentationMode") == 1
         && !-[QLPreviewController fullScreen](self, "fullScreen"))
  {
    -[QLPreviewController previousNavigationVCState](self, "previousNavigationVCState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "toolBarHidden");

    if (v9)
    {
      -[QLPreviewController internalNavigationController](self, "internalNavigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "toolbar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_removeAllAnimations:", 1);

    }
  }
  -[QLPreviewController setQuickLookVisibility:animated:](self, "setQuickLookVisibility:animated:", 2, v3);
  -[QLPreviewController _notifyFirstAppearanceIfNeeded](self, "_notifyFirstAppearanceIfNeeded");
  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    -[QLPreviewController previewItemAtIndex:wasUpdatedWithLifecycleState:withError:](self, "previewItemAtIndex:wasUpdatedWithLifecycleState:withError:", self->_currentPreviewItemIndex, 3, 0);
  v25.receiver = self;
  v25.super_class = (Class)QLPreviewController;
  -[QLPreviewController viewDidAppear:](&v25, sel_viewDidAppear_, v3);
  -[QLPreviewController setCurrentAnimator:](self, "setCurrentAnimator:", 0);
  -[QLPreviewController _updateAppearance:](self, "_updateAppearance:", 0);
  v13 = (NSObject **)MEMORY[0x24BE7BF48];
  v14 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v14 = *v13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_20D4F5000, v14, OS_LOG_TYPE_DEBUG, "Setting currentAnimator to nil from viewDidAppear #AppearanceTransition", v24, 2u);
  }
  -[QLToolbarController originalToolbar](self->_toolbarController, "originalToolbar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController internalNavigationController](self, "internalNavigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "toolbar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != v17)
  {
    -[QLPreviewController internalNavigationController](self, "internalNavigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "toolbar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLToolbarController setOriginalToolbar:](self->_toolbarController, "setOriginalToolbar:", v19);

  }
  -[QLPreviewController _updateToolbarSuperview](self, "_updateToolbarSuperview");
  -[QLPreviewController registerForScreenshotService](self, "registerForScreenshotService");
  if (os_variant_has_internal_diagnostics())
  {
    v20 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__toggleDebugView);
    multiTapDebugGestureRecognizer = self->_multiTapDebugGestureRecognizer;
    self->_multiTapDebugGestureRecognizer = v20;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_multiTapDebugGestureRecognizer, "setNumberOfTapsRequired:", 4);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_multiTapDebugGestureRecognizer, "setNumberOfTouchesRequired:", 2);
    -[UITapGestureRecognizer setDelegate:](self->_multiTapDebugGestureRecognizer, "setDelegate:", self);
    -[UINavigationController navigationBar](self->_internalNavigationController, "navigationBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addGestureRecognizer:", self->_multiTapDebugGestureRecognizer);

  }
  -[QLPreviewController transitionSourceView](self, "transitionSourceView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeFromSuperview");

  -[QLPreviewController setTransitionSourceView:](self, "setTransitionSourceView:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  QLPreviewCollectionProtocol *previewCollection;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  char v20;
  dispatch_time_t v21;
  void *v22;
  objc_super v23;
  _QWORD block[5];
  _QWORD v25[5];

  v3 = a3;
  if (-[QLPreviewController presentationMode](self, "presentationMode") == 1
    && !-[QLPreviewController didTransitionFromInternalView](self, "didTransitionFromInternalView")
    && -[QLPreviewController currentPreviewHasUnsavedEdits](self, "currentPreviewHasUnsavedEdits"))
  {
    previewCollection = self->_previewCollection;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __41__QLPreviewController_viewWillDisappear___block_invoke;
    v25[3] = &unk_24C724B50;
    v25[4] = self;
    -[QLPreviewCollectionProtocol saveCurrentPreviewEditsSynchronously:withCompletionHandler:](previewCollection, "saveCurrentPreviewEditsSynchronously:withCompletionHandler:", 1, v25);
  }
  v6 = -[QLPreviewController didTransitionFromInternalView](self, "didTransitionFromInternalView");
  -[QLPreviewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 | !-[QLPreviewController _isToolbarVisibleForTraitCollection:](self, "_isToolbarVisibleForTraitCollection:", v7);

  if (-[QLPreviewController presentationMode](self, "presentationMode") == 1)
  {
    -[QLPreviewController transitionCoordinator](self, "transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 | objc_msgSend(v9, "isCancelled");

    if ((v10 & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (v8)
  {
LABEL_9:
    -[QLPreviewController toolbarController](self, "toolbarController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "restoreOriginalToolbar");

  }
LABEL_10:
  if (-[QLPreviewController parentIsNavigationController](self, "parentIsNavigationController")
    && !-[QLPreviewController willTransitionToInternalView](self, "willTransitionToInternalView"))
  {
    v12 = -[QLNavigationState translucentNavigationBar](self->_previousNavigationVCState, "translucentNavigationBar");
    -[QLPreviewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslucent:", v12);

    v15 = -[QLNavigationState navigationBarHidden](self->_previousNavigationVCState, "navigationBarHidden");
    -[QLPreviewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNavigationBarHidden:", v15);

    v17 = -[QLNavigationState toolBarHidden](self->_previousNavigationVCState, "toolBarHidden");
    -[QLPreviewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setToolbarHidden:", v17);

  }
  if (!-[QLPreviewController willTransitionToInternalView](self, "willTransitionToInternalView"))
  {
    if (-[QLPreviewController _isBeingFullyDismissed](self, "_isBeingFullyDismissed"))
    {
      -[QLPreviewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        if (-[QLPreviewController presentationMode](self, "presentationMode") == 4)
        {
          v21 = dispatch_time(0, 100000000);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __41__QLPreviewController_viewWillDisappear___block_invoke_2;
          block[3] = &unk_24C724B00;
          block[4] = self;
          dispatch_after(v21, MEMORY[0x24BDAC9B8], block);
        }
        else
        {
          -[QLPreviewController delegate](self, "delegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "previewControllerWillDismiss:", self);

        }
      }
    }
  }
  -[QLPreviewController setQuickLookVisibility:animated:](self, "setQuickLookVisibility:animated:", 1, v3);
  -[QLPreviewController updateStatusBarAnimated:](self, "updateStatusBarAnimated:", 0);
  -[QLPreviewController unregisterFromScreenshotService](self, "unregisterFromScreenshotService");
  v23.receiver = self;
  v23.super_class = (Class)QLPreviewController;
  -[QLPreviewController viewWillDisappear:](&v23, sel_viewWillDisappear_, v3);
}

uint64_t __41__QLPreviewController_viewWillDisappear___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEditCopyOfPreviewItemAtIndex:editedCopy:", a2, a3);
}

void __41__QLPreviewController_viewWillDisappear___block_invoke_2(uint64_t a1)
{
  id v2;

  if (!objc_msgSend(*(id *)(a1 + 32), "quickLookVisibility")
    || objc_msgSend(*(id *)(a1 + 32), "quickLookVisibility") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "previewControllerWillDismiss:", *(_QWORD *)(a1 + 32));

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  QLNavigationState *previousNavigationVCState;
  void *v19;
  char v20;
  dispatch_time_t v21;
  void *v22;
  NSObject **v23;
  NSObject *v24;
  void *v25;
  objc_super v26;
  uint8_t buf[16];
  _QWORD block[5];
  _QWORD v29[5];

  v3 = a3;
  self->_didSetDefaultFullscreenState = 0;
  self->_didStartDelayingPresentation = 0;
  self->_didEndDelayingPresentation = 0;
  self->_fullScreen = 0;
  -[QLPreviewController setQuickLookVisibility:animated:](self, "setQuickLookVisibility:animated:", 0, a3);
  -[QLPreviewController currentPreviewItem](self, "currentPreviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[QLPreviewController previewItemAtIndex:wasUpdatedWithLifecycleState:withError:](self, "previewItemAtIndex:wasUpdatedWithLifecycleState:withError:", self->_currentPreviewItemIndex, 4, 0);
  -[QLPreviewController currentAnimator](self, "currentAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "transitionWasCancelled");

  if (v8)
  {
    -[QLNavigationState navigationController](self->_previousNavigationVCState, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslucent:", 1);

    -[QLPreviewController internalNavigationController](self, "internalNavigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "toolbar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController toolbarController](self, "toolbarController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOriginalToolbar:", v12);

  }
  else if (-[QLPreviewController _isBeingFullyDismissed](self, "_isBeingFullyDismissed"))
  {
    if (!-[QLPreviewController didTransitionFromInternalView](self, "didTransitionFromInternalView"))
    {
      -[QLPreviewController toolbarController](self, "toolbarController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "restoreOriginalToolbar");

    }
    if (self->_previousNavigationVCState)
    {
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __40__QLPreviewController_viewDidDisappear___block_invoke;
      v29[3] = &unk_24C724B00;
      v29[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v29);
      v15 = -[QLNavigationState translucentToolbar](self->_previousNavigationVCState, "translucentToolbar");
      -[QLNavigationState navigationController](self->_previousNavigationVCState, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "toolbar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTranslucent:", v15);

      previousNavigationVCState = self->_previousNavigationVCState;
      self->_previousNavigationVCState = 0;

    }
    -[QLPreviewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      if (-[QLPreviewController presentationMode](self, "presentationMode") == 4)
      {
        v21 = dispatch_time(0, 100000000);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __40__QLPreviewController_viewDidDisappear___block_invoke_2;
        block[3] = &unk_24C724B00;
        block[4] = self;
        dispatch_after(v21, MEMORY[0x24BDAC9B8], block);
      }
      else
      {
        -[QLPreviewController delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "previewControllerDidDismiss:", self);

      }
    }
    -[QLPreviewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 0);
    -[QLPreviewController setTransitioningDelegate:](self, "setTransitioningDelegate:", self);
    -[QLPreviewController setStrongDelegate:](self, "setStrongDelegate:", 0);
  }
  -[QLPreviewController setCurrentAnimator:](self, "setCurrentAnimator:", 0);
  v23 = (NSObject **)MEMORY[0x24BE7BF48];
  v24 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v24 = *v23;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D4F5000, v24, OS_LOG_TYPE_DEBUG, "Setting currentAnimator to nil from viewDidDisappear #AppearanceTransition", buf, 2u);
  }
  if (-[QLPreviewController _basePreviewControllerIsBeingFullyDismissed](self, "_basePreviewControllerIsBeingFullyDismissed"))
  {
    -[QLPreviewController _invalidatePreviewCollectionIfNeeded](self, "_invalidatePreviewCollectionIfNeeded");
  }
  -[QLPreviewController transitionSourceView](self, "transitionSourceView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeFromSuperview");

  -[QLPreviewController setTransitionSourceView:](self, "setTransitionSourceView:", 0);
  v26.receiver = self;
  v26.super_class = (Class)QLPreviewController;
  -[QLPreviewController viewDidDisappear:](&v26, sel_viewDidDisappear_, v3);
}

void __40__QLPreviewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "toolBarHidden") ^ 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToolbarHidden:", v2);

  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "toolBarHidden");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarHidden:", v4);

}

void __40__QLPreviewController_viewDidDisappear___block_invoke_2(uint64_t a1)
{
  id v2;

  if (!objc_msgSend(*(id *)(a1 + 32), "quickLookVisibility"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "previewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_updateNavigationBarBehaviorStyle
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[QLPreviewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[QLPreviewController _isToolbarVisibleForTraitCollection:](self, "_isToolbarVisibleForTraitCollection:", v3);

  if (v4)
    v5 = 0;
  else
    v5 = 2;
  -[UIView setHidden:](self->_toolbarGradientView, "setHidden:", !v4);
  -[QLPreviewController _topViewController](self, "_topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "style");

  if (v8 != v5)
  {
    -[QLPreviewController _topViewController](self, "_topViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStyle:", v5);

  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLPreviewController;
  -[QLPreviewController willTransitionToTraitCollection:withTransitionCoordinator:](&v10, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, a4);
  -[QLPreviewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "horizontalSizeClass") == 1 && objc_msgSend(v6, "horizontalSizeClass") == 2)
  {
    -[QLPreviewController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      -[QLPreviewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  }
  else
  {

  }
  -[QLPreviewController _updateOverlayButtonsForTraitCollection:animated:](self, "_updateOverlayButtonsForTraitCollection:animated:", v6, 0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)QLPreviewController;
  v7 = a4;
  -[QLPreviewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__QLPreviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_24C724B78;
  v9[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__QLPreviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_24C724B78;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

void __74__QLPreviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "traitCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateOverlayAnimated:forceRefresh:withTraitCollection:", 0, 1, v2);

}

uint64_t __74__QLPreviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRemoteOverlayIfNeeded");
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t result;
  objc_super v4;

  result = -[QLPreviewController forcedSupportedInterfaceOrientations](self, "forcedSupportedInterfaceOrientations");
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)QLPreviewController;
    return -[QLPreviewController supportedInterfaceOrientations](&v4, sel_supportedInterfaceOrientations);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[QLPreviewController _unregisterForApplicationStateChangesNotifications](self, "_unregisterForApplicationStateChangesNotifications");
  v3.receiver = self;
  v3.super_class = (Class)QLPreviewController;
  -[QLPreviewController dealloc](&v3, sel_dealloc);
}

- (BOOL)_isBeingFullyDismissed
{
  char v3;
  void *v4;
  void *v5;

  if (-[QLPreviewController presentationMode](self, "presentationMode") == 2
    && (-[QLPreviewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0)
  {
    return 1;
  }
  if (-[QLPreviewController presentationMode](self, "presentationMode") == 2)
    return 0;
  -[QLPreviewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[QLPreviewController parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "isBeingDismissed");

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (BOOL)_basePreviewControllerIsBeingFullyDismissed
{
  return !-[QLPreviewController didTransitionFromInternalView](self, "didTransitionFromInternalView")
      && -[QLPreviewController _isBeingFullyDismissed](self, "_isBeingFullyDismissed");
}

- (void)_registerForApplicationStateChangesNotifications
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, *MEMORY[0x24BEBDF98], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_sceneWillDeactivate_, *MEMORY[0x24BEBE708], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x24BEBDF88], 0);

}

- (void)_unregisterForApplicationStateChangesNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)sceneWillDeactivate:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (NSObject **)MEMORY[0x24BE7BF48];
  v6 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_INFO, "Scene will deactivate: %@ #Generic", (uint8_t *)&v7, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[QLPreviewCollectionProtocol hostSceneWillDeactivate](self->_previewCollection, "hostSceneWillDeactivate");

}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  QLPreviewCollectionProtocol *previewCollection;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (NSObject **)MEMORY[0x24BE7BF48];
  v6 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_INFO, "xxx applicationDidEnterBackground: %@ #Generic", (uint8_t *)&v9, 0xCu);
  }
  previewCollection = self->_previewCollection;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewCollectionProtocol hostApplicationDidEnterBackground:](previewCollection, "hostApplicationDidEnterBackground:", objc_msgSend(v8, "isSuspendedUnderLock"));

}

- (void)applicationDidBecomeActive:(id)a3
{
  -[QLPreviewCollectionProtocol hostApplicationDidBecomeActive](self->_previewCollection, "hostApplicationDidBecomeActive", a3);
}

- (void)_presentPreviewCollection
{
  void *v3;
  void *v4;
  int v5;
  QLPreviewCollectionProtocol *previewCollection;
  QLPreviewCollectionProtocol *v7;
  NSUserActivity *v8;
  void *v9;
  NSUserActivity *v10;
  _QWORD v11[4];
  NSUserActivity *v12;
  id v13;
  char v14;
  id location;

  if (-[QLPreviewController hasItemsToPreview](self, "hasItemsToPreview")
    && !self->_previewCollectionIsLoading
    && -[QLPreviewController presentationMode](self, "presentationMode"))
  {
    v3 = (void *)MEMORY[0x24BE7BF88];
    -[QLPreviewController previewItemStore](self, "previewItemStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "shouldUseRemoteCollection:", v4);

    previewCollection = self->_previewCollection;
    if (previewCollection)
    {
      if (-[QLPreviewCollectionProtocol isAvailable](previewCollection, "isAvailable")
        && v5 == -[QLPreviewCollectionProtocol isRemote](self->_previewCollection, "isRemote"))
      {
        -[QLPreviewController _showPreviewCollection](self, "_showPreviewCollection");
        return;
      }
      -[QLPreviewController _removePreviewCollectionFromViewHierarchy](self, "_removePreviewCollectionFromViewHierarchy");
    }
    self->_previewCollectionNeedsConfiguration = 1;
    self->_previewCollectionIsLoading = 1;
    v7 = self->_previewCollection;
    self->_previewCollection = 0;

    v8 = self->_userActivity;
    objc_initWeak(&location, self);
    -[QLPreviewController personaUniqueString](self, "personaUniqueString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __48__QLPreviewController__presentPreviewCollection__block_invoke;
    v11[3] = &unk_24C724BC8;
    v14 = v5;
    v10 = v8;
    v12 = v10;
    objc_copyWeak(&v13, &location);
    -[QLPreviewController _adoptPersona:andPerformBlock:](self, "_adoptPersona:andPerformBlock:", v9, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __48__QLPreviewController__presentPreviewCollection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__QLPreviewController__presentPreviewCollection__block_invoke_2;
  v3[3] = &unk_24C724BA0;
  v4 = *(id *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 40));
  +[QLPreviewCollection previewCollectionUsingRemoteViewController:completionHandler:](QLPreviewCollection, "previewCollectionUsingRemoteViewController:completionHandler:", v2, v3);
  objc_destroyWeak(&v5);

}

void __48__QLPreviewController__presentPreviewCollection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id WeakRetained;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setUserActivity:", v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_presentLoadedPreviewCollection:", v4);

}

- (void)_presentLoadedPreviewCollection:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

void __55__QLPreviewController__presentLoadedPreviewCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1264), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "toolbarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessoryView:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_showPreviewCollection");
  objc_msgSend(*(id *)(a1 + 32), "_configurePreviewCollectionIfNeeded");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 985) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_notifyFirstAppearanceIfNeeded");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 1000);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 1000);
  *(_QWORD *)(v9 + 1000) = 0;

}

- (void)_invalidatePreviewCollectionIfNeeded
{
  dispatch_time_t v3;
  _QWORD block[5];

  if (-[QLPreviewController presentationMode](self, "presentationMode") == 4)
  {
    v3 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__QLPreviewController__invalidatePreviewCollectionIfNeeded__block_invoke;
    block[3] = &unk_24C724B00;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    -[QLPreviewController _invalidatePreviewCollectionIfNeededNow](self, "_invalidatePreviewCollectionIfNeededNow");
  }
}

uint64_t __59__QLPreviewController__invalidatePreviewCollectionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "quickLookVisibility");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_invalidatePreviewCollectionIfNeededNow");
  return result;
}

- (void)_invalidatePreviewCollectionIfNeededNow
{
  QLPreviewCollectionProtocol *v3;
  QLPreviewCollectionProtocol *previewCollection;
  QLPreviewCollectionProtocol *v5;
  _QWORD v6[5];
  QLPreviewCollectionProtocol *v7;

  v3 = self->_previewCollection;
  previewCollection = self->_previewCollection;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__QLPreviewController__invalidatePreviewCollectionIfNeededNow__block_invoke;
  v6[3] = &unk_24C724778;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[QLPreviewCollectionProtocol preparePreviewCollectionForInvalidationWithCompletionHandler:](previewCollection, "preparePreviewCollectionForInvalidationWithCompletionHandler:", v6);

}

uint64_t __62__QLPreviewController__invalidatePreviewCollectionIfNeededNow__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "quickLookVisibility");
  if (!result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removePreviewCollectionFromViewHierarchy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1264);
    *(_QWORD *)(v3 + 1264) = 0;

    return objc_msgSend(*(id *)(a1 + 40), "invalidateServiceWithCompletionHandler:", &__block_literal_global_0);
  }
  return result;
}

- (void)_notifyFirstAppearanceIfNeeded
{
  if (!self->_previewCollectionIsLoading
    && self->_previewCollection
    && -[QLPreviewController presentationMode](self, "presentationMode") != 1)
  {
    -[QLPreviewCollectionProtocol notifyFirstTimeAppearanceWithActions:](self->_previewCollection, "notifyFirstTimeAppearanceWithActions:", -[QLPreviewController appearanceActions](self, "appearanceActions"));
  }
}

- (void)_setDefaultFullscreenStateIfNeeded
{
  void *v2;
  uint64_t v3;
  QLPreviewController *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_didSetDefaultFullscreenState)
  {
    obj->_didSetDefaultFullscreenState = 1;
    -[QLPreviewController internalCurrentPreviewItem](obj, "internalCurrentPreviewItem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "shouldOpenInFullScreen") || (obj->_appearanceActions & 4) != 0)
    {

    }
    else
    {
      v3 = -[QLPreviewController presentationMode](obj, "presentationMode");

      if (v3 == 2)
        -[QLPreviewController _setFullScreen:animated:force:](obj, "_setFullScreen:animated:force:", 1, 0, 0);
    }
  }
  objc_sync_exit(obj);

}

- (void)_configurePreviewCollectionIfNeeded
{
  int v3;
  QLPreviewCollectionProtocol *previewCollection;
  void *v5;
  uint64_t v6;
  NSInteger v7;
  void *v8;
  id v9;

  if (self->_previewCollectionNeedsConfiguration && self->_previewCollection)
  {
    -[QLPreviewController _updateAppearance:](self, "_updateAppearance:", 0);
    -[QLPreviewCollectionProtocol overrideParentApplicationDisplayIdentifierWithIdentifier:](self->_previewCollection, "overrideParentApplicationDisplayIdentifierWithIdentifier:", self->_overrideParentApplicationDisplayIdentifier);
    -[QLPreviewCollectionProtocol setLoadingString:](self->_previewCollection, "setLoadingString:", self->_loadingTextForMissingFiles);
    v9 = (id)objc_opt_new();
    objc_msgSend(v9, "setStateManager:", self);
    -[QLPreviewController _setDefaultFullscreenStateIfNeeded](self, "_setDefaultFullscreenStateIfNeeded");
    v3 = _os_feature_enabled_impl();
    previewCollection = self->_previewCollection;
    -[QLPreviewController previewItemStore](self, "previewItemStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfItems");
    v7 = -[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex");
    -[QLPreviewController previewItemStore](self, "previewItemStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      -[QLPreviewCollectionProtocol configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:](previewCollection, "configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:", v6, v7, v8, v9, -[QLPreviewController fullScreen](self, "fullScreen"));
    else
      -[QLPreviewCollectionProtocol configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:](previewCollection, "configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:", v6, v7, v8, v9);

    -[QLPreviewController _notifyFirstAppearanceIfNeeded](self, "_notifyFirstAppearanceIfNeeded");
    -[QLPreviewController _updateAllowInteractiveTransitionsIfNeeded](self, "_updateAllowInteractiveTransitionsIfNeeded");
    -[QLPreviewController updateDoneButtonMenu](self, "updateDoneButtonMenu");
    -[QLPreviewCollectionProtocol setAllowInteractiveTransitions:](self->_previewCollection, "setAllowInteractiveTransitions:", -[QLPreviewController allowInteractiveTransitions](self, "allowInteractiveTransitions"));
    -[QLPreviewCollectionProtocol hostViewControlerTransitionToState:animated:](self->_previewCollection, "hostViewControlerTransitionToState:animated:", -[QLPreviewController quickLookVisibility](self, "quickLookVisibility"), 0);
    -[QLPreviewCollectionProtocol setIsContentManaged:](self->_previewCollection, "setIsContentManaged:", -[QLPreviewController isContentManaged](self, "isContentManaged"));
    -[QLPreviewController toggleChromelessIfNeeded](self, "toggleChromelessIfNeeded");
    self->_previewCollectionNeedsConfiguration = 0;

  }
}

- (void)toggleChromelessIfNeeded
{
  void *v3;
  int v4;

  if (_os_feature_enabled_impl())
  {
    -[QLPreviewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
    -[QLPreviewCollectionProtocol setOverrideUserInterfaceStyle:](self->_previewCollection, "setOverrideUserInterfaceStyle:", 2);
    -[UIViewController QL_enableChromelessBarsUI](self, "QL_enableChromelessBarsUI");
    -[QLPreviewCollectionProtocol QL_enableChromelessBarsUI](self->_previewCollection, "QL_enableChromelessBarsUI");
  }
  else
  {
    -[QLPreviewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 0);
    -[QLPreviewCollectionProtocol setOverrideUserInterfaceStyle:](self->_previewCollection, "setOverrideUserInterfaceStyle:", 0);
    -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supportsChromelessUI");

    if (v4)
    {
      -[UIViewController QL_enableChromelessBarsUI](self, "QL_enableChromelessBarsUI");
      -[QLPreviewCollectionProtocol QL_enableChromelessBarsUI](self->_previewCollection, "QL_enableChromelessBarsUI");
      -[QLPreviewController updateChromelessBars](self, "updateChromelessBars");
    }
    else
    {
      -[UIViewController QL_disableChromelessBarsUI](self, "QL_disableChromelessBarsUI");
      -[QLPreviewCollectionProtocol QL_disableChromelessBarsUI](self->_previewCollection, "QL_disableChromelessBarsUI");
    }
  }
}

- (void)_showPreviewCollection
{
  QLPreviewController *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  if (-[QLPreviewController presentationMode](self, "presentationMode") != 1
    && -[QLPreviewController presentationMode](self, "presentationMode") != 3
    && -[QLPreviewController presentationMode](self, "presentationMode") != 5
    && -[QLPreviewController presentationMode](self, "presentationMode") != 4
    || (-[QLPreviewCollectionProtocol parentViewController](self->_previewCollection, "parentViewController"),
        v3 = (QLPreviewController *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3 != self))
  {
    if (-[QLPreviewController presentationMode](self, "presentationMode") != 2
      || (-[QLPreviewCollectionProtocol parentViewController](self->_previewCollection, "parentViewController"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          -[QLPreviewController internalNavigationController](self, "internalNavigationController"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v4,
          v4 != v5))
    {
      -[QLPreviewCollectionProtocol parentViewController](self->_previewCollection, "parentViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        -[QLPreviewController _removePreviewCollectionFromViewHierarchy](self, "_removePreviewCollectionFromViewHierarchy");
      v7 = -[QLPreviewController presentationMode](self, "presentationMode");
      if (v7 - 3 < 3 || v7 == 1)
      {
        -[QLPreviewController addChildViewController:](self, "addChildViewController:", self->_previewCollection);
        -[QLPreviewController view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLPreviewCollectionProtocol view](self->_previewCollection, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "insertSubview:atIndex:", v12, 0);

        -[QLPreviewCollectionProtocol didMoveToParentViewController:](self->_previewCollection, "didMoveToParentViewController:", self);
        -[QLPreviewCollectionProtocol view](self->_previewCollection, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[QLPreviewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BDD1628];
        v24 = CFSTR("previewCollection");
        -[QLPreviewCollectionProtocol view](self->_previewCollection, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[previewCollection]|"), 0, 0, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addConstraints:", v18);

        -[QLPreviewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x24BDD1628];
        -[QLPreviewCollectionProtocol view](self->_previewCollection, "view", CFSTR("previewCollection"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[previewCollection]|"), 0, 0, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addConstraints:", v21);

      }
      else
      {
        if (v7 != 2)
        {
LABEL_16:
          -[QLPreviewController _updateAppearance:](self, "_updateAppearance:", 0);
          -[QLPreviewController updateOverlayAnimated:forceRefresh:](self, "updateOverlayAnimated:forceRefresh:", 0, 0);
          return;
        }
        -[QLPreviewCollectionProtocol view](self->_previewCollection, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

        -[QLPreviewController internalNavigationController](self, "internalNavigationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = self->_previewCollection;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setViewControllers:", v10);
      }

      goto LABEL_16;
    }
  }
}

- (void)_removePreviewCollectionFromViewHierarchy
{
  void *v3;

  -[QLPreviewCollectionProtocol willMoveToParentViewController:](self->_previewCollection, "willMoveToParentViewController:", 0);
  -[QLPreviewCollectionProtocol view](self->_previewCollection, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[QLPreviewCollectionProtocol removeFromParentViewController](self->_previewCollection, "removeFromParentViewController");
}

- (CGRect)frameForAdditionalButtonWithActionName:(SEL)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[QLPreviewController viewForAdditionalButtonWithActionName:](self, "viewForAdditionalButtonWithActionName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    objc_msgSend(v5, "convertRect:toView:", 0);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v7 = *MEMORY[0x24BDBF070];
    v9 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)viewForAdditionalButtonWithActionName:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[QLPreviewController _topViewController](self, "_topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftBarButtonItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v11);
      if ((SEL)objc_msgSend(v12, "action") == a3)
      {
        objc_msgSend(v12, "valueForKey:", CFSTR("view"));
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_29;
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[QLPreviewController _topViewController](self, "_topViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightBarButtonItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
LABEL_12:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v18)
        objc_enumerationMutation(v7);
      v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v19);
      if ((SEL)objc_msgSend(v20, "action") == a3)
      {
        objc_msgSend(v20, "valueForKey:", CFSTR("view"));
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_29;
      }
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v17)
          goto LABEL_12;
        break;
      }
    }
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[QLPreviewController _topViewController](self, "_topViewController", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "toolbarItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
LABEL_21:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v24)
        objc_enumerationMutation(v7);
      v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v25);
      if ((SEL)objc_msgSend(v26, "action") == a3)
      {
        objc_msgSend(v26, "valueForKey:", CFSTR("view"));
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
          break;
      }
      if (v23 == ++v25)
      {
        v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v23)
          goto LABEL_21;
        goto LABEL_28;
      }
    }
LABEL_29:
    v27 = (void *)v13;
    goto LABEL_30;
  }
LABEL_28:
  v27 = 0;
LABEL_30:

  return v27;
}

- (void)waitForPreviewCollectionWithCompletionHandler:(id)a3
{
  void (**v4)(void);
  NSMutableArray *previewCollectionReadyCompletionBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void (**aBlock)(void);

  v4 = (void (**)(void))a3;
  aBlock = v4;
  if (self->_previewCollection)
  {
    v4[2]();
  }
  else
  {
    previewCollectionReadyCompletionBlocks = self->_previewCollectionReadyCompletionBlocks;
    if (!previewCollectionReadyCompletionBlocks)
    {
      v6 = (NSMutableArray *)objc_opt_new();
      v7 = self->_previewCollectionReadyCompletionBlocks;
      self->_previewCollectionReadyCompletionBlocks = v6;

      v4 = aBlock;
      previewCollectionReadyCompletionBlocks = self->_previewCollectionReadyCompletionBlocks;
    }
    v8 = _Block_copy(v4);
    -[NSMutableArray addObject:](previewCollectionReadyCompletionBlocks, "addObject:", v8);

  }
}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewController previewCollection](self, "previewCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForActionSheetPresentationWithCompletionHandler:", v4);

}

- (void)setAdditionalLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_additionalLeftBarButtonItems, a3);
  -[QLPreviewController updateOverlayAnimated:forceRefresh:](self, "updateOverlayAnimated:forceRefresh:", -[QLPreviewController presentationStyle](self, "presentationStyle") != 1, 0);
}

- (void)setAdditionalRightBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_additionalRightBarButtonItems, a3);
  -[QLPreviewController updateOverlayAnimated:forceRefresh:](self, "updateOverlayAnimated:forceRefresh:", -[QLPreviewController presentationStyle](self, "presentationStyle") != 1, 0);
}

- (void)_setCurrentPreviewItemIndex:(int64_t)a3 updatePreview:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v7;
  _BOOL4 v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  CGSize v13;

  if (self->_deferReloadData)
  {
    self->_deferredSetIndex = a3;
  }
  else
  {
    v7 = a5;
    v8 = a4;
    -[QLPreviewController previewItemStore](self, "previewItemStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "possibleRange");
    v12 = v11;

    if (a3 >= v10 && a3 - v10 < v12 && self->_currentPreviewItemIndex != a3)
    {
      -[QLPreviewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentPreviewItemIndex"));
      self->_currentPreviewItemIndex = a3;
      -[QLPreviewController updateOverlayAnimated:forceRefresh:](self, "updateOverlayAnimated:forceRefresh:", 1, 0);
      if (v8)
        -[QLPreviewController _refreshCurrentPreviewItemAnimated:](self, "_refreshCurrentPreviewItemAnimated:", v7);
      if (-[QLPreviewController _isQuickLookVisible](self, "_isQuickLookVisible"))
        -[QLPreviewController previewItemAtIndex:wasUpdatedWithLifecycleState:withError:](self, "previewItemAtIndex:wasUpdatedWithLifecycleState:withError:", a3, 3, 0);
      if (_os_feature_enabled_impl())
        -[QLPreviewController toggleChromelessIfNeeded](self, "toggleChromelessIfNeeded");
      v13 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
      self->_contentFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
      self->_contentFrame.size = v13;
      -[QLPreviewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentPreviewItemIndex"));
    }
  }
}

- (void)setCurrentPreviewItemIndex:(NSInteger)currentPreviewItemIndex
{
  -[QLPreviewController setCurrentPreviewItemIndex:animated:](self, "setCurrentPreviewItemIndex:animated:", currentPreviewItemIndex, 0);
}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  -[QLPreviewController _setCurrentPreviewItemIndex:updatePreview:animated:](self, "_setCurrentPreviewItemIndex:updatePreview:animated:", a3, 1, a4);
}

- (NSInteger)currentPreviewItemIndex
{
  return self->_currentPreviewItemIndex;
}

- (id)currentPreviewItem
{
  void *v2;
  void *v3;

  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalPreviewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (QLItem)internalCurrentPreviewItem
{
  void *v4;
  NSInteger v5;
  id v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (-[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex") == 0x7FFFFFFFFFFFFFFFLL)
    return (QLItem *)0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  -[QLPreviewController previewItemStore](self, "previewItemStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__QLPreviewController_internalCurrentPreviewItem__block_invoke;
  v7[3] = &unk_24C724C10;
  v7[4] = &v8;
  objc_msgSend(v4, "previewItemAtIndex:withCompletionHandler:", v5, v7);

  v6 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (QLItem *)v6;
}

void __49__QLPreviewController_internalCurrentPreviewItem__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setDataSource:(id)dataSource
{
  id v5;
  id WeakRetained;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  QLPreviewController *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != v5)
  {
    objc_storeWeak((id *)&self->_dataSource, v5);
    if (-[QLPreviewController _isQuickLookVisible](self, "_isQuickLookVisible"))
    {
      if (-[QLPreviewController presentationMode](self, "presentationMode") == 4)
      {
        v7 = (NSObject **)MEMORY[0x24BE7BF48];
        v8 = *MEMORY[0x24BE7BF48];
        if (!*MEMORY[0x24BE7BF48])
        {
          QLSInitLogging();
          v8 = *v7;
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = v8;
          NSStringFromSelector(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138412546;
          v12 = self;
          v13 = 2112;
          v14 = v10;
          _os_log_impl(&dword_20D4F5000, v9, OS_LOG_TYPE_ERROR, "%@ %@: The datasource should not be updated during the peeking session. This can result in unintended side effects. #PreviewController", (uint8_t *)&v11, 0x16u);

        }
      }
      -[QLPreviewController reloadData](self, "reloadData");
    }
    else
    {
      self->_deferReloadData = 1;
    }
  }

}

- (void)setAppearanceActions:(unint64_t)a3
{
  self->_appearanceActions = a3;
  -[QLPreviewController _notifyFirstAppearanceIfNeeded](self, "_notifyFirstAppearanceIfNeeded");
}

- (void)_setFullScreen:(BOOL)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  _BOOL8 v6;
  double v9;
  void *v10;
  _QWORD v11[5];

  v6 = a4;
  if (self->_fullScreen == a3)
  {
    if (!a5)
      return;
  }
  else if (-[QLPreviewController isBeingDismissed](self, "isBeingDismissed") && !a5)
  {
    return;
  }
  self->_fullScreen = a3;
  v9 = 0.2;
  if (!v6)
    v9 = 0.0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__QLPreviewController__setFullScreen_animated_force___block_invoke;
  v11[3] = &unk_24C724B00;
  v11[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v11, v9);
  self->_overlayHidden = a3;
  -[QLPreviewController updateOverlayAnimated:animatedButtons:forceRefresh:withTraitCollection:](self, "updateOverlayAnimated:animatedButtons:forceRefresh:withTraitCollection:", v6, 0, 0, 0);
  -[QLPreviewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  -[QLPreviewController toolbarController](self, "toolbarController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateLayout");

}

uint64_t __53__QLPreviewController__setFullScreen_animated_force___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackgroundColor");
}

- (void)setNavigationBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarTintColor, a3);
  -[QLPreviewController _updateBarTintColors](self, "_updateBarTintColors");
}

- (void)setToolbarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarTintColor, a3);
  -[QLPreviewController _updateBarTintColors](self, "_updateBarTintColors");
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  -[QLPreviewController _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)setFullscreenBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenBackgroundColor, a3);
  -[QLPreviewController _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (id)_preferredBackgroundColor
{
  void *v3;

  if (-[QLPreviewController fullScreen](self, "fullScreen") || (_os_feature_enabled_impl() & 1) != 0)
  {
    -[QLPreviewController fullscreenBackgroundColor](self, "fullscreenBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[QLPreviewController backgroundColor](self, "backgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setOverlayHidden:(BOOL)a3 animated:(BOOL)a4
{
  self->_overlayHidden = a3;
  -[QLPreviewController updateOverlayAnimated:forceRefresh:](self, "updateOverlayAnimated:forceRefresh:", a4, 0);
}

- (void)_setPresentationMode:(unint64_t)a3
{
  if (self->_presentationMode != a3)
  {
    self->_presentationMode = a3;
    -[QLPreviewController _updateViewHierarchyPresentation](self, "_updateViewHierarchyPresentation");
    -[QLPreviewController updateChromelessBars](self, "updateChromelessBars");
  }
  -[QLPreviewController _updateAppearance:](self, "_updateAppearance:", 0);
}

- (int64_t)_preferredModalPresentationStyle
{
  return 0;
}

- (void)_updateViewHierarchyPresentation
{
  id v3;

  if (self->_presentationMode)
    v3 = -[QLPreviewController internalNavigationController](self, "internalNavigationController");
  -[QLPreviewController _presentPreviewCollection](self, "_presentPreviewCollection");
  -[QLPreviewController setAllowInteractiveTransitions:](self, "setAllowInteractiveTransitions:", -[QLPreviewController _shouldAllowInteractiveTransitions](self, "_shouldAllowInteractiveTransitions"));
  -[QLPreviewController _updateToolbarSuperview](self, "_updateToolbarSuperview");
}

- (void)_updateToolbarSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;

  if (-[QLPreviewController presentationMode](self, "presentationMode") != 2)
  {
    if (-[QLPreviewController presentationMode](self, "presentationMode") == 1)
    {
      -[QLPreviewController previousNavigationVCState](self, "previousNavigationVCState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "toolBarHidden")
        && !-[QLPreviewController didTransitionFromInternalView](self, "didTransitionFromInternalView"))
      {
        v8 = -[QLPreviewController willTransitionToInternalView](self, "willTransitionToInternalView");

        if (!v8)
        {
          -[QLPreviewController toolbarController](self, "toolbarController");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          -[QLPreviewController view](self, "view");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[QLPreviewController internalNavigationController](self, "internalNavigationController");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "view");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setPreferredSuperview:preferredParentViewForSafeAreaInset:", v3, v5);
          goto LABEL_3;
        }
      }
      else
      {

      }
    }
    -[QLPreviewController toolbarController](self, "toolbarController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController internalNavigationController](self, "internalNavigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreferredSuperview:preferredParentViewForSafeAreaInset:", 0, v4);
    goto LABEL_9;
  }
  -[QLPreviewController toolbarController](self, "toolbarController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController internalNavigationController](self, "internalNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController internalNavigationController](self, "internalNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredSuperview:preferredParentViewForSafeAreaInset:", v4, v6);

LABEL_3:
LABEL_9:

}

- (UINavigationController)internalNavigationController
{
  unint64_t v3;
  UINavigationController *v4;
  void *v5;
  UINavigationController *v6;
  UINavigationController *v7;
  UINavigationController *internalNavigationController;
  void *v10;
  UINavigationController *v11;
  UINavigationController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[QLPreviewController presentationMode](self, "presentationMode");
  if (v3 - 3 >= 3)
  {
    if (v3 == 2)
    {
      internalNavigationController = self->_internalNavigationController;
      if (!internalNavigationController)
      {
        v10 = (void *)objc_opt_new();
        objc_storeWeak((id *)&self->_modalRootViewController, v10);
        v11 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v10);
        v12 = self->_internalNavigationController;
        self->_internalNavigationController = v11;

        -[UINavigationController setDelegate:](self->_internalNavigationController, "setDelegate:", self);
        -[UINavigationController toolbar](self->_internalNavigationController, "toolbar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("QLCustomToolBarModalAccessibilityIdentifier"));

        -[QLPreviewController addChildViewController:](self, "addChildViewController:", self->_internalNavigationController);
        -[QLPreviewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationController view](self->_internalNavigationController, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertSubview:atIndex:", v15, 0);

        -[UINavigationController didMoveToParentViewController:](self->_internalNavigationController, "didMoveToParentViewController:", self);
        -[UINavigationController view](self->_internalNavigationController, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[QLPreviewController view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDD1628];
        v29 = CFSTR("mainView");
        -[UINavigationController view](self->_internalNavigationController, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[mainView]|"), 0, 0, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addConstraints:", v21);

        -[QLPreviewController view](self, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x24BDD1628];
        v27 = CFSTR("mainView");
        -[UINavigationController view](self->_internalNavigationController, "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v24;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[mainView]|"), 0, 0, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addConstraints:", v26);

        -[QLPreviewController _updateNavigationBarBehaviorStyle](self, "_updateNavigationBarBehaviorStyle");
        internalNavigationController = self->_internalNavigationController;
      }
      v7 = internalNavigationController;
      return v7;
    }
    if (v3 != 1)
      return (UINavigationController *)0;
  }
  v4 = self->_internalNavigationController;
  if (v4)
  {
    -[UINavigationController willMoveToParentViewController:](v4, "willMoveToParentViewController:", 0);
    -[UINavigationController view](self->_internalNavigationController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[UINavigationController removeFromParentViewController](self->_internalNavigationController, "removeFromParentViewController");
    v6 = self->_internalNavigationController;
    self->_internalNavigationController = 0;

  }
  if (!-[QLPreviewController parentIsNavigationController](self, "parentIsNavigationController"))
    return (UINavigationController *)0;
  -[QLPreviewController navigationController](self, "navigationController");
  v7 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)previewItemAtIndex:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  -[QLPreviewController previewItemStore](self, "previewItemStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__QLPreviewController_previewItemAtIndex___block_invoke;
  v7[3] = &unk_24C724C10;
  v7[4] = &v8;
  objc_msgSend(v4, "previewItemAtIndex:withCompletionHandler:", a3, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __42__QLPreviewController_previewItemAtIndex___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)numberOfPreviewItems
{
  void *v2;
  int64_t v3;

  -[QLPreviewController previewItemStore](self, "previewItemStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItems");

  return v3;
}

- (void)setAllowInteractiveTransitions:(BOOL)a3
{
  if (self->_allowInteractiveTransitions != a3)
  {
    self->_allowInteractiveTransitions = a3;
    -[QLPreviewCollectionProtocol setAllowInteractiveTransitions:](self->_previewCollection, "setAllowInteractiveTransitions:", -[QLPreviewController allowInteractiveTransitions](self, "allowInteractiveTransitions"));
  }
}

- (void)setLoadingTextForMissingFiles:(id)a3
{
  NSString **p_loadingTextForMissingFiles;
  id v6;

  p_loadingTextForMissingFiles = &self->_loadingTextForMissingFiles;
  objc_storeStrong((id *)&self->_loadingTextForMissingFiles, a3);
  v6 = a3;
  -[QLPreviewCollectionProtocol setLoadingString:](self->_previewCollection, "setLoadingString:", *p_loadingTextForMissingFiles);

}

- (void)setUseCustomActionButton:(BOOL)a3
{
  if (self->_useCustomActionButton != a3)
  {
    self->_useCustomActionButton = a3;
    -[QLPreviewController updateOverlayAnimated:forceRefresh:](self, "updateOverlayAnimated:forceRefresh:", 0, 1);
  }
}

- (void)setShowActionAsDefaultButton:(BOOL)a3
{
  if (self->_showActionAsDefaultButton != a3)
  {
    self->_showActionAsDefaultButton = a3;
    -[QLPreviewController updateOverlayAnimated:forceRefresh:](self, "updateOverlayAnimated:forceRefresh:", 0, 1);
  }
}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[QLPreviewController updatePreferredTransition](self, "updatePreferredTransition");
    v5 = obj;
  }

}

- (id)delegate
{
  void *WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self->_strongDelegate;
  v5 = WeakRetained;

  return v5;
}

- (void)updatePreferredTransition
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  QLPreviewController *v21;
  id v22;
  id location;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];

  if (_os_feature_enabled_impl())
  {
    v3 = objc_alloc_init(MEMORY[0x24BEBDB70]);
    v4 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __48__QLPreviewController_updatePreferredTransition__block_invoke;
    v26[3] = &unk_24C724C38;
    v26[4] = self;
    objc_msgSend(v3, "setAlignmentRectProvider:", v26);
    -[QLPreviewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[QLPreviewController setTransitioningDelegate:](self, "setTransitioningDelegate:", 0);
      v7 = (void *)MEMORY[0x24BEBDB10];
      v25[0] = v4;
      v25[1] = 3221225472;
      v25[2] = __48__QLPreviewController_updatePreferredTransition__block_invoke_249;
      v25[3] = &unk_24C724C60;
      v25[4] = self;
      v8 = v25;
    }
    else
    {
      -[QLPreviewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0)
      {
        -[QLPreviewController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[QLPreviewController delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_opt_respondsToSelector();

          if ((v14 & 1) != 0)
          {
            -[QLPreviewController setTransitioningDelegate:](self, "setTransitioningDelegate:", 0);
            objc_initWeak(&location, self);
            v15 = (void *)MEMORY[0x24BEBDB10];
            v17 = v4;
            v18 = 3221225472;
            v19 = __48__QLPreviewController_updatePreferredTransition__block_invoke_258;
            v20 = &unk_24C724C88;
            v21 = self;
            objc_copyWeak(&v22, &location);
            objc_msgSend(v15, "zoomWithOptions:sourceViewProvider:", v3, &v17);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[QLPreviewController setPreferredTransition:](self, "setPreferredTransition:", v16, v17, v18, v19, v20, v21);

            objc_destroyWeak(&v22);
            objc_destroyWeak(&location);
            goto LABEL_7;
          }
        }
        else
        {

        }
        -[QLPreviewController setTransitioningDelegate:](self, "setTransitioningDelegate:", self);
        -[QLPreviewController setPreferredTransition:](self, "setPreferredTransition:", 0);
        goto LABEL_7;
      }
      -[QLPreviewController setTransitioningDelegate:](self, "setTransitioningDelegate:", 0);
      v7 = (void *)MEMORY[0x24BEBDB10];
      v24[0] = v4;
      v24[1] = 3221225472;
      v24[2] = __48__QLPreviewController_updatePreferredTransition__block_invoke_253;
      v24[3] = &unk_24C724C60;
      v24[4] = self;
      v8 = v24;
    }
    objc_msgSend(v7, "zoomWithOptions:sourceViewProvider:", v3, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController setPreferredTransition:](self, "setPreferredTransition:", v11);

LABEL_7:
  }
}

double __48__QLPreviewController_updatePreferredTransition__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL IsEmpty;
  double *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject **v18;
  NSObject *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject **v30;
  NSObject *v31;
  void *v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  NSObject **v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  NSObject **v46;
  NSObject *v47;
  double *v48;
  void *v49;
  uint64_t v50;
  double v51;
  NSObject **v52;
  NSObject *v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  NSObject *v58;
  void *v59;
  uint8_t buf[4];
  void *v62;
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v63 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  IsEmpty = CGRectIsEmpty(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1160));
  v5 = *(double **)(a1 + 32);
  if (!IsEmpty && v5[145] >= 0.0 && v5[146] >= 0.0)
  {
    v52 = (NSObject **)MEMORY[0x24BE7BF48];
    v53 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v53 = *v52;
    }
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = *(double *)(*(_QWORD *)(a1 + 32) + 1160);
      v55 = *(double *)(*(_QWORD *)(a1 + 32) + 1168);
      v56 = *(double *)(*(_QWORD *)(a1 + 32) + 1176);
      v57 = *(double *)(*(_QWORD *)(a1 + 32) + 1184);
      v58 = v53;
      v66.origin.x = v54;
      v66.origin.y = v55;
      v66.size.width = v56;
      v66.size.height = v57;
      NSStringFromCGRect(v66);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v59;
      _os_log_impl(&dword_20D4F5000, v58, OS_LOG_TYPE_DEFAULT, "[ZOOM] ContentFrame alignmentRect = %@ #PreviewController", buf, 0xCu);

    }
    v48 = (double *)(*(_QWORD *)(a1 + 32) + 1160);
    goto LABEL_44;
  }
  objc_msgSend(v5, "internalCurrentPreviewItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "previewItemType") == 2)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "internalCurrentPreviewItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "previewItemType") == 3)
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "internalCurrentPreviewItem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "previewItemType");

  if (v50 != 1)
  {
    objc_msgSend(v3, "zoomedViewController");
    v44 = objc_claimAutoreleasedReturnValue();
    -[NSObject view](v44, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "frame");
    v35 = v51;
    goto LABEL_38;
  }
LABEL_8:
  objc_msgSend(v3, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v64.origin.x = v11;
  v64.origin.y = v13;
  v64.size.width = v15;
  v64.size.height = v17;
  if (CGRectIsEmpty(v64))
  {
    v18 = (NSObject **)MEMORY[0x24BE7BF48];
    v19 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4F5000, v19, OS_LOG_TYPE_ERROR, "Could not get the source view's window for the zoom transition, falling back to screen bounds! #PreviewController", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v15 = v21;
    v17 = v22;

  }
  objc_msgSend(*(id *)(a1 + 32), "preferredContentSize");
  v25 = v24;
  v26 = v23;
  v28 = *MEMORY[0x24BDBF148];
  v27 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v24 == *MEMORY[0x24BDBF148] && v23 == v27)
  {
    v30 = (NSObject **)MEMORY[0x24BE7BF48];
    v31 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v31 = *v30;
    }
    v26 = v17;
    v25 = v15;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4F5000, v31, OS_LOG_TYPE_INFO, "Preview controller has no preferred content size, falling back to window bounds for alignment rectangle #PreviewController", buf, 2u);
      v26 = v17;
      v25 = v15;
    }
  }
  if (v25 == v28 && v26 == v27)
  {
    v46 = (NSObject **)MEMORY[0x24BE7BF48];
    v47 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v47 = *v46;
    }
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4F5000, v47, OS_LOG_TYPE_ERROR, "Could not compute alignment rectangle for zoom transition #PreviewController", buf, 2u);
    }
    v48 = (double *)MEMORY[0x24BDBF090];
LABEL_44:
    v35 = *v48;
    goto LABEL_45;
  }
  objc_msgSend(*(id *)(a1 + 32), "internalCurrentPreviewItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "previewSizeForItemViewControllerSize:", v15, v17);

  UIRectCenteredRect();
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = (NSObject **)MEMORY[0x24BE7BF48];
  v43 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v43 = *v42;
  }
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = v43;
    v65.origin.x = v35;
    v65.origin.y = v37;
    v65.size.width = v39;
    v65.size.height = v41;
    NSStringFromCGRect(v65);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v62 = v45;
    _os_log_impl(&dword_20D4F5000, v44, OS_LOG_TYPE_DEFAULT, "[ZOOM]: Frame alignmentRect = %@ #PreviewController", buf, 0xCu);
LABEL_38:

  }
LABEL_45:

  return v35;
}

id __48__QLPreviewController_updatePreferredTransition__block_invoke_249(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;
  CGRect v14;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "currentPreviewItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewController:transitionViewForPreviewItem:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (NSObject **)MEMORY[0x24BE7BF48];
  v7 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v5, "frame");
    NSStringFromCGRect(v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_20D4F5000, v8, OS_LOG_TYPE_DEFAULT, "[ZOOM] client gave us a view with frame: %@ #PreviewController", (uint8_t *)&v11, 0xCu);

  }
  return v5;
}

id __48__QLPreviewController_updatePreferredTransition__block_invoke_253(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  CGRect v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;
  CGRect v18;

  v17 = *MEMORY[0x24BDAC8D0];
  memset(&v12, 0, sizeof(v12));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "currentPreviewItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewController:transitionViewForPreviewItem:uncroppedSourceFrame:", v3, v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (NSObject **)MEMORY[0x24BE7BF48];
  v7 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v5, "frame");
    NSStringFromCGRect(v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCGRect(v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_20D4F5000, v8, OS_LOG_TYPE_DEFAULT, "[ZOOM] client gaev us a view with frame: %@, uncroppedFrame: %@ #PreviewController", buf, 0x16u);

  }
  return v5;
}

id __48__QLPreviewController_updatePreferredTransition__block_invoke_258(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  NSObject **v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  CGRect *v18;
  CGSize v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  double x;
  double y;
  double height;
  double width;
  NSObject *v32;
  double v33;
  double v34;
  NSObject *v35;
  void *v36;
  double v37;
  double v38;
  BOOL v39;
  BOOL IsNull;
  BOOL IsEmpty;
  _BOOL4 IsInfinite;
  BOOL v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id *v50;
  id WeakRetained;
  void *v52;
  id v53;
  NSObject *v54;
  id v56;
  uint8_t v57[4];
  void *v58;
  __int16 v59;
  void *v60;
  CGRect buf;
  uint64_t v62;
  CGSize v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v62 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "currentPreviewItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend(v2, "previewController:frameForPreviewItem:inSourceView:", v3, v4, &v56);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = v56;

  v14 = (NSObject **)MEMORY[0x24BE7BF48];
  v15 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v64.origin.x = v6;
    v64.origin.y = v8;
    v64.size.width = v10;
    v64.size.height = v12;
    NSStringFromCGRect(v64);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.origin.x) = 138412290;
    *(_QWORD *)((char *)&buf.origin.x + 4) = v17;
    _os_log_impl(&dword_20D4F5000, v16, OS_LOG_TYPE_DEFAULT, "[ZOOM] sourceFrame sent by client: %{PUBLIC}@ #PreviewController", (uint8_t *)&buf, 0xCu);

  }
  if (v13)
  {
    v18 = (CGRect *)MEMORY[0x24BDBF090];
    v19 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    buf.origin = (CGPoint)*MEMORY[0x24BDBF090];
    buf.size = v19;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(a1 + 32);
    objc_msgSend(v21, "currentPreviewItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "previewController:transitionImageForPreviewItem:contentRect:", v21, v22, &buf);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = *v14;
    if (!*v14)
    {
      QLSInitLogging();
      v24 = *v14;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      objc_msgSend(v23, "size");
      NSStringFromCGSize(v63);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGRect(buf);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v57 = 138412546;
      v58 = v26;
      v59 = 2112;
      v60 = v27;
      _os_log_impl(&dword_20D4F5000, v25, OS_LOG_TYPE_DEFAULT, "[ZOOM] client returned image with size: %{PUBLIC}@ and contentRect: %{PUBLIC}@ #PreviewController", v57, 0x16u);

    }
    x = buf.origin.x;
    y = buf.origin.y;
    height = buf.size.height;
    width = buf.size.width;
    v32 = *v14;
    if (!*v14)
    {
      QLSInitLogging();
      v32 = *v14;
    }
    v33 = v6 + x;
    v34 = v8 + y;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v32;
      v65.origin.x = v33;
      v65.origin.y = v34;
      v65.size.width = width;
      v65.size.height = height;
      NSStringFromCGRect(v65);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v57 = 138412290;
      v58 = v36;
      _os_log_impl(&dword_20D4F5000, v35, OS_LOG_TYPE_DEFAULT, "[ZOOM] Adjusted source frame: %{PUBLIC}@ #PreviewController", v57, 0xCu);

    }
    v37 = *MEMORY[0x24BDBF148];
    v38 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v66.origin.x = v33;
    v66.origin.y = v34;
    v66.size.width = width;
    v66.size.height = height;
    v39 = CGRectEqualToRect(v66, *v18);
    v67.origin.x = v33;
    v67.origin.y = v34;
    v67.size.width = width;
    v67.size.height = height;
    IsNull = CGRectIsNull(v67);
    v68.origin.x = v33;
    v68.origin.y = v34;
    v68.size.width = width;
    v68.size.height = height;
    IsEmpty = CGRectIsEmpty(v68);
    v69.origin.x = v33;
    v69.origin.y = v34;
    v69.size.width = width;
    v69.size.height = height;
    IsInfinite = CGRectIsInfinite(v69);
    v43 = height == v38 && width == v37;
    if (v43 || v39 || IsNull || IsEmpty || IsInfinite)
    {
      v44 = *v14;
      if (!*v14)
      {
        QLSInitLogging();
        v44 = *v14;
      }
      height = 1.0;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v57 = 0;
        _os_log_impl(&dword_20D4F5000, v44, OS_LOG_TYPE_FAULT, "-previewController:transitionImageForPreviewItem:contentRect: returned an invalid content rect, this is undefined behavior. Please return a valid CGRect. #PreviewController", v57, 2u);
      }
      width = 1.0;
    }
    v45 = *v14;
    if (!*v14)
    {
      QLSInitLogging();
      v45 = *v14;
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = v45;
      v70.origin.x = v33;
      v70.origin.y = v34;
      v70.size.width = width;
      v70.size.height = height;
      NSStringFromCGRect(v70);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v57 = 138412290;
      v58 = v47;
      _os_log_impl(&dword_20D4F5000, v46, OS_LOG_TYPE_DEFAULT, "[ZOOM] Creating UIImageView with frame: %{PUBLIC}@ #PreviewController", v57, 0xCu);

    }
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", v33, v34, width, height);
    objc_msgSend(v48, "setImage:", v23);
    objc_msgSend(v48, "setContentMode:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setBackgroundColor:", v49);

    objc_msgSend(v13, "addSubview:", v48);
    v50 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained(v50);
    objc_msgSend(WeakRetained, "transitionSourceView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "removeFromSuperview");

    v53 = objc_loadWeakRetained(v50);
    objc_msgSend(v53, "setTransitionSourceView:", v48);

  }
  else
  {
    v54 = *v14;
    if (!*v14)
    {
      QLSInitLogging();
      v54 = *v14;
    }
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.origin.x) = 0;
      _os_log_impl(&dword_20D4F5000, v54, OS_LOG_TYPE_DEFAULT, "[ZOOM] sourceView is nil, bailing out #PreviewController", (uint8_t *)&buf, 2u);
    }
    v48 = 0;
  }

  return v48;
}

- (BOOL)hasItemsToPreview
{
  return -[QLPreviewController numberOfPreviewItems](self, "numberOfPreviewItems") > 0;
}

- (void)setQuickLookVisibility:(unint64_t)a3
{
  -[QLPreviewController setQuickLookVisibility:animated:](self, "setQuickLookVisibility:animated:", a3, 0);
}

- (void)setQuickLookVisibility:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t quickLookVisibility;
  double v7;
  void *v8;
  double v9;
  id v10;
  _QWORD v11[5];

  v4 = a4;
  self->_quickLookVisibility = a3;
  -[QLPreviewCollectionProtocol hostViewControlerTransitionToState:animated:](self->_previewCollection, "hostViewControlerTransitionToState:animated:");
  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "shouldOpenInFullScreen"))
  {
    quickLookVisibility = self->_quickLookVisibility;

    if (quickLookVisibility == 2)
    {
      v7 = 0.0;
      if (v4)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD988]), "initWithDefaultParameters");
        objc_msgSend(v8, "duration");
        v7 = v9;

      }
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __55__QLPreviewController_setQuickLookVisibility_animated___block_invoke;
      v11[3] = &unk_24C724B00;
      v11[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v11, v7);
    }
  }
  else
  {

  }
}

uint64_t __55__QLPreviewController_setQuickLookVisibility_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (void)setIsContentManaged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject **v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = (NSObject **)MEMORY[0x24BE7BF48];
  v6 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_DEFAULT, "MDM : Client is setting isContentManaged to : %@ #PreviewController", (uint8_t *)&v8, 0xCu);
  }
  -[QLPreviewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isContentManaged"));
  self->_isContentManaged = v3;
  -[QLPreviewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isContentManaged"));
  -[QLPreviewCollectionProtocol setIsContentManaged:](self->_previewCollection, "setIsContentManaged:", v3);
}

- (double)navigationBarGradientAlpha
{
  double result;

  -[UIView alpha](self->_navigationBarGradientView, "alpha");
  return result;
}

- (void)setNavigationBarGradientAlpha:(double)a3
{
  -[UIView setAlpha:](self->_navigationBarGradientView, "setAlpha:", a3);
}

- (double)toolbarGradientAlpha
{
  double result;

  -[UIView alpha](self->_toolbarGradientView, "alpha");
  return result;
}

- (void)setToolbarGradientAlpha:(double)a3
{
  -[UIView setAlpha:](self->_toolbarGradientView, "setAlpha:", a3);
}

- (id)navigationBarGradientView
{
  UIView **p_navigationBarGradientView;
  UIView *navigationBarGradientView;
  _TtC9QuickLook14QLGradientView *v4;

  p_navigationBarGradientView = &self->_navigationBarGradientView;
  navigationBarGradientView = self->_navigationBarGradientView;
  if (navigationBarGradientView)
  {
    v4 = navigationBarGradientView;
  }
  else
  {
    v4 = objc_alloc_init(_TtC9QuickLook14QLGradientView);
    -[QLGradientView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[QLGradientView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    objc_storeStrong((id *)p_navigationBarGradientView, v4);
  }
  return v4;
}

- (id)toolbarGradientView
{
  UIView **p_toolbarGradientView;
  UIView *toolbarGradientView;
  _TtC9QuickLook14QLGradientView *v4;

  p_toolbarGradientView = &self->_toolbarGradientView;
  toolbarGradientView = self->_toolbarGradientView;
  if (toolbarGradientView)
  {
    v4 = toolbarGradientView;
  }
  else
  {
    v4 = objc_alloc_init(_TtC9QuickLook14QLGradientView);
    -[QLGradientView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[QLGradientView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[QLGradientView setReversed:](v4, "setReversed:", 1);
    objc_storeStrong((id *)p_toolbarGradientView, v4);
  }
  return v4;
}

- (void)_installGradientViewsIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  _QWORD v49[6];

  v49[4] = *MEMORY[0x24BDAC8D0];
  -[UIView superview](self->_navigationBarGradientView, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[UIView superview](self->_toolbarGradientView, "superview"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    -[QLPreviewController internalNavigationController](self, "internalNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[QLPreviewController navigationBarGradientView](self, "navigationBarGradientView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewController internalNavigationController](self, "internalNavigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "navigationBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertSubview:belowSubview:", v8, v10);

      v32 = (void *)MEMORY[0x24BDD1628];
      -[QLPreviewController navigationBarGradientView](self, "navigationBarGradientView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "leadingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "leadingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v42);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v40;
      -[QLPreviewController navigationBarGradientView](self, "navigationBarGradientView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "trailingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v34);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v31;
      -[QLPreviewController navigationBarGradientView](self, "navigationBarGradientView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "topAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2] = v14;
      -[QLPreviewController navigationBarGradientView](self, "navigationBarGradientView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "heightAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToConstant:", 100.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v49[3] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "activateConstraints:", v18);

      -[QLPreviewController toolbarGradientView](self, "toolbarGradientView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewController internalNavigationController](self, "internalNavigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "toolbar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertSubview:belowSubview:", v19, v21);

      v33 = (void *)MEMORY[0x24BDD1628];
      -[QLPreviewController toolbarGradientView](self, "toolbarGradientView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "leadingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "leadingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:", v43);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v41;
      -[QLPreviewController toolbarGradientView](self, "toolbarGradientView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "trailingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "trailingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:", v35);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v22;
      -[QLPreviewController toolbarGradientView](self, "toolbarGradientView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bottomAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bottomAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2] = v26;
      -[QLPreviewController toolbarGradientView](self, "toolbarGradientView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "heightAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToConstant:", 100.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v48[3] = v29;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "activateConstraints:", v30);

    }
  }
}

- (void)_uninstallGradientViews
{
  -[UIView removeFromSuperview](self->_navigationBarGradientView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_toolbarGradientView, "removeFromSuperview");
}

- (void)_updateBarTintColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController internalNavigationController](self, "internalNavigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v3);

    -[QLPreviewController _installGradientViewsIfNeeded](self, "_installGradientViewsIfNeeded");
  }
  else if (-[QLPreviewController presentationMode](self, "presentationMode") == 2)
  {
    -[QLPreviewController navigationBarTintColor](self, "navigationBarTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController internalNavigationController](self, "internalNavigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v6);

    -[QLPreviewController toolbarTintColor](self, "toolbarTintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController toolbarController](self, "toolbarController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBarTintColor:", v9);

    -[QLPreviewController _uninstallGradientViews](self, "_uninstallGradientViews");
  }
  else if (-[QLPreviewController presentationMode](self, "presentationMode"))
  {
    -[QLPreviewController internalNavigationController](self, "internalNavigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", 0);

    -[QLPreviewController toolbarController](self, "toolbarController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBarTintColor:", 0);

    -[QLPreviewController _uninstallGradientViews](self, "_uninstallGradientViews");
    if (_updateBarTintColors_onceToken != -1)
      dispatch_once(&_updateBarTintColors_onceToken, &__block_literal_global_268);
  }
  -[QLPreviewController _updateBarGradientOpacity](self, "_updateBarGradientOpacity");
}

void __43__QLPreviewController__updateBarTintColors__block_invoke()
{
  NSObject **v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = (NSObject **)MEMORY[0x24BE7BF48];
  v1 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v1 = *v0;
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_20D4F5000, v1, OS_LOG_TYPE_DEFAULT, "Warning: setNavigationBarTintColor:; and setToolbarTintColor:; are only supported when QuickLook is being presente"
      "d modally. #Support",
      v2,
      2u);
  }
}

- (void)_updateBackgroundColor
{
  QLRunInMainThread();
}

void __45__QLPreviewController__updateBackgroundColor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "currentAnimator");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "currentAnimator"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "transitionState"),
        v4,
        v3,
        v5 == 2))
  {
    objc_msgSend(*(id *)(a1 + 32), "_preferredBackgroundColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "hostViewControllerBackgroundColorChanged:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_updateBarGradientOpacity");

  }
}

- (void)_updateBarGradientOpacity
{
  double v3;
  double v4;

  if (-[QLPreviewController fullScreen](self, "fullScreen"))
    v3 = 0.0;
  else
    v3 = 1.0;
  -[QLPreviewController setNavigationBarGradientAlpha:](self, "setNavigationBarGradientAlpha:", v3);
  if (-[QLPreviewController fullScreen](self, "fullScreen"))
    v4 = 0.0;
  else
    v4 = 1.0;
  -[QLPreviewController setToolbarGradientAlpha:](self, "setToolbarGradientAlpha:", v4);
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;

  -[QLPreviewController currentAnimator](self, "currentAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[QLPreviewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  return v3 == 0;
}

- (void)setNavigationBarShouldBeChromeless:(BOOL)a3
{
  if (self->_navigationBarShouldBeChromeless != a3)
  {
    self->_navigationBarShouldBeChromeless = a3;
    QLRunInMainThread();
  }
}

uint64_t __58__QLPreviewController_setNavigationBarShouldBeChromeless___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateChromelessBars");
}

- (void)setToolbarShouldBeChromeless:(BOOL)a3
{
  if (self->_toolbarShouldBeChromeless != a3)
  {
    self->_toolbarShouldBeChromeless = a3;
    QLRunInMainThread();
  }
}

uint64_t __52__QLPreviewController_setToolbarShouldBeChromeless___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateChromelessBars");
}

- (void)updateChromelessBars
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_navigationBarShouldBeChromeless)
    v3 = 0.0;
  else
    v3 = 1.0;
  -[QLPreviewController _topViewController](self, "_topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setManualScrollEdgeAppearanceProgress:", v3);

  -[QLPreviewController _topViewController](self, "_topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setManualScrollEdgeAppearanceEnabled:", 1);

  if (self->_toolbarShouldBeChromeless)
    v8 = 0.0;
  else
    v8 = 1.0;
  -[QLPreviewController toolbarController](self, "toolbarController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "customToolbar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v8);

  if (self->_toolbarShouldBeChromeless)
    v12 = 0.0;
  else
    v12 = 1.0;
  -[QLPreviewController toolbarController](self, "toolbarController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "originalToolbar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_backgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", v12);

}

- (void)previewCollectionUpdatePreviewItem:(int64_t)a3
{
  QLRunInMainThread();
}

uint64_t __58__QLPreviewController_previewCollectionUpdatePreviewItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCurrentPreviewItemIndex:updatePreview:animated:", *(_QWORD *)(a1 + 40), 0, 0);
}

- (void)previewCollectionPrefersWhitePointAdaptivityStyle:(int64_t)a3
{
  QLRunInMainThread();
}

void __73__QLPreviewController_previewCollectionPrefersWhitePointAdaptivityStyle___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "transitionCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (NSObject **)MEMORY[0x24BE7BF48];
  v4 = *MEMORY[0x24BE7BF48];
  if (v2)
  {
    if (!v4)
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = v4;
      _UIStringFromWhitePointAdaptivityStyle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_INFO, "Harmony: Skipping setting white point adaptivity style to '%@', since view controller transition seems to be in progress. #Harmony", buf, 0xCu);

    }
  }
  else
  {
    if (!v4)
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = v4;
      _UIStringFromWhitePointAdaptivityStyle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_INFO, "Harmony: Will set style to '%@' – no transition seems to be in progress. #Harmony", buf, 0xCu);

    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __73__QLPreviewController_previewCollectionPrefersWhitePointAdaptivityStyle___block_invoke_271;
    v10[3] = &unk_24C724CD0;
    v9 = *(_QWORD *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v9;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v10, 0.3);
  }
}

uint64_t __73__QLPreviewController_previewCollectionPrefersWhitePointAdaptivityStyle___block_invoke_271(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPreferredWhitePointAdaptivityStyle:", *(_QWORD *)(a1 + 40));
}

- (void)setFullScreen:(BOOL)a3
{
  QLRunInMainThread();
}

uint64_t __37__QLPreviewController_setFullScreen___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFullScreen:animated:force:", *(unsigned __int8 *)(a1 + 40), 1, 0);
}

- (void)setScreenEdgePanWidth:(double)a3
{
  QLRunInMainThread();
}

uint64_t __45__QLPreviewController_setScreenEdgePanWidth___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "setScreenEdgePanWidth:", *(double *)(a1 + 40));
  return result;
}

- (void)setAccessoryViewVisible:(BOOL)a3
{
  QLRunInMainThread();
}

uint64_t __47__QLPreviewController_setAccessoryViewVisible___block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __47__QLPreviewController_setAccessoryViewVisible___block_invoke_2;
  v2[3] = &unk_24C724CF8;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v2, 0.2);
}

void __47__QLPreviewController_setAccessoryViewVisible___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "toolbarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessoryViewHidden:", *(_BYTE *)(a1 + 40) == 0);

  objc_msgSend(*(id *)(a1 + 32), "toolbarController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateLayout");

}

- (void)setPrinter:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInBackgroundThread();

}

void __34__QLPreviewController_setPrinter___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  v2 = objc_opt_respondsToSelector();
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __34__QLPreviewController_setPrinter___block_invoke_2;
    v9[3] = &unk_24C724D20;
    v9[4] = &v10;
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;
  if (v11[5])
  {
    v6 = (NSObject **)MEMORY[0x24BE7BF48];
    v7 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v11[5];
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_ERROR, "Error getting the printer proxy (%@) #Generic", buf, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1240), v4);
  }

  _Block_object_dispose(&v10, 8);
}

void __34__QLPreviewController_setPrinter___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)updateOverlayButtonsAnimated:(BOOL)a3 buttons:(id)a4 excludedButtonIdentifiers:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  NSArray *previewToolbarButtons;
  NSArray *v21;
  NSArray *excludedToolbarButtonIdentifiers;
  NSArray *v23;
  _BOOL4 v24;
  id obj;
  NSArray *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v24 = a3;
  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v23 = (NSArray *)a5;
  v26 = (NSArray *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v12 = self->_previewToolbarButtons;
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (!v13)
        {

LABEL_18:
          v15 = v11;
          goto LABEL_19;
        }
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v29 != v16)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
            if (objc_msgSend(v18, "isEqual:", v11))
            {
              v19 = v18;

              v15 = v19;
            }
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v14);

        if (!v15)
          goto LABEL_18;
LABEL_19:
        -[NSArray addObject:](v26, "addObject:", v15);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v8);
  }

  previewToolbarButtons = self->_previewToolbarButtons;
  self->_previewToolbarButtons = v26;
  v21 = v26;

  excludedToolbarButtonIdentifiers = self->_excludedToolbarButtonIdentifiers;
  self->_excludedToolbarButtonIdentifiers = v23;

  -[QLPreviewController updateOverlayAnimated:forceRefresh:](self, "updateOverlayAnimated:forceRefresh:", v24, 1);
}

- (void)_updateOverlayButtonsForTraitCollection:(id)a3 animated:(BOOL)a4
{
  QLPreviewCollectionProtocol *previewCollection;
  _QWORD v5[5];
  BOOL v6;

  previewCollection = self->_previewCollection;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__QLPreviewController__updateOverlayButtonsForTraitCollection_animated___block_invoke;
  v5[3] = &unk_24C724D70;
  v5[4] = self;
  v6 = a4;
  -[QLPreviewCollectionProtocol toolbarButtonsForTraitCollection:withCompletionHandler:](previewCollection, "toolbarButtonsForTraitCollection:withCompletionHandler:", a3, v5);
}

void __72__QLPreviewController__updateOverlayButtonsForTraitCollection_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a2;
  v7 = a3;
  v5 = v7;
  v6 = v4;
  QLRunInMainThread();

}

uint64_t __72__QLPreviewController__updateOverlayButtonsForTraitCollection_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOverlayButtonsAnimated:buttons:excludedButtonIdentifiers:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)updateOverlayButtons:(BOOL)a3
{
  QLRunInMainThread();
}

void __44__QLPreviewController_updateOverlayButtons___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateOverlayButtonsForTraitCollection:animated:", v3, *(unsigned __int8 *)(a1 + 40));

}

- (void)openURLIfAllowed:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject **v14;
  NSObject *v15;
  uint8_t buf[16];

  v4 = a3;
  -[QLPreviewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || (-[QLPreviewController delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[QLPreviewController currentPreviewItem](self, "currentPreviewItem"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "previewController:shouldOpenURL:forPreviewItem:", self, v4, v8),
        v8,
        v7,
        v9))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v4, "isTelephonyURL"))
      {
        gotLoadHelper_x8__OBJC_CLASS___TUDialRequest(v10);
        v12 = (void *)objc_msgSend(objc_alloc(*(Class *)(v11 + 2512)), "initWithURL:", v4);
        objc_msgSend(v12, "setShowUIPrompt:", 1);
        objc_msgSend(v12, "URL");
        v13 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v13;
      }
    }
    else
    {
      v14 = (NSObject **)MEMORY[0x24BE7BF48];
      v15 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v15 = *v14;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D4F5000, v15, OS_LOG_TYPE_ERROR, "-[NSURL isTelephonyURL] is not available from TelephonyUtilities #Generic", buf, 2u);
      }
    }
    if (v4)
    {
      v4 = v4;
      QLRunInMainThread();

    }
  }

}

uint64_t __40__QLPreviewController_openURLIfAllowed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptUserAndOpenURLIfNeeded:", *(_QWORD *)(a1 + 40));
}

- (void)_promptUserAndOpenURLIfNeeded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ql_applicationName");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (__CFString *)v6;
  else
    v7 = CFSTR("current application");
  v8 = (void *)MEMORY[0x24BDD17C8];
  QLLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v4, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD3A8];
  QLLocalizedStringWithDefaultValue();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v16);

  v17 = (void *)MEMORY[0x24BEBD3A8];
  QLLocalizedStringWithDefaultValue();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __53__QLPreviewController__promptUserAndOpenURLIfNeeded___block_invoke;
  v21[3] = &unk_24C7249A8;
  v22 = v4;
  v19 = v4;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v20);

  -[QLPreviewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

void __53__QLPreviewController__promptUserAndOpenURLIfNeeded___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:options:completionHandler:", *(_QWORD *)(a1 + 32), MEMORY[0x24BDBD1B8], 0);

}

- (void)showShareSheet
{
  QLRunInMainThread();
}

uint64_t __37__QLPreviewController_showShareSheet__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showShareSheetFromBarButton:", 0);
}

- (void)showShareSheetWithPopoverTracker:(id)a3 customSharedURL:(id)a4 dismissCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a3;
  v11 = a4;
  v12 = a5;
  v8 = v12;
  v9 = v11;
  v10 = v7;
  QLRunInMainThread();

}

uint64_t __90__QLPreviewController_showShareSheetWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showShareSheetFromRemoteViewWithPopoverTracker:customSharedURL:dismissCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)triggerQuickLookDismissal
{
  QLRunInMainThread();
}

uint64_t __48__QLPreviewController_triggerQuickLookDismissal__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissQuickLook");
}

- (id)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userActivity, a3);
}

- (void)getStateRestorationUserInfo:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

void __51__QLPreviewController_getStateRestorationUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)updateStateRestorationWithUserInfo:(id)a3
{
  NSUserActivity *userActivity;
  id v5;
  void *v6;
  NSUserActivity *v7;
  NSUserActivity *v8;
  id v9;

  v9 = a3;
  userActivity = self->_userActivity;
  if (userActivity)
  {
    -[NSUserActivity userInfo](userActivity, "userInfo");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v9;
    if (v5 == v9)
      goto LABEL_6;
  }
  else
  {
    v7 = (NSUserActivity *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1598]), "initWithActivityType:", CFSTR("com.apple.quicklookGenericActivityType"));
    v8 = self->_userActivity;
    self->_userActivity = v7;

  }
  -[NSUserActivity setUserInfo:](self->_userActivity, "setUserInfo:", v9);
  v6 = v9;
LABEL_6:

}

- (void)_dismissQuickLookFromKeyboardCommand
{
  QLRunInMainThread();
}

uint64_t __59__QLPreviewController__dismissQuickLookFromKeyboardCommand__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissQuickLook");
}

- (void)updateKeyCommands
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  QLPreviewCollectionProtocol *previewCollection;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  char v20;
  id location;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3E8], 0, sel__previousPreview);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  QLLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDiscoverabilityTitle:", v4);

  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3F0], 0, sel__nextPreview);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  QLLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDiscoverabilityTitle:", v6);

  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("w"), 0x100000, sel__dismissQuickLookFromKeyboardCommand);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  QLLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDiscoverabilityTitle:", v8);

  objc_msgSend(MEMORY[0x24BE7BFA8], "keyCommandWithKeyCommand:identifier:", v3, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  objc_msgSend(MEMORY[0x24BE7BFA8], "keyCommandWithKeyCommand:identifier:", v5, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  objc_msgSend(MEMORY[0x24BE7BFA8], "keyCommandWithKeyCommand:identifier:", v7, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLPreviewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_opt_respondsToSelector();

  objc_initWeak(&location, self);
  v14 = v9 & 1;
  previewCollection = self->_previewCollection;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __40__QLPreviewController_updateKeyCommands__block_invoke;
  v17[3] = &unk_24C724E10;
  v20 = v14;
  v17[4] = self;
  v16 = v12;
  v18 = v16;
  objc_copyWeak(&v19, &location);
  -[QLPreviewCollectionProtocol keyCommandsWithCompletionHandler:](previewCollection, "keyCommandsWithCompletionHandler:", v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __40__QLPreviewController_updateKeyCommands__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  char v6;

  v3 = a2;
  v6 = *(_BYTE *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  QLRunInMainThread();
  objc_destroyWeak(&v5);

}

void __40__QLPreviewController_updateKeyCommands__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id WeakRetained;
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v25 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v31 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v6, "keyCommand");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x24BEBD6B8];
        objc_msgSend(v7, "input");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "keyCommandWithInput:modifierFlags:action:", v9, objc_msgSend(v7, "modifierFlags"), sel__keyCommandWasPerformed_);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "discoverabilityTitle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setDiscoverabilityTitle:", v11);

        if (!*(_BYTE *)(a1 + 64)
          || (objc_msgSend(*(id *)(a1 + 40), "delegate"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v12, "previewController:shouldAllowKeyCommandWithIdentifier:", *(_QWORD *)(a1 + 40), objc_msgSend(v6, "keyCommandIdentifier")), v12, v13))
        {
          objc_msgSend(v25, "setObject:forKey:", v6, v10);
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v3);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = *(id *)(a1 + 48);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        if (*(_BYTE *)(a1 + 64))
        {
          objc_msgSend(*(id *)(a1 + 40), "delegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "previewController:shouldAllowKeyCommandWithIdentifier:", *(_QWORD *)(a1 + 40), objc_msgSend(v19, "keyCommandIdentifier"));

          if (!v21)
            continue;
        }
        objc_msgSend(v19, "keyCommand");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v19, v22);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v16);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setPreviewKeyCommands:", v25);

}

- (void)handleKeyPressWithInput:(id)a3 modifierFlags:(int64_t)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  QLRunInMainThread();

}

void __61__QLPreviewController_handleKeyPressWithInput_modifierFlags___block_invoke(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject **v16;
  uint64_t v17;
  uint64_t v18;
  NSObject **v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  char *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "hasEditedItems"))
  {
    v2 = (NSObject **)MEMORY[0x24BE7BF48];
    v3 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v33 = v4;
      v34 = 2048;
      v35 = v5;
      v6 = "Host will not perform key press unhandled in service because there are remote unsaved edits (input: %@, modif"
           "ier flags: %ld) #PreviewController";
LABEL_21:
      _os_log_impl(&dword_20D4F5000, v3, OS_LOG_TYPE_INFO, v6, buf, 0x16u);
    }
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "keyCommands", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v12, "input");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 40)))
          {
            v14 = objc_msgSend(v12, "modifierFlags");
            v15 = *(_QWORD *)(a1 + 48);

            if (v14 == v15)
            {
              v19 = (NSObject **)MEMORY[0x24BE7BF48];
              v20 = *MEMORY[0x24BE7BF48];
              if (!*MEMORY[0x24BE7BF48])
              {
                QLSInitLogging();
                v20 = *v19;
              }
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                v21 = *(_QWORD *)(a1 + 40);
                v22 = *(_QWORD *)(a1 + 48);
                v23 = v20;
                objc_msgSend(v12, "description");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v33 = v21;
                v34 = 2048;
                v35 = v22;
                v36 = 2112;
                v37 = v24;
                _os_log_impl(&dword_20D4F5000, v23, OS_LOG_TYPE_INFO, "Host can perform key press unhandled in service (input: %@, modifier flags: %ld) with key command (%@) #PreviewController", buf, 0x20u);

              }
              objc_msgSend(v12, "action");
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v25 = (char *)objc_msgSend(v12, "action");
                v26 = *(void **)(a1 + 32);
                v27 = objc_msgSend(v12, "action");
                if (v25 == sel__keyCommandWasPerformed_)
                  objc_msgSend(v26, "performSelector:withObject:", v27, v12);
                else
                  objc_msgSend(v26, "performSelector:", v27);
              }

              return;
            }
          }
          else
          {

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        if (v9)
          continue;
        break;
      }
    }

    v16 = (NSObject **)MEMORY[0x24BE7BF48];
    v3 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v3 = *v16;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v33 = v17;
      v34 = 2048;
      v35 = v18;
      v6 = "Key press unhandled in service cannot be handled by the host either: (input: %@, modifier flags: %ld) #PreviewController";
      goto LABEL_21;
    }
  }
}

- (void)remoteViewControllerWasInvalidated
{
  NSObject **v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSDate *lastCrashTimeStamp;
  double v8;
  NSDate *v9;
  NSDate *v10;
  QLPreviewCollectionProtocol *previewCollection;
  dispatch_time_t v12;
  unint64_t numberOfRetries;
  NSDate *v14;
  NSDate *v15;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = (NSObject **)MEMORY[0x24BE7BF48];
  v4 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_INFO, "Host was notified of remoteViewControllerWasInvalidated #Generic", buf, 2u);
  }
  -[QLPreviewController setFullScreen:](self, "setFullScreen:", 0);
  -[QLPreviewController previewCollection](self, "previewCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isAvailable") & 1) != 0)
    goto LABEL_8;
  -[QLPreviewController currentAnimator](self, "currentAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[QLPreviewController currentAnimator](self, "currentAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tearDownTransition:", 1);
LABEL_8:

  }
  self->_previewCollectionNeedsConfiguration = 1;
  -[QLPreviewController setCanChangeCurrentPage:](self, "setCanChangeCurrentPage:", 1);
  lastCrashTimeStamp = self->_lastCrashTimeStamp;
  if (!lastCrashTimeStamp || (-[NSDate timeIntervalSinceNow](lastCrashTimeStamp, "timeIntervalSinceNow"), v8 < -10.0))
  {
    self->_numberOfRetries = 0;
LABEL_12:
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v10 = self->_lastCrashTimeStamp;
    self->_lastCrashTimeStamp = v9;

    -[QLPreviewController _removePreviewCollectionFromViewHierarchy](self, "_removePreviewCollectionFromViewHierarchy");
    previewCollection = self->_previewCollection;
    self->_previewCollection = 0;

    v12 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__QLPreviewController_remoteViewControllerWasInvalidated__block_invoke;
    block[3] = &unk_24C724B00;
    block[4] = self;
    dispatch_after(v12, MEMORY[0x24BDAC9B8], block);
    return;
  }
  numberOfRetries = self->_numberOfRetries;
  if (numberOfRetries <= 2)
  {
    self->_numberOfRetries = numberOfRetries + 1;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v15 = self->_lastCrashTimeStamp;
  self->_lastCrashTimeStamp = v14;

}

uint64_t __57__QLPreviewController_remoteViewControllerWasInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentPreviewCollection");
}

- (void)beginInteractiveTransition
{
  QLRunInMainThread();
}

void __49__QLPreviewController_beginInteractiveTransition__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject **v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject **v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "currentAnimator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

LABEL_4:
    v4 = (NSObject **)MEMORY[0x24BE7BF48];
    v5 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(void **)(a1 + 32);
      v7 = v5;
      objc_msgSend(v6, "currentAnimator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_ERROR, "beginInteractiveTransition can't be initiated (currentAnimator: %@, presentedViewController: %@) #AppearanceTransition", (uint8_t *)&v20, 0x16u);

    }
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentAnimator:", v10);

  v11 = (NSObject **)MEMORY[0x24BE7BF48];
  v12 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = *(void **)(a1 + 32);
    v14 = v12;
    objc_msgSend(v13, "currentAnimator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v15;
    _os_log_impl(&dword_20D4F5000, v14, OS_LOG_TYPE_INFO, "beginInteractiveTransition is initiated with new currentAnimator: %@ #AppearanceTransition", (uint8_t *)&v20, 0xCu);

  }
  v16 = objc_msgSend(*(id *)(a1 + 32), "presentationMode");
  v17 = *(void **)(a1 + 32);
  if (v16 == 1)
  {
    objc_msgSend(v17, "internalNavigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "popViewControllerAnimated:", 1);

  }
  else
  {
    objc_msgSend(v17, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)forwardMessage:(id)a3 toItemAtIndex:(unint64_t)a4 withUUID:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v14 = a6;
  v13 = v9;
  v10 = v14;
  v11 = v8;
  v12 = v9;
  QLRunInMainThread();

}

void __79__QLPreviewController_forwardMessage_toItemAtIndex_withUUID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  unsigned __int8 v6;
  int v7;
  NSObject **v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "previewItemAtIndex:", *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalPreviewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40));

  if (objc_msgSend(v3, "conformsToProtocol:", &unk_254A1A9B0))
    v6 = objc_opt_respondsToSelector();
  else
    v6 = 0;
  if (v2)
    v7 = v5;
  else
    v7 = 0;
  if (v7 == 1 && ((objc_msgSend(v2, "previewItemType") == 12) & v6) != 0)
  {
    objc_msgSend(v3, "handleMessageFromCustomExtension:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v8 = (NSObject **)MEMORY[0x24BE7BF48];
    v9 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 64);
      v14 = 138412802;
      v15 = v10;
      v16 = 2112;
      v17 = v2;
      v18 = 2048;
      v19 = v11;
      _os_log_impl(&dword_20D4F5000, v9, OS_LOG_TYPE_ERROR, "Could not forward message %@ to item %@ at index %lu #PreviewController", (uint8_t *)&v14, 0x20u);
    }
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE7C000], 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
}

- (void)expandContentOfItemAtIndex:(unint64_t)a3 withUUID:(id)a4 unarchivedItemsURLWrapper:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  QLRunInMainThread();

}

void __85__QLPreviewController_expandContentOfItemAtIndex_withUUID_unarchivedItemsURLWrapper___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  QLPreviewItemStore *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "presentationMode") == 2
    || objc_msgSend(*(id *)(a1 + 32), "presentationMode") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "previewItemAtIndex:", *(_QWORD *)(a1 + 56));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

    if (v2 && v4 && objc_msgSend(v2, "previewItemType") == 10)
    {
      objc_msgSend(*(id *)(a1 + 32), "setWillTransitionToInternalView:", 1);
      v5 = -[QLPreviewItemStore initWithItemsOfDirectoryAtURL:]([QLPreviewItemStore alloc], "initWithItemsOfDirectoryAtURL:", *(_QWORD *)(a1 + 48));
      -[QLPreviewItemStore setDelegate:](v5, "setDelegate:", *(_QWORD *)(a1 + 32));
      +[QLPreviewController controllerWithItemStore:](QLPreviewController, "controllerWithItemStore:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowInteractiveTransitions:", 0);
      objc_msgSend(v6, "setDidTransitionFromInternalView:", 1);
      objc_msgSend(v6, "setIsContentManaged:", objc_msgSend(*(id *)(a1 + 32), "isContentManaged"));
      objc_msgSend(*(id *)(a1 + 32), "toolbarController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "restoreOriginalToolbar");

      objc_msgSend(*(id *)(a1 + 32), "internalNavigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pushViewController:animated:", v6, 1);

    }
    else
    {
      v9 = (NSObject **)MEMORY[0x24BE7BF48];
      v10 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v10 = *v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 56);
        v12 = 138412546;
        v13 = v2;
        v14 = 2048;
        v15 = v11;
        _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_ERROR, "Could not expand content of item %@ at index %lu #ZIPHandling", (uint8_t *)&v12, 0x16u);
      }
    }

  }
}

- (void)presentAlertControllerForScenario:(int64_t)a3
{
  QLRunInMainThread();
}

void __57__QLPreviewController_presentAlertControllerForScenario___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  if (*(_QWORD *)(a1 + 40))
  {
    v15 = 0;
    v1 = 0;
    v2 = 0;
    goto LABEL_12;
  }
  v4 = (void *)MEMORY[0x24BEBD3A8];
  QLLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7BFB0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "networkState");

  if (v7 == 1)
  {
    objc_msgSend(MEMORY[0x24BE7BFB0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isWifiCapable");

    if (v9)
      MGGetBoolAnswer();
    QLLocalizedString();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BEBD3A8];
    QLLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, &__block_literal_global_363);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (uint64_t)v16;
    if (!v16)
      goto LABEL_11;
  }
  else
  {
    QLLocalizedString();
    v10 = objc_claimAutoreleasedReturnValue();
    v1 = 0;
    if (!v10)
    {
LABEL_11:
      v15 = 0;
      goto LABEL_12;
    }
  }
  v15 = (id)v10;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v10, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v1)
    objc_msgSend(v11, "addAction:", v1);
  objc_msgSend(v12, "addAction:", v2);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v12, 1, 0);

LABEL_12:
}

void __57__QLPreviewController_presentAlertControllerForScenario___block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=ROOT#AIRPLANE_MODE"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

- (void)createTemporaryEditDirectoryForItemAtIndex:(unint64_t)a3 completionHandler:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  QLRunInMainThread();

}

void __84__QLPreviewController_createTemporaryEditDirectoryForItemAtIndex_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "previewItemAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE7BF30], 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v6, 1, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (!v8 || v7)
  {
    if (!v8)
      goto LABEL_9;
LABEL_8:
    v11 = 0;
    goto LABEL_11;
  }
  v9 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_8;

LABEL_9:
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v7, 0, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  if (!v12)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_13;
  }
  v8 = v12;
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_13:
}

- (void)setCanChangeCurrentPage:(BOOL)a3
{
  id v4;
  BOOL v5;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  v5 = a3;
  QLRunInMainThread();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __47__QLPreviewController_setCanChangeCurrentPage___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[1192] = *(_BYTE *)(a1 + 40);

}

- (void)currentPreviewItemViewControllerIsReadyForDisplay
{
  QLRunInMainThread();
}

uint64_t __72__QLPreviewController_currentPreviewItemViewControllerIsReadyForDisplay__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 1154))
  {
    if (!*(_BYTE *)(v1 + 1155))
    {
      *(_BYTE *)(v1 + 1155) = 1;
      return objc_msgSend(*(id *)(result + 32), "_endDelayingPresentation");
    }
  }
  return result;
}

- (void)currentPreviewItemViewControllerHasUnsavedEdits:(BOOL)a3 forItemUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  v9 = a3;
  v7 = v6;
  QLRunInMainThread();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __83__QLPreviewController_currentPreviewItemViewControllerHasUnsavedEdits_forItemUUID___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    if (!WeakRetained[143])
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v7[143];
      v7[143] = v3;

      WeakRetained = v7;
    }
    v5 = (void *)WeakRetained[143];
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v5, "addObject:", v6);
    else
      objc_msgSend(v5, "removeObject:", v6);
    objc_msgSend(*(id *)(a1 + 40), "_updateAllowInteractiveTransitionsIfNeeded");
    objc_msgSend(*(id *)(a1 + 40), "updateDoneButtonMenu");
    WeakRetained = v7;
  }

}

- (BOOL)currentPreviewHasUnsavedEdits
{
  void *v3;
  void *v4;
  NSMutableSet *itemsWithEditsInMemory;
  void *v6;
  char v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  itemsWithEditsInMemory = self->_itemsWithEditsInMemory;
  if (itemsWithEditsInMemory
    && (objc_msgSend(v3, "uuid"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = -[NSMutableSet containsObject:](itemsWithEditsInMemory, "containsObject:", v6),
        v6,
        (v7 & 1) != 0))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_msgSend(v4, "editedCopy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "editedCopy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastSavedEditedCopy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqual:", v11) ^ 1;

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  return v8;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return -[QLPreviewController canChangeCurrentPage](self, "canChangeCurrentPage", a3)
      && !-[QLPreviewController hasEditedItems](self, "hasEditedItems")
      && -[QLPreviewController allowInteractiveTransitions](self, "allowInteractiveTransitions");
}

- (void)_updateAllowInteractiveTransitionsIfNeeded
{
  void *v3;
  char v4;
  uint64_t v5;

  if (-[QLPreviewController _shouldAllowInteractiveTransitions](self, "_shouldAllowInteractiveTransitions"))
  {
    -[QLPreviewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
      v5 = -[QLPreviewController hasEditedItems](self, "hasEditedItems") ^ 1;
    else
      v5 = 1;
    -[QLPreviewController setAllowInteractiveTransitions:](self, "setAllowInteractiveTransitions:", v5);
  }
}

- (BOOL)_shouldAllowInteractiveTransitions
{
  void *v3;
  void *v4;
  QLPreviewController *v5;

  if (-[QLPreviewController presentationMode](self, "presentationMode") == 2)
  {
    -[QLPreviewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootViewController");
    v5 = (QLPreviewController *)objc_claimAutoreleasedReturnValue();

    if (v5 == self)
      return 0;
  }
  if (-[QLPreviewController presentationMode](self, "presentationMode") != 2
    || -[QLPreviewController forceModalPresentation](self, "forceModalPresentation"))
  {
    return 0;
  }
  if (-[QLPreviewController modalPresentationStyle](self, "modalPresentationStyle")
    && -[QLPreviewController modalPresentationStyle](self, "modalPresentationStyle") != 6)
  {
    return -[QLPreviewController modalPresentationStyle](self, "modalPresentationStyle") == 5;
  }
  return 1;
}

- (void)previewItemAtIndex:(unint64_t)a3 wasUpdatedWithLifecycleState:(int64_t)a4 withError:(id)a5
{
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  char v15;
  _BOOL4 v16;
  id v17;

  v17 = a5;
  switch(a4)
  {
    case 0:
      -[QLPreviewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[QLPreviewController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "previewController:willLoadPreviewItemAtIndex:", self, a3);
        goto LABEL_14;
      }
      goto LABEL_15;
    case 1:
      -[QLPreviewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[QLPreviewController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "previewController:didLoadPreviewItemAtIndex:withError:", self, a3, v17);
        goto LABEL_14;
      }
      goto LABEL_15;
    case 2:
      -[QLPreviewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[QLPreviewController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "previewController:willPresentPreviewItemAtIndex:", self, a3);
        goto LABEL_14;
      }
      goto LABEL_15;
    case 3:
      -[QLPreviewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_14;
      v16 = -[QLPreviewController _isQuickLookVisible](self, "_isQuickLookVisible");

      if (v16)
      {
        -[QLPreviewController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "previewController:didPresentPreviewItemAtIndex:", self, a3);
        goto LABEL_14;
      }
      goto LABEL_15;
    case 4:
      -[QLPreviewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_14;
      v13 = -[QLPreviewController _isQuickLookVisible](self, "_isQuickLookVisible");

      if (!v13)
      {
        -[QLPreviewController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "previewController:didDismissPreviewItemAtIndex:", self, a3);
LABEL_14:

      }
LABEL_15:

      return;
    default:
      goto LABEL_15;
  }
}

- (void)updatePreviewItemAtIndex:(unint64_t)a3 editedCopy:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  QLRunInMainThread();

}

uint64_t __77__QLPreviewController_updatePreviewItemAtIndex_editedCopy_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEditCopyOfPreviewItemAtIndex:editedCopy:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)updatePreferredContentSize:(CGSize)a3
{
  QLRunInMainThread();
}

uint64_t __50__QLPreviewController_updatePreferredContentSize___block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;
  double v4;
  _QWORD v6[5];
  __int128 v7;

  result = objc_msgSend(*(id *)(a1 + 32), "preferredContentSize");
  if (v4 != *(double *)(a1 + 40) || v3 != *(double *)(a1 + 48))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50__QLPreviewController_updatePreferredContentSize___block_invoke_2;
    v6[3] = &unk_24C724F90;
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = *(_OWORD *)(a1 + 40);
    return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v6, 0.2);
  }
  return result;
}

uint64_t __50__QLPreviewController_updatePreferredContentSize___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)updateContentFrame:(CGRect)a3
{
  QLRunInMainThread();
}

void __42__QLPreviewController_updateContentFrame___block_invoke(double *a1)
{
  NSObject **v2;
  NSObject *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  NSObject *v8;
  void *v9;
  _OWORD *v10;
  __int128 v11;
  int v12;
  void *v13;
  uint64_t v14;
  CGRect v15;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (NSObject **)MEMORY[0x24BE7BF48];
  v3 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[5];
    v5 = a1[6];
    v6 = a1[7];
    v7 = a1[8];
    v8 = v3;
    v15.origin.x = v4;
    v15.origin.y = v5;
    v15.size.width = v6;
    v15.size.height = v7;
    NSStringFromCGRect(v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_20D4F5000, v8, OS_LOG_TYPE_DEFAULT, "received contentFrameUpdate: %@ #Generic", (uint8_t *)&v12, 0xCu);

  }
  v10 = (_OWORD *)(*((_QWORD *)a1 + 4) + 1160);
  v11 = *(_OWORD *)(a1 + 7);
  *v10 = *(_OWORD *)(a1 + 5);
  v10[1] = v11;
}

- (void)updateTitle:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

uint64_t __35__QLPreviewController_updateTitle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentTitleFromItemViewController:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "updateNavigationTitle");
}

- (void)_reloadDataIfNeeded
{
  if (self->_deferReloadData)
    -[QLPreviewController reloadData](self, "reloadData");
}

- (BOOL)isTopPreviewController
{
  QLPreviewController *v2;
  QLPreviewController *v3;

  v2 = self;
  -[QLPreviewController _topPreviewController](self, "_topPreviewController");
  v3 = (QLPreviewController *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 == v2;

  return (char)v2;
}

- (id)_topPreviewController
{
  void *v3;
  QLPreviewController *v4;
  char isKindOfClass;
  QLPreviewController *v6;
  _BOOL4 v7;
  QLPreviewController *v8;

  -[QLPreviewController internalNavigationController](self, "internalNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (QLPreviewController *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  if ((isKindOfClass & 1) != 0
    || (v7 = -[QLPreviewController _topViewControllerBelongsToHierarchy:](self, "_topViewControllerBelongsToHierarchy:", v4), v6 = self, v7))
  {
    v8 = v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_topViewController
{
  void *v3;
  void *v4;
  id v5;

  -[QLPreviewController internalNavigationController](self, "internalNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || -[QLPreviewController _topViewControllerBelongsToHierarchy:](self, "_topViewControllerBelongsToHierarchy:", v4))
  {
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_topViewControllerBelongsToHierarchy:(id)a3
{
  QLPreviewController *v4;
  QLPreviewController *v5;
  QLPreviewController *WeakRetained;
  BOOL v7;

  v4 = (QLPreviewController *)a3;
  v5 = v4;
  if (v4 == self || (QLPreviewController *)self->_previewCollection == v4)
  {
    v7 = 1;
  }
  else
  {
    WeakRetained = (QLPreviewController *)objc_loadWeakRetained((id *)&self->_modalRootViewController);
    v7 = WeakRetained == v5;

  }
  return v7;
}

- (BOOL)_quickLookWillBecomeVisible
{
  return -[QLPreviewController quickLookVisibility](self, "quickLookVisibility") == 3;
}

- (BOOL)_isQuickLookVisible
{
  return -[QLPreviewController quickLookVisibility](self, "quickLookVisibility") == 2;
}

- (void)_updateAppearance:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  v3 = a3;
  -[QLPreviewController toolbarController](self, "toolbarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if ((objc_msgSend(v5, "isAccessoryViewHidden") & 1) == 0)
  {
    -[QLPreviewController toolbarController](self, "toolbarController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessoryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v6 = v9;

  }
  -[QLPreviewController previewCollection](self, "previewCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaInsets");
  v13 = v6 + v12;

  -[QLPreviewController previewCollection](self, "previewCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeAreaInsets");
  v17 = v16;

  v18 = objc_alloc(MEMORY[0x24BE7BF58]);
  v19 = -[QLPreviewController presentationMode](self, "presentationMode");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_peripheryInsets");
  v25 = (id)objc_msgSend(v18, "initWithTopInset:bottomInset:presentationMode:peripheryInsets:", v19, v17, v13, v21, v22, v23, v24);

  -[QLPreviewCollectionProtocol setAppearance:animated:](self->_previewCollection, "setAppearance:animated:", v25, v3);
}

- (void)_savePreviousNavigationVCState
{
  QLNavigationState *v3;
  QLNavigationState *previousNavigationVCState;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (QLNavigationState *)objc_opt_new();
  previousNavigationVCState = self->_previousNavigationVCState;
  self->_previousNavigationVCState = v3;

  -[QLPreviewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLNavigationState setTranslucentNavigationBar:](self->_previousNavigationVCState, "setTranslucentNavigationBar:", objc_msgSend(v6, "isTranslucent"));

  -[QLPreviewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toolbar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLNavigationState setTranslucentToolbar:](self->_previousNavigationVCState, "setTranslucentToolbar:", objc_msgSend(v8, "isTranslucent"));

  -[QLPreviewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLNavigationState setNavigationBarHidden:](self->_previousNavigationVCState, "setNavigationBarHidden:", objc_msgSend(v9, "isNavigationBarHidden"));

  -[QLPreviewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLNavigationState setToolBarHidden:](self->_previousNavigationVCState, "setToolBarHidden:", objc_msgSend(v10, "isToolbarHidden"));

  -[QLPreviewController navigationController](self, "navigationController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[QLNavigationState setNavigationController:](self->_previousNavigationVCState, "setNavigationController:", v11);

}

+ (BOOL)canPreviewItem:(id)item
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BE7BF88], "itemWithPreviewItem:", item);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canBePreviewed");

  return v4;
}

+ (id)printPageRendererForItem:(id)a3
{
  id v3;
  QLPreviewItemPrinter *v4;

  v3 = a3;
  if (objc_msgSend(v3, "canBePrintedWithCustomPrinter"))
    v4 = -[QLPreviewItemPrinter initWithItem:]([QLPreviewItemPrinter alloc], "initWithItem:", v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)parentIsNavigationController
{
  void *v2;
  char isKindOfClass;

  -[QLPreviewController parentViewController](self, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)showNoDataViewIfNeeded
{
  QLErrorView *v3;
  void *v4;
  QLErrorView *v5;
  QLErrorView *noDataView;
  void *v7;
  void *v8;
  void *v9;
  QLErrorView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  QLErrorView *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  QLErrorView *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  if (!-[QLPreviewController hasItemsToPreview](self, "hasItemsToPreview") && !self->_noDataView)
  {
    v3 = [QLErrorView alloc];
    QLLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[QLErrorView initWithTitle:](v3, "initWithTitle:", v4);
    noDataView = self->_noDataView;
    self->_noDataView = v5;

    -[QLPreviewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:atIndex:", self->_noDataView, 0);

    -[QLErrorView setTranslatesAutoresizingMaskIntoConstraints:](self->_noDataView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[QLPreviewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD1628];
    v10 = self->_noDataView;
    v20 = CFSTR("error");
    v21[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[error]|"), 0, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addConstraints:", v12);

    -[QLPreviewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD1628];
    v15 = self->_noDataView;
    v18 = CFSTR("error");
    v19 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[error]|"), 0, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addConstraints:", v17);

  }
}

- (void)hideNoDataView
{
  QLErrorView *noDataView;

  -[QLErrorView removeFromSuperview](self->_noDataView, "removeFromSuperview");
  noDataView = self->_noDataView;
  self->_noDataView = 0;

}

- (BOOL)hasEditedItems
{
  QLPreviewItemStore *previewItemStore;
  _QWORD v4[5];

  previewItemStore = self->_previewItemStore;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__QLPreviewController_hasEditedItems__block_invoke;
  v4[3] = &unk_24C724FE0;
  v4[4] = self;
  return -[QLPreviewItemStore hasLoadedItemsMatching:](previewItemStore, "hasLoadedItemsMatching:", v4);
}

uint64_t __37__QLPreviewController_hasEditedItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isEdited") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1144);
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", v6);

  }
  return v4;
}

- (id)editedItems
{
  QLPreviewItemStore *previewItemStore;
  _QWORD v4[5];

  previewItemStore = self->_previewItemStore;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__QLPreviewController_editedItems__block_invoke;
  v4[3] = &unk_24C724FE0;
  v4[4] = self;
  -[QLPreviewItemStore loadedItemsMatching:](previewItemStore, "loadedItemsMatching:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __34__QLPreviewController_editedItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isEdited") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1144);
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", v6);

  }
  return v4;
}

- (void)_viewControllerPresentationDidInitiate
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLPreviewController;
  -[QLPreviewController _viewControllerPresentationDidInitiate](&v5, sel__viewControllerPresentationDidInitiate);
  if (!self->_didStartDelayingPresentation)
  {
    -[QLPreviewController presentationController](self, "presentationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "presentationStyle") == 20)
    {

    }
    else
    {
      v4 = objc_msgSend(MEMORY[0x24BEBDB00], "areAnimationsEnabled");

      if (v4)
      {
        -[QLPreviewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 1.0);
        self->_didStartDelayingPresentation = 1;
        self->_didEndDelayingPresentation = 0;
      }
    }
  }
  -[QLPreviewController _reloadDataIfNeeded](self, "_reloadDataIfNeeded");
  -[QLPreviewController _setPresentationMode:](self, "_setPresentationMode:", 2);
}

- (void)reloadData
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t deferredSetIndex;
  int64_t currentPreviewItemIndex;
  int64_t v10;
  void *v11;
  void *v12;

  -[QLPreviewController setCanChangeCurrentPage:](self, "setCanChangeCurrentPage:", 1);
  self->_deferReloadData = 0;
  -[QLPreviewController dataSource](self, "dataSource");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[QLPreviewController dataSource](self, "dataSource"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "numberOfPreviewItemsInPreviewController:", self),
        v5,
        v4,
        v7 = v6 - 1,
        v6 >= 1))
  {
    deferredSetIndex = self->_deferredSetIndex;
    if (deferredSetIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      currentPreviewItemIndex = self->_currentPreviewItemIndex;
      if (currentPreviewItemIndex < v7)
        v7 = self->_currentPreviewItemIndex;
      if (currentPreviewItemIndex == 0x7FFFFFFFFFFFFFFFLL)
        v10 = 0;
      else
        v10 = v7;
    }
    else
    {
      if (deferredSetIndex >= v7)
        v10 = v6 - 1;
      else
        v10 = self->_deferredSetIndex;
      self->_deferredSetIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    self->_currentPreviewItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[QLPreviewController previewItemStore](self, "previewItemStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadWithNumberOfPreviewItems:", v6);

    self->_previewCollectionNeedsConfiguration = 1;
    -[QLPreviewController _setCurrentPreviewItemIndex:updatePreview:animated:](self, "_setCurrentPreviewItemIndex:updatePreview:animated:", v10, 1, 0);
    -[QLPreviewController _presentPreviewCollection](self, "_presentPreviewCollection");
    -[QLPreviewController _configurePreviewCollectionIfNeeded](self, "_configurePreviewCollectionIfNeeded");
    -[QLPreviewController hideNoDataView](self, "hideNoDataView");
  }
  else
  {
    -[QLPreviewController previewItemStore](self, "previewItemStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadWithNumberOfPreviewItems:", 0);

    self->_currentPreviewItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)_refreshCurrentPreviewItemAnimated:(BOOL)a3
{
  if (self->_currentPreviewItemIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[QLPreviewCollectionProtocol setCurrentPreviewItemIndex:animated:](self->_previewCollection, "setCurrentPreviewItemIndex:animated:", -[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex"), a3);
}

- (void)_nextPreview
{
  unint64_t v3;

  v3 = -[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex");
  if (v3 < -[QLPreviewItemStore numberOfItems](self->_previewItemStore, "numberOfItems") - 1)
    -[QLPreviewController _setCurrentPreviewItemIndex:updatePreview:animated:](self, "_setCurrentPreviewItemIndex:updatePreview:animated:", -[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex") + 1, 1, 0);
}

- (void)_previousPreview
{
  if (-[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex") >= 1)
    -[QLPreviewController _setCurrentPreviewItemIndex:updatePreview:animated:](self, "_setCurrentPreviewItemIndex:updatePreview:animated:", -[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex") - 1, 1, 0);
}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
  id v6;
  QLPreviewItemStore *previewItemStore;
  id v8;
  _QWORD v9[4];
  id v10;
  QLPreviewController *v11;

  v6 = a3;
  previewItemStore = self->_previewItemStore;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__QLPreviewController_setPreviewItemDisplayState_onItemAtIndex___block_invoke;
  v9[3] = &unk_24C725008;
  v10 = v6;
  v11 = self;
  v8 = v6;
  -[QLPreviewItemStore previewItemAtIndex:withCompletionHandler:](previewItemStore, "previewItemAtIndex:withCompletionHandler:", a4, v9);

}

void __64__QLPreviewController_setPreviewItemDisplayState_onItemAtIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    objc_msgSend(v9, "setPreviewItemDisplayState:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "previewController:didUpdateDisplayStateOfPreviewItem:", *(_QWORD *)(a1 + 40), v9);

    }
  }

}

- (id)previewItemDisplayStateForItem:(id)a3
{
  return (id)objc_msgSend(a3, "previewItemDisplayState");
}

- (void)applyPreviewItemDisplayState:(id)a3 toItem:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v6, "setPreviewItemDisplayState:", v12);
  v7 = v6;
  if (v7)
  {
    v8 = -[QLPreviewItemStore indexOfPreviewItem:](self->_previewItemStore, "indexOfPreviewItem:", v7);
    -[QLPreviewController previewCollection](self, "previewCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[QLPreviewController previewCollection](self, "previewCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "previewItemDisplayState:wasAppliedToItemAtIndex:", v12, v8);

    }
  }

}

- (void)presentPreviewItem:(id)a3 onViewController:(id)a4 withDelegate:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  QLPreviewItemStore *v17;
  void *v18;
  QLPreviewItemStore *v19;
  QLPreviewItemStore *previewItemStore;
  _QWORD v21[2];

  v6 = a6;
  v21[1] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTintColor:", v14);

  objc_msgSend(MEMORY[0x24BE7BF88], "itemWithPreviewItem:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [QLPreviewItemStore alloc];
  v21[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[QLPreviewItemStore initWithPreviewItems:](v17, "initWithPreviewItems:", v18);
  previewItemStore = self->_previewItemStore;
  self->_previewItemStore = v19;

  -[QLPreviewItemStore setDelegate:](self->_previewItemStore, "setDelegate:", self);
  -[QLPreviewController setDataSource:](self, "setDataSource:", self->_previewItemStore);
  -[QLPreviewController setStrongDelegate:](self, "setStrongDelegate:", v10);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v11, "pushViewController:animated:", self, v6);
  else
    objc_msgSend(v11, "presentViewController:animated:completion:", self, v6, 0);

}

- (void)previewItemAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void (**)(id, void *, void *))a4;
  -[QLPreviewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewController:previewItemAtIndex:", self, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7BF88], "itemWithPreviewItem:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8, v9);

}

- (id)keyCommands
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[NSMutableDictionary allKeys](self->_previewKeyCommands, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__QLPreviewController_keyCommands__block_invoke;
  v6[3] = &unk_24C725030;
  v6[4] = self;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __34__QLPreviewController_keyCommands__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1248);
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v8, "keyCommandIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1248), "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "keyCommandIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "compare:", v12);

  return v13;
}

- (void)_keyCommandWasPerformed:(id)a3
{
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKey:](self->_previewKeyCommands, "objectForKey:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[QLPreviewController previewCollection](self, "previewCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyCommandWasPerformed:", v5);

  }
}

- (void)_setPreferredWhitePointAdaptivityStyle:(int64_t)a3
{
  NSObject **v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int64_t whitePointAdaptivityStyle;
  NSObject *v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  v5 = *MEMORY[0x24BE7BF48];
  if (self->_whitePointAdaptivityStyle == a3)
  {
    if (!v5)
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = v5;
      _UIStringFromWhitePointAdaptivityStyle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      whitePointAdaptivityStyle = self->_whitePointAdaptivityStyle;
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2048;
      v17 = whitePointAdaptivityStyle;
      _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_DEBUG, "No whitepoint adaptivity update required, since requested style matches the current one (%@ [%ld]) #Harmony", buf, 0x16u);

    }
  }
  else
  {
    if (!v5)
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v10 = v5;
      _UIStringFromWhitePointAdaptivityStyle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _UIStringFromWhitePointAdaptivityStyle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_whitePointAdaptivityStyle;
      *(_DWORD *)buf = 138413058;
      v15 = v11;
      v16 = 2048;
      v17 = a3;
      v18 = 2112;
      v19 = v12;
      v20 = 2048;
      v21 = v13;
      _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_DEBUG, "Will request whitepoint adaptivity style update, since requested style (%@ [%ld]) doesn't match the current one (%@ [%ld]) #Harmony", buf, 0x2Au);

    }
    self->_whitePointAdaptivityStyle = a3;
    QLRunInMainThread();
  }
}

uint64_t __62__QLPreviewController__setPreferredWhitePointAdaptivityStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsWhitePointAdaptivityStyleUpdate");
}

- (id)_childViewControllerForWhitePointAdaptivityStyle
{
  void *v3;
  void *v4;
  void *v5;
  QLPreviewController *v6;
  void *v7;

  -[QLPreviewController internalNavigationController](self, "internalNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[QLPreviewController internalNavigationController](self, "internalNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topViewController");
    v6 = (QLPreviewController *)objc_claimAutoreleasedReturnValue();
    if (v6 == self)
    {
      v7 = 0;
    }
    else
    {
      -[QLPreviewController internalNavigationController](self, "internalNavigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)_preferredWhitePointAdaptivityStyle
{
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int64_t whitePointAdaptivityStyle;
  int v9;
  void *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (NSObject **)MEMORY[0x24BE7BF48];
  v4 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = v4;
    _UIStringFromWhitePointAdaptivityStyle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    whitePointAdaptivityStyle = self->_whitePointAdaptivityStyle;
    v9 = 138412546;
    v10 = v6;
    v11 = 2048;
    v12 = whitePointAdaptivityStyle;
    _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_DEBUG, "Setting whitepoint adaptivity style to %@ (%ld) #Harmony", (uint8_t *)&v9, 0x16u);

  }
  return self->_whitePointAdaptivityStyle;
}

- (BOOL)itemStore:(id)a3 canShareItem:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a4;
  -[QLPreviewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originalPreviewItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "previewController:canShareItem:", self, v9);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)itemStore:(id)a3 canEditItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;

  v6 = a4;
  if (-[QLPreviewController itemStore:editedFileBehaviorForItem:](self, "itemStore:editedFileBehaviorForItem:", a3, v6) == 1)
  {
    objc_msgSend(v6, "previewItemURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "previewItemURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "startAccessingSecurityScopedResource");

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "previewItemURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isWritableFileAtPath:", v12);

      if (v9)
      {
        objc_msgSend(v6, "previewItemURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stopAccessingSecurityScopedResource");

        if ((v13 & 1) == 0)
          goto LABEL_12;
      }
      else if (!v13)
      {
LABEL_12:
        v22 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(v6, "fpItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_12;
      objc_msgSend(v6, "fpItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isWritable");

      if ((v17 & 1) == 0)
        goto LABEL_12;
    }
  }
  -[QLPreviewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0)
    goto LABEL_12;
  -[QLPreviewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalPreviewItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "previewController:canEditItem:", self, v21);

LABEL_13:
  return v22;
}

- (BOOL)itemStore:(id)a3 canHandleEditedCopyOfPreviewItem:(id)a4
{
  void *v4;
  char v5;

  -[QLPreviewController delegate](self, "delegate", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  return v5 & 1;
}

- (unint64_t)itemStore:(id)a3 editedFileBehaviorForItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  char v13;
  unint64_t v14;

  v5 = a4;
  -[QLPreviewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v7, "previewController:shouldSaveEditedItem:", self, v5);

    v8 = v8;
  }
  else
  {

    v8 = 0;
  }
  -[QLPreviewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
    v11 = v8 | 2;
  else
    v11 = v8;
  -[QLPreviewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
    v14 = v11 | 4;
  else
    v14 = v11;

  return v14;
}

- (BOOL)itemStore:(id)a3 canMachineReadableCodeBeDetectedInPreviewItem:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[QLPreviewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "previewController:shouldDetectMachineReadableCodeForPreviewItem:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (int64_t)itemStore:(id)a3 editingModeForPreviewItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int64_t v12;
  char v13;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isArchive") & 1) != 0)
    goto LABEL_6;
  -[QLPreviewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  -[QLPreviewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v7, "originalPreviewItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "previewController:editingModeForPreviewItem:", self, v11);

    goto LABEL_9;
  }
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0 || objc_msgSend(v7, "previewItemType") == 1)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  v12 = 4;
  -[QLPreviewController setForceDismissActionsPresentation:](self, "setForceDismissActionsPresentation:", 1);
LABEL_9:
  if (v12 == 1)
  {
    objc_msgSend(v7, "previewItemURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v7, "previewItemURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v20, "startAccessingSecurityScopedResource");

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "previewItemURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = objc_msgSend(v17, "isWritableFileAtPath:", v19);

      if (v16)
      {
        objc_msgSend(v7, "previewItemURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stopAccessingSecurityScopedResource");
LABEL_15:

      }
    }
    else
    {
      objc_msgSend(v7, "fpItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v7, "fpItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = objc_msgSend(v21, "isWritable");
        goto LABEL_15;
      }
    }
    v12 = v20 | -[QLPreviewController itemStore:canHandleEditedCopyOfPreviewItem:](self, "itemStore:canHandleEditedCopyOfPreviewItem:", v6, v7);
  }
LABEL_7:

  return v12;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  id v7;

  v6 = a4;
  -[QLPreviewController previewCollection](self, "previewCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
    self->_willTransitionToInternalView = 0;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return self->_fullScreen;
}

- (BOOL)_adoptPersona:(id)a3 andPerformBlock:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  id v15;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isSystemPersona");
  if (v5 && (v9 & 1) != 0)
  {
    v15 = 0;
    v10 = (void *)objc_msgSend(v8, "copyCurrentPersonaContextWithError:", &v15);
    v11 = v15;
    if (!v11)
    {
      objc_msgSend(v8, "generateAndRestorePersonaContextWithIdentityString:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6);
      if (v12)
        goto LABEL_7;
      objc_msgSend(v8, "restorePersonaWithSavedPersonaContext:", v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v13 = 1;
        goto LABEL_8;
      }
    }
    v12 = v11;
    v6[2](v6);
LABEL_7:

    v13 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v6[2](v6);
  v13 = 0;
LABEL_9:

  return v13;
}

- (void)_toggleDebugView
{
  QLPreviewCollectionProtocol *previewCollection;

  previewCollection = self->_previewCollection;
  if (previewCollection)
    -[QLPreviewCollectionProtocol toggleDebugView](previewCollection, "toggleDebugView");
}

- (id)dataSource
{
  return objc_loadWeakRetained((id *)&self->_dataSource);
}

- (QLPrintingProtocol)printer
{
  return (QLPrintingProtocol *)objc_getProperty(self, a2, 1240, 1);
}

- (NSMutableDictionary)previewKeyCommands
{
  return self->_previewKeyCommands;
}

- (void)setPreviewKeyCommands:(id)a3
{
  objc_storeStrong((id *)&self->_previewKeyCommands, a3);
}

- (UIView)transitionSourceView
{
  return self->_transitionSourceView;
}

- (void)setTransitionSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionSourceView, a3);
}

- (BOOL)canChangeCurrentPage
{
  return self->_canChangeCurrentPage;
}

- (BOOL)overlayHidden
{
  return self->_overlayHidden;
}

- (void)setOverlayHidden:(BOOL)a3
{
  self->_overlayHidden = a3;
}

- (BOOL)fullScreen
{
  return self->_fullScreen;
}

- (BOOL)isInteractivePopEnabled
{
  return self->_isInteractivePopEnabled;
}

- (void)setIsInteractivePopEnabled:(BOOL)a3
{
  self->_isInteractivePopEnabled = a3;
}

- (BOOL)previousStatusBarHidden
{
  return self->_previousStatusBarHidden;
}

- (void)setPreviousStatusBarHidden:(BOOL)a3
{
  self->_previousStatusBarHidden = a3;
}

- (QLPreviewCollectionProtocol)previewCollection
{
  return (QLPreviewCollectionProtocol *)objc_getProperty(self, a2, 1264, 1);
}

- (NSArray)previewToolbarButtons
{
  return (NSArray *)objc_getProperty(self, a2, 1272, 1);
}

- (NSArray)excludedToolbarButtonIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1280, 1);
}

- (QLNavigationState)previousNavigationVCState
{
  return (QLNavigationState *)objc_getProperty(self, a2, 1288, 1);
}

- (void)setInternalNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_internalNavigationController, a3);
}

- (BOOL)willTransitionToInternalView
{
  return self->_willTransitionToInternalView;
}

- (void)setWillTransitionToInternalView:(BOOL)a3
{
  self->_willTransitionToInternalView = a3;
}

- (BOOL)didTransitionFromInternalView
{
  return self->_didTransitionFromInternalView;
}

- (void)setDidTransitionFromInternalView:(BOOL)a3
{
  self->_didTransitionFromInternalView = a3;
}

- (BOOL)allowInteractiveTransitions
{
  return self->_allowInteractiveTransitions;
}

- (QLToolbarController)toolbarController
{
  return self->_toolbarController;
}

- (QLPreviewItemStore)previewItemStore
{
  return (QLPreviewItemStore *)objc_getProperty(self, a2, 1312, 1);
}

- (QLActivityItemProvider)currentItemProvider
{
  return (QLActivityItemProvider *)objc_getProperty(self, a2, 1320, 1);
}

- (void)setCurrentItemProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1320);
}

- (QLCustomURLSharingProxyDelegate)customURLSharingProxyDelegate
{
  return self->_customURLSharingProxyDelegate;
}

- (void)setCustomURLSharingProxyDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_customURLSharingProxyDelegate, a3);
}

- (UIDocumentInteractionController)sharingInteractionController
{
  return (UIDocumentInteractionController *)objc_getProperty(self, a2, 1336, 1);
}

- (void)setSharingInteractionController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1336);
}

- (QLRemotePopoverTracker)shareSheetPopoverTracker
{
  return self->_shareSheetPopoverTracker;
}

- (void)setShareSheetPopoverTracker:(id)a3
{
  objc_storeStrong((id *)&self->_shareSheetPopoverTracker, a3);
}

- (id)shareSheetDismissCompletion
{
  return self->_shareSheetDismissCompletion;
}

- (void)setShareSheetDismissCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1352);
}

- (NSURL)accessedUrlForSharingController
{
  return self->_accessedUrlForSharingController;
}

- (void)setAccessedUrlForSharingController:(id)a3
{
  objc_storeStrong((id *)&self->_accessedUrlForSharingController, a3);
}

- (NSArray)originalLeftBarButtonItems
{
  return (NSArray *)objc_getProperty(self, a2, 1368, 1);
}

- (void)setOriginalLeftBarButtonItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1368);
}

- (NSArray)originalRightBarButtonItems
{
  return (NSArray *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setOriginalRightBarButtonItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1376);
}

- (NSString)currentTitleFromItemViewController
{
  return (NSString *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setCurrentTitleFromItemViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1384);
}

- (QLPreviewControllerDelegate)strongDelegate
{
  return self->_strongDelegate;
}

- (void)setStrongDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_strongDelegate, a3);
}

- (UIPanGestureRecognizer)slideGesture
{
  return (UIPanGestureRecognizer *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setSlideGesture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1400);
}

- (UIPinchGestureRecognizer)pinchGesture
{
  return (UIPinchGestureRecognizer *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setPinchGesture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (UIRotationGestureRecognizer)rotationGesture
{
  return (UIRotationGestureRecognizer *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setRotationGesture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (QLSwipeDownTracker)swipeDownTracker
{
  return (QLSwipeDownTracker *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setSwipeDownTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (QLPinchRotationTracker)pinchRotationTracker
{
  return (QLPinchRotationTracker *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setPinchRotationTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1432);
}

- (QLStateManager)stateManager
{
  return (QLStateManager *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setStateManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1440);
}

- (QLTransitionController)currentAnimator
{
  return (QLTransitionController *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setCurrentAnimator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1448);
}

- (BOOL)canShowToolbar
{
  return self->_canShowToolbar;
}

- (void)setCanShowToolbar:(BOOL)a3
{
  self->_canShowToolbar = a3;
}

- (BOOL)canShowNavBar
{
  return self->_canShowNavBar;
}

- (void)setCanShowNavBar:(BOOL)a3
{
  self->_canShowNavBar = a3;
}

- (BOOL)forceDismissActionsPresentation
{
  return self->_forceDismissActionsPresentation;
}

- (void)setForceDismissActionsPresentation:(BOOL)a3
{
  self->_forceDismissActionsPresentation = a3;
}

- (BOOL)isObtainingEditsFromServiceBeforeDismissing
{
  return self->_isObtainingEditsFromServiceBeforeDismissing;
}

- (void)setIsObtainingEditsFromServiceBeforeDismissing:(BOOL)a3
{
  self->_isObtainingEditsFromServiceBeforeDismissing = a3;
}

- (unint64_t)quickLookVisibility
{
  return self->_quickLookVisibility;
}

- (unint64_t)appearanceActions
{
  return self->_appearanceActions;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void)setPersonaUniqueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1472);
}

- (BOOL)useCustomActionButton
{
  return self->_useCustomActionButton;
}

- (BOOL)alwaysDisplayPreviewItemTitle
{
  return self->_alwaysDisplayPreviewItemTitle;
}

- (void)setAlwaysDisplayPreviewItemTitle:(BOOL)a3
{
  self->_alwaysDisplayPreviewItemTitle = a3;
}

- (BOOL)showActionAsDefaultButton
{
  return self->_showActionAsDefaultButton;
}

- (BOOL)forceModalPresentation
{
  return self->_forceModalPresentation;
}

- (void)setForceModalPresentation:(BOOL)a3
{
  self->_forceModalPresentation = a3;
}

- (NSArray)additionalLeftBarButtonItems
{
  return self->_additionalLeftBarButtonItems;
}

- (NSArray)additionalRightBarButtonItems
{
  return self->_additionalRightBarButtonItems;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(unint64_t)a3
{
  self->_presentationStyle = a3;
}

- (UIColor)toolbarTintColor
{
  return self->_toolbarTintColor;
}

- (UIColor)navigationBarTintColor
{
  return self->_navigationBarTintColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)fullscreenBackgroundColor
{
  return self->_fullscreenBackgroundColor;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (unint64_t)forcedSupportedInterfaceOrientations
{
  return self->_forcedSupportedInterfaceOrientations;
}

- (void)setForcedSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_forcedSupportedInterfaceOrientations = a3;
}

- (NSString)overrideParentApplicationDisplayIdentifier
{
  return self->_overrideParentApplicationDisplayIdentifier;
}

- (void)setOverrideParentApplicationDisplayIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1520);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideParentApplicationDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_additionalLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_currentAnimator, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_pinchRotationTracker, 0);
  objc_storeStrong((id *)&self->_swipeDownTracker, 0);
  objc_storeStrong((id *)&self->_rotationGesture, 0);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_slideGesture, 0);
  objc_storeStrong((id *)&self->_strongDelegate, 0);
  objc_storeStrong((id *)&self->_currentTitleFromItemViewController, 0);
  objc_storeStrong((id *)&self->_originalRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_originalLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_accessedUrlForSharingController, 0);
  objc_storeStrong(&self->_shareSheetDismissCompletion, 0);
  objc_storeStrong((id *)&self->_shareSheetPopoverTracker, 0);
  objc_storeStrong((id *)&self->_sharingInteractionController, 0);
  objc_storeStrong((id *)&self->_customURLSharingProxyDelegate, 0);
  objc_storeStrong((id *)&self->_currentItemProvider, 0);
  objc_storeStrong((id *)&self->_previewItemStore, 0);
  objc_storeStrong((id *)&self->_toolbarController, 0);
  objc_storeStrong((id *)&self->_internalNavigationController, 0);
  objc_storeStrong((id *)&self->_previousNavigationVCState, 0);
  objc_storeStrong((id *)&self->_excludedToolbarButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_previewToolbarButtons, 0);
  objc_storeStrong((id *)&self->_previewCollection, 0);
  objc_storeStrong((id *)&self->_transitionSourceView, 0);
  objc_storeStrong((id *)&self->_previewKeyCommands, 0);
  objc_storeStrong((id *)&self->_printer, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemsWithEditsInMemory, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_destroyWeak((id *)&self->_modalRootViewController);
  objc_storeStrong((id *)&self->_toolbarGradientView, 0);
  objc_storeStrong((id *)&self->_navigationBarGradientView, 0);
  objc_storeStrong((id *)&self->_toolbarTintColor, 0);
  objc_storeStrong((id *)&self->_navigationBarTintColor, 0);
  objc_storeStrong((id *)&self->_fullscreenBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_lastCrashTimeStamp, 0);
  objc_storeStrong((id *)&self->_noDataView, 0);
  objc_storeStrong((id *)&self->_loadingTextForMissingFiles, 0);
  objc_storeStrong((id *)&self->_previewCollectionReadyCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_multiTapDebugGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_listButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

- (BOOL)_isInPickMode
{
  void *v2;
  void *v3;
  BOOL v4;

  -[QLPreviewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "presentationStyle") == 20;
  else
    v4 = 0;

  return v4;
}

- (unint64_t)_computePresentationMode
{
  uint64_t v4;
  void *v5;
  void *v6;

  if (-[QLPreviewController _isInPickMode](self, "_isInPickMode"))
    return 4;
  if (-[QLPreviewController parentIsNavigationController](self, "parentIsNavigationController"))
    return 1;
  if (-[QLPreviewController forceModalPresentation](self, "forceModalPresentation"))
    return 2;
  -[QLPreviewController presentingViewController](self, "presentingViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[QLPreviewController parentViewController](self, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return 2;
  }
  return 3;
}

- (void)registerForScreenshotService
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[QLPreviewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenshotService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrivateDelegate:", self);

}

- (void)unregisterFromScreenshotService
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[QLPreviewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenshotService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrivateDelegate:", 0);

}

- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  QLPreviewPrinter *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject **v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (v5)
  {
    -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController printer](self, "printer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDF6CE0], "sharedPrintController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[QLPreviewPrinter initWithPreviewPrinter:]([QLPreviewPrinter alloc], "initWithPreviewPrinter:", v7);
      objc_msgSend(v8, "setPrintPageRenderer:", v9);

      v10 = (void *)MEMORY[0x24BDBCF48];
      v11 = *MEMORY[0x24BDF84E0];
      objc_msgSend(v6, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_QLTemporaryFileURLWithType:uuid:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __101__QLPreviewController_ScreenshotsSupport__screenshotService_generatePDFRepresentationWithCompletion___block_invoke;
      v17[3] = &unk_24C725650;
      v18 = v6;
      v21 = v5;
      v19 = v7;
      v20 = v13;
      v14 = v13;
      objc_msgSend(v8, "savePDFToURL:showProgress:completionHandler:", v14, 0, v17);

    }
    else
    {
      v15 = (NSObject **)MEMORY[0x24BE7BF48];
      v16 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v16 = *v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_impl(&dword_20D4F5000, v16, OS_LOG_TYPE_INFO, "No printer to print for ScreenshotService for current item: %@. #Printing", buf, 0xCu);
      }
      (*((void (**)(id, _QWORD, _QWORD, double, double, double, double))v5 + 2))(v5, 0, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    }

  }
}

void __101__QLPreviewController_ScreenshotsSupport__screenshotService_generatePDFRepresentationWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject **v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (v7)
  {
    v8 = (NSObject **)MEMORY[0x24BE7BF48];
    v9 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_20D4F5000, v9, OS_LOG_TYPE_ERROR, "Could not print provide print preview to ScreenshotService for item: %@. #Printing", buf, 0xCu);
    }
    (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __101__QLPreviewController_ScreenshotsSupport__screenshotService_generatePDFRepresentationWithCompletion___block_invoke_3;
    v12[3] = &unk_24C725628;
    v11 = *(void **)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v11, "provideCurrentPageAndVisibleRectWithCompletionHandler:", v12);

  }
}

void __101__QLPreviewController_ScreenshotsSupport__screenshotService_generatePDFRepresentationWithCompletion___block_invoke_3(_QWORD *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  NSObject **v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = (NSObject **)MEMORY[0x24BE7BF48];
  v13 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v13 = *v12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = a1[4];
    v17 = 138412290;
    v18 = v14;
    _os_log_impl(&dword_20D4F5000, v13, OS_LOG_TYPE_INFO, "Providing print preview to ScreenshotService for item: %@ #Printing", (uint8_t *)&v17, 0xCu);
  }
  v15 = a1[6];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", a1[5]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, double, double, double, double))(v15 + 16))(v15, v16, a2, a3, a4, a5, a6);

}

- (void)didEditCopyOfPreviewItemAtIndex:(unint64_t)a3 editedCopy:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  QLRunInMainThread();

}

uint64_t __93__QLPreviewController_Editing__didEditCopyOfPreviewItemAtIndex_editedCopy_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didEditCopyOfPreviewItemAtIndex:editedCopy:synchronously:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)didEditCopyOfPreviewItemAtIndex:(unint64_t)a3 editedCopy:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  QLRunInMainThread();

}

uint64_t __75__QLPreviewController_Editing__didEditCopyOfPreviewItemAtIndex_editedCopy___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didEditCopyOfPreviewItemAtIndex:editedCopy:synchronously:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_didEditCopyOfPreviewItemAtIndex:(unint64_t)a3 editedCopy:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  QLPreviewController *v10;
  void (**v11)(_QWORD);
  void *v12;
  QLPreviewController *v13;
  NSInteger v14;
  NSObject **v15;
  NSInteger v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject **v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  QLPreviewController *v28;
  void *v29;
  _QWORD aBlock[4];
  QLPreviewController *v31;
  void (**v32)(_QWORD);
  char v33;
  char v34;
  uint8_t buf[4];
  QLPreviewController *v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  NSInteger v42;
  uint64_t v43;

  v7 = a5;
  v43 = *MEMORY[0x24BDAC8D0];
  v10 = (QLPreviewController *)a4;
  v11 = (void (**)(_QWORD))a6;
  if (v10
    && (-[QLPreviewController url](v10, "url"), v12 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v12,
                                                v12))
  {
    -[QLPreviewController previewItemAtIndex:](self, "previewItemAtIndex:", a3);
    v13 = (QLPreviewController *)objc_claimAutoreleasedReturnValue();
    v14 = -[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex");
    v15 = (NSObject **)MEMORY[0x24BE7BF48];
    if (v14 != a3)
    {
      v16 = v14;
      v17 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v17 = *v15;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v36 = v13;
        v37 = 2048;
        v38 = a3;
        v39 = 2112;
        v40 = (unint64_t)v10;
        v41 = 2048;
        v42 = v16;
        _os_log_impl(&dword_20D4F5000, v17, OS_LOG_TYPE_INFO, "The item (%@) at index n°%lu is about to be updated with an edited copy (%@) but it's not currently previewed. Current preview item index is %lu. #PreviewController", buf, 0x2Au);
      }
    }
    -[QLPreviewController lastSavedEditedCopy](v13, "lastSavedEditedCopy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[QLPreviewController isEqual:](v10, "isEqual:", v18);

    v20 = *v15;
    if (v19)
    {
      if (!v20)
      {
        QLSInitLogging();
        v20 = *v15;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v10;
        v37 = 2048;
        v38 = a3;
        _os_log_impl(&dword_20D4F5000, v20, OS_LOG_TYPE_INFO, "Not saving changes for edited copy %@ of item at index %lu because this version has already been forwarded to the delegate. #PreviewController", buf, 0x16u);
      }
      if (v11)
        v11[2](v11);
    }
    else
    {
      if (!v20)
      {
        QLSInitLogging();
        v20 = *v15;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v36 = v10;
        v37 = 2112;
        v38 = (unint64_t)v13;
        v39 = 2048;
        v40 = a3;
        _os_log_impl(&dword_20D4F5000, v20, OS_LOG_TYPE_INFO, "About to save edited copy (%@) over item (%@) at index %lu #PreviewController", buf, 0x20u);
      }
      -[QLPreviewController setEditedCopy:](v13, "setEditedCopy:", v10);
      -[QLPreviewController setLastSavedEditedCopy:](v13, "setLastSavedEditedCopy:", v10);
      v23 = *v15;
      if (!*v15)
      {
        QLSInitLogging();
        v23 = *v15;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v36 = self;
        v37 = 2112;
        v38 = (unint64_t)v13;
        v39 = 2112;
        v40 = (unint64_t)v10;
        _os_log_impl(&dword_20D4F5000, v23, OS_LOG_TYPE_INFO, "Preview controller: %@ is handling updated item: %@, with updated copy: %@. #PreviewController", buf, 0x20u);
      }
      -[QLPreviewController url](v10, "url");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "startAccessingSecurityScopedResource");

      -[QLPreviewController containerURL](v10, "containerURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "startAccessingSecurityScopedResource");

      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __108__QLPreviewController_Editing___didEditCopyOfPreviewItemAtIndex_editedCopy_synchronously_completionHandler___block_invoke;
      aBlock[3] = &unk_24C7261B8;
      v33 = v25;
      v28 = v10;
      v31 = v28;
      v34 = v27;
      v32 = v11;
      v29 = _Block_copy(aBlock);
      if (-[QLPreviewController editingMode](v13, "editingMode"))
        -[QLPreviewController _handleEditedPreviewItem:editedCopy:synchronously:completionHandler:](self, "_handleEditedPreviewItem:editedCopy:synchronously:completionHandler:", v13, v28, v7, v29);
      else
        -[QLPreviewController _updatePreviewItem:editedCopy:completionHandler:](self, "_updatePreviewItem:editedCopy:completionHandler:", v13, v28, v29);

    }
  }
  else
  {
    v21 = (NSObject **)MEMORY[0x24BE7BF48];
    v22 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v22 = *v21;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v10;
      v37 = 2048;
      v38 = a3;
      _os_log_impl(&dword_20D4F5000, v22, OS_LOG_TYPE_INFO, "Did not receive a valid edited copy (%@) when trying to save edits made to preview item at index: %lu #PreviewController", buf, 0x16u);
    }
    if (v11)
      v11[2](v11);
  }

}

uint64_t __108__QLPreviewController_Editing___didEditCopyOfPreviewItemAtIndex_editedCopy_synchronously_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "url");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stopAccessingSecurityScopedResource");

  }
  if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(*(id *)(a1 + 32), "containerURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopAccessingSecurityScopedResource");

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updatePreviewItem:(id)a3 editedCopy:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject **v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  QLPreviewController *v31;
  void (**v32)(_QWORD);
  uint8_t buf[4];
  QLPreviewController *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  -[QLPreviewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0
    && (-[QLPreviewController delegate](self, "delegate"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "originalPreviewItem"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v13, "previewController:shouldSaveEditedItem:", self, v14),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    -[QLPreviewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[QLPreviewController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "originalPreviewItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "previewController:willSaveEditedItem:", self, v19);

    }
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __80__QLPreviewController_Editing___updatePreviewItem_editedCopy_completionHandler___block_invoke;
    v28[3] = &unk_24C724D98;
    v29 = v8;
    v30 = v9;
    v31 = self;
    v32 = v10;
    objc_msgSend(v29, "prepareSaveURL:", v28);

  }
  else
  {
    -[QLPreviewController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    v22 = (NSObject **)MEMORY[0x24BE7BF48];
    if ((v21 & 1) != 0)
    {
      v23 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v23 = *v22;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = self;
        _os_log_impl(&dword_20D4F5000, v23, OS_LOG_TYPE_INFO, "Preview controller: %@ has notified delegate about the updated contents URL. #PreviewController", buf, 0xCu);
      }
      -[QLPreviewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "url");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "originalPreviewItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "previewController:updatedContentsURL:forEditedItem:", self, v25, v26);

    }
    if (v10)
    {
      v27 = *v22;
      if (!*v22)
      {
        QLSInitLogging();
        v27 = *v22;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = self;
        _os_log_impl(&dword_20D4F5000, v27, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item. #PreviewController", buf, 0xCu);
      }
      v10[2](v10);
    }
  }

}

void __80__QLPreviewController_Editing___updatePreviewItem_editedCopy_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  char v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "saveURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startAccessingSecurityScopedResource");

  v4 = (void *)MEMORY[0x24BDD1568];
  objc_msgSend(*(id *)(a1 + 32), "saveURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writingIntentWithURL:options:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v21[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __80__QLPreviewController_Editing___updatePreviewItem_editedCopy_completionHandler___block_invoke_2;
  v14[3] = &unk_24C7261E0;
  v15 = v6;
  v16 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(void **)(a1 + 56);
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = v3;
  v13 = v6;
  objc_msgSend(v7, "coordinateAccessWithIntents:queue:byAccessor:", v8, v9, v14);

}

void __80__QLPreviewController_Editing___updatePreviewItem_editedCopy_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  if (v3)
    goto LABEL_3;
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v8 = objc_msgSend(v6, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v5, v7, 0, 0, 0, &v18);
  v3 = v18;

  objc_msgSend(*(id *)(a1 + 48), "setOriginalContentWasUpdated:", v8);
  if (v3)
  {
LABEL_3:
    v9 = *v4;
    if (!*v4)
    {
      QLSInitLogging();
      v9 = *v4;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v3;
      _os_log_impl(&dword_20D4F5000, v9, OS_LOG_TYPE_ERROR, "Error while attempting to write to the updated file: %@ #PreviewController", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 56), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 48), "originalPreviewItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "previewController:didFailToSaveEditedItem:withError:", v13, v14, v3);

    }
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v15 = *v4;
    if (!*v4)
    {
      QLSInitLogging();
      v15 = *v4;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_impl(&dword_20D4F5000, v15, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item. #PreviewController", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 48), "saveURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stopAccessingSecurityScopedResource");

  }
}

- (void)_handleEditedPreviewItem:(id)a3 editedCopy:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  QLPreviewController *v18;
  NSObject **v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject **v30;
  NSObject *v31;
  NSObject **v32;
  id v33;
  id v34;
  uint8_t buf[4];
  QLPreviewController *v36;
  uint64_t v37;

  v7 = a5;
  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  v13 = objc_msgSend(v10, "editingMode");
  objc_msgSend(v11, "url");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v15 = *MEMORY[0x24BDBCBE8];
  v33 = 0;
  v16 = objc_msgSend(v14, "getResourceValue:forKey:error:", &v34, v15, &v33);
  v17 = v34;
  v18 = (QLPreviewController *)v33;

  if ((v16 & 1) == 0)
  {
    v19 = (NSObject **)MEMORY[0x24BE7BF48];
    v20 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v18;
      _os_log_impl(&dword_20D4F5000, v20, OS_LOG_TYPE_ERROR, "The content type of the edited copy could not be determined: %@ #PreviewController", buf, 0xCu);
    }
  }
  objc_msgSend(v10, "previewItemContentType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)MEMORY[0x24BDF8238];
    objc_msgSend(v10, "previewItemContentType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "typeWithIdentifier:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0;
    if (v11 && v21)
      v24 = objc_msgSend(v21, "isEqual:", v17);
  }
  else
  {
    v24 = 0;
  }
  if (v13 == 2 || !v24 && (v13 & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      -[QLPreviewController delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "originalPreviewItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "url");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "previewController:didSaveEditedCopyOfPreviewItem:atURL:", self, v28, v29);

    }
    if (v12)
    {
      v30 = (NSObject **)MEMORY[0x24BE7BF48];
      v31 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v31 = *v30;
      }
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        goto LABEL_22;
      *(_DWORD *)buf = 138412290;
      v36 = self;
LABEL_21:
      _os_log_impl(&dword_20D4F5000, v31, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item. #PreviewController", buf, 0xCu);
LABEL_22:
      v12[2](v12);
    }
  }
  else
  {
    if (v13 != 1 && v13 != 3)
    {
      if (!v12)
        goto LABEL_23;
      v32 = (NSObject **)MEMORY[0x24BE7BF48];
      v31 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v31 = *v32;
      }
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        goto LABEL_22;
      *(_DWORD *)buf = 138412290;
      v36 = self;
      goto LABEL_21;
    }
    if (v7)
      -[QLPreviewController _synchronouslyUpdateContentsOfPreviewItem:editedCopy:completionHandler:](self, "_synchronouslyUpdateContentsOfPreviewItem:editedCopy:completionHandler:", v10, v11, v12);
    else
      -[QLPreviewController _asynchronouslyUpdateContentsOfPreviewItem:editedCopy:completionHandler:](self, "_asynchronouslyUpdateContentsOfPreviewItem:editedCopy:completionHandler:", v10, v11, v12);
  }
LABEL_23:

}

- (void)_synchronouslyUpdateContentsOfPreviewItem:(id)a3 editedCopy:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id *v18;
  NSObject **v19;
  NSObject *v20;
  QLPreviewController *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  NSObject **v26;
  NSObject *v27;
  NSObject **v28;
  NSObject *v29;
  void *v30;
  char v31;
  NSObject **v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  __int128 *v40;
  uint64_t *v41;
  id obj;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint8_t buf[4];
  QLPreviewController *v48;
  __int16 v49;
  id v50;
  __int128 v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  objc_msgSend(v8, "saveURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[QLPreviewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[QLPreviewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "originalPreviewItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "previewController:willSaveEditedItem:", self, v15);

    }
    v16 = objc_msgSend(v11, "startAccessingSecurityScopedResource");
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    *(_QWORD *)&v51 = 0;
    *((_QWORD *)&v51 + 1) = &v51;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__7;
    v54 = __Block_byref_object_dispose__7;
    v55 = 0;
    v17 = (void *)objc_opt_new();
    v18 = (id *)(*((_QWORD *)&v51 + 1) + 40);
    obj = *(id *)(*((_QWORD *)&v51 + 1) + 40);
    v35 = MEMORY[0x24BDAC760];
    v36 = 3221225472;
    v37 = __103__QLPreviewController_Editing___synchronouslyUpdateContentsOfPreviewItem_editedCopy_completionHandler___block_invoke;
    v38 = &unk_24C726208;
    v39 = v9;
    v40 = &v51;
    v41 = &v43;
    objc_msgSend(v17, "coordinateWritingItemAtURL:options:error:byAccessor:", v11, 2, &obj, &v35);
    objc_storeStrong(v18, obj);

    objc_msgSend(v8, "setOriginalContentWasUpdated:", *((unsigned __int8 *)v44 + 24), v35, v36, v37, v38);
    if (*((_BYTE *)v44 + 24) && !*(_QWORD *)(*((_QWORD *)&v51 + 1) + 40))
    {
      v28 = (NSObject **)MEMORY[0x24BE7BF48];
      v29 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v29 = *v28;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v48 = self;
        v49 = 2112;
        v50 = v8;
        _os_log_impl(&dword_20D4F5000, v29, OS_LOG_TYPE_INFO, "Preview controller: %@ didUpdateContentsOfPreviewItem:%@. #PreviewController", buf, 0x16u);
      }
      -[QLPreviewController delegate](self, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_opt_respondsToSelector();

      if ((v31 & 1) == 0)
        goto LABEL_25;
      -[QLPreviewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "originalPreviewItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "previewController:didUpdateContentsOfPreviewItem:", self, v25);
    }
    else
    {
      v19 = (NSObject **)MEMORY[0x24BE7BF48];
      v20 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v20 = *v19;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = *(QLPreviewController **)(*((_QWORD *)&v51 + 1) + 40);
        *(_DWORD *)buf = 138412290;
        v48 = v21;
        _os_log_impl(&dword_20D4F5000, v20, OS_LOG_TYPE_ERROR, "Error while attempting to write to the updated file: %@ #PreviewController", buf, 0xCu);
      }
      -[QLPreviewController delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) == 0)
        goto LABEL_25;
      -[QLPreviewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "originalPreviewItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "previewController:didFailToSaveEditedItem:withError:", self, v25, *(_QWORD *)(*((_QWORD *)&v51 + 1) + 40));
    }

LABEL_25:
    if (v10)
    {
      v32 = (NSObject **)MEMORY[0x24BE7BF48];
      v33 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v33 = *v32;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v48 = self;
        _os_log_impl(&dword_20D4F5000, v33, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item. #PreviewController", buf, 0xCu);
      }
      v10[2](v10);
    }
    if (v16)
    {
      objc_msgSend(v8, "saveURL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stopAccessingSecurityScopedResource");

    }
    _Block_object_dispose(&v51, 8);

    _Block_object_dispose(&v43, 8);
    goto LABEL_34;
  }
  if (v10)
  {
    v26 = (NSObject **)MEMORY[0x24BE7BF48];
    v27 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LODWORD(v51) = 138412290;
      *(_QWORD *)((char *)&v51 + 4) = self;
      _os_log_impl(&dword_20D4F5000, v27, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item, because could not obtain URL to save the edited version of the preview. #PreviewController", (uint8_t *)&v51, 0xCu);
    }
    v10[2](v10);
  }
LABEL_34:

}

void __103__QLPreviewController_Editing___synchronouslyUpdateContentsOfPreviewItem_editedCopy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  id obj;

  v3 = (objc_class *)MEMORY[0x24BDD1580];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v5, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v4, v6, 0, 0, 0, &obj);

  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

- (void)_asynchronouslyUpdateContentsOfPreviewItem:(id)a3 editedCopy:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  QLPreviewController *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __104__QLPreviewController_Editing___asynchronouslyUpdateContentsOfPreviewItem_editedCopy_completionHandler___block_invoke;
  v14[3] = &unk_24C726230;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v10;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  objc_msgSend(v13, "prepareSaveURL:", v14);

}

void __104__QLPreviewController_Editing___asynchronouslyUpdateContentsOfPreviewItem_editedCopy_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject **v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  void *v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "saveURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1[5], "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(a1[5], "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = a1[5];
      objc_msgSend(a1[4], "originalPreviewItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "previewController:willSaveEditedItem:", v6, v7);

    }
    objc_msgSend(a1[4], "saveURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "startAccessingSecurityScopedResource");

    v10 = (void *)MEMORY[0x24BDD1568];
    objc_msgSend(a1[4], "saveURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writingIntentWithURL:options:", v11, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_opt_new();
    v29 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_opt_new();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __104__QLPreviewController_Editing___asynchronouslyUpdateContentsOfPreviewItem_editedCopy_completionHandler___block_invoke_18;
    v22[3] = &unk_24C7261E0;
    v23 = v12;
    v24 = a1[6];
    v16 = a1[4];
    v17 = a1[5];
    v25 = v16;
    v26 = v17;
    v27 = a1[7];
    v28 = v9;
    v18 = v12;
    objc_msgSend(v13, "coordinateAccessWithIntents:queue:byAccessor:", v14, v15, v22);

  }
  else if (a1[7])
  {
    v19 = (NSObject **)MEMORY[0x24BE7BF48];
    v20 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = a1[5];
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_log_impl(&dword_20D4F5000, v20, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item, because could not obtain URL to save the edited version of the preview. #PreviewController", buf, 0xCu);
    }
    (*((void (**)(void))a1[7] + 2))();
  }
}

void __104__QLPreviewController_Editing___asynchronouslyUpdateContentsOfPreviewItem_editedCopy_completionHandler___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject **v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v3 && v4)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD1580]);
    objc_msgSend(*(id *)(a1 + 40), "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v8 = objc_msgSend(v6, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v5, v7, 0, 0, 0, &v25);
    v3 = v25;

    objc_msgSend(*(id *)(a1 + 48), "setOriginalContentWasUpdated:", v8);
  }
  v9 = (NSObject **)MEMORY[0x24BE7BF48];
  v10 = *MEMORY[0x24BE7BF48];
  if (v5)
    v11 = v3 == 0;
  else
    v11 = 0;
  if (v11)
  {
    if (!v10)
    {
      QLSInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v18 = *(void **)(a1 + 48);
      v17 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v27 = v17;
      v28 = 2112;
      v29 = v18;
      _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_INFO, "Preview controller: %@ didUpdateContentsOfPreviewItem:%@. #PreviewController", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 56), "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 48), "originalPreviewItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "previewController:didUpdateContentsOfPreviewItem:", v21, v16);
      goto LABEL_20;
    }
  }
  else
  {
    if (!v10)
    {
      QLSInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v5;
      v28 = 2112;
      v29 = v3;
      _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_ERROR, "Error while attempting to write to the updated file: %@ %@ #PreviewController", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 56), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 48), "originalPreviewItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "previewController:didFailToSaveEditedItem:withError:", v15, v16, v3);
LABEL_20:

    }
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v22 = *v9;
    if (!*v9)
    {
      QLSInitLogging();
      v22 = *v9;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v27 = v23;
      _os_log_impl(&dword_20D4F5000, v22, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item. #PreviewController", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 48), "saveURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stopAccessingSecurityScopedResource");

  }
}

- (void)shareableURLForCurrentPreviewItem:(id)a3
{
  id v4;
  void *v5;
  NSInteger v6;
  id *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  NSInteger v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;

  v4 = a3;
  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex");
  if (!v5 || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke;
    v17 = &unk_24C725870;
    v7 = &v18;
    v18 = v4;
    v9 = v4;
    QLRunInMainThread();
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke_2;
    v10[3] = &unk_24C726258;
    v13 = v6;
    v7 = &v11;
    v11 = v5;
    v12 = v4;
    v8 = v4;
    -[QLPreviewController obtainAndUpdateEditedCopyOfCurrentPreviewItem:](self, "obtainAndUpdateEditedCopyOfCurrentPreviewItem:", v10);

  }
}

uint64_t __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (*(_QWORD *)(a1 + 48) == a2)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke_3;
    v6[3] = &unk_24C724DC0;
    v3 = &v8;
    v4 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "prepareShareableURL:", v6);

  }
  else
  {
    v3 = &v5;
    v5 = *(id *)(a1 + 40);
    QLRunInMainThread();
  }

}

void __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;

  v3 = *(id *)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  QLRunInMainThread();

}

void __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "shareableURL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)obtainAndUpdateEditedCopyOfCurrentPreviewItem:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

void __78__QLPreviewController_Editing__obtainAndUpdateEditedCopyOfCurrentPreviewItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "internalCurrentPreviewItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "canBeEdited") && objc_msgSend(v2, "editedFileBehavior")
    || objc_msgSend(v2, "editingMode"))
  {
    objc_msgSend(*(id *)(a1 + 32), "previewCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __78__QLPreviewController_Editing__obtainAndUpdateEditedCopyOfCurrentPreviewItem___block_invoke_2;
      v5[3] = &unk_24C726280;
      v4 = *(void **)(a1 + 40);
      v5[4] = *(_QWORD *)(a1 + 32);
      v6 = v4;
      objc_msgSend(v3, "saveCurrentPreviewEditsSynchronously:withCompletionHandler:", 0, v5);

    }
    else
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemIndex"), 0);
    }

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemIndex"), 0);
  }

}

void __78__QLPreviewController_Editing__obtainAndUpdateEditedCopyOfCurrentPreviewItem___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = *(id *)(a1 + 40);
  v5 = v4;
  QLRunInMainThread();

}

void __78__QLPreviewController_Editing__obtainAndUpdateEditedCopyOfCurrentPreviewItem___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "previewItemAtIndex:", *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "setEditedCopy:");
    v2 = v6;
  }
  v4 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "editedCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v3, v5);

}

- (void)presentSaveToFilesForEditedItems:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "valueForKey:", CFSTR("editedFileURL"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD560]), "initForExportingURLs:asCopy:", v5, 1);
  objc_msgSend(v4, "setDelegate:", self);
  -[QLPreviewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  -[QLPreviewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)updateOverlayAnimated:(BOOL)a3 forceRefresh:(BOOL)a4
{
  -[QLPreviewController updateOverlayAnimated:forceRefresh:withTraitCollection:](self, "updateOverlayAnimated:forceRefresh:withTraitCollection:", a3, a4, 0);
}

- (void)updateOverlayAnimated:(BOOL)a3 forceRefresh:(BOOL)a4 withTraitCollection:(id)a5
{
  -[QLPreviewController updateOverlayAnimated:animatedButtons:forceRefresh:withTraitCollection:](self, "updateOverlayAnimated:animatedButtons:forceRefresh:withTraitCollection:", a3, a3, a4, a5);
}

- (void)updateOverlayAnimated:(BOOL)a3 animatedButtons:(BOOL)a4 forceRefresh:(BOOL)a5 withTraitCollection:(id)a6
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  char v24;
  uint64_t v25;
  void (**v26)(_QWORD);
  void *v27;
  BOOL v28;
  void (**v29)(void *, uint64_t);
  _QWORD v30[5];
  _QWORD aBlock[5];
  char v32;
  BOOL v33;
  BOOL v34;
  id v35;

  v6 = a3;
  v8 = a6;
  if (!-[QLPreviewController isTopPreviewController](self, "isTopPreviewController"))
    goto LABEL_25;
  if (!v8)
  {
    -[QLPreviewController traitCollection](self, "traitCollection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v35 = 0;
  -[QLPreviewController _updateOverlayButtonsIfNeededWithTraitCollection:animated:updatedToolbarButtons:](self, "_updateOverlayButtonsIfNeededWithTraitCollection:animated:updatedToolbarButtons:", v8, v6, &v35);
  v9 = v35;
  -[QLPreviewController internalNavigationController](self, "internalNavigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v16 = *MEMORY[0x24BDBF148];
  v17 = *(double *)(MEMORY[0x24BDBF148] + 8);

  if (v13 != v16 || v15 != v17)
  {
    -[QLPreviewController internalNavigationController](self, "internalNavigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNeedsLayout");

    -[QLPreviewController internalNavigationController](self, "internalNavigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutIfNeeded");

  }
  -[QLPreviewController updateStatusBarAnimated:](self, "updateStatusBarAnimated:", v6);
  -[QLPreviewController _updateBarTintColors](self, "_updateBarTintColors");
  v23 = !-[QLPreviewController _isToolbarVisibleForTraitCollection:](self, "_isToolbarVisibleForTraitCollection:", v8)
     || -[QLPreviewController fullScreen](self, "fullScreen")
     || !-[QLPreviewController canShowToolbar](self, "canShowToolbar")
     || objc_msgSend(v9, "count") == 0;
  if (-[QLPreviewController fullScreen](self, "fullScreen"))
    v24 = 1;
  else
    v24 = !-[QLPreviewController canShowNavBar](self, "canShowNavBar");
  v25 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__QLPreviewController_Overlay__updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection___block_invoke;
  aBlock[3] = &unk_24C7268A8;
  aBlock[4] = self;
  v32 = v24;
  v33 = v6;
  v34 = v23;
  v26 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[QLPreviewController toolbarController](self, "toolbarController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v27, "isHidden"))
    goto LABEL_20;
  v28 = -[QLPreviewController fullScreen](self, "fullScreen");

  if (!v28)
  {
    -[QLPreviewController toolbarController](self, "toolbarController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setToolbarAlpha:", 1.0);
LABEL_20:

  }
  v30[0] = v25;
  v30[1] = 3221225472;
  v30[2] = __103__QLPreviewController_Overlay__updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection___block_invoke_3;
  v30[3] = &unk_24C724B28;
  v30[4] = self;
  v29 = (void (**)(void *, uint64_t))_Block_copy(v30);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v26, v29, 0.2, 0.0);
  }
  else
  {
    v26[2](v26);
    v29[2](v29, 1);
  }
  -[QLPreviewController updateNavigationTitle](self, "updateNavigationTitle");
  -[QLPreviewController _updateAppearance:](self, "_updateAppearance:", v6);

LABEL_25:
}

void __103__QLPreviewController_Overlay__updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];

  objc_msgSend(*(id *)(a1 + 32), "internalNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNavigationBarHidden:animated:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));

  objc_msgSend(*(id *)(a1 + 32), "internalNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToolbarHidden:animated:", *(unsigned __int8 *)(a1 + 42), *(unsigned __int8 *)(a1 + 41));

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __103__QLPreviewController_Overlay__updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection___block_invoke_2;
  v28[3] = &unk_24C724B00;
  v28[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v28);
  if ((objc_msgSend(*(id *)(a1 + 32), "fullScreen") & 1) != 0
    || !objc_msgSend(*(id *)(a1 + 32), "hasItemsToPreview"))
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "canShowToolbar") ^ 1;
  }
  v5 = *(unsigned __int8 *)(a1 + 42);
  if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(*(id *)(a1 + 32), "toolbarController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isHidden");

    if ((_DWORD)v4 != v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "toolbarController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "originalToolbar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_removeAllAnimations:", 1);

      objc_msgSend(*(id *)(a1 + 32), "toolbarController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "originalToolbar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentationLayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(*(id *)(a1 + 32), "toolbarController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "originalToolbar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFrame:", v15, v17, v19, v21);

    }
  }
  if (v5)
    v24 = v4 ^ 1;
  else
    v24 = 0;
  objc_msgSend(*(id *)(a1 + 32), "toolbarController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", v4);

  objc_msgSend(*(id *)(a1 + 32), "toolbarController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setOriginalToolbarHidden:", v24);

  objc_msgSend(*(id *)(a1 + 32), "toolbarController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "updateLayout");

}

void __103__QLPreviewController_Overlay__updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "toolbarController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateLayout");

}

void __103__QLPreviewController_Overlay__updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "toolbarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isHidden"))
    v3 = 0.0;
  else
    v3 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "toolbarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarAlpha:", v3);

  objc_msgSend(*(id *)(a1 + 32), "toolbarController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isHidden"))
    v5 = 0.0;
  else
    v5 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "toolbarController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOriginalToolbarAlpha:", v5);

}

- (void)_updateOverlayButtonsIfNeededWithTraitCollection:(id)a3 animated:(BOOL)a4 updatedToolbarButtons:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v39 = a4;
  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    -[QLPreviewController traitCollection](self, "traitCollection");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[QLPreviewController _toolBarButtonsWithTraitCollection:](self, "_toolBarButtonsWithTraitCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController _navigationBarLeftButtonsWithTraitCollection:](self, "_navigationBarLeftButtonsWithTraitCollection:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  -[QLPreviewController _navigationBarRightButtonsWithTraitCollection:](self, "_navigationBarRightButtonsWithTraitCollection:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[QLPreviewController _numberOfButtonsExcludingSpacersInButtons:disappearingOnTap:](self, "_numberOfButtonsExcludingSpacersInButtons:disappearingOnTap:", v8, 0);
  v12 = -[QLPreviewController _numberOfButtonsExcludingSpacersInButtons:disappearingOnTap:](self, "_numberOfButtonsExcludingSpacersInButtons:disappearingOnTap:", v8, 1);
  v38 = v7;
  if (!objc_msgSend(v10, "count") && v11 <= 1 && v12 <= 1)
  {

    v10 = v8;
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }
  -[QLPreviewController _topViewController](self, "_topViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toolbarItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[QLPreviewController _barButtonItemArray:isEqualToArray:](self, "_barButtonItemArray:isEqualToArray:", v8, v14);

  -[QLPreviewController _topViewController](self, "_topViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leftBarButtonItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)v9;
  v19 = -[QLPreviewController _barButtonItemArray:isEqualToArray:](self, "_barButtonItemArray:isEqualToArray:", v9, v18);

  -[QLPreviewController _topViewController](self, "_topViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rightBarButtonItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v10;
  v23 = -[QLPreviewController _barButtonItemArray:isEqualToArray:](self, "_barButtonItemArray:isEqualToArray:", v10, v22);

  if (!v15 || !v19 || !v23)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[QLPreviewController previewToolbarButtons](self, "previewToolbarButtons");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v43 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "invalidateCurrentState");
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v26);
    }

    -[QLPreviewController _topViewController](self, "_topViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "navigationItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setLeftItemsSupplementBackButton:", 1);

  }
  if (!v15)
  {
    -[QLPreviewController _topViewController](self, "_topViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setToolbarItems:animated:", v8, v39);

  }
  if (!v19)
  {
    -[QLPreviewController _topViewController](self, "_topViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "navigationItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLeftBarButtonItems:animated:", v41, v39);

  }
  if (!v23)
  {
    -[QLPreviewController _topViewController](self, "_topViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "navigationItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setRightBarButtonItems:animated:", v40, v39);

  }
  if (!v15 || !v19 || !v23)
  {
    -[QLPreviewController _topViewController](self, "_topViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "toolbarItems");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController _updateCurrentPopoverButtonIfNeeded:](self, "_updateCurrentPopoverButtonIfNeeded:", v37);

    -[QLPreviewController _updateNavigationBarBehaviorStyle](self, "_updateNavigationBarBehaviorStyle");
  }
  if (a5)
    *a5 = objc_retainAutorelease(v8);

}

- (BOOL)_barButtonItemArray:(id)a3 isEqualToArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (!v5 || !v6)
    goto LABEL_15;
  v9 = objc_msgSend(v5, "count");
  if (v9 != objc_msgSend(v7, "count"))
    goto LABEL_14;
  if (!objc_msgSend(v5, "count"))
  {
LABEL_12:
    v8 = 1;
    goto LABEL_15;
  }
  v10 = 0;
  while (1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    if ((objc_msgSend(v11, "_qlIsEqual:", v12) & 1) == 0)
      goto LABEL_13;
LABEL_11:

    if (++v10 >= (unint64_t)objc_msgSend(v5, "count"))
      goto LABEL_12;
  }
  if (objc_msgSend(v11, "isEqual:", v12))
    goto LABEL_11;
LABEL_13:

LABEL_14:
  v8 = 0;
LABEL_15:

  return v8;
}

- (unint64_t)_numberOfButtonsExcludingSpacersInButtons:(id)a3 disappearingOnTap:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v4 && objc_msgSend(v11, "QLType") != 5)
            ++v8;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v8 += objc_msgSend(v11, "disappearsOnTap") ^ v4 ^ 1;
          else
            ++v8;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateStatusBarAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  _QWORD v9[5];

  v3 = a3;
  if (-[QLPreviewController presentationMode](self, "presentationMode") != 4
    && (objc_msgSend(MEMORY[0x24BDD1488], "mainBundleRequiresStatusBarHidden") & 1) == 0)
  {
    if (-[QLPreviewController fullScreen](self, "fullScreen"))
      v5 = 0x20000;
    else
      v5 = 0x10000;
    v6 = 0.0;
    if (-[QLPreviewController preferredStatusBarUpdateAnimation](self, "preferredStatusBarUpdateAnimation") == 1)
    {
      if (v3)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD988]), "initWithDefaultParameters");
        objc_msgSend(v7, "duration");
        v6 = v8;

      }
    }
    else if (v3)
    {
      if (-[QLPreviewController fullScreen](self, "fullScreen"))
        v6 = 0.05;
      else
        v6 = 0.18;
    }
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __56__QLPreviewController_Overlay__updateStatusBarAnimated___block_invoke;
    v9[3] = &unk_24C724B00;
    v9[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", v5, v9, 0, v6, 0.0);
  }
}

uint64_t __56__QLPreviewController_Overlay__updateStatusBarAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (void)updateRemoteOverlayIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id from;
  id location;

  -[QLPreviewController presentedViewController](self, "presentedViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[QLPreviewController shareSheetPopoverTracker](self, "shareSheetPopoverTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_initWeak(&location, self);
      -[QLPreviewController presentedViewController](self, "presentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&from, v4);

      -[QLPreviewController shareSheetPopoverTracker](self, "shareSheetPopoverTracker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __59__QLPreviewController_Overlay__updateRemoteOverlayIfNeeded__block_invoke;
      v7[3] = &unk_24C7268F8;
      objc_copyWeak(&v8, &location);
      objc_copyWeak(&v9, &from);
      objc_msgSend(v5, "getFrameWithCompletionBlock:", v7);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
}

void __59__QLPreviewController_Overlay__updateRemoteOverlayIfNeeded__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v10;
  id v11[5];

  objc_copyWeak(&v10, (id *)(a1 + 32));
  objc_copyWeak(v11, (id *)(a1 + 40));
  v11[1] = *(id *)&a2;
  v11[2] = *(id *)&a3;
  v11[3] = *(id *)&a4;
  v11[4] = *(id *)&a5;
  QLRunInMainThread();
  objc_destroyWeak(v11);
  objc_destroyWeak(&v10);
}

void __59__QLPreviewController_Overlay__updateRemoteOverlayIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(WeakRetained, "presentedViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v2)
  {
    v5 = *(double *)(a1 + 48);
    v6 = *(double *)(a1 + 56);
    v7 = *(double *)(a1 + 64);
    v8 = *(double *)(a1 + 72);
    objc_msgSend(WeakRetained, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSourceRect:", v5, v6, v7, v8);

    objc_msgSend(WeakRetained, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "popoverPresentationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containerViewWillLayoutSubviews");

LABEL_4:
  }

}

- (int64_t)preferredStatusBarUpdateAnimation
{
  void *v3;
  int v4;
  void *v5;
  _BOOL4 v6;

  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldOpenInFullScreen");

  if (v4)
  {
    -[QLPreviewController currentAnimator](self, "currentAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

  }
  else
  {
    v6 = -[QLPreviewController canShowNavBar](self, "canShowNavBar");
  }
  if (v6)
    return 2;
  else
    return 1;
}

- (BOOL)prefersStatusBarHidden
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  QLPreviewController *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;

  -[QLPreviewController currentAnimator](self, "currentAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionContext");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[QLPreviewController currentAnimator](self, "currentAnimator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionContext");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {

      goto LABEL_11;
    }
    v8 = (void *)v7;
    -[QLPreviewController currentAnimator](self, "currentAnimator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transitionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "transitionWasCancelled");

    if (!v11)
    {
LABEL_11:
      -[QLPreviewController currentAnimator](self, "currentAnimator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "transitionContext");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v15, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
      v13 = (QLPreviewController *)objc_claimAutoreleasedReturnValue();

      -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend(v16, "shouldOpenInFullScreen");

      if ((v15 & 1) != 0)
      {
        if (v13 == self
          && -[QLPreviewController fullScreen](self, "fullScreen")
          && -[QLPreviewController quickLookVisibility](self, "quickLookVisibility") == 2)
        {
          goto LABEL_21;
        }
      }
      else
      {
        -[QLPreviewController currentAnimator](self, "currentAnimator");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "transitionState"))
        {

        }
        else
        {
          -[QLPreviewController currentAnimator](self, "currentAnimator");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "showing");

          if (v19)
            goto LABEL_20;
        }
        if (-[QLPreviewController fullScreen](self, "fullScreen"))
        {
LABEL_21:
          v12 = 1;
          goto LABEL_23;
        }
      }
LABEL_20:
      if (!-[QLPreviewController previousStatusBarHidden](self, "previousStatusBarHidden"))
      {
        -[QLPreviewController traitCollection](v13, "traitCollection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v20, "verticalSizeClass") == 1;

        goto LABEL_23;
      }
      goto LABEL_21;
    }
  }
  else
  {

  }
  if (!-[QLPreviewController fullScreen](self, "fullScreen")
    || -[QLPreviewController quickLookVisibility](self, "quickLookVisibility") != 2)
  {
    -[QLPreviewController traitCollection](self, "traitCollection");
    v13 = (QLPreviewController *)objc_claimAutoreleasedReturnValue();
    v12 = -[QLPreviewController verticalSizeClass](v13, "verticalSizeClass") == 1;
LABEL_23:

    return v12;
  }
  return 1;
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "shouldOpenInFullScreen") & 1) == 0)
  {

    return 0;
  }
  if (-[QLPreviewController quickLookVisibility](self, "quickLookVisibility") == 2)
  {
    -[QLPreviewController currentAnimator](self, "currentAnimator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "transitionState");

    if (v5 == 1)
      return 3;
    return 0;
  }

  return 3;
}

- (id)childViewControllerForStatusBarHidden
{
  QLPreviewController *v3;
  QLPreviewController *v4;
  QLPreviewController *v5;

  -[QLPreviewController _topPreviewController](self, "_topPreviewController");
  v3 = (QLPreviewController *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == self)
    v5 = 0;
  else
    v5 = v3;

  return v5;
}

- (id)_buttonWithAccessibilityIdentifierPointer:(id)a3 inButtons:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a3;
  v6 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9;
  v14 = __Block_byref_object_dispose__9;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__QLPreviewController_Overlay___buttonWithAccessibilityIdentifierPointer_inButtons___block_invoke;
  v9[3] = &unk_24C726920;
  v9[4] = v5;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __84__QLPreviewController_Overlay___buttonWithAccessibilityIdentifierPointer_inButtons___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "accessibilityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_updateCurrentPopoverButtonIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;

  -[QLPreviewController presentedViewController](self, "presentedViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[QLPreviewController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[QLPreviewController _displayedButtonWithAccessibilityIdentifier:](self, "_displayedButtonWithAccessibilityIdentifier:", CFSTR("QLOverlayListButtonAccessibilityIdentifier"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[QLPreviewController presentedViewController](self, "presentedViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setBarButton:", v8);

      }
    }
  }
}

- (void)updateNavigationTitle
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[QLPreviewController currentTitleFromItemViewController](self, "currentTitleFromItemViewController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewItemTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15
    || (objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C72A1F8),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", &stru_24C72A1F8),
        v5,
        v6))
  {
    v7 = v4;

    v15 = v7;
  }
  v8 = v4;
  -[QLPreviewController previewCollection](self, "previewCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v15);

  -[QLPreviewController setTitle:](self, "setTitle:", v15);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v8, 0, 0, 0);
  -[QLPreviewController previewCollection](self, "previewCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackBarButtonItem:", v10);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v8, 0, 0, 0);
  -[QLPreviewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackBarButtonItem:", v13);

  -[QLPreviewController updateTitleMenuAndDocumentProperties](self, "updateTitleMenuAndDocumentProperties");
}

- (BOOL)_canDisplayOpenInButtonForItem:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a3, "fetcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLongFetchOperation");

  LOBYTE(self) = -[QLPreviewController canChangeCurrentPage](self, "canChangeCurrentPage");
  return +[QLUtilitiesInternal currentAppIsAppleApp](QLUtilitiesInternal, "currentAppIsAppleApp") & ~v5 & self;
}

- (BOOL)_shouldDisplayOpenInInChromeIfAvailable
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 1)
    {
      -[QLPreviewController traitCollection](self, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = !-[QLPreviewController _isToolbarVisibleForTraitCollection:](self, "_isToolbarVisibleForTraitCollection:", v6);

    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (id)_openInButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  QLBarButtonItem *v7;
  QLBarButtonItem *v8;
  __CFString **v9;

  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[QLPreviewController _shouldDisplayOpenInInChromeIfAvailable](self, "_shouldDisplayOpenInInChromeIfAvailable")
    && -[QLPreviewController _canDisplayOpenInButtonForItem:](self, "_canDisplayOpenInButtonForItem:", v3))
  {
    -[QLPreviewController isContentManaged](self, "isContentManaged");
    _QLGetOpenInAppClaimBindingForItem(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_msgSend(MEMORY[0x24BE7BF88], "openInTypeForItem:appIsContentManaged:", v3, -[QLPreviewController isContentManaged](self, "isContentManaged"));
      -[QLPreviewController _openInTitleForOpenInType:claimBinding:](self, "_openInTitleForOpenInType:claimBinding:", v5, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = [QLBarButtonItem alloc];
      if (v5 == 1)
      {
        v8 = -[QLBarButtonItem initWithTitle:style:target:action:](v7, "initWithTitle:style:target:action:", v6, 0, self, sel__openInButtonTapped_);
        -[QLBarButtonItem setQLType:](v8, "setQLType:", 6);
        v9 = QLOverlayOpenInButtonAccessibilityIdentifier;
      }
      else
      {
        v8 = -[QLBarButtonItem initWithTitle:style:target:action:](v7, "initWithTitle:style:target:action:", v6, 0, self, sel__copyToButtonTapped_);
        -[QLBarButtonItem setQLType:](v8, "setQLType:", 7);
        v9 = QLOverlayCopyToButtonAccessibilityIdentifier;
      }
      -[QLBarButtonItem setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", *v9);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_doneButton
{
  QLBarButtonItem *v3;
  _BOOL4 v4;
  uint64_t v5;
  QLBarButtonItem *v6;

  if (-[QLPreviewController showActionAsDefaultButton](self, "showActionAsDefaultButton"))
  {
    v3 = [QLBarButtonItem alloc];
  }
  else
  {
    v4 = -[QLPreviewController isObtainingEditsFromServiceBeforeDismissing](self, "isObtainingEditsFromServiceBeforeDismissing");
    v3 = [QLBarButtonItem alloc];
    if (!v4)
    {
      v5 = 0;
      goto LABEL_6;
    }
  }
  v5 = 1;
LABEL_6:
  v6 = -[QLBarButtonItem initWithBarButtonSystemItem:primaryAction:](v3, "initWithBarButtonSystemItem:primaryAction:", v5, 0);
  -[QLPreviewController _updateDoneButtonMenu:](self, "_updateDoneButtonMenu:", v6);
  -[QLBarButtonItem setQLType:](v6, "setQLType:", 1);
  -[QLBarButtonItem setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("QLOverlayDoneButtonAccessibilityIdentifier"));
  return v6;
}

- (id)_actionButton
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  QLBarButtonItem *v8;
  void *v9;
  void *v10;
  BOOL v12;

  if (!-[QLPreviewController useCustomActionButton](self, "useCustomActionButton"))
    goto LABEL_5;
  -[QLPreviewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    goto LABEL_5;
  -[QLPreviewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController currentPreviewItem](self, "currentPreviewItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewController:customActionButtonTittleForPreviewItem:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_5:
    -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "canBeShared") & 1) != 0)
    {
      -[QLPreviewController excludedToolbarButtonIdentifiers](self, "excludedToolbarButtonIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "containsObject:", CFSTR("QLListButtonIdentifier")))
      {
        v12 = +[QLUtilitiesInternal deviceIsLocked](QLUtilitiesInternal, "deviceIsLocked");

        if (!v12 && -[QLPreviewController hasItemsToPreview](self, "hasItemsToPreview"))
        {
          v8 = -[QLBarButtonItem initWithBarButtonSystemItem:target:action:]([QLBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 9, self, sel__actionButtonTapped_);
          -[QLBarButtonItem setQLType:](v8, "setQLType:", 4);
          -[QLBarButtonItem setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("QLOverlayDefaultActionButtonAccessibilityIdentifier"));
          return v8;
        }
        goto LABEL_9;
      }

    }
LABEL_9:
    v8 = 0;
    return v8;
  }
  -[QLPreviewController showActionAsDefaultButton](self, "showActionAsDefaultButton");
  v8 = -[QLBarButtonItem initWithTitle:style:target:action:]([QLBarButtonItem alloc], "initWithTitle:style:target:action:", v7, 0, self, sel__actionButtonTapped_);
  -[QLBarButtonItem setQLType:](v8, "setQLType:", 3);
  -[QLBarButtonItem setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("QLOverlayCustomActionButtonAccessibilityIdentifier"));

  return v8;
}

- (id)_listButton
{
  QLBarButtonItem *v3;
  void *v4;
  void *v5;
  QLBarButtonItem *v6;

  v3 = [QLBarButtonItem alloc];
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("list.bullet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageFlippedForRightToLeftLayoutDirection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[QLBarButtonItem initWithImage:style:target:action:](v3, "initWithImage:style:target:action:", v5, 0, self, sel__listButtonTapped_);

  -[QLBarButtonItem setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("QLOverlayListButtonAccessibilityIdentifier"));
  -[QLBarButtonItem setQLType:](v6, "setQLType:", 2);
  return v6;
}

- (id)flexibleSpace
{
  QLBarButtonItem *v2;

  v2 = -[QLBarButtonItem initWithBarButtonSystemItem:target:action:]([QLBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[QLBarButtonItem setQLType:](v2, "setQLType:", 5);
  return v2;
}

- (id)_toolBarButtonsWithTraitCollection:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  if (-[QLPreviewController _isToolbarVisibleForTraitCollection:](self, "_isToolbarVisibleForTraitCollection:", a3))
  {
    v4 = (void *)objc_opt_new();
    -[QLPreviewController _actionButton](self, "_actionButton");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "addObject:", v5);
      -[QLPreviewController flexibleSpace](self, "flexibleSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
    v63 = (void *)v5;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    -[QLPreviewController previewToolbarButtons](self, "previewToolbarButtons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v81 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          if ((objc_msgSend(v12, "forceToNavBar") & 1) == 0 && !objc_msgSend(v12, "placement"))
          {
            -[QLPreviewController internalNavigationController](self, "internalNavigationController");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "toolbar");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "frame");
            objc_msgSend(v12, "barButtonWithTarget:action:maxSize:", self, sel__toolbarButtonPressed_, v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v17);

            -[QLPreviewController flexibleSpace](self, "flexibleSpace");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v18);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
      }
      while (v9);
    }

    -[QLPreviewController _additionalRightButtonItems](self, "_additionalRightButtonItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v77;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v77 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j));
          -[QLPreviewController flexibleSpace](self, "flexibleSpace");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
      }
      while (v21);
    }
    v62 = v19;
    -[QLPreviewController _openInButton](self, "_openInButton");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v4, "addObject:", v25);
      -[QLPreviewController flexibleSpace](self, "flexibleSpace");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v26);

    }
    v61 = (void *)v25;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    -[QLPreviewController previewToolbarButtons](self, "previewToolbarButtons");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v73;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v73 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
          if ((objc_msgSend(v32, "forceToNavBar") & 1) == 0 && objc_msgSend(v32, "placement") == 1)
          {
            -[QLPreviewController internalNavigationController](self, "internalNavigationController");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "toolbar");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "frame");
            objc_msgSend(v32, "barButtonWithTarget:action:maxSize:", self, sel__toolbarButtonPressed_, v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v37);

            -[QLPreviewController flexibleSpace](self, "flexibleSpace");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v38);

          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
      }
      while (v29);
    }

    -[QLPreviewController _additionalLeftButtonItems](self, "_additionalLeftButtonItems");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v69;
      do
      {
        for (m = 0; m != v41; ++m)
        {
          if (*(_QWORD *)v69 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * m));
          -[QLPreviewController flexibleSpace](self, "flexibleSpace");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v44);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
      }
      while (v41);
    }
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    -[QLPreviewController previewToolbarButtons](self, "previewToolbarButtons", v39);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v65;
      do
      {
        for (n = 0; n != v47; ++n)
        {
          if (*(_QWORD *)v65 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * n);
          if ((objc_msgSend(v50, "forceToNavBar") & 1) == 0 && objc_msgSend(v50, "placement") == 2)
          {
            -[QLPreviewController internalNavigationController](self, "internalNavigationController");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "toolbar");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "frame");
            objc_msgSend(v50, "barButtonWithTarget:action:maxSize:", self, sel__toolbarButtonPressed_, v53, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v55);

            -[QLPreviewController flexibleSpace](self, "flexibleSpace");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v56);

          }
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
      }
      while (v47);
    }

    if (objc_msgSend(v4, "count"))
      objc_msgSend(v4, "removeLastObject");
    objc_msgSend(v4, "lastObject");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v57, "placement") == 1 || v57 == v61)
    {
      -[QLPreviewController flexibleSpace](self, "flexibleSpace");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v58);

    }
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v4;
}

- (id)_navigationBarRightButtonsWithTraitCollection:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  BOOL v62;
  _QWORD v63[4];
  id v64;
  QLPreviewController *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v4 = -[QLPreviewController _isToolbarVisibleForTraitCollection:](self, "_isToolbarVisibleForTraitCollection:", a3);
  v5 = (void *)objc_opt_new();
  if (!-[QLPreviewController _shouldDoneButtonBePlacedLeft](self, "_shouldDoneButtonBePlacedLeft"))
  {
    -[QLPreviewController _topViewController](self, "_topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[QLPreviewController _doneButton](self, "_doneButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

    }
  }
  if (v4)
  {
    -[QLPreviewController previewToolbarButtons](self, "previewToolbarButtons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __78__QLPreviewController_Overlay___navigationBarRightButtonsWithTraitCollection___block_invoke_2;
    v63[3] = &unk_24C726988;
    v64 = v5;
    v65 = self;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v63);

  }
  else
  {
    v62 = v4;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    -[QLPreviewController previewToolbarButtons](self, "previewToolbarButtons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v83 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          if (objc_msgSend(v16, "placement") == 2)
          {
            -[QLPreviewController internalNavigationController](self, "internalNavigationController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "navigationBar");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "frame");
            objc_msgSend(v16, "barButtonWithTarget:action:maxSize:", self, sel__toolbarButtonPressed_, v19, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v21);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
      }
      while (v13);
    }

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    -[QLPreviewController previewToolbarButtons](self, "previewToolbarButtons");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v79;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v79 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
          if (objc_msgSend(v27, "placement") == 1)
          {
            -[QLPreviewController internalNavigationController](self, "internalNavigationController");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "navigationBar");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "frame");
            objc_msgSend(v27, "barButtonWithTarget:action:maxSize:", self, sel__toolbarButtonPressed_, v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v32);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
      }
      while (v24);
    }

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    -[QLPreviewController _additionalRightButtonItems](self, "_additionalRightButtonItems");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v75 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * k));
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
      }
      while (v35);
    }

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    -[QLPreviewController previewToolbarButtons](self, "previewToolbarButtons");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v71;
      do
      {
        for (m = 0; m != v40; ++m)
        {
          if (*(_QWORD *)v71 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * m);
          if (!objc_msgSend(v43, "placement"))
          {
            -[QLPreviewController internalNavigationController](self, "internalNavigationController");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "navigationBar");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "frame");
            objc_msgSend(v43, "barButtonWithTarget:action:maxSize:", self, sel__toolbarButtonPressed_, v46, v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v48);

          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
      }
      while (v40);
    }

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    -[QLPreviewController _additionalLeftButtonItems](self, "_additionalLeftButtonItems");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v67;
      do
      {
        for (n = 0; n != v51; ++n)
        {
          if (*(_QWORD *)v67 != v52)
            objc_enumerationMutation(v49);
          objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * n));
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
      }
      while (v51);
    }

    v4 = v62;
  }
  -[QLPreviewController originalRightBarButtonItems](self, "originalRightBarButtonItems");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[QLPreviewController originalRightBarButtonItems](self, "originalRightBarButtonItems");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v55);

  }
  if (-[QLPreviewController presentationStyle](self, "presentationStyle") == 1)
  {
    v56 = objc_msgSend(v5, "indexOfObjectPassingTest:", &__block_literal_global_141);
    if (v56 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v57 = v56;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectAtIndex:", v57);
      objc_msgSend(v5, "addObject:", v58);

    }
  }
  if (!v4)
  {
    -[QLPreviewController _actionButton](self, "_actionButton");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
      objc_msgSend(v5, "addObject:", v59);
    -[QLPreviewController _openInButton](self, "_openInButton");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
      objc_msgSend(v5, "addObject:", v60);

  }
  return v5;
}

uint64_t __78__QLPreviewController_Overlay___navigationBarRightButtonsWithTraitCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "placement");
  if (v6 <= objc_msgSend(v5, "placement"))
  {
    v8 = objc_msgSend(v4, "placement");
    v7 = v8 < objc_msgSend(v5, "placement");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __78__QLPreviewController_Overlay___navigationBarRightButtonsWithTraitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "forceToNavBar"))
  {
    v4 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v3, "internalNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    objc_msgSend(v10, "barButtonWithTarget:action:maxSize:", v3, sel__toolbarButtonPressed_, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

  }
}

uint64_t __78__QLPreviewController_Overlay___navigationBarRightButtonsWithTraitCollection___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "identifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("QLVisualSearchButton")),
        v6,
        v7))
  {
    v8 = 1;
    *a4 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldDoneButtonBePlacedLeft
{
  return _UIBarsDesktopNavigationBarEnabled() ^ 1;
}

- (id)_navigationBarLeftButtonsWithTraitCollection:(id)a3
{
  BOOL v4;
  int v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = -[QLPreviewController _isToolbarVisibleForTraitCollection:](self, "_isToolbarVisibleForTraitCollection:", a3);
  v5 = _UIBarsDesktopNavigationBarEnabled();
  v6 = (void *)objc_opt_new();
  if (-[QLPreviewController _shouldDoneButtonBePlacedLeft](self, "_shouldDoneButtonBePlacedLeft"))
  {
    -[QLPreviewController _topViewController](self, "_topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[QLPreviewController _doneButton](self, "_doneButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

    }
  }
  if (v5 && -[QLPreviewController _needsListButton](self, "_needsListButton"))
  {
    -[QLPreviewController _listButton](self, "_listButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);
  }
  else
  {
    if (v4)
      goto LABEL_18;
    if (-[QLPreviewController _needsListButton](self, "_needsListButton"))
    {
      -[QLPreviewController _listButton](self, "_listButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v11);

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[QLPreviewController _additionalLeftButtonItems](self, "_additionalLeftButtonItems", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v10);
          objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }
  }

LABEL_18:
  -[QLPreviewController originalLeftBarButtonItems](self, "originalLeftBarButtonItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[QLPreviewController originalLeftBarButtonItems](self, "originalLeftBarButtonItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v17);

  }
  return v6;
}

- (void)_toolbarButtonPressed:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  QLPreviewController *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[QLPreviewController _canPerformBarButtonAction](self, "_canPerformBarButtonAction"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = (NSObject **)MEMORY[0x24BE7BF48];
      v6 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = v6;
        objc_msgSend(v4, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v12 = self;
        v13 = 2112;
        v14 = v8;
        _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_INFO, "Preview controller: %@ is notifying collection about button pressed with identifier: %@. #PreviewController", buf, 0x16u);

      }
      -[QLPreviewController previewCollection](self, "previewCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "toolbarButtonPressedWithIdentifier:completionHandler:", v10, &__block_literal_global_144);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("the sender sent to _toolbarButtonPressed: should have an identifier. Sender: %@"), v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s ERROR: %@"), "-[QLPreviewController(Overlay) _toolbarButtonPressed:]", v9);
    }

  }
}

- (void)_actionButtonTapped:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[QLPreviewController _canPerformBarButtonAction](self, "_canPerformBarButtonAction"))
  {
    if (-[QLPreviewController useCustomActionButton](self, "useCustomActionButton"))
    {
      -[QLPreviewController delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        -[QLPreviewController delegate](self, "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "previewController:customActionButtonWasTappedForPreviewItem:", self, v7);

      }
    }
    else
    {
      -[QLPreviewController showShareSheetFromBarButton:](self, "showShareSheetFromBarButton:", v8);
    }
  }

}

- (void)_copyToButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController isContentManaged](self, "isContentManaged");
  _QLGetOpenInAppClaimBindingForItem(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__QLPreviewController_Overlay___copyToButtonTapped___block_invoke;
  v8[3] = &unk_24C726A10;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  -[QLPreviewController shareableURLForCurrentPreviewItem:](self, "shareableURLForCurrentPreviewItem:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __52__QLPreviewController_Overlay___copyToButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__QLPreviewController_Overlay___copyToButtonTapped___block_invoke_2;
  v6[3] = &unk_24C725230;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performOpenInWithFileURL:claimBinding:additionalLaunchServicesOptions:completion:", v3, v5, 0, v6);

  objc_destroyWeak(&v7);
}

void __52__QLPreviewController_Overlay___copyToButtonTapped___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  QLRunInMainThread();
  objc_destroyWeak(&v1);
}

void __52__QLPreviewController_Overlay___copyToButtonTapped___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissQuickLook");

}

- (void)_openInButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController isContentManaged](self, "isContentManaged");
  _QLGetOpenInAppClaimBindingForItem(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__QLPreviewController_Overlay___openInButtonTapped___block_invoke;
  v8[3] = &unk_24C726A60;
  v7 = v6;
  v9 = v7;
  objc_copyWeak(&v10, &location);
  -[QLPreviewController shareableURLForCurrentPreviewItem:](self, "shareableURLForCurrentPreviewItem:", v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __52__QLPreviewController_Overlay___openInButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "bundleRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  objc_copyWeak(&v8, (id *)(a1 + 40));
  FPExtendBookmarkForDocumentURL();

  objc_destroyWeak(&v8);
}

void __52__QLPreviewController_Overlay___openInButtonTapped___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  NSObject **v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id *v14;
  id WeakRetained;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a2, "copy");
  v6 = (void *)objc_msgSend(a3, "copy");
  if (v6)
  {
    v7 = (NSObject **)MEMORY[0x24BE7BF48];
    v8 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      v11 = v8;
      objc_msgSend(v9, "bundleRecord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v10;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_ERROR, "Could not obtain bookmark to open file at URL: %@ in place with app: %@. #Sharing", buf, 0x16u);

    }
  }
  else
  {
    v14 = (id *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *MEMORY[0x24BDC1500];
    v22[0] = *MEMORY[0x24BDC14D8];
    v22[1] = v18;
    v23[0] = v5;
    v23[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __52__QLPreviewController_Overlay___openInButtonTapped___block_invoke_154;
    v20[3] = &unk_24C725230;
    objc_copyWeak(&v21, v14);
    objc_msgSend(WeakRetained, "_performOpenInWithFileURL:claimBinding:additionalLaunchServicesOptions:completion:", v16, v17, v19, v20);

    objc_destroyWeak(&v21);
  }

}

void __52__QLPreviewController_Overlay___openInButtonTapped___block_invoke_154(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  QLRunInMainThread();
  objc_destroyWeak(&v1);
}

void __52__QLPreviewController_Overlay___openInButtonTapped___block_invoke_2_155(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissQuickLook");

}

- (id)_openInTitleForOpenInType:(unint64_t)a3 claimBinding:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3 - 1 > 1)
  {
    v9 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = a4;
    QLLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)_performOpenInWithFileURL:(id)a3 claimBinding:(id)a4 additionalLaunchServicesOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  char v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x24BDBCED8];
  v14 = *MEMORY[0x24BE38320];
  v30[0] = *MEMORY[0x24BE38310];
  v30[1] = v14;
  v31[0] = MEMORY[0x24BDBD1C8];
  v31[1] = MEMORY[0x24BDBD1C8];
  v15 = (void *)MEMORY[0x24BDBCE70];
  v16 = a4;
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryWithDictionary:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v18, "addEntriesFromDictionary:", v11);
  v19 = objc_msgSend(v10, "startAccessingSecurityScopedResource");
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleRecord");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "bundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", v10, v22, 0, -[QLPreviewController isContentManaged](self, "isContentManaged"), 0, 0, v18, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __114__QLPreviewController_Overlay___performOpenInWithFileURL_claimBinding_additionalLaunchServicesOptions_completion___block_invoke;
  v26[3] = &unk_24C726A88;
  v29 = v19;
  v27 = v10;
  v28 = v12;
  v24 = v12;
  v25 = v10;
  objc_msgSend(v23, "setCompletionBlock:", v26);
  objc_msgSend(v23, "start");

}

uint64_t __114__QLPreviewController_Overlay___performOpenInWithFileURL_claimBinding_additionalLaunchServicesOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)showShareSheetFromBarButton:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[QLUtilitiesInternal deviceIsLocked](QLUtilitiesInternal, "deviceIsLocked"))
  {
    v5 = (NSObject **)MEMORY[0x24BE7BF48];
    v6 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_ERROR, "Could not show share sheet for item %@ because device is locked. #Sharing", buf, 0xCu);

    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[QLPreviewController previewCollection](self, "previewCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__QLPreviewController_Overlay__showShareSheetFromBarButton___block_invoke;
    v10[3] = &unk_24C724638;
    v10[4] = self;
    objc_copyWeak(&v11, (id *)buf);
    objc_msgSend(v9, "toolbarButtonPressedWithIdentifier:completionHandler:", CFSTR("QLActionButtonIdentifier"), v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }

}

void __60__QLPreviewController_Overlay__showShareSheetFromBarButton___block_invoke(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 40));
  QLRunInMainThread();
  objc_destroyWeak(&v1);
}

void __60__QLPreviewController_Overlay__showShareSheetFromBarButton___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_displayedButtonWithAccessibilityIdentifier:", CFSTR("QLOverlayDefaultActionButtonAccessibilityIdentifier"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_showShareSheetFromBarButton:", v3);

}

- (void)_showShareSheetFromBarButton:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  QLPreviewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__QLPreviewController_Overlay___showShareSheetFromBarButton___block_invoke;
  v6[3] = &unk_24C724778;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[QLPreviewController _setupDocumentInteractionControllerForPresentation:](self, "_setupDocumentInteractionControllerForPresentation:", v6);

}

void __61__QLPreviewController_Overlay___showShareSheetFromBarButton___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  char v16;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sharingInteractionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    v5 = objc_msgSend(v3, "presentOptionsMenuFromBarButtonItem:animated:", *(_QWORD *)(a1 + 32), 1);

    if ((v5 & 1) != 0)
      return;
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "_stopAccessingUrlForSharingController");
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 40), "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "presentOptionsMenuFromRect:inView:animated:", v15, 1, v8, v10, v12, v14);

  if ((v16 & 1) == 0)
    goto LABEL_5;
}

- (void)showShareSheetFromRemoteViewWithPopoverTracker:(id)a3 customSharedURL:(id)a4 dismissCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject **v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject **v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject **v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  void (**v30)(_QWORD);
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (+[QLUtilitiesInternal deviceIsLocked](QLUtilitiesInternal, "deviceIsLocked"))
  {
    v11 = (NSObject **)MEMORY[0x24BE7BF48];
    v12 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v14;
      _os_log_impl(&dword_20D4F5000, v13, OS_LOG_TYPE_ERROR, "Could not show share sheet for item %@ because device is locked. #Sharing", buf, 0xCu);

    }
    v10[2](v10);
  }
  else if (v8)
  {
    -[QLPreviewController shareSheetPopoverTracker](self, "shareSheetPopoverTracker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (NSObject **)MEMORY[0x24BE7BF48];
      v17 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v17 = *v16;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = v17;
        -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v33 = v19;
        _os_log_impl(&dword_20D4F5000, v18, OS_LOG_TYPE_ERROR, "Won't show share for remote view again for item %@ because it is already visible on screen. #Sharing", buf, 0xCu);

      }
    }
    else
    {
      -[QLPreviewController setShareSheetPopoverTracker:](self, "setShareSheetPopoverTracker:", v8);
      objc_initWeak((id *)buf, self);
      v24 = MEMORY[0x24BDAC760];
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke;
      v29[3] = &unk_24C726AB0;
      objc_copyWeak(&v31, (id *)buf);
      v30 = v10;
      -[QLPreviewController setShareSheetDismissCompletion:](self, "setShareSheetDismissCompletion:", v29);
      -[QLPreviewController shareSheetPopoverTracker](self, "shareSheetPopoverTracker");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v24;
      v26[1] = 3221225472;
      v26[2] = __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke_2;
      v26[3] = &unk_24C726B00;
      objc_copyWeak(&v28, (id *)buf);
      v27 = v9;
      objc_msgSend(v25, "getFrameWithCompletionBlock:", v26);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v20 = (NSObject **)MEMORY[0x24BE7BF48];
    v21 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v21 = *v20;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v23;
      _os_log_impl(&dword_20D4F5000, v22, OS_LOG_TYPE_ERROR, "Could not show share sheet for item %@ using popover tracker because popover tracker is nil. #Sharing", buf, 0xCu);

    }
  }

}

uint64_t __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v10;
  id v11[5];

  objc_copyWeak(v11, (id *)(a1 + 40));
  v11[1] = *(id *)&a2;
  v11[2] = *(id *)&a3;
  v11[3] = *(id *)&a4;
  v11[4] = *(id *)&a5;
  v10 = *(id *)(a1 + 32);
  QLRunInMainThread();

  objc_destroyWeak(v11);
}

void __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  _QWORD aBlock[4];
  id v11;
  __int128 v12;
  __int128 v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  v5 = objc_loadWeakRetained(v2);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke_4;
  aBlock[3] = &unk_24C724FB8;
  v6 = v5;
  v11 = v6;
  v7 = *(_OWORD *)(a1 + 64);
  v12 = *(_OWORD *)(a1 + 48);
  v13 = v7;
  v8 = _Block_copy(aBlock);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    objc_msgSend(v6, "_setupDocumentInteractionControllerForPresentationWithURL:isCustomURL:completionHandler:", v9, 1, v8);
  else
    objc_msgSend(v6, "_setupDocumentInteractionControllerForPresentation:", v8);

}

void __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "sharingInteractionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "presentOptionsMenuFromRect:inView:animated:", v3, 1, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_stopAccessingUrlForSharingController");
}

- (void)_setupDocumentInteractionControllerForPresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[QLPreviewController setSharingInteractionController:](self, "setSharingInteractionController:", v5);

  -[QLPreviewController sharingInteractionController](self, "sharingInteractionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__QLPreviewController_Overlay___setupDocumentInteractionControllerForPresentation___block_invoke;
  v8[3] = &unk_24C726B28;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[QLPreviewController shareableURLForCurrentPreviewItem:](self, "shareableURLForCurrentPreviewItem:", v8);

}

uint64_t __83__QLPreviewController_Overlay___setupDocumentInteractionControllerForPresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupDocumentInteractionControllerForPresentationWithURL:isCustomURL:completionHandler:", a2, 0, *(_QWORD *)(a1 + 40));
}

- (void)_setupDocumentInteractionControllerForPresentationWithURL:(id)a3 isCustomURL:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject **v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSObject **v24;
  NSObject *v25;
  QLCustomURLSharingProxyDelegate *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  int v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  v10 = (void *)objc_opt_new();
  -[QLPreviewController setSharingInteractionController:](self, "setSharingInteractionController:", v10);

  if (v8)
  {
    -[QLPreviewController sharingInteractionController](self, "sharingInteractionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setURL:", v8);

    -[QLPreviewController sharingInteractionController](self, "sharingInteractionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "startAccessingSecurityScopedResource");

    if (v14)
    {
      -[QLPreviewController sharingInteractionController](self, "sharingInteractionController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewController setAccessedUrlForSharingController:](self, "setAccessedUrlForSharingController:", v16);

    }
    v17 = (NSObject **)MEMORY[0x24BE7BF48];
    v18 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v18 = *v17;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = v18;
      -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138412546;
      v36 = v8;
      v37 = 2112;
      v38 = v20;
      v21 = "Passing URL: %@ to UIDocumentInteractionController to share item: %@. #Sharing";
      v22 = v19;
      v23 = 22;
LABEL_12:
      _os_log_impl(&dword_20D4F5000, v22, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v35, v23);

    }
  }
  else
  {
    v24 = (NSObject **)MEMORY[0x24BE7BF48];
    v25 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v25 = *v24;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v19 = v25;
      -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138412290;
      v36 = v20;
      v21 = "Passing no URL to UIDocumentInteractionController to share item: %@. #Sharing";
      v22 = v19;
      v23 = 12;
      goto LABEL_12;
    }
  }
  if (a4)
  {
    v26 = -[QLCustomURLSharingProxyDelegate initWithDelegate:]([QLCustomURLSharingProxyDelegate alloc], "initWithDelegate:", self);
    -[QLPreviewController setCustomURLSharingProxyDelegate:](self, "setCustomURLSharingProxyDelegate:", v26);

    -[QLPreviewController customURLSharingProxyDelegate](self, "customURLSharingProxyDelegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController sharingInteractionController](self, "sharingInteractionController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDelegate:", v27);

  }
  else
  {
    -[QLPreviewController sharingInteractionController](self, "sharingInteractionController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDelegate:", self);

    -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "previewItemContentType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController sharingInteractionController](self, "sharingInteractionController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setUTI:", v31);

    -[QLPreviewController sharingInteractionController](self, "sharingInteractionController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setShouldUnzipDocument:", 1);
  }

  v33 = -[QLPreviewController isContentManaged](self, "isContentManaged");
  -[QLPreviewController sharingInteractionController](self, "sharingInteractionController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setIsContentManaged:", v33);

  v9[2](v9);
}

- (void)_stopAccessingUrlForSharingController
{
  void *v3;
  void *v4;

  -[QLPreviewController accessedUrlForSharingController](self, "accessedUrlForSharingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[QLPreviewController accessedUrlForSharingController](self, "accessedUrlForSharingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAccessingSecurityScopedResource");

    -[QLPreviewController setAccessedUrlForSharingController:](self, "setAccessedUrlForSharingController:", 0);
  }
}

- (void)_listButtonTapped:(id)a3
{
  QLListViewController *v4;
  void *v5;
  void *v6;
  QLListViewController *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[QLPreviewController _canPerformBarButtonAction](self, "_canPerformBarButtonAction"))
  {
    v4 = [QLListViewController alloc];
    -[QLPreviewController previewItemStore](self, "previewItemStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[QLListViewController initWithPreviewItemStore:currentPreviewItem:](v4, "initWithPreviewItemStore:currentPreviewItem:", v5, v6);

    -[QLListViewController setBarButton:](v7, "setBarButton:", v9);
    -[QLListViewController setArchiveDelegate:](v7, "setArchiveDelegate:", self);
    -[QLPreviewController setWillTransitionToInternalView:](self, "setWillTransitionToInternalView:", 1);
    -[QLPreviewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
    -[QLPreviewController previewCollection](self, "previewCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toolbarButtonPressedWithIdentifier:completionHandler:", CFSTR("QLListButtonIdentifier"), &__block_literal_global_165);

  }
}

- (void)_saveAndObtainEditsBeforeDismissalWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  if (-[QLPreviewController isObtainingEditsFromServiceBeforeDismissing](self, "isObtainingEditsFromServiceBeforeDismissing"))
  {
    -[QLPreviewController _notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler:](self, "_notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler:", v4);
  }
  else
  {
    -[QLPreviewController _obtainEditsFromServiceAndNotifyPreviewCollectionOfDoneButtonTappedWithCompletionHandler:](self, "_obtainEditsFromServiceAndNotifyPreviewCollectionOfDoneButtonTappedWithCompletionHandler:", v4);
  }

}

- (void)_saveAndObtainEditedItemsBeforeDismissalWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __94__QLPreviewController_Overlay___saveAndObtainEditedItemsBeforeDismissalWithCompletionHandler___block_invoke;
  v6[3] = &unk_24C726B70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[QLPreviewController _saveAndObtainEditsBeforeDismissalWithCompletionHandler:](self, "_saveAndObtainEditsBeforeDismissalWithCompletionHandler:", v6);

}

void __94__QLPreviewController_Overlay___saveAndObtainEditedItemsBeforeDismissalWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_editedItemsForDoneActionControllerWithItems:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40));
  }
}

- (BOOL)_dismissQuickLookIfBlocked
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  int v7;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  QLPreviewController *v11;
  NSObject **v12;
  NSObject *v13;
  int v15;
  QLPreviewController *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!-[QLPreviewController hasItemsToPreview](self, "hasItemsToPreview"))
  {
    v4 = 1;
    -[QLPreviewController _performQuickLookDismissalAnimated:](self, "_performQuickLookDismissalAnimated:", 1);
    return v4;
  }
  if (!-[QLPreviewController _canPerformBarButtonAction](self, "_canPerformBarButtonAction"))
  {
    -[QLPreviewController currentAnimator](self, "currentAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[QLPreviewController currentAnimator](self, "currentAnimator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "forceDismissalIfNeeded");

      if (v7)
      {
        v8 = (NSObject **)MEMORY[0x24BE7BF48];
        v9 = *MEMORY[0x24BE7BF48];
        if (!*MEMORY[0x24BE7BF48])
        {
          QLSInitLogging();
          v9 = *v8;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = v9;
          -[QLPreviewController currentAnimator](self, "currentAnimator");
          v11 = (QLPreviewController *)objc_claimAutoreleasedReturnValue();
          v15 = 138412290;
          v16 = v11;
          _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_ERROR, "Forced dismissal of QLPreviewController using Done button with animator: %@ #PreviewController", (uint8_t *)&v15, 0xCu);

        }
      }
    }
    return 1;
  }
  -[QLPreviewController previewCollection](self, "previewCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v12 = (NSObject **)MEMORY[0x24BE7BF48];
    v13 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v13 = *v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v15 = 138412290;
      v16 = self;
      _os_log_impl(&dword_20D4F5000, v13, OS_LOG_TYPE_FAULT, "Dismissing QLPreviewController because it does not have a preview collection anymore: %@ #PreviewController", (uint8_t *)&v15, 0xCu);
    }
    -[QLPreviewController _performQuickLookDismissalAnimated:](self, "_performQuickLookDismissalAnimated:", 0);
    return 1;
  }
  return 0;
}

- (void)_obtainEditsFromServiceAndNotifyPreviewCollectionOfDoneButtonTappedWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __121__QLPreviewController_Overlay___obtainEditsFromServiceAndNotifyPreviewCollectionOfDoneButtonTappedWithCompletionHandler___block_invoke;
  v6[3] = &unk_24C725740;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[QLPreviewController saveEditsIfNecessary:](self, "saveEditsIfNecessary:", v6);

}

uint64_t __121__QLPreviewController_Overlay___obtainEditsFromServiceAndNotifyPreviewCollectionOfDoneButtonTappedWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[QLPreviewController previewCollection](self, "previewCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __93__QLPreviewController_Overlay___notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C724DC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "toolbarButtonPressedWithIdentifier:completionHandler:", CFSTR("QLDoneButtonIdentifier"), v7);

}

void __93__QLPreviewController_Overlay___notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  QLRunInMainThread();

}

void __93__QLPreviewController_Overlay___notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "editedItems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)updateDoneButtonMenu
{
  void *v3;
  NSObject **v4;
  NSObject *v5;
  uint8_t v6[16];

  -[QLPreviewController _displayedButtonWithAccessibilityIdentifier:](self, "_displayedButtonWithAccessibilityIdentifier:", CFSTR("QLOverlayDoneButtonAccessibilityIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[QLPreviewController _updateDoneButtonMenu:](self, "_updateDoneButtonMenu:", v3);
  }
  else
  {
    v4 = (NSObject **)MEMORY[0x24BE7BF48];
    v5 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, "Could not update done button menu because it was not found #PreviewController", v6, 2u);
    }
  }

}

- (void)_updateDoneButtonMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  -[QLPreviewController _dismissActions](self, "_dismissActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "setPrimaryAction:", 0);
    objc_msgSend(MEMORY[0x24BEBD748], "menuWithTitle:image:identifier:options:children:", &stru_24C72A1F8, 0, 0, 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMenu:", v7);

  }
  else
  {
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x24BEBD388];
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __54__QLPreviewController_Overlay___updateDoneButtonMenu___block_invoke;
    v13 = &unk_24C7248E0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v8, "actionWithHandler:", &v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrimaryAction:", v9, v10, v11, v12, v13);

    objc_msgSend(v4, "setMenu:", 0);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __54__QLPreviewController_Overlay___updateDoneButtonMenu___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "saveAndForceDismissQuickLookAnimated:", 1);

}

- (void)dismissQuickLook
{
  void *v3;
  id v4;

  -[QLPreviewController _dismissActions](self, "_dismissActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
    -[QLPreviewController presentDismissActions:](self, "presentDismissActions:", v4);
  else
    -[QLPreviewController saveAndForceDismissQuickLookAnimated:](self, "saveAndForceDismissQuickLookAnimated:", 1);

}

- (void)presentDismissActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id location;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24 = objc_alloc_init(MEMORY[0x24BEBD3B0]);
  -[QLPreviewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourceView:", v5);

  -[QLPreviewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  -[QLPreviewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  objc_msgSend(v24, "popoverPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourceRect:", v9 * 0.5, v12 * 0.5, 1.0, 1.0);

  objc_initWeak(&location, self);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "attributes");
        if (v19 != 1)
        {
          if (v19 == 2)
          {
            v20 = 2;
          }
          else
          {
            if (v19 == 4)
              continue;
            v20 = 0;
          }
          v21 = (void *)MEMORY[0x24BEBD3A8];
          objc_msgSend(v18, "title");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __54__QLPreviewController_Overlay__presentDismissActions___block_invoke;
          v25[3] = &unk_24C726B98;
          v25[4] = v18;
          objc_copyWeak(&v26, &location);
          objc_msgSend(v21, "actionWithTitle:style:handler:", v22, v20, v25);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "addAction:", v23);
          objc_destroyWeak(&v26);
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v15);
  }

  -[QLPreviewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);
  objc_destroyWeak(&location);

}

void __54__QLPreviewController_Overlay__presentDismissActions___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "performWithSender:target:", WeakRetained, 0);

}

- (void)saveAndForceDismissQuickLookAnimated:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __69__QLPreviewController_Overlay__saveAndForceDismissQuickLookAnimated___block_invoke;
  v3[3] = &unk_24C725D00;
  v3[4] = self;
  v4 = a3;
  -[QLPreviewController _saveAndDismissQuickLookIfBlocked:](self, "_saveAndDismissQuickLookIfBlocked:", v3);
}

uint64_t __69__QLPreviewController_Overlay__saveAndForceDismissQuickLookAnimated___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_performQuickLookDismissalAnimated:", *(unsigned __int8 *)(result + 40));
  return result;
}

- (void)_saveAndDismissQuickLookIfBlocked:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  v5 = v4;
  QLRunInMainThread();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __66__QLPreviewController_Overlay___saveAndDismissQuickLookIfBlocked___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__QLPreviewController_Overlay___saveAndDismissQuickLookIfBlocked___block_invoke_2;
  v4[3] = &unk_24C726BC0;
  objc_copyWeak(&v6, v2);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_saveAndObtainEditsBeforeDismissalWithCompletionHandler:", v4);

  objc_destroyWeak(&v6);
}

uint64_t __66__QLPreviewController_Overlay___saveAndDismissQuickLookIfBlocked___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_dismissQuickLookIfBlocked");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveEditsIfNecessary:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[QLPreviewController _willStartObtainingEditsFromService](self, "_willStartObtainingEditsFromService");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__QLPreviewController_Overlay__saveEditsIfNecessary___block_invoke;
  v6[3] = &unk_24C726280;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[QLPreviewController obtainAndUpdateEditedCopyOfCurrentPreviewItem:](self, "obtainAndUpdateEditedCopyOfCurrentPreviewItem:", v6);

}

void __53__QLPreviewController_Overlay__saveEditsIfNecessary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_didObtainEditsFromService");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__QLPreviewController_Overlay__saveEditsIfNecessary___block_invoke_2;
  v8[3] = &unk_24C725870;
  v7 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v7, "didEditCopyOfPreviewItemAtIndex:editedCopy:completionHandler:", a2, v6, v8);

}

uint64_t __53__QLPreviewController_Overlay__saveEditsIfNecessary___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)menuActionsForDismissActions:(id)a3 containsAtLeastOneUnsavedCopy:(BOOL)a4 editedPreviewItems:(id)a5 shouldPresentDefaultActions:(BOOL)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _BOOL4 v35;
  id v36;
  uint64_t v37;
  void *v38;
  _BOOL4 v39;
  id obj;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  id from;
  _QWORD v47[6];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id location;
  _BYTE v54[128];
  uint64_t v55;

  v39 = a6;
  v35 = a4;
  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v36 = a5;
  -[QLPreviewController _editedItemsForDoneActionControllerWithItems:](self, "_editedItemsForDoneActionControllerWithItems:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v38, "count");
  v37 = v9;
  if (v39)
    v10 = v9 + 2;
  else
    v10 = v9;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v10);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v50 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x24BEBD388];
        objc_msgSend(v14, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "image");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke;
        v47[3] = &unk_24C726C10;
        objc_copyWeak(&v48, &location);
        v47[4] = v14;
        v47[5] = self;
        objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v16, v17, 0, v47);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "attributes"))
          objc_msgSend(v18, "setAttributes:", objc_msgSend(v14, "attributes"));
        objc_msgSend(v41, "addObject:", v18);

        objc_destroyWeak(&v48);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v11);
  }

  if (v39)
  {
    objc_initWeak(&from, self);
    v19 = (void *)MEMORY[0x24BEBD388];
    QLLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("folder"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_4;
    v44[3] = &unk_24C7248E0;
    objc_copyWeak(&v45, &from);
    objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v20, v21, 0, v44);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "addObject:", v22);
    v23 = (void *)MEMORY[0x24BEBD388];
    QLLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("trash"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_6;
    v42[3] = &unk_24C7248E0;
    objc_copyWeak(&v43, &from);
    objc_msgSend(v23, "actionWithTitle:image:identifier:handler:", v24, v25, 0, v42);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setAttributes:", 2);
    objc_msgSend(v41, "addObject:", v26);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v45);
    objc_destroyWeak(&from);
  }
  if (v37 == 1)
  {
    -[QLPreviewController internalCurrentPreviewItem](self, "internalCurrentPreviewItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "editedFileURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {

LABEL_21:
      v33 = v41;
      goto LABEL_22;
    }

    if (!v35)
      goto LABEL_21;
  }
  else if (!v35)
  {
    goto LABEL_21;
  }
  v29 = (void *)MEMORY[0x24BDD17C8];
  QLLocalizedDictionaryString();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringWithFormat:", v30, v37);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD748], "menuWithTitle:image:identifier:options:children:", v31, 0, 0, 1, v41);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v32);
  v33 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
  objc_destroyWeak(&location);

  return v33;
}

void __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  __int128 v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_2;
  v3[3] = &unk_24C726BE8;
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "_saveAndObtainEditedItemsBeforeDismissalWithCompletionHandler:", v3);

}

void __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  _QWORD v6[5];
  id v7;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldDismissQuickLookAutomatically"))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_3;
    v6[3] = &unk_24C724778;
    v4 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v3;
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, *(_QWORD *)(a1 + 32), v3);

  }
}

void __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_5;
  v6[3] = &unk_24C726C38;
  objc_copyWeak(&v7, v4);
  objc_msgSend(WeakRetained, "_saveAndObtainEditedItemsBeforeDismissalWithCompletionHandler:", v6);

  objc_destroyWeak(&v7);
}

void __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "presentSaveToFilesForEditedItems:", v3);

}

void __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)_dismissActions
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  -[QLPreviewController editedItems](self, "editedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "count") != 0;
  else
    v5 = 0;
  -[QLPreviewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldPresentDismissActionsWithoutEditedItemsForPreviewController:", self);

  }
  else
  {
    v8 = 0;
  }

  if ((v5 | v8) == 1)
  {
    -[QLPreviewController _dismissActionsForEditedPreviewItems:](self, "_dismissActionsForEditedPreviewItems:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_dismissActionsForEditedPreviewItems:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  QLPreviewController *v24;
  void *v25;
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[QLPreviewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v7, "shouldAppendDefaultDismissActionsForPreviewController:", self);

  }
  else
  {
    v26 = 1;
  }
  -[QLPreviewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissActionsForPreviewController:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBD1A8];
  }
  v24 = self;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v19, "editingMode", v24) == 4 || objc_msgSend(v19, "editingMode") == 3)
          v16 = 1;
        objc_msgSend(v19, "editedFileURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v15 |= v20 != 0;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }

  if (objc_msgSend(v11, "count"))
    v21 = v26;
  else
    v21 = v16 & v26;
  if (objc_msgSend(v11, "count", v24) || (_DWORD)v21)
  {
    objc_msgSend(v25, "menuActionsForDismissActions:containsAtLeastOneUnsavedCopy:editedPreviewItems:shouldPresentDefaultActions:", v11, v15 & 1, v12, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)_performQuickLookDismissalAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject **v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  v3 = a3;
  if (-[QLPreviewController presentationMode](self, "presentationMode") == 1)
  {
    v5 = (NSObject **)MEMORY[0x24BE7BF48];
    v6 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_INFO, "Triggered dismissal of pushed QLPreviewController using Back button. #PreviewController", buf, 2u);
    }
    -[QLPreviewController internalNavigationController](self, "internalNavigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", v3);

  }
  else
  {
    -[QLPreviewController presentingViewController](self, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (NSObject **)MEMORY[0x24BE7BF48];
    v11 = *MEMORY[0x24BE7BF48];
    if (v9)
    {
      if (!v11)
      {
        QLSInitLogging();
        v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_INFO, "Triggered dismissal of modal QLPreviewController using Done button. #PreviewController", v19, 2u);
      }
      -[QLPreviewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, 0);
    }
    else
    {
      if (!v11)
      {
        QLSInitLogging();
        v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_INFO, "Triggered dismissal of modal QLPreviewController using Done button (No presentingVC so calling delegate methods). #PreviewController", v18, 2u);
      }
      -[QLPreviewController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[QLPreviewController delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "previewControllerWillDismiss:", self);

      }
      -[QLPreviewController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[QLPreviewController delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "previewControllerDidDismiss:", self);

      }
    }
  }
}

- (BOOL)_canPerformBarButtonAction
{
  void *v3;
  void *v4;
  NSObject **v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[QLPreviewController currentAnimator](self, "currentAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[QLPreviewController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      LOBYTE(v7) = 1;
      return v7;
    }
  }
  v5 = (NSObject **)MEMORY[0x24BE7BF48];
  v6 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v6 = *v5;
  }
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v7)
  {
    v8 = v6;
    -[QLPreviewController currentAnimator](self, "currentAnimator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController presentedViewController](self, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController previewCollection](self, "previewCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isRemote");
    v13 = CFSTR("NO");
    v15 = 138412802;
    v16 = v9;
    v17 = 2112;
    if (v12)
      v13 = CFSTR("YES");
    v18 = v10;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_20D4F5000, v8, OS_LOG_TYPE_INFO, "Can't perform bar button action. Current animator: %@ Presented view controller: %@. Remote: %@ #Generic", (uint8_t *)&v15, 0x20u);

    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_willStartObtainingEditsFromService
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[QLPreviewController _triggerOverlayUpdateAfterDelay](self, "_triggerOverlayUpdateAfterDelay");
  -[QLPreviewController setIsObtainingEditsFromServiceBeforeDismissing:](self, "setIsObtainingEditsFromServiceBeforeDismissing:", 1);
}

- (void)_didObtainEditsFromService
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[QLPreviewController setIsObtainingEditsFromServiceBeforeDismissing:](self, "setIsObtainingEditsFromServiceBeforeDismissing:", 0);
}

- (void)_triggerOverlayUpdateAfterDelay
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, (uint64_t)(*MEMORY[0x24BE7C008] * 1000000000.0));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__QLPreviewController_Overlay___triggerOverlayUpdateAfterDelay__block_invoke;
  v3[3] = &unk_24C725230;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __63__QLPreviewController_Overlay___triggerOverlayUpdateAfterDelay__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "isObtainingEditsFromServiceBeforeDismissing");

  if (v3)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "updateOverlayAnimated:forceRefresh:", 0, 0);

  }
}

- (void)shareSheetDidDismiss
{
  void *v3;
  void (**v4)(void);
  id v5;

  -[QLPreviewController _stopAccessingUrlForSharingController](self, "_stopAccessingUrlForSharingController");
  -[QLPreviewController setCustomURLSharingProxyDelegate:](self, "setCustomURLSharingProxyDelegate:", 0);
  -[QLPreviewController setShareSheetPopoverTracker:](self, "setShareSheetPopoverTracker:", 0);
  -[QLPreviewController setCurrentItemProvider:](self, "setCurrentItemProvider:", 0);
  -[QLPreviewController setSharingInteractionController:](self, "setSharingInteractionController:", 0);
  -[QLPreviewController shareSheetDismissCompletion](self, "shareSheetDismissCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[QLPreviewController shareSheetDismissCompletion](self, "shareSheetDismissCompletion");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[QLPreviewController setShareSheetDismissCompletion:](self, "setShareSheetDismissCompletion:", 0);
  }
  -[QLPreviewController previewCollection](self, "previewCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSheetDidDismiss");

}

- (void)didSelectPreviewItem:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__QLPreviewController_Overlay__didSelectPreviewItem___block_invoke;
  v6[3] = &unk_24C724778;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[QLPreviewController saveEditsIfNecessary:](self, "saveEditsIfNecessary:", v6);

}

void __53__QLPreviewController_Overlay__didSelectPreviewItem___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  QLRunInMainThread();

}

void __53__QLPreviewController_Overlay__didSelectPreviewItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "previewItemStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCurrentPreviewItemIndex:", objc_msgSend(v3, "indexOfPreviewItem:", *(_QWORD *)(a1 + 40)));

}

- (id)_editedItemsForDoneActionControllerWithItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  QLEditedItem *v12;
  void *v13;
  QLEditedItem *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v10, "originalContentWasUpdated", (_QWORD)v16) & 1) != 0)
          objc_msgSend(v10, "saveURL");
        else
          objc_msgSend(v10, "editedFileURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = [QLEditedItem alloc];
        objc_msgSend(v10, "originalPreviewItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[QLEditedItem initWithItem:editedFileURL:](v12, "initWithItem:editedFileURL:", v13, v11);

        objc_msgSend(v4, "addObject:", v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_needsListButton
{
  void *v3;
  BOOL v4;

  -[QLPreviewController excludedToolbarButtonIdentifiers](self, "excludedToolbarButtonIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "containsObject:", CFSTR("QLListButtonIdentifier")) & 1) == 0
    && -[QLPreviewController numberOfPreviewItems](self, "numberOfPreviewItems") >= 2
    && -[QLPreviewController canChangeCurrentPage](self, "canChangeCurrentPage")
    && -[QLPreviewController presentationStyle](self, "presentationStyle") != 1;

  return v4;
}

- (BOOL)_isToolbarVisibleForTraitCollection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  char v11;
  BOOL v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  -[QLPreviewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (unint64_t)(objc_msgSend(v8, "interfaceOrientation") - 3) < 2;
  else
    v9 = 0;
  v10 = objc_msgSend(v4, "horizontalSizeClass");
  v11 = !v9;
  if (v5)
    v11 = 1;
  if (v10 == 1)
    v12 = v11;
  else
    v12 = 0;

  return v12;
}

- (id)_copyBarButtons:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "ql_copySystemItem", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_displayedButtonWithAccessibilityIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[QLPreviewController _topViewController](self, "_topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toolbarItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController _buttonWithAccessibilityIdentifierPointer:inButtons:](self, "_buttonWithAccessibilityIdentifierPointer:inButtons:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[QLPreviewController _topViewController](self, "_topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leftBarButtonItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewController _buttonWithAccessibilityIdentifierPointer:inButtons:](self, "_buttonWithAccessibilityIdentifierPointer:inButtons:", v4, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[QLPreviewController _topViewController](self, "_topViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rightBarButtonItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewController _buttonWithAccessibilityIdentifierPointer:inButtons:](self, "_buttonWithAccessibilityIdentifierPointer:inButtons:", v4, v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

+ (void)logDeprecatedMessageForMethodName:(id)a3
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  v5 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_DEFAULT, "Warning: The method '%{public}@' is deprecated and soon will be removed. #Deprecated", (uint8_t *)&v6, 0xCu);
  }

}

+ (void)logDeprecatedMessageForSelector:(SEL)a3
{
  id v3;

  NSStringFromSelector(a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[QLPreviewController logDeprecatedMessageForMethodName:](QLPreviewController, "logDeprecatedMessageForMethodName:", v3);

}

+ (id)contentTypeForPreviewItem:(id)a3
{
  +[QLPreviewController logDeprecatedMessageForSelector:](QLPreviewController, "logDeprecatedMessageForSelector:", a2);
  return 0;
}

+ (id)titleForPreviewItem:(id)a3
{
  +[QLPreviewController logDeprecatedMessageForSelector:](QLPreviewController, "logDeprecatedMessageForSelector:", a2);
  return 0;
}

+ (BOOL)copyPreviewItemToPasteboard:(id)a3
{
  +[QLPreviewController logDeprecatedMessageForSelector:](QLPreviewController, "logDeprecatedMessageForSelector:", a2);
  return 0;
}

- (void)setCurrentOrbMode:(unint64_t)a3
{
  +[QLPreviewController logDeprecatedMessageForSelector:](QLPreviewController, "logDeprecatedMessageForSelector:", a2);
}

- (unint64_t)currentOrbMode
{
  +[QLPreviewController logDeprecatedMessageForSelector:](QLPreviewController, "logDeprecatedMessageForSelector:", a2);
  return 0;
}

- (int)mode
{
  +[QLPreviewController logDeprecatedMessageForSelector:](QLPreviewController, "logDeprecatedMessageForSelector:", a2);
  return 0;
}

+ (BOOL)canPreviewDocumentType:(id)a3
{
  +[QLPreviewController logDeprecatedMessageForSelector:](QLPreviewController, "logDeprecatedMessageForSelector:", a2);
  return 0;
}

+ (BOOL)canPreviewMIMEType:(id)a3
{
  +[QLPreviewController logDeprecatedMessageForSelector:](QLPreviewController, "logDeprecatedMessageForSelector:", a2);
  return 0;
}

+ (void)presentPreviewItem:(id)a3 onViewController:(id)a4 withDelegate:(id)a5 animated:(BOOL)a6
{
  +[QLPreviewController logDeprecatedMessageForSelector:](QLPreviewController, "logDeprecatedMessageForSelector:", a2, a4, a5, a6);
}

- (void)_prepareDelayedAppearance
{
  +[QLPreviewController logDeprecatedMessageForSelector:](QLPreviewController, "logDeprecatedMessageForSelector:", a2);
}

- (id)currentTracker
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[QLPreviewController swipeDownTracker](self, "swipeDownTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[QLPreviewController pinchRotationTracker](self, "pinchRotationTracker");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)animatorForShowing:(BOOL)a3 previewController:(id)a4 presentingController:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject **v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v6 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[QLPreviewController _reloadDataIfNeeded](self, "_reloadDataIfNeeded");
  if (-[QLPreviewController hasItemsToPreview](self, "hasItemsToPreview")
    && (!-[QLPreviewController modalPresentationStyle](self, "modalPresentationStyle")
     || -[QLPreviewController modalPresentationStyle](self, "modalPresentationStyle") == 6
     || -[QLPreviewController modalPresentationStyle](self, "modalPresentationStyle") == 5)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[QLPreviewController currentAnimator](self, "currentAnimator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = (void *)objc_opt_new();
      -[QLPreviewController setCurrentAnimator:](self, "setCurrentAnimator:", v10);
    }
    -[QLPreviewController currentAnimator](self, "currentAnimator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShowing:", v6);

    v13 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      v16 = (NSObject **)MEMORY[0x24BE7BF48];
      QLSInitLogging();
      v13 = *v16;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      NSStringFromBOOL();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v10;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_20D4F5000, v14, OS_LOG_TYPE_INFO, "Returning transition animator: %@ for previewController: %@ showing: %@ #AppearanceTransition", (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)shouldUseNativeTransition
{
  void *v3;
  BOOL v4;

  if (!_os_feature_enabled_impl())
    return 0;
  -[QLPreviewController preferredTransition](self, "preferredTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  if (-[QLPreviewController shouldUseNativeTransition](self, "shouldUseNativeTransition"))
  {
    v9 = 0;
  }
  else
  {
    -[QLPreviewController animatorForShowing:previewController:presentingController:](self, "animatorForShowing:previewController:presentingController:", 1, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[QLPreviewController shouldUseNativeTransition](self, "shouldUseNativeTransition"))
  {
    v5 = 0;
  }
  else
  {
    -[QLPreviewController animatorForShowing:previewController:presentingController:](self, "animatorForShowing:previewController:presentingController:", 0, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)interactionControllerForPresentation:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[QLPreviewController shouldUseNativeTransition](self, "shouldUseNativeTransition"))
  {
    v5 = 0;
  }
  else
  {
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_2549EB558))
      v6 = v4;
    else
      v6 = 0;
    v5 = v6;
  }

  return v5;
}

- (id)interactionControllerForDismissal:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[QLPreviewController shouldUseNativeTransition](self, "shouldUseNativeTransition"))
  {
    v5 = 0;
  }
  else
  {
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_2549EB558))
      v6 = v4;
    else
      v6 = 0;
    v5 = v6;
  }

  return v5;
}

@end
