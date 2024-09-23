@implementation NSPPrivacyProxyConfiguration

- (void)setEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDisableUntil:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_disableUntil = a3;
}

- (void)setHasDisableUntil:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisableUntil
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearPolicyTierMaps
{
  -[NSMutableArray removeAllObjects](self->_policyTierMaps, "removeAllObjects");
}

- (void)addPolicyTierMap:(id)a3
{
  id v4;
  NSMutableArray *policyTierMaps;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  policyTierMaps = self->_policyTierMaps;
  v8 = v4;
  if (!policyTierMaps)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_policyTierMaps;
    self->_policyTierMaps = v6;

    v4 = v8;
    policyTierMaps = self->_policyTierMaps;
  }
  -[NSMutableArray addObject:](policyTierMaps, "addObject:", v4);

}

- (unint64_t)policyTierMapsCount
{
  return -[NSMutableArray count](self->_policyTierMaps, "count");
}

- (id)policyTierMapAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_policyTierMaps, "objectAtIndex:", a3);
}

+ (Class)policyTierMapType
{
  return (Class)objc_opt_class();
}

- (void)clearProxies
{
  -[NSMutableArray removeAllObjects](self->_proxies, "removeAllObjects");
}

- (void)addProxies:(id)a3
{
  id v4;
  NSMutableArray *proxies;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  proxies = self->_proxies;
  v8 = v4;
  if (!proxies)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_proxies;
    self->_proxies = v6;

    v4 = v8;
    proxies = self->_proxies;
  }
  -[NSMutableArray addObject:](proxies, "addObject:", v4);

}

- (unint64_t)proxiesCount
{
  return -[NSMutableArray count](self->_proxies, "count");
}

- (id)proxiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_proxies, "objectAtIndex:", a3);
}

+ (Class)proxiesType
{
  return (Class)objc_opt_class();
}

- (void)clearPathWeights
{
  -[NSMutableArray removeAllObjects](self->_pathWeights, "removeAllObjects");
}

- (void)addPathWeights:(id)a3
{
  id v4;
  NSMutableArray *pathWeights;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  pathWeights = self->_pathWeights;
  v8 = v4;
  if (!pathWeights)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_pathWeights;
    self->_pathWeights = v6;

    v4 = v8;
    pathWeights = self->_pathWeights;
  }
  -[NSMutableArray addObject:](pathWeights, "addObject:", v4);

}

- (unint64_t)pathWeightsCount
{
  return -[NSMutableArray count](self->_pathWeights, "count");
}

- (id)pathWeightsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_pathWeights, "objectAtIndex:", a3);
}

+ (Class)pathWeightsType
{
  return (Class)objc_opt_class();
}

- (void)clearResolvers
{
  -[NSMutableArray removeAllObjects](self->_resolvers, "removeAllObjects");
}

- (void)addResolvers:(id)a3
{
  id v4;
  NSMutableArray *resolvers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  resolvers = self->_resolvers;
  v8 = v4;
  if (!resolvers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_resolvers;
    self->_resolvers = v6;

    v4 = v8;
    resolvers = self->_resolvers;
  }
  -[NSMutableArray addObject:](resolvers, "addObject:", v4);

}

- (unint64_t)resolversCount
{
  return -[NSMutableArray count](self->_resolvers, "count");
}

- (id)resolversAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_resolvers, "objectAtIndex:", a3);
}

+ (Class)resolversType
{
  return (Class)objc_opt_class();
}

- (void)clearFallbackPathWeights
{
  -[NSMutableArray removeAllObjects](self->_fallbackPathWeights, "removeAllObjects");
}

- (void)addFallbackPathWeights:(id)a3
{
  id v4;
  NSMutableArray *fallbackPathWeights;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fallbackPathWeights = self->_fallbackPathWeights;
  v8 = v4;
  if (!fallbackPathWeights)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fallbackPathWeights;
    self->_fallbackPathWeights = v6;

    v4 = v8;
    fallbackPathWeights = self->_fallbackPathWeights;
  }
  -[NSMutableArray addObject:](fallbackPathWeights, "addObject:", v4);

}

- (unint64_t)fallbackPathWeightsCount
{
  return -[NSMutableArray count](self->_fallbackPathWeights, "count");
}

- (id)fallbackPathWeightsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_fallbackPathWeights, "objectAtIndex:", a3);
}

+ (Class)fallbackPathWeightsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRegionId
{
  return self->_regionId != 0;
}

- (BOOL)hasBootstrapResolver
{
  return self->_bootstrapResolver != 0;
}

