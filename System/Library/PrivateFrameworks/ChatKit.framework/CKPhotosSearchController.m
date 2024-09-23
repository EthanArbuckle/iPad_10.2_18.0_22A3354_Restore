@implementation CKPhotosSearchController

- (CKPhotosSearchController)init
{
  CKPhotosSearchController *v2;
  CKPhotosSearchController *v3;
  CKQLPreviewControllerDataSource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKPhotosSearchController;
  v2 = -[CKPhotosSearchController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CKPhotosSearchController setContentMode:](v2, "setContentMode:", 0);
    v4 = objc_alloc_init(CKQLPreviewControllerDataSource);
    -[CKSearchController setQlPreviewDataSource:](v3, "setQlPreviewDataSource:", v4);

  }
  return v3;
}

- (void)setContentMode:(unint64_t)a3
{
  self->_contentMode = a3;
}

- (unint64_t)searchTokenContentType
{
  return 3;
}

- (id)fetchAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[12];

  v8[11] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA67C0];
  v8[0] = *MEMORY[0x1E0CA67D8];
  v8[1] = v2;
  v3 = *MEMORY[0x1E0CA6018];
  v8[2] = *MEMORY[0x1E0CA6048];
  v8[3] = v3;
  v4 = *MEMORY[0x1E0CA6108];
  v8[4] = *MEMORY[0x1E0CA60D0];
  v8[5] = v4;
  v5 = *MEMORY[0x1E0CA6510];
  v8[6] = *MEMORY[0x1E0CA68B8];
  v8[7] = v5;
  v6 = *MEMORY[0x1E0CA63E0];
  v8[8] = *MEMORY[0x1E0CA5F30];
  v8[9] = v6;
  v8[10] = *MEMORY[0x1E0CA6488];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)queryAttributesForText:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", *MEMORY[0x1E0CA67D8], *MEMORY[0x1E0CA67C0], *MEMORY[0x1E0CA6910], *MEMORY[0x1E0CA6678], *MEMORY[0x1E0CA6688], *MEMORY[0x1E0CA6630], 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    return v4;
  }
  else
  {
    v6[0] = *MEMORY[0x1E0CA6910];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)filterQueriesBase
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (-[CKPhotosSearchController contentMode](self, "contentMode"))
  {
    if (-[CKPhotosSearchController contentMode](self, "contentMode") == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6198], CFSTR("attachmentDomain"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v3;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\" || %@ == \"%@\" || %@ == \"%@\"), *MEMORY[0x1E0CA6488], CFSTR("pto"), *MEMORY[0x1E0CA6488], CFSTR("mov"), *MEMORY[0x1E0CA6488], CFSTR("apto"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9[1] = v4;
      v5 = v9;
    }
    else
    {
      if (-[CKPhotosSearchController contentMode](self, "contentMode") != 2)
        return 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6198], CFSTR("attachmentDomain"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v3;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6488], CFSTR("scr"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8[1] = v4;
      v5 = v8;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6198], CFSTR("attachmentDomain"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\" || %@ == \"%@\" || %@ == \"%@\" || %@ == \"%@\"), *MEMORY[0x1E0CA6488], CFSTR("pto"), *MEMORY[0x1E0CA6488], CFSTR("mov"), *MEMORY[0x1E0CA6488], CFSTR("apto"), *MEMORY[0x1E0CA6488], CFSTR("scr"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    v5 = v10;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)detailsFilterQueriesForChatGUIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    v8 = *MEMORY[0x1E0CA5F30];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), v8, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__CKPhotosSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  v13[3] = &unk_1E274B9A0;
  v13[4] = &v14;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
  v24 = v15[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __61__CKPhotosSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" || %@"), a2);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v12);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = (void *)v12;
  }
  else
  {
    objc_msgSend(*(id *)(v4 + 40), "stringByAppendingString:", a2);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }

}

