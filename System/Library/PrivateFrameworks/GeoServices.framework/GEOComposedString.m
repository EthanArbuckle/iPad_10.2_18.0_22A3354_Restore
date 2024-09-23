@implementation GEOComposedString

- (GEOComposedString)initWithGeoFormattedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  NSArray *formatStrings;
  void *v11;
  NSArray *v12;
  NSArray *arguments;
  void *v14;
  NSArray *v15;
  NSArray *separators;
  void *v17;
  NSArray *v18;
  NSArray *formatStyles;
  void *v20;
  GEOComposedString *v21;
  void *v22;
  void *v23;
  GEOComposedString *v24;
  GEOComposedString *alternativeString;
  GEOComposedStringCondition *v26;
  void *v27;
  void *v28;
  GEOComposedStringCondition *v29;
  GEOComposedStringCondition *alternativeStringCondition;
  void *v31;
  BOOL v32;
  GEOComposedString *v33;
  objc_super v35;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "formatStrings"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7)
    && (v35.receiver = self,
        v35.super_class = (Class)GEOComposedString,
        (self = -[GEOComposedString init](&v35, sel_init)) != 0))
  {
    objc_msgSend(v5, "formatStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSArray *)objc_msgSend(v8, "copy");
    formatStrings = self->_formatStrings;
    self->_formatStrings = v9;

    objc_msgSend(v5, "formatArguments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_geo_compactMap:", &__block_literal_global_80);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    arguments = self->_arguments;
    self->_arguments = v12;

    objc_msgSend(v5, "separators");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (NSArray *)objc_msgSend(v14, "copy");
    separators = self->_separators;
    self->_separators = v15;

    objc_msgSend(v5, "formatStyles");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_geo_map:", &__block_literal_global_2_0);
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
    formatStyles = self->_formatStyles;
    self->_formatStyles = v18;

    objc_msgSend(v5, "alternativeString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [GEOComposedString alloc];
      objc_msgSend(v5, "alternativeString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "formattedString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[GEOComposedString initWithGeoFormattedString:](v21, "initWithGeoFormattedString:", v23);
      alternativeString = self->_alternativeString;
      self->_alternativeString = v24;

      v26 = [GEOComposedStringCondition alloc];
      objc_msgSend(v5, "alternativeString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "condition");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[GEOComposedStringCondition initWithGeoCondition:](v26, "initWithGeoCondition:", v28);
      alternativeStringCondition = self->_alternativeStringCondition;
      self->_alternativeStringCondition = v29;

    }
    objc_msgSend(v5, "metaData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "spokenPrivacyFilterType") != 1;

    self->_isPrivate = v32;
    self = self;
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

id __48__GEOComposedString_initWithGeoFormattedString___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GEOComposedStringArgument argumentForGeoFormatArgument:](GEOComposedStringArgument, "argumentForGeoFormatArgument:", a2);
}

_DWORD *__48__GEOComposedString_initWithGeoFormattedString___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _DWORD *v3;
  void *v4;
  const char *v5;
  void *v6;

  v2 = a2;
  v3 = (_DWORD *)objc_opt_new();
  objc_msgSend(v2, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v5, v4, 16);

    v3[2] = objc_msgSend(v2, "type");
  }
  else
  {

    objc_msgSend(v2, "type");
  }

  return v3;
}

- (GEOComposedString)initWithString:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *formatStrings;
  GEOComposedString *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    && (v9.receiver = self,
        v9.super_class = (Class)GEOComposedString,
        (self = -[GEOComposedString init](&v9, sel_init)) != 0))
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    formatStrings = self->_formatStrings;
    self->_formatStrings = v5;

    self->_isPrivate = 0;
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)defaultOptions
{
  GEOComposedStringOptions *v3;
  void *v4;

  v3 = objc_alloc_init(GEOComposedStringOptions);
  -[NSArray _geo_map:](self->_arguments, "_geo_map:", &__block_literal_global_9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedStringOptions setArguments:](v3, "setArguments:", v4);

  return v3;
}

id __35__GEOComposedString_defaultOptions__block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

- (id)optionsWithArgumentHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[GEOComposedString defaultOptions](self, "defaultOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v5, "arguments", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
  return v6;
}

- (id)stringResultWithOptions:(id)a3
{
  return -[GEOComposedString _stringResultWithOptions:isFinalString:](self, "_stringResultWithOptions:isFinalString:", a3, 1);
}

