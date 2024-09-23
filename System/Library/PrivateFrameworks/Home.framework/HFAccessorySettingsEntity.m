@implementation HFAccessorySettingsEntity

+ (id)settingsAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  HFAccessorySettingsEntity *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[5];
  uint64_t v15;
  id *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  if (objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", a4))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v5);
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "objectForKey:", CFSTR("CodexRoot"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeSetObject:forKey:", v8, CFSTR("Children"));

    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("root"), CFSTR("KeyPath"));
    v9 = objc_alloc(MEMORY[0x1E0D519D0]);
    v10 = -[HFAccessorySettingsEntity initWithDictionary:]([HFAccessorySettingsEntity alloc], "initWithDictionary:", v7);
    v11 = (void *)objc_msgSend(v9, "initWithRepresentedObject:", v10);

    v15 = 0;
    v16 = (id *)&v15;
    v17 = 0x3042000000;
    v18 = __Block_byref_object_copy__26;
    v19 = __Block_byref_object_dispose__26;
    v20 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__HFAccessorySettingsEntity_settingsAtURL_error___block_invoke;
    aBlock[3] = &unk_1EA73F848;
    aBlock[4] = &v15;
    v12 = _Block_copy(aBlock);
    objc_storeWeak(v16 + 5, v12);
    (*((void (**)(void *, void *, void *))v12 + 2))(v12, v11, v7);
    _Block_object_dispose(&v15, 8);
    objc_destroyWeak(&v20);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __49__HFAccessorySettingsEntity_settingsAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  HFAccessorySettingsEntity *v11;
  void *v12;
  void (**WeakRetained)(id, void *, _QWORD);
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Children"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = -[HFAccessorySettingsEntity initWithDictionary:]([HFAccessorySettingsEntity alloc], "initWithDictionary:", v10);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D519D0]), "initWithRepresentedObject:", v11);
        objc_msgSend(v5, "addChild:", v12);
        WeakRetained = (void (**)(id, void *, _QWORD))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                            + 40));
        WeakRetained[2](WeakRetained, v12, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingsEntity keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("keyPath"));

  -[HFAccessorySettingsEntity sortKey](self, "sortKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("sortKey"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HFAccessorySettingsEntity)initWithDictionary:(id)a3
{
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HFAccessorySettingsEntity *v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSString *keyPath;
  void *v71;
  uint64_t v72;
  NSString *sortKey;
  void *v74;
  uint64_t v75;
  NSString *previewValueKeyPath;
  id *p_previewValueKeyPath;
  void *v78;
  void *v79;
  uint64_t v80;
  NSString *overrideLocalizedTitleKey;
  __CFString *v82;
  void *v83;
  uint64_t v84;
  NSFormatter *previewValueFormatter;
  void *v86;
  void *v87;
  uint64_t v88;
  NSFormatter *headerTitleFormatter;
  void *v90;
  void *v91;
  uint64_t v92;
  NSFormatter *footerTitleFormatter;
  void *v94;
  void *v95;
  uint64_t v96;
  NSString *localizedHeader;
  void *v98;
  void *v99;
  uint64_t v100;
  NSString *localizedFooter;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  void *v106;
  void *v107;
  int v108;
  id v109;
  void *v110;
  uint64_t v111;
  NSArray *BOOLeanKeyPathDependencies;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  HFAccessorySettingsEntity *v126;
  void *v127;
  uint64_t v128;
  NSString *adapterIdentifier;
  id v130;
  uint64_t v131;
  NSDictionary *userInfo;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  HFAccessorySettingsEntity *v147;
  void *v148;
  void *v149;
  __CFString *v150;
  id v151;
  id v152;
  void *v153;
  id v154;
  void *v155;
  id v156;
  _QWORD v157[4];
  id v158;
  _QWORD v159[4];
  id v160;
  _QWORD v161[4];
  id v162;
  _QWORD v163[4];
  id v164;
  _QWORD v165[4];
  id v166;
  _QWORD v167[4];
  id v168;
  id v169;
  _QWORD v170[4];
  id v171;
  id v172;
  objc_super v173;

  v151 = a3;
  if (!v151)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingsEntity.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  v173.receiver = self;
  v173.super_class = (Class)HFAccessorySettingsEntity;
  v147 = -[HFAccessorySettingsEntity init](&v173, sel_init);
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 1, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 3, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 32, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@%@%@"), v6, v7, v8, v9);
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 6, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 3, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 32, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@%@%@"), v11, v12, v13, v14);
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 15, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 11, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 34, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 24, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 9, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@%@%@%@%@i%@"), v16, v17, v18, v19, v20, v21);
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 30, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 19, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 11, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 34, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 24, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1anun2AnnmebenodobeorXouCh78Y5Docell"), "substringWithRange:", 9, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@%@%@%@%@i%@"), v23, v24, v25, v26, v27, v28);
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(CFSTR("stleAdlossatlemelAiobajuloudnt "), "substringWithRange:", 6, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("stleAdlossatlemelAiobajuloudnt "), "substringWithRange:", 8, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("stleAdlossatlemelAiobajuloudnt "), "substringWithRange:", 12, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("stleAdlossatlemelAiobajuloudnt "), "substringWithRange:", 8, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@%@%@%@"), v30, v31, v32, v33);
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(CFSTR("yAtdolbmos"), "substringWithRange:", 3, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("yAtdolbmos"), "substringWithRange:", 5, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("yAtdolbmos"), "substringWithRange:", 0, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("yAtdolbmos"), "substringWithRange:", 1, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("yAtdolbmos"), "substringWithRange:", 7, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("yAtdolbmos"), "substringWithRange:", 9, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("%@%@%@%@%@%@"), v35, v36, v37, v38, v39, v40);
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(CFSTR("stleAdlossatlemelAiobajuloudnt "), "substringWithRange:", 20, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("stleAdlossatlemelAiobajuloudnt "), "substringWithRange:", 8, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("stleAdlossatlemelAiobajuloudnt "), "substringWithRange:", 4, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("stleAdlossatlemelAiobajuloudnt "), "substringWithRange:", 22, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("stleAdlossatlemelAiobajuloudnt "), "substringWithRange:", 0, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("%@%@%@%@%@"), v42, v43, v44, v45, v46);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  v139 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 26, 2);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 21, 2);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 9, 2);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 12, 2);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 20, 2);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 6, 2);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 15, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 17, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 0, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 30, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 24, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 3, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 28, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("lugabHSiMAdkjuvriVo8sto3Enauleme"), "substringWithRange:", 10, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "stringWithFormat:", CFSTR("%@%@%@%@%@%@%@%@%@%@%@%@%@%@"), v138, v155, v153, v136, v137, v135, v47, v48, v49, v50, v51, v52, v53, v54);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = v147;
  v56 = MEMORY[0x1E0C809B0];
  v170[0] = MEMORY[0x1E0C809B0];
  v170[1] = 3221225472;
  v170[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke;
  v170[3] = &unk_1EA73F870;
  v57 = v149;
  v171 = v57;
  v58 = v146;
  v172 = v58;
  objc_msgSend(v151, "na_dictionaryByMappingValues:", v170);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v167[0] = v56;
  v167[1] = 3221225472;
  v167[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_2;
  v167[3] = &unk_1EA73F870;
  v60 = v145;
  v168 = v60;
  v61 = v144;
  v169 = v61;
  objc_msgSend(v59, "na_dictionaryByMappingValues:", v167);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v165[0] = v56;
  v165[1] = 3221225472;
  v165[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_3;
  v165[3] = &unk_1EA73F898;
  v156 = v143;
  v166 = v156;
  objc_msgSend(v62, "na_dictionaryByMappingValues:", v165);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v163[0] = v56;
  v163[1] = 3221225472;
  v163[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_4;
  v163[3] = &unk_1EA73F898;
  v154 = v142;
  v164 = v154;
  objc_msgSend(v63, "na_dictionaryByMappingValues:", v163);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v161[0] = v56;
  v161[1] = 3221225472;
  v161[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_5;
  v161[3] = &unk_1EA73F898;
  v152 = v141;
  v162 = v152;
  objc_msgSend(v64, "na_dictionaryByMappingValues:", v161);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v159[0] = v56;
  v159[1] = 3221225472;
  v159[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_6;
  v159[3] = &unk_1EA73F898;
  v66 = v140;
  v160 = v66;
  objc_msgSend(v65, "na_dictionaryByMappingValues:", v159);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v147)
  {
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("KeyPath"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "copy");
    keyPath = v147->_keyPath;
    v147->_keyPath = (NSString *)v69;

    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("SortKey"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "copy");
    sortKey = v147->_sortKey;
    v147->_sortKey = (NSString *)v72;

    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("DisplayValuePreviewFromKeyPath"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "copy");
    p_previewValueKeyPath = (id *)&v147->_previewValueKeyPath;
    previewValueKeyPath = v147->_previewValueKeyPath;
    v147->_previewValueKeyPath = (NSString *)v75;

    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("DisplayValuePreviewFromAccessory"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v147->_previewAccessory = objc_msgSend(v78, "BOOLValue");

    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("LocalizedOverrideTitleKey"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "copy");
    overrideLocalizedTitleKey = v147->_overrideLocalizedTitleKey;
    v147->_overrideLocalizedTitleKey = (NSString *)v80;

    if (v147->_previewAccessory && objc_msgSend(*p_previewValueKeyPath, "length"))
      NSLog(CFSTR("Cannot populate preview using multiple sources.  Entity Fail"));
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("DisplayValuePreviewFormatter"));
    v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl()
      && objc_msgSend(*p_previewValueKeyPath, "isEqualToString:", CFSTR("root.siri.allowHeySiri")))
    {

      objc_storeStrong((id *)&v147->_previewValueKeyPath, CFSTR("root.siri.allowHeySiri"));
      v82 = CFSTR("SiriTriggerPhraseSettingFormatter");
    }
    if ((-[__CFString containsString:](v82, "containsString:", CFSTR("AudioAnalysis")) & 1) != 0)
    {
      v83 = v82;
      v82 = 0;
LABEL_18:

      goto LABEL_19;
    }
    if (*p_previewValueKeyPath)
    {
      if (!v82)
        goto LABEL_19;
    }
    else if (!v82 || !v147->_previewAccessory)
    {
LABEL_19:
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("HeaderTitleFormatter"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v86, "containsString:", CFSTR("AudioAnalysis")) & 1) == 0)
      {
        if (!v86)
          goto LABEL_23;
        +[HFAccessorySettingFormatterFactory defaultFactory](HFAccessorySettingFormatterFactory, "defaultFactory");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "formatterForKey:", v86);
        v88 = objc_claimAutoreleasedReturnValue();
        headerTitleFormatter = v147->_headerTitleFormatter;
        v147->_headerTitleFormatter = (NSFormatter *)v88;

      }
LABEL_23:
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("FooterTitleFormatter"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v90, "containsString:", CFSTR("AudioAnalysis")) & 1) == 0)
      {
        if (!v90)
        {
LABEL_27:
          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("GroupHeaderLocalizedStringKey"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          if (v94)
          {
            objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("GroupHeaderLocalizedStringKey"));
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            _HFLocalizedStringWithDefaultValue(v95, v95, 1);
            v96 = objc_claimAutoreleasedReturnValue();
            localizedHeader = v147->_localizedHeader;
            v147->_localizedHeader = (NSString *)v96;

          }
          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("GroupFooterLocalizedStringKey"));
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          if (v98)
          {
            objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("GroupFooterLocalizedStringKey"));
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            _HFLocalizedStringWithDefaultValue(v99, v99, 1);
            v100 = objc_claimAutoreleasedReturnValue();
            localizedFooter = v147->_localizedFooter;
            v147->_localizedFooter = (NSString *)v100;

          }
          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("PreferredInterfaceModality"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = v102;
          v150 = v82;
          if (v102)
          {
            v104 = v102;
            if ((objc_msgSend(v104, "isEqualToString:", CFSTR("AccessorySettingsInterfaceModalitySlider")) & 1) != 0)
            {
              v105 = 2;
            }
            else if ((objc_msgSend(v104, "isEqualToString:", CFSTR("AccessorySettingsInterfaceModalityStepper")) & 1) != 0)
            {
              v105 = 3;
            }
            else if ((objc_msgSend(v104, "isEqualToString:", CFSTR("AccessorySettingsInterfaceModalitySwitch")) & 1) != 0)
            {
              v105 = 5;
            }
            else if ((objc_msgSend(v104, "isEqualToString:", CFSTR("kCodexSettingsModalitySetting")) & 1) != 0)
            {
              v105 = 1;
            }
            else if ((objc_msgSend(v104, "isEqualToString:", CFSTR("AccessorySettingsInterfaceModalityAXSecondStepper")) & 1) != 0)
            {
              v105 = 4;
            }
            else if ((objc_msgSend(v104, "isEqualToString:", CFSTR("AccessorySettingsInterfaceModalitySelection")) & 1) != 0)
            {
              v105 = 8;
            }
            else if (objc_msgSend(v104, "isEqualToString:", CFSTR("AccessorySettingsInterfaceModalityButton")))
            {
              v105 = 9;
            }
            else
            {
              v105 = -1;
            }

          }
          else
          {
            objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("Children"));
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v106, "count"))
            {

              v105 = 0;
            }
            else
            {
              objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("AlwaysShowGroup"));
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = objc_msgSend(v107, "BOOLValue");

              v105 = v108 ^ 1u;
              v55 = v147;
            }
          }
          v55->_interfaceModality = v105;
          if (_MergedGlobals_322 != -1)
            dispatch_once(&_MergedGlobals_322, &__block_literal_global_131_1);
          v109 = (id)qword_1ED379E30;
          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("SwitchEnableDependencies"));
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = objc_msgSend(v110, "copy");
          BOOLeanKeyPathDependencies = v55->_BOOLeanKeyPathDependencies;
          v55->_BOOLeanKeyPathDependencies = (NSArray *)v111;

          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("HideOnDisableDependency"));
          v113 = (void *)objc_claimAutoreleasedReturnValue();

          if (v113)
          {
            objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("HideOnDisableDependency"));
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v55->_requiresDependenciesToShowSetting = objc_msgSend(v114, "BOOLValue");

          }
          else
          {
            v55->_requiresDependenciesToShowSetting = 1;
          }
          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("AlwaysShowGroup"));
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v55->_alwaysShowGroup = objc_msgSend(v115, "BOOLValue");

          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("ShowInSeperateSection"));
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v55->_showInSeperateSection = objc_msgSend(v116, "BOOLValue");

          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("IsSoftwareVersionNeeded"));
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v55->_isSoftwareVersionNeeded = objc_msgSend(v117, "BOOLValue");

          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("WantsSeparateSectionPerGroup"));
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          if (v118)
          {
            objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("WantsSeparateSectionPerGroup"));
            v148 = v67;
            v119 = v109;
            v120 = v103;
            v121 = v66;
            v122 = v61;
            v123 = v60;
            v124 = v58;
            v125 = v57;
            v126 = v55;
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            v126->_wantsSeparateSectionPerGroup = objc_msgSend(v127, "BOOLValue");

            v55 = v126;
            v57 = v125;
            v58 = v124;
            v60 = v123;
            v61 = v122;
            v66 = v121;
            v103 = v120;
            v109 = v119;
            v67 = v148;
          }
          else
          {
            v55->_wantsSeparateSectionPerGroup = 1;
          }

          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("AdapterIdentifier"));
          v128 = objc_claimAutoreleasedReturnValue();
          adapterIdentifier = v55->_adapterIdentifier;
          v55->_adapterIdentifier = (NSString *)v128;

          v157[0] = MEMORY[0x1E0C809B0];
          v157[1] = 3221225472;
          v157[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_9;
          v157[3] = &unk_1EA73F8E0;
          v158 = v109;
          v130 = v109;
          objc_msgSend(v67, "na_filter:", v157);
          v131 = objc_claimAutoreleasedReturnValue();
          userInfo = v55->_userInfo;
          v55->_userInfo = (NSDictionary *)v131;

          goto LABEL_60;
        }
        +[HFAccessorySettingFormatterFactory defaultFactory](HFAccessorySettingFormatterFactory, "defaultFactory");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "formatterForKey:", v90);
        v92 = objc_claimAutoreleasedReturnValue();
        footerTitleFormatter = v147->_footerTitleFormatter;
        v147->_footerTitleFormatter = (NSFormatter *)v92;

      }
      goto LABEL_27;
    }
    +[HFAccessorySettingFormatterFactory defaultFactory](HFAccessorySettingFormatterFactory, "defaultFactory");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "formatterForKey:", v82);
    v84 = objc_claimAutoreleasedReturnValue();
    previewValueFormatter = v147->_previewValueFormatter;
    v147->_previewValueFormatter = (NSFormatter *)v84;

    goto LABEL_18;
  }
