@implementation HMCHIPHome

- (HMCHIPHome)initWithIdentifier:(id)a3 index:(id)a4 name:(id)a5 ecosystem:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMCHIPHome *v15;
  uint64_t v16;
  NSNumber *identifier;
  uint64_t v18;
  NSNumber *index;
  uint64_t v20;
  NSString *name;
  uint64_t v22;
  HMCHIPEcosystem *ecosystem;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSUUID *UUID;
  HMCHIPHome *v33;
  SEL v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;
  uint64_t v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_11:
    v33 = (HMCHIPHome *)_HMFPreconditionFailure();
    return -[HMCHIPHome initWithIdentifier:name:ecosystem:](v33, v34, v35, v36, v37);
  }
  v38.receiver = self;
  v38.super_class = (Class)HMCHIPHome;
  v15 = -[HMCHIPHome init](&v38, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v10, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSNumber *)v16;

    v18 = objc_msgSend(v11, "copy");
    index = v15->_index;
    v15->_index = (NSNumber *)v18;

    v20 = objc_msgSend(v12, "copy");
    name = v15->_name;
    v15->_name = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    ecosystem = v15->_ecosystem;
    v15->_ecosystem = (HMCHIPEcosystem *)v22;

    v24 = v14;
    v25 = v10;
    objc_opt_self();
    v26 = objc_msgSend(v25, "integerValue");

    v39 = v26;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v39, 8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v24, "UUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "hmf_UUIDWithNamespace:data:", v29, v27);
    v30 = objc_claimAutoreleasedReturnValue();

    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v30;

  }
  return v15;
}

- (HMCHIPHome)initWithIdentifier:(id)a3 name:(id)a4 ecosystem:(id)a5
{
  return -[HMCHIPHome initWithIdentifier:index:name:ecosystem:](self, "initWithIdentifier:index:name:ecosystem:", a3, &unk_1E3B2E848, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMCHIPHome identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToNumber:", v8))
    {
      -[HMCHIPHome index](self, "index");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "index");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToNumber:", v10))
      {
        -[HMCHIPHome name](self, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {
          -[HMCHIPHome ecosystem](self, "ecosystem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "ecosystem");
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
  void *v2;
  unint64_t v3;

  -[HMCHIPHome identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableCHIPHome *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMMutableCHIPHome *v9;

  v4 = +[HMMutableCHIPHome allocWithZone:](HMMutableCHIPHome, "allocWithZone:", a3);
  -[HMCHIPHome identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPHome index](self, "index");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPHome name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPHome ecosystem](self, "ecosystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMCHIPHome initWithIdentifier:index:name:ecosystem:](v4, "initWithIdentifier:index:name:ecosystem:", v5, v6, v7, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMCHIPHome identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMCH.ck.identifier"));

  -[HMCHIPHome index](self, "index");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMCH.ck.index"));

  -[HMCHIPHome name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMCH.ck.name"));

  -[HMCHIPHome ecosystem](self, "ecosystem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMCH.ck.ecosystem"));

}

- (HMCHIPHome)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v13;
  NSObject *v14;
  void *v15;
  HMCHIPHome *v16;
  HMCHIPHome *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCH.ck.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCH.ck.index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCH.ck.name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCH.ck.ecosystem"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 1;
  if (v10 || v7 == 0 || v8 == 0)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544386;
      v20 = v15;
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v7;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded identifier: %@ index: %@ name: %@ ecosystem: %@", (uint8_t *)&v19, 0x34u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = 0;
  }
  else
  {
    v16 = -[HMCHIPHome initWithIdentifier:index:name:ecosystem:](self, "initWithIdentifier:index:name:ecosystem:", v5, v6, v7, v8);
    v17 = v16;
  }

  return v17;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPHome identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Identifier"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPHome index](self, "index");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Index"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPHome name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Name"), v11);
  objc_msgSend(v3, "addObject:", v12);

  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPHome ecosystem](self, "ecosystem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Ecosystem"), v14);
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v16;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (HMCHIPEcosystem)ecosystem
{
  return (HMCHIPEcosystem *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecosystem, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