- (GEOComposedString)stringWithOptions:(id)a3
{
  void *v3;
  void *v4;

  -[GEOComposedString _stringResultWithOptions:isFinalString:](self, "_stringResultWithOptions:isFinalString:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedString *)v4;
}

- (GEOComposedString)stringWithDefaultOptions
{
  void *v3;
  void *v4;
  void *v5;

  -[GEOComposedString defaultOptions](self, "defaultOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedString _stringResultWithOptions:isFinalString:](self, "_stringResultWithOptions:isFinalString:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedString *)v5;
}

- (GEOComposedString)composedStringWithOptions:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  GEOComposedString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSArray *arguments;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  id v42;
  GEOComposedString *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  GEOComposedString *v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  _QWORD *v57;
  _QWORD *v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  _BYTE v68[128];
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
    *((_BYTE *)v4 + 11) = 1;
  v6 = (_QWORD *)objc_opt_new();
  if (objc_msgSend(v5, "shouldUpdateFormatStrings"))
  {
    -[GEOComposedString _stringResultWithOptions:isFinalString:](self, "_stringResultWithOptions:isFinalString:", v5, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {

      v57 = 0;
      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tokenReplacementResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = 0;
      do
      {
        objc_msgSend(v7, "tokenReplacementResults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "success"))
          objc_msgSend(v9, "addIndex:", v12);

        ++v12;
        objc_msgSend(v7, "tokenReplacementResults");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

      }
      while (v12 < v16);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_arguments, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](self->_arguments, "count"))
    {
      v18 = 0;
      do
      {
        if ((objc_msgSend(v9, "containsIndex:", v18) & 1) == 0)
        {
          -[NSArray objectAtIndexedSubscript:](self->_arguments, "objectAtIndexedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v19, "copy");
          objc_msgSend(v17, "addObject:", v20);

        }
        ++v18;
      }
      while (v18 < -[NSArray count](self->_arguments, "count"));
    }
    objc_msgSend(v7, "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v6[1];
    v6[1] = v22;

    v24 = self;
    v25 = (void *)v6[2];
    v6[2] = v17;
    v26 = v17;

    v27 = -[GEOComposedString copy](v24->_alternativeString, "copy");
    v28 = (void *)v6[5];
    v6[5] = v27;

    v29 = -[GEOComposedStringCondition copy](v24->_alternativeStringCondition, "copy");
    v30 = (void *)v6[6];
    v6[6] = v29;

  }
  else
  {
    v59 = v6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](self->_arguments, "count"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    arguments = self->_arguments;
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __47__GEOComposedString_composedStringWithOptions___block_invoke;
    v66[3] = &unk_1E1C0A0F8;
    v7 = v31;
    v67 = v7;
    -[NSArray enumerateObjectsUsingBlock:](arguments, "enumerateObjectsUsingBlock:", v66);
    v60 = v5;
    v61 = (void *)-[NSArray mutableCopy](self->_arguments, "mutableCopy");
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v5, "arguments");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v63 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v38, "token");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            v41 = objc_msgSend(v40, "unsignedIntegerValue");
            if (v41 < -[NSArray count](self->_arguments, "count"))
            {
              v42 = v7;
              v43 = self;
              objc_msgSend(v61, "objectAtIndexedSubscript:", objc_msgSend(v40, "unsignedIntegerValue"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "type");
              if (v45 == objc_msgSend(v38, "type"))
                objc_msgSend(v61, "replaceObjectAtIndex:withObject:", objc_msgSend(v40, "unsignedIntegerValue"), v38);

              self = v43;
              v7 = v42;
            }
          }

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      }
      while (v35);
    }

    v46 = -[NSArray copy](self->_formatStrings, "copy");
    v6 = v59;
    v47 = (void *)v59[1];
    v59[1] = v46;

    v48 = (void *)v59[2];
    v59[2] = v61;
    v49 = self;
    v50 = v61;

    v51 = -[NSArray copy](v49->_separators, "copy");
    v52 = (void *)v59[3];
    v59[3] = v51;

    v53 = -[GEOComposedString copy](v49->_alternativeString, "copy");
    v54 = (void *)v59[5];
    v59[5] = v53;

    v55 = -[GEOComposedStringCondition copy](v49->_alternativeStringCondition, "copy");
    v56 = (void *)v59[6];
    v59[6] = v55;

    *((_BYTE *)v59 + 56) = v49->_isPrivate;
    v9 = v67;
    v5 = v60;
  }

  v57 = v6;
LABEL_30:

  return (GEOComposedString *)v57;
}

void __47__GEOComposedString_composedStringWithOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);
}

