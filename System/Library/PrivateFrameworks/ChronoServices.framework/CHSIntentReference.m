@implementation CHSIntentReference

+ (CHSIntentReference)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CHSIntentReference.m"), 35, CFSTR("+[CHSIntentReference new] is unavailable."));

  return 0;
}

- (CHSIntentReference)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSIntentReference.m"), 40, CFSTR("-[CHSIntentReference init] is unavailable."));

  return 0;
}

- (id)_initWithIntentInMemoryOnly:(id)a3
{
  id v5;
  CHSIntentReference *v6;
  CHSIntentReference *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSIntentReference;
  v6 = -[CHSIntentReference init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inMemoryIntent, a3);
    v7->_stableHash = objc_msgSend(v5, "_indexingHash");
  }

  return v7;
}

- (CHSIntentReference)initWithIntent:(id)a3
{
  void *v4;
  CHSIntentReference *v5;

  _genericiseIntent(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CHSIntentReference _initWithGenericIntent:schemaData:](self, "_initWithGenericIntent:schemaData:", v4, 0);

  return v5;
}

- (CHSIntentReference)initWithIntent:(id)a3 schemaData:(id)a4
{
  id v6;
  void *v7;
  CHSIntentReference *v8;

  v6 = a4;
  _genericiseIntent(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CHSIntentReference _initWithGenericIntent:schemaData:](self, "_initWithGenericIntent:schemaData:", v7, v6);

  return v8;
}

- (id)_initWithGenericIntent:(id)a3 schemaData:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  CHSIntentReference *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  unsigned int v19;
  uint8_t buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "_indexingHash");
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = 0;
      objc_msgSend(v6, "_backingStoreData");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
      {
        v13 = MEMORY[0x194008D00](v11, 0, &v19);
        if (!v19)
        {
          self = -[CHSIntentReference initWithIntentData:configData:schemaData:stableHash:](self, "initWithIntentData:configData:schemaData:stableHash:", 0, v13, v7, v8);
          v10 = self;
          goto LABEL_16;
        }
        CHSLogChronoServices();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CHSIntentReference _initWithGenericIntent:schemaData:].cold.2(v15, (uint64_t)buf, v14);
        }

      }
      else
      {
        CHSLogChronoServices();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CHSIntentReference _initWithGenericIntent:schemaData:].cold.1(v17, (uint64_t)v6, buf, v13);
        }
      }
      v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
  }
  _intentDataFromIntent((uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    self = -[CHSIntentReference initWithIntentData:configData:schemaData:stableHash:](self, "initWithIntentData:configData:schemaData:stableHash:", v9, 0, 0, v8);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

LABEL_17:
  return v10;
}

- (CHSIntentReference)initWithIntentData:(id)a3 configData:(id)a4 schemaData:(id)a5 stableHash:(int64_t)a6
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  CHSIntentReference *v17;
  CHSIntentReference *v18;
  void *v20;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v14;
  if (v12)
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSIntentReference.m"), 91, CFSTR("Can't specify split intent data along with unified intent data"));

      if (!v15)
        goto LABEL_6;
    }
    else if (!v14)
    {
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSIntentReference.m"), 92, CFSTR("Can't specify split condif data along with unified intent data"));
  }
  else
  {
    if (v13)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSIntentReference.m"), 94, CFSTR("Must specify partial config data if not specifying unified intent data"));
  }

LABEL_6:
  v21.receiver = self;
  v21.super_class = (Class)CHSIntentReference;
  v17 = -[CHSIntentReference init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_stableHash = a6;
    objc_storeStrong((id *)&v17->_intentData, a3);
    objc_storeStrong((id *)&v18->_partialConfigData, a4);
    objc_storeStrong((id *)&v18->_partialSchemaData, a5);
  }

  return v18;
}

