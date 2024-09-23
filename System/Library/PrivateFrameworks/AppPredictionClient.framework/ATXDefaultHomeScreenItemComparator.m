@implementation ATXDefaultHomeScreenItemComparator

- (void)loadDefaultItemsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[ATXDefaultHomeScreenItemManager sharedInstance](ATXDefaultHomeScreenItemManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
    v6 = 2;
  else
    v6 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__ATXDefaultHomeScreenItemComparator_loadDefaultItemsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4D57958;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "fetchSuggestedGalleryItemsOfGridSize:widgetFamilyMask:withCompletionHandler:", v6, 7294, v8);

}

void __76__ATXDefaultHomeScreenItemComparator_loadDefaultItemsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setGalleryItems:", a2);
    +[ATXDefaultHomeScreenItemManager sharedInstance](ATXDefaultHomeScreenItemManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__ATXDefaultHomeScreenItemComparator_loadDefaultItemsWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E4D57958;
    v5 = *(id *)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    objc_msgSend(v4, "fetchSmartStackOfVariant:completionHandler:", 0, v6);

  }
}

uint64_t __76__ATXDefaultHomeScreenItemComparator_loadDefaultItemsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;

  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(a2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDefaultStack:", v5);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (unint64_t)rankOfWidgetSuggestedInGallery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ATXDefaultHomeScreenItemComparator galleryItems](self, "galleryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ATXDefaultHomeScreenItemComparator galleryItems](self, "galleryItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__ATXDefaultHomeScreenItemComparator_rankOfWidgetSuggestedInGallery___block_invoke;
    v9[3] = &unk_1E4D57C90;
    v10 = v4;
    v11 = &v12;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

    v7 = v13[3];
  }
  else
  {
    v7 = v13[3];
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __69__ATXDefaultHomeScreenItemComparator_rankOfWidgetSuggestedInGallery___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = v15;
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v9, "avocadoDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extensionBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avocadoDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "kind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "isSameWidgetAsWidgetBundleId:widgetKind:", v12, v14);

    if ((_DWORD)v10)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 + 1;
      *a4 = 1;
    }

    v8 = v15;
  }

}

- (BOOL)isStackDefaultStack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  -[ATXDefaultHomeScreenItemComparator defaultStack](self, "defaultStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    switch(objc_msgSend(v4, "stackLayoutSize"))
    {
      case 0:
        -[ATXDefaultHomeScreenItemComparator defaultStack](self, "defaultStack");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "smallDefaultStack");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 1:
        -[ATXDefaultHomeScreenItemComparator defaultStack](self, "defaultStack");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "mediumDefaultStack");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 2:
        -[ATXDefaultHomeScreenItemComparator defaultStack](self, "defaultStack");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "largeDefaultStack");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 3:
        __atxlog_handle_home_screen();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[ATXDefaultHomeScreenItemComparator isStackDefaultStack:].cold.1(v9);

        v8 = 0;
        goto LABEL_14;
      case 4:
        -[ATXDefaultHomeScreenItemComparator defaultStack](self, "defaultStack");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "extraLargeDefaultStack");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v8 = (id)v7;

        break;
      default:
        v8 = 0;
        break;
    }
    objc_msgSend(v4, "widgets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = objc_msgSend(v8, "count");

    if (v11 == v12)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 1;
      objc_msgSend(v4, "widgets");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __58__ATXDefaultHomeScreenItemComparator_isStackDefaultStack___block_invoke;
      v14[3] = &unk_1E4D57CB8;
      v8 = v8;
      v15 = v8;
      v16 = &v17;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);

      LOBYTE(v5) = *((_BYTE *)v18 + 24) != 0;
      _Block_object_dispose(&v17, 8);
    }
    else
    {
LABEL_14:
      LOBYTE(v5) = 0;
    }

  }
  return (char)v5;
}

void __58__ATXDefaultHomeScreenItemComparator_isStackDefaultStack___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "avocadoDescriptor");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "extensionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "kind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isSameWidgetAsWidgetBundleId:widgetKind:", v10, v11);

  if ((v12 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (NSArray)galleryItems
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGalleryItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (ATXDefaultWidgetStack)defaultStack
{
  return (ATXDefaultWidgetStack *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDefaultStack:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultStack, 0);
  objc_storeStrong((id *)&self->_galleryItems, 0);
}

- (void)isStackDefaultStack:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "Attempted to run ATXDefaultHomeScreenItemComparator on a 6x4 stack", v1, 2u);
}

@end
