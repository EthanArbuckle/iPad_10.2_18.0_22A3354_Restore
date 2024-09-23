@implementation HMDHAPAccessoryAdvertisement

- (HMDHAPAccessoryAdvertisement)initWithIdentifier:(id)a3 name:(id)a4 categoryIdentifier:(id)a5 pairingPresent:(BOOL)a6 setupHash:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDHAPAccessoryAdvertisement *v22;
  objc_super v24;

  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "categoryForIdentifier:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(v15, "categoryForOther");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_alloc(MEMORY[0x1E0CBA1D8]);
  objc_msgSend(v16, "uuidStr");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "catDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithType:name:", v18, v19);

  objc_msgSend(MEMORY[0x1E0CBA4E0], "cachedInstanceForHMAccessoryCategory:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v24.receiver = self;
  v24.super_class = (Class)HMDHAPAccessoryAdvertisement;
  v22 = -[HMDAccessoryAdvertisement initWithIdentifier:name:category:](&v24, sel_initWithIdentifier_name_category_, v14, v13, v21);

  return v22;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)HMDHAPAccessoryAdvertisement;
  -[HMDAccessoryAdvertisement description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryAdvertisement pairingPresent](self, "pairingPresent");
  HMFBooleanToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryAdvertisement setupHash](self, "setupHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[ %@, pairingPresent: %@, setupHash = %@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMDAccessoryAdvertisement identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMDHAPAccessoryAdvertisement setupHash](self, "setupHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMDHAPAccessoryAdvertisement *v4;
  HMDHAPAccessoryAdvertisement *v5;
  HMDHAPAccessoryAdvertisement *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMDHAPAccessoryAdvertisement *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDAccessoryAdvertisement identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryAdvertisement identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[HMDHAPAccessoryAdvertisement setupHash](self, "setupHash");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHAPAccessoryAdvertisement setupHash](v6, "setupHash");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (BOOL)pairingPresent
{
  return self->_pairingPresent;
}

- (NSData)setupHash
{
  return self->_setupHash;
}

- (void)setSetupHash:(id)a3
{
  objc_storeStrong((id *)&self->_setupHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupHash, 0);
}

@end
