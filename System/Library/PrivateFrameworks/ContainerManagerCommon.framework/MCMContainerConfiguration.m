@implementation MCMContainerConfiguration

- (MCMContainerConfiguration)initWithPreprocessedPlist:(id)a3 name:(id)a4
{
  id v7;
  MCMContainerConfiguration *v8;
  MCMContainerConfiguration *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCMContainerConfiguration;
  v8 = -[MCMPlistReadOnly initWithPreprocessedPlist:conformingToProtocol:](&v11, sel_initWithPreprocessedPlist_conformingToProtocol_, a3, &unk_1EFBC1588);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_name, a4);

  return v9;
}

- (unsigned)disposition
{
  if (-[MCMContainerConfiguration handledDirectly](self, "handledDirectly"))
    return 1;
  if (-[MCMContainerConfiguration handledByProxy](self, "handledByProxy"))
    return 2;
  return 0;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[MCMContainerConfiguration containerClass](self, "containerClass");
  -[MCMContainerConfiguration name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%llu)%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  return (NSString *)-[MCMContainerConfiguration debugDescriptionWithIndentString:](self, "debugDescriptionWithIndentString:", &stru_1E8CB6A50);
}

- (id)debugDescriptionWithIndentString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)MCMContainerConfiguration;
  v4 = a3;
  -[MCMPlistReadOnly descriptionOfBoolPropertiesWithIndentString:](&v9, sel_descriptionOfBoolPropertiesWithIndentString_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%@containerClass: %llu\n"), v4, self->_containerClass);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("%@name: %@\n"), v4, self->_name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  return self->_containerClass;
}

- (BOOL)isEqualToContainerConfig:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[MCMContainerConfiguration containerClass](self, "containerClass");
  v6 = objc_msgSend(v4, "containerClass");

  return v5 == v6;
}

- (BOOL)isEqual:(id)a3
{
  MCMContainerConfiguration *v4;
  MCMContainerConfiguration *v5;
  BOOL v6;

  v4 = (MCMContainerConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (-[MCMContainerConfiguration conformsToProtocol:](v4, "conformsToProtocol:", &unk_1EFBC1588))
  {
    v6 = -[MCMContainerConfiguration isEqualToContainerConfig:](self, "isEqualToContainerConfig:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)_containerClassFromPlistValue:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = 0;

  return v4;
}

- (id)_containerIdentifierSetFromPlistValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  MCMError *v16;
  NSObject *v17;
  NSObject *v18;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v21;
      v31 = 2112;
      v32 = v7;
      _os_log_error_impl(&dword_1CF807000, v17, OS_LOG_TYPE_ERROR, "Team ID container ID map value is not in a valid format; expected = NSArray, got = %@, value = %@",
        buf,
        0x16u);

    }
    v16 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 149, 3);
LABEL_18:
    v15 = 0;
    if (!a4)
      goto LABEL_21;
LABEL_19:
    if (!v15)
      *a4 = objc_retainAutorelease(v16);
    goto LABEL_21;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          container_log_handle_for_category();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v30 = v23;
            v31 = 2112;
            v32 = v8;
            _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, "Team ID container ID map value is not in a valid format; expected = NSArray<NSString>, got = NSArray<%@>, value = %@",
              buf,
              0x16u);

          }
          v16 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 149, 3);

          goto LABEL_18;
        }
        objc_msgSend(v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
      if (v10)
        continue;
      break;
    }
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  v16 = 0;
  if (a4)
    goto LABEL_19;
LABEL_21:

  return v15;
}

- (id)_sandboxAffordancesFromPlistValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  MCMError *v11;
  uint64_t v12;
  uint64_t v13;
  MCMError *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  objc_class *v21;
  void *v22;
  id *v23;
  id v24;
  MCMError *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  if (!v5)
  {
    v11 = 0;
    if (!a4)
      goto LABEL_24;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    if (v9)
    {
      v10 = v9;
      v23 = a4;
      v24 = v5;
      v11 = 0;
      v12 = *(_QWORD *)v33;
      while (2)
      {
        v13 = 0;
        v14 = v11;
        do
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v8);
          v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v13);
          objc_msgSend(v8, "objectForKeyedSubscript:", v15, v23, v24);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v14;
          -[MCMContainerConfiguration _containerIdentifierSetFromPlistValue:error:](self, "_containerIdentifierSetFromPlistValue:error:", v16, &v26);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v26;

          if (!v17)
          {

            v6 = 0;
            goto LABEL_19;
          }
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v15);

          ++v13;
          v14 = v11;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
        if (v10)
          continue;
        break;
      }
