@implementation CKDMMCSItemGroupContext

- (CKDMMCSItemGroupContext)initWithMMCS:(id)a3 itemGroup:(id)a4 operation:(id)a5 progress:(id)a6 command:(id)a7 start:(id)a8 groupCompletion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CKDMMCSItemGroupContext *v22;
  CKDMMCSItemGroupContext *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSNumber *hasConformingOperation;
  void *v30;
  id progressBlock;
  void *v32;
  id startBlock;
  void *v34;
  id completionBlock;
  void *v36;
  id commandBlock;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSMapTable *MMCSItemsByItemID;
  id v42;
  const char *v43;
  uint64_t v44;
  CKSignpost *signpost;
  id v47;
  objc_super v48;

  v47 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v48.receiver = self;
  v48.super_class = (Class)CKDMMCSItemGroupContext;
  v22 = -[CKDMMCSItemGroupContext init](&v48, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_MMCS, a3);
    objc_storeStrong((id *)&v23->_itemGroup, a4);
    objc_storeWeak((id *)&v23->_operation, v17);
    v24 = (void *)MEMORY[0x1E0CB37E8];
    v26 = objc_msgSend_conformsToProtocol_(v17, v25, (uint64_t)&unk_1EF5DC848);
    objc_msgSend_numberWithBool_(v24, v27, v26);
    v28 = objc_claimAutoreleasedReturnValue();
    hasConformingOperation = v23->_hasConformingOperation;
    v23->_hasConformingOperation = (NSNumber *)v28;

    v30 = _Block_copy(v18);
    progressBlock = v23->_progressBlock;
    v23->_progressBlock = v30;

    v32 = _Block_copy(v20);
    startBlock = v23->_startBlock;
    v23->_startBlock = v32;

    v34 = _Block_copy(v21);
    completionBlock = v23->_completionBlock;
    v23->_completionBlock = v34;

    v36 = _Block_copy(v19);
    commandBlock = v23->_commandBlock;
    v23->_commandBlock = v36;

    objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    MMCSItemsByItemID = v23->_MMCSItemsByItemID;
    v23->_MMCSItemsByItemID = (NSMapTable *)v40;

    v42 = objc_alloc(MEMORY[0x1E0C95140]);
    v44 = objc_msgSend_initWithLog_(v42, v43, *MEMORY[0x1E0C952C8]);
    signpost = v23->_signpost;
    v23->_signpost = (CKSignpost *)v44;

  }
  return v23;
}

- (void)cancel
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;

  objc_msgSend_MMCS(self, a2, v2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSEngineContext(v8, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelRequestWithContext_(v6, v7, (uint64_t)self);

}

- (void)start
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  os_signpost_id_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  _QWORD v33[5];
  uint8_t buf[16];

  objc_msgSend_signpost(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend_signpost(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_log(v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_signpost(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_identifier(v14, v15, v16);

    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE990000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CKDMMCSItemGroupContext", ", buf, 2u);
    }

  }
  objc_msgSend_hash(self, v6, v7);
  kdebug_trace();
  objc_msgSend_MMCS(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSEngineContext(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v24, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, self, CFSTR("CKDMMCSItemGroupContext.m"), 76, CFSTR("Expected non-nil MMCS engine context"));

  }
  objc_msgSend_MMCS(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSEngineContext(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1BEB87744;
  v33[3] = &unk_1E782EA40;
  v33[4] = self;
  objc_msgSend_MMCSSerializeAsyncRecursive_(v29, v30, (uint64_t)v33);

}

- (BOOL)shouldFetchAssetContentInMemory
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  BOOL v9;

  if (objc_msgSend_mmcsOperationType(self, a2, v2) != 2)
    return 0;
  objc_msgSend_operationInfo(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_destination(v6, v7, v8) == 1;

  return v9;
}

- (BOOL)shouldFetchAssetContentUsingAssetDownloadStagingManager
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  BOOL v9;

  if (objc_msgSend_mmcsOperationType(self, a2, v2) != 2)
    return 0;
  objc_msgSend_operationInfo(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_destination(v6, v7, v8) == 2;

  return v9;
}

- (BOOL)shouldFetchAssetContentWithReaderWriter
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  if (objc_msgSend_mmcsOperationType(self, a2, v2) != 2)
    return 0;
  objc_msgSend_operationInfo(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (v6)
    v10 = objc_msgSend_destination(v6, v7, v8) != 0;
  else
    v10 = 0;

  return v10;
}

- (void)_startTrackingMMCSItems:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_MMCSItemsByItemID(self, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = v5;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v30, v34, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (!objc_msgSend_itemID(v16, v11, v12))
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, CFSTR("CKDMMCSItemGroupContext.m"), 125, CFSTR("Expected non-nil itemID for %@"), v16);

        }
        v19 = (void *)MEMORY[0x1E0CB37E8];
        v20 = objc_msgSend_itemID(v16, v17, v18);
        objc_msgSend_numberWithUnsignedLongLong_(v19, v21, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v8, v23, (uint64_t)v16, v22);

      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v30, v34, 16);
    }
    while (v13);
  }

  objc_sync_exit(v8);
  objc_msgSend_MMCS(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startTrackingItemIDsForMMCSItems_(v28, v29, (uint64_t)v9);

}

- (void)_stopTrackingMMCSItems:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  dispatch_once_t *v18;
  uint64_t v19;
  os_log_t *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_MMCS(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopTrackingItemIDsForMMCSItems_(v7, v8, (uint64_t)v4);

  objc_msgSend_MMCSItemsByItemID(self, v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = v4;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v32, v38, 16);
  if (v16)
  {
    v18 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    v19 = *(_QWORD *)v33;
    v20 = (os_log_t *)MEMORY[0x1E0C952B0];
    *(_QWORD *)&v17 = 138412290;
    v31 = v17;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v12);
        v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v21);
        if (objc_msgSend_itemID(v22, v14, v15, v31, (_QWORD)v32))
        {
          v25 = (void *)MEMORY[0x1E0CB37E8];
          v26 = objc_msgSend_itemID(v22, v23, v24);
          objc_msgSend_numberWithUnsignedLongLong_(v25, v27, v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v11, v29, (uint64_t)v28);

        }
        else
        {
          if (*v18 != -1)
            dispatch_once(v18, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v30 = *v20;
          if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v31;
            v37 = v22;
            _os_log_debug_impl(&dword_1BE990000, v30, OS_LOG_TYPE_DEBUG, "ignoring item with zero itemID in _stopTrackingMMCSItems %@", buf, 0xCu);
          }
        }
        ++v21;
      }
      while (v16 != v21);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v32, v38, 16);
    }
    while (v16);
  }

  objc_sync_exit(v11);
}

- (id)findTrackedMMCSItemByItemID:(unint64_t)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_MMCSItemsByItemID(self, a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v8;
}

