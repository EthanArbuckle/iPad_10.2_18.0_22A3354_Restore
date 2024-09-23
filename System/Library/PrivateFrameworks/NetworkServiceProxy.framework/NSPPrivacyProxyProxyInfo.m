@implementation NSPPrivacyProxyProxyInfo

- (id)proxyHopAsString:(int)a3
{
  if (a3 < 4)
    return off_1E4137580[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsProxyHop:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INGRESS_ONLY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EGRESS_ONLY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ANY")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearProxyKeyInfos
{
  -[NSMutableArray removeAllObjects](self->_proxyKeyInfos, "removeAllObjects");
}

- (void)addProxyKeyInfo:(id)a3
{
  id v4;
  NSMutableArray *proxyKeyInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  proxyKeyInfos = self->_proxyKeyInfos;
  v8 = v4;
  if (!proxyKeyInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_proxyKeyInfos;
    self->_proxyKeyInfos = v6;

    v4 = v8;
    proxyKeyInfos = self->_proxyKeyInfos;
  }
  -[NSMutableArray addObject:](proxyKeyInfos, "addObject:", v4);

}

- (unint64_t)proxyKeyInfosCount
{
  return -[NSMutableArray count](self->_proxyKeyInfos, "count");
}

- (id)proxyKeyInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_proxyKeyInfos, "objectAtIndex:", a3);
}

+ (Class)proxyKeyInfoType
{
  return (Class)objc_opt_class();
}

- (void)setSupportsFallback:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_supportsFallback = a3;
}

- (void)setHasSupportsFallback:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsFallback
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasVendor
{
  return self->_vendor != 0;
}

- (BOOL)hasTcpProxyFqdn
{
  return self->_tcpProxyFqdn != 0;
}

- (BOOL)hasPreferredPathConfigUri
{
  return self->_preferredPathConfigUri != 0;
}

- (BOOL)hasProxyVersion
{
  return self->_proxyVersion != 0;
}

- (void)setSupportsResumption:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_supportsResumption = a3;
}

- (void)setHasSupportsResumption:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsResumption
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearBootstrapAddresses
{
  -[NSMutableArray removeAllObjects](self->_bootstrapAddresses, "removeAllObjects");
}

- (void)addBootstrapAddresses:(id)a3
{
  id v4;
  NSMutableArray *bootstrapAddresses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  bootstrapAddresses = self->_bootstrapAddresses;
  v8 = v4;
  if (!bootstrapAddresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_bootstrapAddresses;
    self->_bootstrapAddresses = v6;

    v4 = v8;
    bootstrapAddresses = self->_bootstrapAddresses;
  }
  -[NSMutableArray addObject:](bootstrapAddresses, "addObject:", v4);

}

- (unint64_t)bootstrapAddressesCount
{
  return -[NSMutableArray count](self->_bootstrapAddresses, "count");
}

- (id)bootstrapAddressesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bootstrapAddresses, "objectAtIndex:", a3);
}

+ (Class)bootstrapAddressesType
{
  return (Class)objc_opt_class();
}

- (void)clearAllowedNextHops
{
  -[NSMutableArray removeAllObjects](self->_allowedNextHops, "removeAllObjects");
}

- (void)addAllowedNextHops:(id)a3
{
  id v4;
  NSMutableArray *allowedNextHops;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  allowedNextHops = self->_allowedNextHops;
  v8 = v4;
  if (!allowedNextHops)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_allowedNextHops;
    self->_allowedNextHops = v6;

    v4 = v8;
    allowedNextHops = self->_allowedNextHops;
  }
  -[NSMutableArray addObject:](allowedNextHops, "addObject:", v4);

}

- (unint64_t)allowedNextHopsCount
{
  return -[NSMutableArray count](self->_allowedNextHops, "count");
}

- (id)allowedNextHopsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_allowedNextHops, "objectAtIndex:", a3);
}

+ (Class)allowedNextHopsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTokenChallenge
{
  return self->_tokenChallenge != 0;
}

- (void)clearPreferredPathPatterns
{
  -[NSMutableArray removeAllObjects](self->_preferredPathPatterns, "removeAllObjects");
}

- (void)addPreferredPathPatterns:(id)a3
{
  id v4;
  NSMutableArray *preferredPathPatterns;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  preferredPathPatterns = self->_preferredPathPatterns;
  v8 = v4;
  if (!preferredPathPatterns)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_preferredPathPatterns;
    self->_preferredPathPatterns = v6;

    v4 = v8;
    preferredPathPatterns = self->_preferredPathPatterns;
  }
  -[NSMutableArray addObject:](preferredPathPatterns, "addObject:", v4);

}

