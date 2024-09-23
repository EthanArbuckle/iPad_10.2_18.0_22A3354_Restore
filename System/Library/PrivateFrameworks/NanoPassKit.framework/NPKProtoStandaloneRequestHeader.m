@implementation NPKProtoStandaloneRequestHeader

- (id)protocolVersionAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("Version1");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsProtocolVersion:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("Version1"));
  return 1;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (BOOL)hasStepIdentifier
{
  return self->_stepIdentifier != 0;
}

- (void)clearCachedHeroImages
{
  -[NSMutableArray removeAllObjects](self->_cachedHeroImages, "removeAllObjects");
}

- (void)addCachedHeroImages:(id)a3
{
  id v4;
  NSMutableArray *cachedHeroImages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  cachedHeroImages = self->_cachedHeroImages;
  v8 = v4;
  if (!cachedHeroImages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_cachedHeroImages;
    self->_cachedHeroImages = v6;

    v4 = v8;
    cachedHeroImages = self->_cachedHeroImages;
  }
  -[NSMutableArray addObject:](cachedHeroImages, "addObject:", v4);

}

- (unint64_t)cachedHeroImagesCount
{
  return -[NSMutableArray count](self->_cachedHeroImages, "count");
}

- (id)cachedHeroImagesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_cachedHeroImages, "objectAtIndex:", a3);
}

+ (Class)cachedHeroImagesType
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandaloneRequestHeader;
  -[NPKProtoStandaloneRequestHeader description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneRequestHeader dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __CFString *v4;
  NSString *sessionIdentifier;
  NSString *stepIdentifier;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_protocolVersion == 1)
  {
    v4 = CFSTR("Version1");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_protocolVersion);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("protocolVersion"));

  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  stepIdentifier = self->_stepIdentifier;
  if (stepIdentifier)
    objc_msgSend(v3, "setObject:forKey:", stepIdentifier, CFSTR("stepIdentifier"));
  if (-[NSMutableArray count](self->_cachedHeroImages, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_cachedHeroImages, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_cachedHeroImages;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cachedHeroImages"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneRequestHeaderReadFrom(self, (uint64_t)a3);
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_sessionIdentifier)
    PBDataWriterWriteStringField();
  if (self->_stepIdentifier)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_cachedHeroImages;
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

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _DWORD *v8;

  v8 = a3;
  v8[4] = self->_protocolVersion;
  if (self->_sessionIdentifier)
    objc_msgSend(v8, "setSessionIdentifier:");
  if (self->_stepIdentifier)
    objc_msgSend(v8, "setStepIdentifier:");
  if (-[NPKProtoStandaloneRequestHeader cachedHeroImagesCount](self, "cachedHeroImagesCount"))
  {
    objc_msgSend(v8, "clearCachedHeroImages");
    v4 = -[NPKProtoStandaloneRequestHeader cachedHeroImagesCount](self, "cachedHeroImagesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoStandaloneRequestHeader cachedHeroImagesAtIndex:](self, "cachedHeroImagesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addCachedHeroImages:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_protocolVersion;
  v6 = -[NSString copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_stepIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_cachedHeroImages;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addCachedHeroImages:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *sessionIdentifier;
  NSString *stepIdentifier;
  NSMutableArray *cachedHeroImages;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_protocolVersion == *((_DWORD *)v4 + 4)
    && ((sessionIdentifier = self->_sessionIdentifier, !((unint64_t)sessionIdentifier | v4[3]))
     || -[NSString isEqual:](sessionIdentifier, "isEqual:"))
    && ((stepIdentifier = self->_stepIdentifier, !((unint64_t)stepIdentifier | v4[4]))
     || -[NSString isEqual:](stepIdentifier, "isEqual:")))
  {
    cachedHeroImages = self->_cachedHeroImages;
    if ((unint64_t)cachedHeroImages | v4[1])
      v8 = -[NSMutableArray isEqual:](cachedHeroImages, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = 2654435761 * self->_protocolVersion;
  v4 = -[NSString hash](self->_sessionIdentifier, "hash");
  v5 = v4 ^ -[NSString hash](self->_stepIdentifier, "hash");
  return v5 ^ -[NSMutableArray hash](self->_cachedHeroImages, "hash") ^ v3;
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_protocolVersion = *((_DWORD *)v4 + 4);
  if (*((_QWORD *)v4 + 3))
    -[NPKProtoStandaloneRequestHeader setSessionIdentifier:](self, "setSessionIdentifier:");
  if (*((_QWORD *)v4 + 4))
    -[NPKProtoStandaloneRequestHeader setStepIdentifier:](self, "setStepIdentifier:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
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
        -[NPKProtoStandaloneRequestHeader addCachedHeroImages:](self, "addCachedHeroImages:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int)a3
{
  self->_protocolVersion = a3;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stepIdentifier, a3);
}

- (NSMutableArray)cachedHeroImages
{
  return self->_cachedHeroImages;
}

- (void)setCachedHeroImages:(id)a3
{
  objc_storeStrong((id *)&self->_cachedHeroImages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedHeroImages, 0);
}

@end
