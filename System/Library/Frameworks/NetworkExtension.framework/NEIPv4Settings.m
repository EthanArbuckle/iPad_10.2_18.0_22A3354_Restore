@implementation NEIPv4Settings

- (NEIPv4Settings)init
{
  NEIPv4Settings *v2;
  NEIPv4Settings *v3;
  NSArray *v4;
  NSArray *addresses;
  NSArray *v6;
  NSArray *subnetMasks;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NEIPv4Settings;
  v2 = -[NEIPv4Settings init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_configMethod = 3;
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    addresses = v3->_addresses;
    v3->_addresses = v4;

    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    subnetMasks = v3->_subnetMasks;
    v3->_subnetMasks = v6;

  }
  return v3;
}

- (NEIPv4Settings)initWithAddresses:(NSArray *)addresses subnetMasks:(NSArray *)subnetMasks
{
  NSArray *v6;
  NSArray *v7;
  NEIPv4Settings *v8;
  NEIPv4Settings *v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  NSArray *v13;
  objc_super v15;

  v6 = addresses;
  v7 = subnetMasks;
  v15.receiver = self;
  v15.super_class = (Class)NEIPv4Settings;
  v8 = -[NEIPv4Settings init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_configMethod = 3;
    v10 = -[NSArray copy](v6, "copy");
    v11 = v9->_addresses;
    v9->_addresses = (NSArray *)v10;

    v12 = -[NSArray copy](v7, "copy");
    v13 = v9->_subnetMasks;
    v9->_subnetMasks = (NSArray *)v12;

  }
  return v9;
}

- (NEIPv4Settings)initWithConfigMethod:(int64_t)a3
{
  NEIPv4Settings *result;

  result = -[NEIPv4Settings init](self, "init");
  if (result)
    result->_configMethod = a3;
  return result;
}

