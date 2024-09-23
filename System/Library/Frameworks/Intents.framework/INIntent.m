@implementation INIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_recordDeviceUID, 0);
  objc_storeStrong((id *)&self->_recordRoute, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_donationMetadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyParameter, 0);
  objc_storeStrong((id *)&self->_parameterContexts, 0);
  objc_storeStrong((id *)&self->_configurableParameterCombinations, 0);
  objc_storeStrong((id *)&self->_parameterCombinations, 0);
  objc_storeStrong((id *)&self->_parameterImages, 0);
  objc_storeStrong((id *)&self->_intentInstanceDescriptionMapping, 0);
}

- (_INPBIntentMetadata)_metadata
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[INIntent _type](self, "_type") == 2)
  {
    -[INIntent _inCodable](self, "_inCodable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForPropertyNamed:", CFSTR("_metadata"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[INIntent _type](self, "_type") != 3)
    {
      v5 = 0;
      return (_INPBIntentMetadata *)v5;
    }
    -[INIntent _typedBackingStore](self, "_typedBackingStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "metadata");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return (_INPBIntentMetadata *)v5;
}

- (int64_t)_type
{
  void *v3;
  char isKindOfClass;
  objc_class *v6;
  void *v7;
  void *v8;

  -[INIntent backingStore](self, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 2;
  if (-[INIntent isGenericIntent](self, "isGenericIntent"))
    return 3;
  v6 = (objc_class *)objc_opt_class();
  INIntentSchemaGetIntentDescriptionWithFacadeClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (id)_inCodable
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[INIntent backingStore](self, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[INIntent backingStore](self, "backingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (PBCodable)backingStore
{
  return self->_backingStore;
}

- (BOOL)isGenericIntent
{
  void *v2;
  char isKindOfClass;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return INResolveInstanceMethod(a3, (objc_class *)a1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)launchId
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)_intentCategory
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  int64_t v7;

  -[INIntent _metadata](self, "_metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasIntentCategory");
  -[INIntent _metadata](self, "_metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intentCategory");
  if (v4 && (v6 - 1) <= 0x14)
    v7 = qword_18C3120D0[v6 - 1];
  else
    v7 = 0;

  return v7;
}

- (id)_initWithIdentifier:(id)a3 backingStore:(id)a4 schema:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSString *v12;
  NSString *identifier;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  PBCodable *v18;
  PBCodable *backingStore;
  void *v20;
  _INPBIntentMetadata *v21;
  void *v22;
  NSDictionary *v23;
  NSDictionary *parameterCombinations;
  void *v25;
  NSDictionary *v26;
  NSDictionary *configurableParameterCombinations;
  void *v28;
  void *v29;
  void *v30;
  char isKindOfClass;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v10 = a4;
  v11 = a5;
  if (!self)
    goto LABEL_22;
  v12 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v12;

  v14 = (objc_class *)objc_opt_class();
  INIntentSchemaGetIntentDescriptionWithFacadeClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "dataClass");
  if (v16)
  {
    v17 = (objc_class *)v16;
    if (!objc_msgSend(v10, "isMemberOfClass:", v16))
    {
      v18 = (PBCodable *)objc_alloc_init(v17);
      goto LABEL_7;
    }
LABEL_6:
    v18 = (PBCodable *)objc_msgSend(v10, "copy");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v18 = (PBCodable *)objc_msgSend(v10, "_copyWithZone:error:", 0, a6);
LABEL_7:
  backingStore = self->_backingStore;
  self->_backingStore = v18;

LABEL_8:
  -[INIntent _metadata](self, "_metadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v21 = objc_alloc_init(_INPBIntentMetadata);
    -[INIntent _setMetadata:](self, "_setMetadata:", v21);

  }
  if (v11)
  {
    -[INIntent _className](self, "_className");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_parameterCombinationsForClassName:", v22);
    v23 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    parameterCombinations = self->_parameterCombinations;
    self->_parameterCombinations = v23;

    -[INIntent _className](self, "_className");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_configurableParameterCombinationsForClassName:", v25);
    v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    configurableParameterCombinations = self->_configurableParameterCombinations;
    self->_configurableParameterCombinations = v26;

  }
  -[INIntent _metadata](self, "_metadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDefaultImageValue:", 0);

  if (-[INIntent _type](self, "_type") != 2)
    goto LABEL_20;
  -[INIntent _inCodable](self, "_inCodable");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_objectDescription");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[INIntent _inCodable](self, "_inCodable");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_objectDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[INIntent _intentCategory](self, "_intentCategory"))
      -[INIntent _setIntentCategory:](self, "_setIntentCategory:", objc_msgSend(v33, "intentCategory"));
    -[INIntent _metadata](self, "_metadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "categoryVerb");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length");

    if (!v36)
    {
      objc_msgSend(v33, "verb");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntent _setCategoryVerb:](self, "_setCategoryVerb:", v37);

    }
    -[INIntent _setUserConfirmationRequired:](self, "_setUserConfirmationRequired:", objc_msgSend(v33, "userConfirmationRequired"));
    objc_msgSend(v33, "versioningHash");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      -[INIntent _metadata](self, "_metadata");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "versioningHash");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setVersioningHash:", objc_msgSend(v40, "unsignedLongLongValue"));

    }
  }
  else
  {
LABEL_20:
    -[INIntent _setIntentCategory:](self, "_setIntentCategory:", -[INIntent _intentCategory](self, "_intentCategory"));
    -[INIntent _categoryVerb](self, "_categoryVerb");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent _setCategoryVerb:](self, "_setCategoryVerb:", v33);
  }

  self->_keyParameterLock._os_unfair_lock_opaque = 0;
LABEL_22:

  return self;
}

- (void)_setUserConfirmationRequired:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[INIntent _metadata](self, "_metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserConfirmationRequired:", v3);

}

- (id)_className
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;

  -[INIntent backingStore](self, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[INIntent backingStore](self, "backingStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_objectDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "className");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v6;

    v8 = -[PBCodable copy](self->_backingStore, "copy");
    v9 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v8;

    objc_storeStrong((id *)(v5 + 40), self->_parameterCombinations);
    v10 = -[NSString copyWithZone:](self->_recordRoute, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v10;

    objc_storeStrong((id *)(v5 + 112), self->_recordDeviceUID);
    v12 = -[NSString copyWithZone:](self->_recordDeviceIdentifier, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 120);
    *(_QWORD *)(v5 + 120) = v12;

    *(_DWORD *)(v5 + 36) = self->_audioSessionID;
    objc_storeStrong((id *)(v5 + 56), self->_parameterContexts);
    *(_BYTE *)(v5 + 32) = self->_shouldForwardToAppOnSucccess;
    *(_QWORD *)(v5 + 64) = self->_indexingHash;
    v14 = -[INIntentDonationMetadata copyWithZone:](self->_donationMetadata, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v14;

  }
  return (id)v5;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INIntent;
  return -[INIntent init](&v3, sel_init);
}

- (void)_setIntentCategory:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  -[INIntent _metadata](self, "_metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a3 - 1) > 0x13)
    v5 = 0x7FFFFFFFLL;
  else
    v5 = dword_18C312080[a3 - 1];
  v6 = v4;
  objc_msgSend(v4, "setIntentCategory:", v5);

}

- (void)_setCategoryVerb:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INIntent _metadata](self, "_metadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCategoryVerb:", v4);

}

- (void)setSuggestedInvocationPhrase:(NSString *)suggestedInvocationPhrase
{
  NSString *v4;
  void *v5;
  id v6;

  v4 = suggestedInvocationPhrase;
  -[INIntent _metadata](self, "_metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSString _intents_encodeForProto](v4, "_intents_encodeForProto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSuggestedInvocationPhrase:", v5);
}

- (NSString)extensionBundleId
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemExtensionBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)suggestedInvocationPhrase
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestedInvocationPhrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_intents_decodeFromProto");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_setParameterCombinations:(id)a3
{
  objc_storeStrong((id *)&self->_parameterCombinations, a3);
}

- (void)_setExtensionBundleId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INIntent _metadata](self, "_metadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSystemExtensionBundleId:", v4);

}

- (void)_setMetadata:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[INIntent _type](self, "_type") == 2)
  {
    -[INIntent _inCodable](self, "_inCodable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isValidKey:", CFSTR("_metadata")))
      objc_msgSend(v4, "setValue:forPropertyNamed:", v5, CFSTR("_metadata"));
    goto LABEL_6;
  }
  if (-[INIntent _type](self, "_type") == 3)
  {
    -[INIntent _typedBackingStore](self, "_typedBackingStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMetadata:", v5);
LABEL_6:

  }
}

- (INIntentCodableDescription)_codableDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  INIntentCodableDescription *v8;
  _QWORD v10[5];

  -[INIntent _inCodable](self, "_inCodable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_objectDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __31__INIntent__codableDescription__block_invoke;
    v10[3] = &unk_1E2290598;
    v10[4] = self;
    -[INIntent _querySchemaWithBlock:contentOptions:](self, "_querySchemaWithBlock:contentOptions:", v10, 31);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;
  }
  v8 = (INIntentCodableDescription *)v6;

  return v8;
}

- (NSDictionary)_validParameterCombinations
{
  return (NSDictionary *)-[INIntent _validParameterCombinationsWithSchema:](self, "_validParameterCombinationsWithSchema:", 0);
}

- (id)_validParameterCombinationsWithSchema:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[INIntent _className](self, "_className");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_parameterCombinationsForClassName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[INIntent _parameterCombinations](self, "_parameterCombinations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[INIntent _nonNilParameters](self, "_nonNilParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "isSubsetOfSet:", v7, (_QWORD)v17))
        {
          objc_msgSend(v9, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v15, v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v8;
}

- (BOOL)_hasTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;

  -[INIntent _nonNilParameters](self, "_nonNilParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "_ignoredParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusSet:", v5);

  -[INIntent _parameterCombinations](self, "_parameterCombinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (objc_msgSend(v7, "titleFormatString"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v9))
  {
    v10 = 1;
  }
  else
  {
    -[INIntent backingStore](self, "backingStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[INIntent backingStore](self, "backingStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_objectDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v10 = 0;
        goto LABEL_10;
      }
      -[INIntent backingStore](self, "backingStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_objectDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v16, "length") != 0;

    }
    else
    {
      v10 = 0;
    }

  }
LABEL_10:

  return v10;
}

- (NSDictionary)_parameterCombinations
{
  NSDictionary *parameterCombinations;
  NSDictionary *v4;
  NSDictionary *v5;
  _QWORD v7[5];

  parameterCombinations = self->_parameterCombinations;
  if (!parameterCombinations)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__INIntent__parameterCombinations__block_invoke;
    v7[3] = &unk_1E22904D0;
    v7[4] = self;
    -[INIntent _querySchemaWithBlock:contentOptions:](self, "_querySchemaWithBlock:contentOptions:", v7, 8);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_parameterCombinations;
    self->_parameterCombinations = v4;

    parameterCombinations = self->_parameterCombinations;
  }
  return parameterCombinations;
}

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)_isConfigurable
{
  void *v2;
  char v3;

  -[INIntent _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConfigurable");

  return v3;
}

- (INIntent)init
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  INIntent *v12;
  void *v13;
  void *v14;
  INIntent *v15;
  void *v16;
  void *v17;
  INIntent *v18;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
    goto LABEL_9;
  v4 = (void *)objc_opt_class();
  if (!objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()))
    goto LABEL_9;
  objc_msgSend((id)objc_opt_class(), "intentDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_9;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_opt_class(), "shouldSkipDefaultSchemaCheck") & 1) == 0)
  {
    if (+[INSchema _defaultSchemaCanSupportIntent:](INSchema, "_defaultSchemaCanSupportIntent:", v7))
    {
      +[INSchema defaultSchema](INSchema, "defaultSchema");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "intentWithName:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[INSchema _defaultSchemaForBundle:](INSchema, "_defaultSchemaForBundle:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intentWithName:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_8:
    v12 = v9;

    self = v12;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[INIntent initWithIdentifier:backingStore:](self, "initWithIdentifier:backingStore:", v14, 0);

    -[INIntent launchId](v15, "launchId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      INContainingBundleIdentifierForCurrentProcess();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntent _setLaunchId:](v15, "_setLaunchId:", v17);

    }
    self = v15;
    v18 = self;
    goto LABEL_12;
  }
  v20 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v21 = 136315394;
    v22 = "-[INIntent init]";
    v23 = 2112;
    v24 = v7;
    _os_log_error_impl(&dword_18BEBC000, v20, OS_LOG_TYPE_ERROR, "%s Unable to initialize '%@'. Please make sure that your intent definition file is valid.", (uint8_t *)&v21, 0x16u);
  }

  v18 = 0;
LABEL_12:

  return v18;
}

