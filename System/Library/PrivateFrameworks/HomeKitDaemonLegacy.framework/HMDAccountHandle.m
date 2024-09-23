@implementation HMDAccountHandle

- (HMDAccountHandle)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDAccountHandle)initWithURI:(id)a3
{
  return -[HMDAccountHandle initWithURI:local:](self, "initWithURI:local:", a3, 0);
}

- (HMDAccountHandle)initWithURI:(id)a3 local:(BOOL)a4
{
  id v6;
  HMDAccountHandle *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSUUID *identifier;
  uint64_t v16;
  IDSURI *URI;
  HMDAccountHandle *v18;
  objc_super v20;

  v6 = a3;
  if (v6)
  {
    v20.receiver = self;
    v20.super_class = (Class)HMDAccountHandle;
    v7 = -[HMDAccountHandle init](&v20, sel_init);
    if (v7)
    {
      v8 = __identifierForURI_onceToken;
      v9 = v6;
      if (v8 != -1)
        dispatch_once(&__identifierForURI_onceToken, &__block_literal_global_197_73818);
      v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v11 = __identifierForURI_namespace;
      objc_msgSend(v9, "prefixedURI");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "dataUsingEncoding:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "initWithNamespace:data:", v11, v13);

      identifier = v7->_identifier;
      v7->_identifier = (NSUUID *)v14;

      v16 = objc_msgSend(v9, "copy");
      URI = v7->_URI;
      v7->_URI = (IDSURI *)v16;

      v7->_local = a4;
    }
    self = v7;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSString)value
{
  void *v2;
  void *v3;

  -[HMDAccountHandle URI](self, "URI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unprefixedURI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccountHandle URI](self, "URI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccountHandle *v4;
  HMDAccountHandle *v5;
  HMDAccountHandle *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDAccountHandle *)a3;
  if (self == v4)
  {
    v9 = 1;
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
      -[HMDAccountHandle URI](self, "URI");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccountHandle URI](v6, "URI");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToURI:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountHandle identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccountHandle identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("ID"), v5);
  v21[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  v8 = -[HMDAccountHandle type](self, "type");
  v9 = CFSTR("Unknown");
  if (v8 == 2)
    v9 = CFSTR("Phone");
  if (v8 == 1)
    v10 = CFSTR("Email");
  else
    v10 = v9;
  v11 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("TP"), v10);
  v21[1] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccountHandle isLocal](self, "isLocal");
  HMFBooleanToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("LC"), v13);
  v21[2] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccountHandle value](self, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithName:value:options:formatter:", CFSTR("VA"), v16, 0, v17);
  v21[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (int64_t)type
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  int v9;

  -[HMDAccountHandle URI](self, "URI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unprefixedURI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_appearsToBeEmail");

  if ((v5 & 1) != 0)
    return 1;
  -[HMDAccountHandle URI](self, "URI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unprefixedURI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_appearsToBePhoneNumber");

  if (v9)
    return 2;
  else
    return 0;
}

- (CNContact)contact
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__73788;
  v9 = __Block_byref_object_dispose__73789;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__HMDAccountHandle_contact__block_invoke;
  v4[3] = &unk_1E89C0800;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend(MEMORY[0x1E0D28540], "activityWithName:parent:options:block:", CFSTR("Account.Contact"), 0, 1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CNContact *)v2;
}

- (CKUserIdentityLookupInfo)cloudKitLookupInfo
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = -[HMDAccountHandle type](self, "type");
  if (v3 == 2)
  {
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForObjectValue:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95218]), "initWithPhoneNumber:", v5);
      goto LABEL_7;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  if (v3 == 1)
  {
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForObjectValue:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95218]), "initWithEmailAddress:", v5);
LABEL_7:
      v8 = (void *)v6;
LABEL_10:

      return (CKUserIdentityLookupInfo *)v8;
    }
    goto LABEL_9;
  }
  v8 = 0;
  return (CKUserIdentityLookupInfo *)v8;
}