- (id)_stringResultWithOptions:(id)a3 isFinalString:(BOOL)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  GEOComposedString *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  GEOComposedStringReplacementResult *v24;
  void *v25;
  GEOComposedStringReplacementResult *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  const char *v47;
  void *v48;
  void *v49;
  const char *v50;
  void *v51;
  SEL v52;
  id v54;
  id v55;
  id v56;
  void *v57;
  BOOL v58;
  GEOComposedString *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[8];
  _QWORD v69[5];
  id v70;
  id v71;
  id v72;
  BOOL v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = 0x1E0C99000uLL;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_formatStrings, "count"));
  if (objc_msgSend(v6, "preserveIndividualComponents"))
  {
    v58 = a4;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_formatStrings, "count"));
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v10 = self;
    v11 = self->_formatStrings;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v75 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
          objc_msgSend(v9, "addObject:", v16);

        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
      }
      while (v13);
    }

    v17 = (void *)objc_msgSend(v9, "copy");
    self = v10;
    v7 = 0x1E0C99000;
    a4 = v58;
  }
  else
  {
    -[GEOComposedString _stringForStrings:joinedBySeparators:](self, "_stringForStrings:joinedBySeparators:", self->_formatStrings, self->_separators);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v9);
      v80 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
  }

  objc_msgSend(v8, "addObjectsFromArray:", v17);
  v19 = (void *)objc_msgSend(objc_alloc(*(Class *)(v7 + 3560)), "initWithCapacity:", objc_msgSend(v17, "count"));
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __60__GEOComposedString__stringResultWithOptions_isFinalString___block_invoke;
  v69[3] = &unk_1E1C0A120;
  v69[4] = self;
  v20 = v6;
  v70 = v20;
  v73 = a4;
  v21 = v8;
  v71 = v21;
  v22 = v19;
  v72 = v22;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v69);
  if (objc_msgSend(v22, "count"))
  {
    if (objc_msgSend(v22, "count") == 1)
    {
      objc_msgSend(v22, "firstObject");
      v24 = (GEOComposedStringReplacementResult *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
    }
    else
    {
      v56 = v20;
      if ((objc_msgSend(v20, "preserveIndividualComponents") & 1) == 0)
      {
        GEOGetGEOComposedStringLog_0();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_FAULT, "Multiple results when we expected to have pre-joined the components and separators", buf, 2u);
        }

      }
      v57 = v17;
      v59 = self;
      v24 = objc_alloc_init(GEOComposedStringReplacementResult);
      v28 = (void *)objc_msgSend(objc_alloc(*(Class *)(v7 + 3560)), "initWithCapacity:", objc_msgSend(v22, "count"));
      v29 = (void *)objc_msgSend(objc_alloc(*(Class *)(v7 + 3560)), "initWithCapacity:", objc_msgSend(v22, "count"));
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v54 = v22;
      v30 = v22;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
      v55 = v21;
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v65;
        v34 = 1;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v65 != v33)
              objc_enumerationMutation(v30);
            v36 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
            if ((v34 & 1) != 0)
              v34 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "success");
            else
              v34 = 0;
            objc_msgSend(v36, "tokenReplacementResults");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObjectsFromArray:", v37);

            objc_msgSend(v36, "styleReplacementResults");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObjectsFromArray:", v38);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
        }
        while (v32);
      }
      else
      {
        v34 = 1;
      }

      if (v24)
        v24->success = v34;
      v39 = (void *)objc_msgSend(v28, "copy");
      -[GEOComposedStringReplacementResult setTokenReplacementResults:]((uint64_t)v24, v39);

      v40 = (void *)objc_msgSend(v29, "copy");
      -[GEOComposedStringReplacementResult setStyleReplacementResults:]((uint64_t)v24, v40);

      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v59->_separators, "count"));
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v41 = v59->_separators;
      v42 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v61;
        do
        {
          for (k = 0; k != v43; ++k)
          {
            if (*(_QWORD *)v61 != v44)
              objc_enumerationMutation(v41);
            v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * k));
            objc_msgSend(v25, "addObject:", v46);

          }
          v43 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
        }
        while (v43);
      }

      v21 = v55;
      -[GEOComposedString _attributedStringForStrings:joinedBySeparators:](v59, "_attributedStringForStrings:joinedBySeparators:", v55, v25);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v54;
      if (v24)
        objc_setProperty_nonatomic_copy(v24, v47, v48, 24);

      -[GEOComposedStringReplacementResult attributedString](v24, "attributedString");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "string");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_setProperty_nonatomic_copy(v24, v50, v51, 16);

      v20 = v56;
      v17 = v57;
    }
    if (v24)
      goto LABEL_49;
  }
  else
  {
    v26 = objc_alloc_init(GEOComposedStringReplacementResult);
    v24 = v26;
    v25 = 0;
    if (v26)
    {
      v26->success = 0;
LABEL_49:
      objc_setProperty_nonatomic_copy(v24, v23, v21, 32);
      objc_setProperty_nonatomic_copy(v24, v52, v25, 40);
    }
  }

  return v24;
}

