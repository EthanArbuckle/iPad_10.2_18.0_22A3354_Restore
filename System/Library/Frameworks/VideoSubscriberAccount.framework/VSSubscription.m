@implementation VSSubscription

- (VSSubscription)init
{
  VSSubscription *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSSubscription;
  v2 = -[VSSubscription init](&v5, sel_init);
  if (v2)
  {
    VSSubscriptionValueType();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInit(v3, v2);

  }
  return v2;
}

- (VSSubscription)initWithCoder:(id)a3
{
  id v4;
  VSSubscription *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSSubscription;
  v5 = -[VSSubscription init](&v8, sel_init);
  if (v5)
  {
    VSSubscriptionValueType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInitWithCoder(v6, v5, v4);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  VSSubscriptionValueType();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  VSSubscriptionValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  VSSubscriptionValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  VSSubscriptionValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  void *v3;
  void *v4;

  VSSubscriptionValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeDescription(v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setCreationDate:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *creationDate;
  id v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "vs_currentDate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v4;
  v5 = (NSDate *)objc_msgSend(v4, "copy");
  creationDate = self->_creationDate;
  self->_creationDate = v5;

}

- (void)setModificationDate:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *modificationDate;
  id v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "vs_currentDate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v4;
  v5 = (NSDate *)objc_msgSend(v4, "copy");
  modificationDate = self->_modificationDate;
  self->_modificationDate = v5;

}

- (NSDate)expirationDate
{
  VSSubscription *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_expirationDate;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_expirationDate, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

+ (id)keyPathsForValuesAffectingSubscriptionInfo
{
  if (keyPathsForValuesAffectingSubscriptionInfo___vs_lazy_init_predicate != -1)
    dispatch_once(&keyPathsForValuesAffectingSubscriptionInfo___vs_lazy_init_predicate, &__block_literal_global_15);
  return (id)keyPathsForValuesAffectingSubscriptionInfo___vs_lazy_init_variable;
}

void __60__VSSubscription_keyPathsForValuesAffectingSubscriptionInfo__block_invoke()
{
  uint64_t v0;
  void *v1;

  __60__VSSubscription_keyPathsForValuesAffectingSubscriptionInfo__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathsForValuesAffectingSubscriptionInfo___vs_lazy_init_variable;
  keyPathsForValuesAffectingSubscriptionInfo___vs_lazy_init_variable = v0;

}

id __60__VSSubscription_keyPathsForValuesAffectingSubscriptionInfo__block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v0, "addObject:", CFSTR("providedSubscriptionInfo"));
  objc_msgSend(v0, "addObject:", CFSTR("derivedSubscriptionInfo"));
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

- (NSString)subscriptionInfo
{
  void *v3;
  uint64_t v4;

  -[VSSubscription providedSubscriptionInfo](self, "providedSubscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[VSSubscription derivedSubscriptionInfo](self, "derivedSubscriptionInfo");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return (NSString *)v3;
}

- (NSString)providedSubscriptionInfo
{
  VSSubscription *v2;
  __CFString *v3;
  NSString *providedSubscriptionInfo;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_providedSubscriptionInfo;
  if (!v3)
  {
    providedSubscriptionInfo = v2->_providedSubscriptionInfo;
    v3 = &stru_1E93A8CC0;
    v2->_providedSubscriptionInfo = (NSString *)&stru_1E93A8CC0;

  }
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (NSString)derivedSubscriptionInfo
{
  VSSubscription *v2;
  __CFString *v3;
  NSString *derivedSubscriptionInfo;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_derivedSubscriptionInfo;
  if (!v3)
  {
    derivedSubscriptionInfo = v2->_derivedSubscriptionInfo;
    v3 = &stru_1E93A8CC0;
    v2->_derivedSubscriptionInfo = (NSString *)&stru_1E93A8CC0;

  }
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (VSSubscriptionSource)source
{
  VSSubscription *v2;
  VSSubscriptionSource *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_source;
  if (!v3)
  {
    +[VSSubscriptionSource currentSource](VSSubscriptionSource, "currentSource");
    v3 = (VSSubscriptionSource *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_source, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (NSString)billingIdentifier
{
  VSSubscription *v2;
  __CFString *v3;
  NSString *billingIdentifier;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_billingIdentifier;
  if (!v3)
  {
    billingIdentifier = v2->_billingIdentifier;
    v3 = &stru_1E93A8CC0;
    v2->_billingIdentifier = (NSString *)&stru_1E93A8CC0;

  }
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (NSArray)tierIdentifiers
{
  VSSubscription *v2;
  NSArray *v3;
  NSArray *tierIdentifiers;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_tierIdentifiers;
  if (!v3)
  {
    tierIdentifiers = v2->_tierIdentifiers;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_tierIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  objc_sync_exit(v2);

  return v3;
}

- (NSString)subscriberIdentifierHash
{
  VSSubscription *v2;
  __CFString *v3;
  NSString *subscriberIdentifierHash;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_subscriberIdentifierHash;
  if (!v3)
  {
    subscriberIdentifierHash = v2->_subscriberIdentifierHash;
    v3 = &stru_1E93A8CC0;
    v2->_subscriberIdentifierHash = (NSString *)&stru_1E93A8CC0;

  }
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)setNilValueForKey:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", CFSTR("accessLevel")))
  {
    -[VSSubscription setValue:forKey:](self, "setValue:forKey:", &unk_1E93CC558, v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VSSubscription;
    -[VSSubscription setNilValueForKey:](&v5, sel_setNilValueForKey_, v4);
  }

}

- (void)_updateHash:(id)a3 withValueForProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  objc_class *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSubscription valueForKey:](self, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "kind");
  switch(v10)
  {
    case 2:
      objc_msgSend(v7, "allowedClasses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count") != 1)
      {
        if (objc_msgSend(v11, "count") == 2
          && objc_msgSend(v11, "containsObject:", objc_opt_class())
          && objc_msgSend(v11, "containsObject:", objc_opt_class()))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!v9)
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The valueOrNil parameter must not be nil."));
            v50 = v11;
            v51 = v9;
            v18 = v9;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v19 = (void *)MEMORY[0x1E0C99DA0];
              v20 = *MEMORY[0x1E0C99778];
              v21 = (objc_class *)objc_opt_class();
              NSStringFromClass(v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "raise:format:", v20, CFSTR("Unexpectedly, value was %@, instead of NSArray."), v22);

            }
            v23 = v18;
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v53;
              v27 = *MEMORY[0x1E0C99778];
              do
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v53 != v26)
                    objc_enumerationMutation(v23);
                  v29 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v30 = v6;
                      v31 = (void *)MEMORY[0x1E0C99DA0];
                      v32 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v32);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      v34 = v31;
                      v6 = v30;
                      objc_msgSend(v34, "raise:format:", v27, CFSTR("Unexpectedly, containedObject was %@, instead of NSString."), v33);

                    }
                    v35 = v29;
                    if (objc_msgSend(v35, "length"))
                      objc_msgSend(v6, "updateWithString:", v35);
                    else
                      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v27, CFSTR("Array contained empty string."));

                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v27, CFSTR("Array contained a non-string (%@) value: %@"), objc_opt_class(), v29);
                  }
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
              }
              while (v25);
            }

            v9 = v51;
            v11 = v50;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Value was a %@ instead of an array."), objc_opt_class());
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpected number of allowed classes."), v49);
        }
        goto LABEL_55;
      }
      v12 = (void *)objc_msgSend(v11, "anyObject");
      if (objc_msgSend(v12, "isEqual:", objc_opt_class())
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (!v9)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The valueOrNil parameter must not be nil."));
        v13 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v14 = (void *)MEMORY[0x1E0C99DA0];
          v15 = *MEMORY[0x1E0C99778];
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "raise:format:", v15, CFSTR("Unexpectedly, value was %@, instead of NSString."), v17);

        }
        objc_msgSend(v6, "updateWithString:", v13);
      }
      else if (objc_msgSend(v12, "isEqual:", objc_opt_class())
             && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (!v9)
        {
LABEL_55:

          break;
        }
        v13 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v36 = (void *)MEMORY[0x1E0C99DA0];
          v37 = *MEMORY[0x1E0C99778];
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "raise:format:", v37, CFSTR("Unexpectedly, value was %@, instead of NSDate."), v39);

        }
        objc_msgSend(v6, "updateWithDate:", v13);
      }
      else
      {
        if (!objc_msgSend(v12, "isEqual:", objc_opt_class())
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v46 = (void *)MEMORY[0x1E0C99DA0];
          v47 = *MEMORY[0x1E0C99778];
          objc_msgSend(v7, "name");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "raise:format:", v47, CFSTR("Unexpected value (%@) for property %@ of class: %@"), v9, v48, v12);

          goto LABEL_55;
        }
        if (!v9)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The valueOrNil parameter must not be nil."));
        v40 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v41 = (void *)MEMORY[0x1E0C99DA0];
          v42 = *MEMORY[0x1E0C99778];
          v43 = (objc_class *)objc_opt_class();
          NSStringFromClass(v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "raise:format:", v42, CFSTR("Unexpectedly, value was %@, instead of VSSubscriptionSource."), v44);

        }
        v13 = v40;
        objc_msgSend(v6, "updateWithInteger:", objc_msgSend(v13, "kind"));
        objc_msgSend(v13, "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "updateWithString:", v45);
      }

      goto LABEL_55;
    case 1:
      objc_msgSend(v6, "updateWithInteger:", objc_msgSend(v9, "integerValue"));
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpected Boolean property kind."));
      break;
  }

}

