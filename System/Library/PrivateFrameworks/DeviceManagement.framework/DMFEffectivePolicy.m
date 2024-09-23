@implementation DMFEffectivePolicy

- (DMFEffectivePolicy)initWithType:(id)a3 defaultPolicy:(int64_t)a4 currentPoliciesByIdentifier:(id)a5 defaultPriority:(unint64_t)a6 prioritiesByIdentifier:(id)a7 excludedIdentifiers:(id)a8 downtimeEnforced:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  DMFEffectivePolicy *v19;
  uint64_t v20;
  NSString *type;
  uint64_t v22;
  NSDictionary *currentPoliciesByIdentifier;
  uint64_t v24;
  NSDictionary *prioritiesByIdentifier;
  uint64_t v26;
  NSSet *excludedIdentifiers;
  objc_super v29;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v29.receiver = self;
  v29.super_class = (Class)DMFEffectivePolicy;
  v19 = -[DMFEffectivePolicy init](&v29, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    type = v19->_type;
    v19->_type = (NSString *)v20;

    v19->_defaultPolicy = a4;
    v22 = objc_msgSend(v16, "copy");
    currentPoliciesByIdentifier = v19->_currentPoliciesByIdentifier;
    v19->_currentPoliciesByIdentifier = (NSDictionary *)v22;

    v19->_defaultPriority = a6;
    v24 = objc_msgSend(v17, "copy");
    prioritiesByIdentifier = v19->_prioritiesByIdentifier;
    v19->_prioritiesByIdentifier = (NSDictionary *)v24;

    v26 = objc_msgSend(v18, "copy");
    excludedIdentifiers = v19->_excludedIdentifiers;
    v19->_excludedIdentifiers = (NSSet *)v26;

    v19->_downtimeEnforced = a9;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LOBYTE(v6) = self->_downtimeEnforced;
  return (id)objc_msgSend(v4, "initWithType:defaultPolicy:currentPoliciesByIdentifier:defaultPriority:prioritiesByIdentifier:excludedIdentifiers:downtimeEnforced:", self->_type, self->_defaultPolicy, self->_currentPoliciesByIdentifier, self->_defaultPriority, self->_prioritiesByIdentifier, self->_excludedIdentifiers, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *type;
  id v5;
  id v6;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_defaultPolicy, CFSTR("defaultPolicy"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentPoliciesByIdentifier, CFSTR("currentPoliciesByIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_defaultPriority, CFSTR("defaultPriority"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_prioritiesByIdentifier, CFSTR("prioritiesByIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludedIdentifiers, CFSTR("excludedIdentifiers"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_downtimeEnforced);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("downtimeEnforced"));

}

- (DMFEffectivePolicy)initWithCoder:(id)a3
{
  id v4;
  DMFEffectivePolicy *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *type;
  uint64_t v24;
  NSDictionary *currentPoliciesByIdentifier;
  uint64_t v26;
  NSDictionary *prioritiesByIdentifier;
  uint64_t v28;
  NSSet *excludedIdentifiers;
  void *v31;
  uint64_t v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)DMFEffectivePolicy;
  v5 = -[DMFEffectivePolicy init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultPolicy"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("currentPoliciesByIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultPriority"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("prioritiesByIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("excludedIdentifiers"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downtimeEnforced"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v31, "copy");
    type = v5->_type;
    v5->_type = (NSString *)v22;

    v5->_defaultPolicy = v32;
    v24 = objc_msgSend(v10, "copy");
    currentPoliciesByIdentifier = v5->_currentPoliciesByIdentifier;
    v5->_currentPoliciesByIdentifier = (NSDictionary *)v24;

    v5->_defaultPriority = v11;
    v26 = objc_msgSend(v16, "copy");
    prioritiesByIdentifier = v5->_prioritiesByIdentifier;
    v5->_prioritiesByIdentifier = (NSDictionary *)v26;

    v28 = objc_msgSend(v20, "copy");
    excludedIdentifiers = v5->_excludedIdentifiers;
    v5->_excludedIdentifiers = (NSSet *)v28;

    v5->_downtimeEnforced = objc_msgSend(v21, "BOOLValue");
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  DMFEffectivePolicy *v6;
  DMFEffectivePolicy *v7;
  void *v8;
  void *v9;
  int64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = (DMFEffectivePolicy *)a3;
  if (self == v6)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[DMFEffectivePolicy type](self, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFEffectivePolicy type](v7, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqual:", v9)
        || (v10 = -[DMFEffectivePolicy defaultPolicy](self, "defaultPolicy"),
            v10 != -[DMFEffectivePolicy defaultPolicy](v7, "defaultPolicy"))
        || (v11 = -[DMFEffectivePolicy defaultPriority](self, "defaultPriority"),
            v11 != -[DMFEffectivePolicy defaultPriority](v7, "defaultPriority")))
      {
        LOBYTE(v15) = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[DMFEffectivePolicy currentPoliciesByIdentifier](self, "currentPoliciesByIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (-[DMFEffectivePolicy currentPoliciesByIdentifier](v7, "currentPoliciesByIdentifier"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[DMFEffectivePolicy currentPoliciesByIdentifier](self, "currentPoliciesByIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMFEffectivePolicy currentPoliciesByIdentifier](v7, "currentPoliciesByIdentifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v4))
        {
          LOBYTE(v15) = 0;
LABEL_42:

          goto LABEL_43;
        }
        v28 = v4;
        v29 = v13;
        v14 = 1;
      }
      else
      {
        v14 = 0;
      }
      -[DMFEffectivePolicy prioritiesByIdentifier](self, "prioritiesByIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17
        || (-[DMFEffectivePolicy prioritiesByIdentifier](v7, "prioritiesByIdentifier"),
            (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[DMFEffectivePolicy prioritiesByIdentifier](self, "prioritiesByIdentifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMFEffectivePolicy prioritiesByIdentifier](v7, "prioritiesByIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v4, "isEqual:"))
        {
          LOBYTE(v15) = 0;
          goto LABEL_35;
        }
        v24 = v3;
        v25 = 1;
      }
      else
      {
        v23 = 0;
        v24 = v3;
        v25 = 0;
      }
      v26 = v4;
      v27 = v14;
      -[DMFEffectivePolicy excludedIdentifiers](self, "excludedIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18
        || (-[DMFEffectivePolicy excludedIdentifiers](v7, "excludedIdentifiers"),
            (v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[DMFEffectivePolicy excludedIdentifiers](self, "excludedIdentifiers", v20);
        v14 = objc_claimAutoreleasedReturnValue();
        -[DMFEffectivePolicy excludedIdentifiers](v7, "excludedIdentifiers");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend((id)v14, "isEqual:", v4))
        {
          LOBYTE(v15) = 0;
LABEL_30:

LABEL_31:
          if (v18)
          {

            LODWORD(v14) = v27;
            v4 = v26;
            if (!v25)
            {
              v3 = v24;
              if (v17)
              {
LABEL_37:

                if (!(_DWORD)v14)
                  goto LABEL_43;
LABEL_41:
                v4 = v28;
                v13 = v29;
                goto LABEL_42;
              }
LABEL_40:

              if ((v14 & 1) == 0)
              {
LABEL_43:
                if (!v12)

                goto LABEL_13;
              }
              goto LABEL_41;
            }
            v3 = v24;
          }
          else
          {

            v3 = v24;
            LODWORD(v14) = v27;
            v4 = v26;
            if ((v25 & 1) == 0)
              goto LABEL_36;
          }
LABEL_35:

LABEL_36:
          if (v17)
            goto LABEL_37;
          goto LABEL_40;
        }
        v22 = 1;
      }
      else
      {
        v21 = 0;
        v22 = 0;
      }
      v19 = -[DMFEffectivePolicy downtimeEnforced](self, "downtimeEnforced", v21);
      v15 = v19 ^ -[DMFEffectivePolicy downtimeEnforced](v7, "downtimeEnforced") ^ 1;
      if (!v22)
        goto LABEL_31;
      goto LABEL_30;
    }
    LOBYTE(v15) = 0;
  }
LABEL_14:

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;

  -[DMFEffectivePolicy type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[DMFEffectivePolicy defaultPolicy](self, "defaultPolicy") ^ v4;
  -[DMFEffectivePolicy currentPoliciesByIdentifier](self, "currentPoliciesByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[DMFEffectivePolicy defaultPriority](self, "defaultPriority");
  -[DMFEffectivePolicy prioritiesByIdentifier](self, "prioritiesByIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[DMFEffectivePolicy excludedIdentifiers](self, "excludedIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  v13 = v8 ^ v12 ^ -[DMFEffectivePolicy downtimeEnforced](self, "downtimeEnforced");

  return v13;
}

+ (NSSet)unblockableBundleIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D0D508], "systemHiddenBundleIdentifiersForDeviceFamily:", 101);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0D508], "systemUnblockableBundleIdentifiersForDeviceFamily:", 101);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (NSSet)unblockableCategoryIdentifiers
{
  if (unblockableCategoryIdentifiers_onceToken != -1)
    dispatch_once(&unblockableCategoryIdentifiers_onceToken, &__block_literal_global_4);
  return (NSSet *)(id)objc_msgSend((id)unblockableCategoryIdentifiers_unblockableCategoryIdentifiers, "copy");
}

void __52__DMFEffectivePolicy_unblockableCategoryIdentifiers__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0D0D4E0];
  v5[0] = *MEMORY[0x1E0D0D4D0];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)unblockableCategoryIdentifiers_unblockableCategoryIdentifiers;
  unblockableCategoryIdentifiers_unblockableCategoryIdentifiers = v3;

}

