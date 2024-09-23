@implementation _LTLanguageInstallationStatus

- (_LTLanguageInstallationStatus)initWithLocaleIdentifier:(id)a3 progress:(id)a4
{
  id v7;
  id v8;
  _LTLanguageInstallationStatus *v9;
  _LTLanguageInstallationStatus *v10;
  _LTLanguageInstallationStatus *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_LTLanguageInstallationStatus;
  v9 = -[_LTLanguageInstallationStatus init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localeIdentifier, a3);
    objc_storeStrong((id *)&v10->_progress, a4);
    v11 = v10;
  }

  return v10;
}

- (_LTLanguageInstallationStatus)initWithLocaleIdentifier:(id)a3 offlineState:(int64_t)a4
{
  id v6;
  void *v7;
  _LTLanguageInstallationStatus *v8;

  v6 = a3;
  +[_LTAssetProgress discreteProgressWithIdentifier:offlineState:](_LTAssetProgress, "discreteProgressWithIdentifier:offlineState:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_LTLanguageInstallationStatus initWithLocaleIdentifier:progress:](self, "initWithLocaleIdentifier:progress:", v6, v7);

  return v8;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  NSString *localeIdentifier;
  void *v6;
  void *v7;

  if (-[_LTLanguageInstallationStatus offlineState](self, "offlineState") == 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), self->_progress);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_250695360;
  }
  v4 = (void *)MEMORY[0x24BDD17C8];
  localeIdentifier = self->_localeIdentifier;
  _LTOfflineStateString(-[_LTLanguageInstallationStatus offlineState](self, "offlineState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@ %@"), localeIdentifier, v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localeIdentifier;
  id v5;

  localeIdentifier = self->_localeIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localeIdentifier, CFSTR("localeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_progress, CFSTR("progress"));

}

- (_LTLanguageInstallationStatus)initWithCoder:(id)a3
{
  id v4;
  _LTLanguageInstallationStatus *v5;
  uint64_t v6;
  NSString *localeIdentifier;
  uint64_t v8;
  _LTAssetProgress *progress;
  _LTLanguageInstallationStatus *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTLanguageInstallationStatus;
  v5 = -[_LTLanguageInstallationStatus init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("progress"));
    v8 = objc_claimAutoreleasedReturnValue();
    progress = v5->_progress;
    v5->_progress = (_LTAssetProgress *)v8;

    v10 = v5;
  }

  return v5;
}

- (int64_t)offlineState
{
  void *v2;
  int64_t v3;

  -[_LTLanguageInstallationStatus progress](self, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "offlineState");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_LTAssetProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end
