@implementation CKDAssetRequestPlanner

- (CKDAssetRequestPlanner)init
{
  return (CKDAssetRequestPlanner *)objc_msgSend_initWithAssetTokenRequestSizeLimit_(self, a2, 0x200000);
}

- (CKDAssetRequestPlanner)initWithAssetTokenRequestSizeLimit:(unsigned int)a3
{
  CKDAssetRequestPlanner *v4;
  uint64_t v5;
  NSMutableOrderedSet *items;
  uint64_t v7;
  NSMutableDictionary *assetZoneByKey;
  uint64_t v9;
  NSMutableDictionary *assetBatchesByZoneID;
  uint64_t v11;
  NSMutableDictionary *rerefAssetBatchesByZoneID;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKDAssetRequestPlanner;
  v4 = -[CKDAssetRequestPlanner init](&v14, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    items = v4->_items;
    v4->_items = (NSMutableOrderedSet *)v5;

    v7 = objc_opt_new();
    assetZoneByKey = v4->_assetZoneByKey;
    v4->_assetZoneByKey = (NSMutableDictionary *)v7;

    v4->_assetTokenRequestSizeLimit = a3;
    v9 = objc_opt_new();
    assetBatchesByZoneID = v4->_assetBatchesByZoneID;
    v4->_assetBatchesByZoneID = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    rerefAssetBatchesByZoneID = v4->_rerefAssetBatchesByZoneID;
    v4->_rerefAssetBatchesByZoneID = (NSMutableDictionary *)v11;

  }
  return v4;
}

