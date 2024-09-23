@implementation AvailableUnitRanks

- (AvailableUnitRanks)init
{
  AvailableUnitRanks *v2;
  NSLock *v3;
  NSLock *lock;
  uint64_t v5;
  NSCache *availableRanks;
  uint64_t v7;
  UnitsInfo *unitsInfo;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AvailableUnitRanks;
  v2 = -[AvailableUnitRanks init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = objc_opt_new();
    availableRanks = v2->_availableRanks;
    v2->_availableRanks = (NSCache *)v5;

    -[NSCache setCountLimit:](v2->_availableRanks, "setCountLimit:", 2);
    +[UnitsInfo converterUnits](UnitsInfo, "converterUnits");
    v7 = objc_claimAutoreleasedReturnValue();
    unitsInfo = v2->_unitsInfo;
    v2->_unitsInfo = (UnitsInfo *)v7;

  }
  return v2;
}

- (id)ranks
{
  void *v3;
  void *v4;

  +[Localize systemLocales](Localize, "systemLocales");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AvailableUnitRanks ranksWithLocales:](self, "ranksWithLocales:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (AvailableUnitRanks)ranksWithLocales:(id)a3
{
  return -[AvailableUnitRanks ranksWithLocales:cachedOnly:](self, "ranksWithLocales:cachedOnly:", a3, 0);
}

- (AvailableUnitRanks)ranksWithLocales:(id)a3 cachedOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  AvailableUnitRanks *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t n;
  id v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  id obj;
  id v79;
  void *context;
  void *v81;
  uint64_t v82;
  id v84;
  void (**v85)(void *, void *, uint64_t, _QWORD, uint64_t);
  unsigned int v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[4];
  id v109;
  _QWORD aBlock[5];
  id v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[5];
  uint8_t v120[128];
  uint8_t buf[4];
  void *v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _QWORD v125[3];

  v4 = a4;
  v125[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    +[Localize systemLocale](Localize, "systemLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v125[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  v8 = (void *)objc_opt_new();
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v114;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v114 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * i), "localeIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("|"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_lock, "lock");
  -[NSCache objectForKey:](self->_availableRanks, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 || v4)
  {
    -[NSLock unlock](self->_lock, "unlock");
    v63 = v16;
  }
  else
  {
    v72 = v15;
    v17 = (void *)objc_opt_new();
    v18 = (void *)objc_opt_new();
    v19 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__AvailableUnitRanks_ranksWithLocales_cachedOnly___block_invoke;
    aBlock[3] = &unk_1E6EA0790;
    aBlock[4] = self;
    v84 = v17;
    v111 = v84;
    v70 = v18;
    v112 = v70;
    v20 = _Block_copy(aBlock);
    if (ranksWithLocales_cachedOnly__onceToken[0] != -1)
      dispatch_once(ranksWithLocales_cachedOnly__onceToken, &__block_literal_global_23);
    v108[0] = v19;
    v108[1] = 3221225472;
    v108[2] = __50__AvailableUnitRanks_ranksWithLocales_cachedOnly___block_invoke_3;
    v108[3] = &unk_1E6EA07D8;
    v71 = v20;
    v109 = v71;
    v85 = (void (**)(void *, void *, uint64_t, _QWORD, uint64_t))_Block_copy(v108);
    v21 = (void *)objc_opt_new();
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    obj = v9;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v123, 16);
    if (v22)
    {
      v23 = v22;
      v86 = 0;
      v24 = *(_QWORD *)v105;
      v25 = 0x1ED55F000uLL;
      v75 = v9;
      v76 = v8;
      v73 = *(_QWORD *)v105;
      v74 = v21;
      do
      {
        v26 = 0;
        v77 = v23;
        do
        {
          if (*(_QWORD *)v105 != v24)
            objc_enumerationMutation(obj);
          v87 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * v26);
          objc_msgSend((id)(v25 + 3056), "localizationForLocale:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "containsObject:", v27) & 1) == 0)
          {
            if ((unint64_t)objc_msgSend(v21, "count") > 2)
            {

              goto LABEL_62;
            }
            v82 = v26;
            objc_msgSend(v21, "addObject:", v27);
            CalculateLogForCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v122 = v27;
              _os_log_impl(&dword_1B885B000, v28, OS_LOG_TYPE_DEFAULT, "Calculate: loading localization \"%{public}@\", buf, 0xCu);
            }

            context = (void *)MEMORY[0x1BCCB4868]();
            v81 = v27;
            objc_msgSend((id)(v25 + 3056), "localizedStringsForTable:localization:", CFSTR("LocalizableUnits"), v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = 0u;
            v101 = 0u;
            v102 = 0u;
            v103 = 0u;
            v30 = self;
            -[AvailableUnitRanks unitsInfo](self, "unitsInfo");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "unitNames");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v100, v120, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v101;
              do
              {
                for (j = 0; j != v34; ++j)
                {
                  if (*(_QWORD *)v101 != v35)
                    objc_enumerationMutation(v32);
                  v37 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * j);
                  -[AvailableUnitRanks unitsInfo](self, "unitsInfo");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "objectForKeyedSubscript:", v37);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v39, "unitID");

                  objc_msgSend(v29, "objectForKeyedSubscript:", v37);
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (v41)
                  {
                    v42 = (void *)v41;
                    +[CalculateTokenizer prepareString:](CalculateTokenizer, "prepareString:", v41);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v43, "componentsSeparatedByString:", CFSTR("|"));
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v85[2](v85, v44, v40, v86, v87);

                  }
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v100, v120, 16);
              }
              while (v34);
            }

            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("ConfusableUnits"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v45)
            {
              v79 = v45;
              objc_msgSend(v45, "componentsSeparatedByString:", CFSTR("|"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = 0u;
              v97 = 0u;
              v98 = 0u;
              v99 = 0u;
              v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v96, v119, 16);
              if (v47)
              {
                v48 = v47;
                v49 = *(_QWORD *)v97;
                do
                {
                  for (k = 0; k != v48; ++k)
                  {
                    if (*(_QWORD *)v97 != v49)
                      objc_enumerationMutation(v46);
                    -[Trie objectForKeyedSubscript:]((uint64_t)v84, *(void **)(*((_QWORD *)&v96 + 1) + 8 * k));
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = v51;
                    if (v51)
                    {
                      v94 = 0u;
                      v95 = 0u;
                      v92 = 0u;
                      v93 = 0u;
                      objc_msgSend(v51, "ranks");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v92, v118, 16);
                      if (v54)
                      {
                        v55 = v54;
                        v56 = *(_QWORD *)v93;
                        do
                        {
                          for (m = 0; m != v55; ++m)
                          {
                            if (*(_QWORD *)v93 != v56)
                              objc_enumerationMutation(v53);
                            objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * m), "setIsConfusable:", 1);
                          }
                          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v92, v118, 16);
                        }
                        while (v55);
                      }

                      v30 = self;
                    }

                  }
                  v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v96, v119, 16);
                }
                while (v48);
              }

              v45 = v79;
            }

            objc_autoreleasePoolPop(context);
            v86 += 5;
            v27 = v81;
            -[AvailableUnitRanks conversionVerbsWithLocalization:from:](v30, "conversionVerbsWithLocalization:from:", v81, 0);
            v58 = objc_claimAutoreleasedReturnValue();
            if (v58)
            {
              v59 = (void *)v58;
              v60 = 4294967294;
              v9 = v75;
              v8 = v76;
              v21 = v74;
              v23 = v77;
              v25 = 0x1ED55F000;
              v26 = v82;
LABEL_54:
              v85[2](v85, v59, v60, 0, v87);

              v24 = v73;
              goto LABEL_55;
            }
            -[AvailableUnitRanks conversionVerbsWithLocalization:from:](v30, "conversionVerbsWithLocalization:from:", v81, 1);
            v61 = objc_claimAutoreleasedReturnValue();
            v9 = v75;
            v8 = v76;
            v21 = v74;
            v23 = v77;
            v26 = v82;
            if (v61)
            {
              v59 = (void *)v61;
              v60 = 0xFFFFFFFFLL;
              v25 = 0x1ED55F000;
              goto LABEL_54;
            }
            v24 = v73;
            v25 = 0x1ED55F000;
          }