- (INIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  INIntent *v13;
  id v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INIntent;
  v7 = a4;
  v15 = 0;
  v8 = -[INIntent _initWithIdentifier:backingStore:schema:error:](-[INIntent init](&v16, sel_init), "_initWithIdentifier:backingStore:schema:error:", v6, v7, 0, &v15);

  v9 = v15;
  v10 = v8;
  v11 = v10;
  if (v9)
  {
    v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[INIntent initWithIdentifier:backingStore:]";
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v9;
      _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s Failed to initialize intent with identifier %@ due to error %@", buf, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v13 = (INIntent *)v10;
  }

  return v13;
}

- (void)_setLaunchId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INIntent _metadata](self, "_metadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLaunchId:", v4);

}

+ (id)intentDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return INIntentSchemaGetIntentDescriptionWithFacadeClass(v2);
}

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 0;
}

- (NSString)_categoryVerb
{
  int64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[INIntent _intentCategory](self, "_intentCategory") == 10
    && (v3 = -[INIntent _intents_toggleState](self, "_intents_toggleState")) != 0)
  {
    v4 = CFSTR("Turn Off");
    if (v3 != 2)
      v4 = 0;
    if (v3 == 1)
      v4 = CFSTR("Turn On");
    v5 = v4;
  }
  else
  {
    -[INIntent _metadata](self, "_metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "categoryVerb");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      -[INIntent _metadata](self, "_metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "categoryVerb");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = CFSTR("Do");
    }

  }
  return (NSString *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  INParameterContexts *parameterContexts;
  INParameterContexts *v5;
  INJSONEncoder *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_backingStore, CFSTR("backingStore"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_parameterCombinations, CFSTR("parameterCombinations"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_recordRoute, CFSTR("recordRoute"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_recordDeviceUID, CFSTR("recordDeviceUID"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_recordDeviceIdentifier, CFSTR("recordDeviceIdentifier"));
  objc_msgSend(v9, "encodeInt32:forKey:", self->_audioSessionID, CFSTR("audioSessionID"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_indexingHash, CFSTR("_indexingHash"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_donationMetadata, CFSTR("donationMetadata"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_shouldForwardToAppOnSucccess, CFSTR("_shouldForwardToAppOnSucccess"));
  parameterContexts = self->_parameterContexts;
  if (parameterContexts && !-[INParameterContexts _isEmpty](parameterContexts, "_isEmpty"))
  {
    v5 = self->_parameterContexts;
    v6 = objc_alloc_init(INJSONEncoder);
    -[INIntent _codableDescription](self, "_codableDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INParameterContexts _intents_encodeWithJSONEncoder:codableDescription:](v5, "_intents_encodeWithJSONEncoder:codableDescription:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("_parameterContexts"));
  }

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

- (id)_nonNilParameters
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[INIntent backingStore](self, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[INIntent backingStore](self, "backingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_nonNilAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "intentDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v8, "slotDescriptions", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v15, "facadePropertyName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[INIntent valueForKey:](self, "valueForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if ((INObjectIsConsideredNil(v17, objc_msgSend(v15, "isEnum")) & 1) == 0)
          {
            objc_msgSend(v15, "facadePropertyName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v18);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    return v9;
  }
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[INIntent _inCodable](self, "_inCodable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "isValidKey:", v4))
  {
    objc_msgSend(v6, "valueForPropertyNamed:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)INIntent;
    -[INIntent valueForKey:](&v10, sel_valueForKey_, v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)intentSlotDescriptions
{
  objc_class *v2;
  void *v3;
  void *v4;

  v2 = (objc_class *)objc_opt_class();
  INIntentSchemaGetIntentDescriptionWithFacadeClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slotDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (INShortcutAvailabilityOptions)shortcutAvailability
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  INShortcutAvailabilityOptions v8;

  v8 = 0;
  -[INIntent _metadata](self, "_metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shortcutAvailabilitiesCount");

  if (!v4)
    return 0;
  for (i = 0; i != v4; ++i)
  {
    -[INIntent _metadata](self, "_metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    INShortcutAvailabilityOptionsAddBackingType((uint64_t *)&v8, objc_msgSend(v6, "shortcutAvailabilityAtIndex:", i));

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[PBCodable hash](self->_backingStore, "hash") ^ v3;
}

- (INIntent)initWithCoder:(id)a3
{
  id v4;
  INIntent *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *parameterCombinations;
  void *v15;
  uint64_t v16;
  NSUUID *recordDeviceUID;
  uint64_t v18;
  NSString *recordDeviceIdentifier;
  uint64_t v20;
  INIntentDonationMetadata *donationMetadata;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  INJSONDecoder *v34;
  void *v35;
  uint64_t v36;
  INParameterContexts *parameterContexts;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)INIntent;
  v5 = -[INIntent init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backingStore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent setBackingStore:](v5, "setBackingStore:", v7);

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("parameterCombinations"));
    v13 = objc_claimAutoreleasedReturnValue();
    parameterCombinations = v5->_parameterCombinations;
    v5->_parameterCombinations = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordRoute"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent _setRecordRoute:](v5, "_setRecordRoute:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordDeviceUID"));
    v16 = objc_claimAutoreleasedReturnValue();
    recordDeviceUID = v5->_recordDeviceUID;
    v5->_recordDeviceUID = (NSUUID *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordDeviceIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    recordDeviceIdentifier = v5->_recordDeviceIdentifier;
    v5->_recordDeviceIdentifier = (NSString *)v18;

    v5->_audioSessionID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("audioSessionID"));
    v5->_shouldForwardToAppOnSucccess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldForwardToAppOnSucccess"));
    v5->_indexingHash = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_indexingHash"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("donationMetadata"));
    v20 = objc_claimAutoreleasedReturnValue();
    donationMetadata = v5->_donationMetadata;
    v5->_donationMetadata = (INIntentDonationMetadata *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, v24, v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("_parameterContexts"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v28;
    if (v29)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v29;
      else
        v30 = 0;
    }
    else
    {
      v30 = 0;
    }
    v31 = v30;

    objc_msgSend(v31, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v32, "count");
    if (v33)
    {
      v34 = objc_alloc_init(INJSONDecoder);
      -[INIntent _codableDescription](v5, "_codableDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[INParameterContexts _intents_decodeWithJSONDecoder:codableDescription:from:](INParameterContexts, "_intents_decodeWithJSONDecoder:codableDescription:from:", v34, v35, v29);
      v36 = objc_claimAutoreleasedReturnValue();
      parameterContexts = v5->_parameterContexts;
      v5->_parameterContexts = (INParameterContexts *)v36;

    }
  }

  return v5;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setBackingStore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)_setRecordRoute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

id __31__INIntent__codableDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intentCodableDescriptionWithIntentClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_querySchemaWithBlock:(id)a3 contentOptions:(unint64_t)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  id v9;
  int CanMapLSDatabase;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a3;
  -[INIntent launchId](self, "launchId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v15 = 0;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSchema _defaultSchemaForBundle:contentOptions:](INSchema, "_defaultSchemaForBundle:contentOptions:", v32, a4);
    v33 = objc_claimAutoreleasedReturnValue();

    v6[2](v6, v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)v33;
    goto LABEL_24;
  }
  -[INIntent launchId](self, "launchId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  INExtractAppInfoFromSiriLaunchId(v8, &v37, 0);
  v9 = v37;

  CanMapLSDatabase = INThisProcessCanMapLSDatabase(0);
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v9);

  if (v13)
  {
    v14 = v11;
  }
  else if (CanMapLSDatabase)
  {
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v9, 0, &v36);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v36;
    if (v16)
    {
      v17 = v16;
      v18 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v40 = "-[INIntent _querySchemaWithBlock:contentOptions:]";
        v41 = 2114;
        v42 = v9;
        v43 = 2114;
        v44 = v17;
        _os_log_error_impl(&dword_18BEBC000, v18, OS_LOG_TYPE_ERROR, "%s Unable to get bundle record with identifier: %{public}@, error: %{public}@", buf, 0x20u);
      }

    }
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v14, "intentDefinitionURLs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent _className](self, "_className");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = v14;
    v35 = v11;
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
    }
    else
    {
      v23 = 0;
    }
    v25 = v23;

    objc_msgSend(v25, "containingBundleRecord");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (void *)v26;
    else
      v28 = v22;
    v29 = v28;

    objc_msgSend(v29, "bundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSchema _schemaWithIntentDefinitionURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:](INSchema, "_schemaWithIntentDefinitionURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:", v31, v9, v30, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v6[2](v6, (uint64_t)v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v35;
  }
  else
  {
    v15 = 0;
    v24 = 0;
  }

  if (!v24)
    goto LABEL_23;
LABEL_24:

  return v24;
}

- (id)_initWithIdentifier:(id)a3 schema:(id)a4 name:(id)a5 data:(id)a6
{
  id v10;
  id v11;
  NSString *v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  INCodable *v20;
  INIntent *v21;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (NSString *)a5;
  v13 = a6;
  objc_msgSend(v11, "intentCodableDescriptionWithIntentClassName:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = NSClassFromString(v12);
    INIntentSchemaGetIntentDescriptionWithFacadeClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = NSClassFromString(v12);
      INIntentSchemaGetIntentDescriptionWithFacadeClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_msgSend(v18, "dataClass");
      if (v19)
        v20 = (INCodable *)objc_msgSend([v19 alloc], "initWithData:", v13);
      else
        v20 = 0;
      v21 = (INIntent *)objc_msgSend([v17 alloc], "_initWithIdentifier:backingStore:schema:error:", v10, v20, v11, 0);

    }
    else
    {
      v20 = -[INCodable initWithCodableDescription:data:]([INCodable alloc], "initWithCodableDescription:data:", v14, v13);
      v23 = 0;
      self = (INIntent *)-[INIntent _initWithIdentifier:backingStore:schema:error:](self, "_initWithIdentifier:backingStore:schema:error:", v10, v20, v11, &v23);
      v21 = self;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

id __34__INIntent__parameterCombinations__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_parameterCombinationsForClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __29__INIntent__defaultImageName__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "intentCodableDescriptionWithIntentClassName:", *(_QWORD *)(a1 + 32));
}

- (NSString)intentDescription
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (INImage)_keyImage
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[INIntent _sortedParameterImages](self, "_sortedParameterImages", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v4)
  {

LABEL_14:
    if (-[INIntent _type](self, "_type") != 1
      || (-[INIntent _keyImageWithIntentDescriptionStrategy](self, "_keyImageWithIntentDescriptionStrategy"),
          (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[INIntent _defaultImage](self, "_defaultImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    return (INImage *)v6;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      objc_msgSend(v9, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v9, "parameter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_parameterValueForParameterizedObject:", self);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = v10;

          v6 = v13;
        }
      }

    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v5);

  if (!v6)
    goto LABEL_14;
  return (INImage *)v6;
}

- (id)_keyImageWithIntentDescriptionStrategy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  INKeyImageUtilitiesSortedSubProducersForSlotComposingProducer(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForSlotComposer:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE038E40))
  {
    objc_msgSend(v5, "_keyImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)_sortedParameterImages
{
  id v3;
  uint64_t (*v4)(uint64_t, void *);
  uint64_t *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  -[INIntent _parameterImages](self, "_parameterImages");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[INIntent _type](self, "_type") == 1)
  {
    v13 = MEMORY[0x1E0C809B0];
    v4 = __34__INIntent__sortedParameterImages__block_invoke;
    v5 = &v13;
  }
  else
  {
    v6 = v3;
    if (-[INIntent _type](self, "_type") != 2)
      goto LABEL_7;
    v12 = MEMORY[0x1E0C809B0];
    v4 = __34__INIntent__sortedParameterImages__block_invoke_2;
    v5 = &v12;
  }
  v5[1] = 3221225472;
  v5[2] = (uint64_t)v4;
  v5[3] = (uint64_t)&unk_1E2290458;
  v5[4] = (uint64_t)self;
  v7 = (void *)MEMORY[0x18D7812C4]();
  v6 = v3;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __34__INIntent__sortedParameterImages__block_invoke_3;
    v10[3] = &unk_1E2290480;
    v11 = v7;
    v8 = v7;
    objc_msgSend(v3, "sortedArrayUsingComparator:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return (NSArray *)v6;
}

- (void)_injectProxiesForParameterImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[INIntent _parameterImages](self, "_parameterImages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("image"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)-[INIntent copy](self, "copy");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__INIntent_INImageProxyInjecting___injectProxiesForParameterImages_completion___block_invoke;
  v13[3] = &unk_1E2288E30;
  v14 = v8;
  v15 = v10;
  v16 = v6;
  v11 = v6;
  v12 = v8;
  objc_msgSend(v9, "_injectProxiesForImages:completion:", v7, v13);

}

- (NSArray)_parameterImages
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  INParameterImage *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  INParameterImage *v17;
  void *v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[INIntent _metadata](self, "_metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterImages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v10 = [INParameterImage alloc];
        v11 = objc_opt_class();
        objc_msgSend(v9, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[INParameter parameterForClass:keyPath:](INParameter, "parameterForClass:keyPath:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "pairImageValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromImageValue(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[INParameterImage initWithParameter:image:](v10, "initWithParameter:image:", v13, v16);
        objc_msgSend(v21, "addObject:", v17);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  v18 = (void *)objc_msgSend(v21, "copy");
  return (NSArray *)v18;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__INIntent_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
  v10[3] = &unk_1E2288E58;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[INIntent _injectProxyForDefaultImage:completion:](self, "_injectProxyForDefaultImage:completion:", v9, v10);

}

- (void)_injectProxyForDefaultImage:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD *);
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = (void (**)(id, void *, _QWORD *))a3;
  v7 = a4;
  -[INIntent _defaultImage](self, "_defaultImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)-[INIntent copy](self, "copy");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__INIntent_INImageProxyInjecting___injectProxyForDefaultImage_completion___block_invoke;
    v10[3] = &unk_1E2292618;
    v10[4] = v9;
    v11 = v7;
    v6[2](v6, v8, v10);

  }
  else if (v7)
  {
    (*((void (**)(id, INIntent *))v7 + 2))(v7, self);
  }

}

void __70__INIntent_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__INIntent_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
  v5[3] = &unk_1E2288E58;
  v6 = v4;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(a2, "_injectProxiesForParameterImages:completion:", v6, v5);

}

- (INImage)_defaultImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[INIntent _metadata](self, "_metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultImageValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    INIntentSlotValueTransformFromImageValue(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[INIntent _defaultImageName](self, "_defaultImageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[INImage imageNamed:](INImage, "imageNamed:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[INImage imageNamed:](INImage, "imageNamed:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntent _setDefaultImage:](self, "_setDefaultImage:", v7);

    }
    else
    {
      v5 = 0;
    }

  }
  -[INIntent extensionBundleId](self, "extensionBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "_setBundleIdentifier:", v8);
  }
  else
  {
    -[INIntent launchId](self, "launchId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setBundleIdentifier:", v9);

  }
  return (INImage *)v5;
}

- (id)_defaultImageName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[INIntent _className](self, "_className");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent _inCodable](self, "_inCodable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_objectDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__INIntent__defaultImageName__block_invoke;
    v8[3] = &unk_1E2290408;
    v9 = v3;
    -[INIntent _querySchemaWithBlock:contentOptions:](self, "_querySchemaWithBlock:contentOptions:", v8, 31);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "defaultImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __96__INIntent_INImageProxyInjecting___injectProxiesForImagesUsingCustomCodableStrategy_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __79__INIntent_INImageProxyInjecting___injectProxiesForParameterImages_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__INIntent_INImageProxyInjecting___injectProxiesForParameterImages_completion___block_invoke_2;
  v8[3] = &unk_1E2288E08;
  v7 = v5;
  v9 = v7;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  objc_msgSend(*(id *)(a1 + 40), "_setParameterImages:", v7);
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 40));

}

void __70__INIntent_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v7, "_injectProxiesForImagesUsingCustomCodableStrategy:completion:", v5, v6);
  else
    objc_msgSend(v7, "_injectProxiesForImagesUsingIntentSlotDescriptionStrategy:completion:", v5, v6);

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_intents_preferredScaledImageSize
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = 390.0;
  v3 = 390.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)_injectProxiesForImagesUsingCustomCodableStrategy:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_class *v21;
  void *v22;
  int v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *group;
  void *v28;
  void (**v29)(id, id, _QWORD *);
  uint64_t v30;
  INIntent *v31;
  id obj;
  _QWORD block[5];
  id v34;
  _QWORD v35[5];
  id v36;
  NSObject *v37;
  _QWORD v38[4];
  NSObject *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v29 = (void (**)(id, id, _QWORD *))a3;
  v26 = a4;
  v28 = (void *)-[INIntent copy](self, "copy");
  group = dispatch_group_create();
  v25 = dispatch_queue_create("com.apple.intents.custom-codable-strategy-queue", MEMORY[0x1E0C80D50]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v31 = self;
  -[INIntent _codableDescription](self, "_codableDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    do
    {
      v11 = 0;
      v30 = v9;
      do
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          objc_msgSend(v13, "valueTransformer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (objc_class *)objc_msgSend((id)objc_opt_class(), "transformedValueClass");
          NSStringFromSelector((SEL)objc_msgSend(v13, "getter"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[INIntent backingStore](v31, "backingStore");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "valueForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v19 = v10;
            NSStringFromClass(v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v20, "isEqualToString:", v22);

            if (v23)
            {
              v24 = v18;
              dispatch_group_enter(group);
              v38[0] = MEMORY[0x1E0C809B0];
              v38[1] = 3221225472;
              v38[2] = __96__INIntent_INImageProxyInjecting___injectProxiesForImagesUsingCustomCodableStrategy_completion___block_invoke;
              v38[3] = &unk_1E2288DE0;
              v39 = group;
              v40 = v28;
              v41 = v16;
              v29[2](v29, v24, v38);

              v10 = v19;
              v9 = v30;
            }
            else
            {
              v10 = v19;
              v9 = v30;
              if (-[objc_class conformsToProtocol:](v15, "conformsToProtocol:", &unk_1EE0390D0))
              {
                dispatch_group_enter(group);
                v35[0] = MEMORY[0x1E0C809B0];
                v35[1] = 3221225472;
                v35[2] = __96__INIntent_INImageProxyInjecting___injectProxiesForImagesUsingCustomCodableStrategy_completion___block_invoke_2;
                v35[3] = &unk_1E2288E98;
                v35[4] = v28;
                v36 = v16;
                v37 = group;
                objc_msgSend(v18, "_injectProxiesForImages:completion:", v29, v35);

              }
            }
          }

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v9);
  }

  if (v26)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__INIntent_INImageProxyInjecting___injectProxiesForImagesUsingCustomCodableStrategy_completion___block_invoke_3;
    block[3] = &unk_1E2293BE8;
    block[4] = v28;
    v34 = v26;
    dispatch_group_notify(group, v25, block);

  }
}

- (NSString)verb
{
  void *v2;
  void *v3;

  -[INIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verb");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[INIntent _inCodable](self, "_inCodable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent _inCodable](self, "_inCodable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if ((objc_msgSend(v8, "isValidKey:", v7) & 1) != 0)
    {
      objc_msgSend(v8, "setValue:forPropertyNamed:", v6, v7);
    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __37__INIntent_setValue_forUndefinedKey___block_invoke;
      v16[3] = &unk_1E2290598;
      v16[4] = self;
      -[INIntent _querySchemaWithBlock:contentOptions:](self, "_querySchemaWithBlock:contentOptions:", v16, 31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setObjectDescription:", v10);
      if ((objc_msgSend(v8, "isValidKey:", v7) & 1) != 0)
      {
        objc_msgSend(v8, "setValue:forPropertyNamed:", v6, v7);
      }
      else
      {
        v11 = (void *)INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
        {
          v12 = v11;
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v18 = "-[INIntent setValue:forUndefinedKey:]";
          v19 = 2112;
          v20 = v7;
          v21 = 2112;
          v22 = v14;
          _os_log_fault_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_FAULT, "%s '%@' is an invalid parameter for '%@'. Please make sure that your intent definition file is valid.", buf, 0x20u);

        }
      }

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)INIntent;
    -[INIntent setValue:forUndefinedKey:](&v15, sel_setValue_forUndefinedKey_, v6, v7);
  }

}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  -[INIntent setValue:forUndefinedKey:](self, "setValue:forUndefinedKey:", a3, a4);
  return 1;
}

- (NSString)domain
{
  void *v2;
  void *v3;

  -[INIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)_setParameterImages:(id)a3
{
  void *v4;
  char v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  -[INIntent _parameterImages](self, "_parameterImages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToArray:", v9);

  if ((v5 & 1) == 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __32__INIntent__setParameterImages___block_invoke;
    v10[3] = &unk_1E22904A8;
    v11 = v6;
    v7 = v6;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
    -[INIntent _metadata](self, "_metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setParameterImages:", v7);

  }
}

- (int64_t)_preferredInteractionDirection
{
  return self->__preferredInteractionDirection;
}

- (id)_intentInstanceDescription
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;
  INIntentDescription *v14;
  Class v15;
  NSString *v16;
  void *v17;
  SEL v18;
  NSString *v19;
  NSString *v20;
  SEL v21;
  void *v22;
  INIntentDescription *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *v27;
  id v28;

  -[INIntent backingStore](self, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[INIntent backingStore](self, "backingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_objectDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "typeName");
    v7 = objc_claimAutoreleasedReturnValue();
    -[INIntent _className](self, "_className");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR("Response"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!NSClassFromString(v9))
    {

      v9 = (NSString *)CFSTR("INIntentResponse");
    }
    -[INIntent extensionBundleId](self, "extensionBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "length"))
    {
      -[INIntent _intents_launchIdForCurrentPlatform](self, "_intents_launchIdForCurrentPlatform");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v10;
      INExtractAppInfoFromSiriLaunchId(v11, &v28, 0);
      v12 = v28;

      v10 = v12;
    }
    v26 = v9;
    v27 = v6;
    if (objc_msgSend(v10, "length") && -[NSString length](v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), CFSTR("sirikit.intents.custom."), v10, v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    v14 = [INIntentDescription alloc];
    v15 = NSClassFromString(v8);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("handle%@:completion:"), v7);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)v7;
    v18 = NSSelectorFromString(v16);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("confirm%@:completion:"), v17);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    v20 = v8;
    v21 = NSSelectorFromString(v19);
    INIntentSlotDescriptionsWithCodable(v5);
    v25 = v5;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v14, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", v20, v26, v15, 0, v24, 0, v18, v21, v22);

    return v23;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "intentDescription");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)_sharedExtensionContextUUIDForIntentClassName:(id)a3
{
  id v3;
  void *v4;

  if (a3)
  {
    v3 = a3;
    os_unfair_lock_lock((os_unfair_lock_t)&sharedContextExtensionUUIDDictionaryLock);
    objc_msgSend((id)sharedContextExtensionUUIDDictionary, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock((os_unfair_lock_t)&sharedContextExtensionUUIDDictionaryLock);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_injectProxiesForImagesUsingIntentSlotDescriptionStrategy:(id)a3 completion:(id)a4
{
  INImageProxyInjectionUtilitiesInjectProxiesIntoSlotComposer(self, a3, a4);
}

void __79__INIntent_INImageProxyInjecting___injectProxiesForParameterImages_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  INParameterImage *v7;
  void *v8;
  INParameterImage *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = [INParameterImage alloc];
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parameter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[INParameterImage initWithParameter:image:](v7, "initWithParameter:image:", v8, v6);

  objc_msgSend(v5, "addObject:", v9);
}

uint64_t __74__INIntent_INImageProxyInjecting___injectProxyForDefaultImage_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setDefaultImage:", a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __96__INIntent_INImageProxyInjecting___injectProxiesForImagesUsingCustomCodableStrategy_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "backingStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v4, *(_QWORD *)(a1 + 48));

  }
}

void __96__INIntent_INImageProxyInjecting___injectProxiesForImagesUsingCustomCodableStrategy_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "backingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, *(_QWORD *)(a1 + 40));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)_intents_backgroundHandlingAssertionForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  if (-[INIntent _type](self, "_type") == 2)
    -[INIntent _intents_allowAppToInitiatePlaybackForBundleIdentifier:context:error:](self, "_intents_allowAppToInitiatePlaybackForBundleIdentifier:context:error:", v8, a4, a5);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C9E3A8], "newAssertionForBundleIdentifier:withReason:level:", v8, CFSTR("User is directly engaging with the app in Siri"), 1);

  return v9;
}

- (void)_intents_allowAppToInitiatePlaybackForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5
{
  void *v5;
  void *v6;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13[9];

  if (!a4)
  {
    v13[7] = v5;
    v13[8] = v6;
    v8 = a3;
    objc_msgSend(getAVSystemControllerClass(), "sharedAVSystemController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = 0;
    v11 = objc_msgSend(v9, "setAttribute:forKey:error:", v8, v10, v13);

    v12 = v13[0];
    if ((v11 & 1) == 0)
      *a5 = objc_retainAutorelease(v12);

  }
}

- (int64_t)_intents_toggleState
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[INIntent _intentInstanceDescription](self, "_intentInstanceDescription", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slotDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "valueType") == 204)
        {
          objc_msgSend(v9, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[INIntent valueForKey:](self, "valueForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = objc_msgSend(v12, "integerValue");
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)localizeValueOfSlotDescription:(id)a3 withLocalizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "facadePropertyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent valueForKey:](self, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizeValue:withLocalizer:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)_title
{
  return (NSString *)-[INIntent _titleForLanguage:](self, "_titleForLanguage:", 0);
}

- (id)_titleForLanguage:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v13;

  v4 = a3;
  +[INIntentSummaryCache sharedCache](INIntentSummaryCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v6 = objc_msgSend(v5, "getTitle:forIntent:languageCode:", &v13, self, v4);
  v7 = v13;

  if ((v6 & 1) == 0)
  {
    +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent _titleWithLocalizer:fromBundleURL:](self, "_titleWithLocalizer:fromBundleURL:", v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    +[INIntentSummaryCache sharedCache](INIntentSummaryCache, "sharedCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:forIntent:languageCode:", v9, self, v4);

    v7 = (id)v9;
  }
  v11 = v7;

  return v11;
}

- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  INIntent *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char isKindOfClass;
  void *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;

  v6 = a3;
  v7 = a4;
  -[INIntent _nonNilParameters](self, "_nonNilParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "_ignoredParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  -[INIntent _parameterCombinations](self, "_parameterCombinations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v16 = 0;
    goto LABEL_17;
  }
  if (-[INIntent _type](self, "_type") == 2)
  {
    objc_msgSend(v12, "titleFormatStringLocID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleFormatString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_localizationTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent _localizedCombinationStringForKey:value:localizationTable:bundleURL:localizer:](self, "_localizedCombinationStringForKey:value:localizationTable:bundleURL:localizer:", v13, v14, v15, v7, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  -[INIntent _intents_launchIdForCurrentPlatform](self, "_intents_launchIdForCurrentPlatform");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  INExtractAppInfoFromSiriLaunchId(v17, &v71, 0);
  v18 = v71;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v19;
  v67 = v18;
  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v19, "siriActionDefinitionURLs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    goto LABEL_10;
  }
  if (v18)
  {
    objc_msgSend(_INVCIntentDefinitionManagerClass(), "appInfoForBundleID:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "definedIntents");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v23 = 0;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v23, "containsObject:", v26);

  v65 = v23;
  v68 = v24;
  if (!v27)
  {
    objc_msgSend(v12, "titleFormatStringLocID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleFormatString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_localizationTable");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bundleURL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = self;
    v40 = v31;
    v41 = v34;
    v42 = v35;
    v43 = v36;
LABEL_15:
    -[INIntent _localizedCombinationStringForKey:value:localizationTable:bundleURL:localizer:](v39, "_localizedCombinationStringForKey:value:localizationTable:bundleURL:localizer:", v40, v41, v42, v43, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  +[INSchema _defaultSchemaForBundle:](INSchema, "_defaultSchemaForBundle:", v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent _className](self, "_className");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_parameterCombinationsForClassName:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", v9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "titleFormatString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "titleFormatString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = objc_msgSend(v32, "isEqualToString:", v33);

  if (!(_DWORD)v30)
  {
    objc_msgSend(v12, "titleFormatStringLocID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleFormatString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_localizationTable");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = self;
    v40 = v34;
    v41 = v35;
    v42 = v36;
    v43 = v7;
    goto LABEL_15;
  }
  objc_msgSend(v31, "titleFormatStringLocID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "titleFormatString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_localizationTable");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bundleURL");
  v63 = v7;
  v37 = v6;
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent _localizedCombinationStringForKey:value:localizationTable:bundleURL:localizer:](self, "_localizedCombinationStringForKey:value:localizationTable:bundleURL:localizer:", v34, v35, v36, v38, v37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v37;
  v7 = v63;
LABEL_16:

LABEL_17:
  if (!objc_msgSend(v16, "length"))
  {
    -[INIntent backingStore](self, "backingStore");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_33:

      goto LABEL_34;
    }
    v45 = v6;
    -[INIntent backingStore](self, "backingStore");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "_objectDescription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[INIntent backingStore](self, "backingStore");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "_objectDescription");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "title");
      v50 = (id)objc_claimAutoreleasedReturnValue();

      -[INIntent _intents_launchIdForCurrentPlatform](self, "_intents_launchIdForCurrentPlatform");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0;
      INExtractAppInfoFromSiriLaunchId(v51, &v70, 0);
      v52 = v70;

      if (v52)
      {
        v6 = v45;
        v53 = objc_msgSend(v45, "bundleWithIdentifier:fileURL:", v52, 0);
        if (v53)
        {
          v54 = v53;
          v69 = v50;
          v64 = v7;
          objc_msgSend(v44, "titleLocID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "titleLocID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "_localizationTable");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "tableName");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          INLocalizedStringFromBundle(v55, v56, v58, v45, v54, 0);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v59, "length"))
          {
            objc_msgSend(v44, "titleLocID");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "isEqualToString:", v59);

            v7 = v64;
            if ((v61 & 1) == 0)
            {
              v50 = v59;

              v6 = v45;
              goto LABEL_31;
            }
            v6 = v45;
          }
          else
          {
            v6 = v45;
            v7 = v64;
          }
          v50 = v69;
LABEL_31:

        }
      }
      else
      {
        v6 = v45;
      }

      v16 = v50;
      goto LABEL_33;
    }
    v6 = v45;
  }
LABEL_34:

  return v16;
}

- (NSString)_subtitle
{
  return (NSString *)-[INIntent _subtitleForLanguage:](self, "_subtitleForLanguage:", 0);
}

- (id)_subtitleForLanguage:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v13;

  v4 = a3;
  +[INIntentSummaryCache sharedCache](INIntentSummaryCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v6 = objc_msgSend(v5, "getSubtitle:forIntent:languageCode:", &v13, self, v4);
  v7 = v13;

  if ((v6 & 1) == 0)
  {
    +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent _subtitleWithLocalizer:fromBundleURL:](self, "_subtitleWithLocalizer:fromBundleURL:", v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    +[INIntentSummaryCache sharedCache](INIntentSummaryCache, "sharedCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSubtitle:forIntent:languageCode:", v9, self, v4);

    v7 = (id)v9;
  }
  v11 = v7;

  return v11;
}

- (id)_subtitleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  INIntent *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;

  v6 = a3;
  v7 = a4;
  -[INIntent _nonNilParameters](self, "_nonNilParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "_ignoredParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  -[INIntent _parameterCombinations](self, "_parameterCombinations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v16 = 0;
    goto LABEL_17;
  }
  if (-[INIntent _type](self, "_type") != 2)
  {
    -[INIntent _intents_launchIdForCurrentPlatform](self, "_intents_launchIdForCurrentPlatform");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    INExtractAppInfoFromSiriLaunchId(v17, &v50, 0);
    v18 = v50;

    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v19;
    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v19, "siriActionDefinitionURLs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "allKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!v18)
      {
        v23 = 0;
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v23;
        v27 = objc_msgSend(v23, "containsObject:", v26);

        v49 = (void *)v24;
        if (v27)
        {
          +[INSchema _defaultSchemaForBundle:](INSchema, "_defaultSchemaForBundle:", v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[INIntent _className](self, "_className");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "_parameterCombinationsForClassName:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKey:", v9);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "subtitleFormatString");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "subtitleFormatString");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v30) = objc_msgSend(v32, "isEqualToString:", v33);

          if ((_DWORD)v30)
          {
            objc_msgSend(v31, "subtitleFormatStringLocID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "subtitleFormatString");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "_localizationTable");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "bundleURL");
            v46 = v18;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[INIntent _localizedCombinationStringForKey:value:localizationTable:bundleURL:localizer:](self, "_localizedCombinationStringForKey:value:localizationTable:bundleURL:localizer:", v34, v35, v36, v37, v6);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = v46;
LABEL_16:

            goto LABEL_17;
          }
          objc_msgSend(v12, "subtitleFormatStringLocID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "subtitleFormatString");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_localizationTable");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = self;
          v41 = v34;
          v42 = v35;
          v43 = v36;
          v44 = v7;
        }
        else
        {
          objc_msgSend(v12, "subtitleFormatStringLocID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "subtitleFormatString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_localizationTable");
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v24;
          v35 = (void *)v38;
          objc_msgSend(v39, "bundleURL");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = self;
          v41 = v31;
          v42 = v34;
          v43 = v35;
          v44 = v36;
        }
        -[INIntent _localizedCombinationStringForKey:value:localizationTable:bundleURL:localizer:](v40, "_localizedCombinationStringForKey:value:localizationTable:bundleURL:localizer:", v41, v42, v43, v44, v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      objc_msgSend(_INVCIntentDefinitionManagerClass(), "appInfoForBundleID:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "definedIntents");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_10;
  }
  objc_msgSend(v12, "subtitleFormatStringLocID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subtitleFormatString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_localizationTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent _localizedCombinationStringForKey:value:localizationTable:bundleURL:localizer:](self, "_localizedCombinationStringForKey:value:localizationTable:bundleURL:localizer:", v13, v14, v15, v7, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v16;
}

- (NSString)_localizedVerb
{
  void *v2;
  void *v3;

  -[INIntent _categoryVerb](self, "_categoryVerb");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringWithLocalizer(v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_localizedCombinationStringForKey:(id)a3 value:(id)a4 localizationTable:(id)a5 bundleURL:(id)a6 localizer:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  __CFBundle *v24;
  __CFString *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  __CFString *v43;
  __CFString *v44;
  id v45;

  v12 = a3;
  v42 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v13, "bundleIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_6;
  v17 = (void *)v16;
  -[INIntent extensionBundleId](self, "extensionBundleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "containsString:", v19))
  {
    -[INIntent extensionBundleId](self, "extensionBundleId");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  if (!v20)
  {
LABEL_6:
    -[INIntent _intents_launchIdForCurrentPlatform](self, "_intents_launchIdForCurrentPlatform");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    INExtractAppInfoFromSiriLaunchId(v21, &v45, 0);
    v20 = v45;

  }
  if (objc_msgSend(v15, "bundleWithIdentifier:fileURL:", 0, v14))
  {
    if (v14)
      goto LABEL_16;
  }
  else
  {
    objc_msgSend(v15, "bundleWithIdentifier:fileURL:", v20, 0);
    if (v14)
      goto LABEL_16;
  }
  objc_msgSend(v15, "languageCode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22 && v20)
  {
    v23 = _INVCIntentDefinitionManagerClass();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v23, "intentDefinitionBundleURLForBundleID:", v20);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }
LABEL_16:
  v24 = (__CFBundle *)objc_msgSend(v15, "bundleWithIdentifier:fileURL:", v20, v14);
  objc_msgSend(v15, "languageCode");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v40 = v13;
  objc_msgSend(v13, "tableName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v12;
  if (-[INIntent _type](self, "_type") == 2)
  {
    v27 = objc_msgSend(v20, "hasPrefix:", CFSTR("com.apple."));
    -[INIntent backingStore](self, "backingStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v25;
    INLocalizedFormatStringFromCodable(v12, v42, v26, v24, v15, v28, 0, (const __CFString **)&v44, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v44;

    if (v29)
    {
      objc_msgSend(v15, "languageCode");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "isEqualToString:", v30))
      {
        v32 = v15;
      }
      else
      {
        +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", v30);
        v32 = (id)objc_claimAutoreleasedReturnValue();
      }
      v37 = v32;

      -[INIntent backingStore](self, "backingStore");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      INReplaceVariablesInFormatStringFromCodable(v29, v37, v38, 0, v27);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v42;
LABEL_29:

      goto LABEL_30;
    }
    v36 = 0;
    v33 = v42;
  }
  else
  {
    v43 = v25;
    v33 = v42;
    INLocalizedFormatStringFromSlotComposing(v12, v42, v26, v24, v15, self, MEMORY[0x1E0C9AA70], &v43);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v43;

    if (v29)
    {
      objc_msgSend(v15, "languageCode");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "isEqualToString:", v30))
      {
        v35 = v15;
      }
      else
      {
        +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", v30);
        v35 = (id)objc_claimAutoreleasedReturnValue();
      }
      v37 = v35;

      INReplaceVariablesInFormatStringFromSlotComposing(v29, v37, self);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    v36 = 0;
  }
LABEL_30:

  return v36;
}

- (id)_intents_bestBundleIdentifier
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  -[INIntent _intents_launchIdForCurrentPlatform](self, "_intents_launchIdForCurrentPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  INExtractAppInfoFromSiriLaunchId(v3, &v10, 0);
  v4 = v10;

  if (!v4)
  {
    -[INIntent extensionBundleId](self, "extensionBundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    INAppProxyForAppOrContainedPluginWithBundleIdentifier((uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "bundleIdentifier");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v5;
    }
    v4 = v8;

  }
  return v4;
}

- (id)_intents_bundleIdForLaunching
{
  void *v2;
  objc_class *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[INIntent _intents_bestBundleIdentifier](self, "_intents_bestBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v2;
    v6 = v4;
    if (_INSpecialCaseLaunchableBundleIdentifier_onceToken != -1)
      dispatch_once(&_INSpecialCaseLaunchableBundleIdentifier_onceToken, &__block_literal_global_34164);
    objc_msgSend((id)_INSpecialCaseLaunchableBundleIdentifier_overrides, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        v13 = 136315394;
        v14 = "_INSpecialCaseLaunchableBundleIdentifier";
        v15 = 2114;
        v16 = v8;
        _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s Choosing launchableApplicationBundleIdentifier=%{public}@, from launchableBundleIdentifierOverrides", (uint8_t *)&v13, 0x16u);
      }

      v10 = v8;
    }
    else
    {

      INLocalAppBundleIdentifierForIntentBundleIdentifier(v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_intents_bundleIdForDisplay
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[INIntent _intents_bestBundleIdentifier](self, "_intents_bestBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v4 = -[INIntent preferredCallProvider](self, "preferredCallProvider");
    else
      v4 = 0;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v3;
    v9 = v7;
    if (_INSpecialCaseDisplayableBundleIdentifier_onceToken != -1)
      dispatch_once(&_INSpecialCaseDisplayableBundleIdentifier_onceToken, &__block_literal_global_8);
    objc_msgSend((id)_INSpecialCaseDisplayableBundleIdentifier_overrides, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__34148;
      v24 = __Block_byref_object_dispose__34149;
      v25 = 0;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = ___INSpecialCaseDisplayableBundleIdentifier_block_invoke_19;
      v19[3] = &unk_1E228C470;
      v19[4] = &v20;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v19);
      v12 = objc_msgSend((id)v21[5], "isEqualToString:", CFSTR("com.apple.mobilephone")) ^ 1;
      if (v4 != 2)
        LOBYTE(v12) = 1;
      if ((v12 & 1) == 0)
      {
        v13 = (void *)v21[5];
        v21[5] = (uint64_t)CFSTR("com.apple.facetime");

      }
      v14 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        v15 = v21[5];
        *(_DWORD *)buf = 136315394;
        v27 = "_INSpecialCaseDisplayableBundleIdentifier";
        v28 = 2114;
        v29 = v15;
        _os_log_impl(&dword_18BEBC000, v14, OS_LOG_TYPE_INFO, "%s Choosing displayableApplicationBundleIdentifier=%{public}@, from displayableBundleIdentifierOverrides", buf, 0x16u);
      }
      v16 = (id)v21[5];
      _Block_object_dispose(&v20, 8);

    }
    else
    {
      v16 = 0;
    }

    if (v16)
    {
      v17 = v16;
    }
    else
    {
      INLocalAppBundleIdentifierForIntentBundleIdentifier(v8);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v17;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

+ (void)_setSharedExtensionContextUUID:(id)a3 forIntentClassName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (a4)
  {
    v5 = a4;
    v6 = a3;
    os_unfair_lock_lock((os_unfair_lock_t)&sharedContextExtensionUUIDDictionaryLock);
    v7 = (void *)sharedContextExtensionUUIDDictionary;
    if (!sharedContextExtensionUUIDDictionary)
    {
      sharedContextExtensionUUIDDictionary = MEMORY[0x1E0C9AA70];
      v7 = (void *)MEMORY[0x1E0C9AA70];
    }
    v10 = (id)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v5);

    v8 = objc_msgSend(v10, "copy");
    v9 = (void *)sharedContextExtensionUUIDDictionary;
    sharedContextExtensionUUIDDictionary = v8;

    os_unfair_lock_unlock((os_unfair_lock_t)&sharedContextExtensionUUIDDictionaryLock);
  }
}

- (NSString)typeName
{
  void *v3;
  char isKindOfClass;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  -[INIntent backingStore](self, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[INIntent launchId](self, "launchId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    INExtractAppInfoFromSiriLaunchId(v5, &v15, 0);
    v6 = v15;

    -[INIntent extensionBundleId](self, "extensionBundleId");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = v6;
    v10 = v9;

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[INIntent _className](self, "_className");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), CFSTR("sirikit.intents.custom."), v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v13;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "typeName");
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (NSString)utteranceString
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userUtterance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)intentId
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setDefaultImage:(id)a3
{
  id v4;
  void *v5;
  _INPBImageValue *v6;
  id v7;

  v4 = a3;
  -[INIntent _metadata](self, "_metadata");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToImageValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "setDefaultImageValue:", v5);
  }
  else
  {
    v6 = objc_alloc_init(_INPBImageValue);
    objc_msgSend(v7, "setDefaultImageValue:", v6);

  }
}

- (NSString)_uiExtensionBundleId
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemUIExtensionBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setUiExtensionBundleId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INIntent _metadata](self, "_metadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSystemUIExtensionBundleId:", v4);

}

- (NSString)_nanoLaunchId
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nanoLaunchId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setNanoLaunchId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INIntent _metadata](self, "_metadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNanoLaunchId:", v4);

}

- (int64_t)_executionContext
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INIntent _metadata](self, "_metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasExecutionContext");
  -[INIntent _metadata](self, "_metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executionContext") - 1;
  if (v6 <= 9)
    v7 = v6 + 1;
  else
    v7 = 0;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)_setExecutionContext:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  -[INIntent _metadata](self, "_metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if ((unint64_t)(a3 - 1) < 0xA)
    v5 = a3;
  else
    v5 = 0x7FFFFFFFLL;
  objc_msgSend(v4, "setExecutionContext:", v5);

}

- (int64_t)triggerMethod
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;

  -[INIntent _metadata](self, "_metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTriggerMethod");
  -[INIntent _metadata](self, "_metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "triggerMethod");
  v7 = 3;
  v8 = 4;
  if (v6 != 30)
    v8 = 0;
  if (v6 != 20)
    v7 = v8;
  v9 = 1;
  v10 = 2;
  if (v6 != 10)
    v10 = 0;
  if (v6)
    v9 = v10;
  if (v6 <= 19)
    v7 = v9;
  if (v4)
    v11 = v7;
  else
    v11 = 0;

  return v11;
}

- (int64_t)_idiom
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INIntent _metadata](self, "_metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasIdiom");
  -[INIntent _metadata](self, "_metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "idiom") - 1;
  if (v6 <= 6)
    v7 = v6 + 1;
  else
    v7 = 0;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)_setIdiom:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  -[INIntent _metadata](self, "_metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if ((unint64_t)(a3 - 1) < 7)
    v5 = a3;
  else
    v5 = 0x7FFFFFFFLL;
  objc_msgSend(v4, "setIdiom:", v5);

}

