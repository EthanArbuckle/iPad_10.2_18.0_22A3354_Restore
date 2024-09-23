@implementation CKMediaObjectAssetDataSourceManager

- (CKMediaObjectAssetDataSourceManager)initWithDataSource:(id)a3
{
  id v5;
  CKMediaObjectAssetDataSourceManager *v6;
  CKMediaObjectAssetDataSourceManager *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKMediaObjectAssetDataSourceManager;
  v6 = -[PXSectionedDataSourceManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_additionalItemsCount = ($7D1650DB7441A0F5833AC641852B48F3)*MEMORY[0x1E0D7C360];
    objc_storeStrong((id *)&v6->_mediaObjectDataSource, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handlePreviewDidChangeNotification_, CFSTR("CKPreviewDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__handleMomentShareCacheDidChange_, *MEMORY[0x1E0D355D8], 0);

    -[CKMediaObjectAssetDataSource momentShareURL](v7->_mediaObjectDataSource, "momentShareURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObjectAssetDataSourceManager setMomentShareURL:](v7, "setMomentShareURL:", v10);

  }
  return v7;
}

- (void)setMediaObjectDataSource:(id)a3
{
  -[CKMediaObjectAssetDataSourceManager setMediaObjectDataSource:withChangeDetails:](self, "setMediaObjectDataSource:withChangeDetails:", a3, 0);
}

- (void)setMediaObjectDataSource:(id)a3 withChangeDetails:(id)a4
{
  id v7;
  CKMediaObjectAssetDataSource **p_mediaObjectDataSource;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  p_mediaObjectDataSource = &self->_mediaObjectDataSource;
  if ((-[CKMediaObjectAssetDataSource isEqual:](self->_mediaObjectDataSource, "isEqual:", v12) & 1) == 0)
  {
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[CKMediaObjectAssetDataSourceManager _changeDetailsForDataSource:oldDataSource:](self, "_changeDetailsForDataSource:oldDataSource:", v12, *p_mediaObjectDataSource);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    objc_storeStrong((id *)&self->_mediaObjectDataSource, a3);
    -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", *p_mediaObjectDataSource, v10);
    -[CKMediaObjectAssetDataSource momentShareURL](*p_mediaObjectDataSource, "momentShareURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObjectAssetDataSourceManager setMomentShareURL:](self, "setMomentShareURL:", v11);

  }
}

- (id)_changeDetailsForDataSource:(id)a3 oldDataSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__62;
    v28 = __Block_byref_object_dispose__62;
    v29 = 0;
    v29 = (id)objc_opt_new();
    objc_msgSend(v5, "chatItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __81__CKMediaObjectAssetDataSourceManager__changeDetailsForDataSource_oldDataSource___block_invoke;
    v21[3] = &unk_1E27589B8;
    v10 = v7;
    v22 = v10;
    v23 = &v24;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v21);

    v11 = (void *)MEMORY[0x1E0D7B1C0];
    objc_msgSend(v10, "chatItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chatItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "changeDetailsFromArray:toArray:changedObjects:objectComparator:", v12, v13, v25[5], &__block_literal_global_211);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0D7B918]);
    v16 = objc_msgSend(v10, "identifier");
    v17 = objc_msgSend(v5, "identifier");
    objc_msgSend(MEMORY[0x1E0D7B1C0], "changeDetailsWithNoChanges");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = &unk_1E2870CF0;
    v31[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v15, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v16, v17, v18, v19, 0);

    _Block_object_dispose(&v24, 8);
  }

  return v8;
}

void __81__CKMediaObjectAssetDataSourceManager__changeDetailsForDataSource_oldDataSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;

  v26 = a2;
  objc_msgSend(*(id *)(a1 + 32), "chatItemGUIDMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "IMChatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v26, "visibleAssociatedMessageChatItems");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    if (v7)
      v10 = (void *)v7;
    else
      v10 = (void *)MEMORY[0x1E0C9AA60];
    v11 = v10;

    objc_msgSend(v6, "visibleAssociatedMessageChatItems");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = v9;
    v15 = v14;

    objc_msgSend(v11, "differenceFromArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v11, "count");
    v18 = objc_msgSend(v15, "count");

    if (v17 != v18)
      goto LABEL_11;
    if ((objc_msgSend(v16, "hasChanges") & 1) != 0)
      goto LABEL_11;
    objc_msgSend(v6, "mediaObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "transfer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fileURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mediaObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "transfer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fileURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CKIsEqual(v20, v23);

    if ((v24 & 1) == 0)
LABEL_11:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v26);

  }
}

uint64_t __81__CKMediaObjectAssetDataSourceManager__changeDetailsForDataSource_oldDataSource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IMChatItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (void)setMomentShare:(id)a3
{
  PHMomentShare *v5;
  PHMomentShare *v6;

  v5 = (PHMomentShare *)a3;
  if (self->_momentShare != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_momentShare, a3);
    -[CKMediaObjectAssetDataSourceManager _updateAdditionalItemsCount](self, "_updateAdditionalItemsCount");
    v5 = v6;
  }

}

- (void)setMomentShareURL:(id)a3
{
  NSURL *v5;
  NSURL *momentShareURL;
  char v7;
  NSURL *v8;

  v5 = (NSURL *)a3;
  momentShareURL = self->_momentShareURL;
  if (momentShareURL != v5)
  {
    v8 = v5;
    v7 = -[NSURL isEqual:](momentShareURL, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_momentShareURL, a3);
      -[CKMediaObjectAssetDataSourceManager _updateMomentShare](self, "_updateMomentShare");
      v5 = v8;
    }
  }

}

