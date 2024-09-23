@implementation HDUserDomainConceptProcessingState

- (HDUserDomainConceptProcessingState)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDUserDomainConceptProcessingState)initWithAnchor:(int64_t)a3 ontologyVersion:(id)a4 maximumPropertyType:(int64_t)a5
{
  id v8;
  HDUserDomainConceptProcessingState *v9;
  HDUserDomainConceptProcessingState *v10;
  uint64_t v11;
  HKOntologyVersion *ontologyVersion;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDUserDomainConceptProcessingState;
  v9 = -[HDUserDomainConceptProcessingState init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_anchor = a3;
    v11 = objc_msgSend(v8, "copy");
    ontologyVersion = v10->_ontologyVersion;
    v10->_ontologyVersion = (HKOntologyVersion *)v11;

    v10->_maximumPropertyType = a5;
  }

  return v10;
}

- (id)copyByUpdatingAnchor:(int64_t)a3
{
  return -[HDUserDomainConceptProcessingState initWithAnchor:ontologyVersion:maximumPropertyType:]([HDUserDomainConceptProcessingState alloc], "initWithAnchor:ontologyVersion:maximumPropertyType:", a3, self->_ontologyVersion, self->_maximumPropertyType);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t anchor;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  anchor = self->_anchor;
  HKStringFromUserDomainConceptPropertyType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %lld, %@ (%ld), %@>"), v4, self, anchor, v6, self->_maximumPropertyType, self->_ontologyVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  int64_t anchor;

  anchor = self->_anchor;
  return -[HKOntologyVersion hash](self->_ontologyVersion, "hash") ^ anchor ^ self->_maximumPropertyType;
}

- (BOOL)isEqual:(id)a3
{
  HDUserDomainConceptProcessingState *v4;
  HDUserDomainConceptProcessingState *v5;
  HKOntologyVersion *ontologyVersion;
  HKOntologyVersion *v7;
  BOOL v8;

  v4 = (HDUserDomainConceptProcessingState *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v8 = self->_anchor == v5->_anchor
        && ((ontologyVersion = self->_ontologyVersion, v7 = v5->_ontologyVersion, ontologyVersion == v7)
         || v7 && -[HKOntologyVersion isEqual:](ontologyVersion, "isEqual:"))
        && self->_maximumPropertyType == v5->_maximumPropertyType;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (id)fetchFromKeyValueDomain:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v15;
  _BOOL4 v16;
  id v17;
  HDUserDomainConceptProcessingState *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  HDUserDomainConceptProcessingState *v23;
  uint64_t v24;
  void *v25;
  HDUserDomainConceptProcessingState *v26;
  void *v28;
  HDUserDomainConceptProcessingState *v29;
  uint64_t v30;
  id v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32[0] = CFSTR("UserDomainConceptProcessingStateAnchor");
  v32[1] = CFSTR("UserDomainConceptProcessingStateVersionString");
  v32[2] = CFSTR("UserDomainConceptProcessingStateMaxPropertyType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valuesForKeys:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UserDomainConceptProcessingStateAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UserDomainConceptProcessingStateVersionString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UserDomainConceptProcessingStateMaxPropertyType"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v9)
      v13 = v10 == 0;
    else
      v13 = 1;
    if (v13 || v11 == 0)
    {
      v15 = v5;
      objc_opt_self();
      v31 = 0;
      v16 = +[HDUserDomainConceptPersistableProcessingState fetchFromKeyValueDomain:stateOut:error:](HDUserDomainConceptPersistableProcessingState, "fetchFromKeyValueDomain:stateOut:error:", v15, &v31, a4);

      v17 = v31;
      v26 = 0;
      if (v16)
      {
        v18 = [HDUserDomainConceptProcessingState alloc];
        if (v17)
        {
          v30 = objc_msgSend(v17, "anchor");
          v29 = v18;
          v19 = objc_alloc(MEMORY[0x1E0CB69C0]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "ontologyVersion"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v19, "initWithString:", v20);
          v26 = -[HDUserDomainConceptProcessingState initWithAnchor:ontologyVersion:maximumPropertyType:](v29, "initWithAnchor:ontologyVersion:maximumPropertyType:", v30, v21, objc_msgSend(v17, "maximumPropertyType"));

          v22 = v28;
        }
        else
        {
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69C0]), "initEmptyVersion");
          v26 = -[HDUserDomainConceptProcessingState initWithAnchor:ontologyVersion:maximumPropertyType:](v18, "initWithAnchor:ontologyVersion:maximumPropertyType:", -1, v22, 180000);
        }

      }
    }
    else
    {
      v23 = [HDUserDomainConceptProcessingState alloc];
      v24 = objc_msgSend(v9, "longLongValue");
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69C0]), "initWithString:", v10);
      v26 = -[HDUserDomainConceptProcessingState initWithAnchor:ontologyVersion:maximumPropertyType:](v23, "initWithAnchor:ontologyVersion:maximumPropertyType:", v24, v25, objc_msgSend(v12, "longLongValue"));

    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)persistInKeyValueDomain:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  HDUserDomainConceptProcessingState *v19;
  __int16 v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22[0] = CFSTR("UserDomainConceptProcessingStateAnchor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_anchor);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v22[1] = CFSTR("UserDomainConceptProcessingStateVersionString");
  -[HKOntologyVersion string](self->_ontologyVersion, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  v22[2] = CFSTR("UserDomainConceptProcessingStateMaxPropertyType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maximumPropertyType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "setValuesWithDictionary:error:", v10, a4);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("LastProcessedUserDomainConceptStateKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v13 = objc_msgSend(v6, "removeValuesForKeys:error:", v12, &v17);
    v14 = v17;

    if ((v13 & 1) == 0)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v19 = self;
        v20 = 2114;
        v21 = v14;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Unable to clear legacy state from key-value domain %{public}@", buf, 0x16u);
      }

    }
  }

  return v11;
}

- (int64_t)anchor
{
  return self->_anchor;
}

- (HKOntologyVersion)ontologyVersion
{
  return self->_ontologyVersion;
}

- (int64_t)maximumPropertyType
{
  return self->_maximumPropertyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ontologyVersion, 0);
}

@end
