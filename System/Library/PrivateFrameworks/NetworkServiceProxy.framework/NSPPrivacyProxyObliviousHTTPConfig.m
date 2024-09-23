@implementation NSPPrivacyProxyObliviousHTTPConfig

- (void)clearObliviousTargets
{
  -[NSMutableArray removeAllObjects](self->_obliviousTargets, "removeAllObjects");
}

- (void)addObliviousTargets:(id)a3
{
  id v4;
  NSMutableArray *obliviousTargets;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  obliviousTargets = self->_obliviousTargets;
  v8 = v4;
  if (!obliviousTargets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_obliviousTargets;
    self->_obliviousTargets = v6;

    v4 = v8;
    obliviousTargets = self->_obliviousTargets;
  }
  -[NSMutableArray addObject:](obliviousTargets, "addObject:", v4);

}

- (unint64_t)obliviousTargetsCount
{
  return -[NSMutableArray count](self->_obliviousTargets, "count");
}

- (id)obliviousTargetsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_obliviousTargets, "objectAtIndex:", a3);
}

+ (Class)obliviousTargetsType
{
  return (Class)objc_opt_class();
}

- (int)obliviousHTTPType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_obliviousHTTPType;
  else
    return 0;
}

- (void)setObliviousHTTPType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_obliviousHTTPType = a3;
}

- (void)setHasObliviousHTTPType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasObliviousHTTPType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)obliviousHTTPTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E41378A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsObliviousHTTPType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHUNKED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONTEXT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasTransparencyKeyBundle
{
  return self->_transparencyKeyBundle != 0;
}

- (BOOL)hasTransparencyProof
{
  return self->_transparencyProof != 0;
}

