@implementation CHSWidgetExtension

- (id)orderedDescriptors
{
  return self->_orderedWidgetDescriptors;
}

- (id)extensionBundleIdentifier
{
  return -[CHSExtensionIdentity extensionBundleIdentifier](self->_identity, "extensionBundleIdentifier");
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  if (self->_hasValidHash)
    return self->_hashValue;
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:", self->_identity);
  v6 = (id)objc_msgSend(v4, "appendString:", self->_containerBundleLocalizedDisplayName);
  v7 = (id)objc_msgSend(v4, "appendString:", self->_localizedDisplayName);
  v8 = (id)objc_msgSend(v4, "appendObject:", self->_orderedWidgetDescriptors);
  v9 = (id)objc_msgSend(v4, "appendObject:", self->_orderedControlDescriptors);
  v10 = (id)objc_msgSend(v4, "appendObject:", self->_entitlements);
  v11 = (id)objc_msgSend(v4, "appendInteger:", self->_dataProtectionLevel);
  v3 = objc_msgSend(v4, "hash");
  self->_hashValue = v3;
  self->_hasValidHash = 1;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CHSWidgetExtension *v4;
  CHSWidgetExtension *v5;
  char v6;

  v4 = (CHSWidgetExtension *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_dataProtectionLevel == v5->_dataProtectionLevel
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualArrays())
      {
        v6 = BSEqualArrays();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHSWidgetExtension;
  return -[CHSWidgetExtension init](&v3, sel_init);
}

- (id)initFromExtension:(id)a3 includeIntents:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CHSWidgetExtension *v7;
  uint64_t v8;
  NSString *localizedDisplayName;
  uint64_t v10;
  NSString *containerBundleLocalizedDisplayName;
  uint64_t v12;
  CHSExtensionIdentity *identity;
  void *v14;
  uint64_t v15;
  CHSEntitlementCollection *entitlements;
  void *v17;
  uint64_t v18;
  NSArray *orderedWidgetDescriptors;
  id v20;
  uint64_t v21;
  NSArray *orderedControlDescriptors;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  NSArray *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  NSArray *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v4 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CHSWidgetExtension;
  v7 = -[CHSWidgetExtension init](&v46, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "localizedDisplayName");
    v8 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v7->_localizedDisplayName;
    v7->_localizedDisplayName = (NSString *)v8;

    objc_msgSend(v6, "containerBundleLocalizedDisplayName");
    v10 = objc_claimAutoreleasedReturnValue();
    containerBundleLocalizedDisplayName = v7->_containerBundleLocalizedDisplayName;
    v7->_containerBundleLocalizedDisplayName = (NSString *)v10;

    objc_msgSend(v6, "identity");
    v12 = objc_claimAutoreleasedReturnValue();
    identity = v7->_identity;
    v7->_identity = (CHSExtensionIdentity *)v12;

    objc_msgSend(v6, "entitlements");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    entitlements = v7->_entitlements;
    v7->_entitlements = (CHSEntitlementCollection *)v15;

    v7->_dataProtectionLevel = objc_msgSend(v6, "dataProtectionLevel");
    v7->_hashValue = 0;
    v7->_hasValidHash = 0;
    if (v4)
    {
      objc_msgSend(v6, "orderedWidgetDescriptors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      orderedWidgetDescriptors = v7->_orderedWidgetDescriptors;
      v7->_orderedWidgetDescriptors = (NSArray *)v18;

      objc_msgSend(v6, "orderedControlDescriptors");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      orderedControlDescriptors = v7->_orderedControlDescriptors;
      v7->_orderedControlDescriptors = (NSArray *)v21;
    }
    else
    {
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      objc_msgSend(v6, "orderedWidgetDescriptors");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v43;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v43 != v25)
              objc_enumerationMutation(v23);
            v27 = -[CHSWidgetDescriptor initFromDescriptor:includeIntents:]([CHSWidgetDescriptor alloc], "initFromDescriptor:includeIntents:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v26), 0);
            objc_msgSend(v20, "addObject:", v27);

            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v24);
      }

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v20);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v7->_orderedWidgetDescriptors;
      v7->_orderedWidgetDescriptors = (NSArray *)v28;

      orderedControlDescriptors = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v6, "orderedControlDescriptors", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v39;
        do
        {
          v33 = 0;
          do
          {
            if (*(_QWORD *)v39 != v32)
              objc_enumerationMutation(v30);
            v34 = -[CHSControlDescriptor initFromDescriptor:includeIntents:]([CHSControlDescriptor alloc], "initFromDescriptor:includeIntents:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v33), 0);
            -[NSArray addObject:](orderedControlDescriptors, "addObject:", v34);

            ++v33;
          }
          while (v31 != v33);
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        }
        while (v31);
      }

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", orderedControlDescriptors);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v7->_orderedControlDescriptors;
      v7->_orderedControlDescriptors = (NSArray *)v35;

    }
  }

  return v7;
}

