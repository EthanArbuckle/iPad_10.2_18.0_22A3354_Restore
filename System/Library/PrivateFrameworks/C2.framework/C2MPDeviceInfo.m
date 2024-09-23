@implementation C2MPDeviceInfo

- (void)setProcessUuid:(id)a3
{
  objc_storeStrong((id *)&self->_processUuid, a3);
}

- (void)setUserDefaultTestName:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaultTestName, a3);
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (void)setProductName:(id)a3
{
  objc_storeStrong((id *)&self->_productName, a3);
}

- (void)setProductBuild:(id)a3
{
  objc_storeStrong((id *)&self->_productBuild, a3);
}

- (void)setProcessVersion:(id)a3
{
  objc_storeStrong((id *)&self->_processVersion, a3);
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (void)setIsAppleInternal:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isAppleInternal = a3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *productName;
  NSString *productType;
  NSString *productVersion;
  NSString *productBuild;
  void *v9;
  NSString *processName;
  NSString *processVersion;
  NSString *processUuid;
  NSString *userDefaultTestName;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  productName = self->_productName;
  if (productName)
    objc_msgSend(v3, "setObject:forKey:", productName, CFSTR("product_name"));
  productType = self->_productType;
  if (productType)
    objc_msgSend(v4, "setObject:forKey:", productType, CFSTR("product_type"));
  productVersion = self->_productVersion;
  if (productVersion)
    objc_msgSend(v4, "setObject:forKey:", productVersion, CFSTR("product_version"));
  productBuild = self->_productBuild;
  if (productBuild)
    objc_msgSend(v4, "setObject:forKey:", productBuild, CFSTR("product_build"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAppleInternal);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("is_apple_internal"));

  }
  processName = self->_processName;
  if (processName)
    objc_msgSend(v4, "setObject:forKey:", processName, CFSTR("process_name"));
  processVersion = self->_processVersion;
  if (processVersion)
    objc_msgSend(v4, "setObject:forKey:", processVersion, CFSTR("process_version"));
  processUuid = self->_processUuid;
  if (processUuid)
    objc_msgSend(v4, "setObject:forKey:", processUuid, CFSTR("process_uuid"));
  userDefaultTestName = self->_userDefaultTestName;
  if (userDefaultTestName)
    objc_msgSend(v4, "setObject:forKey:", userDefaultTestName, CFSTR("user_default_test_name"));
  if (-[NSMutableArray count](self->_internalTestConfigs, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_internalTestConfigs, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = self->_internalTestConfigs;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("internal_test_config"));
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultTestName, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productBuild, 0);
  objc_storeStrong((id *)&self->_processVersion, 0);
  objc_storeStrong((id *)&self->_processUuid, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_internalTestConfigs, 0);
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
  if (self->_productName)
    PBDataWriterWriteStringField();
  if (self->_productType)
    PBDataWriterWriteStringField();
  if (self->_productVersion)
    PBDataWriterWriteStringField();
  if (self->_productBuild)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_processName)
    PBDataWriterWriteStringField();
  if (self->_processVersion)
    PBDataWriterWriteStringField();
  if (self->_processUuid)
    PBDataWriterWriteStringField();
  if (self->_userDefaultTestName)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_internalTestConfigs;
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

- (BOOL)hasProductName
{
  return self->_productName != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasProductVersion
{
  return self->_productVersion != 0;
}

- (BOOL)hasProductBuild
{
  return self->_productBuild != 0;
}

- (void)setHasIsAppleInternal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsAppleInternal
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasProcessName
{
  return self->_processName != 0;
}

- (BOOL)hasProcessVersion
{
  return self->_processVersion != 0;
}

- (BOOL)hasProcessUuid
{
  return self->_processUuid != 0;
}

- (BOOL)hasUserDefaultTestName
{
  return self->_userDefaultTestName != 0;
}

- (void)clearInternalTestConfigs
{
  -[NSMutableArray removeAllObjects](self->_internalTestConfigs, "removeAllObjects");
}

- (void)addInternalTestConfig:(id)a3
{
  id v4;
  NSMutableArray *internalTestConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  internalTestConfigs = self->_internalTestConfigs;
  v8 = v4;
  if (!internalTestConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_internalTestConfigs;
    self->_internalTestConfigs = v6;

    v4 = v8;
    internalTestConfigs = self->_internalTestConfigs;
  }
  -[NSMutableArray addObject:](internalTestConfigs, "addObject:", v4);

}

- (unint64_t)internalTestConfigsCount
{
  return -[NSMutableArray count](self->_internalTestConfigs, "count");
}

- (id)internalTestConfigAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_internalTestConfigs, "objectAtIndex:", a3);
}