void __60__GEOComposedString__stringResultWithOptions_isFinalString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_processAttributedString:withOptions:isFinalString:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "success") & 1) == 0)
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(v7, "attributedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "replaceObjectAtIndex:withObject:", a3, v6);

  }
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);

}

- (id)_processAttributedString:(id)a3 withOptions:(id)a4 isFinalString:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t i;
  NSObject *v19;
  GEOComposedString *alternativeString;
  GEOComposedString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  GEOComposedStringReplacementResult *v35;
  void *v36;
  SEL v37;
  SEL v38;
  NSObject *v39;
  GEOComposedStringReplacementResult *v40;
  const char *v41;
  const char *v42;
  void *v43;
  NSArray *obj;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  GEOComposedString *v63;
  _BYTE v64[128];
  uint64_t v65;

  v5 = a5;
  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[GEOComposedString _updateForFormatStylesInString:options:](self, "_updateForFormatStylesInString:options:", v8, v9);
  v10 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v9, "arguments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v47 = v9;
  objc_msgSend(v9, "arguments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v58;
    v17 = 1;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v58 != v16)
          objc_enumerationMutation(v13);
        v17 &= -[GEOComposedString _updateString:withArgument:options:results:isFinalString:](self, "_updateString:withArgument:options:results:isFinalString:", v8, *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i), v47, v12, v5);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v15);

    if (!(v17 | !v5))
    {
      if (self->_alternativeString
        && -[GEOComposedStringCondition conditionType](self->_alternativeStringCondition, "conditionType") == 5)
      {
        GEOGetGEOComposedStringLog_0();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          alternativeString = self->_alternativeString;
          *(_DWORD *)buf = 138412290;
          v63 = alternativeString;
          _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Token replacement failed. Falling back to alternative string: %@", buf, 0xCu);
        }

        v21 = self->_alternativeString;
        -[GEOComposedString defaultOptions](v21, "defaultOptions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOComposedString stringResultWithOptions:](v21, "stringResultWithOptions:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        GEOGetGEOComposedStringLog_0();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v39, OS_LOG_TYPE_ERROR, "Token replacement failed. No alternative string was provided, returning empty string.", buf, 2u);
        }

        v40 = objc_alloc_init(GEOComposedStringReplacementResult);
        v23 = v40;
        if (v40)
        {
          v40->success = 0;
          objc_setProperty_nonatomic_copy(v40, v41, &stru_1E1C241D0, 16);
        }
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E1C241D0);
        if (v23)
          objc_setProperty_nonatomic_copy(v23, v42, v43, 24);

        -[GEOComposedStringReplacementResult setTokenReplacementResults:]((uint64_t)v23, v12);
      }
      goto LABEL_39;
    }
  }
  else
  {

    LOBYTE(v17) = 1;
  }
  if (-[NSArray count](self->_formatStyles, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_formatStyles, "count"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v8, "length");
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = self->_formatStyles;
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v54;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v54 != v27)
            objc_enumerationMutation(obj);
          v29 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v28);
          if (v29)
            v30 = *(void **)(v29 + 16);
          else
            v30 = 0;
          v31 = v30;
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __72__GEOComposedString__processAttributedString_withOptions_isFinalString___block_invoke;
          v48[3] = &unk_1E1C0A148;
          v32 = v8;
          v49 = v32;
          v50 = v31;
          v51 = v29;
          v52 = v46;
          v33 = v31;
          objc_msgSend(v32, "enumerateAttribute:inRange:options:usingBlock:", v33, 0, v24, 0, v48);
          objc_msgSend(v32, "removeAttribute:range:", v33, 0, v24);

          ++v28;
        }
        while (v26 != v28);
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        v26 = v34;
      }
      while (v34);
    }

  }
  else
  {
    v46 = 0;
  }
  v35 = objc_alloc_init(GEOComposedStringReplacementResult);
  v23 = v35;
  if (v35)
  {
    v35->success = v17;
    objc_msgSend(v8, "string");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v23, v37, v36, 16);

    objc_setProperty_nonatomic_copy(v23, v38, v8, 24);
  }
  else
  {
    objc_msgSend(v8, "string");

  }
  -[GEOComposedStringReplacementResult setTokenReplacementResults:]((uint64_t)v23, v12);
  -[GEOComposedStringReplacementResult setStyleReplacementResults:]((uint64_t)v23, v46);