- (INIntent)intent
{
  INIntent *inMemoryIntent;
  NSData *intentData;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v17;
  id v18;
  id v19;
  int v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  inMemoryIntent = self->_inMemoryIntent;
  if (inMemoryIntent)
    return inMemoryIntent;
  intentData = self->_intentData;
  if (intentData)
  {
    v21 = 0;
    +[CHSIntentReference _decodeFromOPACK:error:](CHSIntentReference, "_decodeFromOPACK:error:", intentData, &v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v7)
    {
      CHSLogChronoServices();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v7;
        _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "Error decoding intent: %{public}@", buf, 0xCu);
      }

    }
    return (INIntent *)v6;
  }
  if (!self->_partialConfigData)
    return (INIntent *)0;
  if (!self->_partialSchemaData)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSIntentReference.m"), 126, CFSTR("Cannot rehydrate a partialized intent with missing schema data."));

  }
  v20 = 0;
  v9 = (void *)OPACKDecodeData();
  v10 = (void *)OPACKDecodeData();
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CBD970], "makeFromWidgetPlistableRepresentation:error:", v9, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  if (v12)
  {
    v13 = v12;
    CHSLogChronoServices();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v13;
      _os_log_impl(&dword_18FB18000, v14, OS_LOG_TYPE_DEFAULT, "Error decoding partialized schema intent: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v18 = 0;
    v14 = objc_msgSend(v11, "_copyApplyingNewBackingStoreData:error:", v10, &v18);
    v13 = v18;
    if (!v13)
    {
      v14 = v14;
      v6 = v14;
      goto LABEL_22;
    }
    CHSLogChronoServices();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v13;
      _os_log_impl(&dword_18FB18000, v15, OS_LOG_TYPE_DEFAULT, "Error decoding partialized intent: %{public}@", buf, 0xCu);
    }

  }
  v6 = 0;
LABEL_22:

  return (INIntent *)v6;
}

- (BOOL)_isPartial
{
  return self->_partialConfigData && self->_partialSchemaData == 0;
}

- (BOOL)_isSchemaSeparated
{
  return self->_partialConfigData != 0;
}

- (id)_copyFillingInSchema:(id)a3
{
  NSData *v4;
  NSData *v5;
  CHSIntentReference *v6;
  CHSIntentReference *v7;
  void *v8;
  CHSIntentReference *v9;

  v4 = (NSData *)a3;
  v5 = v4;
  if (self->_partialConfigData)
  {
    if (self->_partialSchemaData == v4)
      v6 = self;
    else
      v6 = -[CHSIntentReference initWithIntentData:configData:schemaData:stableHash:]([CHSIntentReference alloc], "initWithIntentData:configData:schemaData:stableHash:", 0, self->_partialConfigData, v4, self->_stableHash);
    v9 = v6;
  }
  else
  {
    v7 = [CHSIntentReference alloc];
    -[CHSIntentReference intent](self, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CHSIntentReference initWithIntent:schemaData:](v7, "initWithIntent:schemaData:", v8, v5);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CHSIntentReference *v4;
  CHSIntentReference *v5;
  NSUInteger v6;
  NSUInteger v7;
  char v8;

  v4 = (CHSIntentReference *)a3;
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
      if (self->_stableHash == v5->_stableHash
        && (v6 = -[NSData length](self->_intentData, "length"), v6 == -[NSData length](v5->_intentData, "length"))
        && (v7 = -[NSData length](self->_partialConfigData, "length"),
            v7 == -[NSData length](v5->_partialConfigData, "length")))
      {
        v8 = BSEqualObjects();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSData length](self->_intentData, "length");
  v4 = v3 + -[NSData length](self->_partialConfigData, "length");
  return v4 + -[INIntent hash](self->_inMemoryIntent, "hash") + 19;
}

- (id)_copyWithoutSchemaDataIfNecessary
{
  if (self->_partialSchemaData)
    return -[CHSIntentReference initWithIntentData:configData:schemaData:stableHash:]([CHSIntentReference alloc], "initWithIntentData:configData:schemaData:stableHash:", self->_intentData, self->_partialConfigData, 0, self->_stableHash);
  else
    return self;
}

+ (id)_schemaDataFromIntent:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = 0;
LABEL_4:
    v6 = v6;
    v7 = 0;
    v8 = v6;
    goto LABEL_5;
  }
  v20 = 0;
  v10 = (void *)objc_msgSend(v5, "_copyWithoutBackingStoreData:", &v20);
  v11 = v20;
  v19 = v11;
  objc_msgSend(v10, "widgetPlistableRepresentation:", &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;

  v6 = 0;
  if (!v7 && v12)
  {
    *(_DWORD *)buf = 0;
    v6 = (id)MEMORY[0x194008D00](v12, 0, buf);
    if (*(_DWORD *)buf)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Unable to encode intent schema: %@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("CHSErrorDomain"), 6, v17);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }

  if (!v7)
    goto LABEL_4;
  CHSLogChronoServices();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v7;
    _os_log_impl(&dword_18FB18000, v18, OS_LOG_TYPE_DEFAULT, "Error extracting schema from intent: %{public}@", buf, 0xCu);
  }

  if (a4)
  {
    v7 = objc_retainAutorelease(v7);
    v8 = 0;
    *a4 = v7;
  }
  else
  {
    v8 = 0;
  }
LABEL_5:

  return v8;
}