LABEL_60:

  return v55;
}

id __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*dertbu*"), *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*Dertbu*"), *(_QWORD *)(a1 + 40));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

id __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*grtyde*"), *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*Grtyde*"), *(_QWORD *)(a1 + 40));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

id __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*wdeioes*"), *(_QWORD *)(a1 + 32));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

id __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*uehgslv*"), *(_QWORD *)(a1 + 32));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

id __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*cyutvegi*"), *(_QWORD *)(a1 + 32));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

id __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*lRVrruvjJf*"), *(_QWORD *)(a1 + 32));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

void __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_8()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("KeyPath"), CFSTR("SortKey"), CFSTR("GroupHeaderLocalizedStringKey"), CFSTR("GroupFooterLocalizedStringKey"), CFSTR("PreferredInterfaceModality"), CFSTR("Children"), CFSTR("SwitchEnableDependencies"), CFSTR("WantsSeparateSectionPerGroup"), CFSTR("AlwaysShowGroup"), CFSTR("AdapterIdentifier"), CFSTR("LocalizedOverrideTitleKey"), CFSTR("FooterTitleFormatter"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379E30;
  qword_1ED379E30 = v0;

}

uint64_t __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSString)sortKey
{
  return self->_sortKey;
}

- (NSString)localizedHeader
{
  return self->_localizedHeader;
}