+ (NSSet)systemCategoryIdentifiers
{
  if (systemCategoryIdentifiers_onceToken != -1)
    dispatch_once(&systemCategoryIdentifiers_onceToken, &__block_literal_global_19);
  return (NSSet *)(id)objc_msgSend((id)systemCategoryIdentifiers_systemCategoryIdentifiers, "copy");
}

void __47__DMFEffectivePolicy_systemCategoryIdentifiers__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0D0D4C0];
  v5[0] = *MEMORY[0x1E0D0D4D0];
  v5[1] = v1;
  v5[2] = *MEMORY[0x1E0D0D4E0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)systemCategoryIdentifiers_systemCategoryIdentifiers;
  systemCategoryIdentifiers_systemCategoryIdentifiers = v3;

}

+ (NSSet)downtimeCategoryIdentifiers
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__DMFEffectivePolicy_downtimeCategoryIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (downtimeCategoryIdentifiers_onceToken != -1)
    dispatch_once(&downtimeCategoryIdentifiers_onceToken, block);
  return (NSSet *)(id)objc_msgSend((id)downtimeCategoryIdentifiers_downtimeCategoryIdentifiers, "copy");
}

void __49__DMFEffectivePolicy_downtimeCategoryIdentifiers__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(MEMORY[0x1E0D0D508], "sharedCategories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "availableCategoryIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)downtimeCategoryIdentifiers_downtimeCategoryIdentifiers;
  downtimeCategoryIdentifiers_downtimeCategoryIdentifiers = v3;

  v5 = (void *)downtimeCategoryIdentifiers_downtimeCategoryIdentifiers;
  objc_msgSend((id)objc_opt_class(), "systemCategoryIdentifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

}