- (BOOL)_isPrimaryDisplayDisabled
{
  void *v2;
  char v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPrimaryDisplayDisabled");

  return v3;
}

- (void)_setPrimaryDisplayDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[INIntent _metadata](self, "_metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsPrimaryDisplayDisabled:", v3);

}

- (NSString)_originatingDeviceIDSIdentifier
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originatingDeviceIdsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setOriginatingDeviceIdsIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INIntent _metadata](self, "_metadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOriginatingDeviceIdsIdentifier:", v4);

}

- (NSString)_originatingDeviceRapportMediaSystemIdentifier
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originatingDeviceRapportMediaSystemId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setOriginatingDeviceRapportMediaSystemIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INIntent _metadata](self, "_metadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOriginatingDeviceRapportMediaSystemId:", v4);

}

- (NSString)_originatingDeviceRapportEffectiveIdentifier
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originatingDeviceRapportEffectiveId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setOriginatingDeviceRapportEffectiveIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INIntent _metadata](self, "_metadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOriginatingDeviceRapportEffectiveId:", v4);

}

- (NSNumber)_isOwnedByCurrentUser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INIntent _metadata](self, "_metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasIsOwnedByCurrentUser"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INIntent _metadata](self, "_metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isOwnedByCurrentUser"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)_setIsOwnedByCurrentUser:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INIntent _metadata](self, "_metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setIsOwnedByCurrentUser:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasIsOwnedByCurrentUser:", 0);

}