- (id)_typedIntent
{
  void *v2;
  id v3;
  void *v4;

  -[CHSIntentReference intent](self, "intent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v2;
    }
    else
    {
      INTypedIntentWithIntent();
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CHSIntentReference *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__CHSIntentReference_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E2A5A290;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

id __51__CHSIntentReference_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPointer:withName:", *(_QWORD *)(a1 + 40), CFSTR("CHSIntentReference"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInt64:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("hash"));
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  NSData *partialConfigData;
  NSData *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_inMemoryIntent)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSIntentReference.m"), 298, CFSTR("Cannot encode an in-memory representation of an intent."));

  }
  _unifiedIntentDataIfPossible(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    partialConfigData = 0;
  else
    partialConfigData = self->_partialConfigData;
  v7 = partialConfigData;
  objc_msgSend(v9, "encodeInt64:forKey:", self->_stableHash, CFSTR("stableHash"));
  if (v5)
    objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("idata"));
  if (v7)
    objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("pcdata"));

}

- (CHSIntentReference)initWithCoder:(id)a3
{
  id v4;
  CHSIntentReference *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (CHSIntentReference *)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("stableHash"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pcdata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[CHSIntentReference initWithIntentData:configData:schemaData:stableHash:](self, "initWithIntentData:configData:schemaData:stableHash:", v6, v7, 0, v5);
    v5 = self;
  }

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v5;
  NSData *partialConfigData;
  NSData *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_inMemoryIntent)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSIntentReference.m"), 329, CFSTR("Cannot encode an in-memory representation of an intent."));

  }
  _unifiedIntentDataIfPossible(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    partialConfigData = 0;
  else
    partialConfigData = self->_partialConfigData;
  v7 = partialConfigData;
  objc_msgSend(v9, "encodeInt64:forKey:", self->_stableHash, CFSTR("stableHash"));
  if (v5)
    objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("idata"));
  if (v7)
    objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("pcdata"));

}

- (CHSIntentReference)initWithBSXPCCoder:(id)a3
{
  id v4;
  CHSIntentReference *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (CHSIntentReference *)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("stableHash"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pcdata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[CHSIntentReference initWithIntentData:configData:schemaData:stableHash:](self, "initWithIntentData:configData:schemaData:stableHash:", v6, v7, 0, v5);
    v5 = self;
  }

  return v5;
}

+ (id)_encodeToOPACK:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v14;
  id v15;

  v5 = a3;
  v15 = 0;
  objc_msgSend(v5, "widgetPlistableRepresentation:", &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isAppIntent"));
  if (v8)
  {
    v14 = 0;
    v9 = (void *)MEMORY[0x194008D00](v8, 0, &v14);
    v10 = v9;
    if (!v14)
    {
      v10 = v9;
      v12 = v10;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CHSErrorDomain"), 6, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v11;
  }
  else
  {
    v10 = 0;
  }
  v12 = 0;
  if (a4 && v7)
  {
    v7 = objc_retainAutorelease(v7);
    v12 = 0;
    *a4 = v7;
  }
LABEL_11:

  return v12;
}

+ (id)_decodeFromOPACK:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;
  int v12;

  v12 = 0;
  v5 = (void *)OPACKDecodeData();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isAppIntent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "BOOLValue");

  if (v5)
  {
    v11 = 0;
    objc_msgSend((id)objc_opt_class(), "makeFromWidgetPlistableRepresentation:error:", v5, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CHSErrorDomain"), 6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    v7 = 0;
    if (a4 && v9)
    {
      v8 = objc_retainAutorelease(v9);
      v7 = 0;
      *a4 = v8;
    }
  }

  return v7;
}

- (int64_t)stableHash
{
  return self->_stableHash;
}

- (NSData)_partialSchemaData
{
  return self->_partialSchemaData;
}

- (void)_setPartialSchemaData:(id)a3
{
  objc_storeStrong((id *)&self->_partialSchemaData, a3);
}

- (NSData)_partialConfigData
{
  return self->_partialConfigData;
}

- (NSData)_intentData
{
  return self->_intentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialSchemaData, 0);
  objc_storeStrong((id *)&self->_partialConfigData, 0);
  objc_storeStrong((id *)&self->_intentData, 0);
  objc_storeStrong((id *)&self->_inMemoryIntent, 0);
}

- (void)_initWithGenericIntent:(uint8_t *)buf schemaData:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543619;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2113;
  *(_QWORD *)(buf + 14) = a2;

}

- (void)_initWithGenericIntent:(NSObject *)a3 schemaData:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_0(&dword_18FB18000, a3, (uint64_t)a3, "Error encoding intent backing store data: %{public}@", (uint8_t *)a2);

}

@end
