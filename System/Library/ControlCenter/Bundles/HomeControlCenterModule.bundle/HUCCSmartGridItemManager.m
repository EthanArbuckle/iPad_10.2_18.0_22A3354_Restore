@implementation HUCCSmartGridItemManager

- (HUCCSmartGridItemManager)initWithMosaicLayoutDelegate:(id)a3
{
  id v4;
  HUCCSmartGridItemManager *v5;
  HUCCSmartGridItemManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCCSmartGridItemManager;
  v5 = -[HFItemManager initWithDelegate:sourceItem:](&v8, sel_initWithDelegate_sourceItem_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mosaicLayoutDelegate, v4);
    v6->_chosenLayoutType = 0;
    v6->_layoutWasChanged = 0;
  }

  return v6;
}

- (void)loadDefaultProviderItem
{
  uint64_t v2;

  objc_msgSend_resetItemProvidersAndModules(self, a2, v2);
  MEMORY[0x24BEDD108](self, sel_sortDisplayedItemsInSection_, 0);
}

- (BOOL)_shouldBuildItemProvidersAndModulesForNilHome
{
  return 1;
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDBCEF0];
  v10.receiver = self;
  v10.super_class = (Class)HUCCSmartGridItemManager;
  -[HFItemManager _itemsToHideInSet:](&v10, sel__itemsToHideInSet_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithSet_(v3, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_na_filter_(v6, v7, (uint64_t)&unk_24FFD8098);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_buildItemProvidersWithoutHome
{
  uint64_t v2;
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;

  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE4D0A8]);
  v6 = (void *)objc_msgSend_initWithHome_(v4, v5, 0);
  v7 = objc_alloc(MEMORY[0x24BE4D168]);
  objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], v8, (uint64_t)v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithItems_(v7, v10, (uint64_t)v9);

  v14 = (id)objc_msgSend_reloadItems(v11, v12, v13);
  objc_msgSend_addObject_(v3, v15, (uint64_t)v11);

  return v3;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  char isEqual;
  NSObject *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hf_shouldBlockCurrentUserFromHome(v4, v8, v9))
  {
    v12 = objc_alloc(MEMORY[0x24BE4D0A8]);
    v14 = (void *)objc_msgSend_initWithHome_(v12, v13, (uint64_t)v4);
    v15 = objc_alloc(MEMORY[0x24BE4D168]);
    objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], v16, (uint64_t)v14, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend_initWithItems_(v15, v18, (uint64_t)v17);

    v22 = (id)objc_msgSend_reloadItems(v19, v20, v21);
    objc_msgSend_addObject_(v7, v23, (uint64_t)v19);

  }
  else
  {
    objc_msgSend_predictionsManager(self, v10, v11);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
      goto LABEL_5;
    v27 = (void *)v24;
    objc_msgSend_predictionsManager(self, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_home(v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v31, v32, (uint64_t)v4);

    if ((isEqual & 1) == 0)
    {
LABEL_5:
      HFLogForCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v4;
        _os_log_impl(&dword_230FDD000, v34, OS_LOG_TYPE_DEFAULT, "Creating predictionsManager for home: %@", buf, 0xCu);
      }

      v35 = objc_alloc(MEMORY[0x24BE4D128]);
      objc_msgSend_userActionPredictionController(v4, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend_initWithHome_predictionsController_delegate_predictionLimit_(v35, v39, (uint64_t)v4, v38, self, 6);
      objc_msgSend_setPredictionsManager_(self, v41, (uint64_t)v40);

    }
    v42 = objc_alloc(MEMORY[0x24BE4D120]);
    objc_msgSend_predictionsManager(self, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend_initWithHome_predictionsManager_itemLimit_(v42, v46, (uint64_t)v4, v45, 6);
    objc_msgSend_setPredictionsItemProvider_(self, v48, (uint64_t)v47);

    objc_msgSend_predictionsItemProvider(self, v49, v50);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v7, v51, (uint64_t)v14);
  }

  return v7;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  id v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  id v61;
  void *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  unint64_t v80;
  HUCCSmartGridItemManager *v81;
  void *v82;
  const char *v83;
  const char *v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  const char *v90;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  id obj;
  void *v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[5];
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mosaicLayoutDelegate(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BE4D0F0]);
    v13 = (void *)objc_msgSend_initWithIdentifier_(v11, v12, (uint64_t)CFSTR("HUCC START GRID MAIN SECTION"));
    objc_msgSend_allObjects(v4, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = MEMORY[0x24BDAC760];
    v109[1] = 3221225472;
    v109[2] = sub_230FE107C;
    v109[3] = &unk_24FFD80C0;
    v109[4] = self;
    objc_msgSend_sortedArrayUsingComparator_(v16, v17, (uint64_t)v109);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v18, v19, v20))
    {
      v95 = v13;
      v96 = v4;
      v97 = v7;
      objc_msgSend_array(MEMORY[0x24BDBCEB8], v21, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v94 = v18;
      v24 = v18;
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v105, v111, 16);
      v27 = 0x24BE4F000uLL;
      if (v26)
      {
        v28 = v26;
        v29 = *(_QWORD *)v106;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v106 != v29)
              objc_enumerationMutation(v24);
            v31 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i);
            v32 = objc_alloc(MEMORY[0x24BE4F430]);
            v34 = (void *)objc_msgSend_initWithBaseItem_(v32, v33, v31);
            objc_msgSend_addObject_(v23, v35, (uint64_t)v34);

          }
          v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v36, (uint64_t)&v105, v111, 16);
        }
        while (v28);
      }

      objc_msgSend_mosaicLayoutDelegate(self, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arranger(v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v93 = v23;
      objc_msgSend_calculateOrderingForItems_(v42, v43, (uint64_t)v23);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = v42;
      v47 = objc_msgSend_chosenLayoutType(v42, v45, v46);
      objc_msgSend_setChosenLayoutType_(self, v48, v47);
      objc_msgSend_array(MEMORY[0x24BDBCEB8], v49, v50);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setMosaicLayoutDetails_(self, v54, (uint64_t)v53);

      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      obj = v44;
      v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v101, v110, 16);
      if (v56)
      {
        v57 = v56;
        v58 = 0;
        v100 = *(_QWORD *)v102;
        do
        {
          for (j = 0; j != v57; ++j)
          {
            if (*(_QWORD *)v102 != v100)
              objc_enumerationMutation(obj);
            v60 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
            objc_opt_class();
            v61 = v60;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v62 = v61;
            else
              v62 = 0;
            v63 = v62;

            if (v63)
            {
              objc_opt_class();
              objc_msgSend_baseItem(v63, v64, v65);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v67 = v66;
              else
                v67 = 0;
              v68 = v67;

              if (v68)
                ++v58;
              objc_msgSend_baseItem(v63, v69, v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v99, v72, (uint64_t)v71);

              objc_msgSend_mosaicLayoutDetails(self, v73, v74);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_baseItem(v63, v76, v77);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend__mosaicKeyForItem_(self, v79, (uint64_t)v78);
              v80 = v27;
              v81 = self;
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKey_(v75, v83, (uint64_t)v63, v82);

              self = v81;
              v27 = v80;

            }
          }
          v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v84, (uint64_t)&v101, v110, 16);
        }
        while (v57);
      }
      else
      {
        v58 = 0;
      }

      if (v58 != objc_msgSend_numberOfPlaceholderItems(self, v86, v87))
      {
        objc_msgSend_setNumberOfPlaceholderItems_(self, v88, v58);
        objc_msgSend_setNumberOfPlaceholdersWasChanged_(self, v89, 1);
      }
      v13 = v95;
      objc_msgSend_setItems_(v95, v88, (uint64_t)v99);

      v4 = v96;
      v7 = v97;
      v85 = v93;
      v18 = v94;
    }
    else
    {
      HFLogForCategory();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        sub_230FF40B0((uint64_t)self, v85);
    }

    if (_os_feature_enabled_impl())
      objc_msgSend_setItems_(v13, v90, (uint64_t)v18);
    objc_msgSend_addObject_(v7, v90, (uint64_t)v13);

  }
  return v7;
}