- (NSString)localizedFooter
{
  return self->_localizedFooter;
}

- (NSString)overrideLocalizedTitleKey
{
  return self->_overrideLocalizedTitleKey;
}

- (NSArray)BOOLeanKeyPathDependencies
{
  return self->_BOOLeanKeyPathDependencies;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (int64_t)interfaceModality
{
  return self->_interfaceModality;
}

- (BOOL)requiresDependenciesToShowSetting
{
  return self->_requiresDependenciesToShowSetting;
}

- (BOOL)previewAccessory
{
  return self->_previewAccessory;
}

- (NSString)previewValueKeyPath
{
  return self->_previewValueKeyPath;
}

- (NSFormatter)previewValueFormatter
{
  return self->_previewValueFormatter;
}

- (NSFormatter)footerTitleFormatter
{
  return self->_footerTitleFormatter;
}

- (NSFormatter)headerTitleFormatter
{
  return self->_headerTitleFormatter;
}

- (BOOL)alwaysShowGroup
{
  return self->_alwaysShowGroup;
}

- (BOOL)wantsSeparateSectionPerGroup
{
  return self->_wantsSeparateSectionPerGroup;
}

- (NSString)adapterIdentifier
{
  return self->_adapterIdentifier;
}

- (BOOL)showInSeperateSection
{
  return self->_showInSeperateSection;
}

- (BOOL)isSoftwareVersionNeeded
{
  return self->_isSoftwareVersionNeeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapterIdentifier, 0);
  objc_storeStrong((id *)&self->_headerTitleFormatter, 0);
  objc_storeStrong((id *)&self->_footerTitleFormatter, 0);
  objc_storeStrong((id *)&self->_previewValueFormatter, 0);
  objc_storeStrong((id *)&self->_previewValueKeyPath, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_BOOLeanKeyPathDependencies, 0);
  objc_storeStrong((id *)&self->_overrideLocalizedTitleKey, 0);
  objc_storeStrong((id *)&self->_localizedFooter, 0);
  objc_storeStrong((id *)&self->_localizedHeader, 0);
  objc_storeStrong((id *)&self->_sortKey, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