LABEL_39:
  return v23;
}

void __72__GEOComposedString__processAttributedString_withOptions_isFinalString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  SEL v10;
  uint64_t v11;
  id self;

  if (a2)
  {
    self = (id)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringWithRange:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (self)
    {
      objc_setProperty_nonatomic_copy(self, (SEL)self, v8, 16);

      *((_QWORD *)self + 5) = a3;
      *((_QWORD *)self + 6) = a4;
      objc_setProperty_nonatomic_copy(self, v10, *(id *)(a1 + 40), 24);
    }
    else
    {

    }
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
      LODWORD(v11) = *(_DWORD *)(v11 + 8);
    if (self)
      *((_DWORD *)self + 2) = v11;
    objc_msgSend(*(id *)(a1 + 56), "addObject:", self);

  }
}

- (id)_attributedStringForStrings:(id)a3 joinedBySeparators:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 <= objc_msgSend(v6, "count") + 1)
  {
    v10 = objc_msgSend(v5, "count");
    if (v10 < objc_msgSend(v6, "count") + 1)
    {
      GEOGetGEOComposedStringLog_0();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = 67109376;
        v17 = objc_msgSend(v5, "count");
        v18 = 1024;
        v19 = objc_msgSend(v6, "count");
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "Number of attributed strings (%d) is less than number of separators (%d) + 1. Some separators will be ignored.", (uint8_t *)&v16, 0xEu);
      }

    }
    v9 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    if (objc_msgSend(v5, "count"))
    {
      v12 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(v9, "appendAttributedString:", v13);
          if (v12 < objc_msgSend(v5, "count") - 1)
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "appendAttributedString:", v14);

          }
        }

        ++v12;
      }
      while (v12 < objc_msgSend(v5, "count"));
    }
  }
  else
  {
    GEOGetGEOComposedStringLog_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 67109376;
      v17 = objc_msgSend(v5, "count");
      v18 = 1024;
      v19 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Number of attributed strings (%d) is greater than number of separators (%d) + 1. Unable to join attributed strings.", (uint8_t *)&v16, 0xEu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)_stringForStrings:(id)a3 joinedBySeparators:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 <= objc_msgSend(v6, "count") + 1)
  {
    v10 = objc_msgSend(v5, "count");
    if (v10 < objc_msgSend(v6, "count") + 1)
    {
      GEOGetGEOComposedStringLog_0();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        v18 = objc_msgSend(v5, "count");
        v19 = 1024;
        v20 = objc_msgSend(v6, "count");
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "Number of strings (%d) is less than number of separators (%d) + 1. Some separators will be ignored.", buf, 0xEu);
      }

    }
    v9 = (void *)objc_opt_new();
    if (objc_msgSend(v5, "count"))
    {
      v12 = 0;
      do
      {
        v13 = objc_msgSend(v5, "count") - 1;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 >= v13)
        {
          objc_msgSend(v9, "appendString:", v14);
        }
        else
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendFormat:", CFSTR("%@%@"), v14, v15);

        }
        ++v12;
      }
      while (v12 < objc_msgSend(v5, "count"));
    }
  }
  else
  {
    GEOGetGEOComposedStringLog_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v18 = objc_msgSend(v5, "count");
      v19 = 1024;
      v20 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Number of strings (%d) is greater than number of separators (%d) + 1. Unable to join strings.", buf, 0xEu);
    }

    v9 = 0;
  }

  return v9;
}

- (void)_updateForFormatStylesInString:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  GEOServerFormatStyleParser *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  GEOComposedString *v32;
  NSArray *obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  GEOComposedString *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = [GEOServerFormatStyleParser alloc];
    v31 = v6;
    objc_msgSend(v6, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOServerFormatStyleParser initWithString:](v8, "initWithString:", v9);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = self->_formatStyles;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    v30 = (void *)v10;
    if (!v11)
    {
      v13 = 0;
      goto LABEL_31;
    }
    v12 = v11;
    v32 = self;
    v13 = 0;
    v14 = *(_QWORD *)v35;
    while (1)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v15);
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](v32->_formatStyles, "count"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v17 = (void *)objc_opt_new();
        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v16 + 8));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *(_QWORD *)(v16 + 16);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0;
        }
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v19, v30);

        if (!objc_msgSend(v7, "createAttributedString"))
          goto LABEL_20;
        objc_msgSend(v7, "formatStyleHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          GEOGetGEOComposedStringLog_0();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v32;
            _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_FAULT, "No formatStyleHandler was provided for string with format styles:\n%@", buf, 0xCu);
          }