- (id)queryResultsForItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CKSpotlightQueryResult *v21;
  void *v22;
  CKSpotlightQueryResult *v23;
  unint64_t v24;
  void *v25;
  id v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKSearchController mode](self, "mode") == 1)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v31 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[CKSearchController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchTokenFiltersForSearchController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v7, "count");

    v8 = -[CKPhotosSearchController maxResultsForMode:](self, "maxResultsForMode:", -[CKSearchController mode](self, "mode"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v10)
    {
      v11 = v10;
      v32 = *(_QWORD *)v35;
      v28 = v9;
      v29 = v8;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
        -[CKPhotosSearchController chatGUIDForSearchableItem:](self, "chatGUIDForSearchableItem:", v13, v27);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKSearchController delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "searchController:conversationForChatGUID:", self, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 && (objc_msgSend(v16, "isBlockedByCommunicationLimits") & 1) == 0)
        {
          v17 = v5;
          objc_msgSend(v13, "attributeSet");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "authorAddresses");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30 || (objc_msgSend(v31, "containsObject:", v20) & 1) == 0)
          {
            if (v20)
              objc_msgSend(v31, "addObject:", v20);
            v21 = [CKSpotlightQueryResult alloc];
            objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[CKSpotlightQueryResult initWithSearchableItem:inSection:withConversation:](v21, "initWithSearchableItem:inSection:withConversation:", v13, v22, v16);

            objc_msgSend(v17, "addObject:", v23);
          }

          v5 = v17;
          v9 = v28;
          v8 = v29;
        }
        v24 = objc_msgSend(v5, "count");

        if (v24 >= v8)
          break;
        if (v11 == ++v12)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v11)
            goto LABEL_4;
          break;
        }
      }
    }

    v25 = (void *)objc_msgSend(v5, "copy");
    v4 = v27;
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)CKPhotosSearchController;
    -[CKMessageTypeSearchController queryResultsForItems:](&v33, sel_queryResultsForItems_, v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  return 1;
}

+ (BOOL)supportsMacSelection
{
  return 1;
}

+ (id)sectionTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_PHOTOS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sectionSubtitle
{
  void *v2;
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
  uint64_t v14;
  __CFString *v15;
  void *v16;

  -[CKSearchController results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentCreationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKPhotosSearchController relativeDateFormatter](CKPhotosSearchController, "relativeDateFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LAST_UPDATED_TIMESTAMP"), &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceLayoutDirection");

  if (v14 == 1)
    v15 = CFSTR("\u200F");
  else
    v15 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)relativeDateFormatter
{
  if (relativeDateFormatter_once != -1)
    dispatch_once(&relativeDateFormatter_once, &__block_literal_global_16);
  return (id)relativeDateFormatter_sRelativeDateFormatter;
}

uint64_t __49__CKPhotosSearchController_relativeDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)relativeDateFormatter_sRelativeDateFormatter;
  relativeDateFormatter_sRelativeDateFormatter = (uint64_t)v0;

  objc_msgSend((id)relativeDateFormatter_sRelativeDateFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)relativeDateFormatter_sRelativeDateFormatter, "setDateStyle:", 1);
  v2 = (void *)relativeDateFormatter_sRelativeDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "__ck_currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)relativeDateFormatter_sRelativeDateFormatter, "setDoesRelativeDateFormatting:", 1);
  return objc_msgSend((id)relativeDateFormatter_sRelativeDateFormatter, "setFormattingContext:", 2);
}

+ (id)sectionIdentifier
{
  return CFSTR("PhotosSearchSection");
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  return +[CKPhotoSearchResultCell reuseIdentifier](CKPhotoSearchResultCell, "reuseIdentifier", a3);
}

