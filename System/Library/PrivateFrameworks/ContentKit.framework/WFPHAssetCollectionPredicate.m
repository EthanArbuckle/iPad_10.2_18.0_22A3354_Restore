@implementation WFPHAssetCollectionPredicate

- (id)initForAssetsInCollection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  WFPHAssetCollectionPredicate *v10;
  WFPHAssetCollectionPredicate *v11;
  WFPHAssetCollectionPredicate *v12;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("localIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__10244;
  v18[4] = __Block_byref_object_dispose__10245;
  v19 = 0;
  v7 = (void *)MEMORY[0x24BDD1548];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __58__WFPHAssetCollectionPredicate_initForAssetsInCollection___block_invoke;
  v15[3] = &unk_24C4DF348;
  v17 = v18;
  v8 = v5;
  v16 = v8;
  objc_msgSend(v7, "expressionForBlock:arguments:", v15, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)WFPHAssetCollectionPredicate;
  v10 = -[WFPHAssetCollectionPredicate initWithLeftExpression:rightExpression:modifier:type:options:](&v14, sel_initWithLeftExpression_rightExpression_modifier_type_options_, v6, v9, 0, 10, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetCollection, a3);
    v12 = v11;
  }

  _Block_object_dispose(v18, 8);
  return v11;
}

- (id)wf_photoLibraryFilteringPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD1548];
  -[WFPHAssetCollectionPredicate rightExpression](self, "rightExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionValueWithObject:context:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expressionForConstantValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD14B8];
  -[WFPHAssetCollectionPredicate leftExpression](self, "leftExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v8, v6, -[WFPHAssetCollectionPredicate comparisonPredicateModifier](self, "comparisonPredicateModifier"), -[WFPHAssetCollectionPredicate predicateOperatorType](self, "predicateOperatorType"), -[WFPHAssetCollectionPredicate options](self, "options"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

id __58__WFPHAssetCollectionPredicate_initForAssetsInCollection___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v10)
  {
    getWFPhotoLibraryFilteringLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "wfName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v37 = "-[WFPHAssetCollectionPredicate initForAssetsInCollection:]_block_invoke";
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_20BBAD000, v11, OS_LOG_TYPE_INFO, "%s Performing non-optimized photo identifier lookup for album %@", buf, 0x16u);

    }
    v13 = objc_opt_new();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    +[WFSharedPhotoLibrary sharedLibrary](WFSharedPhotoLibrary, "sharedLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v16, "fetchOptionsWithError:", &v34);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v34;

    if (!v17)
    {

      v26 = 0;
      goto LABEL_14;
    }
    v28 = v18;
    v29 = v7;
    objc_msgSend(v17, "setWantsIncrementalChangeDetails:", 0);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(getPHAssetClass_10253(), "fetchAssetsInAssetCollection:options:", *(_QWORD *)(a1 + 32), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v23), "localIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v25);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v21);
    }

    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v29;
  }
  v26 = v10;
LABEL_14:

  return v26;
}

@end
