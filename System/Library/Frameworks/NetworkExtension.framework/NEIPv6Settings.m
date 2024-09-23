@implementation NEIPv6Settings

- (NEIPv6Settings)init
{
  NEIPv6Settings *v2;
  NEIPv6Settings *v3;
  NSArray *v4;
  NSArray *addresses;
  NSArray *v6;
  NSArray *networkPrefixLengths;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NEIPv6Settings;
  v2 = -[NEIPv6Settings init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_configMethod = 2;
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    addresses = v3->_addresses;
    v3->_addresses = v4;

    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    networkPrefixLengths = v3->_networkPrefixLengths;
    v3->_networkPrefixLengths = v6;

  }
  return v3;
}

- (NEIPv6Settings)initWithAddresses:(NSArray *)addresses networkPrefixLengths:(NSArray *)networkPrefixLengths
{
  NSArray *v6;
  NSArray *v7;
  NEIPv6Settings *v8;
  NEIPv6Settings *v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  NSArray *v13;
  objc_super v15;

  v6 = addresses;
  v7 = networkPrefixLengths;
  v15.receiver = self;
  v15.super_class = (Class)NEIPv6Settings;
  v8 = -[NEIPv6Settings init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_configMethod = 2;
    v10 = -[NSArray copy](v6, "copy");
    v11 = v9->_addresses;
    v9->_addresses = (NSArray *)v10;

    v12 = -[NSArray copy](v7, "copy");
    v13 = v9->_networkPrefixLengths;
    v9->_networkPrefixLengths = (NSArray *)v12;

  }
  return v9;
}

- (NEIPv6Settings)initWithConfigMethod:(int64_t)a3
{
  NEIPv6Settings *result;

  result = -[NEIPv6Settings init](self, "init");
  if (result)
    result->_configMethod = a3;
  return result;
}

- (NEIPv6Settings)initWithCoder:(id)a3
{
  id v4;
  NEIPv6Settings *v5;
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
  NSArray *networkPrefixLengths;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSArray *v24;
  NSObject *v25;
  uint64_t v26;
  NSString *router;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *includedRoutes;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSArray *excludedRoutes;
  NSArray *v39;
  NSArray *v40;
  objc_super v41;
  uint8_t buf[4];
  NSArray *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NEIPv6Settings;
  v5 = -[NEIPv6Settings init](&v41, sel_init);
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
          v39 = v5->_addresses;
          *(_DWORD *)buf = 138412290;
          v43 = v39;
          _os_log_debug_impl(&dword_19BD16000, v14, OS_LOG_TYPE_DEBUG, "initwithcoder single router IPv6address %@", buf, 0xCu);
        }

      }
    }
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("PrefixLengthArray"));
    v18 = objc_claimAutoreleasedReturnValue();
    networkPrefixLengths = v5->_networkPrefixLengths;
    v5->_networkPrefixLengths = (NSArray *)v18;

    if (!v5->_networkPrefixLengths)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrefixLength"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if ((_DWORD)v20)
      {
        v21 = objc_alloc(MEMORY[0x1E0C99D20]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "initWithObjects:", v22, 0);
        v24 = v5->_networkPrefixLengths;
        v5->_networkPrefixLengths = (NSArray *)v23;

        ne_log_obj();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v40 = v5->_networkPrefixLengths;
          *(_DWORD *)buf = 138412290;
          v43 = v40;
          _os_log_debug_impl(&dword_19BD16000, v25, OS_LOG_TYPE_DEBUG, "initwithcoder single prefixLength %@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Router"));
    v26 = objc_claimAutoreleasedReturnValue();
    router = v5->_router;
    v5->_router = (NSString *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("IncludeRoutes"));
    v31 = objc_claimAutoreleasedReturnValue();
    includedRoutes = v5->_includedRoutes;
    v5->_includedRoutes = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("ExcludeRoutes"));
    v36 = objc_claimAutoreleasedReturnValue();
    excludedRoutes = v5->_excludedRoutes;
    v5->_excludedRoutes = (NSArray *)v36;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEIPv6Settings configMethod](self, "configMethod"), CFSTR("ConfigMethod"));
  -[NEIPv6Settings addresses](self, "addresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AddressArray"));

  -[NEIPv6Settings router](self, "router");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Router"));

  -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("PrefixLengthArray"));

  -[NEIPv6Settings includedRoutes](self, "includedRoutes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("IncludeRoutes"));

  -[NEIPv6Settings excludedRoutes](self, "excludedRoutes");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ExcludeRoutes"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEIPv6Settings *v4;
  void *v5;
  void *v6;
  NEIPv6Settings *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[NEIPv6Settings allocWithZone:](NEIPv6Settings, "allocWithZone:", a3);
  -[NEIPv6Settings addresses](self, "addresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NEIPv6Settings initWithAddresses:networkPrefixLengths:](v4, "initWithAddresses:networkPrefixLengths:", v5, v6);

  -[NEIPv6Settings setConfigMethod:](v7, "setConfigMethod:", -[NEIPv6Settings configMethod](self, "configMethod"));
  -[NEIPv6Settings router](self, "router");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv6Settings setRouter:](v7, "setRouter:", v8);

  -[NEIPv6Settings includedRoutes](self, "includedRoutes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv6Settings setIncludedRoutes:](v7, "setIncludedRoutes:", v9);

  -[NEIPv6Settings excludedRoutes](self, "excludedRoutes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv6Settings setExcludedRoutes:](v7, "setExcludedRoutes:", v10);

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
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
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
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (-[NEIPv6Settings configMethod](self, "configMethod", a3) != 2)
    return 1;
  v50[0] = 0;
  v50[1] = 0;
  -[NEIPv6Settings addresses](self, "addresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Missing IPv6 address";
      goto LABEL_43;
    }
LABEL_7:

    goto LABEL_8;
  }
  -[NEIPv6Settings addresses](self, "addresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = inet_pton(30, (const char *)objc_msgSend(v7, "UTF8String"), v50);

  if (!v8)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid IPv6 address";
LABEL_43:
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
LABEL_8:
  -[NEIPv6Settings router](self, "router");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[NEIPv6Settings router](self, "router");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = inet_pton(30, (const char *)objc_msgSend(v13, "UTF8String"), v50);

    if (!v14)
    {
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "Invalid IPv6 router", buf, 2u);
      }

    }
  }
  -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  -[NEIPv6Settings addresses](self, "addresses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v17 != v19)
  {
    ne_log_obj();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[NEIPv6Settings addresses](self, "addresses");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count");
      -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");
      *(_DWORD *)buf = 134218240;
      v54 = v39;
      v55 = 2048;
      v56 = v41;
      _os_log_error_impl(&dword_19BD16000, v20, OS_LOG_TYPE_ERROR, "Missing networkPrefixLengths (address count = %lu, prefix length count = %lu)", buf, 0x16u);

    }
  }
  -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject count](v21, "count"))
    goto LABEL_21;
  -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndex:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "intValue");

  if (v24 >= 129)
  {
    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v21, OS_LOG_TYPE_ERROR, "Invalid IPv6 prefix length", buf, 2u);
    }
