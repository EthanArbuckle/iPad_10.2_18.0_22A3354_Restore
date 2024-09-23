@implementation NSPPrivacyProxyProxiedContentMap

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NSPPrivacyProxyProxiedContentMap;
  -[NSPPrivacyProxyProxiedContentMap dealloc](&v3, sel_dealloc);
}

- (unint64_t)proxiesCount
{
  return self->_proxies.count;
}

- (unsigned)proxies
{
  return self->_proxies.list;
}

- (void)clearProxies
{
  PBRepeatedUInt32Clear();
}

- (void)addProxies:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)proxiesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_proxies;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_proxies = &self->_proxies;
  count = self->_proxies.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_proxies->list[a3];
}

- (void)setProxies:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)clearHostnames
{
  -[NSMutableArray removeAllObjects](self->_hostnames, "removeAllObjects");
}

- (void)addHostnames:(id)a3
{
  id v4;
  NSMutableArray *hostnames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  hostnames = self->_hostnames;
  v8 = v4;
  if (!hostnames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_hostnames;
    self->_hostnames = v6;

    v4 = v8;
    hostnames = self->_hostnames;
  }
  -[NSMutableArray addObject:](hostnames, "addObject:", v4);

}

- (unint64_t)hostnamesCount
{
  return -[NSMutableArray count](self->_hostnames, "count");
}

- (id)hostnamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_hostnames, "objectAtIndex:", a3);
}

+ (Class)hostnamesType
{
  return (Class)objc_opt_class();
}

- (void)clearProcesses
{
  -[NSMutableArray removeAllObjects](self->_processes, "removeAllObjects");
}

- (void)addProcesses:(id)a3
{
  id v4;
  NSMutableArray *processes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  processes = self->_processes;
  v8 = v4;
  if (!processes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_processes;
    self->_processes = v6;

    v4 = v8;
    processes = self->_processes;
  }
  -[NSMutableArray addObject:](processes, "addObject:", v4);

}

- (unint64_t)processesCount
{
  return -[NSMutableArray count](self->_processes, "count");
}

- (id)processesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_processes, "objectAtIndex:", a3);
}

+ (Class)processesType
{
  return (Class)objc_opt_class();
}

- (void)setSystemProcessOnly:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_systemProcessOnly = a3;
}

- (void)setHasSystemProcessOnly:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSystemProcessOnly
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPercentEnabled:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_percentEnabled = a3;
}

- (void)setHasPercentEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPercentEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSupportsReverseProxying:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_supportsReverseProxying = a3;
}

- (void)setHasSupportsReverseProxying:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSupportsReverseProxying
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearUrls
{
  -[NSMutableArray removeAllObjects](self->_urls, "removeAllObjects");
}

- (void)addUrls:(id)a3
{
  id v4;
  NSMutableArray *urls;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  urls = self->_urls;
  v8 = v4;
  if (!urls)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_urls;
    self->_urls = v6;

    v4 = v8;
    urls = self->_urls;
  }
  -[NSMutableArray addObject:](urls, "addObject:", v4);

}

- (unint64_t)urlsCount
{
  return -[NSMutableArray count](self->_urls, "count");
}

- (id)urlsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_urls, "objectAtIndex:", a3);
}

+ (Class)urlsType
{
  return (Class)objc_opt_class();
}

- (void)setResolver:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_resolver = a3;
}

- (void)setHasResolver:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResolver
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMatchExactHostnames:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_matchExactHostnames = a3;
}

- (void)setHasMatchExactHostnames:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMatchExactHostnames
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsPrivacyProxy:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isPrivacyProxy = a3;
}

- (void)setHasIsPrivacyProxy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsPrivacyProxy
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)NSPPrivacyProxyProxiedContentMap;
  -[NSPPrivacyProxyProxiedContentMap description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyProxiedContentMap dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  void *v6;
  NSMutableArray *hostnames;
  NSMutableArray *processes;
  char has;
  void *v10;
  NSMutableArray *urls;
  char v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("enabled"));

  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  PBRepeatedUInt32NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("proxies"));

  hostnames = self->_hostnames;
  if (hostnames)
    objc_msgSend(v3, "setObject:forKey:", hostnames, CFSTR("hostnames"));
  processes = self->_processes;
  if (processes)
    objc_msgSend(v3, "setObject:forKey:", processes, CFSTR("processes"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_systemProcessOnly);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("systemProcessOnly"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_percentEnabled);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("percentEnabled"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsReverseProxying);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("supportsReverseProxying"));

  }