- (BOOL)_setupRegisterMMCSItemsWithError:(id *)a3
{
  CKDMMCSItemGroupContext *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  id v56;
  const char *v57;
  int v58;
  const char *v59;
  void *v60;
  id v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  NSObject *v88;
  NSObject *v89;
  const char *v90;
  char v91;
  NSObject *v92;
  void *v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t AvailableItemID;
  const char *v120;
  const char *v121;
  CKDAssetHandle *v122;
  const char *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  void *v153;
  const char *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  void *v177;
  uint64_t v178;
  const char *v179;
  void *v180;
  const char *v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  int isEqualToData;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  void *v198;
  const char *v199;
  const char *v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  NSObject *v205;
  void *v206;
  const char *v207;
  const char *v208;
  const char *v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  int started;
  id v221;
  const char *v222;
  uint64_t v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t i;
  void *v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  const char *v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  void *v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  _BOOL8 v246;
  const char *v247;
  const char *v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  const char *v256;
  const char *v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  const char *v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  const char *v267;
  const char *v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  const char *v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  const char *v282;
  const char *v283;
  BOOL v284;
  void *v286;
  const char *v287;
  void *v288;
  const char *v289;
  id *v290;
  id v291;
  void *v292;
  CKDMMCSItemGroupContext *v293;
  uint64_t v294;
  uint64_t v295;
  id obj;
  void *v297;
  void *v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  id v303;
  id v304;
  id v305;
  id v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  uint8_t v311[128];
  uint8_t buf[4];
  void *v313;
  __int16 v314;
  id v315;
  _BYTE v316[128];
  uint64_t v317;

  v5 = self;
  v317 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCS(self, a2, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v286, v287, (uint64_t)a2, v5, CFSTR("CKDMMCSItemGroupContext.m"), 157, CFSTR("Expected non-nil MMCS engine wrapper for %@"), v5);

  }
  objc_msgSend_assetCache(v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v288, v289, (uint64_t)a2, v5, CFSTR("CKDMMCSItemGroupContext.m"), 158, CFSTR("Expected non-nil asset cache for %@"), v8);

  }
  objc_msgSend_itemGroup(v5, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_items(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_count(v15, v16, v17);

  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v22 = (void *)objc_msgSend_initWithCapacity_(v20, v21, v18);
  v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v297 = (void *)objc_msgSend_initWithCapacity_(v23, v24, v18);
  if (objc_msgSend_mmcsOperationType(v5, v25, v26) != 5 && objc_msgSend_mmcsOperationType(v5, v27, v28) != 6)
    __assert_rtn("-[CKDMMCSItemGroupContext _setupRegisterMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 167, "isRegister && \"isRegister\");
  v290 = a3;
  v292 = v8;
  v309 = 0u;
  v310 = 0u;
  v307 = 0u;
  v308 = 0u;
  objc_msgSend_itemGroup(v5, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_items(v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v32;
  v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v307, v316, 16);
  v293 = v5;
  v291 = v19;
  v298 = v22;
  if (v34)
  {
    v37 = v34;
    v38 = 0;
    v39 = *(_QWORD *)v308;
    v295 = *(_QWORD *)v308;
    while (1)
    {
      v40 = 0;
      v294 = v37;
      do
      {
        if (*(_QWORD *)v308 != v39)
          objc_enumerationMutation(obj);
        v41 = *(void **)(*((_QWORD *)&v307 + 1) + 8 * v40);
        if (objc_msgSend_itemID(v41, v35, v36))
        {
          objc_msgSend_addObject_(v22, v42, (uint64_t)v41);
          goto LABEL_69;
        }
        objc_msgSend_sectionItems(v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend_count(v44, v45, v46);

        if (v47)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v50 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v313 = v41;
            _os_log_error_impl(&dword_1BE990000, v50, OS_LOG_TYPE_ERROR, "setting up a package section? %@", buf, 0xCu);
          }
        }
        objc_msgSend_clearFileSize(v41, v48, v49);
        v52 = objc_msgSend_setSignature_(v41, v51, 0);
        v53 = (void *)MEMORY[0x1C3B83E24](v52);
        v306 = v38;
        objc_msgSend_getCKDMMCSItemReaderByPathForMMCSItem_error_(v5, v54, (uint64_t)v41, &v306);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v306;

        if (v55)
        {
          v305 = v56;
          v58 = objc_msgSend_openWithError_(v55, v57, (uint64_t)&v305);
          v38 = v305;

          if (v58)
          {
            v304 = v38;
            objc_msgSend_getFileMetadataWithError_(v55, v59, (uint64_t)&v304);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = v304;

            if (v60)
            {
              objc_msgSend_deviceID(v60, v62, v63);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setDeviceID_(v41, v65, (uint64_t)v64);

              objc_msgSend_fileID(v60, v66, v67);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setFileID_(v41, v69, (uint64_t)v68);

              objc_msgSend_generationID(v60, v70, v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setGenerationID_(v41, v73, (uint64_t)v72);

              objc_msgSend_modTimeInSeconds(v60, v74, v75);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setModTimeInSeconds_(v41, v77, (uint64_t)v76);

              objc_msgSend_fileSize(v60, v78, v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = objc_msgSend_unsignedLongLongValue(v80, v81, v82);
              objc_msgSend_setFileSize_(v41, v84, v83);
            }
            else
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v89 = *MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v313 = v41;
                v314 = 2112;
                v315 = v61;
                _os_log_error_impl(&dword_1BE990000, v89, OS_LOG_TYPE_ERROR, "Unable to get info for %@: %@", buf, 0x16u);
              }
              v80 = v61;
              v61 = 0;
            }

            v303 = v61;
            v91 = objc_msgSend_closeWithError_(v55, v90, (uint64_t)&v303);
            v38 = v303;

            if ((v91 & 1) != 0)
            {
              v5 = v293;
              v37 = v294;
              v22 = v298;
              goto LABEL_46;
            }
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v92 = *MEMORY[0x1E0C952B0];
            v22 = v298;
            v37 = v294;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v313 = v41;
              v314 = 2112;
              v315 = v38;
              _os_log_error_impl(&dword_1BE990000, v92, OS_LOG_TYPE_ERROR, "Unable to close for %@: %@", buf, 0x16u);
            }
            v5 = v293;
          }
          else
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v5 = v293;
            v88 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v313 = v41;
              v314 = 2112;
              v315 = v38;
              _os_log_error_impl(&dword_1BE990000, v88, OS_LOG_TYPE_ERROR, "Unable to open for %@: %@", buf, 0x16u);
            }
            v60 = 0;
          }

          v38 = 0;
LABEL_46:

          objc_autoreleasePoolPop(v53);
          if (v60)
          {
            objc_msgSend_deviceID(v60, v86, v87);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setDeviceID_(v41, v94, (uint64_t)v93);

            objc_msgSend_fileID(v60, v95, v96);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setFileID_(v41, v98, (uint64_t)v97);

            objc_msgSend_generationID(v60, v99, v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setGenerationID_(v41, v102, (uint64_t)v101);

            objc_msgSend_modTimeInSeconds(v60, v103, v104);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setModTimeInSeconds_(v41, v106, (uint64_t)v105);

            objc_msgSend_fileSize(v60, v107, v108);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = objc_msgSend_unsignedLongLongValue(v109, v110, v111);
            objc_msgSend_setFileSize_(v41, v113, v112);

          }
          goto LABEL_48;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v85 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v313 = v41;
          v314 = 2112;
          v315 = v56;
          _os_log_error_impl(&dword_1BE990000, v85, OS_LOG_TYPE_ERROR, "Unable to open reader for %@: %@", buf, 0x16u);
        }

        objc_autoreleasePoolPop(v53);
        v38 = 0;
        v60 = 0;
LABEL_48:
        if (!objc_msgSend_shouldReadAssetContentUsingClientProxy(v41, v86, v87))
        {
          v122 = [CKDAssetHandle alloc];
          v124 = (void *)objc_msgSend_initWithItemID_UUID_path_(v122, v123, 0, 0, 0);
          if ((objc_msgSend_shouldReadRawEncryptedData(v41, v125, v126) & 1) == 0)
          {
            objc_msgSend_deviceID(v41, v127, v128);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend_unsignedLongLongValue(v129, v130, v131))
            {

              goto LABEL_55;
            }
            objc_msgSend_fileID(v41, v132, v133);
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = objc_msgSend_unsignedLongLongValue(v134, v135, v136);

            if (!v137)
            {
LABEL_55:
              objc_msgSend_fileURL(v41, v138, v139);
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_path(v140, v141, v142);
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setPath_(v124, v144, (uint64_t)v143);

            }
            objc_msgSend_MMCS(v293, v138, v139);
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_assetCache(v145, v146, v147);
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_deviceID(v41, v149, v150);
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_volumeIndexForDeviceID_(v148, v152, (uint64_t)v151);
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setVolumeIndex_(v124, v154, (uint64_t)v153);

            v5 = v293;
            objc_msgSend_fileID(v41, v155, v156);
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setFileID_(v124, v158, (uint64_t)v157);

            objc_msgSend_generationID(v41, v159, v160);
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setGenerationID_(v124, v162, (uint64_t)v161);

            objc_msgSend_signature(v41, v163, v164);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setFileSignature_(v124, v166, (uint64_t)v165);

            v167 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend_modTimeInSeconds(v41, v168, v169);
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v170, v171, v172);
            objc_msgSend_dateWithTimeIntervalSince1970_(v167, v173, v174);
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setModTime_(v124, v176, (uint64_t)v175);

            v19 = v291;
          }
          v177 = (void *)MEMORY[0x1E0CB37E8];
          v178 = objc_msgSend_fileSize(v41, v127, v128);
          objc_msgSend_numberWithUnsignedLongLong_(v177, v179, v178);
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setFileSize_(v124, v181, (uint64_t)v180);

          objc_msgSend_fileSignature(v124, v182, v183);
          v184 = (void *)objc_claimAutoreleasedReturnValue();

          if (v184)
          {
            objc_msgSend_fileSignature(v124, v185, v186);
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_zeroSizeFileSignature(CKDMMCS, v188, v189);
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToData = objc_msgSend_isEqualToData_(v187, v191, (uint64_t)v190);

            if ((isEqualToData & 1) != 0
              || (objc_msgSend_fileSize(v124, v185, v186),
                  v193 = (void *)objc_claimAutoreleasedReturnValue(),
                  v196 = objc_msgSend_unsignedLongLongValue(v193, v194, v195),
                  v193,
                  !v196))
            {
              v197 = (void *)MEMORY[0x1E0C95138];
              objc_msgSend_fileSignature(v124, v185, v186);
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v197) = objc_msgSend_isValidV2Signature_(v197, v199, (uint64_t)v198);

              if (((v197 | isEqualToData) & 1) == 0)
                __assert_rtn("-[CKDMMCSItemGroupContext _setupRegisterMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 264, "isZeroFileSignature && \"Expected zeroSizeFileSignature\");
              if ((isEqualToData & 1) == 0)
                __assert_rtn("-[CKDMMCSItemGroupContext _setupRegisterMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 266, "isZeroFileSignature && \"Expected zeroSizeFileSignature\");
              objc_msgSend_fileSize(v124, v200, v201);
              v202 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_unsignedLongLongValue(v202, v203, v204))
                __assert_rtn("-[CKDMMCSItemGroupContext _setupRegisterMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 267, "assetHandle.fileSize.unsignedLongLongValue == 0 && \"assetHandle.fileSize.unsignedLongLongValue == 0\");

              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v205 = *MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v313 = v41;
                _os_log_debug_impl(&dword_1BE990000, v205, OS_LOG_TYPE_DEBUG, "Zero-length asset with itemID %@", buf, 0xCu);
              }
            }
          }
          objc_msgSend_boundaryKey(v41, v185, v186);
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setBoundaryKeyHashUsingBoundaryKey_(v124, v207, (uint64_t)v206);

          objc_msgSend_addObject_(v297, v208, (uint64_t)v124);
          objc_msgSend_addObject_(v19, v209, (uint64_t)v41);

          v22 = v298;
          v37 = v294;
          goto LABEL_68;
        }
        objc_msgSend_MMCSEngineContext(v292, v114, v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        AvailableItemID = objc_msgSend_nextAvailableItemID(v116, v117, v118);
        objc_msgSend_setItemID_(v41, v120, AvailableItemID);

        objc_msgSend_addObject_(v22, v121, (uint64_t)v41);
LABEL_68:

        v39 = v295;
LABEL_69:
        ++v40;
      }
      while (v37 != v40);
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v307, v316, 16);
      if (!v37)
        goto LABEL_73;
    }
  }
  v38 = 0;
LABEL_73:

  v210 = v297;
  if (objc_msgSend_count(v297, v211, v212)
    && (objc_msgSend_assetCache(v292, v213, v214),
        v215 = (void *)objc_claimAutoreleasedReturnValue(),
        v218 = objc_msgSend_mmcsOperationType(v5, v216, v217),
        started = objc_msgSend_startTrackingRegisterOrPutAssetHandles_operationType_error_(v215, v219, (uint64_t)v297, v218, v290), v215, !started))
  {
    v284 = 0;
  }
  else
  {
    v301 = 0u;
    v302 = 0u;
    v299 = 0u;
    v300 = 0u;
    v221 = v19;
    v223 = objc_msgSend_countByEnumeratingWithState_objects_count_(v221, v222, (uint64_t)&v299, v311, 16);
    if (v223)
    {
      v225 = v223;
      v226 = 0;
      v227 = *(_QWORD *)v300;
      do
      {
        for (i = 0; i != v225; ++i)
        {
          if (*(_QWORD *)v300 != v227)
            objc_enumerationMutation(v221);
          v229 = *(void **)(*((_QWORD *)&v299 + 1) + 8 * i);
          objc_msgSend_objectAtIndexedSubscript_(v297, v224, v226 + i);
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_itemID(v230, v231, v232);
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          v236 = objc_msgSend_unsignedLongLongValue(v233, v234, v235);
          objc_msgSend_setItemID_(v229, v237, v236);

          objc_msgSend_status(v230, v238, v239);
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          if (v242)
          {
            objc_msgSend_status(v230, v240, v241);
            v243 = (void *)objc_claimAutoreleasedReturnValue();
            v246 = objc_msgSend_unsignedIntegerValue(v243, v244, v245) == 2;
            objc_msgSend_setIsAlreadyRegistered_(v229, v247, v246);

          }
          else
          {
            objc_msgSend_setIsAlreadyRegistered_(v229, v240, 0);
          }

          if (objc_msgSend_isAlreadyRegistered(v229, v248, v249))
          {
            objc_msgSend_fileSize(v230, v250, v251);
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            v255 = objc_msgSend_unsignedLongLongValue(v252, v253, v254);
            objc_msgSend_setFileSize_(v229, v256, v255);

            objc_msgSend_fileSignature(v230, v257, v258);
            v259 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setSignature_(v229, v260, (uint64_t)v259);

            objc_msgSend_chunkCount(v230, v261, v262);
            v263 = (void *)objc_claimAutoreleasedReturnValue();
            v266 = objc_msgSend_unsignedIntValue(v263, v264, v265);
            objc_msgSend_setChunkCount_(v229, v267, v266);

            objc_msgSend_signature(v229, v268, v269);
            v270 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_asset(v229, v271, v272);
            v273 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setSignature_(v273, v274, (uint64_t)v270);

            v277 = objc_msgSend_fileSize(v229, v275, v276);
            objc_msgSend_asset(v229, v278, v279);
            v280 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setSize_(v280, v281, v277);

          }
          else
          {
            objc_msgSend_setIsReaderReadFrom_(v229, v250, 0);
          }
          v22 = v298;
          objc_msgSend_addObject_(v298, v282, (uint64_t)v229);

        }
        v225 = objc_msgSend_countByEnumeratingWithState_objects_count_(v221, v224, (uint64_t)&v299, v311, 16);
        v226 += i;
      }
      while (v225);
    }

    objc_msgSend__startTrackingMMCSItems_(v293, v283, (uint64_t)v22);
    v284 = 1;
    v19 = v291;
    v210 = v297;
  }

  return v284;
}