- (BOOL)hasDnsProbe
{
  return self->_dnsProbe != 0;
}

- (void)clearObliviousConfigs
{
  -[NSMutableArray removeAllObjects](self->_obliviousConfigs, "removeAllObjects");
}

- (void)addObliviousConfigs:(id)a3
{
  id v4;
  NSMutableArray *obliviousConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  obliviousConfigs = self->_obliviousConfigs;
  v8 = v4;
  if (!obliviousConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_obliviousConfigs;
    self->_obliviousConfigs = v6;

    v4 = v8;
    obliviousConfigs = self->_obliviousConfigs;
  }
  -[NSMutableArray addObject:](obliviousConfigs, "addObject:", v4);

}

- (unint64_t)obliviousConfigsCount
{
  return -[NSMutableArray count](self->_obliviousConfigs, "count");
}

- (id)obliviousConfigsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_obliviousConfigs, "objectAtIndex:", a3);
}

+ (Class)obliviousConfigsType
{
  return (Class)objc_opt_class();
}

- (void)setPreferredPathEnabledPercentage:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_preferredPathEnabledPercentage = a3;
}

- (void)setHasPreferredPathEnabledPercentage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPreferredPathEnabledPercentage
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearProxiedContentMaps
{
  -[NSMutableArray removeAllObjects](self->_proxiedContentMaps, "removeAllObjects");
}

- (void)addProxiedContentMaps:(id)a3
{
  id v4;
  NSMutableArray *proxiedContentMaps;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  proxiedContentMaps = self->_proxiedContentMaps;
  v8 = v4;
  if (!proxiedContentMaps)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_proxiedContentMaps;
    self->_proxiedContentMaps = v6;

    v4 = v8;
    proxiedContentMaps = self->_proxiedContentMaps;
  }
  -[NSMutableArray addObject:](proxiedContentMaps, "addObject:", v4);

}

- (unint64_t)proxiedContentMapsCount
{
  return -[NSMutableArray count](self->_proxiedContentMaps, "count");
}

- (id)proxiedContentMapsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_proxiedContentMaps, "objectAtIndex:", a3);
}

+ (Class)proxiedContentMapsType
{
  return (Class)objc_opt_class();
}

- (void)clearTrustedNetworkDiscoveredProxies
{
  -[NSMutableArray removeAllObjects](self->_trustedNetworkDiscoveredProxies, "removeAllObjects");
}

- (void)addTrustedNetworkDiscoveredProxies:(id)a3
{
  id v4;
  NSMutableArray *trustedNetworkDiscoveredProxies;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  trustedNetworkDiscoveredProxies = self->_trustedNetworkDiscoveredProxies;
  v8 = v4;
  if (!trustedNetworkDiscoveredProxies)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_trustedNetworkDiscoveredProxies;
    self->_trustedNetworkDiscoveredProxies = v6;

    v4 = v8;
    trustedNetworkDiscoveredProxies = self->_trustedNetworkDiscoveredProxies;
  }
  -[NSMutableArray addObject:](trustedNetworkDiscoveredProxies, "addObject:", v4);

}

- (unint64_t)trustedNetworkDiscoveredProxiesCount
{
  return -[NSMutableArray count](self->_trustedNetworkDiscoveredProxies, "count");
}

- (id)trustedNetworkDiscoveredProxiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_trustedNetworkDiscoveredProxies, "objectAtIndex:", a3);
}