- (NSNumber)_msLimitReached
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INIntent _metadata](self, "_metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasMsLimitReached"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INIntent _metadata](self, "_metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "msLimitReached"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)_setMSLimitReached:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[INIntent _metadata](self, "_metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v5 = objc_msgSend(v6, "BOOLValue");
  else
    v5 = 0;
  objc_msgSend(v4, "setMsLimitReached:", v5);

}

- (NSNumber)_endpointMediaPlaybackEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INIntent _metadata](self, "_metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEndpointMediaPlaybackEnabled"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INIntent _metadata](self, "_metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "endpointMediaPlaybackEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)_setEndpointMediaPlaybackEnabled:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[INIntent _metadata](self, "_metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v5 = objc_msgSend(v6, "BOOLValue");
  else
    v5 = 0;
  objc_msgSend(v4, "setEndpointMediaPlaybackEnabled:", v5);

}

- (void)setShortcutAvailability:(INShortcutAvailabilityOptions)shortcutAvailability
{
  void *v5;
  _QWORD v6[5];

  -[INIntent _metadata](self, "_metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearShortcutAvailabilities");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__INIntent_setShortcutAvailability___block_invoke;
  v6[3] = &unk_1E2295130;
  v6[4] = self;
  INShortcutAvailabilityOptionsEnumerateBackingTypes(shortcutAvailability, v6);
}

