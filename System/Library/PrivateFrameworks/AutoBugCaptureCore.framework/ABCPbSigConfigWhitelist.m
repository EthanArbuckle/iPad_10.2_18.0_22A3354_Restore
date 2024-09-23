@implementation ABCPbSigConfigWhitelist

- (int)globalDecision
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_globalDecision;
  else
    return 0;
}

- (void)setGlobalDecision:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_globalDecision = a3;
}

- (void)setHasGlobalDecision:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGlobalDecision
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)globalDecisionAsString:(int)a3
{
  if (a3 < 3)
    return off_1EA3B62D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGlobalDecision:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_WHITELIST")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USE_OLD_ONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FOLLOW_SIG_CONFIG")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (BOOL)hasBuildVariant
{
  return self->_buildVariant != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (void)clearSigConfigs
{
  -[NSMutableArray removeAllObjects](self->_sigConfigs, "removeAllObjects");
}

- (void)addSigConfig:(id)a3
{
  id v4;
  NSMutableArray *sigConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sigConfigs = self->_sigConfigs;
  v8 = v4;
  if (!sigConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sigConfigs;
    self->_sigConfigs = v6;

    v4 = v8;
    sigConfigs = self->_sigConfigs;
  }
  -[NSMutableArray addObject:](sigConfigs, "addObject:", v4);

}

- (unint64_t)sigConfigsCount
{
  return -[NSMutableArray count](self->_sigConfigs, "count");
}

- (id)sigConfigAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sigConfigs, "objectAtIndex:", a3);
}

+ (Class)sigConfigType
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
  v8.super_class = (Class)ABCPbSigConfigWhitelist;
  -[ABCPbSigConfigWhitelist description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCPbSigConfigWhitelist dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t globalDecision;
  __CFString *v5;
  NSString *build;
  NSString *buildVariant;
  NSString *deviceModel;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    globalDecision = self->_globalDecision;
    if (globalDecision >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_globalDecision);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1EA3B62D0[globalDecision];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("global_decision"));

  }
  build = self->_build;
  if (build)
    objc_msgSend(v3, "setObject:forKey:", build, CFSTR("build"));
  buildVariant = self->_buildVariant;
  if (buildVariant)
    objc_msgSend(v3, "setObject:forKey:", buildVariant, CFSTR("build_variant"));
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v3, "setObject:forKey:", deviceModel, CFSTR("device_model"));
  if (-[NSMutableArray count](self->_sigConfigs, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_sigConfigs, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_sigConfigs;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sig_config"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSigConfigWhitelistReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
  if (self->_build)
    PBDataWriterWriteStringField();
  if (self->_buildVariant)
    PBDataWriterWriteStringField();
  if (self->_deviceModel)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_sigConfigs;
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
    v4[8] = self->_globalDecision;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v9 = v4;
  if (self->_build)
    objc_msgSend(v4, "setBuild:");
  if (self->_buildVariant)
    objc_msgSend(v9, "setBuildVariant:");
  if (self->_deviceModel)
    objc_msgSend(v9, "setDeviceModel:");
  if (-[ABCPbSigConfigWhitelist sigConfigsCount](self, "sigConfigsCount"))
  {
    objc_msgSend(v9, "clearSigConfigs");
    v5 = -[ABCPbSigConfigWhitelist sigConfigsCount](self, "sigConfigsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ABCPbSigConfigWhitelist sigConfigAtIndex:](self, "sigConfigAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSigConfig:", v8);

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
    *(_DWORD *)(v5 + 32) = self->_globalDecision;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSString copyWithZone:](self->_buildVariant, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_sigConfigs;
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
        objc_msgSend(v6, "addSigConfig:", v18);

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
  NSString *build;
  NSString *buildVariant;
  NSString *deviceModel;
  NSMutableArray *sigConfigs;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_globalDecision != *((_DWORD *)v4 + 8))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  build = self->_build;
  if ((unint64_t)build | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](build, "isEqual:"))
    goto LABEL_15;
  buildVariant = self->_buildVariant;
  if ((unint64_t)buildVariant | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](buildVariant, "isEqual:"))
      goto LABEL_15;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:"))
      goto LABEL_15;
  }
  sigConfigs = self->_sigConfigs;
  if ((unint64_t)sigConfigs | *((_QWORD *)v4 + 5))
    v9 = -[NSMutableArray isEqual:](sigConfigs, "isEqual:");
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
    v3 = 2654435761 * self->_globalDecision;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_build, "hash") ^ v3;
  v5 = -[NSString hash](self->_buildVariant, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_deviceModel, "hash");
  return v6 ^ -[NSMutableArray hash](self->_sigConfigs, "hash");
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
  if ((v4[12] & 1) != 0)
  {
    self->_globalDecision = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
    -[ABCPbSigConfigWhitelist setBuild:](self, "setBuild:");
  if (*((_QWORD *)v5 + 2))
    -[ABCPbSigConfigWhitelist setBuildVariant:](self, "setBuildVariant:");
  if (*((_QWORD *)v5 + 3))
    -[ABCPbSigConfigWhitelist setDeviceModel:](self, "setDeviceModel:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v5 + 5);
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
        -[ABCPbSigConfigWhitelist addSigConfig:](self, "addSigConfig:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (NSString)buildVariant
{
  return self->_buildVariant;
}

- (void)setBuildVariant:(id)a3
{
  objc_storeStrong((id *)&self->_buildVariant, a3);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (NSMutableArray)sigConfigs
{
  return self->_sigConfigs;
}

- (void)setSigConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_sigConfigs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigConfigs, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_buildVariant, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end
