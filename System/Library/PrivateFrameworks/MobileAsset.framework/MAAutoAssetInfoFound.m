@implementation MAAutoAssetInfoFound

- (id)initForSelector:(id)a3 withLocalContentURL:(id)a4 withAssetAttributes:(id)a5 reportingStatus:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MAAutoAssetInfoFound *v15;
  id *p_isa;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MAAutoAssetInfoFound;
  v15 = -[MAAutoAssetInfoFound init](&v18, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fullAssetSelector, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (MAAutoAssetInfoFound)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetInfoFound *v5;
  uint64_t v6;
  MAAutoAssetSelector *fullAssetSelector;
  uint64_t v8;
  NSURL *localContentURL;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *assetAttributes;
  uint64_t v15;
  MAAutoAssetStatus *currentStatus;
  objc_super v18;
  _QWORD v19[14];

  v19[13] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MAAutoAssetInfoFound;
  v5 = -[MAAutoAssetInfoFound init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAssetSelector"));
    v6 = objc_claimAutoreleasedReturnValue();
    fullAssetSelector = v5->_fullAssetSelector;
    v5->_fullAssetSelector = (MAAutoAssetSelector *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localContentURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    localContentURL = v5->_localContentURL;
    v5->_localContentURL = (NSURL *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v19[5] = objc_opt_class();
    v19[6] = objc_opt_class();
    v19[7] = objc_opt_class();
    v19[8] = objc_opt_class();
    v19[9] = objc_opt_class();
    v19[10] = objc_opt_class();
    v19[11] = objc_opt_class();
    v19[12] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("assetAttributes"));
    v13 = objc_claimAutoreleasedReturnValue();
    assetAttributes = v5->_assetAttributes;
    v5->_assetAttributes = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentStatus"));
    v15 = objc_claimAutoreleasedReturnValue();
    currentStatus = v5->_currentStatus;
    v5->_currentStatus = (MAAutoAssetStatus *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MAAutoAssetInfoFound fullAssetSelector](self, "fullAssetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fullAssetSelector"));

  -[MAAutoAssetInfoFound localContentURL](self, "localContentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localContentURL"));

  -[MAAutoAssetInfoFound assetAttributes](self, "assetAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("assetAttributes"));

  -[MAAutoAssetInfoFound currentStatus](self, "currentStatus");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("currentStatus"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetInfoFound summary](self, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetInfoFound assetAttributes](self, "assetAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|attribs:\n%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)summary
{
  void *v2;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  -[MAAutoAssetInfoFound assetAttributes](self, "assetAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("(w/attribs)");
  if (!v4)
    v5 = &stru_1E5D5F930;
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetInfoFound fullAssetSelector](self, "fullAssetSelector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "summary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetInfoFound localContentURL](self, "localContentURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[MAAutoAssetInfoFound localContentURL](self, "localContentURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "path");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("none");
  }
  -[MAAutoAssetInfoFound currentStatus](self, "currentStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "summary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("found(%@)|URL:%@|%@%@"), v9, v11, v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {

  }
  return v14;
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

- (MAAutoAssetStatus)currentStatus
{
  return self->_currentStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStatus, 0);
  objc_storeStrong((id *)&self->_assetAttributes, 0);
  objc_storeStrong((id *)&self->_localContentURL, 0);
  objc_storeStrong((id *)&self->_fullAssetSelector, 0);
}

@end