LABEL_11:
  urls = self->_urls;
  if (urls)
    objc_msgSend(v3, "setObject:forKey:", urls, CFSTR("urls"));
  v12 = (char)self->_has;
  if ((v12 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_15;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_matchExactHostnames);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("matchExactHostnames"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_resolver);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("resolver"));

  v12 = (char)self->_has;
  if ((v12 & 8) != 0)
    goto LABEL_22;
LABEL_15:
  if ((v12 & 4) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPrivacyProxy);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("isPrivacyProxy"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyProxiedContentMapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
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
  char has;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteBOOLField();
  if (!self->_identifier)
    __assert_rtn("-[NSPPrivacyProxyProxiedContentMap writeTo:]", "NSPPrivacyProxyProxiedContentMap.m", 423, "nil != self->_identifier");
  PBDataWriterWriteStringField();
  if (self->_proxies.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_proxies.count);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = self->_hostnames;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v8);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = self->_processes;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v13);
  }

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_21:
      if ((has & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_22:
    PBDataWriterWriteBOOLField();
LABEL_23:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = self->_urls;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteStringField();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v19);
  }

  v22 = (char)self->_has;
  if ((v22 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_32;
LABEL_39:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
  PBDataWriterWriteUint32Field();
  v22 = (char)self->_has;
  if ((v22 & 8) != 0)
    goto LABEL_39;
LABEL_32:
  if ((v22 & 4) != 0)
LABEL_33:
    PBDataWriterWriteBOOLField();
LABEL_34:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  char has;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  char v21;
  id v22;

  v4 = a3;
  v4[80] = self->_enabled;
  v22 = v4;
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  if (-[NSPPrivacyProxyProxiedContentMap proxiesCount](self, "proxiesCount"))
  {
    objc_msgSend(v22, "clearProxies");
    v5 = -[NSPPrivacyProxyProxiedContentMap proxiesCount](self, "proxiesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v22, "addProxies:", -[NSPPrivacyProxyProxiedContentMap proxiesAtIndex:](self, "proxiesAtIndex:", i));
    }
  }
  if (-[NSPPrivacyProxyProxiedContentMap hostnamesCount](self, "hostnamesCount"))
  {
    objc_msgSend(v22, "clearHostnames");
    v8 = -[NSPPrivacyProxyProxiedContentMap hostnamesCount](self, "hostnamesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NSPPrivacyProxyProxiedContentMap hostnamesAtIndex:](self, "hostnamesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addHostnames:", v11);

      }
    }
  }
  if (-[NSPPrivacyProxyProxiedContentMap processesCount](self, "processesCount"))
  {
    objc_msgSend(v22, "clearProcesses");
    v12 = -[NSPPrivacyProxyProxiedContentMap processesCount](self, "processesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[NSPPrivacyProxyProxiedContentMap processesAtIndex:](self, "processesAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addProcesses:", v15);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_15;
LABEL_27:
    *((_DWORD *)v22 + 12) = self->_percentEnabled;
    *((_BYTE *)v22 + 88) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  *((_BYTE *)v22 + 84) = self->_systemProcessOnly;
  *((_BYTE *)v22 + 88) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_27;
LABEL_15:
  if ((has & 0x10) != 0)
  {
LABEL_16:
    *((_BYTE *)v22 + 83) = self->_supportsReverseProxying;
    *((_BYTE *)v22 + 88) |= 0x10u;
  }
LABEL_17:
  if (-[NSPPrivacyProxyProxiedContentMap urlsCount](self, "urlsCount"))
  {
    objc_msgSend(v22, "clearUrls");
    v17 = -[NSPPrivacyProxyProxiedContentMap urlsCount](self, "urlsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[NSPPrivacyProxyProxiedContentMap urlsAtIndex:](self, "urlsAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addUrls:", v20);

      }
    }
  }
  v21 = (char)self->_has;
  if ((v21 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_23;
LABEL_30:
    *((_BYTE *)v22 + 82) = self->_matchExactHostnames;
    *((_BYTE *)v22 + 88) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
  *((_DWORD *)v22 + 16) = self->_resolver;
  *((_BYTE *)v22 + 88) |= 2u;
  v21 = (char)self->_has;
  if ((v21 & 8) != 0)
    goto LABEL_30;
LABEL_23:
  if ((v21 & 4) != 0)
  {
LABEL_24:
    *((_BYTE *)v22 + 81) = self->_isPrivacyProxy;
    *((_BYTE *)v22 + 88) |= 4u;
  }
LABEL_25:

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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  char has;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  char v27;
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
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v5 + 80) = self->_enabled;
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  PBRepeatedUInt32Copy();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = self->_hostnames;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addHostnames:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v10);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = self->_processes;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addProcesses:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v16);
  }

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 84) = self->_systemProcessOnly;
    *(_BYTE *)(v5 + 88) |= 0x20u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_17:
      if ((has & 0x10) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 48) = self->_percentEnabled;
  *(_BYTE *)(v5 + 88) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    *(_BYTE *)(v5 + 83) = self->_supportsReverseProxying;
    *(_BYTE *)(v5 + 88) |= 0x10u;
  }