- (NEIPv4Settings)initWithCoder:(id)a3
{
  id v4;
  NEIPv4Settings *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *addresses;
  void *v11;
  uint64_t v12;
  NSArray *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *subnetMasks;
  void *v20;
  uint64_t v21;
  NSArray *v22;
  NSObject *v23;
  uint64_t v24;
  NSString *router;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *includedRoutes;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSArray *excludedRoutes;
  NSArray *v37;
  NSArray *v38;
  objc_super v39;
  uint8_t buf[4];
  NSArray *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)NEIPv4Settings;
  v5 = -[NEIPv4Settings init](&v39, sel_init);
  if (v5)
  {
    v5->_configMethod = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ConfigMethod"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("AddressArray"));
    v9 = objc_claimAutoreleasedReturnValue();
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v9;

    if (!v5->_addresses)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Address"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v11, 0);
        v13 = v5->_addresses;
        v5->_addresses = (NSArray *)v12;

        ne_log_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v37 = v5->_addresses;
          *(_DWORD *)buf = 138412290;
          v41 = v37;
          _os_log_debug_impl(&dword_19BD16000, v14, OS_LOG_TYPE_DEBUG, "initwithcoder single router IPv4address %@", buf, 0xCu);
        }

      }
    }
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("SubnetMaskArray"));
    v18 = objc_claimAutoreleasedReturnValue();
    subnetMasks = v5->_subnetMasks;
    v5->_subnetMasks = (NSArray *)v18;

    if (!v5->_subnetMasks)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SubnetMask"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v20, 0);
        v22 = v5->_subnetMasks;
        v5->_subnetMasks = (NSArray *)v21;

        ne_log_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v38 = v5->_subnetMasks;
          *(_DWORD *)buf = 138412290;
          v41 = v38;
          _os_log_debug_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEBUG, "initwithcoder subnet mask %@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Router"));
    v24 = objc_claimAutoreleasedReturnValue();
    router = v5->_router;
    v5->_router = (NSString *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("IncludeRoutes"));
    v29 = objc_claimAutoreleasedReturnValue();
    includedRoutes = v5->_includedRoutes;
    v5->_includedRoutes = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("ExcludeRoutes"));
    v34 = objc_claimAutoreleasedReturnValue();
    excludedRoutes = v5->_excludedRoutes;
    v5->_excludedRoutes = (NSArray *)v34;

    v5->_overridePrimary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OverridePrimary"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeInt32:forKey:", -[NEIPv4Settings configMethod](self, "configMethod"), CFSTR("ConfigMethod"));
  -[NEIPv4Settings addresses](self, "addresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("AddressArray"));

  -[NEIPv4Settings subnetMasks](self, "subnetMasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("SubnetMaskArray"));

  -[NEIPv4Settings router](self, "router");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("Router"));

  -[NEIPv4Settings includedRoutes](self, "includedRoutes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("IncludeRoutes"));

  -[NEIPv4Settings excludedRoutes](self, "excludedRoutes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("ExcludeRoutes"));

  objc_msgSend(v9, "encodeBool:forKey:", -[NEIPv4Settings overridePrimary](self, "overridePrimary"), CFSTR("OverridePrimary"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  NEIPv4Settings *v4;
  void *v5;
  void *v6;
  NEIPv4Settings *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[NEIPv4Settings allocWithZone:](NEIPv4Settings, "allocWithZone:", a3);
  -[NEIPv4Settings addresses](self, "addresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv4Settings subnetMasks](self, "subnetMasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NEIPv4Settings initWithAddresses:subnetMasks:](v4, "initWithAddresses:subnetMasks:", v5, v6);

  -[NEIPv4Settings setConfigMethod:](v7, "setConfigMethod:", -[NEIPv4Settings configMethod](self, "configMethod"));
  -[NEIPv4Settings router](self, "router");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv4Settings setRouter:](v7, "setRouter:", v8);

  -[NEIPv4Settings includedRoutes](self, "includedRoutes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv4Settings setIncludedRoutes:](v7, "setIncludedRoutes:", v9);

  -[NEIPv4Settings excludedRoutes](self, "excludedRoutes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv4Settings setExcludedRoutes:](v7, "setExcludedRoutes:", v10);

  -[NEIPv4Settings setOverridePrimary:](v7, "setOverridePrimary:", -[NEIPv4Settings overridePrimary](self, "overridePrimary"));
  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v19;
  uint64_t v20;
  void *v21;
  id v22;
  int v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  NSObject *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  int v46;
  uint8_t buf[4];
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (-[NEIPv4Settings configMethod](self, "configMethod", a3) != 3)
    return 1;
  v46 = 0;
  -[NEIPv4Settings addresses](self, "addresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[NEIPv4Settings addresses](self, "addresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = inet_pton(2, (const char *)objc_msgSend(v7, "UTF8String"), &v46);

    if (v8)
      goto LABEL_8;
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid IPv4 address";
LABEL_43:
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
    }
  }
  else
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Missing IPv4 address";
      goto LABEL_43;
    }
  }

LABEL_8:
  -[NEIPv4Settings subnetMasks](self, "subnetMasks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  -[NEIPv4Settings addresses](self, "addresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 != v14)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "Missing IPv4 subnet mask", buf, 2u);
    }

  }
  -[NEIPv4Settings subnetMasks](self, "subnetMasks");
  v16 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject count](v16, "count"))
  {
    -[NEIPv4Settings subnetMasks](self, "subnetMasks");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = inet_pton(2, (const char *)objc_msgSend(v18, "UTF8String"), &v46);

    if (v19)
      goto LABEL_17;
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "Invalid IPv4 subnet mask", buf, 2u);
    }
  }