- (BOOL)_setupPutMMCSItemsWithError:(id *)a3
{
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  void *v21;
  id v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t AvailableItemID;
  const char *v58;
  CKDAssetHandle *v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  void *v114;
  uint64_t v115;
  const char *v116;
  void *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  int isEqualToData;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  const char *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  NSObject *v142;
  void *v143;
  const char *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  int started;
  id v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t i;
  void *v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  const char *v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  _BOOL8 v183;
  const char *v184;
  const char *v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  const char *v219;
  void *v221;
  const char *v222;
  void *v223;
  const char *v224;
  id *v225;
  void *v226;
  CKDMMCSItemGroupContext *v227;
  void *v228;
  id v229;
  void *v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  uint8_t v239[128];
  uint8_t buf[4];
  void *v241;
  _BYTE v242[128];
  uint64_t v243;

  v243 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCS(self, a2, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v221, v222, (uint64_t)a2, self, CFSTR("CKDMMCSItemGroupContext.m"), 308, CFSTR("Expected non-nil MMCS engine wrapper for %@"), self);

  }
  objc_msgSend_assetCache(v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v223, v224, (uint64_t)a2, self, CFSTR("CKDMMCSItemGroupContext.m"), 309, CFSTR("Expected non-nil asset cache for %@"), v8);

  }
  objc_msgSend_itemGroup(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_items(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_count(v15, v16, v17);

  v229 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v21 = (void *)objc_msgSend_initWithCapacity_(v19, v20, v18);
  v22 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v24 = (void *)objc_msgSend_initWithCapacity_(v22, v23, v18);
  if (objc_msgSend_mmcsOperationType(self, v25, v26) == 2 || objc_msgSend_mmcsOperationType(self, v27, v28) == 4)
    __assert_rtn("-[CKDMMCSItemGroupContext _setupPutMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 318, "!isGet && \"isGet\");
  v225 = a3;
  v237 = 0u;
  v238 = 0u;
  v235 = 0u;
  v236 = 0u;
  v227 = self;
  objc_msgSend_itemGroup(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_items(v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v235, v242, 16);
  v226 = v8;
  v230 = v24;
  if (v36)
  {
    v39 = v36;
    v40 = *(_QWORD *)v236;
    v228 = v34;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v236 != v40)
          objc_enumerationMutation(v34);
        v42 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * v41);
        if (objc_msgSend_itemID(v42, v37, v38))
          goto LABEL_20;
        objc_msgSend_sectionItems(v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend_count(v45, v46, v47);

        if (v48)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v51 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v241 = v42;
            _os_log_error_impl(&dword_1BE990000, v51, OS_LOG_TYPE_ERROR, "setting up a package section? %@", buf, 0xCu);
          }
        }
        if (objc_msgSend_shouldReadAssetContentUsingClientProxy(v42, v49, v50))
        {
          objc_msgSend_MMCSEngineContext(v8, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          AvailableItemID = objc_msgSend_nextAvailableItemID(v54, v55, v56);
          objc_msgSend_setItemID_(v42, v58, AvailableItemID);

LABEL_20:
          objc_msgSend_addObject_(v21, v43, (uint64_t)v42);
          goto LABEL_21;
        }
        v59 = [CKDAssetHandle alloc];
        v61 = (void *)objc_msgSend_initWithItemID_UUID_path_(v59, v60, 0, 0, 0);
        if ((objc_msgSend_shouldReadRawEncryptedData(v42, v62, v63) & 1) == 0)
        {
          objc_msgSend_deviceID(v42, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_unsignedLongLongValue(v66, v67, v68))
          {
            objc_msgSend_fileID(v42, v69, v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = objc_msgSend_unsignedLongLongValue(v71, v72, v73);

            if (!v74)
            {
LABEL_28:
              objc_msgSend_fileURL(v42, v75, v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_path(v77, v78, v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setPath_(v61, v81, (uint64_t)v80);

            }
            objc_msgSend_MMCS(v227, v75, v76);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_assetCache(v82, v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_deviceID(v42, v86, v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_volumeIndexForDeviceID_(v85, v89, (uint64_t)v88);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setVolumeIndex_(v61, v91, (uint64_t)v90);

            objc_msgSend_fileID(v42, v92, v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setFileID_(v61, v95, (uint64_t)v94);

            objc_msgSend_generationID(v42, v96, v97);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setGenerationID_(v61, v99, (uint64_t)v98);

            objc_msgSend_signature(v42, v100, v101);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setFileSignature_(v61, v103, (uint64_t)v102);

            v104 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend_modTimeInSeconds(v42, v105, v106);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v107, v108, v109);
            objc_msgSend_dateWithTimeIntervalSince1970_(v104, v110, v111);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setModTime_(v61, v113, (uint64_t)v112);

            v8 = v226;
            goto LABEL_30;
          }

          goto LABEL_28;
        }
LABEL_30:
        v114 = (void *)MEMORY[0x1E0CB37E8];
        v115 = objc_msgSend_fileSize(v42, v64, v65);
        objc_msgSend_numberWithUnsignedLongLong_(v114, v116, v115);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setFileSize_(v61, v118, (uint64_t)v117);

        objc_msgSend_fileSignature(v61, v119, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        if (v121)
        {
          objc_msgSend_fileSignature(v61, v122, v123);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zeroSizeFileSignature(CKDMMCS, v125, v126);
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToData = objc_msgSend_isEqualToData_(v124, v128, (uint64_t)v127);

          if ((isEqualToData & 1) != 0
            || (objc_msgSend_fileSize(v61, v122, v123),
                v130 = (void *)objc_claimAutoreleasedReturnValue(),
                v133 = objc_msgSend_unsignedLongLongValue(v130, v131, v132),
                v130,
                !v133))
          {
            v134 = (void *)MEMORY[0x1E0C95138];
            objc_msgSend_fileSignature(v61, v122, v123);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v134) = objc_msgSend_isValidV2Signature_(v134, v136, (uint64_t)v135);

            if (((v134 | isEqualToData) & 1) == 0)
              __assert_rtn("-[CKDMMCSItemGroupContext _setupPutMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 356, "isZeroFileSignature && \"Expected zeroSizeFileSignature\");
            objc_msgSend_fileSize(v61, v137, v138);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_unsignedLongLongValue(v139, v140, v141))
              __assert_rtn("-[CKDMMCSItemGroupContext _setupPutMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 358, "assetHandle.fileSize.unsignedLongLongValue == 0 && \"assetHandle.fileSize.unsignedLongLongValue == 0\");

            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v142 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v241 = v42;
              _os_log_debug_impl(&dword_1BE990000, v142, OS_LOG_TYPE_DEBUG, "Zero-length asset with itemID %@", buf, 0xCu);
            }
          }
        }
        objc_msgSend_boundaryKey(v42, v122, v123);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setBoundaryKeyHashUsingBoundaryKey_(v61, v144, (uint64_t)v143);

        v24 = v230;
        objc_msgSend_addObject_(v230, v145, (uint64_t)v61);
        objc_msgSend_addObject_(v229, v146, (uint64_t)v42);

        v34 = v228;
LABEL_21:
        ++v41;
      }
      while (v39 != v41);
      v147 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v235, v242, 16);
      v39 = v147;
    }
    while (v147);
  }

  if (!objc_msgSend_count(v24, v148, v149)
    || (objc_msgSend_assetCache(v8, v150, v151),
        v152 = (void *)objc_claimAutoreleasedReturnValue(),
        v155 = objc_msgSend_mmcsOperationType(v227, v153, v154),
        started = objc_msgSend_startTrackingRegisterOrPutAssetHandles_operationType_error_(v152, v156, (uint64_t)v24, v155, v225), v152, started))
  {
    v233 = 0u;
    v234 = 0u;
    v231 = 0u;
    v232 = 0u;
    v158 = v229;
    v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v159, (uint64_t)&v231, v239, 16);
    if (v160)
    {
      v162 = v160;
      v163 = 0;
      v164 = *(_QWORD *)v232;
      do
      {
        for (i = 0; i != v162; ++i)
        {
          if (*(_QWORD *)v232 != v164)
            objc_enumerationMutation(v158);
          v166 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * i);
          objc_msgSend_objectAtIndexedSubscript_(v230, v161, v163 + i);
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_itemID(v167, v168, v169);
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          v173 = objc_msgSend_unsignedLongLongValue(v170, v171, v172);
          objc_msgSend_setItemID_(v166, v174, v173);

          objc_msgSend_status(v167, v175, v176);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          if (v179)
          {
            objc_msgSend_status(v167, v177, v178);
            v180 = (void *)objc_claimAutoreleasedReturnValue();
            v183 = objc_msgSend_unsignedIntegerValue(v180, v181, v182) == 2;
            objc_msgSend_setIsAlreadyRegistered_(v166, v184, v183);

          }
          else
          {
            objc_msgSend_setIsAlreadyRegistered_(v166, v177, 0);
          }

          if (objc_msgSend_isAlreadyRegistered(v166, v185, v186))
          {
            objc_msgSend_fileSize(v167, v187, v188);
            v189 = (void *)objc_claimAutoreleasedReturnValue();
            v192 = objc_msgSend_unsignedLongLongValue(v189, v190, v191);
            objc_msgSend_setFileSize_(v166, v193, v192);

            objc_msgSend_fileSignature(v167, v194, v195);
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setSignature_(v166, v197, (uint64_t)v196);

            objc_msgSend_chunkCount(v167, v198, v199);
            v200 = (void *)objc_claimAutoreleasedReturnValue();
            v203 = objc_msgSend_unsignedIntValue(v200, v201, v202);
            objc_msgSend_setChunkCount_(v166, v204, v203);

            objc_msgSend_signature(v166, v205, v206);
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_asset(v166, v208, v209);
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setSignature_(v210, v211, (uint64_t)v207);

            v214 = objc_msgSend_fileSize(v166, v212, v213);
            objc_msgSend_asset(v166, v215, v216);
            v217 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setSize_(v217, v218, v214);

          }
          objc_msgSend_addObject_(v21, v187, (uint64_t)v166);

        }
        v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v161, (uint64_t)&v231, v239, 16);
        v163 += i;
      }
      while (v162);
    }

    objc_msgSend__startTrackingMMCSItems_(v227, v219, (uint64_t)v21);
    LOBYTE(started) = 1;
    v8 = v226;
    v24 = v230;
  }

  return started;
}