- (HMDAccountHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDAccountHandle *v6;
  uint64_t v7;
  NSUUID *modelParentIdentifier;
  uint64_t v9;
  void *modelIdentifier;
  uint64_t v11;
  NSUUID *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMD.URI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDAccountHandle initWithURI:local:](self, "initWithURI:local:", v5, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMD.local")));
  if (v6)
  {
    v6->_locallyTracked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMD.locallyTracked"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMD.modelParentIdentifier")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMD.modelParentIdentifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      modelParentIdentifier = v6->_modelParentIdentifier;
      v6->_modelParentIdentifier = (NSUUID *)v7;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMD.modelIdentifier")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMD.modelIdentifier"));
      v9 = objc_claimAutoreleasedReturnValue();
      modelIdentifier = v6->_modelIdentifier;
      v6->_modelIdentifier = (NSUUID *)v9;
    }
    else
    {
      -[HMDAccountHandle URI](v6, "URI");
      modelIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      __modelIdentifierForURI(modelIdentifier, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v6->_modelIdentifier;
      v6->_modelIdentifier = (NSUUID *)v11;

    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HMDAccountHandle URI](self, "URI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("HMD.URI"));

  objc_msgSend(v8, "encodeBool:forKey:", -[HMDAccountHandle isLocal](self, "isLocal"), CFSTR("HMD.local"));
  if (objc_msgSend(v8, "hmd_isForLocalStore"))
  {
    objc_msgSend(v8, "encodeBool:forKey:", -[HMDAccountHandle isLocallyTracked](self, "isLocallyTracked"), CFSTR("HMD.locallyTracked"));
    -[HMDAccountHandle modelIdentifier](self, "modelIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("HMD.modelIdentifier"));

    -[HMDAccountHandle modelParentIdentifier](self, "modelParentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[HMDAccountHandle modelParentIdentifier](self, "modelParentIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("HMD.modelParentIdentifier"));

    }
  }

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccountHandle *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = (id)objc_opt_class();
    v12 = v19;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved:message:]", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "respondWithError:", v13);

}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  HMDAccountHandle *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  HMDAccountHandle *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  IDSURI *URI;
  void *v27;
  void *v28;
  HMDAccountHandle *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  HMDAccountHandle *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v43 = v8;
    v14 = self;
    v15 = v13;
    v42 = v10;
    v16 = v10;
    objc_msgSend(v16, "transactionResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v17, "source") && !-[HMDAccountHandle isLocallyTracked](v14, "isLocallyTracked"))
    {
      -[HMDAccountHandle setLocallyTracked:](v14, "setLocallyTracked:", 1);
      objc_msgSend(v17, "markChanged");
    }
    -[HMDAccountHandle modelObjectWithChangeType:version:](v14, "modelObjectWithChangeType:version:", 0, 4);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v20)
    {
      if (objc_msgSend(v20, "diff:differingFields:", v15, 0))
      {
        v40 = v15;
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = v14;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v38 = v21;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v45 = v24;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating account handle", buf, 0xCu);

          v21 = v38;
        }

        objc_autoreleasePoolPop(v21);
        objc_msgSend(v40, "idsURI");
        v25 = objc_claimAutoreleasedReturnValue();
        URI = v22->_URI;
        v22->_URI = (IDSURI *)v25;

        objc_msgSend(v40, "local");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v22->_local = objc_msgSend(v27, "BOOLValue");

        v15 = v40;
        objc_msgSend(v17, "markChanged");
      }
    }
    else
    {
      v41 = v15;
      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = v14;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = v33;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v36;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve model for updated account handle", buf, 0xCu);

        v33 = v39;
      }

      objc_autoreleasePoolPop(v33);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "respondWithError:", v37);

      v15 = v41;
    }

    v10 = v42;
    v8 = v43;
  }
  else
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v31;
      v46 = 2112;
      v47 = v11;
      v48 = 2112;
      v49 = (id)objc_opt_class();
      v32 = v49;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated:newValues:message:]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v14 = (HMDAccountHandle *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v14);
  }

}