- (void)_setAdditionalItemsCount:(id)a3
{
  if (self->_additionalItemsCount.count != a3.var0 || self->_additionalItemsCount.type != a3.var1)
  {
    self->_additionalItemsCount = ($7D1650DB7441A0F5833AC641852B48F3)a3;
    -[CKMediaObjectAssetDataSourceManager signalChange:](self, "signalChange:", 2);
  }
}

- (void)_updateMomentShare
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSURL *momentShareURL;
  id v8;
  id v9;

  if (self->_momentShareURL)
  {
    objc_msgSend(MEMORY[0x1E0D35898], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL absoluteString](self->_momentShareURL, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v3, "momentShareForURLString:error:", v4, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;

    if (!v5 && _IMWillLog())
    {
      momentShareURL = self->_momentShareURL;
      v8 = v6;
      _IMAlwaysLog();
    }

  }
  else
  {
    v5 = 0;
  }
  -[CKMediaObjectAssetDataSourceManager setMomentShare:](self, "setMomentShare:", v5, momentShareURL, v8);

}

- (void)_updateAdditionalItemsCount
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  -[CKMediaObjectAssetDataSourceManager momentShare](self, "momentShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = 0uLL;
    v12 = 0;
    -[CKMediaObjectAssetDataSourceManager mediaObjectDataSource](self, "mediaObjectDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "assetTypeCounts");
    }
    else
    {
      v11 = 0uLL;
      v12 = 0;
    }

    v9 = v11;
    v10 = v12;
    v6 = -[CKMediaObjectAssetDataSourceManager _additionalCountInMomentShare:representedCounts:](self, "_additionalCountInMomentShare:representedCounts:", v3, &v9);
  }
  else
  {
    v6 = *MEMORY[0x1E0D7C360];
    v7 = *(_QWORD *)(MEMORY[0x1E0D7C360] + 8);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__CKMediaObjectAssetDataSourceManager__updateAdditionalItemsCount__block_invoke;
  v8[3] = &unk_1E2758A00;
  v8[4] = self;
  v8[5] = v6;
  v8[6] = v7;
  -[CKMediaObjectAssetDataSourceManager performChanges:](self, "performChanges:", v8);

}

