@implementation HMBModelField

- (Class)classObj
{
  return self->_classObj;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (HMBModelField)initWithClass:(Class)a3
{
  HMBModelField *v4;
  HMBModelField *v5;
  HMBModelField *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMBModelField;
  v4 = -[HMBModelField init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_classObj, a3);
    v5->_loggingVisibility = 0;
    v6 = v5;
  }

  return v5;
}

- (HMBModelField)initWithClass:(Class)a3 options:(id)a4
{
  id v6;
  HMBModelField *v7;
  HMBModelField *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  HMBModelField *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HMBModelField;
  v7 = -[HMBModelField init](&v32, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_25;
  objc_storeStrong((id *)&v7->_classObj, a3);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v13++), "applyTo:", v8);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v11);
  }

  v8->_excludeFromCloudStorage = 0;
  v14 = -[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EFA287F8);
  v8->_conformsToHMBModelNativeCKWrapper = v14;
  -[HMBModelField externalRecordField](v8, "externalRecordField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v15)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v16 = -[objc_class includeInModelEncoding](a3, "includeInModelEncoding") ^ 1;
LABEL_16:
        v8->_excludeFromCloudStorage = v16;
        goto LABEL_17;
      }
LABEL_15:
      v16 = 1;
      goto LABEL_16;
    }
    _HMFPreconditionFailure();
LABEL_27:
    _HMFPreconditionFailure();
  }
  if (v15)
  {
    if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EFA33C18) & 1) != 0)
      goto LABEL_15;
    goto LABEL_27;
  }
LABEL_17:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = v9;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21++), "applyTo:", v8, (_QWORD)v24);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v19);
  }

  v8->_loggingVisibility = 0;
  v22 = v8;
LABEL_25:

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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  NSStringFromClass(-[HMBModelField classObj](self, "classObj"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMBModelField class: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HMBModelField isOptional](self, "isOptional"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" optional: YES"));
  -[HMBModelField externalRecordField](self, "externalRecordField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMBModelField externalRecordField](self, "externalRecordField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" recordField: %@"), v7);

  }
  if (-[HMBModelField loggingVisibility](self, "loggingVisibility"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" loggingVisibility: %ld"), -[HMBModelField loggingVisibility](self, "loggingVisibility"));
  -[HMBModelField defaultValue](self, "defaultValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMBModelField defaultValue](self, "defaultValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" defaultValue: %@"), v9);

  }
  -[HMBModelField readonlyVersion](self, "readonlyVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMBModelField readonlyVersion](self, "readonlyVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" readonlyVersion: %@"), v11);

  }
  -[HMBModelField unavailableVersion](self, "unavailableVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMBModelField unavailableVersion](self, "unavailableVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" unavailableVersion: %@"), v13);

  }
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

- (void)setDefaultValue:(id)a3
{
  id v5;
  void *v6;
  HMBModelField *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 && (-[HMBModelField classObj](self, "classObj"), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v6 = (void *)MEMORY[0x1D17B6230]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(-[HMBModelField classObj](v7, "classObj"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to set a default value %@ of type %@ when the stored type is %@", (uint8_t *)&v13, 0x2Au);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    objc_storeStrong(&self->_defaultValue, a3);
  }

}

- (id)encodeQueryableValue:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  HMBModelField *v9;
  SEL v10;
  id v11;

  v4 = a3;
  -[HMBModelField classObj](self, "classObj");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HMBModelField encodeBlock](self, "encodeBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HMBModelField encodeBlock](self, "encodeBlock");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v6)[2](v6, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v9 = (HMBModelField *)_HMFPreconditionFailure();
  return -[HMBModelField decodeQueryableValue:](v9, v10, v11);
}

- (id)decodeQueryableValue:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  HMBModelField *v9;
  SEL v10;
  id v11;

  v4 = a3;
  -[HMBModelField decodeBlock](self, "decodeBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMBModelField decodeBlock](self, "decodeBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9 = (HMBModelField *)_HMFPreconditionFailure();
    return -[HMBModelField descriptionForEncodedQueryableValue:](v9, v10, v11);
  }
}