- (unint64_t)preferredPathPatternsCount
{
  return -[NSMutableArray count](self->_preferredPathPatterns, "count");
}

- (id)preferredPathPatternsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_preferredPathPatterns, "objectAtIndex:", a3);
}

+ (Class)preferredPathPatternsType
{
  return (Class)objc_opt_class();
}

- (void)setFallbackSupportsUDPProxying:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_fallbackSupportsUDPProxying = a3;
}

- (void)setHasFallbackSupportsUDPProxying:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFallbackSupportsUDPProxying
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)algorithm
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_algorithm;
  else
    return 0;
}

- (void)setAlgorithm:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_algorithm = a3;
}

- (void)setHasAlgorithm:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlgorithm
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)algorithmAsString:(int)a3
{
  if (a3 < 3)
    return off_1E41375A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAlgorithm:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_SET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("P384")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("X25519")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)NSPPrivacyProxyProxyInfo;
  -[NSPPrivacyProxyProxyInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyProxyInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t proxyHop;
  __CFString *v5;
  NSString *proxyURL;
  NSMutableArray *proxyKeyInfos;
  NSData *tokenKeyInfo;
  void *v9;
  NSString *vendor;
  NSString *tcpProxyFqdn;
  NSString *preferredPathConfigUri;
  NSString *proxyVersion;
  void *v14;
  NSMutableArray *bootstrapAddresses;
  NSMutableArray *allowedNextHops;
  NSData *tokenChallenge;
  NSMutableArray *preferredPathPatterns;
  char has;
  void *v20;
  uint64_t algorithm;
  __CFString *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  proxyHop = self->_proxyHop;
  if (proxyHop >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_proxyHop);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E4137580[proxyHop];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("proxyHop"));

  proxyURL = self->_proxyURL;
  if (proxyURL)
    objc_msgSend(v3, "setObject:forKey:", proxyURL, CFSTR("proxyURL"));
  proxyKeyInfos = self->_proxyKeyInfos;
  if (proxyKeyInfos)
    objc_msgSend(v3, "setObject:forKey:", proxyKeyInfos, CFSTR("proxyKeyInfo"));
  tokenKeyInfo = self->_tokenKeyInfo;
  if (tokenKeyInfo)
    objc_msgSend(v3, "setObject:forKey:", tokenKeyInfo, CFSTR("tokenKeyInfo"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsFallback);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("supportsFallback"));

  }
  vendor = self->_vendor;
  if (vendor)
    objc_msgSend(v3, "setObject:forKey:", vendor, CFSTR("vendor"));
  tcpProxyFqdn = self->_tcpProxyFqdn;
  if (tcpProxyFqdn)
    objc_msgSend(v3, "setObject:forKey:", tcpProxyFqdn, CFSTR("tcpProxyFqdn"));
  preferredPathConfigUri = self->_preferredPathConfigUri;
  if (preferredPathConfigUri)
    objc_msgSend(v3, "setObject:forKey:", preferredPathConfigUri, CFSTR("preferredPathConfigUri"));
  proxyVersion = self->_proxyVersion;
  if (proxyVersion)
    objc_msgSend(v3, "setObject:forKey:", proxyVersion, CFSTR("proxyVersion"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsResumption);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("supportsResumption"));

  }
  bootstrapAddresses = self->_bootstrapAddresses;
  if (bootstrapAddresses)
    objc_msgSend(v3, "setObject:forKey:", bootstrapAddresses, CFSTR("bootstrapAddresses"));
  allowedNextHops = self->_allowedNextHops;
  if (allowedNextHops)
    objc_msgSend(v3, "setObject:forKey:", allowedNextHops, CFSTR("allowedNextHops"));
  tokenChallenge = self->_tokenChallenge;
  if (tokenChallenge)
    objc_msgSend(v3, "setObject:forKey:", tokenChallenge, CFSTR("tokenChallenge"));
  preferredPathPatterns = self->_preferredPathPatterns;
  if (preferredPathPatterns)
    objc_msgSend(v3, "setObject:forKey:", preferredPathPatterns, CFSTR("preferredPathPatterns"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fallbackSupportsUDPProxying);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("fallbackSupportsUDPProxying"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    algorithm = self->_algorithm;
    if (algorithm >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_algorithm);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E41375A0[algorithm];
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("algorithm"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyProxyInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  char has;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_proxyURL)
    __assert_rtn("-[NSPPrivacyProxyProxyInfo writeTo:]", "NSPPrivacyProxyProxyInfo.m", 451, "nil != self->_proxyURL");
  PBDataWriterWriteStringField();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = self->_proxyKeyInfos;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteDataField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v7);
  }

  if (!self->_tokenKeyInfo)
    __assert_rtn("-[NSPPrivacyProxyProxyInfo writeTo:]", "NSPPrivacyProxyProxyInfo.m", 463, "nil != self->_tokenKeyInfo");
  PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_vendor)
    PBDataWriterWriteStringField();
  if (self->_tcpProxyFqdn)
    PBDataWriterWriteStringField();
  if (self->_preferredPathConfigUri)
    PBDataWriterWriteStringField();
  if (self->_proxyVersion)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = self->_bootstrapAddresses;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v12);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = self->_allowedNextHops;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v17);
  }

  if (self->_tokenChallenge)
    PBDataWriterWriteDataField();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = self->_preferredPathPatterns;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v22);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  char has;
  id v22;

  v4 = a3;
  v4[12] = self->_proxyHop;
  v22 = v4;
  objc_msgSend(v4, "setProxyURL:", self->_proxyURL);
  if (-[NSPPrivacyProxyProxyInfo proxyKeyInfosCount](self, "proxyKeyInfosCount"))
  {
    objc_msgSend(v22, "clearProxyKeyInfos");
    v5 = -[NSPPrivacyProxyProxyInfo proxyKeyInfosCount](self, "proxyKeyInfosCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NSPPrivacyProxyProxyInfo proxyKeyInfoAtIndex:](self, "proxyKeyInfoAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addProxyKeyInfo:", v8);

      }
    }
  }
  objc_msgSend(v22, "setTokenKeyInfo:", self->_tokenKeyInfo);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v22 + 113) = self->_supportsFallback;
    *((_BYTE *)v22 + 116) |= 4u;
  }
  if (self->_vendor)
    objc_msgSend(v22, "setVendor:");
  if (self->_tcpProxyFqdn)
    objc_msgSend(v22, "setTcpProxyFqdn:");
  if (self->_preferredPathConfigUri)
    objc_msgSend(v22, "setPreferredPathConfigUri:");
  if (self->_proxyVersion)
    objc_msgSend(v22, "setProxyVersion:");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v22 + 114) = self->_supportsResumption;
    *((_BYTE *)v22 + 116) |= 8u;
  }
  if (-[NSPPrivacyProxyProxyInfo bootstrapAddressesCount](self, "bootstrapAddressesCount"))
  {
    objc_msgSend(v22, "clearBootstrapAddresses");
    v9 = -[NSPPrivacyProxyProxyInfo bootstrapAddressesCount](self, "bootstrapAddressesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[NSPPrivacyProxyProxyInfo bootstrapAddressesAtIndex:](self, "bootstrapAddressesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addBootstrapAddresses:", v12);

      }
    }
  }
  if (-[NSPPrivacyProxyProxyInfo allowedNextHopsCount](self, "allowedNextHopsCount"))
  {
    objc_msgSend(v22, "clearAllowedNextHops");
    v13 = -[NSPPrivacyProxyProxyInfo allowedNextHopsCount](self, "allowedNextHopsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[NSPPrivacyProxyProxyInfo allowedNextHopsAtIndex:](self, "allowedNextHopsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAllowedNextHops:", v16);

      }
    }
  }
  if (self->_tokenChallenge)
    objc_msgSend(v22, "setTokenChallenge:");
  if (-[NSPPrivacyProxyProxyInfo preferredPathPatternsCount](self, "preferredPathPatternsCount"))
  {
    objc_msgSend(v22, "clearPreferredPathPatterns");
    v17 = -[NSPPrivacyProxyProxyInfo preferredPathPatternsCount](self, "preferredPathPatternsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[NSPPrivacyProxyProxyInfo preferredPathPatternsAtIndex:](self, "preferredPathPatternsAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addPreferredPathPatterns:", v20);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v22 + 112) = self->_fallbackSupportsUDPProxying;
    *((_BYTE *)v22 + 116) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v22 + 2) = self->_algorithm;
    *((_BYTE *)v22 + 116) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  uint64_t v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  char has;
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
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 48) = self->_proxyHop;
  v6 = -[NSString copyWithZone:](self->_proxyURL, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v8 = self->_proxyKeyInfos;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v59 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addProxyKeyInfo:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v10);
  }

  v14 = -[NSData copyWithZone:](self->_tokenKeyInfo, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v14;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v5 + 113) = self->_supportsFallback;
    *(_BYTE *)(v5 + 116) |= 4u;
  }
  v16 = -[NSString copyWithZone:](self->_vendor, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v16;

  v18 = -[NSString copyWithZone:](self->_tcpProxyFqdn, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v18;

  v20 = -[NSString copyWithZone:](self->_preferredPathConfigUri, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v20;

  v22 = -[NSString copyWithZone:](self->_proxyVersion, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v22;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 114) = self->_supportsResumption;
    *(_BYTE *)(v5 + 116) |= 8u;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v24 = self->_bootstrapAddresses;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v55 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBootstrapAddresses:", v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    }
    while (v26);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v30 = self->_allowedNextHops;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v51 != v33)
          objc_enumerationMutation(v30);
        v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAllowedNextHops:", v35);

      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    }
    while (v32);
  }

  v36 = -[NSData copyWithZone:](self->_tokenChallenge, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v36;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v38 = self->_preferredPathPatterns;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v47;
    do
    {
      for (m = 0; m != v40; ++m)
      {
        if (*(_QWORD *)v47 != v41)
          objc_enumerationMutation(v38);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v46);
        objc_msgSend((id)v5, "addPreferredPathPatterns:", v43);

      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    }
    while (v40);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 112) = self->_fallbackSupportsUDPProxying;
    *(_BYTE *)(v5 + 116) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_algorithm;
    *(_BYTE *)(v5 + 116) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *proxyURL;
  NSMutableArray *proxyKeyInfos;
  NSData *tokenKeyInfo;
  NSString *vendor;
  NSString *tcpProxyFqdn;
  NSString *preferredPathConfigUri;
  NSString *proxyVersion;
  NSMutableArray *bootstrapAddresses;
  NSMutableArray *allowedNextHops;
  NSData *tokenChallenge;
  NSMutableArray *preferredPathPatterns;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_53;
  if (self->_proxyHop != *((_DWORD *)v4 + 12))
    goto LABEL_53;
  proxyURL = self->_proxyURL;
  if ((unint64_t)proxyURL | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](proxyURL, "isEqual:"))
      goto LABEL_53;
  }
  proxyKeyInfos = self->_proxyKeyInfos;
  if ((unint64_t)proxyKeyInfos | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](proxyKeyInfos, "isEqual:"))
      goto LABEL_53;
  }
  tokenKeyInfo = self->_tokenKeyInfo;
  if ((unint64_t)tokenKeyInfo | *((_QWORD *)v4 + 12))
  {
    if (!-[NSData isEqual:](tokenKeyInfo, "isEqual:"))
      goto LABEL_53;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 4) == 0)
      goto LABEL_53;
    if (self->_supportsFallback)
    {
      if (!*((_BYTE *)v4 + 113))
        goto LABEL_53;
    }
    else if (*((_BYTE *)v4 + 113))
    {
      goto LABEL_53;
    }
  }
  else if ((*((_BYTE *)v4 + 116) & 4) != 0)
  {
    goto LABEL_53;
  }
  vendor = self->_vendor;
  if ((unint64_t)vendor | *((_QWORD *)v4 + 13) && !-[NSString isEqual:](vendor, "isEqual:"))
    goto LABEL_53;
  tcpProxyFqdn = self->_tcpProxyFqdn;
  if ((unint64_t)tcpProxyFqdn | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](tcpProxyFqdn, "isEqual:"))
      goto LABEL_53;
  }
  preferredPathConfigUri = self->_preferredPathConfigUri;
  if ((unint64_t)preferredPathConfigUri | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](preferredPathConfigUri, "isEqual:"))
      goto LABEL_53;
  }
  proxyVersion = self->_proxyVersion;
  if ((unint64_t)proxyVersion | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](proxyVersion, "isEqual:"))
      goto LABEL_53;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 8) == 0)
      goto LABEL_53;
    if (self->_supportsResumption)
    {
      if (!*((_BYTE *)v4 + 114))
        goto LABEL_53;
    }
    else if (*((_BYTE *)v4 + 114))
    {
      goto LABEL_53;
    }
  }
  else if ((*((_BYTE *)v4 + 116) & 8) != 0)
  {
    goto LABEL_53;
  }
  bootstrapAddresses = self->_bootstrapAddresses;
  if ((unint64_t)bootstrapAddresses | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](bootstrapAddresses, "isEqual:"))
  {
    goto LABEL_53;
  }
  allowedNextHops = self->_allowedNextHops;
  if ((unint64_t)allowedNextHops | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](allowedNextHops, "isEqual:"))
      goto LABEL_53;
  }
  tokenChallenge = self->_tokenChallenge;
  if ((unint64_t)tokenChallenge | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](tokenChallenge, "isEqual:"))
      goto LABEL_53;
  }
  preferredPathPatterns = self->_preferredPathPatterns;
  if ((unint64_t)preferredPathPatterns | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](preferredPathPatterns, "isEqual:"))
      goto LABEL_53;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 2) != 0)
    {
      if (self->_fallbackSupportsUDPProxying)
      {
        if (!*((_BYTE *)v4 + 112))
          goto LABEL_53;
        goto LABEL_49;
      }
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_49;
    }