LABEL_21:

  }
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[NEIPv6Settings includedRoutes](self, "includedRoutes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v47 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "checkValidityAndCollectErrors:", v25);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v28);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[NEIPv6Settings excludedRoutes](self, "excludedRoutes", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "checkValidityAndCollectErrors:", v25);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
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
      v54 = (uint64_t)v25;
      _os_log_error_impl(&dword_19BD16000, v36, OS_LOG_TYPE_ERROR, "IPv6 routes are invalid: %@", buf, 0xCu);
    }

  }
  return 1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = -[NEIPv6Settings configMethod](self, "configMethod") - 1;
  if (v8 <= 2)
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", off_1E3CC2398[v8], CFSTR("configMethod"), v5, a4 & 0xFFFFFFFFFFFFFFF7);
  -[NEIPv6Settings addresses](self, "addresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a4 | 9;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("addresses"), v5, a4 | 9);

  -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a4 | 8;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("networkPrefixLengths"), v5, v12);

  -[NEIPv6Settings router](self, "router");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("router"), v5, v10);

  -[NEIPv6Settings includedRoutes](self, "includedRoutes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("includedRoutes"), v5, v12);

  -[NEIPv6Settings excludedRoutes](self, "excludedRoutes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("excludedRoutes"), v5, v12);

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
  if (-[NEIPv6Settings configMethod](self, "configMethod") == 3)
  {
    v4 = (_QWORD *)MEMORY[0x1E0CE9120];
LABEL_5:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *v4, *MEMORY[0x1E0CE8D30]);
    goto LABEL_6;
  }
  if (-[NEIPv6Settings configMethod](self, "configMethod") == 1)
  {
    v4 = (_QWORD *)MEMORY[0x1E0CE9118];
    goto LABEL_5;
  }
  if (-[NEIPv6Settings configMethod](self, "configMethod") == 2)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CE9128], *MEMORY[0x1E0CE8D30]);
    -[NEIPv6Settings addresses](self, "addresses");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      -[NEIPv6Settings addresses](self, "addresses");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CE8D28]);

    }
    -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v29)
    {
      -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CE8D50]);

    }
    -[NEIPv6Settings router](self, "router");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[NEIPv6Settings router](self, "router");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0CE8D78]);

    }
  }
