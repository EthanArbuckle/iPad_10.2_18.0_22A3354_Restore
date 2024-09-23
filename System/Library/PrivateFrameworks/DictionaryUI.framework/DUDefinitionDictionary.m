@implementation DUDefinitionDictionary

- (DUDefinitionDictionary)initWithAsset:(id)a3
{
  id v5;
  DUDefinitionDictionary *v6;
  DUDefinitionDictionary *v7;
  void *v8;
  uint64_t v9;
  NSString *definitionLanguage;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DUDefinitionDictionary;
  v6 = -[DUDefinitionDictionary init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rawAsset, a3);
    -[MAAsset attributes](v7->_rawAsset, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("Language"));
    v9 = objc_claimAutoreleasedReturnValue();
    definitionLanguage = v7->_definitionLanguage;
    v7->_definitionLanguage = (NSString *)v9;

    if (-[MAAsset wasLocal](v7->_rawAsset, "wasLocal"))
    {
      -[MAAsset attributes](v7->_rawAsset, "attributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAsset getLocalFileUrl](v7->_rawAsset, "getLocalFileUrl");
      v7->_dictionary = (__DCSDictionary *)DCSDictionaryCreateWithAssetAttributes();

      v7->_activated = 0;
    }
    -[MAAsset attributes](v7->_rawAsset, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DictionaryPackageName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[DUDefinitionDictionary setIsAppleDictionary:](v7, "setIsAppleDictionary:", objc_msgSend(v13, "isEqualToString:", CFSTR("Apple Dictionary.dictionary")));
    -[DUDefinitionDictionary setIsTTYDictionary:](v7, "setIsTTYDictionary:", objc_msgSend(v13, "isEqualToString:", CFSTR("TTY Abbreviations Dictionary.dictionary")));

  }
  return v7;
}

- (void)dealloc
{
  __DCSDictionary *dictionary;
  objc_super v4;

  dictionary = self->_dictionary;
  if (dictionary)
  {
    CFRelease(dictionary);
    self->_dictionary = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DUDefinitionDictionary;
  -[DUDefinitionDictionary dealloc](&v4, sel_dealloc);
}

- (void)setAssetToUpgrade:(id)a3
{
  objc_storeStrong((id *)&self->_assetToUpgrade, a3);
}

- (NSString)localizedLanguageName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  -[MAAsset attributes](self->_rawAsset, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("IndexLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_class();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayNameForLanguageIdentifier:context:", v5, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "count") == 1)
    {
      v7 = v6;
    }
    else if (objc_msgSend(v3, "count") == 2)
    {
      v8 = (void *)objc_opt_class();
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayNameForLanguageIdentifier:context:", v9, 5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v6, v10);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (NSString)localizedSortName
{
  void *v3;

  if (-[DUDefinitionDictionary isAppleDictionary](self, "isAppleDictionary")
    || -[DUDefinitionDictionary isTTYDictionary](self, "isTTYDictionary"))
  {
    -[DUDefinitionDictionary localizedDictionaryName](self, "localizedDictionaryName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DUDefinitionDictionary localizedLanguageName](self, "localizedLanguageName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)localizedDictionaryName
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v8;
  uint64_t v9;

  if (-[DUDefinitionDictionary isAppleDictionary](self, "isAppleDictionary"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("Apple Dictionary");
LABEL_5:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24ED102A8, CFSTR("DictionaryUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (-[DUDefinitionDictionary isTTYDictionary](self, "isTTYDictionary"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("TTY Dictionary");
    goto LABEL_5;
  }
  -[MAAsset attributes](self->_rawAsset, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("DictionaryPackageDisplayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("DictionaryPackageName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByDeletingPathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(v6, "length"))
  {
    -[DUDefinitionDictionary localizedLanguageName](self, "localizedLanguageName");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
LABEL_6:

  return (NSString *)v6;
}

+ (id)displayNameForLanguageIdentifier:(id)a3 context:(int64_t)a4
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = displayNameForLanguageIdentifier_context____onceToken;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&displayNameForLanguageIdentifier_context____onceToken, &__block_literal_global);
  objc_msgSend((id)displayNameForLanguageIdentifier_context____displayLocale, "localizedStringForLanguage:context:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __67__DUDefinitionDictionary_displayNameForLanguageIdentifier_context___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredLocalizations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "canonicalLanguageIdentifierFromString:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", v6);
  v5 = (void *)displayNameForLanguageIdentifier_context____displayLocale;
  displayNameForLanguageIdentifier_context____displayLocale = v4;

}

- (BOOL)_hasDefinitionForTerm:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  __DCSDictionary *dictionary;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 >= 0xFA)
    v6 = 250;
  else
    v6 = v5;
  objc_msgSend(v4, "substringToIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  dictionary = self->_dictionary;
  if (dictionary)
  {
    objc_msgSend(v7, "length");
    LOBYTE(dictionary) = DCSHasDefinitionForTerm() != 0;
  }

  return (char)dictionary;
}

- (id)_definitionValueForTerm:(id)a3
{
  id v4;
  DUDefinitionValue *v5;

  v4 = a3;
  v5 = -[DUDefinitionValue initWithDefinitionDictionary:term:]([DUDefinitionValue alloc], "initWithDefinitionDictionary:term:", self, v4);

  -[DUDefinitionValue setRawAsset:](v5, "setRawAsset:", self->_rawAsset);
  return v5;
}

- (void)setActivated:(BOOL)a3
{
  MAAsset *assetToUpgrade;
  MAAsset *v5;

  self->_activated = a3;
  if (!a3)
  {
    assetToUpgrade = self->_assetToUpgrade;
    if (assetToUpgrade)
    {
      objc_storeStrong((id *)&self->_rawAsset, assetToUpgrade);
      v5 = self->_assetToUpgrade;
      self->_assetToUpgrade = 0;

    }
  }
}

- (BOOL)needsDownloadNewerVersion
{
  MAAsset *assetToUpgrade;
  uint64_t v4;

  assetToUpgrade = self->_assetToUpgrade;
  if (assetToUpgrade)
    LOBYTE(assetToUpgrade) = self->_rawAsset == assetToUpgrade
                          || (v4 = -[MAAsset _contentVersion](assetToUpgrade, "_contentVersion"),
                              v4 > -[MAAsset _contentVersion](self->_rawAsset, "_contentVersion"))
                          || -[MAAsset state](self->_rawAsset, "state") == 3;
  return (char)assetToUpgrade;
}

- (__DCSDictionary)dictionaryRef
{
  return self->_dictionary;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DUDefinitionDictionary localizedDictionaryName](self, "localizedDictionaryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DUDefinitionDictionary activated](self, "activated");
  v8 = CFSTR("inactive");
  if (v7)
    v8 = CFSTR("active");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p>: Dictionary name: %@ (%@), Asset: %@"), v5, self, v6, v8, self->_rawAsset);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MAAsset)rawAsset
{
  return (MAAsset *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)definitionLanguage
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)activated
{
  return self->_activated;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (BOOL)isAppleDictionary
{
  return self->_isAppleDictionary;
}

- (void)setIsAppleDictionary:(BOOL)a3
{
  self->_isAppleDictionary = a3;
}

- (BOOL)isTTYDictionary
{
  return self->_isTTYDictionary;
}

- (void)setIsTTYDictionary:(BOOL)a3
{
  self->_isTTYDictionary = a3;
}

- (int64_t)preferredOrder
{
  return self->_preferredOrder;
}

- (void)setPreferredOrder:(int64_t)a3
{
  self->_preferredOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionLanguage, 0);
  objc_storeStrong((id *)&self->_rawAsset, 0);
  objc_storeStrong((id *)&self->_assetToUpgrade, 0);
}

@end
