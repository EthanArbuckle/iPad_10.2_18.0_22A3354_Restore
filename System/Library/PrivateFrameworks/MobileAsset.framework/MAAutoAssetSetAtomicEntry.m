@implementation MAAutoAssetSetAtomicEntry

- (MAAutoAssetSetAtomicEntry)initWithFullAssetSelector:(id)a3 withAssetID:(id)a4 withLocalContentURL:(id)a5 withAssetAttributes:(id)a6 inhibitedFromEmergencyRemoval:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MAAutoAssetSetAtomicEntry *v17;
  MAAutoAssetSetAtomicEntry *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetSetAtomicEntry;
  v17 = -[MAAutoAssetSetAtomicEntry init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fullAssetSelector, a3);
    objc_storeStrong((id *)&v18->_assetID, a4);
    objc_storeStrong((id *)&v18->_localContentURL, a5);
    objc_storeStrong((id *)&v18->_assetAttributes, a6);
    v18->_inhibitedFromEmergencyRemoval = a7;
  }

  return v18;
}

- (MAAutoAssetSetAtomicEntry)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetAtomicEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  MAAutoAssetSelector *fullAssetSelector;
  uint64_t v11;
  NSString *assetID;
  uint64_t v13;
  NSURL *localContentURL;
  uint64_t v15;
  NSDictionary *assetAttributes;
  objc_super v18;
  _QWORD v19[9];

  v19[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MAAutoAssetSetAtomicEntry;
  v5 = -[MAAutoAssetSetAtomicEntry init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v19[5] = objc_opt_class();
    v19[6] = objc_opt_class();
    v19[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAssetSelector"));
    v9 = objc_claimAutoreleasedReturnValue();
    fullAssetSelector = v5->_fullAssetSelector;
    v5->_fullAssetSelector = (MAAutoAssetSelector *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetID"));
    v11 = objc_claimAutoreleasedReturnValue();
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localContentURL"));
    v13 = objc_claimAutoreleasedReturnValue();
    localContentURL = v5->_localContentURL;
    v5->_localContentURL = (NSURL *)v13;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("assetAttributes"));
    v15 = objc_claimAutoreleasedReturnValue();
    assetAttributes = v5->_assetAttributes;
    v5->_assetAttributes = (NSDictionary *)v15;

    v5->_inhibitedFromEmergencyRemoval = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inhibitedFromEmergencyRemoval"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MAAutoAssetSetAtomicEntry fullAssetSelector](self, "fullAssetSelector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("fullAssetSelector"));

  -[MAAutoAssetSetAtomicEntry assetID](self, "assetID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("assetID"));

  -[MAAutoAssetSetAtomicEntry localContentURL](self, "localContentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("localContentURL"));

  -[MAAutoAssetSetAtomicEntry assetAttributes](self, "assetAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("assetAttributes"));

  objc_msgSend(v8, "encodeBool:forKey:", -[MAAutoAssetSetAtomicEntry inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval"), CFSTR("inhibitedFromEmergencyRemoval"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  MAAutoAssetSetAtomicEntry *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MAAutoAssetSetAtomicEntry *v8;

  v3 = [MAAutoAssetSetAtomicEntry alloc];
  -[MAAutoAssetSetAtomicEntry fullAssetSelector](self, "fullAssetSelector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetAtomicEntry assetID](self, "assetID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetAtomicEntry localContentURL](self, "localContentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetAtomicEntry assetAttributes](self, "assetAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MAAutoAssetSetAtomicEntry initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:](v3, "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:", v4, v5, v6, v7, -[MAAutoAssetSetAtomicEntry inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval"));

  return v8;
}

- (id)summary
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetAtomicEntry fullAssetSelector](self, "fullAssetSelector");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[MAAutoAssetSetAtomicEntry fullAssetSelector](self, "fullAssetSelector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "summary");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("N");
  }
  -[MAAutoAssetSetAtomicEntry assetID](self, "assetID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MAAutoAssetSetAtomicEntry assetID](self, "assetID");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("N");
  }
  -[MAAutoAssetSetAtomicEntry localContentURL](self, "localContentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  -[MAAutoAssetSetAtomicEntry assetAttributes](self, "assetAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  if (-[MAAutoAssetSetAtomicEntry inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval"))
    v10 = CFSTR("Y");
  else
    v10 = CFSTR("N");
  objc_msgSend(v14, "stringWithFormat:", CFSTR("fullAssetSelector:%@|assetID:%@|localContentURL:%@|assetAttributes:%@|inhibitedFromEmergencyRemoval:%@"), v3, v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  if (v15)
  {

  }
  return v11;
}

- (MAAutoAssetSelector)fullAssetSelector
{
  return self->_fullAssetSelector;
}

- (NSString)assetID
{
  return self->_assetID;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetAttributes, 0);
  objc_storeStrong((id *)&self->_localContentURL, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_fullAssetSelector, 0);
}

@end