LABEL_6:
  -[NEIPv6Settings includedRoutes](self, "includedRoutes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[NEIPv6Settings includedRoutes](self, "includedRoutes");
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
            objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E3D03700, v11);
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
  -[NEIPv6Settings excludedRoutes](self, "excludedRoutes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[NEIPv6Settings excludedRoutes](self, "excludedRoutes", 0);
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
  NEIPv6Settings *v6;
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
  NSArray *networkPrefixLengths;
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
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  int v52;
  void *v53;
  NSArray *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  NSArray *excludedRoutes;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[NEIPv6Settings initWithConfigMethod:](self, "initWithConfigMethod:", 1);
  if (!v6)
    goto LABEL_55;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8D30]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v7))
  {
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CE9120]) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CE9128]) & 1) != 0)
    {
      v8 = 2;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CE9118]))
        goto LABEL_10;
      v8 = 1;
    }
    v6->_configMethod = v8;
  }
LABEL_10:
  v9 = *MEMORY[0x1E0CE8D28];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8D28]);
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
  v17 = *MEMORY[0x1E0CE8D50];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8D50]);
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
      v22 = isa_nsnumber(v21);

      if (v22)
      {
        v23 = objc_msgSend(v20, "copy");
        networkPrefixLengths = v6->_networkPrefixLengths;
        v6->_networkPrefixLengths = (NSArray *)v23;

      }
    }

  }
  v25 = *MEMORY[0x1E0CE8D78];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8D78]);
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
  v34 = (uint64_t *)MEMORY[0x1E0CE8D48];
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
  if (!isa_nsnumber(v38))
  {
LABEL_33:

    goto LABEL_34;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "BOOLValue");

  if (v40)
  {
    +[NEIPv6Route defaultRoute](NEIPv6Route, "defaultRoute");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v38);
    goto LABEL_33;
  }
LABEL_34:
  v41 = *v34;
  objc_msgSend(v5, "objectForKeyedSubscript:", *v34);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = isa_nsarray(v42);

  if (v43)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v69;
      do
      {
        v48 = 0;
        do
        {
          if (*(_QWORD *)v69 != v47)
            objc_enumerationMutation(v44);
          v49 = -[NEIPv6Route initFromLegacyDictionary:]([NEIPv6Route alloc], "initFromLegacyDictionary:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v48));
          objc_msgSend(v37, "addObject:", v49);

          ++v48;
        }
        while (v46 != v48);
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      }
      while (v46);
    }

  }
  if (v37)
    objc_storeStrong((id *)&v6->_includedRoutes, v37);
  v50 = *MEMORY[0x1E0CE8D38];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8D38]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = isa_nsarray(v51);

  if (v52)
  {
    v63 = v7;
    objc_msgSend(v5, "objectForKeyedSubscript:", v50);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v55 = v53;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v65;
      do
      {
        v59 = 0;
        do
        {
          if (*(_QWORD *)v65 != v58)
            objc_enumerationMutation(v55);
          v60 = -[NEIPv6Route initFromLegacyDictionary:]([NEIPv6Route alloc], "initFromLegacyDictionary:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v59));
          -[NSArray addObject:](v54, "addObject:", v60);

          ++v59;
        }
        while (v57 != v59);
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      }
      while (v57);
    }

    excludedRoutes = v6->_excludedRoutes;
    v6->_excludedRoutes = v54;

    v7 = v63;
  }

LABEL_55:
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
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)networkPrefixLengths
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)includedRoutes
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIncludedRoutes:(NSArray *)includedRoutes
{
  objc_setProperty_atomic_copy(self, a2, includedRoutes, 24);
}

- (NSArray)excludedRoutes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExcludedRoutes:(NSArray *)excludedRoutes
{
  objc_setProperty_atomic_copy(self, a2, excludedRoutes, 32);
}

- (int64_t)configMethod
{
  return self->_configMethod;
}

- (void)setConfigMethod:(int64_t)a3
{
  self->_configMethod = a3;
}

- (NSString)router
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRouter:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_excludedRoutes, 0);
  objc_storeStrong((id *)&self->_includedRoutes, 0);
  objc_storeStrong((id *)&self->_networkPrefixLengths, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NEIPv6Settings)settingsWithAutomaticAddressing
{
  return -[NEIPv6Settings initWithConfigMethod:]([NEIPv6Settings alloc], "initWithConfigMethod:", 1);
}

+ (NEIPv6Settings)settingsWithLinkLocalAddressing
{
  return -[NEIPv6Settings initWithConfigMethod:]([NEIPv6Settings alloc], "initWithConfigMethod:", 3);
}

@end