- (BOOL)hasTransparencyInternalProof
{
  return self->_transparencyInternalProof != 0;
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
  v8.super_class = (Class)NSPPrivacyProxyObliviousHTTPConfig;
  -[NSPPrivacyProxyObliviousHTTPConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyObliviousHTTPConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSData *obliviousHTTPConfig;
  uint64_t obliviousHTTPType;
  __CFString *v13;
  NSData *transparencyKeyBundle;
  NSData *transparencyProof;
  NSData *transparencyInternalProof;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_obliviousTargets, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_obliviousTargets, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = self->_obliviousTargets;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("obliviousTargets"));
  }
  obliviousHTTPConfig = self->_obliviousHTTPConfig;
  if (obliviousHTTPConfig)
    objc_msgSend(v3, "setObject:forKey:", obliviousHTTPConfig, CFSTR("obliviousHTTPConfig"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    obliviousHTTPType = self->_obliviousHTTPType;
    if (obliviousHTTPType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_obliviousHTTPType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E41378A8[obliviousHTTPType];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("obliviousHTTPType"));

  }
  transparencyKeyBundle = self->_transparencyKeyBundle;
  if (transparencyKeyBundle)
    objc_msgSend(v3, "setObject:forKey:", transparencyKeyBundle, CFSTR("transparencyKeyBundle"));
  transparencyProof = self->_transparencyProof;
  if (transparencyProof)
    objc_msgSend(v3, "setObject:forKey:", transparencyProof, CFSTR("transparencyProof"));
  transparencyInternalProof = self->_transparencyInternalProof;
  if (transparencyInternalProof)
    objc_msgSend(v3, "setObject:forKey:", transparencyInternalProof, CFSTR("transparencyInternalProof"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyObliviousHTTPConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_obliviousTargets;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (!self->_obliviousHTTPConfig)
    __assert_rtn("-[NSPPrivacyProxyObliviousHTTPConfig writeTo:]", "NSPPrivacyProxyObliviousHTTPConfig.m", 227, "nil != self->_obliviousHTTPConfig");
  PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_transparencyKeyBundle)
    PBDataWriterWriteDataField();
  if (self->_transparencyProof)
    PBDataWriterWriteDataField();
  if (self->_transparencyInternalProof)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[NSPPrivacyProxyObliviousHTTPConfig obliviousTargetsCount](self, "obliviousTargetsCount"))
  {
    objc_msgSend(v9, "clearObliviousTargets");
    v4 = -[NSPPrivacyProxyObliviousHTTPConfig obliviousTargetsCount](self, "obliviousTargetsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NSPPrivacyProxyObliviousHTTPConfig obliviousTargetsAtIndex:](self, "obliviousTargetsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObliviousTargets:", v7);

      }
    }
  }
  objc_msgSend(v9, "setObliviousHTTPConfig:", self->_obliviousHTTPConfig);
  v8 = v9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v9 + 4) = self->_obliviousHTTPType;
    *((_BYTE *)v9 + 56) |= 1u;
  }
  if (self->_transparencyKeyBundle)
  {
    objc_msgSend(v9, "setTransparencyKeyBundle:");
    v8 = v9;
  }
  if (self->_transparencyProof)
  {
    objc_msgSend(v9, "setTransparencyProof:");
    v8 = v9;
  }
  if (self->_transparencyInternalProof)
  {
    objc_msgSend(v9, "setTransparencyInternalProof:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = self->_obliviousTargets;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addObliviousTargets:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v12 = -[NSData copyWithZone:](self->_obliviousHTTPConfig, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_obliviousHTTPType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v14 = -[NSData copyWithZone:](self->_transparencyKeyBundle, "copyWithZone:", a3, (_QWORD)v21);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[NSData copyWithZone:](self->_transparencyProof, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  v18 = -[NSData copyWithZone:](self->_transparencyInternalProof, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *obliviousTargets;
  NSData *obliviousHTTPConfig;
  NSData *transparencyKeyBundle;
  NSData *transparencyProof;
  NSData *transparencyInternalProof;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  obliviousTargets = self->_obliviousTargets;
  if ((unint64_t)obliviousTargets | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](obliviousTargets, "isEqual:"))
      goto LABEL_17;
  }
  obliviousHTTPConfig = self->_obliviousHTTPConfig;
  if ((unint64_t)obliviousHTTPConfig | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](obliviousHTTPConfig, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_obliviousHTTPType != *((_DWORD *)v4 + 4))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  transparencyKeyBundle = self->_transparencyKeyBundle;
  if ((unint64_t)transparencyKeyBundle | *((_QWORD *)v4 + 5)
    && !-[NSData isEqual:](transparencyKeyBundle, "isEqual:"))
  {
    goto LABEL_17;
  }
  transparencyProof = self->_transparencyProof;
  if ((unint64_t)transparencyProof | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](transparencyProof, "isEqual:"))
      goto LABEL_17;
  }
  transparencyInternalProof = self->_transparencyInternalProof;
  if ((unint64_t)transparencyInternalProof | *((_QWORD *)v4 + 4))
    v10 = -[NSData isEqual:](transparencyInternalProof, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSMutableArray hash](self->_obliviousTargets, "hash");
  v4 = -[NSData hash](self->_obliviousHTTPConfig, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_obliviousHTTPType;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSData hash](self->_transparencyKeyBundle, "hash");
  v7 = -[NSData hash](self->_transparencyProof, "hash");
  return v6 ^ v7 ^ -[NSData hash](self->_transparencyInternalProof, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NSPPrivacyProxyObliviousHTTPConfig addObliviousTargets:](self, "addObliviousTargets:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 1))
    -[NSPPrivacyProxyObliviousHTTPConfig setObliviousHTTPConfig:](self, "setObliviousHTTPConfig:");
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_obliviousHTTPType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
    -[NSPPrivacyProxyObliviousHTTPConfig setTransparencyKeyBundle:](self, "setTransparencyKeyBundle:");
  if (*((_QWORD *)v4 + 6))
    -[NSPPrivacyProxyObliviousHTTPConfig setTransparencyProof:](self, "setTransparencyProof:");
  if (*((_QWORD *)v4 + 4))
    -[NSPPrivacyProxyObliviousHTTPConfig setTransparencyInternalProof:](self, "setTransparencyInternalProof:");

}

- (NSMutableArray)obliviousTargets
{
  return self->_obliviousTargets;
}

- (void)setObliviousTargets:(id)a3
{
  objc_storeStrong((id *)&self->_obliviousTargets, a3);
}

- (NSData)obliviousHTTPConfig
{
  return self->_obliviousHTTPConfig;
}

- (void)setObliviousHTTPConfig:(id)a3
{
  objc_storeStrong((id *)&self->_obliviousHTTPConfig, a3);
}

- (NSData)transparencyKeyBundle
{
  return self->_transparencyKeyBundle;
}

- (void)setTransparencyKeyBundle:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyKeyBundle, a3);
}

- (NSData)transparencyProof
{
  return self->_transparencyProof;
}

- (void)setTransparencyProof:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyProof, a3);
}

- (NSData)transparencyInternalProof
{
  return self->_transparencyInternalProof;
}

- (void)setTransparencyInternalProof:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyInternalProof, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyProof, 0);
  objc_storeStrong((id *)&self->_transparencyKeyBundle, 0);
  objc_storeStrong((id *)&self->_transparencyInternalProof, 0);
  objc_storeStrong((id *)&self->_obliviousTargets, 0);
  objc_storeStrong((id *)&self->_obliviousHTTPConfig, 0);
}

@end