- (int64_t)policyForIdentifier:(id)a3 excludableIdentifiers:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  int64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[DMFEffectivePolicy defaultPolicy](self, "defaultPolicy");
  if (v6)
  {
    -[DMFEffectivePolicy excludedIdentifiers](self, "excludedIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMFEffectivePolicy type](self, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("websitecategories"));

    if (v11)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __64__DMFEffectivePolicy_policyForIdentifier_excludableIdentifiers___block_invoke;
      v28[3] = &unk_1E6ED8508;
      v13 = v12;
      v29 = v13;
      v30 = v8;
      v23 = v9;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v28);
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v14 = v7;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v25;
LABEL_5:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          -[DMFEffectivePolicy _valueForMatchingHostName:inRegisteredHostNames:](self, "_valueForMatchingHostName:inRegisteredHostNames:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18), v13);
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
            break;
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
            if (v16)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:

        -[DMFEffectivePolicy currentPoliciesByIdentifier](self, "currentPoliciesByIdentifier");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v6);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v20 = (void *)v19;

      v9 = v23;
      if (!v20)
        goto LABEL_17;
    }
    else
    {
      if ((objc_msgSend(v9, "intersectsSet:", v7) & 1) != 0)
        goto LABEL_17;
      -[DMFEffectivePolicy currentPoliciesByIdentifier](self, "currentPoliciesByIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_17;
    }
    v8 = objc_msgSend(v20, "integerValue");

LABEL_17:
  }

  return v8;
}

