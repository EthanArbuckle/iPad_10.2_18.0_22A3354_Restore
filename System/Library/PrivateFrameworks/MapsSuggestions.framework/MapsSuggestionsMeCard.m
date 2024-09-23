@implementation MapsSuggestionsMeCard

- (_BYTE)initWithHomes:(void *)a3 works:(void *)a4 schools:(void *)a5 hiddenHomes:(void *)a6 hiddenWorks:(void *)a7 hiddenSchools:(void *)a8 all:(void *)a9 allIncludingHidden:(void *)a10 perCNPostalAddress:(char)a11 hasCorrect:(char)a12 hasGeocoded:
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _BYTE *v26;
  _BYTE *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t m;
  void *v81;
  uint64_t v82;
  void *v83;
  BOOL v84;
  uint64_t v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  objc_super v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v93 = a2;
  v92 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  if (a1)
  {
    v94.receiver = a1;
    v94.super_class = (Class)MapsSuggestionsMeCard;
    v26 = objc_msgSendSuper2(&v94, sel_init);
    v27 = v26;
    if (v26)
    {
      v87 = v24;
      v26[16] = a11;
      v26[17] = a12;
      v28 = objc_msgSend(v93, "copy");
      v29 = (void *)*((_QWORD *)v27 + 3);
      *((_QWORD *)v27 + 3) = v28;

      v30 = objc_msgSend(v92, "copy");
      v31 = (void *)*((_QWORD *)v27 + 4);
      *((_QWORD *)v27 + 4) = v30;

      v91 = v19;
      v32 = objc_msgSend(v19, "copy");
      v33 = (void *)*((_QWORD *)v27 + 5);
      *((_QWORD *)v27 + 5) = v32;

      v90 = v20;
      v34 = objc_msgSend(v20, "copy");
      v35 = (void *)*((_QWORD *)v27 + 6);
      *((_QWORD *)v27 + 6) = v34;

      v89 = v21;
      v36 = objc_msgSend(v21, "copy");
      v37 = (void *)*((_QWORD *)v27 + 7);
      *((_QWORD *)v27 + 7) = v36;

      v88 = v22;
      v38 = objc_msgSend(v22, "copy");
      v39 = (void *)*((_QWORD *)v27 + 8);
      *((_QWORD *)v27 + 8) = v38;

      v40 = objc_msgSend(v23, "copy");
      v41 = (void *)*((_QWORD *)v27 + 9);
      *((_QWORD *)v27 + 9) = v40;

      objc_storeStrong((id *)v27 + 10, a9);
      v42 = objc_msgSend(v25, "copy");
      v43 = (void *)*((_QWORD *)v27 + 1);
      *((_QWORD *)v27 + 1) = v42;

      v44 = *((id *)v27 + 3);
      v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v46 = v44;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v96;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v96 != v49)
              objc_enumerationMutation(v46);
            objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "geoMapItem");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
              objc_msgSend(v45, "addObject:", v51);

          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
        }
        while (v48);
      }

      v52 = objc_msgSend(v45, "copy");
      v53 = (void *)*((_QWORD *)v27 + 11);
      *((_QWORD *)v27 + 11) = v52;

      v54 = *((id *)v27 + 4);
      v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v56 = v54;
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
      if (v57)
      {
        v58 = v57;
        v59 = *(_QWORD *)v96;
        do
        {
          for (j = 0; j != v58; ++j)
          {
            if (*(_QWORD *)v96 != v59)
              objc_enumerationMutation(v56);
            objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * j), "geoMapItem");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            if (v61)
              objc_msgSend(v55, "addObject:", v61);

          }
          v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
        }
        while (v58);
      }

      v62 = objc_msgSend(v55, "copy");
      v63 = (void *)*((_QWORD *)v27 + 12);
      *((_QWORD *)v27 + 12) = v62;

      v64 = *((id *)v27 + 5);
      v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v66 = v64;
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
      if (v67)
      {
        v68 = v67;
        v69 = *(_QWORD *)v96;
        do
        {
          for (k = 0; k != v68; ++k)
          {
            if (*(_QWORD *)v96 != v69)
              objc_enumerationMutation(v66);
            objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * k), "geoMapItem");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            if (v71)
              objc_msgSend(v65, "addObject:", v71);

          }
          v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
        }
        while (v68);
      }

      v72 = objc_msgSend(v65, "copy");
      v73 = (void *)*((_QWORD *)v27 + 13);
      *((_QWORD *)v27 + 13) = v72;

      v74 = *((id *)v27 + 9);
      v75 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v76 = v74;
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
      v19 = v91;
      if (v77)
      {
        v78 = v77;
        v79 = *(_QWORD *)v96;
        do
        {
          for (m = 0; m != v78; ++m)
          {
            if (*(_QWORD *)v96 != v79)
              objc_enumerationMutation(v76);
            objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * m), "geoMapItem");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            if (v81)
              objc_msgSend(v75, "addObject:", v81);

          }
          v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
        }
        while (v78);
      }

      v82 = objc_msgSend(v75, "copy");
      v83 = (void *)*((_QWORD *)v27 + 14);
      *((_QWORD *)v27 + 14) = v82;

      if (objc_msgSend(*((id *)v27 + 3), "count")
        || objc_msgSend(*((id *)v27 + 4), "count")
        || objc_msgSend(*((id *)v27 + 6), "count"))
      {
        v84 = 1;
        v27[18] = 1;
        v21 = v89;
        v20 = v90;
        v24 = v87;
        v22 = v88;
      }
      else
      {
        v86 = objc_msgSend(*((id *)v27 + 7), "count");
        v27[18] = v86 != 0;
        v21 = v89;
        v20 = v90;
        v24 = v87;
        v22 = v88;
        v84 = v86 || objc_msgSend(*((id *)v27 + 5), "count") || objc_msgSend(*((id *)v27 + 8), "count") != 0;
      }
      v27[19] = v84;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (MapsSuggestionsMeCard)initWithShortcuts:(id)a3 perCNPostalAddress:(id)a4 hasCorrected:(BOOL)a5 hasGeocoded:(BOOL)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MapsSuggestionsMeCard *v17;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v7, "copy");

  v17 = (MapsSuggestionsMeCard *)-[MapsSuggestionsMeCard initWithHomes:works:schools:hiddenHomes:hiddenWorks:hiddenSchools:all:allIncludingHidden:perCNPostalAddress:hasCorrect:hasGeocoded:](self, v9, v10, v11, v12, v13, v14, v15, v8, v16, a5, a6);
  return v17;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 2 && (objc_msgSend(v2, "isHidden") & 1) == 0)
    v3 = objc_msgSend(v2, "isSetupPlaceholder") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 3 && (objc_msgSend(v2, "isHidden") & 1) == 0)
    v3 = objc_msgSend(v2, "isSetupPlaceholder") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 5 && (objc_msgSend(v2, "isHidden") & 1) == 0)
    v3 = objc_msgSend(v2, "isSetupPlaceholder") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 2 && objc_msgSend(v2, "isHidden"))
    v3 = objc_msgSend(v2, "isSetupPlaceholder") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 3 && objc_msgSend(v2, "isHidden"))
    v3 = objc_msgSend(v2, "isSetupPlaceholder") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 5 && objc_msgSend(v2, "isHidden"))
    v3 = objc_msgSend(v2, "isSetupPlaceholder") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