- (BOOL)_setupGetMMCSItemsWithError:(id *)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t AvailableItemID;
  const char *v45;
  id v46;
  const char *v47;
  int AssetHandles_operationType_error;
  void *v49;
  const char *v50;
  uint64_t v51;
  id v52;
  const char *v53;
  void *v54;
  id v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  CKDAssetHandle *v93;
  const char *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  void *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  void *v148;
  const char *v149;
  const char *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  const char *v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t j;
  void *v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  const char *v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  _BOOL8 v194;
  const char *v195;
  const char *v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  const char *v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  const char *v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  const char *v230;
  void *v232;
  const char *v233;
  void *v234;
  const char *v235;
  id *v236;
  id v237;
  void *v238;
  CKDMMCSItemGroupContext *v239;
  id obj;
  id obja;
  void *v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  uint8_t v255[128];
  uint8_t buf[4];
  void *v257;
  _BYTE v258[128];
  _BYTE v259[128];
  uint64_t v260;

  v260 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCS(self, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_itemGroup(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_items(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_count(v12, v13, v14);

  if (objc_msgSend_shouldFetchAssetContentInMemory(self, v16, v17))
  {
    objc_msgSend_itemGroup(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_items(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_copy(v23, v24, v25);

    v253 = 0u;
    v254 = 0u;
    v251 = 0u;
    v252 = 0u;
    objc_msgSend_itemGroup(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_items(v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v251, v259, 16);
    if (v34)
    {
      v37 = v34;
      v38 = *(_QWORD *)v252;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v252 != v38)
            objc_enumerationMutation(v32);
          v40 = *(void **)(*((_QWORD *)&v251 + 1) + 8 * i);
          if (!objc_msgSend_itemID(v40, v35, v36))
          {
            objc_msgSend_MMCSEngineContext(v6, v35, v36);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            AvailableItemID = objc_msgSend_nextAvailableItemID(v41, v42, v43);
            objc_msgSend_setItemID_(v40, v45, AvailableItemID);

          }
        }
        v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v251, v259, 16);
      }
      while (v37);
    }

    v46 = (id)v26;
    objc_msgSend__startTrackingMMCSItems_(self, v47, v26);
    LOBYTE(AssetHandles_operationType_error) = 1;
    goto LABEL_57;
  }
  if (!v6)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v232, v233, (uint64_t)a2, self, CFSTR("CKDMMCSItemGroupContext.m"), 408, CFSTR("Expected non-nil MMCS engine wrapper for %@"), self);

  }
  v236 = a3;
  objc_msgSend_assetCache(v6, v18, v19);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v50, v51);
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v234, v235, (uint64_t)a2, self, CFSTR("CKDMMCSItemGroupContext.m"), 409, CFSTR("Expected non-nil asset cache for %@"), v6);

  }
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v54 = (void *)objc_msgSend_initWithCapacity_(v52, v53, v15);
  v55 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v242 = (void *)objc_msgSend_initWithCapacity_(v55, v56, v15);
  v247 = 0u;
  v248 = 0u;
  v249 = 0u;
  v250 = 0u;
  v239 = self;
  objc_msgSend_itemGroup(self, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_items(v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v247, v258, 16);
  v237 = v46;
  v238 = v6;
  if (v64)
  {
    v67 = v64;
    v68 = *(_QWORD *)v248;
    obj = v62;
    do
    {
      v69 = 0;
      do
      {
        if (*(_QWORD *)v248 != v68)
          objc_enumerationMutation(v62);
        v70 = *(void **)(*((_QWORD *)&v247 + 1) + 8 * v69);
        if (objc_msgSend_itemID(v70, v65, v66))
          goto LABEL_24;
        objc_msgSend_constructedAssetDownloadURL(v70, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73)
        {
          objc_msgSend_MMCSEngineContext(v6, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend_nextAvailableItemID(v76, v77, v78);
          objc_msgSend_setItemID_(v70, v80, v79);

          objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUIDString(v83, v84, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setTrackingUUID_(v70, v87, (uint64_t)v86);

LABEL_24:
          objc_msgSend_addObject_(v54, v71, (uint64_t)v70);
          goto LABEL_25;
        }
        objc_msgSend_sectionItems(v70, v74, v75);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend_count(v88, v89, v90);

        if (v91)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v92 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v257 = v70;
            _os_log_error_impl(&dword_1BE990000, v92, OS_LOG_TYPE_ERROR, "setting up a package section? %@", buf, 0xCu);
          }
        }
        v93 = [CKDAssetHandle alloc];
        v95 = (void *)objc_msgSend_initWithItemID_UUID_path_(v93, v94, 0, 0, 0);
        if ((objc_msgSend_shouldReadRawEncryptedData(v70, v96, v97) & 1) == 0)
        {
          objc_msgSend_deviceID(v70, v98, v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_unsignedLongLongValue(v100, v101, v102))
          {
            objc_msgSend_fileID(v70, v103, v104);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = objc_msgSend_unsignedLongLongValue(v105, v106, v107);

            if (!v108)
            {
LABEL_37:
              objc_msgSend_fileURL(v70, v109, v110);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_path(v111, v112, v113);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setPath_(v95, v115, (uint64_t)v114);

            }
            objc_msgSend_MMCS(v239, v109, v110);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_assetCache(v116, v117, v118);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_deviceID(v70, v120, v121);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_volumeIndexForDeviceID_(v119, v123, (uint64_t)v122);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setVolumeIndex_(v95, v125, (uint64_t)v124);

            objc_msgSend_fileID(v70, v126, v127);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setFileID_(v95, v129, (uint64_t)v128);

            objc_msgSend_generationID(v70, v130, v131);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setGenerationID_(v95, v133, (uint64_t)v132);

            objc_msgSend_signature(v70, v134, v135);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setFileSignature_(v95, v137, (uint64_t)v136);

            v138 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend_modTimeInSeconds(v70, v139, v140);
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v141, v142, v143);
            objc_msgSend_dateWithTimeIntervalSince1970_(v138, v144, v145);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setModTime_(v95, v147, (uint64_t)v146);

            v46 = v237;
            v6 = v238;
            goto LABEL_39;
          }

          goto LABEL_37;
        }
LABEL_39:
        objc_msgSend_boundaryKey(v70, v98, v99);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setBoundaryKeyHashUsingBoundaryKey_(v95, v149, (uint64_t)v148);

        objc_msgSend_addObject_(v242, v150, (uint64_t)v95);
        objc_msgSend_addObject_(v46, v151, (uint64_t)v70);

        v62 = obj;
LABEL_25:
        ++v69;
      }
      while (v67 != v69);
      v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v247, v258, 16);
      v67 = v152;
    }
    while (v152);
  }

  v153 = v242;
  if (!objc_msgSend_count(v242, v154, v155)
    || (objc_msgSend_assetCache(v6, v156, v157),
        v158 = (void *)objc_claimAutoreleasedReturnValue(),
        v161 = objc_msgSend_mmcsOperationType(v239, v159, v160),
        AssetHandles_operationType_error = objc_msgSend_startTrackingGetAssetHandles_operationType_error_(v158, v162, (uint64_t)v242, v161, v236), v158, AssetHandles_operationType_error))
  {
    v245 = 0u;
    v246 = 0u;
    v243 = 0u;
    v244 = 0u;
    obja = v46;
    v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v163, (uint64_t)&v243, v255, 16);
    if (v164)
    {
      v166 = v164;
      v167 = 0;
      v168 = *(_QWORD *)v244;
      do
      {
        for (j = 0; j != v166; ++j)
        {
          if (*(_QWORD *)v244 != v168)
            objc_enumerationMutation(obja);
          v170 = *(void **)(*((_QWORD *)&v243 + 1) + 8 * j);
          objc_msgSend_objectAtIndexedSubscript_(v153, v165, v167 + j);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUID(v171, v172, v173);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUIDString(v174, v175, v176);
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setTrackingUUID_(v170, v178, (uint64_t)v177);

          objc_msgSend_itemID(v171, v179, v180);
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          v184 = objc_msgSend_unsignedLongLongValue(v181, v182, v183);
          objc_msgSend_setItemID_(v170, v185, v184);

          objc_msgSend_status(v171, v186, v187);
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          if (v190)
          {
            objc_msgSend_status(v171, v188, v189);
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            v194 = objc_msgSend_unsignedIntegerValue(v191, v192, v193) == 2;
            objc_msgSend_setIsAlreadyRegistered_(v170, v195, v194);

          }
          else
          {
            objc_msgSend_setIsAlreadyRegistered_(v170, v188, 0);
          }

          if (objc_msgSend_isAlreadyRegistered(v170, v196, v197))
          {
            objc_msgSend_fileSize(v171, v198, v199);
            v200 = (void *)objc_claimAutoreleasedReturnValue();
            v203 = objc_msgSend_unsignedLongLongValue(v200, v201, v202);
            objc_msgSend_setFileSize_(v170, v204, v203);

            objc_msgSend_fileSignature(v171, v205, v206);
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setSignature_(v170, v208, (uint64_t)v207);

            objc_msgSend_chunkCount(v171, v209, v210);
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            v214 = objc_msgSend_unsignedIntValue(v211, v212, v213);
            objc_msgSend_setChunkCount_(v170, v215, v214);

            objc_msgSend_signature(v170, v216, v217);
            v218 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_asset(v170, v219, v220);
            v221 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setSignature_(v221, v222, (uint64_t)v218);

            v225 = objc_msgSend_fileSize(v170, v223, v224);
            objc_msgSend_asset(v170, v226, v227);
            v228 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setSize_(v228, v229, v225);

          }
          objc_msgSend_addObject_(v54, v198, (uint64_t)v170);

          v153 = v242;
        }
        v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v165, (uint64_t)&v243, v255, 16);
        v167 += j;
      }
      while (v166);
    }

    objc_msgSend__startTrackingMMCSItems_(v239, v230, (uint64_t)v54);
    LOBYTE(AssetHandles_operationType_error) = 1;
    v46 = v237;
    v6 = v238;
  }

LABEL_57:
  return AssetHandles_operationType_error;
}

- (BOOL)_setupMMCSItemsWithError:(id *)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  char MMCSItemsWithError;
  void *v14;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCS(self, a2, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, CFSTR("CKDMMCSItemGroupContext.m"), 475, CFSTR("Expected non-nil MMCS engine wrapper for %@"), self);

  }
  objc_msgSend_assetCache(v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, CFSTR("CKDMMCSItemGroupContext.m"), 476, CFSTR("Expected non-nil asset cache for %@"), v7);

  }
  v11 = objc_msgSend_mmcsOperationType(self, v9, v10);
  if (v11 <= 6)
  {
    if (((1 << v11) & 0xA) != 0)
    {
      v25 = 0;
      MMCSItemsWithError = objc_msgSend__setupPutMMCSItemsWithError_(self, v12, (uint64_t)&v25);
      v14 = v25;
      goto LABEL_12;
    }
    if (((1 << v11) & 0x14) != 0)
    {
      v24 = 0;
      MMCSItemsWithError = objc_msgSend__setupGetMMCSItemsWithError_(self, v12, (uint64_t)&v24);
      v14 = v24;
      goto LABEL_12;
    }
    if (((1 << v11) & 0x60) != 0)
    {
      v26 = 0;
      MMCSItemsWithError = objc_msgSend__setupRegisterMMCSItemsWithError_(self, v12, (uint64_t)&v26);
      v14 = v26;
LABEL_12:

      goto LABEL_13;
    }
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v16 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v17 = v16;
    *(_DWORD *)buf = 134217984;
    v28 = objc_msgSend_mmcsOperationType(self, v18, v19);
    _os_log_error_impl(&dword_1BE990000, v17, OS_LOG_TYPE_ERROR, "Invalid mmcs operation type %ld", buf, 0xCu);

  }
  MMCSItemsWithError = 1;
LABEL_13:

  return MMCSItemsWithError;
}

- (void)_cleanupMMCSRegisterItems
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend_itemGroup(self, a2, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_items(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, v17, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v6);
        objc_msgSend_setIsAlreadyRegistered_(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v12++), v9, 0);
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_cleanupMMCSItems
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t shouldCloneFileInAssetCache;
  const char *v26;
  id v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  uint8_t buf[4];
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_msgSend_MMCS(self, a2, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v53, v54, (uint64_t)a2, self, CFSTR("CKDMMCSItemGroupContext.m"), 509, CFSTR("Expected non-nil MMCS engine wrapper for %@"), self);

  }
  objc_msgSend_assetCache(v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v56, (uint64_t)a2, self, CFSTR("CKDMMCSItemGroupContext.m"), 510, CFSTR("Expected non-nil asset cache for %@"), v7);

  }
  v11 = objc_msgSend_mmcsOperationType(self, v9, v10);
  if (v11 <= 6)
  {
    if (((1 << v11) & 0xA) != 0)
    {
      objc_msgSend_assetCache(v7, v12, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_itemGroup(self, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_items(v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v23, v24);
      v61 = 0;
      objc_msgSend_updateAssetHandlesForPutMMCSItems_cloneItems_error_(v16, v26, (uint64_t)v22, shouldCloneFileInAssetCache, &v61);
      v27 = v61;

      goto LABEL_23;
    }
    if (((1 << v11) & 0x14) != 0)
    {
      if (!objc_msgSend_shouldFetchAssetContentInMemory(self, v12, v13))
        goto LABEL_23;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      objc_msgSend_itemGroup(self, v14, v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_items(v28, v29, v30);
      v31 = objc_claimAutoreleasedReturnValue();

      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v57, v64, 16);
      if (v33)
      {
        v36 = v33;
        v37 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v58 != v37)
              objc_enumerationMutation(v31);
            v39 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            objc_msgSend_MMCSEngineContext(v7, v34, v35);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend_itemID(v39, v41, v42);
            objc_msgSend_stopTrackingItemID_(v40, v44, v43);

          }
          v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v57, v64, 16);
        }
        while (v36);
      }
LABEL_19:

      goto LABEL_23;
    }
    if (((1 << v11) & 0x60) != 0)
    {
      objc_msgSend__cleanupMMCSRegisterItems(self, v12, v13);
      goto LABEL_23;
    }
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v45 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v31 = v45;
    *(_DWORD *)buf = 134217984;
    v63 = objc_msgSend_mmcsOperationType(self, v51, v52);
    _os_log_error_impl(&dword_1BE990000, v31, OS_LOG_TYPE_ERROR, "Invalid mmcs operation type %ld", buf, 0xCu);
    goto LABEL_19;
  }
LABEL_23:
  objc_msgSend_itemGroup(self, v14, v15);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_items(v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__stopTrackingMMCSItems_(self, v50, (uint64_t)v49);

}