+ (Class)trustedNetworkDiscoveredProxiesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyConfiguration;
  -[NSPPrivacyProxyConfiguration description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  char has;
  void *v6;
  void *v7;
  NSPPrivacyProxyAuthenticationInfo *authInfo;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  void *v45;
  NSString *regionId;
  NSPPrivacyProxyResolverInfo *bootstrapResolver;
  void *v48;
  NSString *dnsProbe;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t ii;
  void *v56;
  void *v57;
  void *v58;
  NSMutableArray *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t jj;
  void *v64;
  NSMutableArray *trustedNetworkDiscoveredProxies;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("enabled"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_disableUntil);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("disableUntil"));

  }
  authInfo = self->_authInfo;
  if (authInfo)
  {
    -[NSPPrivacyProxyAuthenticationInfo dictionaryRepresentation](authInfo, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("authInfo"));

  }
  if (-[NSMutableArray count](self->_policyTierMaps, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_policyTierMaps, "count"));
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v11 = self->_policyTierMaps;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v92 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("policyTierMap"));
  }
  if (-[NSMutableArray count](self->_proxies, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_proxies, "count"));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v18 = self->_proxies;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v88 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * j), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("proxies"));
  }
  if (-[NSMutableArray count](self->_pathWeights, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_pathWeights, "count"));
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v25 = self->_pathWeights;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v84;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v84 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * k), "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
      }
      while (v27);
    }

    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("pathWeights"));
  }
  if (-[NSMutableArray count](self->_resolvers, "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_resolvers, "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v32 = self->_resolvers;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v80;
      do
      {
        for (m = 0; m != v34; ++m)
        {
          if (*(_QWORD *)v80 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * m), "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
      }
      while (v34);
    }

    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("resolvers"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxTokenNum);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("maxTokenNum"));

  if (-[NSMutableArray count](self->_fallbackPathWeights, "count"))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_fallbackPathWeights, "count"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v40 = self->_fallbackPathWeights;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v76;
      do
      {
        for (n = 0; n != v42; ++n)
        {
          if (*(_QWORD *)v76 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * n), "dictionaryRepresentation");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v45);

        }
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
      }
      while (v42);
    }

    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("fallbackPathWeights"));
  }
  regionId = self->_regionId;
  if (regionId)
    objc_msgSend(v3, "setObject:forKey:", regionId, CFSTR("regionId"));
  bootstrapResolver = self->_bootstrapResolver;
  if (bootstrapResolver)
  {
    -[NSPPrivacyProxyResolverInfo dictionaryRepresentation](bootstrapResolver, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("bootstrapResolver"));

  }
  dnsProbe = self->_dnsProbe;
  if (dnsProbe)
    objc_msgSend(v3, "setObject:forKey:", dnsProbe, CFSTR("dnsProbe"));
  if (-[NSMutableArray count](self->_obliviousConfigs, "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_obliviousConfigs, "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v51 = self->_obliviousConfigs;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v71, v96, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v72;
      do
      {
        for (ii = 0; ii != v53; ++ii)
        {
          if (*(_QWORD *)v72 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * ii), "dictionaryRepresentation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v56);

        }
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v71, v96, 16);
      }
      while (v53);
    }

    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("obliviousConfigs"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_preferredPathEnabledPercentage);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("preferredPathEnabledPercentage"));

  }
  if (-[NSMutableArray count](self->_proxiedContentMaps, "count"))
  {
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_proxiedContentMaps, "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v59 = self->_proxiedContentMaps;
    v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v67, v95, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v68;
      do
      {
        for (jj = 0; jj != v61; ++jj)
        {
          if (*(_QWORD *)v68 != v62)
            objc_enumerationMutation(v59);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * jj), "dictionaryRepresentation", (_QWORD)v67);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObject:", v64);

        }
        v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v67, v95, 16);
      }
      while (v61);
    }

    objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("proxiedContentMaps"));
  }
  trustedNetworkDiscoveredProxies = self->_trustedNetworkDiscoveredProxies;
  if (trustedNetworkDiscoveredProxies)
    objc_msgSend(v3, "setObject:forKey:", trustedNetworkDiscoveredProxies, CFSTR("trustedNetworkDiscoveredProxies"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t jj;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t kk;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (!self->_authInfo)
    __assert_rtn("-[NSPPrivacyProxyConfiguration writeTo:]", "NSPPrivacyProxyConfiguration.m", 678, "self->_authInfo != nil");
  PBDataWriterWriteSubmessage();
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v6 = self->_policyTierMaps;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v75 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
    }
    while (v8);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v11 = self->_proxies;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v71 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
    }
    while (v13);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v16 = self->_pathWeights;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v67 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
    }
    while (v18);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v21 = self->_resolvers;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v63;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v63 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
    }
    while (v23);
  }

  PBDataWriterWriteUint32Field();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v26 = self->_fallbackPathWeights;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v59;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v59 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
    }
    while (v28);
  }

  if (self->_regionId)
    PBDataWriterWriteStringField();
  if (self->_bootstrapResolver)
    PBDataWriterWriteSubmessage();
  if (self->_dnsProbe)
    PBDataWriterWriteStringField();
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v31 = self->_obliviousConfigs;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v54, v80, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v55;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v55 != v34)
          objc_enumerationMutation(v31);
        PBDataWriterWriteSubmessage();
      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v54, v80, 16);
    }
    while (v33);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v36 = self->_proxiedContentMaps;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v50, v79, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v51;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v51 != v39)
          objc_enumerationMutation(v36);
        PBDataWriterWriteSubmessage();
      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v50, v79, 16);
    }
    while (v38);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v41 = self->_trustedNetworkDiscoveredProxies;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v46, v78, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v47;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(_QWORD *)v47 != v44)
          objc_enumerationMutation(v41);
        PBDataWriterWriteStringField();
      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v46, v78, 16);
    }
    while (v43);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t m;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t n;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t ii;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t jj;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t kk;
  void *v37;
  id v38;

  v4 = a3;
  v4[32] = self->_version;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 132) = self->_enabled;
    *((_BYTE *)v4 + 136) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_disableUntil;
    *((_BYTE *)v4 + 136) |= 1u;
  }
  v38 = v4;
  objc_msgSend(v4, "setAuthInfo:", self->_authInfo);
  if (-[NSPPrivacyProxyConfiguration policyTierMapsCount](self, "policyTierMapsCount"))
  {
    objc_msgSend(v38, "clearPolicyTierMaps");
    v6 = -[NSPPrivacyProxyConfiguration policyTierMapsCount](self, "policyTierMapsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[NSPPrivacyProxyConfiguration policyTierMapAtIndex:](self, "policyTierMapAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addPolicyTierMap:", v9);

      }
    }
  }
  if (-[NSPPrivacyProxyConfiguration proxiesCount](self, "proxiesCount"))
  {
    objc_msgSend(v38, "clearProxies");
    v10 = -[NSPPrivacyProxyConfiguration proxiesCount](self, "proxiesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[NSPPrivacyProxyConfiguration proxiesAtIndex:](self, "proxiesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addProxies:", v13);

      }
    }
  }
  if (-[NSPPrivacyProxyConfiguration pathWeightsCount](self, "pathWeightsCount"))
  {
    objc_msgSend(v38, "clearPathWeights");
    v14 = -[NSPPrivacyProxyConfiguration pathWeightsCount](self, "pathWeightsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[NSPPrivacyProxyConfiguration pathWeightsAtIndex:](self, "pathWeightsAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addPathWeights:", v17);

      }
    }
  }
  if (-[NSPPrivacyProxyConfiguration resolversCount](self, "resolversCount"))
  {
    objc_msgSend(v38, "clearResolvers");
    v18 = -[NSPPrivacyProxyConfiguration resolversCount](self, "resolversCount");
    if (v18)
    {
      v19 = v18;
      for (m = 0; m != v19; ++m)
      {
        -[NSPPrivacyProxyConfiguration resolversAtIndex:](self, "resolversAtIndex:", m);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addResolvers:", v21);

      }
    }
  }
  *((_DWORD *)v38 + 12) = self->_maxTokenNum;
  if (-[NSPPrivacyProxyConfiguration fallbackPathWeightsCount](self, "fallbackPathWeightsCount"))
  {
    objc_msgSend(v38, "clearFallbackPathWeights");
    v22 = -[NSPPrivacyProxyConfiguration fallbackPathWeightsCount](self, "fallbackPathWeightsCount");
    if (v22)
    {
      v23 = v22;
      for (n = 0; n != v23; ++n)
      {
        -[NSPPrivacyProxyConfiguration fallbackPathWeightsAtIndex:](self, "fallbackPathWeightsAtIndex:", n);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addFallbackPathWeights:", v25);

      }
    }
  }
  if (self->_regionId)
    objc_msgSend(v38, "setRegionId:");
  if (self->_bootstrapResolver)
    objc_msgSend(v38, "setBootstrapResolver:");
  if (self->_dnsProbe)
    objc_msgSend(v38, "setDnsProbe:");
  if (-[NSPPrivacyProxyConfiguration obliviousConfigsCount](self, "obliviousConfigsCount"))
  {
    objc_msgSend(v38, "clearObliviousConfigs");
    v26 = -[NSPPrivacyProxyConfiguration obliviousConfigsCount](self, "obliviousConfigsCount");
    if (v26)
    {
      v27 = v26;
      for (ii = 0; ii != v27; ++ii)
      {
        -[NSPPrivacyProxyConfiguration obliviousConfigsAtIndex:](self, "obliviousConfigsAtIndex:", ii);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObliviousConfigs:", v29);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v38 + 20) = self->_preferredPathEnabledPercentage;
    *((_BYTE *)v38 + 136) |= 2u;
  }
  if (-[NSPPrivacyProxyConfiguration proxiedContentMapsCount](self, "proxiedContentMapsCount"))
  {
    objc_msgSend(v38, "clearProxiedContentMaps");
    v30 = -[NSPPrivacyProxyConfiguration proxiedContentMapsCount](self, "proxiedContentMapsCount");
    if (v30)
    {
      v31 = v30;
      for (jj = 0; jj != v31; ++jj)
      {
        -[NSPPrivacyProxyConfiguration proxiedContentMapsAtIndex:](self, "proxiedContentMapsAtIndex:", jj);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addProxiedContentMaps:", v33);

      }
    }
  }
  if (-[NSPPrivacyProxyConfiguration trustedNetworkDiscoveredProxiesCount](self, "trustedNetworkDiscoveredProxiesCount"))
  {
    objc_msgSend(v38, "clearTrustedNetworkDiscoveredProxies");
    v34 = -[NSPPrivacyProxyConfiguration trustedNetworkDiscoveredProxiesCount](self, "trustedNetworkDiscoveredProxiesCount");
    if (v34)
    {
      v35 = v34;
      for (kk = 0; kk != v35; ++kk)
      {
        -[NSPPrivacyProxyConfiguration trustedNetworkDiscoveredProxiesAtIndex:](self, "trustedNetworkDiscoveredProxiesAtIndex:", kk);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addTrustedNetworkDiscoveredProxies:", v37);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t ii;
  void *v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t jj;
  void *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t kk;
  void *v63;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  *(_DWORD *)(v5 + 128) = self->_version;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 132) = self->_enabled;
    *(_BYTE *)(v5 + 136) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_disableUntil;
    *(_BYTE *)(v5 + 136) |= 1u;
  }
  v8 = -[NSPPrivacyProxyAuthenticationInfo copyWithZone:](self->_authInfo, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v10 = self->_policyTierMaps;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v94 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPolicyTierMap:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
    }
    while (v12);
  }

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v16 = self->_proxies;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v90 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addProxies:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
    }
    while (v18);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v22 = self->_pathWeights;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v86;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v86 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPathWeights:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
    }
    while (v24);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v28 = self->_resolvers;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v82;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v82 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addResolvers:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
    }
    while (v30);
  }

  *(_DWORD *)(v6 + 48) = self->_maxTokenNum;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v34 = self->_fallbackPathWeights;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v77, v100, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v78;
    do
    {
      for (n = 0; n != v36; ++n)
      {
        if (*(_QWORD *)v78 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFallbackPathWeights:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v77, v100, 16);
    }
    while (v36);
  }

  v40 = -[NSString copyWithZone:](self->_regionId, "copyWithZone:", a3);
  v41 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v40;

  v42 = -[NSPPrivacyProxyResolverInfo copyWithZone:](self->_bootstrapResolver, "copyWithZone:", a3);
  v43 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v42;

  v44 = -[NSString copyWithZone:](self->_dnsProbe, "copyWithZone:", a3);
  v45 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v44;

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v46 = self->_obliviousConfigs;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v73, v99, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v74;
    do
    {
      for (ii = 0; ii != v48; ++ii)
      {
        if (*(_QWORD *)v74 != v49)
          objc_enumerationMutation(v46);
        v51 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addObliviousConfigs:", v51);

      }
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v73, v99, 16);
    }
    while (v48);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_preferredPathEnabledPercentage;
    *(_BYTE *)(v6 + 136) |= 2u;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v52 = self->_proxiedContentMaps;
  v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v69, v98, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v70;
    do
    {
      for (jj = 0; jj != v54; ++jj)
      {
        if (*(_QWORD *)v70 != v55)
          objc_enumerationMutation(v52);
        v57 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addProxiedContentMaps:", v57);

      }
      v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v69, v98, 16);
    }
    while (v54);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v58 = self->_trustedNetworkDiscoveredProxies;
  v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v65, v97, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v66;
    do
    {
      for (kk = 0; kk != v60; ++kk)
      {
        if (*(_QWORD *)v66 != v61)
          objc_enumerationMutation(v58);
        v63 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * kk), "copyWithZone:", a3, (_QWORD)v65);
        objc_msgSend((id)v6, "addTrustedNetworkDiscoveredProxies:", v63);

      }
      v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v65, v97, 16);
    }
    while (v60);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSPPrivacyProxyAuthenticationInfo *authInfo;
  NSMutableArray *policyTierMaps;
  NSMutableArray *proxies;
  NSMutableArray *pathWeights;
  NSMutableArray *resolvers;
  NSMutableArray *fallbackPathWeights;
  NSString *regionId;
  NSPPrivacyProxyResolverInfo *bootstrapResolver;
  NSString *dnsProbe;
  NSMutableArray *obliviousConfigs;
  NSMutableArray *proxiedContentMaps;
  NSMutableArray *trustedNetworkDiscoveredProxies;
  char v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || self->_version != *((_DWORD *)v4 + 32))
    goto LABEL_46;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 136) & 4) != 0)
    {
      if (self->_enabled)
      {
        if (!*((_BYTE *)v4 + 132))
          goto LABEL_46;
        goto LABEL_11;
      }
      if (!*((_BYTE *)v4 + 132))
        goto LABEL_11;
    }
