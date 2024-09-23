@implementation CKAttachmentsSearchController

- (unint64_t)searchTokenContentType
{
  return 6;
}

- (id)fetchAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[11];

  v8[10] = *MEMORY[0x1E0C80C00];
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
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)queryAttributesForText:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "length"))
  {
    v3 = *MEMORY[0x1E0CA6048];
    v10[0] = *MEMORY[0x1E0CA67D8];
    v10[1] = v3;
    v4 = *MEMORY[0x1E0CA6170];
    v10[2] = *MEMORY[0x1E0CA6910];
    v10[3] = v4;
    v10[4] = *MEMORY[0x1E0CA6188];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v10;
    v7 = 5;
  }
  else
  {
    v9 = *MEMORY[0x1E0CA6910];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v9;
    v7 = 1;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filterQueries
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6198], CFSTR("attachmentDomain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6488], CFSTR("at"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  v17 = __Block_byref_object_copy__50;
  v18 = __Block_byref_object_dispose__50;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__CKAttachmentsSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  v13[3] = &unk_1E274B9A0;
  v13[4] = &v14;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
  v24 = v15[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __66__CKAttachmentsSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  unint64_t v5;
  unint64_t result;
  objc_super v7;

  v5 = -[CKSearchController layoutWidth](self, "layoutWidth");
  switch(-[CKSearchController mode](self, "mode"))
  {
    case 0uLL:
      if (v5)
        result = 9;
      else
        result = 6;
      break;
    case 1uLL:
    case 3uLL:
      if (v5)
      {
        if (v5 == 2)
        {
          if (CKIsRunningInMacCatalyst())
            result = 9;
          else
            result = 8;
        }
        else
        {
          result = 6;
        }
      }
      else
      {
        result = 2;
      }
      break;
    case 2uLL:
    case 4uLL:
      v7.receiver = self;
      v7.super_class = (Class)CKAttachmentsSearchController;
      result = -[CKMessageTypeSearchController maxResultsForMode:](&v7, sel_maxResultsForMode_, a3);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5
{
  double v7;
  int v8;
  unint64_t v9;

  if (!a5)
  {
    v7 = 0.5;
    v9 = 2;
    if (!a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (a5 != 2)
  {
    v9 = 3;
    v7 = 0.33;
    if (!a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (CKIsRunningInMacCatalyst())
    v7 = 0.33;
  else
    v7 = 0.25;
  v8 = CKIsRunningInMacCatalyst();
  v9 = 3;
  if (!v8)
    v9 = 4;
  if (a3)
LABEL_13:
    *a3 = v7;
LABEL_14:
  if (a4)
    *a4 = v9;
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__ck_spotlightItemSnippet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  IMUTITypeForFilename();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = IMUTTypeWantsQuicklook();

  return (char)v4;
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_ATTACHMENTS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sectionIdentifier
{
  return CFSTR("AttachmentsSearchSection");
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
  return +[CKAttachmentSearchResultCell reuseIdentifier](CKAttachmentSearchResultCell, "reuseIdentifier", a3);
}

+ (id)indexingString
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATTACHMENTS_INDEXING_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  return (Class)objc_opt_class();
}

- (double)interGroupSpacing
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchAttachmentsInterItemSpacing");
  v4 = v3 * 0.5;

  return v4;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)layoutGroupWithEnvironment:(id)a3
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
  uint64_t v15;
  double v16;

  v15 = 0;
  v16 = 0.0;
  -[CKAttachmentsSearchController fractionalWidth:count:forLayoutWidth:](self, "fractionalWidth:count:forLayoutWidth:", &v16, &v15, -[CKSearchController layoutWidth](self, "layoutWidth", a3));
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 300.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeWithWidthDimension:heightDimension:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1D0], "horizontalGroupWithLayoutSize:subitem:count:", v9, v6, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CEA1F8];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchAttachmentsInterItemSpacing");
  objc_msgSend(v11, "fixedSpacing:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInterItemSpacing:", v13);

  return v10;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAttachmentsSearchController;
  -[CKSearchController cellForItemInCollectionView:atIndexPath:withIdentifier:](&v8, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuppressAvatars:", -[CKSearchController suppressAvatars](self, "suppressAvatars"));
  return v6;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[CKDetailsSearchResultsFooterCell supplementaryViewType](CKDetailsSearchResultsFooterCell, "supplementaryViewType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    +[CKDetailsSearchResultsFooterCell supplementaryViewType](CKDetailsSearchResultsFooterCell, "supplementaryViewType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKDetailsSearchResultsFooterCell reuseIdentifier](CKDetailsSearchResultsFooterCell, "reuseIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v12, v13, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SEE_ALL_ATTACHMENTS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceLayoutDirection");

    if (v20 == 1)
      v21 = CFSTR("\u200F");
    else
      v21 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setTitle:", v22);
    objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSectionIdentifier:", v23);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)previewViewControllerForResult:(id)a3
{
  id v4;
  CKQLPreviewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CKQLPreviewControllerDataSource *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CD3258], "requestPreviewMockSceneActivation");
    v5 = (CKQLPreviewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__ck_spotlightItemSnippet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    IMUTITypeForFilename();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!IMUTTypeWantsQuicklook())
    {

      v5 = 0;
      goto LABEL_7;
    }
    v5 = objc_alloc_init(CKQLPreviewController);

  }
  -[QLPreviewController setDelegate:](v5, "setDelegate:", self);
  v10 = objc_alloc_init(CKQLPreviewControllerDataSource);
  -[CKSearchController setQlPreviewDataSource:](self, "setQlPreviewDataSource:", v10);

  -[CKSearchController qlPreviewDataSource](self, "qlPreviewDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController setDataSource:](v5, "setDataSource:", v11);

  -[CKSearchController qlPreviewDataSource](self, "qlPreviewDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchController results](self, "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPreviewItems:", v13);

  -[QLPreviewController reloadData](v5, "reloadData");
  -[CKSearchController results](self, "results");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController setCurrentPreviewItemIndex:](v5, "setCurrentPreviewItemIndex:", objc_msgSend(v14, "indexOfObject:", v4));

  -[QLPreviewController refreshCurrentPreviewItem](v5, "refreshCurrentPreviewItem");
LABEL_7:

  return v5;
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
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  CKSearchActivityItemProvider *v15;

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
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__ck_spotlightItemSnippet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0CC1160]);
    objc_msgSend(v11, "setName:", v10);
    IMUTITypeForFilename();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setType:", v12);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v5);
    objc_msgSend(v11, "setThumbnail:", v13);
    v14 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
    objc_msgSend(v14, "setSpecialization:", v11);
    v15 = -[CKSearchActivityItemProvider initWithPlaceholderItem:metadata:]([CKSearchActivityItemProvider alloc], "initWithPlaceholderItem:metadata:", v9, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)handleSelectionForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "__ck_spotlightItemSnippet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMUTITypeForFilename();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMUTTypeIsWatchface())
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v13.receiver = self;
    v13.super_class = (Class)CKAttachmentsSearchController;
    v11 = -[CKSearchController handleSelectionForResult:](&v13, sel_handleSelectionForResult_, v4);
  }
  else
  {
    +[CKWatchfaceUtilities addWatchFaceAtURL:completionHandler:](CKWatchfaceUtilities, "addWatchFaceAtURL:completionHandler:", v9, &__block_literal_global_161);
    v11 = 1;
  }

  return v11;
}

void __58__CKAttachmentsSearchController_handleSelectionForResult___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t buf[4];
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(25);
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v5 = v2;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_DEBUG, "Failed to import URL: %@", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
  }

}

@end