- (id)descriptionForEncodedQueryableValue:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  HMBModelField *v9;
  SEL v10;
  _NSZone *v11;

  v4 = a3;
  -[HMBModelField descriptionBlock](self, "descriptionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMBModelField descriptionBlock](self, "descriptionBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9 = (HMBModelField *)_HMFPreconditionFailure();
    return -[HMBModelField copyWithZone:](v9, v10, v11);
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMBMutableModelField *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = -[HMBModelField initWithClass:](+[HMBMutableModelField allocWithZone:](HMBMutableModelField, "allocWithZone:", a3), "initWithClass:", -[HMBModelField classObj](self, "classObj"));
  -[HMBModelField setOptional:](v4, "setOptional:", -[HMBModelField isOptional](self, "isOptional"));
  -[HMBModelField setLoggingVisibility:](v4, "setLoggingVisibility:", -[HMBModelField loggingVisibility](self, "loggingVisibility"));
  -[HMBModelField defaultValue](self, "defaultValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setDefaultValue:](v4, "setDefaultValue:", v5);

  -[HMBModelField readonlyVersion](self, "readonlyVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setReadonlyVersion:](v4, "setReadonlyVersion:", v6);

  -[HMBModelField unavailableVersion](self, "unavailableVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setUnavailableVersion:](v4, "setUnavailableVersion:", v7);

  -[HMBModelField externalRecordField](self, "externalRecordField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setExternalRecordField:](v4, "setExternalRecordField:", v8);

  -[HMBModelField setConformsToHMBModelNativeCKWrapper:](v4, "setConformsToHMBModelNativeCKWrapper:", -[HMBModelField conformsToHMBModelNativeCKWrapper](self, "conformsToHMBModelNativeCKWrapper"));
  -[HMBModelField setExcludeFromCloudStorage:](v4, "setExcludeFromCloudStorage:", -[HMBModelField excludeFromCloudStorage](self, "excludeFromCloudStorage"));
  -[HMBModelField encodeBlock](self, "encodeBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setEncodeBlock:](v4, "setEncodeBlock:", v9);

  -[HMBModelField decodeBlock](self, "decodeBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setDecodeBlock:](v4, "setDecodeBlock:", v10);

  -[HMBModelField descriptionBlock](self, "descriptionBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setDescriptionBlock:](v4, "setDescriptionBlock:", v11);

  return v4;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (void)setEncrypted:(BOOL)a3
{
  self->_encrypted = a3;
}

- (NSString)externalRecordField
{
  return self->_externalRecordField;
}

- (void)setExternalRecordField:(id)a3
{
  objc_storeStrong((id *)&self->_externalRecordField, a3);
}

- (BOOL)excludeFromCloudStorage
{
  return self->_excludeFromCloudStorage;
}

- (void)setExcludeFromCloudStorage:(BOOL)a3
{
  self->_excludeFromCloudStorage = a3;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (unint64_t)loggingVisibility
{
  return self->_loggingVisibility;
}

- (void)setLoggingVisibility:(unint64_t)a3
{
  self->_loggingVisibility = a3;
}

- (HMFVersion)readonlyVersion
{
  return self->_readonlyVersion;
}

- (void)setReadonlyVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HMFVersion)unavailableVersion
{
  return self->_unavailableVersion;
}

- (void)setUnavailableVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)conformsToHMBModelNativeCKWrapper
{
  return self->_conformsToHMBModelNativeCKWrapper;
}

- (void)setConformsToHMBModelNativeCKWrapper:(BOOL)a3
{
  self->_conformsToHMBModelNativeCKWrapper = a3;
}

- (id)encodeBlock
{
  return self->_encodeBlock;
}

- (void)setEncodeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)decodeBlock
{
  return self->_decodeBlock;
}

- (void)setDecodeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)descriptionBlock
{
  return self->_descriptionBlock;
}

- (void)setDescriptionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_descriptionBlock, 0);
  objc_storeStrong(&self->_decodeBlock, 0);
  objc_storeStrong(&self->_encodeBlock, 0);
  objc_storeStrong((id *)&self->_unavailableVersion, 0);
  objc_storeStrong((id *)&self->_readonlyVersion, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_externalRecordField, 0);
  objc_storeStrong((id *)&self->_classObj, 0);
}

+ (HMBModelField)fieldWithClass:(Class)a3
{
  id v4;

  v4 = objc_alloc((Class)a1);
  return (HMBModelField *)(id)objc_msgSend(v4, "initWithClass:options:", a3, MEMORY[0x1E0C9AA60]);
}

+ (id)optionalFieldWithClass:(Class)a3
{
  HMBMutableModelField *v4;
  HMBMutableModelField *v5;
  void *v6;

  v4 = [HMBMutableModelField alloc];
  v5 = -[HMBModelField initWithClass:options:](v4, "initWithClass:options:", a3, MEMORY[0x1E0C9AA60]);
  -[HMBModelField setOptional:](v5, "setOptional:", 1);
  v6 = (void *)-[HMBMutableModelField copy](v5, "copy");

  return v6;
}

+ (HMBModelField)fieldWithClass:(Class)a3 options:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClass:options:", a3, v6);

  return (HMBModelField *)v7;
}

+ (id)optionalFieldWithClass:(Class)a3 options:(id)a4
{
  id v5;
  HMBMutableModelField *v6;
  void *v7;

  v5 = a4;
  v6 = -[HMBModelField initWithClass:options:]([HMBMutableModelField alloc], "initWithClass:options:", a3, v5);

  -[HMBModelField setOptional:](v6, "setOptional:", 1);
  v7 = (void *)-[HMBMutableModelField copy](v6, "copy");

  return v7;
}

+ (id)deprecatedField
{
  HMBMutableModelField *v2;
  HMBMutableModelField *v3;
  void *v4;

  v2 = [HMBMutableModelField alloc];
  v3 = -[HMBModelField initWithClass:options:](v2, "initWithClass:options:", objc_opt_class(), MEMORY[0x1E0C9AA60]);
  -[HMBModelField setLoggingVisibility:](v3, "setLoggingVisibility:", 1);
  v4 = (void *)-[HMBMutableModelField copy](v3, "copy");

  return v4;
}

@end