LABEL_46:
    v17 = 0;
    goto LABEL_47;
  }
  if ((*((_BYTE *)v4 + 136) & 4) != 0)
    goto LABEL_46;
LABEL_11:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 136) & 1) == 0 || self->_disableUntil != *((_QWORD *)v4 + 1))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 136) & 1) != 0)
  {
    goto LABEL_46;
  }
  authInfo = self->_authInfo;
  if ((unint64_t)authInfo | *((_QWORD *)v4 + 2)
    && !-[NSPPrivacyProxyAuthenticationInfo isEqual:](authInfo, "isEqual:"))
  {
    goto LABEL_46;
  }
  policyTierMaps = self->_policyTierMaps;
  if ((unint64_t)policyTierMaps | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](policyTierMaps, "isEqual:"))
      goto LABEL_46;
  }
  proxies = self->_proxies;
  if ((unint64_t)proxies | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](proxies, "isEqual:"))
      goto LABEL_46;
  }
  pathWeights = self->_pathWeights;
  if ((unint64_t)pathWeights | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](pathWeights, "isEqual:"))
      goto LABEL_46;
  }
  resolvers = self->_resolvers;
  if ((unint64_t)resolvers | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](resolvers, "isEqual:"))
      goto LABEL_46;
  }
  if (self->_maxTokenNum != *((_DWORD *)v4 + 12))
    goto LABEL_46;
  fallbackPathWeights = self->_fallbackPathWeights;
  if ((unint64_t)fallbackPathWeights | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](fallbackPathWeights, "isEqual:"))
      goto LABEL_46;
  }
  regionId = self->_regionId;
  if ((unint64_t)regionId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](regionId, "isEqual:"))
      goto LABEL_46;
  }
  bootstrapResolver = self->_bootstrapResolver;
  if ((unint64_t)bootstrapResolver | *((_QWORD *)v4 + 3))
  {
    if (!-[NSPPrivacyProxyResolverInfo isEqual:](bootstrapResolver, "isEqual:"))
      goto LABEL_46;
  }
  dnsProbe = self->_dnsProbe;
  if ((unint64_t)dnsProbe | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](dnsProbe, "isEqual:"))
      goto LABEL_46;
  }
  obliviousConfigs = self->_obliviousConfigs;
  if ((unint64_t)obliviousConfigs | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](obliviousConfigs, "isEqual:"))
      goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 136) & 2) == 0 || self->_preferredPathEnabledPercentage != *((_DWORD *)v4 + 20))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 136) & 2) != 0)
  {
    goto LABEL_46;
  }
  proxiedContentMaps = self->_proxiedContentMaps;
  if ((unint64_t)proxiedContentMaps | *((_QWORD *)v4 + 11)
    && !-[NSMutableArray isEqual:](proxiedContentMaps, "isEqual:"))
  {
    goto LABEL_46;
  }
  trustedNetworkDiscoveredProxies = self->_trustedNetworkDiscoveredProxies;
  if ((unint64_t)trustedNetworkDiscoveredProxies | *((_QWORD *)v4 + 15))
    v17 = -[NSMutableArray isEqual:](trustedNetworkDiscoveredProxies, "isEqual:");
  else
    v17 = 1;