LABEL_20:
          v24 = 0;
          goto LABEL_21;
        }
        objc_msgSend(v7, "formatStyleHandler");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v16)
          v23 = *(unsigned int *)(v16 + 8);
        else
          v23 = 0;
        (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v21, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          objc_msgSend(v17, "addEntriesFromDictionary:", v24);
LABEL_21:
        if (v16)
          v26 = *(_QWORD *)(v16 + 16);
        else
          v26 = 0;
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, v26);

        ++v15;
      }
      while (v12 != v15);
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      v12 = v27;
      if (!v27)
      {
LABEL_31:

        objc_msgSend(v7, "stringAttributes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "attributedStringWithStyleAttributes:defaultAttributes:", v13, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v31;
        objc_msgSend(v31, "setAttributedString:", v29);

        break;
      }
    }
  }

}

- (BOOL)_updateString:(id)a3 withArgument:(id)a4 options:(id)a5 results:(id)a6 isFinalString:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  _BYTE *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  char v25;
  int v26;
  BOOL v27;
  NSObject *v28;
  uint64_t v29;
  __CFString *v30;
  uint64_t v31;
  __CFString *v32;
  void *v33;
  SEL v34;
  _QWORD *v35;
  char v36;
  void *v37;
  BOOL v38;
  NSObject *v39;
  __CFString *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  BOOL v59;
  NSObject *v60;
  void *v61;
  id v62;
  uint8_t buf[4];
  __CFString *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  GEOComposedString *v68;
  uint64_t v69;

  v7 = a7;
  v69 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v62 = a6;
  objc_msgSend(v13, "token");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (!v16)
  {
    GEOGetGEOComposedStringLog_0();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(v13, "type");
      if (v29 < 0x13 && ((0x7FF7Fu >> v29) & 1) != 0)
      {
        v30 = off_1E1C0A1A8[(int)v29];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v29);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543362;
      v64 = v30;
      _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_ERROR, "Error replacing token because argument of type %{public}@ has no token.", buf, 0xCu);

    }
    goto LABEL_50;
  }
  objc_msgSend(v12, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "token");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "rangeOfString:options:range:", v18, 0, 0, objc_msgSend(v12, "length"));
  v21 = v20;

  if (v21)
  {
    objc_msgSend(v12, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (v19 < v23)
    {
      v24 = objc_opt_new();
      v25 = objc_msgSend(v14, "createAttributedString");
      if (v24)
        LOBYTE(v24[1].isa) = v25;
      if (v14 && v14[11])
        v26 = objc_msgSend(v14, "shouldUpdateFormatStrings") ^ 1;
      else
        LOBYTE(v26) = 1;
      v61 = v14;
      if (v24)
      {
        BYTE1(v24[1].isa) = v26;
        objc_msgSend(v12, "attributesAtIndex:effectiveRange:", v19, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setProperty_nonatomic_copy(v24, v34, v33, 16);
      }
      else
      {
        objc_msgSend(v12, "attributesAtIndex:effectiveRange:", v19, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v60 = v24;
      objc_msgSend(v13, "replaceTokenWithOptions:", v24);
      v35 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "success");
      v27 = v36;
      if ((v36 & 1) != 0)
      {
        v59 = v36;
        if ((objc_msgSend(v14, "createAttributedString") & 1) != 0)
        {
          objc_msgSend(v35, "attributedString");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v41 = objc_alloc(MEMORY[0x1E0CB3498]);
          objc_msgSend(v35, "string");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v41, "initWithString:", v42);

        }
        do
        {
          if (objc_msgSend(v61, "createAttributedString"))
          {
            v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v37);
            objc_msgSend(v12, "attributesAtIndex:effectiveRange:", v19, 0);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (v44)
            {
              v45 = objc_msgSend(v43, "length");
              objc_msgSend(v43, "addAttributes:range:", v44, 0, v45);
              objc_msgSend(v13, "stringAttributes");
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (v46)
              {
                objc_msgSend(v13, "stringAttributes");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "addAttributes:range:", v47, 0, v45);

              }
              v48 = v43;

              v37 = v48;
            }

          }
          objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", v19, v21, v37);
          v49 = objc_msgSend(v37, "length");
          objc_msgSend(v35, "range");
          if (v50)
          {
            v51 = objc_msgSend(v35, "copy");

            v35 = (_QWORD *)v51;
          }
          if (v35)
          {
            v35[4] = v19;
            v35[5] = v49;
          }
          objc_msgSend(v62, "addObject:", v35);
          v52 = v49 + v19;
          if (objc_msgSend(v12, "length") >= v52)
            v53 = objc_msgSend(v12, "length") - v52;
          else
            v53 = 0;
          objc_msgSend(v12, "string");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "token");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v54, "rangeOfString:options:range:", v55, 0, v52, v53);
          v21 = v56;

        }
        while (v21);

        v27 = v59;
      }
      else if (v7)
      {
        v38 = v36;
        GEOGetGEOComposedStringLog_0();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "token");
          v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v64 = v40;
          _os_log_impl(&dword_1885A9000, v39, OS_LOG_TYPE_ERROR, "Error replacing token %{public}@ because no override value was provided and it has no default value.", buf, 0xCu);

        }
        v27 = v38;
      }

      v28 = v60;
      v14 = v61;
      goto LABEL_51;
    }
  }
  if ((objc_msgSend(v14, "preserveIndividualComponents") & 1) == 0)
  {
    GEOGetGEOComposedStringLog_0();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      v31 = objc_msgSend(v13, "type");
      if (v31 < 0x13 && ((0x7FF7Fu >> v31) & 1) != 0)
      {
        v32 = off_1E1C0A1A8[(int)v31];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v31);
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "token");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v64 = v32;
      v65 = 2114;
      v66 = v57;
      v67 = 2113;
      v68 = self;
      _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_FAULT, "Error using argument %{public}@ because token %{public}@ was not found in format string: %{private}@", buf, 0x20u);

    }