+ (id)indexingString
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PHOTOS_INDEXING_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  return (Class)objc_opt_class();
}

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  unint64_t result;
  objc_super v6;
  objc_super v7;

  switch(-[CKSearchController mode](self, "mode"))
  {
    case 0uLL:
    case 1uLL:
      if (CKIsRunningInMacCatalyst())
        result = 9;
      else
        result = -[CKMessageTypeSearchController maxResultsForMode:](&v7, sel_maxResultsForMode_, a3, v6.receiver, v6.super_class, self, CKPhotosSearchController);
      break;
    case 2uLL:
    case 4uLL:
      result = -[CKMessageTypeSearchController maxResultsForMode:](&v6, sel_maxResultsForMode_, a3, self, CKPhotosSearchController, v7.receiver, v7.super_class);
      break;
    case 3uLL:
      if (CKIsRunningInMacCatalyst())
        result = 9;
      else
        result = 6;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (double)_internalInterGroupSpacing
{
  void *v3;
  double v4;
  double v5;
  unint64_t v7;
  void *v8;

  if (-[CKSearchController mode](self, "mode") == 2 || -[CKSearchController mode](self, "mode") == 4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchPhotosZKWAndDetailsInterItemSpacing");
  }
  else
  {
    v7 = -[CKSearchController mode](self, "mode");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v8;
    if (v7 == 3)
      objc_msgSend(v8, "searchPhotosInterItemSpacingDetailsView");
    else
      objc_msgSend(v8, "searchPhotosInterItemSpacing");
  }
  v5 = v4;

  return v5;
}

- (double)interGroupSpacing
{
  double v2;

  -[CKPhotosSearchController _internalInterGroupSpacing](self, "_internalInterGroupSpacing");
  return v2 * 0.5;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  if (CKIsRunningInMacCatalyst())
    return 1;
  if (-[CKSearchController mode](self, "mode") == 2)
    return 0;
  return -[CKSearchController mode](self, "mode") != 4;
}

- (BOOL)wantsHeaderSection
{
  objc_super v4;

  if (-[CKSearchController mode](self, "mode") == 2 || -[CKSearchController mode](self, "mode") == 4)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CKPhotosSearchController;
  return -[CKSearchController wantsHeaderSection](&v4, sel_wantsHeaderSection);
}

- (Class)headerOverrideClass
{
  void *v3;

  if (CKIsRunningInMacCatalyst()
    || -[CKSearchController mode](self, "mode") == 2
    || -[CKSearchController mode](self, "mode") == 4)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (Class)v3;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[CKDetailsSearchResultsFooterCell supplementaryViewType](CKDetailsSearchResultsFooterCell, "supplementaryViewType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    +[CKDetailsSearchResultsFooterCell supplementaryViewType](CKDetailsSearchResultsFooterCell, "supplementaryViewType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKDetailsSearchResultsFooterCell reuseIdentifier](CKDetailsSearchResultsFooterCell, "reuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v13, v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SEE_ALL_PHOTOS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

    if (v21 == 1)
      v22 = CFSTR("\u200F");
    else
      v22 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setTitle:", v23);
    objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSectionIdentifier:", v24);
    goto LABEL_11;
  }
  +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v10, "isEqualToString:", v25);

  if (!v26)
  {
    +[CKPhotosSearchResultsModeHeaderReusableView supplementaryViewType](CKPhotosSearchResultsModeHeaderReusableView, "supplementaryViewType");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v10, "isEqualToString:", v34);

    if (!v35)
    {
      v15 = 0;
      goto LABEL_12;
    }
    +[CKPhotosSearchResultsModeHeaderReusableView supplementaryViewType](CKPhotosSearchResultsModeHeaderReusableView, "supplementaryViewType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKPhotosSearchResultsModeHeaderReusableView reuseIdentifier](CKPhotosSearchResultsModeHeaderReusableView, "reuseIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v36, v37, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "control");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addTarget:action:forControlEvents:", self, sel__filterControlTapped_, 4096);
    goto LABEL_11;
  }
  +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSearchAvatarSupplementryView reuseIdentifier](CKSearchAvatarSupplementryView, "reuseIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v27, v28, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v9, "row");
  -[CKSearchController results](self, "results");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v29 < v31)
  {
    -[CKSearchController results](self, "results");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndex:", objc_msgSend(v9, "row"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKSpotlightQueryResultUtilities contactForResult:](CKSpotlightQueryResultUtilities, "contactForResult:", v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContact:", v33);
    objc_msgSend(v15, "setAssociatedResult:", v24);
    objc_msgSend(v15, "setParentContentType:", 0);

LABEL_11:
  }
LABEL_12:

  return v15;
}

- (void)updateSupplementryViewIfNeeded:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v16 = v6;
  v8 = objc_msgSend(v7, "row");
  -[CKSearchController results](self, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 >= v10)
  {
    v12 = 0;
  }
  else
  {
    -[CKSearchController results](self, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "associatedResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if ((v14 & 1) == 0)
    {
      +[CKSpotlightQueryResultUtilities contactForResult:](CKSpotlightQueryResultUtilities, "contactForResult:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setContact:", v15);
      objc_msgSend(v16, "setAssociatedResult:", v12);
      objc_msgSend(v16, "setNeedsLayout");

    }
  }

}