LABEL_47:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unsigned int maxTokenNum;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int version;
  uint64_t v20;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v20 = 2654435761 * self->_enabled;
  else
    v20 = 0;
  version = self->_version;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v18 = 2654435761u * self->_disableUntil;
  else
    v18 = 0;
  v17 = -[NSPPrivacyProxyAuthenticationInfo hash](self->_authInfo, "hash");
  v16 = -[NSMutableArray hash](self->_policyTierMaps, "hash");
  v15 = -[NSMutableArray hash](self->_proxies, "hash");
  v3 = -[NSMutableArray hash](self->_pathWeights, "hash");
  v4 = -[NSMutableArray hash](self->_resolvers, "hash");
  maxTokenNum = self->_maxTokenNum;
  v6 = -[NSMutableArray hash](self->_fallbackPathWeights, "hash");
  v7 = -[NSString hash](self->_regionId, "hash");
  v8 = -[NSPPrivacyProxyResolverInfo hash](self->_bootstrapResolver, "hash");
  v9 = -[NSString hash](self->_dnsProbe, "hash");
  v10 = -[NSMutableArray hash](self->_obliviousConfigs, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v11 = 2654435761 * self->_preferredPathEnabledPercentage;
  else
    v11 = 0;
  v12 = v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ (2654435761 * version) ^ v3 ^ v4 ^ (2654435761 * maxTokenNum) ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  v13 = -[NSMutableArray hash](self->_proxiedContentMaps, "hash");
  return v12 ^ v13 ^ -[NSMutableArray hash](self->_trustedNetworkDiscoveredProxies, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  NSPPrivacyProxyAuthenticationInfo *authInfo;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
  NSPPrivacyProxyResolverInfo *bootstrapResolver;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t ii;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t jj;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t kk;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  self->_version = *((_DWORD *)v4 + 32);
  v6 = *((_BYTE *)v4 + 136);
  if ((v6 & 4) != 0)
  {
    self->_enabled = *((_BYTE *)v4 + 132);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v4 + 136);
  }
  if ((v6 & 1) != 0)
  {
    self->_disableUntil = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  authInfo = self->_authInfo;
  v8 = *((_QWORD *)v5 + 2);
  if (authInfo)
  {
    if (v8)
      -[NSPPrivacyProxyAuthenticationInfo mergeFrom:](authInfo, "mergeFrom:");
  }
  else if (v8)
  {
    -[NSPPrivacyProxyConfiguration setAuthInfo:](self, "setAuthInfo:");
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v9 = *((id *)v5 + 9);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v80 != v12)
          objc_enumerationMutation(v9);
        -[NSPPrivacyProxyConfiguration addPolicyTierMap:](self, "addPolicyTierMap:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    }
    while (v11);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v14 = *((id *)v5 + 12);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v76 != v17)
          objc_enumerationMutation(v14);
        -[NSPPrivacyProxyConfiguration addProxies:](self, "addProxies:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    }
    while (v16);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v19 = *((id *)v5 + 8);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v72;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v72 != v22)
          objc_enumerationMutation(v19);
        -[NSPPrivacyProxyConfiguration addPathWeights:](self, "addPathWeights:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
    }
    while (v21);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v24 = *((id *)v5 + 14);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v68;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v68 != v27)
          objc_enumerationMutation(v24);
        -[NSPPrivacyProxyConfiguration addResolvers:](self, "addResolvers:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * m));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
    }
    while (v26);
  }

  self->_maxTokenNum = *((_DWORD *)v5 + 12);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v29 = *((id *)v5 + 5);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v86, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v64;
    do
    {
      for (n = 0; n != v31; ++n)
      {
        if (*(_QWORD *)v64 != v32)
          objc_enumerationMutation(v29);
        -[NSPPrivacyProxyConfiguration addFallbackPathWeights:](self, "addFallbackPathWeights:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * n));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v86, 16);
    }
    while (v31);
  }

  if (*((_QWORD *)v5 + 13))
    -[NSPPrivacyProxyConfiguration setRegionId:](self, "setRegionId:");
  bootstrapResolver = self->_bootstrapResolver;
  v35 = *((_QWORD *)v5 + 3);
  if (bootstrapResolver)
  {
    if (v35)
      -[NSPPrivacyProxyResolverInfo mergeFrom:](bootstrapResolver, "mergeFrom:");
  }
  else if (v35)
  {
    -[NSPPrivacyProxyConfiguration setBootstrapResolver:](self, "setBootstrapResolver:");
  }
  if (*((_QWORD *)v5 + 4))
    -[NSPPrivacyProxyConfiguration setDnsProbe:](self, "setDnsProbe:");
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v36 = *((id *)v5 + 7);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v85, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v60;
    do
    {
      for (ii = 0; ii != v38; ++ii)
      {
        if (*(_QWORD *)v60 != v39)
          objc_enumerationMutation(v36);
        -[NSPPrivacyProxyConfiguration addObliviousConfigs:](self, "addObliviousConfigs:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * ii));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v85, 16);
    }
    while (v38);
  }

  if ((*((_BYTE *)v5 + 136) & 2) != 0)
  {
    self->_preferredPathEnabledPercentage = *((_DWORD *)v5 + 20);
    *(_BYTE *)&self->_has |= 2u;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v41 = *((id *)v5 + 11);
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v84, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v56;
    do
    {
      for (jj = 0; jj != v43; ++jj)
      {
        if (*(_QWORD *)v56 != v44)
          objc_enumerationMutation(v41);
        -[NSPPrivacyProxyConfiguration addProxiedContentMaps:](self, "addProxiedContentMaps:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * jj));
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v84, 16);
    }
    while (v43);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v46 = *((id *)v5 + 15);
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v51, v83, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v52;
    do
    {
      for (kk = 0; kk != v48; ++kk)
      {
        if (*(_QWORD *)v52 != v49)
          objc_enumerationMutation(v46);
        -[NSPPrivacyProxyConfiguration addTrustedNetworkDiscoveredProxies:](self, "addTrustedNetworkDiscoveredProxies:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * kk), (_QWORD)v51);
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v51, v83, 16);
    }
    while (v48);
  }

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (unint64_t)disableUntil
{
  return self->_disableUntil;
}

- (NSPPrivacyProxyAuthenticationInfo)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(id)a3
{
  objc_storeStrong((id *)&self->_authInfo, a3);
}

- (NSMutableArray)policyTierMaps
{
  return self->_policyTierMaps;
}

- (void)setPolicyTierMaps:(id)a3
{
  objc_storeStrong((id *)&self->_policyTierMaps, a3);
}

- (NSMutableArray)proxies
{
  return self->_proxies;
}

- (void)setProxies:(id)a3
{
  objc_storeStrong((id *)&self->_proxies, a3);
}

- (NSMutableArray)pathWeights
{
  return self->_pathWeights;
}

- (void)setPathWeights:(id)a3
{
  objc_storeStrong((id *)&self->_pathWeights, a3);
}

- (NSMutableArray)resolvers
{
  return self->_resolvers;
}

- (void)setResolvers:(id)a3
{
  objc_storeStrong((id *)&self->_resolvers, a3);
}

- (unsigned)maxTokenNum
{
  return self->_maxTokenNum;
}

- (void)setMaxTokenNum:(unsigned int)a3
{
  self->_maxTokenNum = a3;
}

- (NSMutableArray)fallbackPathWeights
{
  return self->_fallbackPathWeights;
}

- (void)setFallbackPathWeights:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackPathWeights, a3);
}

- (NSString)regionId
{
  return self->_regionId;
}

- (void)setRegionId:(id)a3
{
  objc_storeStrong((id *)&self->_regionId, a3);
}

- (NSPPrivacyProxyResolverInfo)bootstrapResolver
{
  return self->_bootstrapResolver;
}

- (void)setBootstrapResolver:(id)a3
{
  objc_storeStrong((id *)&self->_bootstrapResolver, a3);
}

- (NSString)dnsProbe
{
  return self->_dnsProbe;
}

- (void)setDnsProbe:(id)a3
{
  objc_storeStrong((id *)&self->_dnsProbe, a3);
}

- (NSMutableArray)obliviousConfigs
{
  return self->_obliviousConfigs;
}

- (void)setObliviousConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_obliviousConfigs, a3);
}

