@implementation HMDLegacyModelContainer

- (HMDLegacyModelContainer)initWithDataVersion:(id)a3 legacyDataVersion:(id)a4 pairingIdentity:(id)a5
{
  id v9;
  HMDLegacyModelContainer *v10;
  HMDLegacyModelContainer *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDLegacyModelContainer;
  v10 = -[HMBModelContainer initWithDataVersion:legacyDataVersion:](&v13, sel_initWithDataVersion_legacyDataVersion_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_pairingIdentity, a5);

  return v11;
}

- (Class)modelClassForTypeName:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  Class v7;
  void *v8;
  void *v9;
  HMDLegacyModelContainer *v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  int v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameToClassTransform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (Class)objc_msgSend(v6, "objectForKey:", v4);

  if (!v7)
  {
    -[HMBModelContainer nameToClassTransform](self, "nameToClassTransform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (Class)objc_msgSend(v8, "objectForKey:", v4);

    if (!v7)
    {
      v7 = NSClassFromString(v4);
      if (!v7)
      {
        v9 = (void *)MEMORY[0x227676638]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543618;
          v16 = v12;
          v17 = 2112;
          v18 = v4;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to translate type name %@ to class", (uint8_t *)&v15, 0x16u);

        }
        objc_autoreleasePoolPop(v9);
      }
    }
  }
  v13 = v7;

  return v13;
}

- (id)modelFromData:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 type:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMDLegacyModelContainer *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDLegacyModelContainer *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  if (!objc_msgSend(v12, "length"))
    goto LABEL_17;
  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x24BE4ECA8], "decodeAsOPACK:error:", v12, a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 1)
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v23;
        v30 = 2048;
        v31 = a4;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot deserialize from unknown encoding: %lu", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      if (a7)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
        v24 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
LABEL_17:
      v24 = 0;
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x24BE4ECA8], "decodeAsNSDictionary:error:", v12, a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  if (!v14)
    goto LABEL_17;
  if (!v13)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("_t"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v19;
        v30 = 2112;
        v31 = (unint64_t)v15;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine type for model %@", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      if (a7)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
        v13 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
    }
  }
  v25 = -[HMDLegacyModelContainer modelClassForTypeName:](self, "modelClassForTypeName:", v13);
  if (-[objc_class isSubclassOfClass:](v25, "isSubclassOfClass:", objc_opt_class()))
  {
    -[HMBModelContainer modelFromDictionary:storageLocation:typeName:error:](self, "modelFromDictionary:storageLocation:typeName:error:", v15, a5, v13, a7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((-[objc_class isSubclassOfClass:](v25, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
      _HMFPreconditionFailure();
    NSStringFromClass(+[HMDLegacyV4Model hmbModelClassForHMDModelClass:](HMDLegacyV4Model, "hmbModelClassForHMDModelClass:", v25));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModelContainer modelFromDictionary:storageLocation:typeName:error:](self, "modelFromDictionary:storageLocation:typeName:error:", v15, a5, v26, a7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_24:

  return v24;
}

- (id)decryptData:(id)a3 decompress:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v6 = a4;
  v8 = a3;
  -[HMDLegacyModelContainer pairingIdentity](self, "pairingIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "privateKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDPersistentStore decryptData:withKey:error:](HMDPersistentStore, "decryptData:withKey:error:", v8, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v12, "hmbUncompress");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v12;
  }
  v14 = v13;

  return v14;
}

- (id)encryptData:(id)a3 compress:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "hmbCompress");
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  -[HMDLegacyModelContainer pairingIdentity](self, "pairingIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "privateKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDPersistentStore encryptData:withKey:error:](HMDPersistentStore, "encryptData:withKey:error:", v9, v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  HMDLegacyModelContainer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDLegacyModelContainer;
  v4 = -[HMBModelContainer copyWithZone:](&v9, sel_copyWithZone_, a3);
  if (self)
  {
    -[HMDLegacyModelContainer pairingIdentity](self, "pairingIdentity");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[12];
    v4[12] = v5;

  }
  v7 = self;

  return v7;
}

- (id)encodePropertyValue:(id)a3 forProperty:(id)a4 field:(id)a5 storageLocation:(unint64_t)a6 error:(id *)a7
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_25576DB50) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, a7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = objc_opt_class();

    objc_msgSend(v12, "stringWithFormat:", CFSTR("Cannot encode value of type %@ for property '%@' because it does not conform to NSSecureCoding"), v13, v9);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (a7)
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BE3EBB0];
      v20 = CFSTR("message");
      v21[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 3, v18);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = 0;
  }

  return v11;
}

- (id)decodePropertyValueFromData:(id)a3 forProperty:(id)a4 field:(id)a5 storageLocation:(unint64_t)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend((id)objc_msgSend(v12, "classObj"), "conformsToProtocol:", &unk_25576DB50) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_msgSend(v12, "classObj"), v10, a7);
    a7 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a7)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BE3EBB0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("should conform to NSSecureCoding (but storage class for property %@ does not)"), v11, CFSTR("message"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 3, v16);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    a7 = 0;
  }

  return a7;
}

- (HMFPairingIdentity)pairingIdentity
{
  return self->_pairingIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
}

@end