+ (Class)internalTestConfigType
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
  v8.super_class = (Class)C2MPDeviceInfo;
  -[C2MPDeviceInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPDeviceInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPDeviceInfoReadFrom(self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _BYTE *v9;

  v4 = a3;
  v9 = v4;
  if (self->_productName)
  {
    objc_msgSend(v4, "setProductName:");
    v4 = v9;
  }
  if (self->_productType)
  {
    objc_msgSend(v9, "setProductType:");
    v4 = v9;
  }
  if (self->_productVersion)
  {
    objc_msgSend(v9, "setProductVersion:");
    v4 = v9;
  }
  if (self->_productBuild)
  {
    objc_msgSend(v9, "setProductBuild:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[80] = self->_isAppleInternal;
    v4[84] |= 1u;
  }
  if (self->_processName)
    objc_msgSend(v9, "setProcessName:");
  if (self->_processVersion)
    objc_msgSend(v9, "setProcessVersion:");
  if (self->_processUuid)
    objc_msgSend(v9, "setProcessUuid:");
  if (self->_userDefaultTestName)
    objc_msgSend(v9, "setUserDefaultTestName:");
  if (-[C2MPDeviceInfo internalTestConfigsCount](self, "internalTestConfigsCount"))
  {
    objc_msgSend(v9, "clearInternalTestConfigs");
    v5 = -[C2MPDeviceInfo internalTestConfigsCount](self, "internalTestConfigsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[C2MPDeviceInfo internalTestConfigAtIndex:](self, "internalTestConfigAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addInternalTestConfig:", v8);

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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_productName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_productVersion, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v10;

  v12 = -[NSString copyWithZone:](self->_productBuild, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_isAppleInternal;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v14 = -[NSString copyWithZone:](self->_processName, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  v16 = -[NSString copyWithZone:](self->_processVersion, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  v18 = -[NSString copyWithZone:](self->_processUuid, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v18;

  v20 = -[NSString copyWithZone:](self->_userDefaultTestName, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v20;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = self->_internalTestConfigs;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v26), "copyWithZone:", a3, (_QWORD)v29);
        objc_msgSend((id)v5, "addInternalTestConfig:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v24);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *productName;
  NSString *productType;
  NSString *productVersion;
  NSString *productBuild;
  NSString *processName;
  NSString *processVersion;
  NSString *processUuid;
  NSString *userDefaultTestName;
  NSMutableArray *internalTestConfigs;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  productName = self->_productName;
  if ((unint64_t)productName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](productName, "isEqual:"))
      goto LABEL_28;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](productType, "isEqual:"))
      goto LABEL_28;
  }
  productVersion = self->_productVersion;
  if ((unint64_t)productVersion | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](productVersion, "isEqual:"))
      goto LABEL_28;
  }
  productBuild = self->_productBuild;
  if ((unint64_t)productBuild | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](productBuild, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) != 0)
    {
      if (self->_isAppleInternal)
      {
        if (!*((_BYTE *)v4 + 80))
          goto LABEL_28;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_18;
    }
LABEL_28:
    v14 = 0;
    goto LABEL_29;
  }
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
    goto LABEL_28;
LABEL_18:
  processName = self->_processName;
  if ((unint64_t)processName | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](processName, "isEqual:"))
  {
    goto LABEL_28;
  }
  processVersion = self->_processVersion;
  if ((unint64_t)processVersion | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](processVersion, "isEqual:"))
      goto LABEL_28;
  }
  processUuid = self->_processUuid;
  if ((unint64_t)processUuid | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](processUuid, "isEqual:"))
      goto LABEL_28;
  }
  userDefaultTestName = self->_userDefaultTestName;
  if ((unint64_t)userDefaultTestName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](userDefaultTestName, "isEqual:"))
      goto LABEL_28;
  }
  internalTestConfigs = self->_internalTestConfigs;
  if ((unint64_t)internalTestConfigs | *((_QWORD *)v4 + 1))
    v14 = -[NSMutableArray isEqual:](internalTestConfigs, "isEqual:");
  else
    v14 = 1;
LABEL_29:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_productName, "hash");
  v4 = -[NSString hash](self->_productType, "hash");
  v5 = -[NSString hash](self->_productVersion, "hash");
  v6 = -[NSString hash](self->_productBuild, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_isAppleInternal;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSString hash](self->_processName, "hash");
  v10 = v8 ^ v9 ^ -[NSString hash](self->_processVersion, "hash");
  v11 = -[NSString hash](self->_processUuid, "hash");
  v12 = v11 ^ -[NSString hash](self->_userDefaultTestName, "hash");
  return v10 ^ v12 ^ -[NSMutableArray hash](self->_internalTestConfigs, "hash");
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
  if (*((_QWORD *)v4 + 6))
    -[C2MPDeviceInfo setProductName:](self, "setProductName:");
  if (*((_QWORD *)v4 + 7))
    -[C2MPDeviceInfo setProductType:](self, "setProductType:");
  if (*((_QWORD *)v4 + 8))
    -[C2MPDeviceInfo setProductVersion:](self, "setProductVersion:");
  if (*((_QWORD *)v4 + 5))
    -[C2MPDeviceInfo setProductBuild:](self, "setProductBuild:");
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    self->_isAppleInternal = *((_BYTE *)v4 + 80);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[C2MPDeviceInfo setProcessName:](self, "setProcessName:");
  if (*((_QWORD *)v4 + 4))
    -[C2MPDeviceInfo setProcessVersion:](self, "setProcessVersion:");
  if (*((_QWORD *)v4 + 3))
    -[C2MPDeviceInfo setProcessUuid:](self, "setProcessUuid:");
  if (*((_QWORD *)v4 + 9))
    -[C2MPDeviceInfo setUserDefaultTestName:](self, "setUserDefaultTestName:");
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
        -[C2MPDeviceInfo addInternalTestConfig:](self, "addInternalTestConfig:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)productBuild
{
  return self->_productBuild;
}

- (BOOL)isAppleInternal
{
  return self->_isAppleInternal;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)processVersion
{
  return self->_processVersion;
}

- (NSString)processUuid
{
  return self->_processUuid;
}

- (NSString)userDefaultTestName
{
  return self->_userDefaultTestName;
}

- (NSMutableArray)internalTestConfigs
{
  return self->_internalTestConfigs;
}

- (void)setInternalTestConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_internalTestConfigs, a3);
}

@end
