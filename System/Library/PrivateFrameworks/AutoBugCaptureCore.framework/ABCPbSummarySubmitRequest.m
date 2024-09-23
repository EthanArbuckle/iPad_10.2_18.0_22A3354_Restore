@implementation ABCPbSummarySubmitRequest

- (void)setVer:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ver = a3;
}

- (void)setHasVer:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVer
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasBuildPlatform
{
  return self->_buildPlatform != 0;
}

- (BOOL)hasDeviceCategory
{
  return self->_deviceCategory != 0;
}

- (void)clearSigRequests
{
  -[NSMutableArray removeAllObjects](self->_sigRequests, "removeAllObjects");
}

- (void)addSigRequest:(id)a3
{
  id v4;
  NSMutableArray *sigRequests;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sigRequests = self->_sigRequests;
  v8 = v4;
  if (!sigRequests)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sigRequests;
    self->_sigRequests = v6;

    v4 = v8;
    sigRequests = self->_sigRequests;
  }
  -[NSMutableArray addObject:](sigRequests, "addObject:", v4);

}

- (unint64_t)sigRequestsCount
{
  return -[NSMutableArray count](self->_sigRequests, "count");
}

- (id)sigRequestAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sigRequests, "objectAtIndex:", a3);
}

+ (Class)sigRequestType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSummarySubmitRequest;
  -[ABCPbSummarySubmitRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCPbSummarySubmitRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *deviceModel;
  NSString *buildPlatform;
  NSString *deviceCategory;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ver);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("ver"));

  }
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v3, "setObject:forKey:", deviceModel, CFSTR("device_model"));
  buildPlatform = self->_buildPlatform;
  if (buildPlatform)
    objc_msgSend(v3, "setObject:forKey:", buildPlatform, CFSTR("build_platform"));
  deviceCategory = self->_deviceCategory;
  if (deviceCategory)
    objc_msgSend(v3, "setObject:forKey:", deviceCategory, CFSTR("device_Category"));
  if (-[NSMutableArray count](self->_sigRequests, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_sigRequests, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_sigRequests;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("sig_request"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSummarySubmitRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_deviceModel)
    PBDataWriterWriteStringField();
  if (self->_buildPlatform)
    PBDataWriterWriteStringField();
  if (self->_deviceCategory)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_sigRequests;
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
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[10] = self->_ver;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  v9 = v4;
  if (self->_deviceModel)
    objc_msgSend(v4, "setDeviceModel:");
  if (self->_buildPlatform)
    objc_msgSend(v9, "setBuildPlatform:");
  if (self->_deviceCategory)
    objc_msgSend(v9, "setDeviceCategory:");
  if (-[ABCPbSummarySubmitRequest sigRequestsCount](self, "sigRequestsCount"))
  {
    objc_msgSend(v9, "clearSigRequests");
    v5 = -[ABCPbSummarySubmitRequest sigRequestsCount](self, "sigRequestsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ABCPbSummarySubmitRequest sigRequestAtIndex:](self, "sigRequestAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSigRequest:", v8);

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
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_ver;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[NSString copyWithZone:](self->_buildPlatform, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[NSString copyWithZone:](self->_deviceCategory, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_sigRequests;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v6, "addSigRequest:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *deviceModel;
  NSString *buildPlatform;
  NSString *deviceCategory;
  NSMutableArray *sigRequests;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_ver != *((_DWORD *)v4 + 10))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](deviceModel, "isEqual:"))
  {
    goto LABEL_15;
  }
  buildPlatform = self->_buildPlatform;
  if ((unint64_t)buildPlatform | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](buildPlatform, "isEqual:"))
      goto LABEL_15;
  }
  deviceCategory = self->_deviceCategory;
  if ((unint64_t)deviceCategory | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceCategory, "isEqual:"))
      goto LABEL_15;
  }
  sigRequests = self->_sigRequests;
  if ((unint64_t)sigRequests | *((_QWORD *)v4 + 4))
    v9 = -[NSMutableArray isEqual:](sigRequests, "isEqual:");
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
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_ver;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_deviceModel, "hash") ^ v3;
  v5 = -[NSString hash](self->_buildPlatform, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_deviceCategory, "hash");
  return v6 ^ -[NSMutableArray hash](self->_sigRequests, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[11] & 1) != 0)
  {
    self->_ver = v4[10];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
    -[ABCPbSummarySubmitRequest setDeviceModel:](self, "setDeviceModel:");
  if (*((_QWORD *)v5 + 1))
    -[ABCPbSummarySubmitRequest setBuildPlatform:](self, "setBuildPlatform:");
  if (*((_QWORD *)v5 + 2))
    -[ABCPbSummarySubmitRequest setDeviceCategory:](self, "setDeviceCategory:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v5 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[ABCPbSummarySubmitRequest addSigRequest:](self, "addSigRequest:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (unsigned)ver
{
  return self->_ver;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (NSString)buildPlatform
{
  return self->_buildPlatform;
}

- (void)setBuildPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_buildPlatform, a3);
}

- (NSString)deviceCategory
{
  return self->_deviceCategory;
}

- (void)setDeviceCategory:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCategory, a3);
}

- (NSMutableArray)sigRequests
{
  return self->_sigRequests;
}

- (void)setSigRequests:(id)a3
{
  objc_storeStrong((id *)&self->_sigRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigRequests, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceCategory, 0);
  objc_storeStrong((id *)&self->_buildPlatform, 0);
}

@end