- (HMDAccountHandle)initWithObjectModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDAccountHandle *v7;
  void *v8;
  uint64_t v9;
  NSUUID *modelIdentifier;
  void *v11;
  uint64_t v12;
  NSUUID *modelParentIdentifier;

  v4 = a3;
  objc_msgSend(v4, "idsURI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDAccountHandle initWithURI:local:](self, "initWithURI:local:", v5, objc_msgSend(v6, "BOOLValue"));

  if (v7)
  {
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    modelIdentifier = v7->_modelIdentifier;
    v7->_modelIdentifier = (NSUUID *)v9;

    objc_msgSend(v4, "parentUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    modelParentIdentifier = v7->_modelParentIdentifier;
    v7->_modelParentIdentifier = (NSUUID *)v12;

  }
  return v7;
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)setModelParentIdentifier:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *modelParentIdentifier;
  void *v7;
  NSUUID *v8;
  NSUUID *modelIdentifier;
  id v10;

  v4 = a3;
  if (!self->_modelParentIdentifier)
  {
    v10 = v4;
    v5 = (NSUUID *)objc_msgSend(v4, "copy");
    modelParentIdentifier = self->_modelParentIdentifier;
    self->_modelParentIdentifier = v5;

    v4 = v10;
    if (!self->_modelIdentifier)
    {
      -[HMDAccountHandle URI](self, "URI");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __modelIdentifierForURI(v7, v10);
      v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      modelIdentifier = self->_modelIdentifier;
      self->_modelIdentifier = v8;

      v4 = v10;
    }
  }

}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  void *v6;
  HMDAccountHandleModel *v7;
  void *v8;
  void *v9;
  HMDAccountHandleModel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  HMDAccountHandle *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMDAccountHandle modelParentIdentifier](self, "modelParentIdentifier", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [HMDAccountHandleModel alloc];
    -[HMDAccountHandle modelIdentifier](self, "modelIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccountHandle modelParentIdentifier](self, "modelParentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v7, "initWithObjectChangeType:uuid:parentUUID:", a3, v8, v9);

    -[HMDAccountHandle URI](self, "URI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[HMDAccountHandleModel setIdsURI:](v10, "setIdsURI:", v12);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccountHandle isLocal](self, "isLocal"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccountHandleModel setLocal:](v10, "setLocal:", v13);

    return v10;
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Account handle is missing parent identifier, returning nil", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    return 0;
  }
}

- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[HMDAccountHandle modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)modelBackedObjects
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isBackingStorageEqual:(id)a3
{
  HMDAccountHandle *v4;
  HMDAccountHandle *v5;
  HMDAccountHandle *v6;
  HMDAccountHandle *v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v4 = (HMDAccountHandle *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else if (-[HMDAccountHandle isEqual:](self, "isEqual:", v4))
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      v8 = -[HMDAccountHandle isLocal](self, "isLocal");
      v9 = v8 ^ -[HMDAccountHandle isLocal](v7, "isLocal") ^ 1;
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

- (id)remoteDestinationString
{
  void *v2;
  void *v3;

  -[HMDAccountHandle URI](self, "URI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prefixedURI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccountHandle identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSUUID)modelParentIdentifier
{
  return self->_modelParentIdentifier;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isLocal
{
  return self->_local;
}

- (IDSURI)URI
{
  return (IDSURI *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isLocallyTracked
{
  return self->_locallyTracked;
}

- (void)setLocallyTracked:(BOOL)a3
{
  self->_locallyTracked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URI, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modelParentIdentifier, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
}

void __27__HMDAccountHandle_contact__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (HMDAccountHandleModelIdentifierNamespaceUUIDString_block_invoke_onceToken != -1)
    dispatch_once(&HMDAccountHandleModelIdentifierNamespaceUUIDString_block_invoke_onceToken, &__block_literal_global_73793);
  v17 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v17, "type");
  if (v2 == 1)
  {
    v8 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v17, "URI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unprefixedURI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForContactsMatchingEmailAddress:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v2 != 2)
    {

      return;
    }
    v3 = (void *)MEMORY[0x1E0C97398];
    objc_msgSend(v17, "URI");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unprefixedURI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "phoneNumberWithStringValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  {
    v10 = *MEMORY[0x1E0C966A8];
    v18[0] = *MEMORY[0x1E0C967C0];
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)HMDAccountHandleModelIdentifierNamespaceUUIDString_block_invoke_store, "unifiedContactsMatchingPredicate:keysToFetch:error:", v7, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "hmf_isEmpty") & 1) == 0)
    {
      objc_msgSend(v13, "firstObject");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
  }
}

void __27__HMDAccountHandle_contact__block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v1 = (void *)HMDAccountHandleModelIdentifierNamespaceUUIDString_block_invoke_store;
  HMDAccountHandleModelIdentifierNamespaceUUIDString_block_invoke_store = (uint64_t)v0;

}

+ (id)accountHandleForDestination:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)IDSCopyAddressDestinationForDestination();
  if (v3)
  {
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountHandleFromString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_73829 != -1)
    dispatch_once(&logCategory__hmf_once_t9_73829, &__block_literal_global_44_73830);
  return (id)logCategory__hmf_once_v10_73831;
}

void __31__HMDAccountHandle_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_73831;
  logCategory__hmf_once_v10_73831 = v0;

}

@end
