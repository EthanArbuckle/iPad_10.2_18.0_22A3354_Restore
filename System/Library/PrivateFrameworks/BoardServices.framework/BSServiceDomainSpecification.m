@implementation BSServiceDomainSpecification

- (BSServiceDomainSpecification)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSServiceDomainSpecification *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceDomainSpecification *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on BSServiceDomainSpecification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BSServiceDomainSpecification.m");
    v17 = 1024;
    v18 = 38;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSServiceDomainSpecification *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)machName
{
  NSString *machName;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  machName = self->_machName;
  if (self->_start == 3)
  {
    if (machName)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v6, self->_machName);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIdentifier");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = machName;
  }
  return v7;
}

- (id)loadRBSLaunchIdentifiers
{
  id *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  BSServiceDomainSpecification *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot query RBSLaunchIdentifiers if BoardServices infrastructure has not initialized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v18 = v12;
      v19 = 2114;
      v20 = v14;
      v21 = 2048;
      v22 = self;
      v23 = 2114;
      v24 = CFSTR("BSServiceDomainSpecification.m");
      v25 = 1024;
      v26 = 62;
      v27 = 2114;
      v28 = v11;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C3C8CLL);
  }
  if (self->_machName)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[13], "managedEndpointByLaunchIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__BSServiceDomainSpecification_loadRBSLaunchIdentifiers__block_invoke;
    v15[3] = &unk_1E390D378;
    v15[4] = self;
    v7 = v5;
    v16 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v15);

    v8 = v16;
    v9 = v7;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __56__BSServiceDomainSpecification_loadRBSLaunchIdentifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

- (NSSet)services
{
  return -[NSOrderedSet set](self->_orderedServices, "set");
}

- (id)serviceForIdentifier:(id)a3
{
  -[NSDictionary objectForKey:](self->_servicesByIdentifier, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_initWithIdentifier:(void *)a3 machName:(void *)a4 start:(void *)a5 servicesByIdentifier:(void *)a6 derivedServiceRestrictions:(void *)a7 enableIfFeatureFlags:(void *)a8 disableIfFeatureFlags:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  objc_super v39;

  v15 = a2;
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (a1)
  {
    v39.receiver = a1;
    v39.super_class = (Class)BSServiceDomainSpecification;
    a1 = (id *)objc_msgSendSuper2(&v39, sel_init);
    if (a1)
    {
      v21 = objc_msgSend(v15, "copy");
      v22 = a1[4];
      a1[4] = (id)v21;

      v23 = objc_msgSend(v16, "copy");
      v24 = a1[5];
      a1[5] = (id)v23;

      a1[7] = a4;
      v25 = objc_msgSend(v17, "copy");
      v26 = a1[1];
      a1[1] = (id)v25;

      v27 = objc_msgSend(v19, "copy");
      v28 = a1[2];
      a1[2] = (id)v27;

      v29 = objc_msgSend(v20, "copy");
      v30 = a1[3];
      a1[3] = (id)v29;

      v31 = (void *)MEMORY[0x1E0C99E40];
      objc_msgSend(a1[1], "allValues");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "sortedArrayUsingComparator:", &__block_literal_global_0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "orderedSetWithArray:", v33);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = a1[6];
      a1[6] = (id)v34;

      v36 = objc_msgSend(v18, "copy");
      v37 = a1[8];
      a1[8] = (id)v36;

    }
  }

  return a1;
}

uint64_t __158__BSServiceDomainSpecification__initWithIdentifier_machName_start_servicesByIdentifier_derivedServiceRestrictions_enableIfFeatureFlags_disableIfFeatureFlags___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

- (id)_domainWithAdditionalServices:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "count"))
    {
      v5 = (void *)objc_msgSend(a1[1], "mutableCopy");
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v17 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v10, "identifier", (_QWORD)v16);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12 == 0;

            if (v13)
            {
              objc_msgSend(v10, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v10, v14);

            }
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v7);
      }

      if (!objc_msgSend(a1[1], "isEqualToDictionary:", v5))
      {
        a1 = -[BSServiceDomainSpecification _initWithIdentifier:machName:start:servicesByIdentifier:derivedServiceRestrictions:enableIfFeatureFlags:disableIfFeatureFlags:]((id *)[BSServiceDomainSpecification alloc], a1[4], a1[5], a1[7], v5, a1[8], a1[2], a1[3]);

        goto LABEL_16;
      }

    }
    a1 = a1;
  }
LABEL_16:

  return a1;
}

- (id)_xpcSubserviceName
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 56) == 3)
      return *(id *)(a1 + 40);
    a1 = 0;
  }
  return (id)a1;
}

- (void)_appendManagerDumpBodyToBuilder:(void *)a3 withMultilinePrefix:
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (a1)
    -[BSServiceDomainSpecification _appendBodySectionToBuilder:withName:multilinePrefix:includeServices:](a1, v6, CFSTR("specification"), v5, 0);

}

- (void)_appendBodySectionToBuilder:(void *)a3 withName:(void *)a4 multilinePrefix:(char)a5 includeServices:
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  char v15;

  v11 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __101__BSServiceDomainSpecification__appendBodySectionToBuilder_withName_multilinePrefix_includeServices___block_invoke;
    v12[3] = &unk_1E390D3C0;
    v13 = v11;
    v14 = a1;
    v15 = a5;
    objc_msgSend(v13, "appendBodySectionWithName:multilinePrefix:block:", v9, v10, v12);

  }
}

- (NSString)description
{
  return (NSString *)-[BSServiceDomainSpecification descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSServiceDomainSpecification succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_identifier, 0);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSServiceDomainSpecification descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BSServiceDomainSpecification succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceDomainSpecification _appendBodySectionToBuilder:withName:multilinePrefix:includeServices:]((uint64_t)self, v5, 0, v4, 1);

  return v5;
}

void __101__BSServiceDomainSpecification__appendBodySectionToBuilder_withName_multilinePrefix_includeServices___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("MachName"), 1);
  v2 = *(void **)(a1 + 32);
  NSStringFromBSServiceDomainStartType(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:");

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:");

  objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("EnableIfFeatureFlags"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("DisableIfFeatureFlags"), 1);
  if (*(_BYTE *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:");

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedServiceRestrictions, 0);
  objc_storeStrong((id *)&self->_orderedServices, 0);
  objc_storeStrong((id *)&self->_machName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_disableIfFeatureFlags, 0);
  objc_storeStrong((id *)&self->_enableIfFeatureFlags, 0);
  objc_storeStrong((id *)&self->_servicesByIdentifier, 0);
}

@end