- (void)_filterControlTapped:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = objc_msgSend(a3, "selectedSegmentIndex");
  if (v4 == 1)
    v5 = 1;
  else
    v5 = 2 * (v4 == 2);
  if (-[CKPhotosSearchController contentMode](self, "contentMode") != v5)
  {
    -[CKPhotosSearchController setContentMode:](self, "setContentMode:", v5);
    -[CKSearchController currentSearchText](self, "currentSearchText");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CKMessageTypeSearchController searchWithText:mode:](self, "searchWithText:mode:", v6, -[CKSearchController mode](self, "mode"));

  }
}

- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5
{
  double v9;
  int v10;
  unint64_t v11;
  objc_super v12;

  if (-[CKSearchController mode](self, "mode") == 2 || -[CKSearchController mode](self, "mode") == 4)
  {
    if (a5)
    {
      if (a5 == 2)
      {
        if (CKIsRunningInMacCatalyst())
          v9 = 0.33;
        else
          v9 = 0.25;
        v10 = CKIsRunningInMacCatalyst();
        v11 = 3;
        if (!v10)
          v11 = 4;
        if (!a3)
        {
LABEL_22:
          if (!a4)
            return;
          goto LABEL_23;
        }
      }
      else
      {
        v11 = 3;
        v9 = 0.33;
        if (!a3)
          goto LABEL_22;
      }
    }
    else
    {
      v9 = 0.5;
      v11 = 2;
      if (!a3)
        goto LABEL_22;
    }
    *a3 = v9;
    goto LABEL_22;
  }
  if (-[CKSearchController mode](self, "mode") != 3 && !CKIsRunningInMacCatalyst())
  {
    v12.receiver = self;
    v12.super_class = (Class)CKPhotosSearchController;
    -[CKMessageTypeSearchController fractionalWidth:count:forLayoutWidth:](&v12, sel_fractionalWidth_count_forLayoutWidth_, a3, a4, a5);
    return;
  }
  if (a3)
    *a3 = 0.33;
  if (a4)
  {
    v11 = 3;
LABEL_23:
    *a4 = v11;
  }
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
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
  uint64_t v27;
  double v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = 0.0;
  -[CKPhotosSearchController fractionalWidth:count:forLayoutWidth:](self, "fractionalWidth:count:forLayoutWidth:", &v28, &v27, -[CKSearchController layoutWidth](self, "layoutWidth", a3));
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKSearchController suppressAvatars](self, "suppressAvatars"))
  {
    objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CEA1C0];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchResultAvatarSize");
    objc_msgSend(v7, "absoluteDimension:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v9, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    if (v11 == 1)
      v12 = 3;
    else
      v12 = 9;
    v13 = -6.0;
    if (v11 == 1)
      v13 = 6.0;
    objc_msgSend(MEMORY[0x1E0CEA1A8], "layoutAnchorWithEdges:absoluteOffset:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CEA200];
    +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v10, v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CEA1E0];
    v29[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "itemWithLayoutSize:supplementaryItems:", v5, v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeWithWidthDimension:heightDimension:", v21, v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1D0], "horizontalGroupWithLayoutSize:subitem:count:", v22, v6, v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CEA1F8];
  -[CKPhotosSearchController _internalInterGroupSpacing](self, "_internalInterGroupSpacing");
  objc_msgSend(v24, "fixedSpacing:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setInterItemSpacing:", v25);

  return v23;
}

- (id)_additionalMenuElementsForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("square.and.arrow.down"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  if (CKIsRunningInMacCatalyst())
  {
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SEARCH_ADD_TO_PHOTOS_LIBRARY"), &stru_1E276D870, CFSTR("ChatKit"));
  }
  else
  {
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SEARCH_SAVE"), &stru_1E276D870, CFSTR("ChatKit"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CEA2A8];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__CKPhotosSearchController__additionalMenuElementsForResult___block_invoke;
  v15[3] = &unk_1E274B010;
  objc_copyWeak(&v17, &location);
  v9 = v4;
  v16 = v9;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v7, v5, 0, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    objc_msgSend(v11, "addObject:", v10);
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __61__CKPhotosSearchController__additionalMenuElementsForResult___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "saveAttachmentForResult:", *(_QWORD *)(a1 + 32));

}

- (id)previewViewControllerForResult:(id)a3
{
  id v4;
  CKQLPreviewController *v5;
  CKQLPreviewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CD3258], "requestPreviewMockSceneActivation");
    v5 = (CKQLPreviewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(CKQLPreviewController);
  }
  v6 = v5;
  -[CKSearchController qlPreviewDataSource](self, "qlPreviewDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchController results](self, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreviewItems:", v8);

  -[CKSearchController qlPreviewDataSource](self, "qlPreviewDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController setDataSource:](v6, "setDataSource:", v9);

  -[QLPreviewController reloadData](v6, "reloadData");
  -[CKSearchController results](self, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v4);

  -[QLPreviewController setCurrentPreviewItemIndex:](v6, "setCurrentPreviewItemIndex:", v11);
  -[QLPreviewController refreshCurrentPreviewItem](v6, "refreshCurrentPreviewItem");
  -[QLPreviewController setDelegate:](v6, "setDelegate:", self);
  return v6;
}