+ (id)keyPathsForValuesAffectingVersionHash
{
  if (keyPathsForValuesAffectingVersionHash___vs_lazy_init_predicate != -1)
    dispatch_once(&keyPathsForValuesAffectingVersionHash___vs_lazy_init_predicate, &__block_literal_global_44);
  return (id)keyPathsForValuesAffectingVersionHash___vs_lazy_init_variable;
}

void __55__VSSubscription_keyPathsForValuesAffectingVersionHash__block_invoke()
{
  uint64_t v0;
  void *v1;

  __55__VSSubscription_keyPathsForValuesAffectingVersionHash__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathsForValuesAffectingVersionHash___vs_lazy_init_variable;
  keyPathsForValuesAffectingVersionHash___vs_lazy_init_variable = v0;

}

id __55__VSSubscription_keyPathsForValuesAffectingVersionHash__block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  VSSubscriptionValueType();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "properties", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  v8 = (void *)objc_msgSend(v0, "copy");
  return v8;
}

- (NSData)versionHash
{
  VSHash *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(VSHash);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  VSSubscriptionValueType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[VSSubscription _updateHash:withValueForProperty:](self, "_updateHash:withValueForProperty:", v3, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[VSHash finalData](v3, "finalData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v10;
}

- (void)setExpirationDate:(NSDate *)expirationDate
{
  objc_setProperty_nonatomic_copy(self, a2, expirationDate, 8);
}

- (VSSubscriptionAccessLevel)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(VSSubscriptionAccessLevel)accessLevel
{
  self->_accessLevel = accessLevel;
}

- (void)setTierIdentifiers:(NSArray *)tierIdentifiers
{
  objc_setProperty_nonatomic_copy(self, a2, tierIdentifiers, 24);
}

- (void)setBillingIdentifier:(NSString *)billingIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, billingIdentifier, 32);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setDerivedSubscriptionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setProvidedSubscriptionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setSubscriberIdentifierHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)modifierIdentifier
{
  return self->_modifierIdentifier;
}

- (void)setModifierIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_modifierIdentifier, a3);
}

- (NSString)modifierType
{
  return self->_modifierType;
}

- (void)setModifierType:(id)a3
{
  objc_storeStrong((id *)&self->_modifierType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifierType, 0);
  objc_storeStrong((id *)&self->_modifierIdentifier, 0);
  objc_storeStrong((id *)&self->_subscriberIdentifierHash, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_providedSubscriptionInfo, 0);
  objc_storeStrong((id *)&self->_derivedSubscriptionInfo, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_billingIdentifier, 0);
  objc_storeStrong((id *)&self->_tierIdentifiers, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
