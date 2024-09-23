@implementation NEPathController

+ (id)copyAggregatePathRules
{
  uint64_t configuration_generation;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  const void *bytes_ptr;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&copyAggregatePathRules_lock);
  configuration_generation = ne_get_configuration_generation();
  v3 = configuration_generation;
  v4 = (void *)copyAggregatePathRules_cachedRules;
  if (copyAggregatePathRules_cachedRules)
  {
    if (configuration_generation && configuration_generation == copyAggregatePathRules_savedGeneration)
    {
      copyAggregatePathRules_savedGeneration = configuration_generation;
      goto LABEL_19;
    }
    copyAggregatePathRules_cachedRules = 0;

    v4 = (void *)copyAggregatePathRules_cachedRules;
    copyAggregatePathRules_savedGeneration = v3;
    if (copyAggregatePathRules_cachedRules)
      goto LABEL_19;
  }
  else
  {
    copyAggregatePathRules_savedGeneration = configuration_generation;
  }
  v5 = NEHelperCopyAggregatePathRules();
  v6 = (void *)v5;
  if (v5 && MEMORY[0x1A1ACFDA4](v5) == MEMORY[0x1E0C812E8])
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D50]);
    bytes_ptr = xpc_data_get_bytes_ptr(v6);
    v9 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v6), 0);
    v22 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, &v22);
    v11 = v22;
    if (v11)
    {
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v11;
        _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "Failed to create a unarchiver for the aggregate path rules: %@", buf, 0xCu);
      }

    }
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v15, CFSTR("config-aggregate-rules"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)copyAggregatePathRules_cachedRules;
    copyAggregatePathRules_cachedRules = v16;

    if ((isa_nsarray((void *)copyAggregatePathRules_cachedRules) & 1) == 0)
    {
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "Failed to de-serialize the aggregate path rules", buf, 2u);
      }

      v19 = (void *)copyAggregatePathRules_cachedRules;
      copyAggregatePathRules_cachedRules = 0;

    }
  }

  v4 = (void *)copyAggregatePathRules_cachedRules;
LABEL_19:
  v20 = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)&copyAggregatePathRules_lock);
  return v20;
}