LABEL_19:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = self->_urls;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v29);
        objc_msgSend((id)v5, "addUrls:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v23);
  }

  v27 = (char)self->_has;
  if ((v27 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_28;
LABEL_35:
    *(_BYTE *)(v5 + 82) = self->_matchExactHostnames;
    *(_BYTE *)(v5 + 88) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_29;
  }
  *(_DWORD *)(v5 + 64) = self->_resolver;
  *(_BYTE *)(v5 + 88) |= 2u;
  v27 = (char)self->_has;
  if ((v27 & 8) != 0)
    goto LABEL_35;
LABEL_28:
  if ((v27 & 4) != 0)
  {
LABEL_29:
    *(_BYTE *)(v5 + 81) = self->_isPrivacyProxy;
    *(_BYTE *)(v5 + 88) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSMutableArray *hostnames;
  NSMutableArray *processes;
  char has;
  char v9;
  NSMutableArray *urls;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  if (self->_enabled)
  {
    if (!*((_BYTE *)v4 + 80))
      goto LABEL_52;
  }
  else if (*((_BYTE *)v4 + 80))
  {
    goto LABEL_52;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](identifier, "isEqual:"))
    goto LABEL_52;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_52;
  hostnames = self->_hostnames;
  if ((unint64_t)hostnames | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](hostnames, "isEqual:"))
      goto LABEL_52;
  }
  processes = self->_processes;
  if ((unint64_t)processes | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](processes, "isEqual:"))
      goto LABEL_52;
  }
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 88);
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x20) == 0)
      goto LABEL_52;
    if (self->_systemProcessOnly)
    {
      if (!*((_BYTE *)v4 + 84))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 84))
    {
      goto LABEL_52;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_percentEnabled != *((_DWORD *)v4 + 12))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x10) == 0)
      goto LABEL_52;
    if (self->_supportsReverseProxying)
    {
      if (!*((_BYTE *)v4 + 83))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 83))
    {
      goto LABEL_52;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
  {
    goto LABEL_52;
  }
  urls = self->_urls;
  if ((unint64_t)urls | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](urls, "isEqual:"))
      goto LABEL_52;
    has = (char)self->_has;
    v9 = *((_BYTE *)v4 + 88);
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_resolver != *((_DWORD *)v4 + 16))
      goto LABEL_52;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0)
      goto LABEL_52;
    if (self->_matchExactHostnames)
    {
      if (!*((_BYTE *)v4 + 82))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 82))
    {
      goto LABEL_52;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_52;
  }
  v11 = (v9 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v9 & 4) != 0)
    {
      if (self->_isPrivacyProxy)
      {
        if (!*((_BYTE *)v4 + 81))
          goto LABEL_52;
      }
      else if (*((_BYTE *)v4 + 81))
      {
        goto LABEL_52;
      }
      v11 = 1;
      goto LABEL_53;
    }
LABEL_52:
    v11 = 0;
  }
