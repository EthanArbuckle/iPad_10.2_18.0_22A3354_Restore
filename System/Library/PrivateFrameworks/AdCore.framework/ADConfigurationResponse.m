@implementation ADConfigurationResponse

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
  NSString *resourceProxyURL;
  NSString *resourceConnectProxyURL;
  int bannerProxyType;
  __CFString *v14;
  NSString *configVersion;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_theConfigurations, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_theConfigurations, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_theConfigurations;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("theConfiguration"));
  }
  resourceProxyURL = self->_resourceProxyURL;
  if (resourceProxyURL)
    objc_msgSend(v3, "setObject:forKey:", resourceProxyURL, CFSTR("resourceProxyURL"));
  resourceConnectProxyURL = self->_resourceConnectProxyURL;
  if (resourceConnectProxyURL)
    objc_msgSend(v3, "setObject:forKey:", resourceConnectProxyURL, CFSTR("resourceConnectProxyURL"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    bannerProxyType = self->_bannerProxyType;
    if (bannerProxyType)
    {
      if (bannerProxyType == 1)
      {
        v14 = CFSTR("Connect");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_bannerProxyType);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = CFSTR("Legacy");
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("bannerProxyType"));

  }
  configVersion = self->_configVersion;
  if (configVersion)
    objc_msgSend(v3, "setObject:forKey:", configVersion, CFSTR("configVersion"));
  return v3;
}

- (void)addTheConfiguration:(id)a3
{
  id v4;
  NSMutableArray *theConfigurations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  theConfigurations = self->_theConfigurations;
  v8 = v4;
  if (!theConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_theConfigurations;
    self->_theConfigurations = v6;

    v4 = v8;
    theConfigurations = self->_theConfigurations;
  }
  -[NSMutableArray addObject:](theConfigurations, "addObject:", v4);

}

- (NSMutableArray)theConfigurations
{
  return self->_theConfigurations;
}

- (NSString)resourceConnectProxyURL
{
  return self->_resourceConnectProxyURL;
}

- (BOOL)hasResourceConnectProxyURL
{
  return self->_resourceConnectProxyURL != 0;
}

- (BOOL)readFrom:(id)a3
{
  return ADConfigurationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceProxyURL, 0);
  objc_storeStrong((id *)&self->_resourceConnectProxyURL, 0);
  objc_storeStrong((id *)&self->_theConfigurations, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
}

- (void)clearTheConfigurations
{
  -[NSMutableArray removeAllObjects](self->_theConfigurations, "removeAllObjects");
}

- (unint64_t)theConfigurationsCount
{
  return -[NSMutableArray count](self->_theConfigurations, "count");
}

- (id)theConfigurationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_theConfigurations, "objectAtIndex:", a3);
}

+ (Class)theConfigurationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasResourceProxyURL
{
  return self->_resourceProxyURL != 0;
}

- (int)bannerProxyType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_bannerProxyType;
  else
    return 0;
}

- (void)setBannerProxyType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bannerProxyType = a3;
}

- (void)setHasBannerProxyType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBannerProxyType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)bannerProxyTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Legacy");
  if (a3 == 1)
  {
    v3 = CFSTR("Connect");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsBannerProxyType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Legacy")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Connect"));

  return v4;
}

- (BOOL)hasConfigVersion
{
  return self->_configVersion != 0;
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
  v8.super_class = (Class)ADConfigurationResponse;
  -[ADConfigurationResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADConfigurationResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  v5 = self->_theConfigurations;
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

  if (self->_resourceProxyURL)
    PBDataWriterWriteStringField();
  if (self->_resourceConnectProxyURL)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_configVersion)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _DWORD *v8;
  id v9;

  v9 = a3;
  if (-[ADConfigurationResponse theConfigurationsCount](self, "theConfigurationsCount"))
  {
    objc_msgSend(v9, "clearTheConfigurations");
    v4 = -[ADConfigurationResponse theConfigurationsCount](self, "theConfigurationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ADConfigurationResponse theConfigurationAtIndex:](self, "theConfigurationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addTheConfiguration:", v7);

      }
    }
  }
  if (self->_resourceProxyURL)
    objc_msgSend(v9, "setResourceProxyURL:");
  v8 = v9;
  if (self->_resourceConnectProxyURL)
  {
    objc_msgSend(v9, "setResourceConnectProxyURL:");
    v8 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[2] = self->_bannerProxyType;
    *((_BYTE *)v8 + 48) |= 1u;
  }
  if (self->_configVersion)
  {
    objc_msgSend(v9, "setConfigVersion:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_theConfigurations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addTheConfiguration:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_resourceProxyURL, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSString copyWithZone:](self->_resourceConnectProxyURL, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_bannerProxyType;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v16 = -[NSString copyWithZone:](self->_configVersion, "copyWithZone:", a3, (_QWORD)v19);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *theConfigurations;
  NSString *resourceProxyURL;
  NSString *resourceConnectProxyURL;
  NSString *configVersion;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  theConfigurations = self->_theConfigurations;
  if ((unint64_t)theConfigurations | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](theConfigurations, "isEqual:"))
      goto LABEL_15;
  }
  resourceProxyURL = self->_resourceProxyURL;
  if ((unint64_t)resourceProxyURL | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](resourceProxyURL, "isEqual:"))
      goto LABEL_15;
  }
  resourceConnectProxyURL = self->_resourceConnectProxyURL;
  if ((unint64_t)resourceConnectProxyURL | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](resourceConnectProxyURL, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_bannerProxyType != *((_DWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  configVersion = self->_configVersion;
  if ((unint64_t)configVersion | *((_QWORD *)v4 + 2))
    v9 = -[NSString isEqual:](configVersion, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSMutableArray hash](self->_theConfigurations, "hash");
  v4 = -[NSString hash](self->_resourceProxyURL, "hash");
  v5 = -[NSString hash](self->_resourceConnectProxyURL, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_bannerProxyType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_configVersion, "hash");
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
        -[ADConfigurationResponse addTheConfiguration:](self, "addTheConfiguration:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 5))
    -[ADConfigurationResponse setResourceProxyURL:](self, "setResourceProxyURL:");
  if (*((_QWORD *)v4 + 4))
    -[ADConfigurationResponse setResourceConnectProxyURL:](self, "setResourceConnectProxyURL:");
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_bannerProxyType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[ADConfigurationResponse setConfigVersion:](self, "setConfigVersion:");

}

- (void)setTheConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_theConfigurations, a3);
}

- (NSString)resourceProxyURL
{
  return self->_resourceProxyURL;
}

- (void)setResourceProxyURL:(id)a3
{
  objc_storeStrong((id *)&self->_resourceProxyURL, a3);
}

- (void)setResourceConnectProxyURL:(id)a3
{
  objc_storeStrong((id *)&self->_resourceConnectProxyURL, a3);
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(id)a3
{
  objc_storeStrong((id *)&self->_configVersion, a3);
}

@end