LABEL_17:
  -[NEIPv4Settings router](self, "router");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[NEIPv4Settings router](self, "router");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = inet_pton(2, (const char *)objc_msgSend(v22, "UTF8String"), &v46);

    if (!v23)
    {
      ne_log_obj();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v24, OS_LOG_TYPE_ERROR, "Invalid IPv4 router", buf, 2u);
      }

    }
  }
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[NEIPv4Settings includedRoutes](self, "includedRoutes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "checkValidityAndCollectErrors:", v25);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v28);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[NEIPv4Settings excludedRoutes](self, "excludedRoutes", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "checkValidityAndCollectErrors:", v25);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v33);
  }

  if (objc_msgSend(v25, "count"))
  {
    ne_log_obj();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v25;
      _os_log_error_impl(&dword_19BD16000, v36, OS_LOG_TYPE_ERROR, "IPv4 routes are invalid: %@", buf, 0xCu);
    }

  }
  return 1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = a4 & 0xFFFFFFFFFFFFFFF7;
  v9 = -[NEIPv4Settings configMethod](self, "configMethod") - 1;
  if (v9 <= 2)
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", off_1E3CC2360[v9], CFSTR("configMethod"), v5, a4 & 0xFFFFFFFFFFFFFFF7);
  -[NEIPv4Settings addresses](self, "addresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = a4 | 9;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("addresses"), v5, a4 | 9);

  -[NEIPv4Settings subnetMasks](self, "subnetMasks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = a4 | 8;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("subnetMasks"), v5, v13);

  -[NEIPv4Settings router](self, "router");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("router"), v5, v11);

  -[NEIPv4Settings includedRoutes](self, "includedRoutes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("includedRoutes"), v5, v13);

  -[NEIPv4Settings excludedRoutes](self, "excludedRoutes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("excludedRoutes"), v5, v13);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIPv4Settings overridePrimary](self, "overridePrimary"), CFSTR("overridePrimary"), v5, v8);
  return v7;
}

- (id)copyLegacyDictionary
{
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NEIPv4Settings configMethod](self, "configMethod") == 2)
  {
    v4 = (_QWORD *)MEMORY[0x1E0CE9110];
LABEL_5:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *v4, *MEMORY[0x1E0CE8CD8]);
    goto LABEL_6;
  }
  if (-[NEIPv4Settings configMethod](self, "configMethod") == 1)
  {
    v4 = (_QWORD *)MEMORY[0x1E0CE90E8];
    goto LABEL_5;
  }
  if (-[NEIPv4Settings configMethod](self, "configMethod") == 3)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CE9108], *MEMORY[0x1E0CE9108]);
    -[NEIPv4Settings addresses](self, "addresses");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      -[NEIPv4Settings addresses](self, "addresses");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CE8CC8]);

    }
    -[NEIPv4Settings subnetMasks](self, "subnetMasks");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v29)
    {
      -[NEIPv4Settings subnetMasks](self, "subnetMasks");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CE8D18]);

    }
    -[NEIPv4Settings router](self, "router");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[NEIPv4Settings router](self, "router");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0CE8D10]);

    }
  }
LABEL_6:
  if (-[NEIPv4Settings overridePrimary](self, "overridePrimary"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E3D036D0, *MEMORY[0x1E0CE8DA8]);
  -[NEIPv4Settings includedRoutes](self, "includedRoutes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[NEIPv4Settings includedRoutes](self, "includedRoutes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      v11 = *MEMORY[0x1E0CE8DA8];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isDefaultRoute") & 1) != 0)
          {
            objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E3D036D0, v11);
          }
          else
          {
            v14 = (void *)objc_msgSend(v13, "copyLegacyDictionary");
            objc_msgSend(v6, "addObject:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v9);
    }

  }
  -[NEIPv4Settings excludedRoutes](self, "excludedRoutes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[NEIPv4Settings excludedRoutes](self, "excludedRoutes", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          if ((objc_msgSend(v22, "isDefaultRoute") & 1) == 0)
          {
            v23 = (void *)objc_msgSend(v22, "copyLegacyDictionary");
            objc_msgSend(v16, "addObject:", v23);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v19);
    }

  }
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  void *v3;
  id v5;
  NEIPv4Settings *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSArray *addresses;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  NSArray *subnetMasks;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  NSString *router;
  uint64_t v31;
  void *v32;
  int v33;
  uint64_t *v34;
  void *v35;
  int v36;
  id v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  id v50;
  uint64_t v51;
  void *v52;
  int v53;
  void *v54;
  NSArray *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  id v61;
  NSArray *excludedRoutes;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[NEIPv4Settings initWithConfigMethod:](self, "initWithConfigMethod:", 2);
  if (!v6)
    goto LABEL_54;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8CD8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v7))
  {
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CE9110]) & 1) != 0)
    {
      v8 = 2;
LABEL_9:
      v6->_configMethod = v8;
      goto LABEL_10;
    }
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CE90E8]) & 1) != 0)
    {
      v8 = 1;
      goto LABEL_9;
    }
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CE9108]) & 1) != 0)
    {
      v8 = 3;
      goto LABEL_9;
    }
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Off")) & 1) != 0)
    {

      v6 = 0;
      goto LABEL_54;
    }
  }
