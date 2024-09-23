@implementation BRLTTable

- (BRLTTable)initWithIdentifier:(id)a3
{
  id v4;
  BRLTTable *v5;
  uint64_t v6;
  NSString *serviceIdentifier;
  uint64_t v8;
  NSString *language;
  uint64_t v10;
  NSString *variant;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRLTTable;
  v5 = -[BRLTTable init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "brl_serviceIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "brl_language");
    v8 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v8;

    objc_msgSend(v4, "brl_variant");
    v10 = objc_claimAutoreleasedReturnValue();
    variant = v5->_variant;
    v5->_variant = (NSString *)v10;

  }
  return v5;
}

- (BRLTTable)initWithServiceIdentifier:(id)a3 tableIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BRLTTable *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "brl_language");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "brl_variant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[BRLTTable initWithServiceIdentifier:language:variant:](self, "initWithServiceIdentifier:language:variant:", v7, v8, v9);
  return v10;
}

- (BRLTTable)initWithServiceIdentifier:(id)a3 language:(id)a4 variant:(id)a5
{
  id v8;
  id v9;
  id v10;
  BRLTTable *v11;
  uint64_t v12;
  NSString *serviceIdentifier;
  uint64_t v14;
  NSString *language;
  uint64_t v16;
  NSString *variant;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BRLTTable;
  v11 = -[BRLTTable init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    serviceIdentifier = v11->_serviceIdentifier;
    v11->_serviceIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    language = v11->_language;
    v11->_language = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    variant = v11->_variant;
    v11->_variant = (NSString *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BRLTTable *v4;
  void *v5;

  v4 = -[BRLTTable initWithServiceIdentifier:language:variant:](+[BRLTTable allocWithZone:](BRLTTable, "allocWithZone:", a3), "initWithServiceIdentifier:language:variant:", self->_serviceIdentifier, self->_language, self->_variant);
  -[BRLTTable _bundle](self, "_bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTable set_bundle:](v4, "set_bundle:", v5);

  return v4;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BRLTTable serviceIdentifier](self, "serviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTable language](self, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRLTTable variant](self, "variant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[BRLTTable variant](self, "variant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("-%@"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  return (NSString *)v6;
}

- (NSString)tableIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[BRLTTable language](self, "language");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTable variant](self, "variant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BRLTTable variant](self, "variant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("-%@"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return (NSString *)v3;
}

- (NSString)localizedName
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[BRLTTable _brailleTableDictionary](self, "_brailleTableDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("identifierIsLanguage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    -[BRLTTable tableIdentifier](self, "tableIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BRLTLocalizedNameForLanguage(v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v7;
    goto LABEL_7;
  }
  -[BRLTTable localizedVariant](self, "localizedVariant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[BRLTTable localizedLanguage](self, "localizedLanguage");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  BRLTLocalizedStringForKey(CFSTR("table.name.with.variant"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTable localizedLanguage](self, "localizedLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v9, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return (NSString *)v11;
}

- (NSString)localizedNameWithService
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  -[BRLTTable _brailleTableDictionary](self, "_brailleTableDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("identifierIsLanguage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    BRLTLocalizedStringForKey(CFSTR("table.name.with.service"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRLTTable tableIdentifier](self, "tableIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    BRLTLocalizedNameForLanguage(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRLTTable localizedService](self, "localizedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v9, v10, v15);
  }
  else
  {
    -[BRLTTable localizedVariant](self, "localizedVariant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    if (v7)
    {
      BRLTLocalizedStringForKey(CFSTR("table.name.with.variant.and.service"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRLTTable localizedLanguage](self, "localizedLanguage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRLTTable localizedService](self, "localizedService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v7;
      v15 = v10;
    }
    else
    {
      BRLTLocalizedStringForKey(CFSTR("table.name.with.service"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRLTTable localizedLanguage](self, "localizedLanguage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRLTTable localizedService](self, "localizedService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v10;
    }
    objc_msgSend(v11, "localizedStringWithFormat:", v8, v9, v14, v15);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)localizedService
{
  void *v2;
  void *v3;

  -[BRLTTable serviceIdentifier](self, "serviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BRLTLocalizedStringForKey(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[BRLTTable _bundle](self, "_bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedInfoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTable language](self, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {
    -[BRLTTable language](self, "language");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BRLTLocalizedNameForLanguage(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    BRLTLocalizedStringForKey(v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  return (NSString *)v6;
}

- (NSString)localizedVariant
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;

  -[BRLTTable variant](self, "variant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    goto LABEL_11;
  if (!_os_feature_enabled_impl())
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("_"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRLTTable variant](self, "variant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "rangeOfCharacterFromSet:options:", v15, 4);

    -[BRLTTable variant](self, "variant");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = 0;
    }
    else
    {
      -[BRLTTable variant](self, "variant");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "substringToIndex:", v17);
      v21 = objc_claimAutoreleasedReturnValue();

      -[BRLTTable variant](self, "variant");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "substringFromIndex:", v17 + 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)v21;
    }
    v23 = (void *)MEMORY[0x24BDD17C8];
    -[BRLTTable language](self, "language");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@.%@.variant"), v24, v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    BRLTLocalizedStringForKey(v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("g1")))
    {
      v26 = (void *)MEMORY[0x24BDD17C8];
      v27 = CFSTR("variant.name.g1");
    }
    else if (objc_msgSend(v19, "isEqualToString:", CFSTR("g2")))
    {
      v26 = (void *)MEMORY[0x24BDD17C8];
      v27 = CFSTR("variant.name.g2");
    }
    else if (objc_msgSend(v19, "isEqualToString:", CFSTR("8dot")))
    {
      v26 = (void *)MEMORY[0x24BDD17C8];
      v27 = CFSTR("variant.name.8dot");
    }
    else
    {
      if (!objc_msgSend(v19, "isEqualToString:", CFSTR("computer")))
      {
LABEL_24:

        return (NSString *)v12;
      }
      v26 = (void *)MEMORY[0x24BDD17C8];
      v27 = CFSTR("variant.name.computer");
    }
    BRLTLocalizedStringForKey(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", v28, v12);
    v29 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v29;
    goto LABEL_24;
  }
  -[BRLTTable variant](self, "variant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("g1"));

  if (!v6)
  {
    -[BRLTTable variant](self, "variant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("g2"));

    if (v9)
    {
      v7 = CFSTR("variant.g2");
      goto LABEL_9;
    }
    -[BRLTTable variant](self, "variant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("8dot"));

    if (v11)
    {
      v7 = CFSTR("variant.8dot");
      goto LABEL_9;
    }
    -[BRLTTable variant](self, "variant");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("6dot"));

    if ((v14 & 1) != 0)
    {
LABEL_11:
      v12 = 0;
      return (NSString *)v12;
    }
    goto LABEL_12;
  }
  v7 = CFSTR("variant.g1");
LABEL_9:
  BRLTLocalizedStringForKey(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v12;
}

- (BOOL)supportsTranslationModeContracted
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  char v7;

  -[BRLTTable _brailleTableDictionary](self, "_brailleTableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("supportsContraction"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v7 = objc_msgSend(v4, "BOOLValue");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)supportsTranslationMode8Dot
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  char v7;

  -[BRLTTable _brailleTableDictionary](self, "_brailleTableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("supports8dot"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v7 = objc_msgSend(v4, "BOOLValue");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)replacements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
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
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[BRLTTable _brailleTableDictionary](self, "_brailleTableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("replacements"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v20 = v3;
      v7 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("."));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v19 = v4;
      v9 = v4;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            if (objc_msgSend(v14, "rangeOfCharacterFromSet:options:", v8, 4) == 0x7FFFFFFFFFFFFFFFLL)
            {
              v15 = (void *)MEMORY[0x24BDD17C8];
              -[BRLTTable serviceIdentifier](self, "serviceIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "stringWithFormat:", CFSTR("%@.%@"), v16, v14);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v17);

            }
            else
            {
              objc_msgSend(v7, "addObject:", v14);
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v11);
      }

      v4 = v19;
      v3 = v20;
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return (NSArray *)v7;
}

- (BOOL)isCustomBrailleTable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  char v7;

  -[BRLTTable _brailleTableDictionary](self, "_brailleTableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("customBraille"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v7 = objc_msgSend(v4, "BOOLValue");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)supportsTranslationByCell
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  char v7;

  -[BRLTTable _brailleTableDictionary](self, "_brailleTableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("supportsTranslationByCell"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v7 = objc_msgSend(v4, "BOOLValue");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)candidateSelectionLanguage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  __CFString *v7;

  -[BRLTTable _brailleTableDictionary](self, "_brailleTableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("candidateSelectionLanguage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v7 = v4;
    else
      v7 = &stru_24CBF1330;

  }
  else
  {
    v7 = &stru_24CBF1330;
  }

  return (NSString *)v7;
}

- (id)_brailleTableDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  char v13;
  id v14;

  -[BRLTTable _bundle](self, "_bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTable identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v5, "length") + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("BrailleTables"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (v7)
    {
      objc_msgSend(v8, "objectForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) == 0)
      {
        v14 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v11 = 0;
    }
    v14 = v11;
    v11 = v14;
    goto LABEL_11;
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (NSBundle)_bundle
{
  NSBundle *bundle;
  NSBundle **p_bundle;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_bundle = &self->_bundle;
  bundle = self->_bundle;
  if (!bundle)
  {
    +[BRLTTableEnumerator tableEnumeratorWithSystemBundlePath](BRLTTableEnumerator, "tableEnumeratorWithSystemBundlePath");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "translatorBundles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRLTTable serviceIdentifier](self, "serviceIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if (v13)
          {
            objc_storeStrong((id *)p_bundle, v10);
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    bundle = *p_bundle;
  }
  return bundle;
}

- (BOOL)_isEqualToTable:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  -[BRLTTable serviceIdentifier](self, "serviceIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6 && !objc_msgSend((id)v5, "isEqualToString:", v6))
  {
    v11 = 0;
  }
  else
  {
    -[BRLTTable language](self, "language");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "language");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 | v8 && !objc_msgSend((id)v7, "isEqualToString:", v8))
    {
      v11 = 0;
    }
    else
    {
      -[BRLTTable variant](self, "variant");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "variant");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v9 | v10)
        v11 = objc_msgSend((id)v9, "isEqualToString:", v10);
      else
        v11 = 1;

    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRLTTable;
  if (-[BRLTTable isEqual:](&v7, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[BRLTTable _isEqualToTable:](self, "_isEqualToTable:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[BRLTTable identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)BRLTTable;
  -[BRLTTable description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTable serviceIdentifier](self, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTable language](self, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTable variant](self, "variant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ service:%@ lang:%@ variant:%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)set_bundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)variant
{
  return self->_variant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