LABEL_53:
    v16 = 0;
    goto LABEL_54;
  }
  if ((*((_BYTE *)v4 + 116) & 2) != 0)
    goto LABEL_53;
LABEL_49:
  v16 = (*((_BYTE *)v4 + 116) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 1) == 0 || self->_algorithm != *((_DWORD *)v4 + 2))
      goto LABEL_53;
    v16 = 1;
  }
LABEL_54:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  uint64_t proxyHop;

  proxyHop = self->_proxyHop;
  v18 = -[NSString hash](self->_proxyURL, "hash");
  v17 = -[NSMutableArray hash](self->_proxyKeyInfos, "hash");
  v16 = -[NSData hash](self->_tokenKeyInfo, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v15 = 2654435761 * self->_supportsFallback;
  else
    v15 = 0;
  v14 = -[NSString hash](self->_vendor, "hash");
  v3 = -[NSString hash](self->_tcpProxyFqdn, "hash");
  v4 = -[NSString hash](self->_preferredPathConfigUri, "hash");
  v5 = -[NSString hash](self->_proxyVersion, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v6 = 2654435761 * self->_supportsResumption;
  else
    v6 = 0;
  v7 = -[NSMutableArray hash](self->_bootstrapAddresses, "hash");
  v8 = -[NSMutableArray hash](self->_allowedNextHops, "hash");
  v9 = -[NSData hash](self->_tokenChallenge, "hash");
  v10 = -[NSMutableArray hash](self->_preferredPathPatterns, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v11 = 2654435761 * self->_fallbackSupportsUDPProxying;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_9;
LABEL_11:
    v12 = 0;
    return v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ (2654435761 * proxyHop) ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_11;
LABEL_9:
  v12 = 2654435761 * self->_algorithm;
  return v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ (2654435761 * proxyHop) ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_proxyHop = *((_DWORD *)v4 + 12);
  if (*((_QWORD *)v4 + 8))
    -[NSPPrivacyProxyProxyInfo setProxyURL:](self, "setProxyURL:");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = *((id *)v4 + 7);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        -[NSPPrivacyProxyProxyInfo addProxyKeyInfo:](self, "addProxyKeyInfo:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 12))
    -[NSPPrivacyProxyProxyInfo setTokenKeyInfo:](self, "setTokenKeyInfo:");
  if ((*((_BYTE *)v4 + 116) & 4) != 0)
  {
    self->_supportsFallback = *((_BYTE *)v4 + 113);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 13))
    -[NSPPrivacyProxyProxyInfo setVendor:](self, "setVendor:");
  if (*((_QWORD *)v4 + 10))
    -[NSPPrivacyProxyProxyInfo setTcpProxyFqdn:](self, "setTcpProxyFqdn:");
  if (*((_QWORD *)v4 + 4))
    -[NSPPrivacyProxyProxyInfo setPreferredPathConfigUri:](self, "setPreferredPathConfigUri:");
  if (*((_QWORD *)v4 + 9))
    -[NSPPrivacyProxyProxyInfo setProxyVersion:](self, "setProxyVersion:");
  if ((*((_BYTE *)v4 + 116) & 8) != 0)
  {
    self->_supportsResumption = *((_BYTE *)v4 + 114);
    *(_BYTE *)&self->_has |= 8u;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        -[NSPPrivacyProxyProxyInfo addBootstrapAddresses:](self, "addBootstrapAddresses:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v12);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = *((id *)v4 + 2);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        -[NSPPrivacyProxyProxyInfo addAllowedNextHops:](self, "addAllowedNextHops:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v17);
  }

  if (*((_QWORD *)v4 + 11))
    -[NSPPrivacyProxyProxyInfo setTokenChallenge:](self, "setTokenChallenge:");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = *((id *)v4 + 5);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v20);
        -[NSPPrivacyProxyProxyInfo addPreferredPathPatterns:](self, "addPreferredPathPatterns:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * m), (_QWORD)v26);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v22);
  }

  v25 = *((_BYTE *)v4 + 116);
  if ((v25 & 2) != 0)
  {
    self->_fallbackSupportsUDPProxying = *((_BYTE *)v4 + 112);
    *(_BYTE *)&self->_has |= 2u;
    v25 = *((_BYTE *)v4 + 116);
  }
  if ((v25 & 1) != 0)
  {
    self->_algorithm = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (int)proxyHop
{
  return self->_proxyHop;
}

- (void)setProxyHop:(int)a3
{
  self->_proxyHop = a3;
}

- (NSString)proxyURL
{
  return self->_proxyURL;
}

- (void)setProxyURL:(id)a3
{
  objc_storeStrong((id *)&self->_proxyURL, a3);
}

- (NSMutableArray)proxyKeyInfos
{
  return self->_proxyKeyInfos;
}

- (void)setProxyKeyInfos:(id)a3
{
  objc_storeStrong((id *)&self->_proxyKeyInfos, a3);
}

- (NSData)tokenKeyInfo
{
  return self->_tokenKeyInfo;
}

- (void)setTokenKeyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_tokenKeyInfo, a3);
}

- (BOOL)supportsFallback
{
  return self->_supportsFallback;
}

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
  objc_storeStrong((id *)&self->_vendor, a3);
}

