@implementation MAAutoAssetSetLock

- (id)initForSelector:(id)a3 withLocalContentURL:(id)a4 withAssetAttributes:(id)a5
{
  id v9;
  id v10;
  id v11;
  MAAutoAssetSetLock *v12;
  MAAutoAssetSetLock *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *lockReasons;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MAAutoAssetSetLock;
  v12 = -[MAAutoAssetSetLock init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fullAssetSelector, a3);
    objc_storeStrong((id *)&v13->_localContentURL, a4);
    objc_storeStrong((id *)&v13->_assetAttributes, a5);
    v13->_inhibitedFromEmergencyRemoval = 0;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lockReasons = v13->_lockReasons;
    v13->_lockReasons = v14;

  }
  return v13;
}

- (MAAutoAssetSetLock)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetLock *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  MAAutoAssetSelector *fullAssetSelector;
  uint64_t v11;
  NSURL *localContentURL;
  uint64_t v13;
  NSMutableDictionary *lockReasons;
  objc_super v16;
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MAAutoAssetSetLock;
  v5 = -[MAAutoAssetSetLock init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    v17[5] = objc_opt_class();
    v17[6] = objc_opt_class();
    v17[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAssetSelector"));
    v9 = objc_claimAutoreleasedReturnValue();
    fullAssetSelector = v5->_fullAssetSelector;
    v5->_fullAssetSelector = (MAAutoAssetSelector *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localContentURL"));
    v11 = objc_claimAutoreleasedReturnValue();
    localContentURL = v5->_localContentURL;
    v5->_localContentURL = (NSURL *)v11;

    v5->_inhibitedFromEmergencyRemoval = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inhibitedFromEmergencyRemoval"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("lockReasons"));
    v13 = objc_claimAutoreleasedReturnValue();
    lockReasons = v5->_lockReasons;
    v5->_lockReasons = (NSMutableDictionary *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MAAutoAssetSetLock fullAssetSelector](self, "fullAssetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fullAssetSelector"));

  -[MAAutoAssetSetLock localContentURL](self, "localContentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localContentURL"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetLock inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval"), CFSTR("inhibitedFromEmergencyRemoval"));
  -[MAAutoAssetSetLock lockReasons](self, "lockReasons");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("lockReasons"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetLock fullAssetSelector](self, "fullAssetSelector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetLock localContentURL](self, "localContentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetLock assetAttributes](self, "assetAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MAAutoAssetSetLock inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval"))
    v10 = CFSTR("Y");
  else
    v10 = CFSTR("N");
  -[MAAutoAssetSetLock lockReasons](self, "lockReasons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("selector:%@|localURL:%@|attributes:%@|inhibitedRemoval:%@|reasons:%@"), v5, v7, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (MAAutoAssetSelector)fullAssetSelector
{
  return self->_fullAssetSelector;
}

- (NSURL)localContentURL
{
  return self->_localContentURL;
}

- (NSDictionary)assetAttributes
{
  return self->_assetAttributes;
}

- (BOOL)inhibitedFromEmergencyRemoval
{
  return self->_inhibitedFromEmergencyRemoval;
}

- (void)setInhibitedFromEmergencyRemoval:(BOOL)a3
{
  self->_inhibitedFromEmergencyRemoval = a3;
}

- (NSMutableDictionary)lockReasons
{
  return self->_lockReasons;
}

- (void)setLockReasons:(id)a3
{
  objc_storeStrong((id *)&self->_lockReasons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockReasons, 0);
  objc_storeStrong((id *)&self->_assetAttributes, 0);
  objc_storeStrong((id *)&self->_localContentURL, 0);
  objc_storeStrong((id *)&self->_fullAssetSelector, 0);
}

@end