LABEL_50:
    v27 = 1;
LABEL_51:

    goto LABEL_52;
  }
  v27 = 1;
LABEL_52:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_formatStrings, 1);
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_arguments, 1);
  v8 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v7;

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_separators, 1);
  v10 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v9;

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_formatStyles, 1);
  v12 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v11;

  v13 = -[GEOComposedString copy](self->_alternativeString, "copy");
  v14 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v13;

  v15 = -[GEOComposedStringCondition copy](self->_alternativeStringCondition, "copy");
  v16 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v15;

  *(_BYTE *)(v4 + 56) = self->_isPrivate;
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedString)initWithCoder:(id)a3
{
  id v4;
  GEOComposedString *v5;
  uint64_t v6;
  NSArray *formatStrings;
  uint64_t v8;
  NSArray *arguments;
  uint64_t v10;
  NSArray *separators;
  uint64_t v12;
  NSArray *formatStyles;
  uint64_t v14;
  GEOComposedString *alternativeString;
  uint64_t v16;
  GEOComposedStringCondition *alternativeStringCondition;
  GEOComposedString *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOComposedString;
  v5 = -[GEOComposedString init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_formatStrings"));
    v6 = objc_claimAutoreleasedReturnValue();
    formatStrings = v5->_formatStrings;
    v5->_formatStrings = (NSArray *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_arguments"));
    v8 = objc_claimAutoreleasedReturnValue();
    arguments = v5->_arguments;
    v5->_arguments = (NSArray *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_separators"));
    v10 = objc_claimAutoreleasedReturnValue();
    separators = v5->_separators;
    v5->_separators = (NSArray *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_formatStyles"));
    v12 = objc_claimAutoreleasedReturnValue();
    formatStyles = v5->_formatStyles;
    v5->_formatStyles = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alternativeString"));
    v14 = objc_claimAutoreleasedReturnValue();
    alternativeString = v5->_alternativeString;
    v5->_alternativeString = (GEOComposedString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alternativeStringCondition"));
    v16 = objc_claimAutoreleasedReturnValue();
    alternativeStringCondition = v5->_alternativeStringCondition;
    v5->_alternativeStringCondition = (GEOComposedStringCondition *)v16;

    v5->_isPrivate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isPrivate"));
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *formatStrings;
  id v5;

  formatStrings = self->_formatStrings;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", formatStrings, CFSTR("_formatStrings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arguments, CFSTR("_arguments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_separators, CFSTR("_separators"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formatStyles, CFSTR("_formatStyles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternativeString, CFSTR("_alternativeString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternativeStringCondition, CFSTR("_alternativeStringCondition"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPrivate, CFSTR("_isPrivate"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  int v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  int v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  int v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  _BOOL4 v35;
  BOOL v36;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = (void *)v5[1];
    v7 = self->_formatStrings;
    v8 = v6;
    if (v7 | v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend((id)v7, "isEqual:", v8);

      if (!v10)
        goto LABEL_16;
    }
    v11 = (void *)v5[2];
    v12 = self->_arguments;
    v13 = v11;
    if (v12 | v13)
    {
      v14 = (void *)v13;
      v15 = objc_msgSend((id)v12, "isEqual:", v13);

      if (!v15)
        goto LABEL_16;
    }
    v16 = (void *)v5[3];
    v17 = self->_separators;
    v18 = v16;
    if (v17 | v18)
    {
      v19 = (void *)v18;
      v20 = objc_msgSend((id)v17, "isEqual:", v18);

      if (!v20)
        goto LABEL_16;
    }
    v21 = (void *)v5[4];
    v22 = self->_formatStyles;
    v23 = v21;
    if (v22 | v23)
    {
      v24 = (void *)v23;
      v25 = objc_msgSend((id)v22, "isEqual:", v23);

      if (!v25)
        goto LABEL_16;
    }
    v26 = (void *)v5[5];
    v27 = self->_alternativeString;
    v28 = v26;
    if (v27 | v28)
    {
      v29 = (void *)v28;
      v30 = objc_msgSend((id)v27, "isEqual:", v28);

      if (!v30)
        goto LABEL_16;
    }
    v31 = (void *)v5[6];
    v32 = self->_alternativeStringCondition;
    v33 = v31;
    if (v32 | v33
      && (v34 = (void *)v33, v35 = objc_msgSend((id)v32, "isEqual:", v33),
                             v34,
                             (id)v32,
                             !v35))
    {
LABEL_16:
      v36 = 0;
    }
    else
    {
      v36 = self->_isPrivate == *((unsigned __int8 *)v5 + 56);
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)description
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GEOComposedString;
  -[GEOComposedString description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSArray _geo_map:](self->_formatStrings, "_geo_map:", &__block_literal_global_45_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray _geo_map:](self->_separators, "_geo_map:", &__block_literal_global_48);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedString _stringForStrings:joinedBySeparators:](self, "_stringForStrings:joinedBySeparators:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v4, "appendString:", v8);

  if (-[NSArray count](self->_arguments, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_arguments, "componentsJoinedByString:", CFSTR("\n\t"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\n\t%@"), v9);

  }
  if (-[NSArray count](self->_formatStyles, "count"))
  {
    -[NSArray _geo_map:](self->_formatStyles, "_geo_map:", &__block_literal_global_56);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n\t"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\n\t%@"), v11);

  }
  if (self->_alternativeString)
    objc_msgSend(v4, "appendFormat:", CFSTR("\n\tAlternative: %@"), self->_alternativeString);

  return v4;
}

uint64_t __32__GEOComposedString_description__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), a2);
}

uint64_t __32__GEOComposedString_description__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" \"%@\" "), a2);
}

id __32__GEOComposedString_description__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  unsigned int *v3;
  void *v4;
  id v5;
  __CFString *v6;
  void *v7;

  v2 = a2;
  v3 = (unsigned int *)v2;
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v2)
  {
    v5 = *((id *)v2 + 2);
    v6 = CFSTR("DEFAULT");
    switch(v3[2])
    {
      case 0u:
        break;
      case 1u:
        v6 = CFSTR("REAL_TIME_ON_TIME");
        break;
      case 2u:
        v6 = CFSTR("REAL_TIME_DELAYS");
        break;
      case 3u:
        v6 = CFSTR("CLICKABLE");
        break;
      default:
        objc_msgSend((id)0x1ECCF8BD8, "stringWithFormat:", CFSTR("(unknown: %i)"), v3[2]);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
    v5 = 0;
    v6 = CFSTR("DEFAULT");
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("{s:%@} [GEOFormatStyle_FormatStyleType_%@]"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeStringCondition, 0);
  objc_storeStrong((id *)&self->_alternativeString, 0);
  objc_storeStrong((id *)&self->_formatStyles, 0);
  objc_storeStrong((id *)&self->_separators, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_formatStrings, 0);
}

+ (id)localizationProvider
{
  void *v2;
  id v3;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = (void *)_localizationProvider;
  if (_localizationProvider)
  {
    v3 = (id)_localizationProvider;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "GEOComposedString.localizationProvider must be set before building any strings that require localization.", buf, 2u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _localizationProvider != nil", v5, 2u);
    }
  }
  return v2;
}

+ (void)setLocalizationProvider:(id)a3
{
  id v4;
  uint8_t v5[16];

  v4 = a3;
  if (v4)
  {
    objc_storeStrong((id *)&_localizationProvider, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: localizationProvider != ((void *)0)", v5, 2u);
  }

}

+ (BOOL)hasLocalizationProvider
{
  return _localizationProvider != 0;
}

- (NSArray)arguments
{
  void *v2;

  if (self->_arguments)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_arguments, 1);
  else
    v2 = 0;
  return (NSArray *)v2;
}

@end