- (id)initFromExtension:(id)a3
{
  return -[CHSWidgetExtension initFromExtension:includeIntents:](self, "initFromExtension:includeIntents:", a3, 1);
}

- (id)controlDescriptorForKind:(id)a3
{
  id v4;
  NSArray *orderedControlDescriptors;
  void *v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  orderedControlDescriptors = self->_orderedControlDescriptors;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __47__CHSWidgetExtension_controlDescriptorForKind___block_invoke;
  v23[3] = &unk_1E2A5AA00;
  v18 = v4;
  v24 = v18;
  -[NSArray bs_firstObjectPassingTest:](orderedControlDescriptors, "bs_firstObjectPassingTest:", v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = self->_orderedControlDescriptors;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v8);
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "kind");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@, "), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:", v14);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
      }
      while (v9);
    }

    CHSLogChronoServices();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[CHSWidgetExtension succinctDescription](self, "succinctDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      v29 = 2114;
      v30 = v7;
      _os_log_error_impl(&dword_18FB18000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to find control descriptor of kind: %{public}@.  Available kinds: [%{public}@]", buf, 0x20u);

    }
  }

  return v6;
}

uint64_t __47__CHSWidgetExtension_controlDescriptorForKind___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)widgetDescriptorForKind:(id)a3
{
  id v4;
  NSArray *orderedWidgetDescriptors;
  void *v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  orderedWidgetDescriptors = self->_orderedWidgetDescriptors;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __46__CHSWidgetExtension_widgetDescriptorForKind___block_invoke;
  v23[3] = &unk_1E2A5A328;
  v18 = v4;
  v24 = v18;
  -[NSArray bs_firstObjectPassingTest:](orderedWidgetDescriptors, "bs_firstObjectPassingTest:", v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = self->_orderedWidgetDescriptors;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v8);
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "kind");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@, "), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:", v14);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
      }
      while (v9);
    }

    CHSLogChronoServices();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[CHSWidgetExtension succinctDescription](self, "succinctDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      v29 = 2114;
      v30 = v7;
      _os_log_error_impl(&dword_18FB18000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to find widget descriptor of kind: %{public}@.  Available kinds: [%{public}@]", buf, 0x20u);

    }
  }

  return v6;
}

uint64_t __46__CHSWidgetExtension_widgetDescriptorForKind___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetExtension initFromExtension:]([CHSWidgetExtension alloc], "initFromExtension:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetExtension initFromExtension:]([CHSMutableWidgetExtension alloc], "initFromExtension:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CHSEntitlementCollection *entitlements;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_identity, CFSTR("identity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDisplayName, CFSTR("dn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerBundleLocalizedDisplayName, CFSTR("cdn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orderedWidgetDescriptors, CFSTR("desc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orderedControlDescriptors, CFSTR("controls"));
  entitlements = self->_entitlements;
  if (entitlements)
    objc_msgSend(v5, "encodeObject:forKey:", entitlements, CFSTR("entitlements"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dataProtectionLevel, CFSTR("dataProtectionLevel"));

}

- (CHSWidgetExtension)initWithCoder:(id)a3
{
  id v4;
  CHSWidgetExtension *v5;
  uint64_t v6;
  CHSExtensionIdentity *identity;
  uint64_t v8;
  NSString *localizedDisplayName;
  uint64_t v10;
  NSString *containerBundleLocalizedDisplayName;
  uint64_t v12;
  CHSEntitlementCollection *entitlements;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *orderedControlDescriptors;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *orderedWidgetDescriptors;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CHSWidgetExtension;
  v5 = -[CHSWidgetExtension init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identity"));
    v6 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (CHSExtensionIdentity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dn"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cdn"));
    v10 = objc_claimAutoreleasedReturnValue();
    containerBundleLocalizedDisplayName = v5->_containerBundleLocalizedDisplayName;
    v5->_containerBundleLocalizedDisplayName = (NSString *)v10;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("entitlements")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entitlements"));
      v12 = objc_claimAutoreleasedReturnValue();
      entitlements = v5->_entitlements;
      v5->_entitlements = (CHSEntitlementCollection *)v12;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("controls")))
    {
      v14 = (void *)MEMORY[0x1E0C99E60];
      v27[0] = objc_opt_class();
      v27[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("controls"));
      v17 = objc_claimAutoreleasedReturnValue();
      orderedControlDescriptors = v5->_orderedControlDescriptors;
      v5->_orderedControlDescriptors = (NSArray *)v17;

    }
    else
    {
      v15 = v5->_orderedControlDescriptors;
      v5->_orderedControlDescriptors = 0;
    }

    v19 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("desc"));
    v22 = objc_claimAutoreleasedReturnValue();
    orderedWidgetDescriptors = v5->_orderedWidgetDescriptors;
    v5->_orderedWidgetDescriptors = (NSArray *)v22;

    v5->_dataProtectionLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dataProtectionLevel"));
    v5->_hashValue = 0;
    v5->_hasValidHash = 0;
  }

  return v5;
}