- (unsigned)preferredPathEnabledPercentage
{
  return self->_preferredPathEnabledPercentage;
}

- (NSMutableArray)proxiedContentMaps
{
  return self->_proxiedContentMaps;
}

- (void)setProxiedContentMaps:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedContentMaps, a3);
}

- (NSMutableArray)trustedNetworkDiscoveredProxies
{
  return self->_trustedNetworkDiscoveredProxies;
}

- (void)setTrustedNetworkDiscoveredProxies:(id)a3
{
  objc_storeStrong((id *)&self->_trustedNetworkDiscoveredProxies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedNetworkDiscoveredProxies, 0);
  objc_storeStrong((id *)&self->_resolvers, 0);
  objc_storeStrong((id *)&self->_regionId, 0);
  objc_storeStrong((id *)&self->_proxies, 0);
  objc_storeStrong((id *)&self->_proxiedContentMaps, 0);
  objc_storeStrong((id *)&self->_policyTierMaps, 0);
  objc_storeStrong((id *)&self->_pathWeights, 0);
  objc_storeStrong((id *)&self->_obliviousConfigs, 0);
  objc_storeStrong((id *)&self->_fallbackPathWeights, 0);
  objc_storeStrong((id *)&self->_dnsProbe, 0);
  objc_storeStrong((id *)&self->_bootstrapResolver, 0);
  objc_storeStrong((id *)&self->_authInfo, 0);
}

@end