- (NEPathController)initWithCoder:(id)a3
{
  id v4;
  NEPathController *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *pathRules;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *payloadAppRules;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NEPathController;
  v5 = -[NEPathController init](&v19, sel_init);
  if (v5)
  {
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Enabled"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Rules"));
    v9 = objc_claimAutoreleasedReturnValue();
    pathRules = v5->_pathRules;
    v5->_pathRules = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("PayloadAppRules"));
    v16 = objc_claimAutoreleasedReturnValue();
    payloadAppRules = v5->_payloadAppRules;
    v5->_payloadAppRules = (NSArray *)v16;

    v5->_cellularFallbackFlags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cellularFallbackFlags"));
    v5->_ignoreRouteRules = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IgnoreRouteRules"));
    v5->_ignoreFallback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IgnoreFallback"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  id Property;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[NEPathController isEnabled](self, "isEnabled"), CFSTR("Enabled"));
  -[NEPathController pathRules](self, "pathRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("Rules"));

  if (self)
    Property = objc_getProperty(self, v5, 32, 1);
  else
    Property = 0;
  objc_msgSend(v7, "encodeObject:forKey:", Property, CFSTR("PayloadAppRules"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[NEPathController cellularFallbackFlags](self, "cellularFallbackFlags"), CFSTR("cellularFallbackFlags"));
  objc_msgSend(v7, "encodeBool:forKey:", -[NEPathController ignoreRouteRules](self, "ignoreRouteRules"), CFSTR("IgnoreRouteRules"));
  objc_msgSend(v7, "encodeBool:forKey:", -[NEPathController ignoreFallback](self, "ignoreFallback"), CFSTR("IgnoreFallback"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEPathController *v4;
  void *v5;
  const char *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  SEL v11;
  const char *v12;
  void *v13;

  v4 = -[NEPathController init](+[NEPathController allocWithZone:](NEPathController, "allocWithZone:", a3), "init");
  -[NEPathController setEnabled:](v4, "setEnabled:", -[NEPathController isEnabled](self, "isEnabled"));
  -[NEPathController pathRules](self, "pathRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEPathController pathRules](self, "pathRules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithArray:copyItems:", v8, 1);
    -[NEPathController setPathRules:](v4, "setPathRules:", v9);

  }
  if (self && objc_getProperty(self, v6, 32, 1))
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D20]);
    v13 = (void *)objc_msgSend(v10, "initWithArray:copyItems:", objc_getProperty(self, v11, 32, 1), 1);
    if (v4)
      objc_setProperty_atomic_copy(v4, v12, v13, 32);

  }
  -[NEPathController setCellularFallbackFlags:](v4, "setCellularFallbackFlags:", -[NEPathController cellularFallbackFlags](self, "cellularFallbackFlags"));
  -[NEPathController setIgnoreRouteRules:](v4, "setIgnoreRouteRules:", -[NEPathController ignoreRouteRules](self, "ignoreRouteRules"));
  -[NEPathController setIgnoreFallback:](v4, "setIgnoreFallback:", -[NEPathController ignoreFallback](self, "ignoreFallback"));
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEPathController pathRules](self, "pathRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NEPathController pathRules](self, "pathRules", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      v10 = 1;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!objc_msgSend(v12, "checkValidityAndCollectErrors:", v4))
              v10 = 0;
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid app rule"), v4);
            v10 = 0;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 1;
    }

    v13 = v10 & 1;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  const char *v9;
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathController isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  -[NEPathController pathRules](self, "pathRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("pathRules"), v5, a4);

  if (self)
    Property = objc_getProperty(self, v9, 32, 1);
  else
    Property = 0;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("payloadAppRules"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEPathController cellularFallbackFlags](self, "cellularFallbackFlags"), CFSTR("cellularFallbackFlags"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathController ignoreRouteRules](self, "ignoreRouteRules"), CFSTR("ignoreRouteRules"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathController ignoreFallback](self, "ignoreFallback"), CFSTR("ignoreFallback"), v5, a4);
  return v7;
}

- (id)copyPathRuleBySigningIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  -[NEPathController pathRules](self, "pathRules", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        objc_msgSend(v9, "matchSigningIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)removePathRuleBySigningIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[NEPathController pathRules](self, "pathRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "matchSigningIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v4);

      if (v11)
        break;

      if (++v8 >= (unint64_t)objc_msgSend(v7, "count"))
        goto LABEL_5;
    }
    objc_msgSend(v7, "removeObjectAtIndex:", v8);
    -[NEPathController setPathRules:](self, "setPathRules:", v7);

    v12 = 1;
  }
  else
  {
LABEL_5:
    v12 = 0;
  }

  return v12;
}

- (id)copyPathRuleSigningIdentifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[NEPathController pathRules](self, "pathRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NEPathController pathRules](self, "pathRules", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "matchSigningIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (BOOL)hasNonDefaultRules
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NEPathController pathRules](self, "pathRules", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "cellularBehavior") != 2
          || objc_msgSend(v7, "wifiBehavior") != 2 && objc_msgSend(v7, "wifiBehavior")
          || (objc_msgSend(v7, "denyMulticast") & 1) != 0
          || (objc_msgSend(v7, "denyAll") & 1) != 0)
        {
          v8 = 1;
          goto LABEL_16;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_16:

  return v8;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)ignoreRouteRules
{
  return self->_ignoreRouteRules;
}

- (void)setIgnoreRouteRules:(BOOL)a3
{
  self->_ignoreRouteRules = a3;
}

- (BOOL)ignoreFallback
{
  return self->_ignoreFallback;
}

- (void)setIgnoreFallback:(BOOL)a3
{
  self->_ignoreFallback = a3;
}

- (int64_t)cellularFallbackFlags
{
  return self->_cellularFallbackFlags;
}

- (void)setCellularFallbackFlags:(int64_t)a3
{
  self->_cellularFallbackFlags = a3;
}

- (NSArray)pathRules
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPathRules:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAppRules, 0);
  objc_storeStrong((id *)&self->_pathRules, 0);
}

@end
