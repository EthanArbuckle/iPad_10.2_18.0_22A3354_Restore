@implementation NSPPrivacyProxyAuthenticationInfo

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NSPPrivacyProxyAuthenticationInfo;
  -[NSPPrivacyProxyAuthenticationInfo dealloc](&v3, sel_dealloc);
}

- (int)authType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_authType;
  else
    return 3;
}

- (void)setAuthType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_authType = a3;
}

- (void)setHasAuthType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)authTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E4137748[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAuthType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BAA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANISETTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BAA_ANISETTE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOKEN")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAccessTokenURL
{
  return self->_accessTokenURL != 0;
}

- (unint64_t)accessTokenTypesCount
{
  return self->_accessTokenTypes.count;
}

- (unsigned)accessTokenTypes
{
  return self->_accessTokenTypes.list;
}

- (void)clearAccessTokenTypes
{
  PBRepeatedUInt32Clear();
}

- (void)addAccessTokenTypes:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)accessTokenTypesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_accessTokenTypes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_accessTokenTypes = &self->_accessTokenTypes;
  count = self->_accessTokenTypes.count;
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
  return p_accessTokenTypes->list[a3];
}

- (void)setAccessTokenTypes:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)clearAccessTokenKnownOrigins
{
  -[NSMutableArray removeAllObjects](self->_accessTokenKnownOrigins, "removeAllObjects");
}

- (void)addAccessTokenKnownOrigins:(id)a3
{
  id v4;
  NSMutableArray *accessTokenKnownOrigins;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  accessTokenKnownOrigins = self->_accessTokenKnownOrigins;
  v8 = v4;
  if (!accessTokenKnownOrigins)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_accessTokenKnownOrigins;
    self->_accessTokenKnownOrigins = v6;

    v4 = v8;
    accessTokenKnownOrigins = self->_accessTokenKnownOrigins;
  }
  -[NSMutableArray addObject:](accessTokenKnownOrigins, "addObject:", v4);

}

- (unint64_t)accessTokenKnownOriginsCount
{
  return -[NSMutableArray count](self->_accessTokenKnownOrigins, "count");
}

- (id)accessTokenKnownOriginsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_accessTokenKnownOrigins, "objectAtIndex:", a3);
}

+ (Class)accessTokenKnownOriginsType
{
  return (Class)objc_opt_class();
}

- (void)clearAccessTokenBlockedIssuers
{
  -[NSMutableArray removeAllObjects](self->_accessTokenBlockedIssuers, "removeAllObjects");
}

- (void)addAccessTokenBlockedIssuers:(id)a3
{
  id v4;
  NSMutableArray *accessTokenBlockedIssuers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  accessTokenBlockedIssuers = self->_accessTokenBlockedIssuers;
  v8 = v4;
  if (!accessTokenBlockedIssuers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_accessTokenBlockedIssuers;
    self->_accessTokenBlockedIssuers = v6;

    v4 = v8;
    accessTokenBlockedIssuers = self->_accessTokenBlockedIssuers;
  }
  -[NSMutableArray addObject:](accessTokenBlockedIssuers, "addObject:", v4);

}

- (unint64_t)accessTokenBlockedIssuersCount
{
  return -[NSMutableArray count](self->_accessTokenBlockedIssuers, "count");
}

- (id)accessTokenBlockedIssuersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_accessTokenBlockedIssuers, "objectAtIndex:", a3);
}

+ (Class)accessTokenBlockedIssuersType
{
  return (Class)objc_opt_class();
}

- (void)clearNonDefaultAttesters
{
  -[NSMutableArray removeAllObjects](self->_nonDefaultAttesters, "removeAllObjects");
}

- (void)addNonDefaultAttesters:(id)a3
{
  id v4;
  NSMutableArray *nonDefaultAttesters;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nonDefaultAttesters = self->_nonDefaultAttesters;
  v8 = v4;
  if (!nonDefaultAttesters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_nonDefaultAttesters;
    self->_nonDefaultAttesters = v6;

    v4 = v8;
    nonDefaultAttesters = self->_nonDefaultAttesters;
  }
  -[NSMutableArray addObject:](nonDefaultAttesters, "addObject:", v4);

}

- (unint64_t)nonDefaultAttestersCount
{
  return -[NSMutableArray count](self->_nonDefaultAttesters, "count");
}

- (id)nonDefaultAttestersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_nonDefaultAttesters, "objectAtIndex:", a3);
}