- (NSString)tcpProxyFqdn
{
  return self->_tcpProxyFqdn;
}

- (void)setTcpProxyFqdn:(id)a3
{
  objc_storeStrong((id *)&self->_tcpProxyFqdn, a3);
}

- (NSString)preferredPathConfigUri
{
  return self->_preferredPathConfigUri;
}

- (void)setPreferredPathConfigUri:(id)a3
{
  objc_storeStrong((id *)&self->_preferredPathConfigUri, a3);
}

- (NSString)proxyVersion
{
  return self->_proxyVersion;
}

- (void)setProxyVersion:(id)a3
{
  objc_storeStrong((id *)&self->_proxyVersion, a3);
}

- (BOOL)supportsResumption
{
  return self->_supportsResumption;
}

- (NSMutableArray)bootstrapAddresses
{
  return self->_bootstrapAddresses;
}

- (void)setBootstrapAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_bootstrapAddresses, a3);
}

- (NSMutableArray)allowedNextHops
{
  return self->_allowedNextHops;
}

- (void)setAllowedNextHops:(id)a3
{
  objc_storeStrong((id *)&self->_allowedNextHops, a3);
}

- (NSData)tokenChallenge
{
  return self->_tokenChallenge;
}

- (void)setTokenChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_tokenChallenge, a3);
}

- (NSMutableArray)preferredPathPatterns
{
  return self->_preferredPathPatterns;
}

- (void)setPreferredPathPatterns:(id)a3
{
  objc_storeStrong((id *)&self->_preferredPathPatterns, a3);
}

- (BOOL)fallbackSupportsUDPProxying
{
  return self->_fallbackSupportsUDPProxying;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_tokenKeyInfo, 0);
  objc_storeStrong((id *)&self->_tokenChallenge, 0);
  objc_storeStrong((id *)&self->_tcpProxyFqdn, 0);
  objc_storeStrong((id *)&self->_proxyVersion, 0);
  objc_storeStrong((id *)&self->_proxyURL, 0);
  objc_storeStrong((id *)&self->_proxyKeyInfos, 0);
  objc_storeStrong((id *)&self->_preferredPathPatterns, 0);
  objc_storeStrong((id *)&self->_preferredPathConfigUri, 0);
  objc_storeStrong((id *)&self->_bootstrapAddresses, 0);
  objc_storeStrong((id *)&self->_allowedNextHops, 0);
}

@end