- (void)setDonationMetadata:(INIntentDonationMetadata *)donationMetadata
{
  INIntentDonationMetadata *v4;
  INIntentDonationMetadata *v5;

  v4 = (INIntentDonationMetadata *)-[INIntentDonationMetadata copy](donationMetadata, "copy");
  v5 = self->_donationMetadata;
  self->_donationMetadata = v4;

}

- (void)_setAirPlayRouteIds:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INIntent _metadata](self, "_metadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAirPlayRouteIds:", v4);

}

- (NSArray)airPlayRouteIds
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "airPlayRouteIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)_endpointId
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_mediaRouteId
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRouteId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_preferredAudioOutputRouteId
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredAudioOutputRouteId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)didAuthenticateAppProtection
{
  void *v2;
  char v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bypassAppProtectionAuthentication");

  return v3;
}

- (void)setDidAuthenticateAppProtection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[INIntent _metadata](self, "_metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBypassAppProtectionAuthentication:", v3);

}

- (void)setImage:(INImage *)image forParameterNamed:(NSString *)parameterName
{
  NSString *v6;
  INImage *v7;
  id v8;

  v6 = parameterName;
  v7 = image;
  +[INParameter parameterForClass:keyPath:](INParameter, "parameterForClass:keyPath:", objc_opt_class(), v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[INIntent _setImage:forParameter:](self, "_setImage:forParameter:", v7, v8);
}

- (INImage)imageForParameterNamed:(NSString *)parameterName
{
  NSString *v4;
  void *v5;
  void *v6;

  v4 = parameterName;
  +[INParameter parameterForClass:keyPath:](INParameter, "parameterForClass:keyPath:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[INIntent _imageForParameter:](self, "_imageForParameter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (INImage *)v6;
}

- (id)_keyCodableAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[INIntent _codableDescription](self, "_codableDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyAttribute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_arrayWithObjectIfNonNil:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setImage:(id)a3 forParameter:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  INParameterImage *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  -[INIntent _parameterImages](self, "_parameterImages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12 = -[INParameterImage initWithParameter:image:]([INParameterImage alloc], "initWithParameter:image:", v7, v10);
    objc_msgSend(v11, "arrayByAddingObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent _setParameterImages:](self, "_setParameterImages:", v13);

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3880];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __35__INIntent__setImage_forParameter___block_invoke;
    v17[3] = &unk_1E2290430;
    v18 = v7;
    objc_msgSend(v14, "predicateWithBlock:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredArrayUsingPredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent _setParameterImages:](self, "_setParameterImages:", v16);

  }
}

- (id)_imageForParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[INIntent _parameterImages](self, "_parameterImages", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "parameter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToParameter:", v4);

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "image");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_currentParameterCombination
{
  void *v3;
  void *v4;
  void *v5;

  -[INIntent _parameterCombinations](self, "_parameterCombinations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent _nonNilParameters](self, "_nonNilParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)_configurableParameterCombinations
{
  NSDictionary *configurableParameterCombinations;
  NSDictionary *v4;
  NSDictionary *v5;
  _QWORD v7[5];

  configurableParameterCombinations = self->_configurableParameterCombinations;
  if (!configurableParameterCombinations)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__INIntent__configurableParameterCombinations__block_invoke;
    v7[3] = &unk_1E22904D0;
    v7[4] = self;
    -[INIntent _querySchemaWithBlock:contentOptions:](self, "_querySchemaWithBlock:contentOptions:", v7, 16);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_configurableParameterCombinations;
    self->_configurableParameterCombinations = v4;

    configurableParameterCombinations = self->_configurableParameterCombinations;
  }
  return configurableParameterCombinations;
}

- (NSDictionary)_resolvableParameterCombinations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[INIntent _codableDescription](self, "_codableDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  -[INIntent _parameterCombinations](self, "_parameterCombinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolvableParameterCombinationsWithParameterCombinations:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (BOOL)_supportsBackgroundExecution
{
  return -[INIntent _supportsBackgroundExecutionWithOptions:](self, "_supportsBackgroundExecutionWithOptions:", 1);
}

- (BOOL)_supportsBackgroundExecutionWithOptions:(unint64_t)a3
{
  int v4;
  void *v5;
  void *v6;

  v4 = -[INIntent _hasMatchingIntentHandlerIncludingRemoteExecution:](self, "_hasMatchingIntentHandlerIncludingRemoteExecution:", a3 & 1);
  -[INIntent _currentParameterCombination](self, "_currentParameterCombination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v4 &= objc_msgSend(v5, "supportsBackgroundExecution");

  return v4;
}

- (BOOL)_hasMatchingIntentHandlerIncludingRemoteExecution:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v3 = a3;
  -[INIntent extensionBundleId](self, "extensionBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = 0;
    LOBYTE(v8) = 1;
  }
  else
  {
    -[INIntent launchId](self, "launchId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    INExtractAppInfoFromSiriLaunchId(v9, &v17, 0);
    v7 = v17;

    +[INAppInfo appInfoWithIntent:](INAppInfo, "appInfoWithIntent:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "supportedIntents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent _className](self, "_className");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "containsObject:", v12);

    if (!v8 && v3 && v7)
    {
      objc_msgSend(_INVCIntentDefinitionManagerClass(), "appInfoForBundleID:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "supportedActionsByExtensions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntent _className](self, "_className");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_msgSend(v14, "containsObject:", v15);

    }
  }

  return v8;
}

- (BOOL)_isEligibleForSuggestions
{
  void *v2;
  char v3;

  -[INIntent _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEligibleForSuggestions");

  return v3;
}

- (id)_displayOrderedNonNilParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0C99E10];
  -[INIntent _nonNilParameters](self, "_nonNilParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__INIntent__displayOrderedNonNilParameters__block_invoke;
  v8[3] = &unk_1E22904F8;
  v8[4] = self;
  objc_msgSend(v5, "sortUsingComparator:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (int64_t)_indexingHash
{
  int64_t result;
  INJSONEncoderConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  result = self->_indexingHash;
  if (!result)
  {
    if (-[INIntent _type](self, "_type") == 2)
    {
      v4 = objc_alloc_init(INJSONEncoderConfiguration);
      -[INIntent _JSONDictionaryRepresentationWithConfiguration:](self, "_JSONDictionaryRepresentationWithConfiguration:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("parameters"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[INIntent _dictionaryRepresentation](self, "_dictionaryRepresentation");
      v4 = (INJSONEncoderConfiguration *)objc_claimAutoreleasedReturnValue();
      -[NSObject _intents_indexingRepresentation](v4, "_intents_indexingRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    -[INIntent launchId](self, "launchId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[INIntent launchId](self, "launchId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("_launchId"));

    }
    -[INIntent extensionBundleId](self, "extensionBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[INIntent extensionBundleId](self, "extensionBundleId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("_extensionBundleId"));

    }
    -[INIntent _className](self, "_className");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("_className"));

    v13 = objc_alloc_init(MEMORY[0x1E0D3E558]);
    v14 = (id)objc_msgSend(v13, "combineContentsOfPropertyListObject:", v7);
    self->_indexingHash = objc_msgSend(v13, "finalize");

    return self->_indexingHash;
  }
  return result;
}

- (BOOL)_isUserConfirmationRequired
{
  void *v2;
  char v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userConfirmationRequired");

  return v3;
}

- (void)trimDataAgainstTCCForAuditToken:(id *)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BYTE v16[32];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[INIntent _metadata](self, "_metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = INPrivacyEntitlementOptionsForIntentMetadata(v7);

  if (v8)
  {
    v9 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v16 = *(_OWORD *)a3->var0;
    *(_OWORD *)&v16[16] = v9;
    v10 = INPrivacyEntitlementOptionsMissingForExtension(v8, v16, v6);
    if (v10)
    {
      v11 = v10;
      v12 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        v13 = v12;
        INPrivacyEntitlementOptionsGetNames(v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v16 = 136315394;
        *(_QWORD *)&v16[4] = "-[INIntent trimDataAgainstTCCForAuditToken:bundle:]";
        *(_WORD *)&v16[12] = 2114;
        *(_QWORD *)&v16[14] = v14;
        _os_log_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_INFO, "%s Missing required entitlement: %{public}@, redacting data accordingly", v16, 0x16u);

      }
      INContainingAppBundleIdentifierForBundle(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntent _redactForMissingPrivacyEntitlementOptions:containingAppBundleId:](self, "_redactForMissingPrivacyEntitlementOptions:containingAppBundleId:", v11, v15);

    }
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *identifier;
  PBCodable *backingStore;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    identifier = self->_identifier;
    v8 = 0;
    if (identifier == (NSString *)v5[10] || -[NSString isEqual:](identifier, "isEqual:"))
    {
      backingStore = self->_backingStore;
      if (backingStore == (PBCodable *)v5[12] || -[PBCodable isEqual:](backingStore, "isEqual:"))
        v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_emptyCopy
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[INIntent _inCodable](self, "_inCodable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[INIntent copy](self, "copy");
    objc_msgSend((id)v4, "_inCodable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNilValueForAllKeys");
LABEL_5:

    goto LABEL_6;
  }
  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  if (v4)
  {
    v6 = objc_alloc_init((Class)objc_opt_class());
    v7 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = v6;

    objc_storeStrong((id *)(v4 + 40), self->_parameterCombinations);
    objc_storeStrong((id *)(v4 + 104), self->_recordRoute);
    objc_storeStrong((id *)(v4 + 112), self->_recordDeviceUID);
    objc_storeStrong((id *)(v4 + 120), self->_recordDeviceIdentifier);
    *(_DWORD *)(v4 + 36) = self->_audioSessionID;
    objc_storeStrong((id *)(v4 + 56), self->_parameterContexts);
    *(_BYTE *)(v4 + 32) = self->_shouldForwardToAppOnSucccess;
    -[INIntent _metadata](self, "_metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "_setMetadata:", v5);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v9;

  return (id)v4;
}

- (id)_copyWithoutBackingStoreData:(id *)a3
{
  id *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[INIntent copyWithZone:](self, "copyWithZone:", 0);
    objc_msgSend(v5[12], "_setData:error:", 0, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v5[10];
    v5[10] = (id)v7;

    v5[8] = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Unsupported backing store to set data on: %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentError(8001, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 && v13)
      *a3 = objc_retainAutorelease(v13);

    return 0;
  }
  return v5;
}

- (id)_copyApplyingNewBackingStoreData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create new intent from backing store data:  Identifier not found"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentError(8001, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v13);

LABEL_12:
      v9 = 0;
      goto LABEL_13;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Unsupported backing store to set data on: %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentError(8001, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 && v18)
      *a4 = objc_retainAutorelease(v18);

    goto LABEL_12;
  }
  v9 = -[INIntent copyWithZone:](self, "copyWithZone:", 0);
  objc_msgSend(v9[12], "_setData:error:", v7, a4);
  v10 = objc_msgSend(v8, "copy");
  v11 = v9[10];
  v9[10] = (id)v10;

  v9[8] = 0;
LABEL_13:

  return v9;
}

- (id)_backingStoreData
{
  NSString *identifier;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  identifier = self->_identifier;
  v7[0] = CFSTR("id");
  v7[1] = CFSTR("data");
  v8[0] = identifier;
  -[PBCodable data](self->_backingStore, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)widgetPlistableRepresentation:(id *)a3
{
  return -[INIntent widgetPlistableRepresentationWithParameters:error:](self, "widgetPlistableRepresentationWithParameters:error:", 0, a3);
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  PBCodable *backingStore;
  id *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSDictionary *parameterCombinations;
  id v20;
  void *v21;
  void *v22;
  INParameterContexts *parameterContexts;
  INParameterContexts *v24;
  INJSONEncoder *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  INIntent *v32;
  uint64_t *v33;
  id obj;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_identifier, CFSTR("identifier"));
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__83114;
  v39 = __Block_byref_object_dispose__83115;
  v40 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    backingStore = self->_backingStore;
    v9 = (id *)(v36 + 5);
    obj = (id)v36[5];
    objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:parameters:error:", backingStore, CFSTR("backingStore"), v6, &obj);
    objc_storeStrong(v9, obj);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Unsupported backing store type: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentError(8001, v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v36[5];
    v36[5] = v14;

  }
  v16 = (void *)v36[5];
  if (v16)
  {
    if (a4)
    {
      v17 = 0;
      *a4 = objc_retainAutorelease(v16);
      goto LABEL_20;
    }
LABEL_13:
    v17 = 0;
    goto LABEL_20;
  }
  if (self->_parameterCombinations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    parameterCombinations = self->_parameterCombinations;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __62__INIntent_widgetPlistableRepresentationWithParameters_error___block_invoke;
    v29[3] = &unk_1E2290520;
    v30 = v6;
    v33 = &v35;
    v20 = v18;
    v31 = v20;
    v32 = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](parameterCombinations, "enumerateKeysAndObjectsUsingBlock:", v29);
    v21 = (void *)v36[5];
    if (v21)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v21);
    }
    else
    {
      objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v20, CFSTR("parameterCombinations"));
    }

    if (v21)
      goto LABEL_13;
  }
  if (self->_indexingHash)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v22, CFSTR("_indexingHash"));

  }
  parameterContexts = self->_parameterContexts;
  if (parameterContexts && !-[INParameterContexts _isEmpty](parameterContexts, "_isEmpty"))
  {
    v24 = self->_parameterContexts;
    v25 = objc_alloc_init(INJSONEncoder);
    -[INIntent _codableDescription](self, "_codableDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[INParameterContexts _intents_encodeWithJSONEncoder:codableDescription:](v24, "_intents_encodeWithJSONEncoder:codableDescription:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v27, CFSTR("_parameterContexts"));
  }
  v17 = v7;
LABEL_20:
  _Block_object_dispose(&v35, 8);

  return v17;
}