+ (Class)nonDefaultAttestersType
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
  v8.super_class = (Class)NSPPrivacyProxyAuthenticationInfo;
  -[NSPPrivacyProxyAuthenticationInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyAuthenticationInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t authType;
  __CFString *v5;
  NSString *authURL;
  NSString *accessTokenURL;
  void *v8;
  NSMutableArray *accessTokenKnownOrigins;
  NSMutableArray *accessTokenBlockedIssuers;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    authType = self->_authType;
    if (authType >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_authType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E4137748[authType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("authType"));

  }
  authURL = self->_authURL;
  if (authURL)
    objc_msgSend(v3, "setObject:forKey:", authURL, CFSTR("authURL"));
  accessTokenURL = self->_accessTokenURL;
  if (accessTokenURL)
    objc_msgSend(v3, "setObject:forKey:", accessTokenURL, CFSTR("accessTokenURL"));
  PBRepeatedUInt32NSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("accessTokenTypes"));

  accessTokenKnownOrigins = self->_accessTokenKnownOrigins;
  if (accessTokenKnownOrigins)
    objc_msgSend(v3, "setObject:forKey:", accessTokenKnownOrigins, CFSTR("accessTokenKnownOrigins"));
  accessTokenBlockedIssuers = self->_accessTokenBlockedIssuers;
  if (accessTokenBlockedIssuers)
    objc_msgSend(v3, "setObject:forKey:", accessTokenBlockedIssuers, CFSTR("accessTokenBlockedIssuers"));
  if (-[NSMutableArray count](self->_nonDefaultAttesters, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_nonDefaultAttesters, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = self->_nonDefaultAttesters;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("nonDefaultAttesters"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyAuthenticationInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
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
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (!self->_authURL)
    __assert_rtn("-[NSPPrivacyProxyAuthenticationInfo writeTo:]", "NSPPrivacyProxyAuthenticationInfo.m", 341, "nil != self->_authURL");
  PBDataWriterWriteStringField();
  if (self->_accessTokenURL)
    PBDataWriterWriteStringField();
  if (self->_accessTokenTypes.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_accessTokenTypes.count);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_accessTokenKnownOrigins;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_accessTokenBlockedIssuers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_nonDefaultAttesters;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
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
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  id v20;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[14] = self->_authType;
    *((_BYTE *)v4 + 80) |= 1u;
  }
  v20 = v4;
  objc_msgSend(v4, "setAuthURL:", self->_authURL);
  if (self->_accessTokenURL)
    objc_msgSend(v20, "setAccessTokenURL:");
  if (-[NSPPrivacyProxyAuthenticationInfo accessTokenTypesCount](self, "accessTokenTypesCount"))
  {
    objc_msgSend(v20, "clearAccessTokenTypes");
    v5 = -[NSPPrivacyProxyAuthenticationInfo accessTokenTypesCount](self, "accessTokenTypesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v20, "addAccessTokenTypes:", -[NSPPrivacyProxyAuthenticationInfo accessTokenTypesAtIndex:](self, "accessTokenTypesAtIndex:", i));
    }
  }
  if (-[NSPPrivacyProxyAuthenticationInfo accessTokenKnownOriginsCount](self, "accessTokenKnownOriginsCount"))
  {
    objc_msgSend(v20, "clearAccessTokenKnownOrigins");
    v8 = -[NSPPrivacyProxyAuthenticationInfo accessTokenKnownOriginsCount](self, "accessTokenKnownOriginsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NSPPrivacyProxyAuthenticationInfo accessTokenKnownOriginsAtIndex:](self, "accessTokenKnownOriginsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAccessTokenKnownOrigins:", v11);

      }
    }
  }
  if (-[NSPPrivacyProxyAuthenticationInfo accessTokenBlockedIssuersCount](self, "accessTokenBlockedIssuersCount"))
  {
    objc_msgSend(v20, "clearAccessTokenBlockedIssuers");
    v12 = -[NSPPrivacyProxyAuthenticationInfo accessTokenBlockedIssuersCount](self, "accessTokenBlockedIssuersCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[NSPPrivacyProxyAuthenticationInfo accessTokenBlockedIssuersAtIndex:](self, "accessTokenBlockedIssuersAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAccessTokenBlockedIssuers:", v15);

      }
    }
  }
  if (-[NSPPrivacyProxyAuthenticationInfo nonDefaultAttestersCount](self, "nonDefaultAttestersCount"))
  {
    objc_msgSend(v20, "clearNonDefaultAttesters");
    v16 = -[NSPPrivacyProxyAuthenticationInfo nonDefaultAttestersCount](self, "nonDefaultAttestersCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[NSPPrivacyProxyAuthenticationInfo nonDefaultAttestersAtIndex:](self, "nonDefaultAttestersAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addNonDefaultAttesters:", v19);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
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
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_authType;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_authURL, "copyWithZone:", a3);
  v8 = (void *)v6[8];
  v6[8] = v7;

  v9 = -[NSString copyWithZone:](self->_accessTokenURL, "copyWithZone:", a3);
  v10 = (void *)v6[6];
  v6[6] = v9;

  PBRepeatedUInt32Copy();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = self->_accessTokenKnownOrigins;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addAccessTokenKnownOrigins:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v13);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = self->_accessTokenBlockedIssuers;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addAccessTokenBlockedIssuers:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v19);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = self->_nonDefaultAttesters;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend(v6, "addNonDefaultAttesters:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v25);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *authURL;
  NSString *accessTokenURL;
  NSMutableArray *accessTokenKnownOrigins;
  NSMutableArray *accessTokenBlockedIssuers;
  NSMutableArray *nonDefaultAttesters;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_authType != *((_DWORD *)v4 + 14))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
  authURL = self->_authURL;
  if ((unint64_t)authURL | *((_QWORD *)v4 + 8) && !-[NSString isEqual:](authURL, "isEqual:"))
    goto LABEL_18;
  accessTokenURL = self->_accessTokenURL;
  if ((unint64_t)accessTokenURL | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](accessTokenURL, "isEqual:"))
      goto LABEL_18;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_18;
  accessTokenKnownOrigins = self->_accessTokenKnownOrigins;
  if ((unint64_t)accessTokenKnownOrigins | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](accessTokenKnownOrigins, "isEqual:"))
      goto LABEL_18;
  }
  accessTokenBlockedIssuers = self->_accessTokenBlockedIssuers;
  if ((unint64_t)accessTokenBlockedIssuers | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](accessTokenBlockedIssuers, "isEqual:"))
      goto LABEL_18;
  }
  nonDefaultAttesters = self->_nonDefaultAttesters;
  if ((unint64_t)nonDefaultAttesters | *((_QWORD *)v4 + 9))
    v10 = -[NSMutableArray isEqual:](nonDefaultAttesters, "isEqual:");
  else
    v10 = 1;