LABEL_55:

          ++v26;
        }
        while (v26 != v23);
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v123, 16);
        v23 = v62;
      }
      while (v62);
    }
LABEL_62:

    +[CalculateTokenizer addSymbols:](CalculateTokenizer, "addSymbols:", v84);
    +[CalculateTokenizer addUnits:builtIn:](CalculateTokenizer, "addUnits:builtIn:", v84, 0);
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v64 = v70;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v88, v117, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v89;
      do
      {
        for (n = 0; n != v66; ++n)
        {
          if (*(_QWORD *)v89 != v67)
            objc_enumerationMutation(v64);
          objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * n), "sort");
        }
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v88, v117, 16);
      }
      while (v66);
    }

    -[NSCache setObject:forKey:](self->_availableRanks, "setObject:forKey:", v84, v72);
    -[NSLock unlock](self->_lock, "unlock");
    v63 = v84;

    v15 = v72;
  }

  return (AvailableUnitRanks *)v63;
}

- (void)clearCache
{
  -[NSCache removeAllObjects](self->_availableRanks, "removeAllObjects");
}

- (id)conversionVerbsWithLocalization:(id)a3 from:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v4 = a4;
  +[Localize localizedStringForKey:value:table:localization:](Localize, "localizedStringForKey:value:table:localization:", CFSTR("CONVERSION_SYNTAX"), 0, CFSTR("Localizable"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CalculateTokenizer prepareString:](CalculateTokenizer, "prepareString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = CFSTR("_unit_to_");
  if (v4)
    v8 = CFSTR("_unit_to_");
  else
    v8 = CFSTR("_number_and_unit_from_");
  if (v4)
    v7 = CFSTR("_number_and_unit_from_");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(\\s*)\\(([^)]*)\\)(\\s*)%@"), v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v9, 0, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (objc_msgSend(v11, "numberOfRanges") == 4)
  {
    v13 = objc_msgSend(v11, "rangeAtIndex:", 2);
    objc_msgSend(v6, "substringWithRange:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("|"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)conversionVerbsWithLocale:(id)a3 from:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  +[Localize localizationForLocale:](Localize, "localizationForLocale:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AvailableUnitRanks conversionVerbsWithLocalization:from:](self, "conversionVerbsWithLocalization:from:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (NSCache)availableRanks
{
  return self->_availableRanks;
}

- (void)setAvailableRanks:(id)a3
{
  objc_storeStrong((id *)&self->_availableRanks, a3);
}

- (UnitsInfo)unitsInfo
{
  return self->_unitsInfo;
}

- (void)setUnitsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_unitsInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitsInfo, 0);
  objc_storeStrong((id *)&self->_availableRanks, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __50__AvailableUnitRanks_ranksWithLocales_cachedOnly___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, float a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UnitRank *v14;
  double v15;
  UnitRank *v16;
  char v17;
  id v18;

  v18 = a2;
  v9 = a4;
  if (!+[CalculateTokenizer displayNameExponent:](CalculateTokenizer, "displayNameExponent:", v18))
  {
    if (objc_msgSend(v18, "containsString:", CFSTR("/")))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectAtIndexedSubscript:", (int)a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "hasPrefix:", CFSTR("BTU ")) & 1) != 0
        || (objc_msgSend(v18, "containsString:", CFSTR("100")) & 1) != 0
        || (objc_msgSend(v18, "containsString:", CFSTR("١٠٠")) & 1) != 0)
      {

      }
      else
      {
        v17 = objc_msgSend(v18, "containsString:", CFSTR("百"));

        if ((v17 & 1) == 0)
          goto LABEL_10;
      }
    }
    -[Trie objectForKeyedSubscript:](*(_QWORD *)(a1 + 40), v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "unitsInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[UnitRanks unitRanksWithUnitsInfo:](UnitRanks, "unitRanksWithUnitsInfo:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[Trie setObject:forKeyedSubscript:](*(_QWORD *)(a1 + 40), v12, v18);

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
    }
    v14 = [UnitRank alloc];
    *(float *)&v15 = a5;
    v16 = -[UnitRank initWithUnitID:rank:locale:](v14, "initWithUnitID:rank:locale:", a3, v9, v15);
    objc_msgSend(v12, "addUnitRank:", v16);

  }
LABEL_10:

}

