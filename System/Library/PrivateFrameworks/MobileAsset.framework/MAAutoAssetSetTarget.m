@implementation MAAutoAssetSetTarget

- (id)initForMinTargetOSVersion:(id)a3 toMaxTargetOSVersion:(id)a4 asEntriesWhenTargeting:(id)a5
{
  id v9;
  id v10;
  id v11;
  MAAutoAssetSetTarget *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MAAutoAssetSetTarget;
  v12 = -[MAAutoAssetSetTarget init](&v15, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_minTargetOSVersion, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (MAAutoAssetSetTarget)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetTarget *v5;
  uint64_t v6;
  NSString *minTargetOSVersion;
  uint64_t v8;
  NSString *maxTargetOSVersion;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *autoAssetEntries;
  objc_super v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MAAutoAssetSetTarget;
  v5 = -[MAAutoAssetSetTarget init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minTargetOSVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    minTargetOSVersion = v5->_minTargetOSVersion;
    v5->_minTargetOSVersion = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxTargetOSVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    maxTargetOSVersion = v5->_maxTargetOSVersion;
    v5->_maxTargetOSVersion = (NSString *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("autoAssetEntries"));
    v13 = objc_claimAutoreleasedReturnValue();
    autoAssetEntries = v5->_autoAssetEntries;
    v5->_autoAssetEntries = (NSArray *)v13;

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
  -[MAAutoAssetSetTarget minTargetOSVersion](self, "minTargetOSVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("minTargetOSVersion"));

  -[MAAutoAssetSetTarget maxTargetOSVersion](self, "maxTargetOSVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("maxTargetOSVersion"));

  -[MAAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("autoAssetEntries"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  MAAutoAssetSetTarget *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = [MAAutoAssetSetTarget alloc];
  -[MAAutoAssetSetTarget minTargetOSVersion](self, "minTargetOSVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetTarget maxTargetOSVersion](self, "maxTargetOSVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MAAutoAssetSetTarget initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:](v3, "initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:", v4, v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  MAAutoAssetSetTarget *v4;
  MAAutoAssetSetTarget *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;

  v4 = (MAAutoAssetSetTarget *)a3;
  if (v4 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MAAutoAssetSetTarget minTargetOSVersion](self, "minTargetOSVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
LABEL_21:

        goto LABEL_22;
      }
      -[MAAutoAssetSetTarget maxTargetOSVersion](self, "maxTargetOSVersion");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        -[MAAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = (void *)MEMORY[0x1E0DA8920];
          -[MAAutoAssetSetTarget minTargetOSVersion](self, "minTargetOSVersion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MAAutoAssetSetTarget minTargetOSVersion](v5, "minTargetOSVersion");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "stringIsEqual:to:", v12, v13))
          {
            v29 = (void *)MEMORY[0x1E0DA8920];
            -[MAAutoAssetSetTarget maxTargetOSVersion](self, "maxTargetOSVersion");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[MAAutoAssetSetTarget maxTargetOSVersion](v5, "maxTargetOSVersion");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v29;
            v30 = v14;
            if (objc_msgSend(v16, "stringIsEqual:to:", v14, v15))
            {
              -[MAAutoAssetSetTarget autoAssetEntries](v5, "autoAssetEntries");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                -[MAAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "count");

                -[MAAutoAssetSetTarget autoAssetEntries](v5, "autoAssetEntries");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "count");

                if (v21 == v19)
                {
                  v22 = 0;
                  v23 = v19 & ~(v19 >> 63);
                  do
                  {
                    LOBYTE(v6) = v23 == v22;
                    if (v23 == v22)
                      break;
                    -[MAAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "objectAtIndex:", v22);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    -[MAAutoAssetSetTarget autoAssetEntries](v5, "autoAssetEntries");
                    v26 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend((id)v26, "objectAtIndex:", v22);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();

                    ++v22;
                    LOBYTE(v26) = objc_msgSend(v27, "isEqual:", v25);

                  }
                  while ((v26 & 1) != 0);
                  goto LABEL_21;
                }
              }
              goto LABEL_20;
            }

          }
        }

      }
LABEL_20:
      LOBYTE(v6) = 0;
      goto LABEL_21;
    }
    LOBYTE(v6) = 0;
  }
LABEL_22:

  return (char)v6;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetTarget minTargetOSVersion](self, "minTargetOSVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetTarget maxTargetOSVersion](self, "maxTargetOSVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetTarget autoAssetEntries](self, "autoAssetEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("targetOSVersion:%@..%@|autoAssetEntries:%ld"), v4, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)minTargetOSVersion
{
  return self->_minTargetOSVersion;
}

- (void)setMinTargetOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_minTargetOSVersion, a3);
}

- (NSString)maxTargetOSVersion
{
  return self->_maxTargetOSVersion;
}

- (void)setMaxTargetOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_maxTargetOSVersion, a3);
}

- (NSArray)autoAssetEntries
{
  return self->_autoAssetEntries;
}

- (void)setAutoAssetEntries:(id)a3
{
  objc_storeStrong((id *)&self->_autoAssetEntries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoAssetEntries, 0);
  objc_storeStrong((id *)&self->_maxTargetOSVersion, 0);
  objc_storeStrong((id *)&self->_minTargetOSVersion, 0);
}

@end