- (NSString)description
{
  return (NSString *)-[INIntent descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INIntent;
  -[INIntent description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent _redactedDictionaryRepresentation](self, "_redactedDictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[INIntent _redactedDictionaryRepresentation](self, "_redactedDictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionAtIndent:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_dictionaryRepresentation
{
  void *v2;
  void *v3;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "dictionaryRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v3;
}

- (NSArray)_codableAttributes
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntent _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSOrderedSet)_displayOrderedAttributes
{
  void *v2;
  void *v3;

  -[INIntent _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayOrderedAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v3;
}

- (INIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  id v8;
  id v9;
  id v10;
  INIntent *v11;
  _INPBGenericIntent *v12;
  PBCodable *backingStore;
  _INPBIntentMetadata *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INIntent;
  v11 = -[INIntent init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(_INPBGenericIntent);
    backingStore = v11->_backingStore;
    v11->_backingStore = &v12->super;

    v14 = objc_alloc_init(_INPBIntentMetadata);
    -[INIntent _setMetadata:](v11, "_setMetadata:", v14);

    -[INIntent setDomain:](v11, "setDomain:", v8);
    -[INIntent setVerb:](v11, "setVerb:", v9);
    -[INIntent setParametersByName:](v11, "setParametersByName:", v10);
    -[INIntent _setIntentCategory:](v11, "_setIntentCategory:", 0);
    -[INIntent _setCategoryVerb:](v11, "_setCategoryVerb:", CFSTR("Do"));
  }

  return v11;
}

- (void)setDomain:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDomain:", v4);

}

- (void)setVerb:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVerb:", v4);

}

- (void)_setParametersForcedToNeedsValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INIntent _metadata](self, "_metadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForceNeedsValueForParameters:", v4);

}