- (id)itemProviderForSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKPhotosSearchController;
  -[CKMessageTypeSearchController itemProviderForSearchResult:](&v17, sel_itemProviderForSearchResult_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_6:
    v11 = v5;
    goto LABEL_12;
  }
  objc_msgSend(v4, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[CKLivePhotoBundleUtilities calculateLivePhotoVideoPath:](CKLivePhotoBundleUtilities, "calculateLivePhotoVideoPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __56__CKPhotosSearchController_itemProviderForSearchResult___block_invoke;
      v14[3] = &unk_1E274B9C8;
      v15 = v9;
      objc_msgSend(v5, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.MobileSMS.appendedURL"), 0, v14);

    }
    goto LABEL_6;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "search result returned nil URL while create NSItemProvider", buf, 2u);
    }

  }
  v11 = 0;
LABEL_12:

  return v11;
}

uint64_t __56__CKPhotosSearchController_itemProviderForSearchResult___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4, 0);

  return 0;
}

- (id)_activityItemProviderForResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  CKSearchActivityItemProvider *v14;

  v3 = a3;
  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedPreviewForQueryResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "contentURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__ck_spotlightItemSnippet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0CC1160]);
    IMUTITypeForFilename();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setType:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v5);
    objc_msgSend(v10, "setThumbnail:", v12);
    v13 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
    objc_msgSend(v13, "setSpecialization:", v10);
    v14 = -[CKSearchActivityItemProvider initWithPlaceholderItem:metadata:]([CKSearchActivityItemProvider alloc], "initWithPlaceholderItem:metadata:", v8, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)saveAttachmentForResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CKAttachmentItem *v11;
  CKAttachmentItem *v12;
  CKAttachmentSaver *v13;
  void *v14;
  CKAttachmentSaver *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "contentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ownerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentCreationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [CKAttachmentItem alloc];
  v12 = -[CKAttachmentItem initWithFileURL:size:transferGUID:guid:createdDate:shareURL:](v11, "initWithFileURL:size:transferGUID:guid:createdDate:shareURL:", v6, v8, v9, v10, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v13 = [CKAttachmentSaver alloc];
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CKAttachmentSaver initWithAttachments:](v13, "initWithAttachments:", v14);

  -[CKAttachmentSaver runToCompletion](v15, "runToCompletion");
}

- (NSDirectionalEdgeInsets)additionalGroupInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSDirectionalEdgeInsets result;

  -[CKSearchController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentMarginInsetsForSearchController:", self);
  v5 = v4;
  v7 = v6;

  if (-[CKSearchController mode](self, "mode") == 3)
  {
    v7 = v5;
  }
  else
  {
    -[CKSearchController mode](self, "mode");
    v5 = 0.0;
  }
  v8 = 0.0;
  v9 = 0.0;
  v10 = v5;
  v11 = v7;
  result.trailing = v9;
  result.bottom = v11;
  result.leading = v8;
  result.top = v10;
  return result;
}

- (unint64_t)contentMode
{
  return self->_contentMode;
}

@end