LABEL_19:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_authType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_authURL, "hash") ^ v3;
  v5 = -[NSString hash](self->_accessTokenURL, "hash");
  v6 = v4 ^ v5 ^ PBRepeatedUInt32Hash();
  v7 = -[NSMutableArray hash](self->_accessTokenKnownOrigins, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_accessTokenBlockedIssuers, "hash");
  return v6 ^ v8 ^ -[NSMutableArray hash](self->_nonDefaultAttesters, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
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
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[20] & 1) != 0)
  {
    self->_authType = v4[14];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 8))
    -[NSPPrivacyProxyAuthenticationInfo setAuthURL:](self, "setAuthURL:");
  if (*((_QWORD *)v5 + 6))
    -[NSPPrivacyProxyAuthenticationInfo setAccessTokenURL:](self, "setAccessTokenURL:");
  v6 = objc_msgSend(v5, "accessTokenTypesCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[NSPPrivacyProxyAuthenticationInfo addAccessTokenTypes:](self, "addAccessTokenTypes:", objc_msgSend(v5, "accessTokenTypesAtIndex:", i));
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = *((id *)v5 + 5);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        -[NSPPrivacyProxyAuthenticationInfo addAccessTokenKnownOrigins:](self, "addAccessTokenKnownOrigins:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v11);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = *((id *)v5 + 4);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        -[NSPPrivacyProxyAuthenticationInfo addAccessTokenBlockedIssuers:](self, "addAccessTokenBlockedIssuers:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v16);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = *((id *)v5 + 9);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (m = 0; m != v21; ++m)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        -[NSPPrivacyProxyAuthenticationInfo addNonDefaultAttesters:](self, "addNonDefaultAttesters:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * m), (_QWORD)v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v21);
  }

}

- (NSString)authURL
{
  return self->_authURL;
}

- (void)setAuthURL:(id)a3
{
  objc_storeStrong((id *)&self->_authURL, a3);
}

- (NSString)accessTokenURL
{
  return self->_accessTokenURL;
}

- (void)setAccessTokenURL:(id)a3
{
  objc_storeStrong((id *)&self->_accessTokenURL, a3);
}

- (NSMutableArray)accessTokenKnownOrigins
{
  return self->_accessTokenKnownOrigins;
}

- (void)setAccessTokenKnownOrigins:(id)a3
{
  objc_storeStrong((id *)&self->_accessTokenKnownOrigins, a3);
}

- (NSMutableArray)accessTokenBlockedIssuers
{
  return self->_accessTokenBlockedIssuers;
}

- (void)setAccessTokenBlockedIssuers:(id)a3
{
  objc_storeStrong((id *)&self->_accessTokenBlockedIssuers, a3);
}

- (NSMutableArray)nonDefaultAttesters
{
  return self->_nonDefaultAttesters;
}

- (void)setNonDefaultAttesters:(id)a3
{
  objc_storeStrong((id *)&self->_nonDefaultAttesters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonDefaultAttesters, 0);
  objc_storeStrong((id *)&self->_authURL, 0);
  objc_storeStrong((id *)&self->_accessTokenURL, 0);
  objc_storeStrong((id *)&self->_accessTokenKnownOrigins, 0);
  objc_storeStrong((id *)&self->_accessTokenBlockedIssuers, 0);
}

@end