- (NSArray)_parametersForcedToNeedsValue
{
  void *v2;
  void *v3;

  -[INIntent _metadata](self, "_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceNeedsValueForParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)parametersByName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[INIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[INIntent _typedBackingStore](self, "_typedBackingStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    else
      v6 = 0;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v17, "role", (_QWORD)v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            INIntentSlotValueTransformFromProperty(v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    v20 = (void *)objc_msgSend(v6, "copy");
    return (NSDictionary *)v20;
  }
  else
  {
    -[INIntent backingStore](self, "backingStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[INIntent backingStore](self, "backingStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_dictionaryRepresentationWithNullValues:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      return (NSDictionary *)v10;
    }
    else
    {
      return (NSDictionary *)0;
    }
  }
}

- (void)setParametersByName:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;

  v11 = a3;
  -[INIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __32__INIntent_setParametersByName___block_invoke;
    v13[3] = &unk_1E2291AC0;
    v14 = v5;
    v6 = v5;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v13);
    -[INIntent _typedBackingStore](self, "_typedBackingStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setParameters:", v6);

LABEL_5:
    v10 = v11;
    goto LABEL_6;
  }
  -[INIntent backingStore](self, "backingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v10 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __32__INIntent_setParametersByName___block_invoke_2;
    v12[3] = &unk_1E2291AC0;
    v12[4] = self;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v12);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_JSONDictionaryRepresentationWithConfiguration:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  INJSONEncoder *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = -[INJSONEncoder initWithConfiguration:]([INJSONEncoder alloc], "initWithConfiguration:", v5);

  -[INIntent typeName](self, "typeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v8, CFSTR("typeName"));

  -[INIntent _metadata](self, "_metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INJSONEncoder encodeObject:](v7, "encodeObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v10, CFSTR("metadata"));

  -[INIntent _codableDescription](self, "_codableDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[INJSONEncoder encodeObject:withCodableDescription:](v7, "encodeObject:withCodableDescription:", self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v12, CFSTR("parameters"));

  return v6;
}

- (NSDictionary)_JSONDictionaryRepresentation
{
  INJSONEncoderConfiguration *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(INJSONEncoderConfiguration);
  +[INPreferences siriLanguageCode](INPreferences, "siriLanguageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INJSONEncoderConfiguration setLanguageCode:](v3, "setLanguageCode:", v4);

  -[INIntent _JSONDictionaryRepresentationWithConfiguration:](self, "_JSONDictionaryRepresentationWithConfiguration:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (void)_updateWithJSONDictionary:(id)a3
{
  INJSONDecoder *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  INParameterContexts *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v4 = objc_alloc_init(INJSONDecoder);
  -[INIntent _metadata](self, "_metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0C9AA70];
  if (v8)
    v10 = v8;
  else
    v10 = (id)MEMORY[0x1E0C9AA70];
  -[INJSONDecoder decodeObject:withCodableDescription:from:](v4, "decodeObject:withCodableDescription:from:", v5, 0, v10);

  -[INIntent _codableDescription](self, "_codableDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("parameters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (v14)
    v15 = v14;
  else
    v15 = v9;
  -[INJSONDecoder decodeObject:withCodableDescription:from:](v4, "decodeObject:withCodableDescription:from:", self, v11, v15);

  v16 = [INParameterContexts alloc];
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("parameterContexts"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  if (v19)
    v20 = v19;
  else
    v20 = v9;
  v21 = -[INParameterContexts _initWithIntent:decoder:JSONDictionary:](v16, "_initWithIntent:decoder:JSONDictionary:", self, v4, v20);

  -[INIntent _setParameterContexts:](self, "_setParameterContexts:", v21);
  -[INIntent _codableDescription](self, "_codableDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
  }
  else
  {
    v23 = 0;
  }
  v24 = v23;

  objc_msgSend(v24, "_nullable_schema");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent _className](self, "_className");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "intentResponseCodableDescriptionWithIntentClassName:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "_types");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_reestablishReferencedCodableDescriptionsUsingTypes:intentResponseCodableDescription:", v28, v27);

}

- (INIntentKeyParameter)_keyParameter
{
  os_unfair_lock_s *p_keyParameterLock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  INIntentKeyParameter *v13;
  void *v14;
  INIntentKeyParameter *v15;
  INIntentKeyParameter *keyParameter;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_keyParameterLock = &self->_keyParameterLock;
  os_unfair_lock_lock(&self->_keyParameterLock);
  if (!self->_hasLoadedKeyParameter)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[INIntent _keyCodableAttributes](self, "_keyCodableAttributes", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v9, "propertyName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[INIntent _isValidKey:](self, "_isValidKey:", v10))
          {
            -[INIntent valueForKey:](self, "valueForKey:", v10);
            v11 = objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v12 = (void *)v11;
              v13 = [INIntentKeyParameter alloc];
              -[INIntent imageForParameterNamed:](self, "imageForParameterNamed:", v10);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = -[INIntentKeyParameter initWithCodableAttribute:value:image:](v13, "initWithCodableAttribute:value:image:", v9, v12, v14);
              keyParameter = self->_keyParameter;
              self->_keyParameter = v15;

              goto LABEL_13;
            }
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

    self->_hasLoadedKeyParameter = 1;
  }
  os_unfair_lock_unlock(p_keyParameterLock);
  return self->_keyParameter;
}

- (INAppIntent)_asMigratedAppIntent
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _INVCVoiceShortcutClient();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v7 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      v4 = 0;
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315138;
    v12 = "-[INIntent _asMigratedAppIntent]";
    v8 = "%s No VoiceShortcutClient; completing with nil";
LABEL_13:
    _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)buf = 136315138;
    v12 = "-[INIntent _asMigratedAppIntent]";
    v8 = "%s VoiceShortcutClient hasn't implement migratedAppIntentWithINIntent:error: yet.";
    goto LABEL_13;
  }
  v10 = 0;
  objc_msgSend(v3, "migratedAppIntentWithINIntent:error:", self, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (!v4)
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[INIntent _asMigratedAppIntent]";
      v13 = 2114;
      v14 = v5;
      _os_log_error_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_ERROR, "%s No AppIntent; returning nil. Error: %{public}@",
        buf,
        0x16u);
    }
  }

LABEL_11:
  return (INAppIntent *)v4;
}

- (BOOL)_isValidKey:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (NSString *)a3;
  -[INIntent _inCodable](self, "_inCodable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "isValidKey:", v4);

  }
  else
  {
    NSSelectorFromString(v4);

    v7 = objc_opt_respondsToSelector();
  }

  return v7 & 1;
}

- (BOOL)_isValueValidForKey:(id)a3 unsupportedReason:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  BOOL v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
    *a4 = 0;
  if (-[INIntent _isValidKey:](self, "_isValidKey:", v6))
  {
    -[INIntent valueForKey:](self, "valueForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[INIntent _codableDescription](self, "_codableDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attributeByName:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "unsupportedReasons");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v9, "unsupportedReasons");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v13)
        {
          v14 = v13;
          v27 = v6;
          v15 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v29 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v17, "predicateFormat");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "length");

              if (v19)
              {
                v20 = (void *)MEMORY[0x1E0CB3880];
                objc_msgSend(v17, "predicateFormat");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "predicateWithFormat:", v21, v7);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                v23 = objc_msgSend(v22, "evaluateWithObject:", v9);
                v24 = v23;
                if (a4 && (v23 & 1) == 0)
                  *a4 = objc_retainAutorelease(v17);

                if (!v24)
                {
                  v25 = 0;
                  goto LABEL_23;
                }
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            if (v14)
              continue;
            break;
          }
          v25 = 1;
