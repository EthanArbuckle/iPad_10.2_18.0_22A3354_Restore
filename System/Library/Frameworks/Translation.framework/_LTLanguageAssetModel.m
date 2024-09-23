@implementation _LTLanguageAssetModel

- (NSLocale)locale
{
  NSLocale *locale;
  NSLocale *v4;
  NSLocale *v5;

  locale = self->_locale;
  if (!locale)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "lt_localeWithLTIdentifier:", self->_ltIdentifier);
    v4 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    v5 = self->_locale;
    self->_locale = v4;

    locale = self->_locale;
  }
  return locale;
}

- (NSString)displayName
{
  NSString *displayName;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  displayName = self->_displayName;
  if (!displayName)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTLanguageAssetModel locale](self, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "localizedStringForLanguageCode:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "capitalizedStringWithLocale:", v4);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_displayName;
    self->_displayName = v8;

    displayName = self->_displayName;
  }
  return displayName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LTLanguageAssetModel)initWithLocale:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  _LTLanguageAssetModel *v8;
  uint64_t v9;
  NSString *ltIdentifier;
  _LTLanguageAssetModel *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_LTLanguageAssetModel;
  v8 = -[_LTLanguageAssetModel init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "_ltLocaleIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    ltIdentifier = v8->_ltIdentifier;
    v8->_ltIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_progress, a4);
    v11 = v8;
  }

  return v8;
}

- (_LTLanguageAssetModel)initWithLocale:(id)a3 state:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _LTLanguageAssetModel *v9;

  v6 = a3;
  objc_msgSend(v6, "_ltLocaleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LTAssetProgress discreteProgressWithIdentifier:offlineState:](_LTAssetProgress, "discreteProgressWithIdentifier:offlineState:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[_LTLanguageAssetModel initWithLocale:progress:](self, "initWithLocale:progress:", v6, v8);
  return v9;
}

- (_LTLanguageAssetModel)initWithLocale:(id)a3
{
  return -[_LTLanguageAssetModel initWithLocale:state:](self, "initWithLocale:state:", a3, 0);
}

- (_LTLanguageAssetModel)initWithInstallationStatus:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _LTLanguageAssetModel *v9;

  v4 = (void *)MEMORY[0x24BDBCEA0];
  v5 = a3;
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeWithLocaleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "offlineState");
  v9 = -[_LTLanguageAssetModel initWithLocale:state:](self, "initWithLocale:state:", v7, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *ltIdentifier;
  id v5;

  ltIdentifier = self->_ltIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", ltIdentifier, CFSTR("ltIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_progress, CFSTR("progress"));

}

- (_LTLanguageAssetModel)initWithCoder:(id)a3
{
  id v4;
  _LTLanguageAssetModel *v5;
  uint64_t v6;
  NSString *ltIdentifier;
  uint64_t v8;
  _LTAssetProgress *progress;
  _LTLanguageAssetModel *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTLanguageAssetModel;
  v5 = -[_LTLanguageAssetModel init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ltIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    ltIdentifier = v5->_ltIdentifier;
    v5->_ltIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("progress"));
    v8 = objc_claimAutoreleasedReturnValue();
    progress = v5->_progress;
    v5->_progress = (_LTAssetProgress *)v8;

    v10 = v5;
  }

  return v5;
}

- (NSString)identifierForDownloads
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_LTLanguageAssetModel ltIdentifier](self, "ltIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTLanguageAssetModel progress](self, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LTOfflineStateString(objc_msgSend(v5, "offlineState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int64_t)state
{
  void *v2;
  int64_t v3;

  -[_LTLanguageAssetModel progress](self, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "offlineState");

  return v3;
}

- (_LTLanguageInstallationStatus)installationStatus
{
  _LTLanguageInstallationStatus *v3;
  void *v4;
  void *v5;
  void *v6;
  _LTLanguageInstallationStatus *v7;

  v3 = [_LTLanguageInstallationStatus alloc];
  -[_LTLanguageAssetModel locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ltLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTLanguageAssetModel progress](self, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_LTLanguageInstallationStatus initWithLocaleIdentifier:progress:](v3, "initWithLocaleIdentifier:progress:", v5, v6);

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_LTLanguageAssetModel ltIdentifier](self, "ltIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_LTLanguageAssetModel ltIdentifier](self, "ltIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ltIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[_LTLanguageAssetModel displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_LTLanguageAssetModel ltIdentifier](self, "ltIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LTOfflineStateString(-[_LTLanguageAssetModel state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTLanguageAssetModel progress](self, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (_LTAssetProgress)progress
{
  return self->_progress;
}

- (NSString)ltIdentifier
{
  return self->_ltIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ltIdentifier, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