void __50__AvailableUnitRanks_ranksWithLocales_cachedOnly___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  float v20;
  double v21;
  float v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v29 = *(_QWORD *)v31;
    v14 = (float)(a4 + 1);
    v15 = a4 + 1;
    v28 = *MEMORY[0x1E0C99880];
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v31 != v29)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16);
        v18 = *(_QWORD *)(a1 + 32);
        v19 = (double)(unint64_t)(v13 + v16);
        v20 = v19 / (double)(unint64_t)objc_msgSend(v9, "count", v28) + v14;
        (*(void (**)(uint64_t, void *, uint64_t, id, float))(v18 + 16))(v18, v17, a3, v10, v20);
        v21 = (double)(unint64_t)(objc_msgSend(v9, "count") + v15);
        v22 = v19 / (double)(unint64_t)objc_msgSend(v9, "count") + v21;
        v23 = v17;
        objc_msgSend((id)ranksWithLocales_cachedOnly__diacriticsRegex, "firstMatchInString:options:range:", v23, 0, 0, objc_msgSend(v23, "length"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v23, "stringByApplyingTransform:reverse:", v28, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v25, "isEqualToString:", v23) & 1) == 0)
            (*(void (**)(float))(*(_QWORD *)(a1 + 32) + 16))(v22);
        }
        else
        {
          v25 = v23;
        }
        objc_msgSend((id)ranksWithLocales_cachedOnly__uppercaseRegex, "firstMatchInString:options:range:", v25, 0, 0, objc_msgSend(v25, "length"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v25, "lowercaseStringWithLocale:", v10);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v27, "isEqualToString:", v25) & 1) == 0)
            (*(void (**)(float))(*(_QWORD *)(a1 + 32) + 16))(v22);

        }
        ++v16;
      }
      while (v12 != v16);
      v13 += v16;
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v12);
  }

}

void __50__AvailableUnitRanks_ranksWithLocales_cachedOnly___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\p{Diacritic}|\\p{Mn}"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ranksWithLocales_cachedOnly__diacriticsRegex;
  ranksWithLocales_cachedOnly__diacriticsRegex = v0;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\p{Lu}|\\p{Lt}"), 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)ranksWithLocales_cachedOnly__uppercaseRegex;
  ranksWithLocales_cachedOnly__uppercaseRegex = v2;

}

+ (AvailableUnitRanks)shared
{
  if (shared_onceToken_943 != -1)
    dispatch_once(&shared_onceToken_943, &__block_literal_global_944);
  return (AvailableUnitRanks *)(id)shared_shared_945;
}

void __28__AvailableUnitRanks_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared_shared_945;
  shared_shared_945 = v0;

}

@end