- (MapsSuggestionsMeCard)initWithShortcuts:(id)a3 hasCorrected:(BOOL)a4 hasGeocoded:(BOOL)a5
{
  return -[MapsSuggestionsMeCard initWithShortcuts:perCNPostalAddress:hasCorrected:hasGeocoded:](self, "initWithShortcuts:perCNPostalAddress:hasCorrected:hasGeocoded:", a3, 0, a4, a5);
}

- (id)shortcutsPerCNPostalAddress
{
  return self->_perCNPostalAddress;
}

- (id)shortcutForCNPostalAddressIdentifier:(id)a3
{
  if (!a3)
    return 0;
  -[NSDictionary objectForKeyedSubscript:](self->_perCNPostalAddress, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqualToMeCard:(id)a3
{
  MapsSuggestionsMeCard *v4;
  MapsSuggestionsMeCard *v5;
  NSArray *shortcutsForHome;
  NSArray *shortcutsForWork;
  NSArray *shortcutsForSchool;
  NSArray *hiddenShortcutsForHome;
  NSArray *hiddenShortcutsForWork;
  NSArray *hiddenShortcutsForSchool;
  NSArray *shortcutsForAllIncludingHidden;
  NSDictionary *perCNPostalAddress;
  BOOL v14;

  v4 = (MapsSuggestionsMeCard *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_22;
  if (self == v4)
    goto LABEL_21;
  if (self->_hasCorrected != v4->_hasCorrected)
    goto LABEL_22;
  if (self->_hasGeocoded != v4->_hasGeocoded)
    goto LABEL_22;
  shortcutsForHome = self->_shortcutsForHome;
  if (shortcutsForHome != v5->_shortcutsForHome && !-[NSArray isEqualToArray:](shortcutsForHome, "isEqualToArray:"))
    goto LABEL_22;
  if (((shortcutsForWork = self->_shortcutsForWork, shortcutsForWork == v5->_shortcutsForWork)
     || -[NSArray isEqualToArray:](shortcutsForWork, "isEqualToArray:"))
    && ((shortcutsForSchool = self->_shortcutsForSchool, shortcutsForSchool == v5->_shortcutsForSchool)
     || -[NSArray isEqualToArray:](shortcutsForSchool, "isEqualToArray:"))
    && ((hiddenShortcutsForHome = self->_hiddenShortcutsForHome, hiddenShortcutsForHome == v5->_hiddenShortcutsForHome)
     || -[NSArray isEqualToArray:](hiddenShortcutsForHome, "isEqualToArray:"))
    && ((hiddenShortcutsForWork = self->_hiddenShortcutsForWork, hiddenShortcutsForWork == v5->_hiddenShortcutsForWork)
     || -[NSArray isEqualToArray:](hiddenShortcutsForWork, "isEqualToArray:"))
    && ((hiddenShortcutsForSchool = self->_hiddenShortcutsForSchool,
         hiddenShortcutsForSchool == v5->_hiddenShortcutsForSchool)
     || -[NSArray isEqualToArray:](hiddenShortcutsForSchool, "isEqualToArray:"))
    && ((shortcutsForAllIncludingHidden = self->_shortcutsForAllIncludingHidden,
         shortcutsForAllIncludingHidden == v5->_shortcutsForAllIncludingHidden)
     || -[NSArray isEqualToArray:](shortcutsForAllIncludingHidden, "isEqualToArray:"))
    && ((perCNPostalAddress = self->_perCNPostalAddress, perCNPostalAddress == v5->_perCNPostalAddress)
     || -[NSDictionary isEqualToDictionary:](perCNPostalAddress, "isEqualToDictionary:")))
  {
LABEL_21:
    v14 = 1;
  }
  else
  {
LABEL_22:
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  MapsSuggestionsMeCard *v4;
  BOOL v5;

  v4 = (MapsSuggestionsMeCard *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[MapsSuggestionsMeCard isEqualToMeCard:](self, "isEqualToMeCard:", v4);
  }

  return v5;
}

- (id)description
{
  id v3;
  const char *v4;
  const char *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_hasCorrected)
    v4 = "M";
  else
    v4 = "";
  if (self->_hasGeocoded)
    v5 = "G";
  else
    v5 = "";
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("MECARD{%s%s} %u Homes (+%u), %u Works (+%u), %u Schools (+%u), %u total"), v4, v5, -[NSArray count](self->_shortcutsForHome, "count"), -[NSArray count](self->_hiddenShortcutsForHome, "count"), -[NSArray count](self->_shortcutsForWork, "count"), -[NSArray count](self->_hiddenShortcutsForWork, "count"), -[NSArray count](self->_shortcutsForSchool, "count"), -[NSArray count](self->_hiddenShortcutsForSchool, "count"), -[NSArray count](self->_shortcutsForAllIncludingHidden, "count"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSArray *shortcutsForHome;
  objc_class *v5;
  NSArray *v6;
  NSArray *shortcutsForWork;
  objc_class *v8;
  NSArray *v9;
  NSArray *shortcutsForSchool;
  objc_class *v11;
  NSArray *v12;
  void *v13;
  NSArray *hiddenShortcutsForHome;
  objc_class *v15;
  NSArray *v16;
  void *v17;
  NSArray *hiddenShortcutsForWork;
  objc_class *v19;
  NSArray *v20;
  void *v21;
  NSArray *hiddenShortcutsForSchool;
  objc_class *v23;
  NSArray *v24;
  void *v25;
  NSArray *shortcutsForAll;
  objc_class *v27;
  NSArray *v28;
  void *v29;
  NSArray *shortcutsForAllIncludingHidden;
  objc_class *v31;
  NSArray *v32;
  void *v33;
  NSDictionary *perCNPostalAddress;
  objc_class *v35;
  NSDictionary *v36;
  void *v37;
  _BYTE *v38;
  void *v40;
  MapsSuggestionsMeCard *v41;
  void *v42;

  v41 = [MapsSuggestionsMeCard alloc];
  shortcutsForHome = self->_shortcutsForHome;
  if (shortcutsForHome)
  {
    v5 = (objc_class *)MEMORY[0x1E0C99D20];
    v6 = shortcutsForHome;
    v42 = (void *)objc_msgSend([v5 alloc], "initWithArray:copyItems:", v6, 1);

  }
  else
  {
    v42 = 0;
  }
  shortcutsForWork = self->_shortcutsForWork;
  if (shortcutsForWork)
  {
    v8 = (objc_class *)MEMORY[0x1E0C99D20];
    v9 = shortcutsForWork;
    v40 = (void *)objc_msgSend([v8 alloc], "initWithArray:copyItems:", v9, 1);

  }
  else
  {
    v40 = 0;
  }
  shortcutsForSchool = self->_shortcutsForSchool;
  if (shortcutsForSchool)
  {
    v11 = (objc_class *)MEMORY[0x1E0C99D20];
    v12 = shortcutsForSchool;
    v13 = (void *)objc_msgSend([v11 alloc], "initWithArray:copyItems:", v12, 1);

  }
  else
  {
    v13 = 0;
  }
  hiddenShortcutsForHome = self->_hiddenShortcutsForHome;
  if (hiddenShortcutsForHome)
  {
    v15 = (objc_class *)MEMORY[0x1E0C99D20];
    v16 = hiddenShortcutsForHome;
    v17 = (void *)objc_msgSend([v15 alloc], "initWithArray:copyItems:", v16, 1);

  }
  else
  {
    v17 = 0;
  }
  hiddenShortcutsForWork = self->_hiddenShortcutsForWork;
  if (hiddenShortcutsForWork)
  {
    v19 = (objc_class *)MEMORY[0x1E0C99D20];
    v20 = hiddenShortcutsForWork;
    v21 = (void *)objc_msgSend([v19 alloc], "initWithArray:copyItems:", v20, 1);

  }
  else
  {
    v21 = 0;
  }
  hiddenShortcutsForSchool = self->_hiddenShortcutsForSchool;
  if (hiddenShortcutsForSchool)
  {
    v23 = (objc_class *)MEMORY[0x1E0C99D20];
    v24 = hiddenShortcutsForSchool;
    v25 = (void *)objc_msgSend([v23 alloc], "initWithArray:copyItems:", v24, 1);

  }
  else
  {
    v25 = 0;
  }
  shortcutsForAll = self->_shortcutsForAll;
  if (shortcutsForAll)
  {
    v27 = (objc_class *)MEMORY[0x1E0C99D20];
    v28 = shortcutsForAll;
    v29 = (void *)objc_msgSend([v27 alloc], "initWithArray:copyItems:", v28, 1);

  }
  else
  {
    v29 = 0;
  }
  shortcutsForAllIncludingHidden = self->_shortcutsForAllIncludingHidden;
  if (shortcutsForAllIncludingHidden)
  {
    v31 = (objc_class *)MEMORY[0x1E0C99D20];
    v32 = shortcutsForAllIncludingHidden;
    v33 = (void *)objc_msgSend([v31 alloc], "initWithArray:copyItems:", v32, 1);

  }
  else
  {
    v33 = 0;
  }
  perCNPostalAddress = self->_perCNPostalAddress;
  if (perCNPostalAddress)
  {
    v35 = (objc_class *)MEMORY[0x1E0C99D80];
    v36 = perCNPostalAddress;
    v37 = (void *)objc_msgSend([v35 alloc], "initWithDictionary:copyItems:", v36, 1);

  }
  else
  {
    v37 = 0;
  }
  v38 = -[MapsSuggestionsMeCard initWithHomes:works:schools:hiddenHomes:hiddenWorks:hiddenSchools:all:allIncludingHidden:perCNPostalAddress:hasCorrect:hasGeocoded:](v41, v42, v40, v13, v17, v21, v25, v29, v33, v37, *(_WORD *)&self->_hasCorrected, HIBYTE(*(_WORD *)&self->_hasCorrected));

  return v38;
}

- (NSArray)shortcutsForHome
{
  return self->_shortcutsForHome;
}

- (NSArray)shortcutsForWork
{
  return self->_shortcutsForWork;
}

- (NSArray)shortcutsForSchool
{
  return self->_shortcutsForSchool;
}

- (NSArray)hiddenShortcutsForHome
{
  return self->_hiddenShortcutsForHome;
}

- (NSArray)hiddenShortcutsForWork
{
  return self->_hiddenShortcutsForWork;
}

- (NSArray)hiddenShortcutsForSchool
{
  return self->_hiddenShortcutsForSchool;
}

- (NSArray)shortcutsForAll
{
  return self->_shortcutsForAll;
}

- (NSArray)shortcutsForAllIncludingHidden
{
  return self->_shortcutsForAllIncludingHidden;
}

- (NSArray)mapItemsForHome
{
  return self->_mapItemsForHome;
}

- (NSArray)mapItemsForWork
{
  return self->_mapItemsForWork;
}

- (NSArray)mapItemsForSchool
{
  return self->_mapItemsForSchool;
}

- (NSArray)mapItemsForAll
{
  return self->_mapItemsForAll;
}

- (BOOL)hasCorrected
{
  return self->_hasCorrected;
}

- (BOOL)hasGeocoded
{
  return self->_hasGeocoded;
}

- (BOOL)hasHomeOrWork
{
  return self->_hasHomeOrWork;
}

- (BOOL)hasHomeOrWorkOrSchool
{
  return self->_hasHomeOrWorkOrSchool;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemsForAll, 0);
  objc_storeStrong((id *)&self->_mapItemsForSchool, 0);
  objc_storeStrong((id *)&self->_mapItemsForWork, 0);
  objc_storeStrong((id *)&self->_mapItemsForHome, 0);
  objc_storeStrong((id *)&self->_shortcutsForAllIncludingHidden, 0);
  objc_storeStrong((id *)&self->_shortcutsForAll, 0);
  objc_storeStrong((id *)&self->_hiddenShortcutsForSchool, 0);
  objc_storeStrong((id *)&self->_hiddenShortcutsForWork, 0);
  objc_storeStrong((id *)&self->_hiddenShortcutsForHome, 0);
  objc_storeStrong((id *)&self->_shortcutsForSchool, 0);
  objc_storeStrong((id *)&self->_shortcutsForWork, 0);
  objc_storeStrong((id *)&self->_shortcutsForHome, 0);
  objc_storeStrong((id *)&self->_perCNPostalAddress, 0);
}

@end
