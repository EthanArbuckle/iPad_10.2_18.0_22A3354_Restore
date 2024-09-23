@implementation GKCompatibilityEntryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_374[0] != -1)
    dispatch_once(secureCodedPropertyKeys_onceToken_374, &__block_literal_global_375);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_373;
}

void __55__GKCompatibilityEntryInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, CFSTR("bundleID"), CFSTR("adamID"), CFSTR("platform"), CFSTR("versions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v3;
  v10[4] = CFSTR("shortVersions");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_373;
  secureCodedPropertyKeys_sSecureCodedKeys_373 = v8;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKCompatibilityEntryInternal bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[GKCompatibilityEntryInternal adamID](self, "adamID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "adamID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToNumber:", v9)
        && (v10 = -[GKCompatibilityEntryInternal platform](self, "platform"), v10 == objc_msgSend(v5, "platform")))
      {
        -[GKCompatibilityEntryInternal versions](self, "versions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "versions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          -[GKCompatibilityEntryInternal shortVersions](self, "shortVersions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "shortVersions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v16, "isEqual:", v13);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKCompatibilityEntryInternal bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCompatibilityEntryInternal versions](self, "versions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_adamID, a3);
}

- (int64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(int64_t)a3
{
  self->_platform = a3;
}

- (NSSet)versions
{
  return self->_versions;
}

- (void)setVersions:(id)a3
{
  objc_storeStrong((id *)&self->_versions, a3);
}

- (NSSet)shortVersions
{
  return self->_shortVersions;
}

- (void)setShortVersions:(id)a3
{
  objc_storeStrong((id *)&self->_shortVersions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortVersions, 0);
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