- (void)addMMCSItem:(id)a3
{
  const char *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  CKDAssetZone *v12;
  const char *v13;
  const char *v14;
  id v15;

  v15 = a3;
  if (objc_msgSend_containsObject_(self->_items, v4, (uint64_t)v15))
    __assert_rtn("-[CKDAssetRequestPlanner addMMCSItem:]", "CKDAssetRequestPlanner.m", 58, "![_items containsObject:item]");
  objc_msgSend_addObject_(self->_items, v5, (uint64_t)v15);
  objc_msgSend_assetZoneKey(v15, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(self->_assetZoneByKey, v9, (uint64_t)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = [CKDAssetZone alloc];
    v11 = (void *)objc_msgSend_initWithAssetZoneKey_(v12, v13, (uint64_t)v8);
    objc_msgSend_setObject_forKeyedSubscript_(self->_assetZoneByKey, v14, (uint64_t)v11, v8);
  }
  objc_msgSend_addMMCSItem_(v11, v10, (uint64_t)v15);

}

- (void)addRereferencedPackageItem:(id)a3
{
  const char *v4;
  const char *v5;
  NSMutableDictionary *assetZoneByKey;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  CKDAssetZone *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  NSMutableDictionary *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;

  v23 = a3;
  if (objc_msgSend_containsObject_(self->_items, v4, (uint64_t)v23))
    __assert_rtn("-[CKDAssetRequestPlanner addRereferencedPackageItem:]", "CKDAssetRequestPlanner.m", 71, "![_items containsObject:item]");
  objc_msgSend_addObject_(self->_items, v5, (uint64_t)v23);
  assetZoneByKey = self->_assetZoneByKey;
  objc_msgSend_assetZoneKey(v23, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(assetZoneByKey, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v13 = [CKDAssetZone alloc];
    objc_msgSend_assetZoneKey(v23, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend_initWithAssetZoneKey_(v13, v17, (uint64_t)v16);

    v18 = self->_assetZoneByKey;
    objc_msgSend_assetZoneKey(v23, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v18, v22, (uint64_t)v11, v21);

  }
  objc_msgSend_addRereferencedMMCSPackageItem_(v11, v12, (uint64_t)v23);

}

- (void)addMMCSSectionItem:(id)a3
{
  const char *v4;
  const char *v5;
  NSMutableDictionary *assetZoneByKey;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  CKDAssetZone *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;

  v18 = a3;
  if (objc_msgSend_containsObject_(self->_items, v4, (uint64_t)v18))
    __assert_rtn("-[CKDAssetRequestPlanner addMMCSSectionItem:]", "CKDAssetRequestPlanner.m", 83, "![_items containsObject:item]");
  objc_msgSend_addObject_(self->_items, v5, (uint64_t)v18);
  assetZoneByKey = self->_assetZoneByKey;
  objc_msgSend_assetZoneKey(v18, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(assetZoneByKey, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v13 = [CKDAssetZone alloc];
    objc_msgSend_assetZoneKey(v18, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend_initWithAssetZoneKey_(v13, v17, (uint64_t)v16);

  }
  objc_msgSend_addMMCSSectionItem_(v11, v12, (uint64_t)v18);

}

- (void)resetAssetTokenRequests
{
  NSArray *assetTokenRequests;

  assetTokenRequests = self->_assetTokenRequests;
  self->_assetTokenRequests = 0;

}

- (void)planRegisterBatches
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CKDAssetBatch *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  CKDAssetRecord *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  CKDAssetBatch *v67;
  const char *v68;
  void *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  int v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  CKDAssetBatch *v77;
  const char *v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  id v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t m;
  void *v93;
  NSMutableDictionary *assetBatchesByZoneID;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  void *v103;
  const char *v104;
  NSMutableDictionary *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  const char *v116;
  id obj;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  CKDAssetRequestPlanner *v121;
  void *v122;
  void *v123;
  unsigned int v124;
  void *v125;
  unsigned int assetTokenRequestSizeLimit;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v123 = (void *)objc_opt_new();
  assetTokenRequestSizeLimit = self->_assetTokenRequestSizeLimit;
  objc_msgSend_setAssetRegisterAndPutBatches_(self, v3, 0);
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v121 = self;
  objc_msgSend_allKeys(self->_assetZoneByKey, v4, v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v143, v151, 16);
  if (v119)
  {
    v118 = *(_QWORD *)v144;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v144 != v118)
          objc_enumerationMutation(obj);
        v120 = v8;
        v9 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * v8);
        objc_msgSend_objectForKeyedSubscript_(v121->_assetZoneByKey, v7, (uint64_t)v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = [CKDAssetBatch alloc];
        v13 = (void *)objc_msgSend_initWithAssetZone_(v11, v12, (uint64_t)v10);
        objc_msgSend_useMMCSEncryptionV2(v9, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend_BOOLValue(v16, v17, v18);

        v122 = v13;
        v124 = v19;
        objc_msgSend_setUseMMCSEncryptionV2_(v13, v20, v19);
        v141 = 0u;
        v142 = 0u;
        v139 = 0u;
        v140 = 0u;
        v125 = v10;
        objc_msgSend_assetRecords(v10, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v139, v150, 16);
        if (v25)
        {
          v28 = v25;
          v29 = *(_QWORD *)v140;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v140 != v29)
                objc_enumerationMutation(v23);
              v31 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * i);
              if (objc_msgSend_isAssetRecord(v31, v26, v27))
              {
                v32 = [CKDAssetRecord alloc];
                objc_msgSend_recordType(v31, v33, v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_recordID(v31, v36, v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = (void *)objc_msgSend_initWithRecordType_recordID_(v32, v39, (uint64_t)v35, v38);

                v137 = 0u;
                v138 = 0u;
                v135 = 0u;
                v136 = 0u;
                objc_msgSend_allMMCSSectionItems(v31, v41, v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v135, v149, 16);
                if (v45)
                {
                  v47 = v45;
                  v48 = *(_QWORD *)v136;
                  do
                  {
                    for (j = 0; j != v47; ++j)
                    {
                      if (*(_QWORD *)v136 != v48)
                        objc_enumerationMutation(v43);
                      objc_msgSend_addMMCSSectionItem_(v40, v46, *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * j));
                    }
                    v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v135, v149, 16);
                  }
                  while (v47);
                }

                v133 = 0u;
                v134 = 0u;
                v131 = 0u;
                v132 = 0u;
                objc_msgSend_allMMCSItems(v31, v50, v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v131, v148, 16);
                if (v54)
                {
                  v56 = v54;
                  v57 = *(_QWORD *)v132;
                  do
                  {
                    for (k = 0; k != v56; ++k)
                    {
                      if (*(_QWORD *)v132 != v57)
                        objc_enumerationMutation(v52);
                      objc_msgSend_addMMCSItem_(v40, v55, *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * k));
                    }
                    v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v131, v148, 16);
                  }
                  while (v56);
                }

                if ((objc_msgSend_isEmpty(v40, v59, v60) & 1) == 0)
                {
                  if (objc_msgSend_sizeUpperBound(v40, v61, v62) > assetTokenRequestSizeLimit
                    || objc_msgSend_isPackageSectionRecord(v40, v63, v64))
                  {
                    v67 = [CKDAssetBatch alloc];
                    v69 = (void *)objc_msgSend_initWithAssetZone_(v67, v68, (uint64_t)v125);
                    objc_msgSend_setUseMMCSEncryptionV2_(v69, v70, v124);
                    objc_msgSend_addAssetRecord_(v69, v71, (uint64_t)v31);
                    objc_msgSend_addObject_(v123, v72, (uint64_t)v69);

                  }
                  else
                  {
                    v73 = objc_msgSend_sizeUpperBound(v40, v65, v66);
                    if (objc_msgSend_sizeUpperBound(v122, v74, v75) + v73 <= assetTokenRequestSizeLimit)
                    {
                      v81 = v122;
                    }
                    else
                    {
                      objc_msgSend_addObject_(v123, v76, (uint64_t)v122);
                      v77 = [CKDAssetBatch alloc];
                      v79 = (void *)objc_msgSend_initWithAssetZone_(v77, v78, (uint64_t)v125);

                      objc_msgSend_setUseMMCSEncryptionV2_(v79, v80, v124);
                      v81 = v79;
                    }
                    v122 = v81;
                    objc_msgSend_addAssetRecord_(v81, v76, (uint64_t)v40);
                  }
                }

              }
            }
            v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v139, v150, 16);
          }
          while (v28);
        }

        if ((objc_msgSend_isEmptyOfRereferencesAssets(v122, v82, v83) & 1) == 0)
          objc_msgSend_addObject_(v123, v84, (uint64_t)v122);

        v8 = v120 + 1;
      }
      while (v120 + 1 != v119);
      v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v143, v151, 16);
    }
    while (v119);
  }

  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v85 = v123;
  v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v86, (uint64_t)&v127, v147, 16);
  if (v87)
  {
    v90 = v87;
    v91 = *(_QWORD *)v128;
    do
    {
      for (m = 0; m != v90; ++m)
      {
        if (*(_QWORD *)v128 != v91)
          objc_enumerationMutation(v85);
        v93 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * m);
        assetBatchesByZoneID = v121->_assetBatchesByZoneID;
        objc_msgSend_assetZone(v93, v88, v89);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_assetZoneKey(v95, v96, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_destinationZoneID(v98, v99, v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(assetBatchesByZoneID, v102, (uint64_t)v101);
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v103)
        {
          v103 = (void *)objc_opt_new();
          v105 = v121->_assetBatchesByZoneID;
          objc_msgSend_assetZone(v93, v106, v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_assetZoneKey(v108, v109, v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_destinationZoneID(v111, v112, v113);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v105, v115, (uint64_t)v103, v114);

        }
        objc_msgSend_addObject_(v103, v104, (uint64_t)v93);

      }
      v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v88, (uint64_t)&v127, v147, 16);
    }
    while (v90);
  }

  objc_msgSend_setAssetRegisterAndPutBatches_(v121, v116, (uint64_t)v85);
}