void __64__DMFEffectivePolicy_policyForIdentifier_excludableIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "numberWithInteger:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (int64_t)priorityForIdentifier:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[DMFEffectivePolicy defaultPriority](self, "defaultPriority");
  if (v4)
  {
    -[DMFEffectivePolicy prioritiesByIdentifier](self, "prioritiesByIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v5 = objc_msgSend(v7, "integerValue");

  }
  return v5;
}

- (id)_valueForMatchingHostName:(id)a3 inRegisteredHostNames:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__DMFEffectivePolicy__valueForMatchingHostName_inRegisteredHostNames___block_invoke;
  v10[3] = &unk_1E6ED8530;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __70__DMFEffectivePolicy__valueForMatchingHostName_inRegisteredHostNames___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "caseInsensitiveCompare:", v11))
  {
    if (objc_msgSend(v11, "hasPrefix:", CFSTR("*.")))
    {
      objc_msgSend(v11, "substringFromIndex:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 32), "caseInsensitiveCompare:", v8))
      {
        objc_msgSend(v11, "substringFromIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", v9, 13, 0, objc_msgSend(*(id *)(a1 + 32), "length"));
        if (!v10)
          goto LABEL_9;
      }
      else
      {
        v9 = v8;
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
LABEL_9:

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (NSString)type
{
  return self->_type;
}

- (BOOL)downtimeEnforced
{
  return self->_downtimeEnforced;
}

- (NSSet)excludedIdentifiers
{
  return self->_excludedIdentifiers;
}

- (NSDictionary)currentPoliciesByIdentifier
{
  return self->_currentPoliciesByIdentifier;
}

- (NSDictionary)prioritiesByIdentifier
{
  return self->_prioritiesByIdentifier;
}

- (int64_t)defaultPolicy
{
  return self->_defaultPolicy;
}

- (unint64_t)defaultPriority
{
  return self->_defaultPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritiesByIdentifier, 0);
  objc_storeStrong((id *)&self->_currentPoliciesByIdentifier, 0);
  objc_storeStrong((id *)&self->_excludedIdentifiers, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (int64_t)policyForHostName:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[DMFEffectivePolicy defaultPolicy](self, "defaultPolicy");
  if (v4)
  {
    -[DMFEffectivePolicy currentPoliciesByIdentifier](self, "currentPoliciesByIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMFEffectivePolicy _valueForMatchingHostName:inRegisteredHostNames:](self, "_valueForMatchingHostName:inRegisteredHostNames:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v5 = objc_msgSend(v7, "integerValue");

  }
  return v5;
}

- (unint64_t)priorityForHostName:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[DMFEffectivePolicy defaultPriority](self, "defaultPriority");
  if (v4)
  {
    -[DMFEffectivePolicy prioritiesByIdentifier](self, "prioritiesByIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMFEffectivePolicy _valueForMatchingHostName:inRegisteredHostNames:](self, "_valueForMatchingHostName:inRegisteredHostNames:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v5 = objc_msgSend(v7, "integerValue");

  }
  return v5;
}

@end