- (void)setChosenLayoutType:(unint64_t)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  unint64_t chosenLayoutType;
  int v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_chosenLayoutType != a3)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      chosenLayoutType = self->_chosenLayoutType;
      v9 = 138413058;
      v10 = v7;
      v11 = 2080;
      v12 = "-[HUCCSmartGridItemManager setChosenLayoutType:]";
      v13 = 2048;
      v14 = chosenLayoutType;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_230FDD000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s prev chosenLayoutType = %lu. new chosenLayoutType = %lu", (uint8_t *)&v9, 0x2Au);

    }
    if (self->_chosenLayoutType)
      self->_layoutWasChanged = 1;
    self->_chosenLayoutType = a3;
  }
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HUCCSmartGridItemManager;
  -[HFItemManager _didFinishUpdateTransactionWithAffectedItems:](&v18, sel__didFinishUpdateTransactionWithAffectedItems_, a3);
  if (objc_msgSend_layoutWasChanged(self, v4, v5))
  {
    objc_msgSend_setLayoutWasChanged_(self, v6, 0);
    objc_msgSend_mosaicLayoutDelegate(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_itemManagerDidChangeMosaicLayout_(v10, v11, (uint64_t)self);

    objc_msgSend_setNumberOfPlaceholdersWasChanged_(self, v12, 0);
  }
  if (objc_msgSend_numberOfPlaceholdersWasChanged(self, v6, v7))
  {
    objc_msgSend_setNumberOfPlaceholdersWasChanged_(self, v13, 0);
    objc_msgSend_mosaicLayoutDelegate(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_itemManagerDidChangeNumberOfPlaceholderItems_(v16, v17, (uint64_t)self);

  }
}

- (id)mosaicDetailsForDisplayedItemAtIndexPath:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;

  objc_msgSend_displayedItemAtIndexPath_(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mosaicDetailsForItem_(self, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mosaicDetailsForItem:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_opt_class();
  objc_msgSend_mosaicLayoutDetails(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mosaicKeyForItem_(self, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v7, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (id)_mosaicKeyForItem:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  __CFString *v19;

  v3 = a3;
  if (objc_msgSend_conformsToProtocol_(v3, v4, (uint64_t)&unk_255EEA038))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  v9 = v6;
  if (v6
    && (objc_msgSend_homeKitObject(v6, v7, v8), v10 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v10,
                                                v10))
  {
    objc_msgSend_homeKitObject(v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uniqueIdentifier(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v16, v17, v18);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = CFSTR("DefaultKey");
  }

  return v19;
}

- (unint64_t)numberOfPlaceholderItems
{
  return self->_numberOfPlaceholderItems;
}

- (void)setNumberOfPlaceholderItems:(unint64_t)a3
{
  self->_numberOfPlaceholderItems = a3;
}

- (HFPredictionsManager)predictionsManager
{
  return self->_predictionsManager;
}

- (void)setPredictionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_predictionsManager, a3);
}

- (HFPredictionsItemProvider)predictionsItemProvider
{
  return self->_predictionsItemProvider;
}

- (void)setPredictionsItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_predictionsItemProvider, a3);
}

- (HUCCMosaicLayoutDelegate)mosaicLayoutDelegate
{
  return (HUCCMosaicLayoutDelegate *)objc_loadWeakRetained((id *)&self->_mosaicLayoutDelegate);
}

- (void)setMosaicLayoutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mosaicLayoutDelegate, a3);
}

- (NSMutableDictionary)mosaicLayoutDetails
{
  return self->_mosaicLayoutDetails;
}

- (void)setMosaicLayoutDetails:(id)a3
{
  objc_storeStrong((id *)&self->_mosaicLayoutDetails, a3);
}

- (unint64_t)chosenLayoutType
{
  return self->_chosenLayoutType;
}

- (BOOL)layoutWasChanged
{
  return self->_layoutWasChanged;
}

- (void)setLayoutWasChanged:(BOOL)a3
{
  self->_layoutWasChanged = a3;
}

- (BOOL)numberOfPlaceholdersWasChanged
{
  return self->_numberOfPlaceholdersWasChanged;
}

- (void)setNumberOfPlaceholdersWasChanged:(BOOL)a3
{
  self->_numberOfPlaceholdersWasChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mosaicLayoutDetails, 0);
  objc_destroyWeak((id *)&self->_mosaicLayoutDelegate);
  objc_storeStrong((id *)&self->_predictionsItemProvider, 0);
  objc_storeStrong((id *)&self->_predictionsManager, 0);
}

@end