- (void)planAssetRequests
{
  NSArray *v3;
  unsigned int assetTokenRequestSizeLimit;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  int v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  NSArray *assetTokenRequests;
  NSArray *v40;
  void *v41;
  CKDAssetRequestPlanner *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_opt_new();
  assetTokenRequestSizeLimit = self->_assetTokenRequestSizeLimit;
  v5 = (void *)objc_opt_new();
  v42 = self;
  objc_msgSend_assetRegisterAndPutBatches(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v12 = objc_msgSend_count(v8, v10, v11);
  v14 = (void *)objc_msgSend_initWithCapacity_(v9, v13, v12);
  v16 = v14;
  if (v8)
    objc_msgSend_addObjectsFromArray_(v14, v15, (uint64_t)v8);
  v41 = v8;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v17 = v16;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v43, v47, 16);
  if (v19)
  {
    v22 = v19;
    v23 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v17);
        v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if ((objc_msgSend_isFailed(v25, v20, v21, v41) & 1) == 0)
        {
          if (objc_msgSend_size(v25, v20, v21) <= assetTokenRequestSizeLimit)
          {
            v31 = objc_msgSend_size(v25, v26, v27);
            if (objc_msgSend_size(v5, v32, v33) + v31 > assetTokenRequestSizeLimit)
            {
              objc_msgSend_addObject_(v3, v34, (uint64_t)v5);
              v35 = objc_opt_new();

              v5 = (void *)v35;
            }
            objc_msgSend_addAssetBatch_(v5, v34, (uint64_t)v25);
          }
          else
          {
            v28 = (void *)objc_opt_new();
            objc_msgSend_addAssetBatch_(v28, v29, (uint64_t)v25);
            objc_msgSend_addObject_(v3, v30, (uint64_t)v28);

          }
        }
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v43, v47, 16);
    }
    while (v22);
  }

  if ((objc_msgSend_isEmpty(v5, v36, v37) & 1) == 0)
    objc_msgSend_addObject_(v3, v38, (uint64_t)v5);
  assetTokenRequests = v42->_assetTokenRequests;
  v42->_assetTokenRequests = v3;
  v40 = v3;

}

