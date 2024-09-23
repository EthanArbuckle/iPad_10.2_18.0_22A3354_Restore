@implementation DDSAssetQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

- (DDSAssetQuery)initWithAssetType:(id)a3 filter:(id)a4
{
  return -[DDSAssetQuery initWithAssetType:filter:localOnly:installedOnly:latestOnly:cachedOnly:](self, "initWithAssetType:filter:localOnly:installedOnly:latestOnly:cachedOnly:", a3, a4, 1, 1, 1, 0);
}

- (DDSAssetQuery)initWithAssetType:(id)a3 filter:(id)a4 localOnly:(BOOL)a5 installedOnly:(BOOL)a6 latestOnly:(BOOL)a7 cachedOnly:(BOOL)a8
{
  id v15;
  id v16;
  DDSAssetQuery *v17;
  DDSAssetQuery *v18;
  objc_super v20;

  v15 = a3;
  v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DDSAssetQuery;
  v17 = -[DDSAssetQuery init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_assetType, a3);
    objc_storeStrong((id *)&v18->_filter, a4);
    v18->_localOnly = a5;
    v18->_latestOnly = a7;
    v18->_installedOnly = a6;
    v18->_cachedOnly = a8;
  }

  return v18;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->_cachedOnly = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[DDSAssetQuery assetType](self, "assetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DDSAssetQuery localOnly](self, "localOnly");
  v6 = -[DDSAssetQuery installedOnly](self, "installedOnly");
  v7 = -[DDSAssetQuery latestOnly](self, "latestOnly");
  v8 = -[DDSAssetQuery cachedOnly](self, "cachedOnly");
  -[DDSAssetQuery filter](self, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<query: %@, locO: %d, iO: %d, latO: %d, cO: %d, %@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)cachedOnly
{
  return self->_cachedOnly;
}

- (NSString)cacheKey
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[DDSAssetQuery assetType](self, "assetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DDSAssetQuery installedOnly](self, "installedOnly");
  v6 = -[DDSAssetQuery latestOnly](self, "latestOnly");
  v7 = -[DDSAssetQuery localOnly](self, "localOnly");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[DDSAssetQuery filter](self, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "hash"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%d-%d-%d-%@"), v4, v5, v6, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (DDSAttributeFilter)filter
{
  return self->_filter;
}

- (BOOL)latestOnly
{
  return self->_latestOnly;
}

- (BOOL)installedOnly
{
  return self->_installedOnly;
}

- (BOOL)localOnly
{
  return self->_localOnly;
}

- (void)setLocalOnly:(BOOL)a3
{
  self->_localOnly = a3;
}

- (void)setInstalledOnly:(BOOL)a3
{
  self->_installedOnly = a3;
}

- (DDSAssetQuery)init
{

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[DDSAssetQuery assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_assetType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[DDSAssetQuery filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_filter);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DDSAssetQuery localOnly](self, "localOnly"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localOnly);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DDSAssetQuery installedOnly](self, "installedOnly"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_installedOnly);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DDSAssetQuery latestOnly](self, "latestOnly"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_latestOnly);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DDSAssetQuery cachedOnly](self, "cachedOnly"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_cachedOnly);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, v15);

}

- (DDSAssetQuery)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  DDSAssetQuery *v27;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_assetType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_filter);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_localOnly);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  v15 = objc_opt_class();
  NSStringFromSelector(sel_installedOnly);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  v19 = objc_opt_class();
  NSStringFromSelector(sel_latestOnly);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  v23 = objc_opt_class();
  NSStringFromSelector(sel_cachedOnly);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "BOOLValue");
  v27 = -[DDSAssetQuery initWithAssetType:filter:localOnly:installedOnly:latestOnly:cachedOnly:](self, "initWithAssetType:filter:localOnly:installedOnly:latestOnly:cachedOnly:", v7, v10, v14, v18, v22, v26);

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dumpDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  if (DDS_IS_INTERNAL_INSTALL())
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[DDSAssetQuery filter](self, "filter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dumpDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSAssetQuery assetType](self, "assetType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n(%@, localOnly: %d, installedOnly: %d, latestOnly: %d, cacheOnly: %d)>"), v5, v6, -[DDSAssetQuery localOnly](self, "localOnly"), -[DDSAssetQuery installedOnly](self, "installedOnly"), -[DDSAssetQuery latestOnly](self, "latestOnly"), -[DDSAssetQuery cachedOnly](self, "cachedOnly"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1EA1420B0;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[DDSAssetQuery isEqualToAssetQuery:](self, "isEqualToAssetQuery:", v4);

  return v5;
}

- (BOOL)isEqualToAssetQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _BOOL4 v14;

  v4 = a3;
  -[DDSAssetQuery assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    -[DDSAssetQuery filter](self, "filter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (DDSObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8)
      && (v9 = -[DDSAssetQuery localOnly](self, "localOnly"), v9 == objc_msgSend(v4, "localOnly"))
      && (v10 = -[DDSAssetQuery installedOnly](self, "installedOnly"),
          v10 == objc_msgSend(v4, "installedOnly"))
      && (v11 = -[DDSAssetQuery latestOnly](self, "latestOnly"), v11 == objc_msgSend(v4, "latestOnly")))
    {
      v14 = -[DDSAssetQuery cachedOnly](self, "cachedOnly");
      v12 = v14 ^ objc_msgSend(v4, "cachedOnly") ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  -[DDSAssetQuery assetType](self, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DDSAssetQuery filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  if (-[DDSAssetQuery localOnly](self, "localOnly"))
    v7 = 1231;
  else
    v7 = 1237;
  v8 = v6 ^ v7;
  if (-[DDSAssetQuery installedOnly](self, "installedOnly"))
    v9 = 1231;
  else
    v9 = 1237;
  if (-[DDSAssetQuery latestOnly](self, "latestOnly"))
    v10 = 1231;
  else
    v10 = 1237;
  v11 = v8 ^ v9 ^ v10;
  if (-[DDSAssetQuery cachedOnly](self, "cachedOnly"))
    v12 = 1231;
  else
    v12 = 1237;
  v13 = v11 ^ v12;

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DDSAssetQuery *v4;
  void *v5;
  void *v6;
  DDSAssetQuery *v7;

  v4 = [DDSAssetQuery alloc];
  -[DDSAssetQuery assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSAssetQuery filter](self, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DDSAssetQuery initWithAssetType:filter:](v4, "initWithAssetType:filter:", v5, v6);

  -[DDSAssetQuery setInstalledOnly:](v7, "setInstalledOnly:", -[DDSAssetQuery installedOnly](self, "installedOnly"));
  -[DDSAssetQuery setLocalOnly:](v7, "setLocalOnly:", -[DDSAssetQuery localOnly](self, "localOnly"));
  -[DDSAssetQuery setLatestOnly:](v7, "setLatestOnly:", -[DDSAssetQuery latestOnly](self, "latestOnly"));
  -[DDSAssetQuery setCachedOnly:](v7, "setCachedOnly:", -[DDSAssetQuery cachedOnly](self, "cachedOnly"));
  return v7;
}

- (void)setLatestOnly:(BOOL)a3
{
  self->_latestOnly = a3;
}

@end