- (BOOL)isLinkedOnOrAfter:(unint64_t)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_orderedWidgetDescriptors;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v7)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "isLinkedOnOrAfter:", a3) & 1) != 0)
        goto LABEL_18;
      if (v6 == ++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_orderedControlDescriptors;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
LABEL_11:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "isLinkedOnOrAfter:", a3, (_QWORD)v14) & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v9)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_18:
    v12 = 1;
    goto LABEL_19;
  }
LABEL_17:
  v12 = 0;
LABEL_19:

  return v12;
}

- (NSString)description
{
  return (NSString *)-[CHSWidgetExtension descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)copyFilteredToOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x194008FB8]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = self->_orderedWidgetDescriptors;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v4, "matchesWidgetDescriptor:", v11))
        {
          if ((objc_msgSend(v4, "includeIntents") & 1) != 0 || !objc_msgSend(v11, "hasIntents"))
          {
            objc_msgSend(v6, "addObject:", v11);
          }
          else
          {
            v12 = (void *)objc_msgSend(v11, "copyWithoutIntents");
            objc_msgSend(v6, "addObject:", v12);

          }
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = self->_orderedControlDescriptors;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        if (objc_msgSend(v4, "matchesControlDescriptor:", v18, (_QWORD)v25))
        {
          if ((objc_msgSend(v4, "includeIntents") & 1) != 0 || !objc_msgSend(v18, "hasIntents"))
          {
            objc_msgSend(v13, "addObject:", v18);
          }
          else
          {
            v19 = (void *)objc_msgSend(v18, "copyWithoutIntents");
            objc_msgSend(v13, "addObject:", v19);

          }
        }
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v15);
  }

  v20 = (void *)-[CHSWidgetExtension mutableCopy](self, "mutableCopy");
  v21 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v20, "setOrderedWidgetDescriptors:", v21);

  v22 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v20, "setOrderedControlDescriptors:", v22);

  v23 = (void *)objc_msgSend(v20, "copy");
  objc_autoreleasePoolPop(v5);

  return v23;
}

- (id)descriptors
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_orderedWidgetDescriptors);
}

- (id)containerBundleIdentifier
{
  return -[CHSExtensionIdentity containerBundleIdentifier](self->_identity, "containerBundleIdentifier");
}

- (id)sourceDeviceIdentifier
{
  return -[CHSExtensionIdentity deviceIdentifier](self->_identity, "deviceIdentifier");
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSWidgetExtension succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionWithBundleIDWithoutFullIdentity
{
  void *v2;
  void *v3;

  -[CHSWidgetExtension succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity:](self, "succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return -[CHSWidgetExtension succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity:](self, "succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity:", 0);
}

- (id)succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity:(BOOL)a3
{
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CHSWidgetExtension *v11;
  BOOL v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__CHSWidgetExtension_succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity___block_invoke;
  v9[3] = &unk_1E2A5AA28;
  v12 = a3;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendProem:block:", self, v9);
  v7 = v6;

  return v7;
}

id __82__CHSWidgetExtension_succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "extensionBundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("bundleID"));

  }
  else
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("identity"));
  }
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count"), CFSTR("widgets"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count"), CFSTR("controls"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSWidgetExtension descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CHSWidgetExtension *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__CHSWidgetExtension_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2A5A290;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

id __60__CHSWidgetExtension_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("identity"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("localizedDisplayName"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("localizedBundleDisplayName"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("entitlements"));
  objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("widgets"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("controls"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("dataProtectionLevel"));
}

- (CHSExtensionIdentity)identity
{
  return self->_identity;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)containerBundleLocalizedDisplayName
{
  return self->_containerBundleLocalizedDisplayName;
}

- (int64_t)dataProtectionLevel
{
  return self->_dataProtectionLevel;
}

- (NSArray)orderedControlDescriptors
{
  return self->_orderedControlDescriptors;
}

- (NSArray)orderedWidgetDescriptors
{
  return self->_orderedWidgetDescriptors;
}

- (CHSEntitlementCollection)entitlements
{
  return self->_entitlements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_orderedControlDescriptors, 0);
  objc_storeStrong((id *)&self->_orderedWidgetDescriptors, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_containerBundleLocalizedDisplayName, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end