- (void)failBatch:(id)a3
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend_setIsFailed_(v9, v3, 1);
  objc_msgSend_assetTokenRequest(v9, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v6)
    objc_msgSend_addFailedBatch_(v6, v7, (uint64_t)v9);

}

- (BOOL)hasSuccessfulBatches
{
  uint64_t v2;
  void *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend_assetRegisterAndPutBatches(self, a2, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v3);
        if (!objc_msgSend_isFailed(*(void **)(*((_QWORD *)&v11 + 1) + 8 * i), v5, v6))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)hasSuccessfulAssetTokenRequests
{
  NSArray *v2;
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_assetTokenRequests;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v2);
        if ((objc_msgSend_hasSuccessfulBatches(*(void **)(*((_QWORD *)&v10 + 1) + 8 * i), v4, v5, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v4, (uint64_t)&v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  void *v35;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_items(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);
  objc_msgSend_stringWithFormat_(v4, v11, (uint64_t)CFSTR("itemCount=%lu"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_assetRegisterAndPutBatches(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_count(v17, v18, v19);
  objc_msgSend_stringWithFormat_(v14, v21, (uint64_t)CFSTR("assetRegisterAndPutBatchCount=%lu"), v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v23, (uint64_t)v22);

  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_assetTokenRequests(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_count(v27, v28, v29);
  objc_msgSend_stringWithFormat_(v24, v31, (uint64_t)CFSTR("assetTokenRequestCount=%lu"), v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v33, (uint64_t)v32);

  objc_msgSend_componentsJoinedByString_(v3, v34, (uint64_t)CFSTR(", "));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetRequestPlanner *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSArray)assetRegisterAndPutBatches
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAssetRegisterAndPutBatches:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)assetTokenRequestSizeLimit
{
  return self->_assetTokenRequestSizeLimit;
}

- (NSArray)assetTokenRequests
{
  return self->_assetTokenRequests;
}

- (void)setAssetTokenRequests:(id)a3
{
  objc_storeStrong((id *)&self->_assetTokenRequests, a3);
}

- (NSMutableDictionary)rerefAssetBatchesByZoneID
{
  return self->_rerefAssetBatchesByZoneID;
}

- (void)setRerefAssetBatchesByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_rerefAssetBatchesByZoneID, a3);
}

- (NSMutableDictionary)assetBatchesByZoneID
{
  return self->_assetBatchesByZoneID;
}

- (void)setAssetBatchesByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_assetBatchesByZoneID, a3);
}

- (NSMutableOrderedSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSMutableDictionary)assetZoneByKey
{
  return self->_assetZoneByKey;
}

- (void)setAssetZoneByKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetZoneByKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetZoneByKey, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_assetBatchesByZoneID, 0);
  objc_storeStrong((id *)&self->_rerefAssetBatchesByZoneID, 0);
  objc_storeStrong((id *)&self->_assetTokenRequests, 0);
  objc_storeStrong((id *)&self->_assetRegisterAndPutBatches, 0);
}

@end