LABEL_10:
  v9 = *MEMORY[0x1E0CE8CC8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8CC8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = isa_nsarray(v10);

  if (v11)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = isa_nsstring(v13);

      if (v14)
      {
        v15 = objc_msgSend(v12, "copy");
        addresses = v6->_addresses;
        v6->_addresses = (NSArray *)v15;

      }
    }

  }
  v17 = *MEMORY[0x1E0CE8D18];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8D18]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = isa_nsarray(v18);

  if (v19)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = isa_nsstring(v21);

      if (v22)
      {
        v23 = objc_msgSend(v20, "copy");
        subnetMasks = v6->_subnetMasks;
        v6->_subnetMasks = (NSArray *)v23;

      }
    }

  }
  v25 = *MEMORY[0x1E0CE8D10];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8D10]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = isa_nsstring(v26);

  if (v27)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    router = v6->_router;
    v6->_router = (NSString *)v29;

  }
  v31 = *MEMORY[0x1E0CE8DA8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8DA8]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = isa_nsnumber(v32);
  v34 = (uint64_t *)MEMORY[0x1E0CE8CE8];
  if (!v33
    || (objc_msgSend(v5, "objectForKeyedSubscript:", v31),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        !objc_msgSend(v3, "BOOLValue")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = isa_nsarray(v35);

    if (v33)
    {

      if ((v36 & 1) != 0)
        goto LABEL_29;
    }
    else
    {

      if (v36)
        goto LABEL_29;
    }
    v37 = 0;
    goto LABEL_30;
  }

LABEL_29:
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
LABEL_30:
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = isa_nsnumber(v38);

  if (v39)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v31);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_overridePrimary = objc_msgSend(v40, "BOOLValue");

    if (v6->_overridePrimary)
    {
      +[NEIPv4Route defaultRoute](NEIPv4Route, "defaultRoute");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObject:", v41);

    }
  }
  v42 = *v34;
  objc_msgSend(v5, "objectForKeyedSubscript:", *v34);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = isa_nsarray(v43);

  if (v44)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v42);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v70 != v48)
            objc_enumerationMutation(v45);
          v50 = -[NEIPv4Route initFromLegacyDictionary:]([NEIPv4Route alloc], "initFromLegacyDictionary:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i));
          objc_msgSend(v37, "addObject:", v50);

        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      }
      while (v47);
    }

  }
  if (v37)
    objc_storeStrong((id *)&v6->_includedRoutes, v37);
  v51 = *MEMORY[0x1E0CE8CE0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8CE0]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = isa_nsarray(v52);

  if (v53)
  {
    v64 = v7;
    objc_msgSend(v5, "objectForKeyedSubscript:", v51);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v56 = v54;
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v58; ++j)
        {
          if (*(_QWORD *)v66 != v59)
            objc_enumerationMutation(v56);
          v61 = -[NEIPv4Route initFromLegacyDictionary:]([NEIPv4Route alloc], "initFromLegacyDictionary:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j));
          -[NSArray addObject:](v55, "addObject:", v61);

        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      }
      while (v58);
    }

    excludedRoutes = v6->_excludedRoutes;
    v6->_excludedRoutes = v55;

    v7 = v64;
  }

LABEL_54:
  return v6;
}

- (BOOL)hasDefaultRoute
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_includedRoutes;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isDefaultRoute", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)addresses
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)subnetMasks
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)router
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRouter:(NSString *)router
{
  objc_setProperty_atomic_copy(self, a2, router, 32);
}

- (NSArray)includedRoutes
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIncludedRoutes:(NSArray *)includedRoutes
{
  objc_setProperty_atomic_copy(self, a2, includedRoutes, 40);
}

- (NSArray)excludedRoutes
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExcludedRoutes:(NSArray *)excludedRoutes
{
  objc_setProperty_atomic_copy(self, a2, excludedRoutes, 48);
}

- (BOOL)overridePrimary
{
  return self->_overridePrimary;
}

- (void)setOverridePrimary:(BOOL)a3
{
  self->_overridePrimary = a3;
}

- (int64_t)configMethod
{
  return self->_configMethod;
}

- (void)setConfigMethod:(int64_t)a3
{
  self->_configMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedRoutes, 0);
  objc_storeStrong((id *)&self->_includedRoutes, 0);
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_subnetMasks, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NEIPv4Settings)settingsWithAutomaticAddressing
{
  return -[NEIPv4Settings initWithConfigMethod:]([NEIPv4Settings alloc], "initWithConfigMethod:", 1);
}

@end