uint64_t __66__CKMediaObjectAssetDataSourceManager__updateAdditionalItemsCount__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAdditionalItemsCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- ($DE30A600513D762F9B6AB73D2AED4B95)_additionalCountInMomentShare:(id)a3 representedCounts:(id *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  int64_t v18;
  BOOL v19;
  BOOL v20;
  uint64_t v21;
  unint64_t var0;
  unint64_t var1;
  unint64_t var2;
  int v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;
  $DE30A600513D762F9B6AB73D2AED4B95 result;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "photosCount");
  v7 = objc_msgSend(v5, "videosCount");
  v8 = objc_msgSend(v5, "assetCount");

  v9 = v8 - (v7 + v6);
  v10 = v6 - a4->var0;
  if (v6 >= a4->var0
    && (v11 = a4->var1, v12 = v7 >= v11, v13 = v7 - v11, v12)
    && (v14 = a4->var2, v12 = v9 >= v14, v15 = v9 - v14, v12))
  {
    if (v13 > 0)
    {
      v19 = v6 == a4->var0;
      v20 = v10 < 0;
    }
    else
    {
      v19 = 1;
      v20 = 0;
    }
    if ((v20 || v19) && v15 < 1)
    {
      v21 = *(_QWORD *)(MEMORY[0x1E0D7C360] + 8);
      if (v13 <= 0)
        v13 = *MEMORY[0x1E0D7C360];
      else
        v21 = 2;
      if (v10 <= 0)
        v18 = v21;
      else
        v18 = 1;
      if (v10 <= 0)
        v17 = v13;
      else
        v17 = v6 - a4->var0;
    }
    else
    {
      v18 = 0;
      v17 = v13 + v10 + v15;
    }
  }
  else
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      var0 = a4->var0;
      var1 = a4->var1;
      var2 = a4->var2;
      v25 = 134219264;
      v26 = v6;
      v27 = 2048;
      v28 = var0;
      v29 = 2048;
      v30 = v7;
      v31 = 2048;
      v32 = var1;
      v33 = 2048;
      v34 = v9;
      v35 = 2048;
      v36 = var2;
      _os_log_error_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_ERROR, "Invalid moment share counts vs attachment counts %ld:%ld, %ld:%ld, %ld:%ld", (uint8_t *)&v25, 0x3Eu);
    }

    v17 = *MEMORY[0x1E0D7C360];
    v18 = *(_QWORD *)(MEMORY[0x1E0D7C360] + 8);
  }
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (void)_handleMomentShareCacheDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CKMediaObjectAssetDataSourceManager momentShareURL](self, "momentShareURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D355E8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", v6))
      -[CKMediaObjectAssetDataSourceManager _updateMomentShare](self, "_updateMomentShare");

  }
}

- (void)_handlePreviewDidChangeNotification:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[CKMediaObjectAssetDataSourceManager _mq_handlePreviewDidChangeNotification:](self, "_mq_handlePreviewDidChangeNotification:", v4);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __75__CKMediaObjectAssetDataSourceManager__handlePreviewDidChangeNotification___block_invoke;
    v5[3] = &unk_1E274A108;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __75__CKMediaObjectAssetDataSourceManager__handlePreviewDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mq_handlePreviewDidChangeNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_mq_handlePreviewDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKMediaObjectAssetDataSourceManager mediaObjectDataSource](self, "mediaObjectDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v6, "isAutoloopVideo");
    else
      v7 = 0;
    if ((objc_msgSend(v6, "isMonoskiAsset") & 1) != 0 || v7)
    {
      objc_msgSend(v5, "mediaObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "indexOfObject:", v6);

      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v5, "copyRefreshingAssetsAtIndexes:", v10);
        v18 = objc_alloc(MEMORY[0x1E0D7B918]);
        v17 = objc_msgSend(v5, "identifier");
        v12 = objc_msgSend(v11, "identifier");
        objc_msgSend(MEMORY[0x1E0D7B1C0], "changeDetailsWithNoChanges");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = &unk_1E2870CF0;
        objc_msgSend(MEMORY[0x1E0D7B1C0], "changeDetailsWithChangedIndexes:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v18, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v17, v12, v13, v15, 0);

        -[CKMediaObjectAssetDataSourceManager setMediaObjectDataSource:withChangeDetails:](self, "setMediaObjectDataSource:withChangeDetails:", v11, v16);
      }
    }

  }
}

- (CKMediaObjectAssetDataSource)mediaObjectDataSource
{
  return self->_mediaObjectDataSource;
}

- ($DE30A600513D762F9B6AB73D2AED4B95)additionalItemsCount
{
  $7D1650DB7441A0F5833AC641852B48F3 *p_additionalItemsCount;
  unint64_t count;
  int64_t type;
  $DE30A600513D762F9B6AB73D2AED4B95 result;

  p_additionalItemsCount = &self->_additionalItemsCount;
  count = self->_additionalItemsCount.count;
  type = p_additionalItemsCount->type;
  result.var1 = type;
  result.var0 = count;
  return result;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (NSURL)momentShareURL
{
  return self->_momentShareURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentShareURL, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_mediaObjectDataSource, 0);
}

@end
