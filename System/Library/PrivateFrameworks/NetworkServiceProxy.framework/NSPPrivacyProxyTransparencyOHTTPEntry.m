@implementation NSPPrivacyProxyTransparencyOHTTPEntry

- (void)clearTargetInformations
{
  -[NSMutableArray removeAllObjects](self->_targetInformations, "removeAllObjects");
}

- (void)addTargetInformation:(id)a3
{
  id v4;
  NSMutableArray *targetInformations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  targetInformations = self->_targetInformations;
  v8 = v4;
  if (!targetInformations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_targetInformations;
    self->_targetInformations = v6;

    v4 = v8;
    targetInformations = self->_targetInformations;
  }
  -[NSMutableArray addObject:](targetInformations, "addObject:", v4);

}

- (unint64_t)targetInformationsCount
{
  return -[NSMutableArray count](self->_targetInformations, "count");
}

- (id)targetInformationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_targetInformations, "objectAtIndex:", a3);
}

+ (Class)targetInformationType
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
  v8.super_class = (Class)NSPPrivacyProxyTransparencyOHTTPEntry;
  -[NSPPrivacyProxyTransparencyOHTTPEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyTransparencyOHTTPEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSData *keyConfiguration;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_configurationDeliveryStart);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("configurationDeliveryStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_configurationDeliveryEnd);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("configurationDeliveryEnd"));

  if (-[NSMutableArray count](self->_targetInformations, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_targetInformations, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_targetInformations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("targetInformation"));
  }
  keyConfiguration = self->_keyConfiguration;
  if (keyConfiguration)
    objc_msgSend(v3, "setObject:forKey:", keyConfiguration, CFSTR("keyConfiguration"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTransparencyOHTTPEntryReadFrom(self, (uint64_t)a3);
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
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_targetInformations;
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

  if (!self->_keyConfiguration)
    __assert_rtn("-[NSPPrivacyProxyTransparencyOHTTPEntry writeTo:]", "NSPPrivacyProxyTransparencyOHTTPEntry.m", 170, "nil != self->_keyConfiguration");
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v4[2] = self->_configurationDeliveryStart;
  v9 = v4;
  v4[1] = self->_configurationDeliveryEnd;
  if (-[NSPPrivacyProxyTransparencyOHTTPEntry targetInformationsCount](self, "targetInformationsCount"))
  {
    objc_msgSend(v9, "clearTargetInformations");
    v5 = -[NSPPrivacyProxyTransparencyOHTTPEntry targetInformationsCount](self, "targetInformationsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NSPPrivacyProxyTransparencyOHTTPEntry targetInformationAtIndex:](self, "targetInformationAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addTargetInformation:", v8);

      }
    }
  }
  objc_msgSend(v9, "setKeyConfiguration:", self->_keyConfiguration);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[2] = self->_configurationDeliveryStart;
  v5[1] = self->_configurationDeliveryEnd;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_targetInformations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v5, "addTargetInformation:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v12 = -[NSData copyWithZone:](self->_keyConfiguration, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *targetInformations;
  NSData *keyConfiguration;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_configurationDeliveryStart == v4[2]
    && self->_configurationDeliveryEnd == v4[1]
    && ((targetInformations = self->_targetInformations, !((unint64_t)targetInformations | v4[4]))
     || -[NSMutableArray isEqual:](targetInformations, "isEqual:")))
  {
    keyConfiguration = self->_keyConfiguration;
    if ((unint64_t)keyConfiguration | v4[3])
      v7 = -[NSData isEqual:](keyConfiguration, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = (2654435761u * self->_configurationDeliveryEnd) ^ (2654435761u * self->_configurationDeliveryStart);
  v4 = -[NSMutableArray hash](self->_targetInformations, "hash");
  return v3 ^ v4 ^ -[NSData hash](self->_keyConfiguration, "hash");
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
  self->_configurationDeliveryStart = *((_QWORD *)v4 + 2);
  self->_configurationDeliveryEnd = *((_QWORD *)v4 + 1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 4);
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
        -[NSPPrivacyProxyTransparencyOHTTPEntry addTargetInformation:](self, "addTargetInformation:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 3))
    -[NSPPrivacyProxyTransparencyOHTTPEntry setKeyConfiguration:](self, "setKeyConfiguration:");

}

- (unint64_t)configurationDeliveryStart
{
  return self->_configurationDeliveryStart;
}

- (void)setConfigurationDeliveryStart:(unint64_t)a3
{
  self->_configurationDeliveryStart = a3;
}

- (unint64_t)configurationDeliveryEnd
{
  return self->_configurationDeliveryEnd;
}

- (void)setConfigurationDeliveryEnd:(unint64_t)a3
{
  self->_configurationDeliveryEnd = a3;
}

- (NSMutableArray)targetInformations
{
  return self->_targetInformations;
}

- (void)setTargetInformations:(id)a3
{
  objc_storeStrong((id *)&self->_targetInformations, a3);
}

- (NSData)keyConfiguration
{
  return self->_keyConfiguration;
}

- (void)setKeyConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_keyConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetInformations, 0);
  objc_storeStrong((id *)&self->_keyConfiguration, 0);
}

@end