- (void)didCompleteRequestWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  CKDMMCSItemGroupContext *v26;
  void *v27;
  CKDMMCSItemGroupContext *v28;
  const char *v29;
  uint64_t v30;
  void (**v31)(_QWORD, _QWORD);
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  const char *v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  CKDMMCSItemGroupContext *v51;
  _QWORD v52[5];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  CKDMMCSItemGroupContext *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_hash(self, v5, v6);
  kdebug_trace();
  objc_msgSend_itemGroup(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_complete(v9, v10, v11);

  if (v12)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v15 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = self;
      _os_log_debug_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEBUG, "The group is already complete: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend_itemGroup(self, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setComplete_(v16, v17, 1);

    if (v4)
    {
      objc_msgSend_itemGroup(self, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v20, v21, (uint64_t)v4);

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v22 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v23 = v22;
        objc_msgSend_itemGroup(self, v24, v25);
        v26 = (CKDMMCSItemGroupContext *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v60 = v26;
        v61 = 2112;
        v62 = v4;
        _os_log_debug_impl(&dword_1BE990000, v23, OS_LOG_TYPE_DEBUG, "Completed MMCS item group %@ with error: %@", buf, 0x16u);

      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v27 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v48 = v27;
        objc_msgSend_itemGroup(self, v49, v50);
        v51 = (CKDMMCSItemGroupContext *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v60 = v51;
        _os_log_debug_impl(&dword_1BE990000, v48, OS_LOG_TYPE_DEBUG, "Completed MMCS item group %@", buf, 0xCu);

      }
    }
    v28 = self;
    objc_sync_enter(v28);
    objc_msgSend_progressBlock(v28, v29, v30);
    v31 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProgressBlock_(v28, v32, 0);
    objc_sync_exit(v28);

    if (v4)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend_itemGroup(v28, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_items(v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v54, v58, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v55 != v43)
              objc_enumerationMutation(v38);
            v45 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            if ((objc_msgSend_finished(v45, v40, v41) & 1) == 0)
            {
              objc_msgSend_setError_(v45, v40, (uint64_t)v4);
              objc_msgSend_setFinished_(v45, v46, 1);
              if (v31)
                ((void (**)(_QWORD, void *))v31)[2](v31, v45);
            }
          }
          v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v40, (uint64_t)&v54, v58, 16);
        }
        while (v42);
      }

    }
    objc_msgSend__cleanupMMCSItems(v28, v33, v34);
    CKGetGlobalQueue();
    v47 = objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = sub_1BEB8AA20;
    v52[3] = &unk_1E782EE20;
    v52[4] = v28;
    v53 = v4;
    dispatch_async(v47, v52);

  }
}

- (void)updateProgressForItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 results:(id)a6
{
  id v10;
  const char *v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  _QWORD *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _BOOL4 v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void (**v40)(_QWORD, _QWORD);
  int v41;
  unint64_t v42;
  __int16 v43;
  _BYTE v44[14];
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  objc_msgSend_findTrackedMMCSItemByItemID_(self, v11, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend_objectForKeyedSubscript_(v10, v12, *MEMORY[0x1E0D46910]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v15, *MEMORY[0x1E0D46710]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v17, *MEMORY[0x1E0D46770]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v21 = objc_msgSend_unsignedIntValue(v16, v18, v19);
      objc_msgSend_setChunkCount_(v13, v22, v21);
    }
    v23 = (_QWORD *)MEMORY[0x1E0C95300];
    if (v20)
    {
      if (objc_msgSend_unsignedLongLongValue(v20, v18, v19))
      {
        v26 = objc_msgSend_unsignedLongLongValue(v20, v24, v25);
        objc_msgSend_setFileSize_(v13, v27, v26);
      }
      if (v16)
      {
        v28 = objc_msgSend_unsignedIntValue(v16, v24, v25) == 0;
        if (v28 != (objc_msgSend_unsignedLongLongValue(v20, v29, v30) == 0))
        {
          if (*v23 != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v31 = *MEMORY[0x1E0C952B0];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            if (!v14)
            {
LABEL_26:
              v35 = *MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
              {
                v41 = 134218496;
                v42 = a3;
                v43 = 1024;
                *(_DWORD *)v44 = a4;
                *(_WORD *)&v44[4] = 2048;
                *(double *)&v44[6] = a5;
                _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Progress of MMCS item %llu: s:%d p:%0.4f", (uint8_t *)&v41, 0x1Cu);
              }
              if (a5 >= 0.0)
              {
                objc_msgSend_setProgress_(v13, v36, v37, a5);
                objc_msgSend_progressBlock(self, v38, v39);
                v40 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *))v40)[2](v40, v13);

              }
LABEL_30:

              goto LABEL_31;
            }
            goto LABEL_22;
          }
          v41 = 138543618;
          v42 = (unint64_t)v16;
          v43 = 2114;
          *(_QWORD *)v44 = v20;
          _os_log_error_impl(&dword_1BE990000, v31, OS_LOG_TYPE_ERROR, "Chunk count %{public}@ and file size %{public}@ inconsistent", (uint8_t *)&v41, 0x16u);
        }
      }
    }
    v33 = (void *)*MEMORY[0x1E0C952F8];
    if (!v14)
    {
      if (*v23 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v33);
      goto LABEL_26;
    }
    if (*v23 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v33);
LABEL_22:
    v34 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v41 = 134218754;
      v42 = a3;
      v43 = 1024;
      *(_DWORD *)v44 = a4;
      *(_WORD *)&v44[4] = 2048;
      *(double *)&v44[6] = a5;
      v45 = 2112;
      v46 = v14;
      _os_log_error_impl(&dword_1BE990000, v34, OS_LOG_TYPE_ERROR, "Progress of MMCS item %llu: s:%d p:%0.4f error:%@", (uint8_t *)&v41, 0x26u);
    }
    goto LABEL_30;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v32 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v41 = 134217984;
    v42 = a3;
    _os_log_error_impl(&dword_1BE990000, v32, OS_LOG_TYPE_ERROR, "Can't find MMCS item for itemID %llu", (uint8_t *)&v41, 0xCu);
  }
LABEL_31:

}

- (void)updateProgressForPackageSectionState:(int)a3 progress:(double)a4 results:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD);
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  double v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend_MMCSPackageSectionItem(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    __assert_rtn("-[CKDMMCSItemGroupContext updateProgressForPackageSectionState:progress:results:]", "CKDMMCSItemGroupContext.m", 621, "item && \"nil self.MMCSPackageSectionItem\");
  v13 = (void *)v11;
  objc_msgSend_objectForKeyedSubscript_(v8, v12, *MEMORY[0x1E0D46910]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)*MEMORY[0x1E0C952F8];
  if (v14)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v15);
    v16 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v17 = v16;
      objc_msgSend_putPackageSectionIdentifier(v13, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138544130;
      v32 = v20;
      v33 = 1024;
      v34 = a3;
      v35 = 2048;
      v36 = a4;
      v37 = 2112;
      v38 = v14;
      _os_log_error_impl(&dword_1BE990000, v17, OS_LOG_TYPE_ERROR, "Progress of MMCS package section %{public}@: s:%d p:%0.2f error:%@", (uint8_t *)&v31, 0x26u);

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v15);
    v21 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v27 = v21;
      objc_msgSend_putPackageSectionIdentifier(v13, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v30;
      v33 = 1024;
      v34 = a3;
      v35 = 2048;
      v36 = a4;
      _os_log_debug_impl(&dword_1BE990000, v27, OS_LOG_TYPE_DEBUG, "Progress of MMCS package section %{public}@: s:%d p:%0.2f", (uint8_t *)&v31, 0x1Cu);

    }
    if (a4 >= 0.0)
    {
      objc_msgSend_setProgress_(v13, v22, v23, a4);
      objc_msgSend_progressBlock(self, v24, v25);
      v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v26)[2](v26, v13);

    }
  }

}

- (void)updateProgressForItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 error:(id)a6
{
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD);
  int v25;
  unint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  double v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  objc_msgSend_findTrackedMMCSItemByItemID_(self, v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)*MEMORY[0x1E0C952F8];
    if (v10)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v13);
      v14 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v25 = 134218754;
        v26 = a3;
        v27 = 1024;
        v28 = a4;
        v29 = 2048;
        v30 = a5;
        v31 = 2112;
        v32 = v10;
        v15 = "Progress of MMCS item %llu: s:%d p:%0.4f error:%@";
        v16 = v14;
        v17 = 38;
LABEL_11:
        _os_log_error_impl(&dword_1BE990000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v25, v17);
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v13);
      v19 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v25 = 134218496;
        v26 = a3;
        v27 = 1024;
        v28 = a4;
        v29 = 2048;
        v30 = a5;
        _os_log_debug_impl(&dword_1BE990000, v19, OS_LOG_TYPE_DEBUG, "Progress of MMCS item %llu: s:%d p:%0.4f", (uint8_t *)&v25, 0x1Cu);
      }
      if (a5 >= 0.0)
      {
        objc_msgSend_setProgress_(v12, v20, v21, a5);
        objc_msgSend_progressBlock(self, v22, v23);
        v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v24)[2](v24, v12);

      }
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v18 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v25 = 134217984;
      v26 = a3;
      v15 = "Can't find MMCS item for itemID %llu";
      v16 = v18;
      v17 = 12;
      goto LABEL_11;
    }
  }

}

- (void)handleCommand:(id)a3 forItem:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend_commandBlock(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_commandBlock(self, v10, v11);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v12)[2](v12, v6, v13);

  }
}

- (void)didGetItemID:(unint64_t)a3 signature:(id)a4 path:(id)a5 error:(id)a6 results:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  id v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  char v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  NSObject *v43;
  char v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  int isContiguous;
  void *v53;
  void *v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  const char *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t shouldCloneFileInAssetCache;
  const char *v93;
  void (**v94)(_QWORD, _QWORD);
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  char v99;
  const char *v100;
  uint64_t v101;
  id v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  const char *v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  id v120;
  void *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  id v129;
  const char *v130;
  char v131;
  id v132;
  id v133;
  const char *v134;
  char v135;
  void *v136;
  const char *v137;
  int v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  void *v165;
  const char *v166;
  const char *v167;
  id v168;
  void *v169;
  const char *v170;
  const char *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  void *v189;
  void *v190;
  const char *v191;
  void *v192;
  uint64_t v193;
  const __CFString *v194;
  void *v195;
  const char *v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  const char *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  const char *v205;
  const char *v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  NSObject *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  unint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  const char *v228;
  void *v229;
  const char *v230;
  void *v231;
  const char *v232;
  const char *v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  const char *v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  const char *v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  void *v245;
  void *v246;
  void *v247;
  char v248;
  id v249;
  id v250;
  id v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  uint64_t v256;
  void *v257;
  void *v258;
  id v259;
  id v260;
  id v261;
  void *v262;
  id v263;
  void *v264;
  void *v265;
  id v266;
  id v267;
  id v268;
  id v269;
  id v270;
  id v271;
  id v272;
  void *v273;
  uint8_t buf[4];
  unint64_t v275;
  __int16 v276;
  void *v277;
  uint64_t v278;

  v278 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x1C3B83E24]();
  objc_msgSend_operation(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_findTrackedMMCSItemByItemID_(self, v20, a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v262 = v16;
    v263 = v12;
    v23 = v13;
    objc_msgSend_objectForKeyedSubscript_(v15, v21, *MEMORY[0x1E0D46770]);
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v25, *MEMORY[0x1E0D467C8]);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v27, *MEMORY[0x1E0D46928]);
    v28 = objc_claimAutoreleasedReturnValue();
    v260 = v15;
    objc_msgSend_objectForKeyedSubscript_(v15, v29, *MEMORY[0x1E0D46710]);
    v30 = objc_claimAutoreleasedReturnValue();
    v265 = v19;
    objc_msgSend_operationInfo(v19, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_fetchingAssetsForRereference(v33, v34, v35);

    v264 = (void *)v24;
    v261 = v14;
    if (v14)
    {
      v39 = objc_msgSend_mmcsOperationType(self, v37, v38);
      objc_msgSend__errorWithMMCSError_description_operationType_(CKDMMCS, v40, (uint64_t)v14, CFSTR("Fetching asset failed"), v39);
      v41 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v54 = (void *)v41;
      v45 = (void *)v26;
LABEL_19:
      v13 = v23;
LABEL_20:
      v48 = (void *)v28;
      objc_msgSend_setError_(v22, v42, (uint64_t)v54);

      v53 = (void *)v30;
LABEL_21:
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v15 = v260;
      v14 = v261;
      v55 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v95 = v55;
        objc_msgSend_error(v22, v96, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v275 = (unint64_t)v22;
        v276 = 2112;
        v277 = v98;
        _os_log_error_impl(&dword_1BE990000, v95, OS_LOG_TYPE_ERROR, "Error completing MMCS item %@ : %@", buf, 0x16u);

      }
      objc_msgSend_setDownloadLooksOkay_(v22, v56, 0);
      objc_msgSend_error(v22, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v59)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v60, *MEMORY[0x1E0C94B20], 1000, 0, CFSTR("Unknown error completing item %@"), v22);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setError_(v22, v63, (uint64_t)v62);

      }
      objc_msgSend_fileURL(v22, v60, v61);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fileURL(v22, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeItemAtURL_error_(v67, v71, (uint64_t)v70, 0);

        objc_msgSend_setFileURL_(v22, v72, 0);
      }
      objc_msgSend_setFileHandle_(v22, v65, 0);
      objc_msgSend_setDeviceID_(v22, v73, 0);
      objc_msgSend_setFileID_(v22, v74, 0);
      objc_msgSend_setGenerationID_(v22, v75, 0);
      objc_msgSend_setModTimeInSeconds_(v22, v76, 0);
      objc_msgSend_setFileSize_(v22, v77, 0);