LABEL_53:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 enabled;

  enabled = self->_enabled;
  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = PBRepeatedUInt32Hash();
  v5 = -[NSMutableArray hash](self->_hostnames, "hash");
  v6 = -[NSMutableArray hash](self->_processes, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v7 = 2654435761 * self->_systemProcessOnly;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v8 = 2654435761 * self->_percentEnabled;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v9 = 2654435761 * self->_supportsReverseProxying;
    goto LABEL_8;
  }
LABEL_7:
  v9 = 0;
LABEL_8:
  v10 = -[NSMutableArray hash](self->_urls, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_10;
LABEL_13:
    v12 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_11;
LABEL_14:
    v13 = 0;
    return v3 ^ v4 ^ v5 ^ v6 ^ (2654435761 * enabled) ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  v11 = 2654435761 * self->_resolver;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_10:
  v12 = 2654435761 * self->_matchExactHostnames;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_11:
  v13 = 2654435761 * self->_isPrivacyProxy;
  return v3 ^ v4 ^ v5 ^ v6 ^ (2654435761 * enabled) ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  char v24;
  __int128 v25;
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
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_enabled = *((_BYTE *)v4 + 80);
  if (*((_QWORD *)v4 + 5))
    -[NSPPrivacyProxyProxiedContentMap setIdentifier:](self, "setIdentifier:");
  v5 = objc_msgSend(v4, "proxiesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[NSPPrivacyProxyProxiedContentMap addProxies:](self, "addProxies:", objc_msgSend(v4, "proxiesAtIndex:", i));
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = *((id *)v4 + 4);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        -[NSPPrivacyProxyProxiedContentMap addHostnames:](self, "addHostnames:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v10);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = *((id *)v4 + 7);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        -[NSPPrivacyProxyProxiedContentMap addProcesses:](self, "addProcesses:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v15);
  }

  v18 = *((_BYTE *)v4 + 88);
  if ((v18 & 0x20) != 0)
  {
    self->_systemProcessOnly = *((_BYTE *)v4 + 84);
    *(_BYTE *)&self->_has |= 0x20u;
    v18 = *((_BYTE *)v4 + 88);
    if ((v18 & 1) == 0)
    {
LABEL_22:
      if ((v18 & 0x10) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 1) == 0)
  {
    goto LABEL_22;
  }
  self->_percentEnabled = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
  {
LABEL_23:
    self->_supportsReverseProxying = *((_BYTE *)v4 + 83);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_24:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = *((id *)v4 + 9);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (m = 0; m != v21; ++m)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        -[NSPPrivacyProxyProxiedContentMap addUrls:](self, "addUrls:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * m), (_QWORD)v25);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v21);
  }

  v24 = *((_BYTE *)v4 + 88);
  if ((v24 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 88) & 8) == 0)
      goto LABEL_33;
LABEL_40:
    self->_matchExactHostnames = *((_BYTE *)v4 + 82);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 88) & 4) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
  self->_resolver = *((_DWORD *)v4 + 16);
  *(_BYTE *)&self->_has |= 2u;
  v24 = *((_BYTE *)v4 + 88);
  if ((v24 & 8) != 0)
    goto LABEL_40;
LABEL_33:
  if ((v24 & 4) != 0)
  {
LABEL_34:
    self->_isPrivacyProxy = *((_BYTE *)v4 + 81);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_35:

}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSMutableArray)hostnames
{
  return self->_hostnames;
}

- (void)setHostnames:(id)a3
{
  objc_storeStrong((id *)&self->_hostnames, a3);
}

- (NSMutableArray)processes
{
  return self->_processes;
}

- (void)setProcesses:(id)a3
{
  objc_storeStrong((id *)&self->_processes, a3);
}

- (BOOL)systemProcessOnly
{
  return self->_systemProcessOnly;
}

- (unsigned)percentEnabled
{
  return self->_percentEnabled;
}

- (BOOL)supportsReverseProxying
{
  return self->_supportsReverseProxying;
}

- (NSMutableArray)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
  objc_storeStrong((id *)&self->_urls, a3);
}

- (unsigned)resolver
{
  return self->_resolver;
}

- (BOOL)matchExactHostnames
{
  return self->_matchExactHostnames;
}

- (BOOL)isPrivacyProxy
{
  return self->_isPrivacyProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hostnames, 0);
}

@end
