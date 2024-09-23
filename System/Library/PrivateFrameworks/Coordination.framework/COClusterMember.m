@implementation COClusterMember

+ (id)memberForCurrentDevice
{
  void *v2;
  COClusterMember *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("legacyIdentifier");
  v6[0] = &stru_24CD40EB0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[COClusterMember initWithType:deviceMetadata:]([COClusterMember alloc], "initWithType:deviceMetadata:", 1, v2);

  return v3;
}

- (COClusterMember)initWithHomeKitIdentifier:(id)a3
{
  id v4;
  COClusterMember *v5;
  COClusterMember *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *deviceMetadata;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COClusterMember;
  v5 = -[COClusterMember init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_memberType = 3;
    v12 = CFSTR("accessory");
    objc_msgSend(v4, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    deviceMetadata = v6->_deviceMetadata;
    v6->_deviceMetadata = (NSDictionary *)v8;

  }
  return v6;
}

- (COClusterMember)initWithType:(unint64_t)a3 deviceMetadata:(id)a4
{
  id v6;
  COClusterMember *v7;
  COClusterMember *v8;
  uint64_t v9;
  NSDictionary *deviceMetadata;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COClusterMember;
  v7 = -[COClusterMember init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_memberType = a3;
    v9 = objc_msgSend(v6, "copy");
    deviceMetadata = v8->_deviceMetadata;
    v8->_deviceMetadata = (NSDictionary *)v9;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  -[COClusterMember deviceMetadata](self, "deviceMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", &stru_24CD40EB0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p, type = %lu, metadata=%@>"), v10, self, -[COClusterMember memberType](self, "memberType"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)IDSIdentifier
{
  void *v2;
  void *v3;

  -[COClusterMember deviceMetadata](self, "deviceMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("IDS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)homeKitIdentifier
{
  void *v2;
  void *v3;

  -[COClusterMember deviceMetadata](self, "deviceMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("accessory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  COClusterMember *v4;
  BOOL v5;

  v4 = (COClusterMember *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[COClusterMember isEqualToMember:](self, "isEqualToMember:", v4);
  }

  return v5;
}

- (BOOL)isEqualToMember:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;

  v4 = a3;
  v5 = -[COClusterMember memberType](self, "memberType");
  if (v5 == objc_msgSend(v4, "memberType"))
  {
    -[COClusterMember deviceMetadata](self, "deviceMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = -[COClusterMember isStale](self, "isStale");
      v9 = v8 ^ objc_msgSend(v4, "isStale") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)isSameDeviceAsMember:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[COClusterMember deviceMetadata](self, "deviceMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[COClusterMember deviceMetadata](self, "deviceMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (COClusterMember)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  COClusterMember *v19;
  COClusterMember *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const __CFString *v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("deviceMetadata")))
  {
    v22 = v5;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("deviceMetadata"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      v13 = 1;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            v13 = 0;

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v11);
    }
    else
    {
      v13 = 1;
    }

    v18 = v13 & 1;
    v5 = v22;
  }
  else
  {
    if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("identifier")))
    {
      v9 = 0;
      v19 = 0;
      goto LABEL_24;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = v16 != 0;
    if (v16)
    {
      v27 = CFSTR("legacyIdentifier");
      v28 = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  v19 = 0;
  if (v18 && v9)
  {
    self = -[COClusterMember initWithType:deviceMetadata:](self, "initWithType:deviceMetadata:", objc_msgSend(v5, "unsignedIntegerValue"), v9);
    v19 = self;
  }
LABEL_24:
  v20 = v19;

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[COClusterMember memberType](self, "memberType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("type"));
  -[COClusterMember deviceMetadata](self, "deviceMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("deviceMetadata"));

  -[COClusterMember deviceMetadata](self, "deviceMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("legacyIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("identifier"));

}

- (unint64_t)memberType
{
  return self->_memberType;
}

- (BOOL)isStale
{
  return self->_stale;
}

- (void)setStale:(BOOL)a3
{
  self->_stale = a3;
}

- (NSDictionary)deviceMetadata
{
  return self->_deviceMetadata;
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
}

@end