LABEL_30:
      objc_msgSend_setProgress_(v22, v78, v79, 1.0);
      objc_msgSend_setFinished_(v22, v80, 1);
      objc_msgSend_setWriter_(v22, v81, 0);
      if ((objc_msgSend_shouldFetchAssetContentInMemory(self, v82, v83) & 1) == 0)
      {
        objc_msgSend_constructedAssetDownloadURL(v22, v84, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v86)
        {
          objc_msgSend_assetCache(self->_MMCS, v84, v85);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v273 = v22;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v88, (uint64_t)&v273, 1);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v90, v91);
          objc_msgSend_updateAssetHandlesForGetMMCSItems_cloneItems_error_(v87, v93, (uint64_t)v89, shouldCloneFileInAssetCache, 0);

        }
      }
      objc_msgSend_progressBlock(self, v84, v85);
      v94 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v94)[2](v94, v22);

      v16 = v262;
      v12 = v263;
      v19 = v265;
      goto LABEL_34;
    }
    if (v24)
      v44 = 1;
    else
      v44 = v36;
    if ((v44 & 1) == 0)
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v37, *MEMORY[0x1E0C94B20], 1000, 0, CFSTR("fileSize not set."));
      v41 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v45 = (void *)v26;
    if (!v26)
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v37, *MEMORY[0x1E0C94B20], 1000, 0, CFSTR("paddedFileSize not set."));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    v13 = v23;
    if (!v265)
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v37, *MEMORY[0x1E0C94B20], 1000, 0, CFSTR("CKOperation was gone on MMCS callback."));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    v48 = (void *)v28;
    if ((objc_msgSend_shouldFetchAssetContentInMemory(self, v37, v38) & 1) != 0)
    {
      objc_msgSend_writer(v22, v46, v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      isContiguous = objc_msgSend_isContiguous(v49, v50, v51);

      v53 = (void *)v30;
      if (isContiguous)
        objc_msgSend_setDownloadLooksOkay_(v22, v46, 1);
      goto LABEL_72;
    }
    if (v13)
      v99 = 0;
    else
      v99 = v36;
    v53 = (void *)v30;
    if ((v99 & 1) != 0)
    {
LABEL_72:
      v199 = objc_msgSend_unsignedLongLongValue(v264, v46, v47);
      objc_msgSend_setFileSize_(v22, v200, v199);
      v203 = objc_msgSend_unsignedLongLongValue(v45, v201, v202);
      objc_msgSend_setPaddedFileSize_(v22, v204, v203);
      objc_msgSend_setVerificationKey_(v22, v205, (uint64_t)v48);
      if (v53 && objc_msgSend_unsignedIntValue(v53, v206, v207))
      {
        v210 = objc_msgSend_unsignedIntValue(v53, v208, v209);
        objc_msgSend_setChunkCount_(v22, v211, v210);
      }
      v15 = v260;
      v14 = 0;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v212 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v275 = (unint64_t)v22;
        _os_log_debug_impl(&dword_1BE990000, v212, OS_LOG_TYPE_DEBUG, "Finished getting MMCS item %@", buf, 0xCu);
      }
      goto LABEL_30;
    }
    if (objc_msgSend_shouldFetchAssetContentUsingAssetDownloadStagingManager(self, v46, v47))
    {
      v102 = objc_alloc(MEMORY[0x1E0C94BC8]);
      v103 = (void *)MEMORY[0x1E0CB37E8];
      v106 = objc_msgSend_itemID(v22, v104, v105);
      objc_msgSend_numberWithUnsignedLongLong_(v103, v107, v106);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_trackingUUID(v22, v109, v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_signature(v22, v112, v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v254 = (void *)objc_msgSend_initWithItemID_trackingUUID_signature_(v102, v115, (uint64_t)v108, v111, v114);

      v272 = 0;
      objc_msgSend_openWithOperation_error_(v22, v116, (uint64_t)v265, &v272);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = v272;
      v252 = v117;
      if (v117
        && (objc_msgSend_fileHandle(v117, v118, v119),
            v121 = (void *)objc_claimAutoreleasedReturnValue(),
            v121,
            v121)
        && !v120)
      {
        objc_msgSend_container(v265, v118, v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fileHandle(v117, v124, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v271 = 0;
        objc_msgSend_getFileMetadataWithContainer_fileHandle_error_(v22, v127, (uint64_t)v123, v126, &v271);
        v128 = objc_claimAutoreleasedReturnValue();
        v129 = v271;

        v258 = (void *)v128;
        if (v128 && !v129)
        {
          v269 = 0;
          v270 = 0;
          v268 = 0;
          v131 = objc_msgSend_finishWithAssetDownloadStagingInfo_fileURL_fileHandle_error_(v265, v130, (uint64_t)v254, &v270, &v269, &v268);
          v132 = v270;
          v250 = v269;
          v133 = v268;
          if (v133)
            v135 = 0;
          else
            v135 = v131;
          if (!v132)
            v135 = 0;
          v53 = (void *)v30;
          v248 = v135;
          v249 = v133;
          if ((v135 & 1) != 0)
          {
            objc_msgSend_setFileURL_(v22, v134, (uint64_t)v132);
            v136 = v250;
            objc_msgSend_setFileHandle_(v22, v137, (uint64_t)v250);
            v138 = 0;
          }
          else
          {
            objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v134, *MEMORY[0x1E0C94B20], 1000, v133, CFSTR("Failed to finish downloaded file."));
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setError_(v22, v226, (uint64_t)v225);

            v138 = 4;
            v136 = v250;
          }

          v251 = 0;
          v165 = 0;
          v187 = v249;
          if ((v248 & 1) == 0)
          {
LABEL_71:

            if (v138)
              goto LABEL_21;
            goto LABEL_72;
          }
LABEL_58:
          objc_msgSend_fileURL(v22, v172, v173);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_asset(v22, v175, v176);
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setFileURL_(v177, v178, (uint64_t)v174);

          objc_msgSend_fileURL(v22, v179, v180);
          v181 = (void *)objc_claimAutoreleasedReturnValue();

          if (v181)
          {
            if (!v258)
            {
              v187 = v251;
              objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v182, *MEMORY[0x1E0C94B20], 1000, v251, CFSTR("Getting file metadata for downloaded asset failed"));
              v197 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setError_(v22, v198, (uint64_t)v197);

              v258 = 0;
              goto LABEL_70;
            }
            objc_msgSend_constructedAssetDownloadURL(v22, v182, v183);
            v184 = (void *)objc_claimAutoreleasedReturnValue();

            if (v184)
            {
LABEL_61:
              objc_msgSend_setDownloadLooksOkay_(v22, v185, 1);
              v138 = 0;
              v187 = v251;
              goto LABEL_71;
            }
            v256 = objc_msgSend_unsignedLongLongValue(v264, v185, v186);
            objc_msgSend_fileSize(v258, v213, v214);
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            v218 = objc_msgSend_unsignedLongLongValue(v215, v216, v217);

            if (v256 != v218)
            {
              v257 = (void *)MEMORY[0x1E0C94FF8];
              v227 = *MEMORY[0x1E0C94B20];
              objc_msgSend_fileSize(v258, v219, v220);
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              v187 = v251;
              objc_msgSend_errorWithDomain_code_error_format_(v257, v228, v227, 1000, v251, CFSTR("File size mismatch for item %@ : %@ != %@"), v22, v264, v195);
              v229 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setError_(v22, v230, (uint64_t)v229);

              goto LABEL_67;
            }
            v221 = objc_msgSend_unsignedLongLongValue(v264, v219, v220);
            if (v221 <= objc_msgSend_unsignedLongLongValue(v45, v222, v223))
            {
              objc_msgSend_deviceID(v258, v182, v224);
              v231 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setDeviceID_(v22, v232, (uint64_t)v231);

              objc_msgSend_fileID(v258, v233, v234);
              v235 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setFileID_(v22, v236, (uint64_t)v235);

              objc_msgSend_generationID(v258, v237, v238);
              v239 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setGenerationID_(v22, v240, (uint64_t)v239);

              objc_msgSend_modTimeInSeconds(v258, v241, v242);
              v243 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setModTimeInSeconds_(v22, v244, (uint64_t)v243);

              goto LABEL_61;
            }
            v192 = (void *)MEMORY[0x1E0C94FF8];
            v193 = *MEMORY[0x1E0C94B20];
            v246 = v264;
            v247 = v45;
            v194 = CFSTR("File size mismatch for item %@ : %@ > %@");
            v245 = v22;
          }
          else
          {
            v192 = (void *)MEMORY[0x1E0C94FF8];
            v193 = *MEMORY[0x1E0C94B20];
            v194 = CFSTR("Failed to set destination fileURL");
          }
          v187 = v251;
          objc_msgSend_errorWithDomain_code_error_format_(v192, v182, v193, 1000, v251, v194, v245, v246, v247);
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setError_(v22, v196, (uint64_t)v195);
LABEL_67:

          goto LABEL_70;
        }
        v187 = v129;
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v130, *MEMORY[0x1E0C94B20], 1000, v129, CFSTR("Failed to get metadata for downloaded file."));
        v189 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v187 = v120;
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v118, *MEMORY[0x1E0C94B20], 1000, v120, CFSTR("Failed to open downloaded file."));
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v258 = 0;
      }
      v53 = (void *)v30;
      objc_msgSend_setError_(v22, v188, (uint64_t)v189);

      v165 = 0;
    }
    else
    {
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v100, v101);
      v139 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_trackingUUID(v22, v140, v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v142)
        __assert_rtn("-[CKDMMCSItemGroupContext didGetItemID:signature:path:error:results:]", "CKDMMCSItemGroupContext.m", 721, "item.trackingUUID && \"item.trackingUUID\");
      v255 = (void *)v139;

      objc_msgSend_signature(v22, v143, v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v145)
        __assert_rtn("-[CKDMMCSItemGroupContext didGetItemID:signature:path:error:results:]", "CKDMMCSItemGroupContext.m", 722, "item.signature && \"item.signature\");

      v259 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend_trackingUUID(v22, v146, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_signature(v22, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      CKStringWithData();
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = objc_msgSend_initWithFormat_(v259, v153, (uint64_t)CFSTR("%@.%@"), v148, v152);

      objc_msgSend_MMCS(self, v155, v156);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_assetCache(v157, v158, v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileDownloadPath(v160, v161, v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v253 = (void *)v154;
      objc_msgSend_stringByAppendingPathComponent_(v163, v164, v154);
      v165 = (void *)objc_claimAutoreleasedReturnValue();

      v267 = 0;
      LODWORD(v163) = objc_msgSend_moveItemAtPath_toPath_error_(v255, v166, (uint64_t)v13, v165, &v267);
      v168 = v267;
      if ((_DWORD)v163)
      {
        objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], v167, (uint64_t)v165, 0);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setFileURL_(v22, v170, (uint64_t)v169);

        v266 = 0;
        objc_msgSend_getFileMetadataAtPath_error_(MEMORY[0x1E0C94BB8], v171, (uint64_t)v165, &v266);
        v258 = (void *)objc_claimAutoreleasedReturnValue();
        v251 = v266;

        goto LABEL_58;
      }
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v167, *MEMORY[0x1E0C94B20], 1000, v168, CFSTR("Moving downloaded asset failed"));
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v22, v191, (uint64_t)v190);

      v258 = 0;
      v187 = 0;
    }
LABEL_70:
    v138 = 4;
    goto LABEL_71;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v43 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v275 = a3;
    _os_log_error_impl(&dword_1BE990000, v43, OS_LOG_TYPE_ERROR, "Can't find MMCS item for itemID %llu", buf, 0xCu);
  }