LABEL_19:
      a4 = v23;
      v5 = v24;
    }
    else
    {
      v11 = 0;
    }

    if (a4)
      goto LABEL_22;
  }
  else
  {

    container_log_handle_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v22;
      v29 = 2112;
      v30 = v5;
      _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, "Team ID container ID map is not in a valid format; expected = NSDictionary, got = %@, value = %@",
        buf,
        0x16u);

    }
    v11 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 149, 3);
    v6 = 0;
    if (a4)
    {
LABEL_22:
      if (!v6)
        *a4 = objc_retainAutorelease(v11);
    }
  }
LABEL_24:
  v19 = (void *)objc_msgSend(v6, "copy");

  return v19;
}

- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  id v10;
  NSDictionary *sandboxAffordances;
  NSDictionary *v12;
  id v14[2];

  v14[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containerClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_containerClass = -[MCMContainerConfiguration _containerClassFromPlistValue:](self, "_containerClassFromPlistValue:", v7);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sandboxAffordances"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = 0;
  -[MCMContainerConfiguration _sandboxAffordancesFromPlistValue:error:](self, "_sandboxAffordancesFromPlistValue:error:", v8, v14);
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = v14[0];
  sandboxAffordances = self->_sandboxAffordances;
  self->_sandboxAffordances = v9;

  v12 = self->_sandboxAffordances;
  if (a4 && !v12)
    *a4 = objc_retainAutorelease(v10);

  return v12 != 0;
}

- (BOOL)supportedOnPlatform
{
  return self->_supportedOnPlatform;
}

- (BOOL)autoRollsPathOnBuildUpdate
{
  return self->_autoRollsPathOnBuildUpdate;
}

- (BOOL)handledByProxy
{
  return self->_handledByProxy;
}

- (BOOL)handledDirectly
{
  return self->_handledDirectly;
}

- (BOOL)usesGlobalBundleUserIdentity
{
  return self->_usesGlobalBundleUserIdentity;
}

- (BOOL)usesGlobalSystemUserIdentity
{
  return self->_usesGlobalSystemUserIdentity;
}

- (BOOL)personaAndUserSpecific
{
  return self->_personaAndUserSpecific;
}

- (BOOL)migrateCodeSignInfoFromMetadataToDB
{
  return self->_migrateCodeSignInfoFromMetadataToDB;
}

- (BOOL)honorGroupContainerEntitlementForMatchingTeamIDPrefix
{
  return self->_honorGroupContainerEntitlementForMatchingTeamIDPrefix;
}

- (BOOL)honorGroupContainerEntitlementForAppStoreSigned
{
  return self->_honorGroupContainerEntitlementForAppStoreSigned;
}

- (BOOL)honorGroupContainerEntitlementForPlatformBinary
{
  return self->_honorGroupContainerEntitlementForPlatformBinary;
}

- (BOOL)honorGroupContainerEntitlementForiPadAppsOnMac
{
  return self->_honorGroupContainerEntitlementForiPadAppsOnMac;
}

- (BOOL)honorGroupContainerEntitlementForProfileValidatedEntitlements
{
  return self->_honorGroupContainerEntitlementForProfileValidatedEntitlements;
}

- (BOOL)supportsProtectedContainerWithRestrictedEntitlement
{
  return self->_supportsProtectedContainerWithRestrictedEntitlement;
}

- (BOOL)ownerIssuedSandboxExtension
{
  return self->_ownerIssuedSandboxExtension;
}

- (BOOL)cleanTransientsEachBoot
{
  return self->_cleanTransientsEachBoot;
}

- (BOOL)alwaysRequireSignatureScrutiny
{
  return self->_alwaysRequireSignatureScrutiny;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)sandboxAffordances
{
  return self->_sandboxAffordances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxAffordances, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