LABEL_23:
          v6 = v27;
        }
        else
        {
          v25 = 1;
        }

      }
      else
      {
        v25 = 1;
      }

    }
    else
    {
      v25 = 1;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  _QWORD v15[5];
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INIntent _inCodable](self, "_inCodable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)INIntent;
    -[INIntent valueForUndefinedKey:](&v16, sel_valueForUndefinedKey_, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((objc_msgSend(v5, "isValidKey:", v4) & 1) != 0)
  {
LABEL_5:
    objc_msgSend(v6, "valueForPropertyNamed:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v9 = (void *)v8;
    goto LABEL_8;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __33__INIntent_valueForUndefinedKey___block_invoke;
  v15[3] = &unk_1E2290598;
  v15[4] = self;
  -[INIntent _querySchemaWithBlock:contentOptions:](self, "_querySchemaWithBlock:contentOptions:", v15, 31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setObjectDescription:", v7);
  if ((objc_msgSend(v6, "isValidKey:", v4) & 1) != 0)
  {

    goto LABEL_5;
  }
  v11 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
  {
    v12 = v11;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v18 = "-[INIntent valueForUndefinedKey:]";
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v14;
    _os_log_fault_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_FAULT, "%s '%@' is an invalid parameter for '%@'. Please make sure that your intent definition file is valid.", buf, 0x20u);

  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  id v41;
  BOOL v42;
  NSObject *v43;
  void *v45;
  _BOOL4 v46;
  id v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v46 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[INIntent _title](self, "_title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayName:", v7);

  }
  objc_msgSend(v5, "contentDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[INIntent _subtitle](self, "_subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentDescription:", v9);

  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[INIntent launchId](self, "launchId");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = CFSTR("no-launchId");
  -[INIntent extensionBundleId](self, "extensionBundleId");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("no-extensionBundleId");
  objc_msgSend(v5, "displayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");
  if (v18)
  {
    objc_msgSend(v5, "displayName");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "UUIDString");
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@-%@"), v13, v16, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUniqueIdentifier:", v20);

  if (!v18)
  {

    v19 = v45;
  }

  -[INIntent _spotlightContentType](self, "_spotlightContentType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentType:", v21);

  -[INIntent _className](self, "_className");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v22, CFSTR("_kMDItemIntentClass"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INIntent _supportsBackgroundExecutionWithOptions:](self, "_supportsBackgroundExecutionWithOptions:", 0));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundRunnable:", v23);

  -[INIntent _categoryVerb](self, "_categoryVerb");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent _categoryVerb](self, "_categoryVerb");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  INCSLocalizedString(v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPunchoutLabel:", v26);

  objc_msgSend(v5, "thumbnailData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {

  }
  else
  {
    objc_msgSend(v5, "thumbnailURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      -[INIntent keyImage](self, "keyImage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "_uri");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isFileURL");

        if (v32)
        {
          objc_msgSend(v30, "_uri");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setThumbnailURL:", v33);

        }
        else
        {
          objc_msgSend(v30, "_imageData");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v34, "length"))
          {
            +[INImageServiceConnection sharedConnection](INImageServiceConnection, "sharedConnection");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = 0;
            objc_msgSend(v35, "loadDataImageFromImage:scaledSize:error:", v30, &v48, 0.0, 0.0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v48;
            objc_msgSend(v36, "_imageData");
            v38 = objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              v39 = INSiriLogContextIntents;
              if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v50 = "-[INIntent configureAttributeSet:includingData:]";
                v51 = 2112;
                v52 = v30;
                v53 = 2112;
                v54 = v37;
                _os_log_error_impl(&dword_18BEBC000, v39, OS_LOG_TYPE_ERROR, "%s Failed to load image data for %@ for indexing: %@", buf, 0x20u);
              }
            }

            v34 = (void *)v38;
          }
          if (objc_msgSend(v34, "length"))
            objc_msgSend(v5, "setThumbnailData:", v34);

        }
      }

    }
  }
  if (v46)
  {
    v47 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v47);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v47;
    v42 = v40 != 0;
    if (v40)
    {
      objc_msgSend(v5, "setAttribute:forKey:", v40, CFSTR("_kMDItemUserActivityData"));

    }
    else
    {
      v43 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "-[INIntent configureAttributeSet:includingData:]";
        v51 = 2112;
        v52 = v41;
        _os_log_error_impl(&dword_18BEBC000, v43, OS_LOG_TYPE_ERROR, "%s Failed to encode intent into attribute set: %@", buf, 0x16u);
      }
    }

  }
  else
  {
    v42 = 1;
  }

  return v42;
}

- (id)_spotlightContentType
{
  __CFString *v2;

  v2 = CFSTR("com.apple.siri.interaction");
  return CFSTR("com.apple.siri.interaction");
}

- (void)_setConfigurableParameterCombinations:(id)a3
{
  objc_storeStrong((id *)&self->_configurableParameterCombinations, a3);
}

- (INParameterContexts)_parameterContexts
{
  return self->_parameterContexts;
}

- (void)_setParameterContexts:(id)a3
{
  objc_storeStrong((id *)&self->_parameterContexts, a3);
}

- (BOOL)_shouldForwardToAppOnSucccess
{
  return self->_shouldForwardToAppOnSucccess;
}

- (void)_setShouldForwardToAppOnSuccess:(BOOL)a3
{
  self->_shouldForwardToAppOnSucccess = a3;
}

- (INIntentDonationMetadata)donationMetadata
{
  return self->_donationMetadata;
}

- (NSString)recordRoute
{
  return self->_recordRoute;
}

- (NSUUID)recordDeviceUID
{
  return self->_recordDeviceUID;
}

- (void)_setRecordDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_recordDeviceUID, a3);
}

- (NSString)recordDeviceIdentifier
{
  return self->_recordDeviceIdentifier;
}

- (void)_setRecordDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recordDeviceIdentifier, a3);
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)_setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

id __37__INIntent_setValue_forUndefinedKey___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intentCodableDescriptionWithIntentClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __33__INIntent_valueForUndefinedKey___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intentCodableDescriptionWithIntentClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __32__INIntent_setParametersByName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  INIntentSlotValueTransformToProperty(a3, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

uint64_t __32__INIntent_setParametersByName___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forUndefinedKey:", a3, a2);
}

void __62__INIntent_widgetPlistableRepresentationWithParameters_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(a3, "widgetPlistableRepresentationWithParameters:error:", v8, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    objc_msgSend(v11, "addObject:", v10);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  }
  else
  {
    *a4 = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to encode INParameterCombination for intent: %@"), *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentError(8001, v11, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

uint64_t __43__INIntent__displayOrderedNonNilParameters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_codableDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributeByName:", v7);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_codableDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributeByName:", v6);
  v11 = objc_claimAutoreleasedReturnValue();

  if (v9 || !v11)
  {
    if (!v9 || v11)
    {
      if (v9 | v11)
      {
        objc_msgSend((id)v9, "displayPriorityRank");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v11, "displayPriorityRank");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v13, "compare:", v14);

      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = -1;
    }
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

id __46__INIntent__configurableParameterCombinations__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_configurableParameterCombinationsForClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __32__INIntent__setParameterImages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _INPBPair *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "parameter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = objc_alloc_init(_INPBPair);
    INIntentSlotValueTransformToImageValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INPBPair setPairImageValues:](v7, "setPairImageValues:", v9);

    -[_INPBPair setKey:](v7, "setKey:", v5);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  }
  else
  {

    v10 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      objc_msgSend(v3, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v17 = "-[INIntent _setParameterImages:]_block_invoke";
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v5;
      _os_log_error_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_ERROR, "%s Wrong image class (%@) for parameter keyPath: %@", buf, 0x20u);

    }
  }

}

uint64_t __34__INIntent__sortedParameterImages__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_inCodable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_objectDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayOrderedAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "parameterKeyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributeByName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "indexOfObject:", v11);

  return v12;
}

uint64_t __34__INIntent__sortedParameterImages__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a2, "parameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterKeyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_intentInstanceDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "slotByName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tag");

  return v9;
}

uint64_t __34__INIntent__sortedParameterImages__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  v8 = v6(v5, a2);
  v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  if (v8 >= v9)
    v10 = 0;
  else
    v10 = -1;
  if (v8 > v9)
    return 1;
  else
    return v10;
}

uint64_t __35__INIntent__setImage_forParameter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "parameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v3, "isEqualToParameter:", *(_QWORD *)(a1 + 32));

  return a1 ^ 1;
}

void __36__INIntent_setShortcutAvailability___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_metadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addShortcutAvailability:", a2);

}

+ (id)typeName
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  INIntentSchemaGetIntentDescriptionWithFacadeClass((objc_class *)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("GenericIntent");

  return v4;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  INJSONDecoder *v16;
  void *v17;
  INJSONDecoder *v18;
  void *v19;
  INJSONDecoder *v20;
  INJSONDecoder *v21;
  INJSONDecoder *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD *v28;
  _QWORD v30[4];
  INJSONDecoder *v31;
  uint64_t *v32;
  id obj;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  if (!v7)
    goto LABEL_26;
  objc_msgSend(v6, "intents_stringForKey:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v8);

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__83114;
  v38 = __Block_byref_object_dispose__83115;
  v39 = 0;
  objc_msgSend(v6, "intents_safeObjectForKey:ofType:", CFSTR("backingStore"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_8:
    objc_msgSend(v6, "intents_safeObjectForKey:ofType:", CFSTR("parameterCombinations"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __56__INIntent_makeFromWidgetPlistableRepresentation_error___block_invoke;
      v30[3] = &unk_1E2290570;
      v32 = &v34;
      v16 = v15;
      v31 = v16;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v30);
      v17 = (void *)v35[5];
      if (v17)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v17);
        v13 = 1;
        v18 = v31;
        goto LABEL_21;
      }
      v19 = (void *)v7[5];
      v7[5] = v16;
      v20 = v16;

    }
    v7[8] = objc_msgSend(v6, "intents_int64ForKey:", CFSTR("_indexingHash"));
    objc_msgSend(v6, "intents_safeObjectForKey:ofType:", CFSTR("_parameterContexts"), objc_opt_class());
    v16 = (INJSONDecoder *)(id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v16;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v22 = v21;

    -[INJSONDecoder allKeys](v22, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (!v24)
    {
      v13 = 0;
      goto LABEL_23;
    }
    v18 = objc_alloc_init(INJSONDecoder);
    objc_msgSend(v7, "_codableDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[INParameterContexts _intents_decodeWithJSONDecoder:codableDescription:from:](INParameterContexts, "_intents_decodeWithJSONDecoder:codableDescription:from:", v18, v25, v16);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v7[7];
    v7[7] = v26;

    v13 = 0;
LABEL_21:

LABEL_23:
    goto LABEL_24;
  }
  v10 = (id *)(v35 + 5);
  obj = (id)v35[5];
  +[INCodable makeFromWidgetPlistableRepresentation:error:](INCodable, "makeFromWidgetPlistableRepresentation:error:", v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);
  v12 = (void *)v35[5];
  if (!v12)
  {
    v14 = (void *)v7[12];
    v7[12] = v11;

    goto LABEL_8;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v12);
  v13 = 1;
LABEL_24:

  _Block_object_dispose(&v34, 8);
  if (!v13)
  {
LABEL_26:
    v28 = v7;
    goto LABEL_27;
  }
  v28 = 0;
LABEL_27:

  return v28;
}

void __56__INIntent_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__83114;
    v17[4] = __Block_byref_object_dispose__83115;
    v18 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__INIntent_makeFromWidgetPlistableRepresentation_error___block_invoke_2;
    v13[3] = &unk_1E2290548;
    v9 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v15 = v17;
    v16 = v8;
    v14 = v9;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

    _Block_object_dispose(v17, 8);
  }
  else
  {
    *a4 = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to decode parameter combinations: %@"), v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    INIntentError(8001, v7, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

void __56__INIntent_makeFromWidgetPlistableRepresentation_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t i;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a3 != 1)
  {
    if (a3)
      goto LABEL_28;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
    v8 = v7;
    if (!objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

LABEL_25:
LABEL_26:
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to decode parameter combination key (expected NSSet<NSString *> *, but received: %@"), v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        INIntentError(8001, v22, 0);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v25 = *(void **)(v24 + 40);
        *(_QWORD *)(v24 + 40) = v23;

      }
      goto LABEL_28;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      v13 = 1;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          objc_opt_class();
          v13 &= objc_opt_isKindOfClass();
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);

      if ((v13 & 1) == 0)
      {
        v15 = 0;
        v16 = 0;
        goto LABEL_23;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 1;
LABEL_23:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v16);
    if (v15)

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v17 + 40);
    +[INParameterCombination makeFromWidgetPlistableRepresentation:error:](INParameterCombination, "makeFromWidgetPlistableRepresentation:error:", v7, &obj);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v17 + 40), obj);
    if (v18 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18);

  }
  *a4 = 1;
LABEL_28:

}

- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling
{
  return 0;
}

- (BOOL)_intents_hasSystemIntentHandler
{
  return 0;
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  void *v5;

  _INEnumerableValueProcessingBlock((uint64_t)a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[INIntent _enumerateWithValueProcessingBlock:](self, "_enumerateWithValueProcessingBlock:", v5);

  return (char)self;
}

- (BOOL)_enumerateWithValueProcessingBlock:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[INIntent backingStore](self, "backingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = INEnumerateObjectsInCodable(v5, v4);

  }
  else
  {

    v6 = INEnumerateObjectsInIntentSlotComposing(self, v4);
  }

  return v6;
}

@end