LABEL_34:

  objc_autoreleasePoolPop(v16);
}

- (void)didPutItemID:(unint64_t)a3 signature:(id)a4 results:(id)a5
{
  id v7;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  const char *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void (**v59)(_QWORD, _QWORD);
  void *v60;
  uint8_t buf[4];
  unint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend_findTrackedMMCSItemByItemID_(self, v8, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x1E0D46910]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v7, v12, *MEMORY[0x1E0D467D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v7, v14, *MEMORY[0x1E0D467D8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v7, v16, *MEMORY[0x1E0D46710]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v7, v18, *MEMORY[0x1E0D46770]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && objc_msgSend_unsignedIntValue(v17, v19, v20))
    {
      v22 = objc_msgSend_unsignedIntValue(v17, v19, v20);
      objc_msgSend_setChunkCount_(v10, v23, v22);
    }
    if (v21 && objc_msgSend_unsignedLongLongValue(v21, v19, v20))
    {
      v25 = objc_msgSend_unsignedLongLongValue(v21, v19, v24);
      objc_msgSend_setFileSize_(v10, v26, v25);
    }
    if (v11)
    {
      v60 = v17;
      v27 = v13;
      v28 = v15;
      objc_msgSend_setFinished_(v10, v19, 1);
      objc_msgSend_fileURL(v10, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend_mmcsOperationType(self, v35, v36);
      objc_msgSend__errorWithMMCSError_path_description_operationType_(CKDMMCS, v38, (uint64_t)v11, v34, CFSTR("Saving asset failed"), v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v10, v40, (uint64_t)v39);

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v15 = v28;
      v41 = *MEMORY[0x1E0C952B0];
      v13 = v27;
      v17 = v60;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v62 = (unint64_t)v10;
        _os_log_debug_impl(&dword_1BE990000, v41, OS_LOG_TYPE_DEBUG, "Error putting MMCS item %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend_setFinished_(v10, v19, 1);
      if (v13)
      {
        objc_msgSend_setProgress_(v10, v45, v46, 1.0);
        objc_msgSend_setUploadReceipt_(v10, v47, (uint64_t)v13);
        objc_msgSend_doubleValue(v15, v48, v49);
        objc_msgSend_setUploadReceiptExpiration_(v10, v50, v51);
        objc_msgSend_setError_(v10, v52, 0);
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v53 = (void *)*MEMORY[0x1E0C952B0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          goto LABEL_24;
        v54 = v53;
        objc_msgSend_asset(v10, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v62 = (unint64_t)v10;
        v63 = 2112;
        v64 = v57;
        _os_log_debug_impl(&dword_1BE990000, v54, OS_LOG_TYPE_DEBUG, "Finished putting MMCS item %@ and asset %@", buf, 0x16u);

      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v45, *MEMORY[0x1E0C947D8], 1, CFSTR("Expected either an error or a putReceipt on the completion of the upload"));
        v54 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_setError_(v10, v58, (uint64_t)v54);
      }

    }
LABEL_24:
    objc_msgSend_progressBlock(self, v42, v43);
    v59 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v59)[2](v59, v10);

    goto LABEL_25;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v44 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v62 = a3;
    _os_log_error_impl(&dword_1BE990000, v44, OS_LOG_TYPE_ERROR, "Can't find MMCS item for itemID %llu", buf, 0xCu);
  }
LABEL_25:

}

- (void)didPutSectionWithSignature:(id)a3 results:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  void (**v41)(_QWORD, _QWORD);
  uint8_t v42[24];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_MMCSPackageSectionItem(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    __assert_rtn("-[CKDMMCSItemGroupContext didPutSectionWithSignature:results:]", "CKDMMCSItemGroupContext.m", 844, "item && \"nil self.MMCSPackageSectionItem\");
  v12 = (void *)v10;
  objc_msgSend_objectForKeyedSubscript_(v7, v11, *MEMORY[0x1E0D46910]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, *MEMORY[0x1E0D467D0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v16, *MEMORY[0x1E0D467D8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFinished_(v12, v18, 1);
  if (v13)
  {
    objc_msgSend_fileURL(v12, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_mmcsOperationType(self, v25, v26);
    objc_msgSend__errorWithMMCSError_path_description_operationType_(CKDMMCS, v28, (uint64_t)v13, v24, CFSTR("Saving asset failed"), v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(v12, v30, (uint64_t)v29);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v31 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v42 = 138412290;
      *(_QWORD *)&v42[4] = v12;
      v34 = "Error putting MMCS item %@";
LABEL_12:
      _os_log_debug_impl(&dword_1BE990000, v31, OS_LOG_TYPE_DEBUG, v34, v42, 0xCu);
    }
  }
  else
  {
    objc_msgSend_setProgress_(v12, v19, v20, 1.0);
    objc_msgSend_setUploadReceipt_(v12, v35, (uint64_t)v15);
    objc_msgSend_doubleValue(v17, v36, v37);
    objc_msgSend_setUploadReceiptExpiration_(v12, v38, v39);
    objc_msgSend_setError_(v12, v40, 0);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v31 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v42 = 138412290;
      *(_QWORD *)&v42[4] = v12;
      v34 = "Finished putting MMCS item %@";
      goto LABEL_12;
    }
  }
  objc_msgSend_progressBlock(self, v32, v33, *(_OWORD *)v42);
  v41 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v41)[2](v41, v12);

}

- (void)didGetMetricsForRequest:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_itemGroup(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMetrics_(v8, v7, (uint64_t)v4);

}

- (id)conformingOperation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;

  if (objc_msgSend_BOOLValue(self->_hasConformingOperation, a2, v2))
  {
    objc_msgSend_operation(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (MMCSItemReaderWriter)getMMCSItemReaderForItemID:(unint64_t)a3 MMCS:(id)a4 itemGroupContext:(id)a5 downloadChunkContext:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  char MMCSItemReaderForItemID;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  CKDMMCSItemCommandWriter *v34;
  const char *v35;
  id v36;
  const char *v37;
  MMCSItemReaderWriter *v38;
  CKDMMCSItem *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  id v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  void *isDirectory;
  const char *v68;
  NSObject *v69;
  const char *v70;
  void *v71;
  const char *v72;
  id v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  void *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  __CFString *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  CKDMMCSEncryptedItemReader *v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  id v122;
  void *v123;
  __CFString *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  __CFString *v132;
  CKDMMCSClientProxyItemReader *v134;
  const char *v135;
  void *v136;
  NSObject *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  const char *v142;
  const char *v143;
  void *v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  CKDMMCSItemReaderWriter *v153;
  const char *v154;
  void *v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  const char *v162;
  id v163;
  uint64_t v164;
  const char *v165;
  void *v166;
  const char *v167;
  void *v168;
  const char *v169;
  const __CFString *v170;
  id v171;
  id v172;
  id *v173;
  __int128 buf;
  const __CFString *v175;
  const __CFString *v176;
  uint64_t v177;
  uint64_t v178;
  BOOL (*v179)(uint64_t, void *, _QWORD *, _QWORD *);
  uint64_t (*v180)(uint64_t, void *, _QWORD *);
  uint64_t (*v181)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t (*v182)(uint64_t, void *, _QWORD *);
  uint64_t v183;
  uint64_t v184;
  void (*v185)(void *);
  uint64_t (*v186)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t (*v190)(uint64_t, void *, const void *);
  _QWORD v191[3];

  v191[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v17 = a6;
  if (!v13)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v166, v167, (uint64_t)a2, a1, CFSTR("CKDMMCSItemGroupContext.m"), 1021, CFSTR("Expected non-nil MMCS for %@"), a1);

  }
  objc_msgSend_assetCache(v13, v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v168, v169, (uint64_t)a2, a1, CFSTR("CKDMMCSItemGroupContext.m"), 1023, CFSTR("Expected non-nil asset cache for %@"), v13);

  }
  objc_msgSend_conformingOperation(v14, v18, v19);
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21
    || (v24 = (void *)v21,
        objc_msgSend_conformingOperation(v14, v22, v23),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        MMCSItemReaderForItemID = objc_msgSend_itemGroupContext_willGetMMCSItemReaderForItemID_(v25, v26, (uint64_t)v14, a3), v25, v24, (MMCSItemReaderForItemID & 1) != 0))
  {
    objc_msgSend_findTrackedMMCSItemByItemID_(v14, v22, a3);
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v31 = (void *)v28;
      if (objc_msgSend_shouldFetchAssetContentInMemory(v14, v29, v30))
      {
        v34 = [CKDMMCSItemCommandWriter alloc];
        *(_QWORD *)&buf = 3;
        v36 = (id)objc_msgSend_initWithMMCSItem_MMCSRequest_(v34, v35, (uint64_t)v31, v14);
        *((_QWORD *)&buf + 1) = v36;
        v175 = CFSTR("not an itemTypeHint");
        v176 = CFSTR("not an itemDescription");
        v177 = 0;
        v178 = 0;
        v179 = sub_1BEB8D628;
        v180 = sub_1BEB8D7F4;
        v181 = sub_1BEB8DB4C;
        v182 = sub_1BEB8DBF4;
        v183 = 0;
        v184 = 0;
        v185 = sub_1BEB8DC6C;
        v186 = sub_1BEB8DD44;
        v187 = 0;
        v38 = (MMCSItemReaderWriter *)MMCSItemReaderWriterCreate();
        if (v38)
        {
          objc_msgSend_setWriter_(v31, v37, (uint64_t)v36);
        }
        else if (a7)
        {
          objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E0C94FF8], v37, *MEMORY[0x1E0C94B20], 3001, 0, CFSTR("nil reader"));
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_44;
      }
      v172 = v17;
      v173 = a7;
LABEL_31:
      objc_msgSend_fileURL(v31, v32, v33);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v99, v100, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_CKSanitizedPath(v102, v103, v104);
      v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_itemTypeHint(v31, v106, v107);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = v14;
      if (v110)
        objc_msgSend_itemTypeHint(v31, v108, v109);
      else
        objc_msgSend_pathExtension(v102, v108, v109);
      v111 = objc_claimAutoreleasedReturnValue();

      if (v31
        && objc_msgSend_itemID(v31, v112, v113)
        && (objc_msgSend_trackingUUID(v31, v112, v113),
            v114 = (void *)objc_claimAutoreleasedReturnValue(),
            v114,
            v114))
      {
        v170 = (const __CFString *)v111;
        if (objc_msgSend_shouldReadRawEncryptedData(v31, v112, v113))
        {
          v117 = [CKDMMCSEncryptedItemReader alloc];
          v119 = objc_msgSend_initWithMMCSItem_MMCSRequest_(v117, v118, (uint64_t)v31, v14);
        }
        else if (objc_msgSend_shouldReadAssetContentUsingClientProxy(v31, v115, v116))
        {
          v134 = [CKDMMCSClientProxyItemReader alloc];
          v119 = objc_msgSend_initWithMMCSItem_MMCSRequest_(v134, v135, (uint64_t)v31, v14);
        }
        else
        {
          v153 = [CKDMMCSItemReaderWriter alloc];
          v119 = objc_msgSend_initWithMMCSItem_MMCSRequest_downloadChunkContext_(v153, v154, (uint64_t)v31, v14, v172);
        }
        v155 = (void *)v119;
        objc_msgSend_conformingOperation(v14, v120, v121);
        v156 = (void *)objc_claimAutoreleasedReturnValue();

        if (v156
          && (objc_msgSend_conformingOperation(v14, v157, v158),
              v159 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend_itemGroupContext_didGetItemReader_itemID_(v159, v160, (uint64_t)v14, v155, a3),
              v161 = objc_claimAutoreleasedReturnValue(),
              v155,
              v159,
              (v155 = (void *)v161) == 0))
        {
          if (v173)
          {
            objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E0C94FF8], v162, *MEMORY[0x1E0C94B20], 3001, 0, CFSTR("delegate said no"));
            v36 = 0;
            v38 = 0;
            *v173 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v36 = 0;
            v38 = 0;
          }
          v132 = (__CFString *)v170;
        }
        else
        {
          *(_QWORD *)&buf = 5;
          v163 = v155;
          v132 = (__CFString *)v170;
          *((_QWORD *)&buf + 1) = v163;
          v175 = v170;
          v176 = v105;
          v177 = 0;
          v178 = 0;
          v179 = sub_1BEB8D628;
          v180 = sub_1BEB8D7F4;
          v181 = sub_1BEB8DB4C;
          v182 = sub_1BEB8DBF4;
          v183 = 0;
          v184 = 0;
          v185 = sub_1BEB8DC6C;
          v186 = sub_1BEB8DD44;
          v187 = 0;
          v188 = 0;
          v189 = 0;
          v190 = sub_1BEB8DDEC;
          v164 = MMCSItemReaderWriterCreate();
          v38 = (MMCSItemReaderWriter *)v164;
          if (v173 && !v164)
          {
            objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E0C94FF8], v165, *MEMORY[0x1E0C94B20], 3001, v105, CFSTR("nil reader"));
            *v173 = (id)objc_claimAutoreleasedReturnValue();
          }

          v36 = 0;
        }
      }
      else
      {
        v122 = v13;
        v123 = v20;
        v124 = (__CFString *)v111;
        v125 = (void *)MEMORY[0x1E0C94FF8];
        v126 = *MEMORY[0x1E0C94B20];
        v127 = objc_msgSend_itemID(v31, v112, v113);
        objc_msgSend_trackingUUID(v31, v128, v129);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_path_format_(v125, v131, v126, 3001, v105, CFSTR("Invalid arguments, MMCSItem:%@, itemID:%llu, UUID:%@"), v31, v127, v130);
        v36 = (id)objc_claimAutoreleasedReturnValue();

        if (v173)
        {
          v36 = objc_retainAutorelease(v36);
          v38 = 0;
          *v173 = v36;
        }
        else
        {
          v38 = 0;
        }
        v132 = v124;
        v20 = v123;
        v13 = v122;
        v14 = v171;
      }

      v17 = v172;
      goto LABEL_44;
    }
    objc_msgSend_findAssetHandleForItemID_error_(v20, v29, a3, a7);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v172 = v17;
      v173 = a7;
      v39 = [CKDMMCSItem alloc];
      objc_msgSend_path(v36, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend_init_(v39, v43, v42 == 0);

      objc_msgSend_itemID(v36, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_unsignedLongLongValue(v46, v47, v48);
      objc_msgSend_setItemID_(v31, v50, v49);

      objc_msgSend_UUID(v36, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDString(v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTrackingUUID_(v31, v57, (uint64_t)v56);

      objc_msgSend_path(v36, v58, v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        v62 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend_path(v36, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        isDirectory = (void *)objc_msgSend_initFileURLWithPath_isDirectory_(v62, v66, (uint64_t)v65, 0);
        objc_msgSend_setFileURL_(v31, v68, (uint64_t)isDirectory);

      }
      else
      {
        objc_msgSend_setFileURL_(v31, v60, 0);
      }

      objc_msgSend_assetCache(v13, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_volumeIndex(v36, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceIDForVolumeIndex_(v77, v81, (uint64_t)v80);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDeviceID_(v31, v83, (uint64_t)v82);

      objc_msgSend_fileID(v36, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFileID_(v31, v87, (uint64_t)v86);

      objc_msgSend_generationID(v36, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setGenerationID_(v31, v91, (uint64_t)v90);

      objc_msgSend_fileURL(v31, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      if (v94 || (objc_msgSend_deviceID(v31, v95, v96), (v94 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

LABEL_30:
        goto LABEL_31;
      }
      objc_msgSend_volumeIndex(v36, v97, v98);
      v136 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v136)
        goto LABEL_30;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v137 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v36;
        _os_log_debug_impl(&dword_1BE990000, v137, OS_LOG_TYPE_DEBUG, "Cannot find deviceID for asset handle. Deleting %@", (uint8_t *)&buf, 0xCu);
      }
      v140 = (void *)MEMORY[0x1E0C99E40];
      objc_msgSend_itemID(v36, v138, v139);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_orderedSetWithObject_(v140, v142, (uint64_t)v141);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_unregisterItemsAndDeleteUnregisteredAssetHandlesWithIDs_deleteUnregisteredAssetHandlesWithIDs_(v20, v143, (uint64_t)v71, 0);
      v144 = (void *)MEMORY[0x1E0C94FF8];
      v145 = *MEMORY[0x1E0C94B20];
      v148 = objc_msgSend_itemID(v31, v146, v147);
      objc_msgSend_volumeIndex(v36, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v144, v152, v145, 3002, CFSTR("Unable to open file for MMCSItem:%@ itemID:%llu on unmounted volume with volumeIndex=%@"), v31, v148, v151);
      v73 = (id)objc_claimAutoreleasedReturnValue();

      if (v173)
      {
        v73 = objc_retainAutorelease(v73);
        *v173 = v73;
      }
      v17 = v172;
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v69 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = a3;
        _os_log_error_impl(&dword_1BE990000, v69, OS_LOG_TYPE_ERROR, "Unregistering item without an asset handle for itemID=%llu", (uint8_t *)&buf, 0xCu);
      }
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v70, a3);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v191[0] = v71;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v72, (uint64_t)v191, 1);
      v73 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unregisterItemIDs_(v13, v74, (uint64_t)v73);
      v31 = 0;
    }

    v38 = 0;
LABEL_44:

    goto LABEL_45;
  }
  if (a7)
  {
    objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], 3001, 0, CFSTR("delegate said no"));
    v38 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
LABEL_45:

  return v38;
}

- (id)getCKDMMCSItemReaderByPathForMMCSItem:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  __objc2_class *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  CKDMMCSItemReaderWriter *v21;
  const char *v22;
  void *v23;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;

  v6 = a3;
  objc_msgSend_MMCS(self, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, CFSTR("CKDMMCSItemGroupContext.m"), 1166, CFSTR("Expected non-nil MMCS for %@"), self);

  }
  objc_msgSend_assetCache(v11, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, CFSTR("CKDMMCSItemGroupContext.m"), 1168, CFSTR("Expected non-nil asset cache for %@"), v11);

  }
  if (objc_msgSend_shouldReadRawEncryptedData(v6, v12, v13))
  {
    v17 = CKDMMCSEncryptedItemReader;
  }
  else
  {
    if (!objc_msgSend_shouldReadAssetContentUsingClientProxy(v6, v15, v16))
    {
      v21 = [CKDMMCSItemReaderWriter alloc];
      v20 = objc_msgSend_initWithMMCSItem_MMCSRequest_downloadChunkContext_(v21, v22, (uint64_t)v6, self, 0);
      goto LABEL_11;
    }
    v17 = CKDMMCSClientProxyItemReader;
  }
  v18 = [v17 alloc];
  v20 = objc_msgSend_initWithMMCSItem_MMCSRequest_(v18, v19, (uint64_t)v6, self);
LABEL_11:
  v23 = (void *)v20;

  return v23;
}

- (BOOL)willOpenItemReaderWriter:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  char v14;

  v6 = a3;
  objc_msgSend_conformingOperation(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_conformingOperation(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_itemGroupContext_willOpenItemReaderWriter_error_(v12, v13, (uint64_t)self, v6, a4);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (void)didOpenItemReaderWriter:(id)a3 result:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v6 = a4;
  v16 = a3;
  v8 = a5;
  objc_msgSend_conformingOperation(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_conformingOperation(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_itemGroupContext_didOpenItemReaderWriter_result_error_(v14, v15, (uint64_t)self, v16, v6, v8);

  }
}

- (BOOL)willCloseItemReaderWriter:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)willGetFileMetadataItemReaderWriter:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)didGetFileMetadataItemReaderWriter:(id)a3 fileMetadata:(id)a4 error:(id)a5
{
  return a4;
}

- (BOOL)willReadFromItemReaderWriter:(id)a3 offset:(unint64_t)a4 bytes:(char *)a5 length:(unint64_t)a6 bytesRead:(unint64_t *)a7 error:(id *)a8
{
  return 1;
}

- (BOOL)didReadFromItemReaderWriter:(id)a3 offset:(unint64_t)a4 bytes:(char *)a5 length:(unint64_t)a6 bytesRead:(unint64_t *)a7 error:(id *)a8
{
  return 1;
}

- (CKDOperation)operation
{
  return (CKDOperation *)objc_loadWeakRetained((id *)&self->_operation);
}

- (void)setOperation:(id)a3
{
  objc_storeWeak((id *)&self->_operation, a3);
}

- (id)operationInfo
{
  return self->_operationInfo;
}

- (void)setOperationInfo:(id)a3
{
  objc_storeStrong(&self->_operationInfo, a3);
}

- (NSNumber)hasConformingOperation
{
  return self->_hasConformingOperation;
}

- (void)setHasConformingOperation:(id)a3
{
  objc_storeStrong((id *)&self->_hasConformingOperation, a3);
}

- (CKSignpost)signpost
{
  return self->_signpost;
}

- (CKDMMCS)MMCS
{
  return self->_MMCS;
}

- (void)setMMCS:(id)a3
{
  objc_storeStrong((id *)&self->_MMCS, a3);
}

- (CKDMMCSItemGroup)itemGroup
{
  return self->_itemGroup;
}

- (void)setItemGroup:(id)a3
{
  objc_storeStrong((id *)&self->_itemGroup, a3);
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)commandBlock
{
  return self->_commandBlock;
}

- (void)setCommandBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)startBlock
{
  return self->_startBlock;
}

- (void)setStartBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CKDMMCSItem)MMCSPackageSectionItem
{
  return self->_MMCSPackageSectionItem;
}

- (void)setMMCSPackageSectionItem:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSPackageSectionItem, a3);
}

- (NSMapTable)MMCSItemsByItemID
{
  return self->_MMCSItemsByItemID;
}

- (void)setMMCSItemsByItemID:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSItemsByItemID, a3);
}

- (int64_t)mmcsOperationType
{
  return self->_mmcsOperationType;
}

- (void)setMmcsOperationType:(int64_t)a3
{
  self->_mmcsOperationType = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSItemsByItemID, 0);
  objc_storeStrong((id *)&self->_MMCSPackageSectionItem, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_startBlock, 0);
  objc_storeStrong(&self->_commandBlock, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_itemGroup, 0);
  objc_storeStrong((id *)&self->_MMCS, 0);
  objc_storeStrong((id *)&self->_signpost, 0);
  objc_storeStrong((id *)&self->_hasConformingOperation, 0);
  objc_storeStrong(&self->_operationInfo, 0);
  objc_destroyWeak((id *)&self->_operation);
}

@end
