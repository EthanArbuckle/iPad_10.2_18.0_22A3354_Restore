@implementation NSSProfilesInfoRespMsg

- (BOOL)hasMdmProfile
{
  return self->_mdmProfile != 0;
}

- (void)clearConfigProfiles
{
  -[NSMutableArray removeAllObjects](self->_configProfiles, "removeAllObjects");
}

- (void)addConfigProfile:(id)a3
{
  id v4;
  NSMutableArray *configProfiles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  configProfiles = self->_configProfiles;
  v8 = v4;
  if (!configProfiles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_configProfiles;
    self->_configProfiles = v6;

    v4 = v8;
    configProfiles = self->_configProfiles;
  }
  -[NSMutableArray addObject:](configProfiles, "addObject:", v4);

}

- (unint64_t)configProfilesCount
{
  return -[NSMutableArray count](self->_configProfiles, "count");
}

- (id)configProfileAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_configProfiles, "objectAtIndex:", a3);
}

+ (Class)configProfileType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasManagedAppsData
{
  return self->_managedAppsData != 0;
}

- (BOOL)hasRmAccountData
{
  return self->_rmAccountData != 0;
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
  v8.super_class = (Class)NSSProfilesInfoRespMsg;
  -[NSSProfilesInfoRespMsg description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSProfilesInfoRespMsg dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSSProfilesInfoRespMsgProfileInfo *mdmProfile;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSData *managedAppsData;
  NSData *rmAccountData;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  mdmProfile = self->_mdmProfile;
  if (mdmProfile)
  {
    -[NSSProfilesInfoRespMsgProfileInfo dictionaryRepresentation](mdmProfile, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mdmProfile"));

  }
  if (-[NSMutableArray count](self->_configProfiles, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_configProfiles, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_configProfiles;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("configProfile"));
  }
  managedAppsData = self->_managedAppsData;
  if (managedAppsData)
    objc_msgSend(v3, "setObject:forKey:", managedAppsData, CFSTR("managedAppsData"));
  rmAccountData = self->_rmAccountData;
  if (rmAccountData)
    objc_msgSend(v3, "setObject:forKey:", rmAccountData, CFSTR("rmAccountData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSProfilesInfoRespMsgReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_mdmProfile)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_configProfiles;
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

  if (self->_managedAppsData)
    PBDataWriterWriteDataField();
  if (self->_rmAccountData)
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
  if (self->_mdmProfile)
    objc_msgSend(v9, "setMdmProfile:");
  if (-[NSSProfilesInfoRespMsg configProfilesCount](self, "configProfilesCount"))
  {
    objc_msgSend(v9, "clearConfigProfiles");
    v4 = -[NSSProfilesInfoRespMsg configProfilesCount](self, "configProfilesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NSSProfilesInfoRespMsg configProfileAtIndex:](self, "configProfileAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addConfigProfile:", v7);

      }
    }
  }
  if (self->_managedAppsData)
    objc_msgSend(v9, "setManagedAppsData:");
  v8 = v9;
  if (self->_rmAccountData)
  {
    objc_msgSend(v9, "setRmAccountData:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSSProfilesInfoRespMsgProfileInfo copyWithZone:](self->_mdmProfile, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_configProfiles;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addConfigProfile:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v14 = -[NSData copyWithZone:](self->_managedAppsData, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v16 = -[NSData copyWithZone:](self->_rmAccountData, "copyWithZone:", a3);
  v17 = (void *)v5[4];
  v5[4] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSSProfilesInfoRespMsgProfileInfo *mdmProfile;
  NSMutableArray *configProfiles;
  NSData *managedAppsData;
  NSData *rmAccountData;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((mdmProfile = self->_mdmProfile, !((unint64_t)mdmProfile | v4[3]))
     || -[NSSProfilesInfoRespMsgProfileInfo isEqual:](mdmProfile, "isEqual:"))
    && ((configProfiles = self->_configProfiles, !((unint64_t)configProfiles | v4[1]))
     || -[NSMutableArray isEqual:](configProfiles, "isEqual:"))
    && ((managedAppsData = self->_managedAppsData, !((unint64_t)managedAppsData | v4[2]))
     || -[NSData isEqual:](managedAppsData, "isEqual:")))
  {
    rmAccountData = self->_rmAccountData;
    if ((unint64_t)rmAccountData | v4[4])
      v9 = -[NSData isEqual:](rmAccountData, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSSProfilesInfoRespMsgProfileInfo hash](self->_mdmProfile, "hash");
  v4 = -[NSMutableArray hash](self->_configProfiles, "hash") ^ v3;
  v5 = -[NSData hash](self->_managedAppsData, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_rmAccountData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NSSProfilesInfoRespMsgProfileInfo *mdmProfile;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  mdmProfile = self->_mdmProfile;
  v6 = *((_QWORD *)v4 + 3);
  if (mdmProfile)
  {
    if (v6)
      -[NSSProfilesInfoRespMsgProfileInfo mergeFrom:](mdmProfile, "mergeFrom:");
  }
  else if (v6)
  {
    -[NSSProfilesInfoRespMsg setMdmProfile:](self, "setMdmProfile:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[NSSProfilesInfoRespMsg addConfigProfile:](self, "addConfigProfile:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 2))
    -[NSSProfilesInfoRespMsg setManagedAppsData:](self, "setManagedAppsData:");
  if (*((_QWORD *)v4 + 4))
    -[NSSProfilesInfoRespMsg setRmAccountData:](self, "setRmAccountData:");

}

- (NSSProfilesInfoRespMsgProfileInfo)mdmProfile
{
  return self->_mdmProfile;
}

- (void)setMdmProfile:(id)a3
{
  objc_storeStrong((id *)&self->_mdmProfile, a3);
}

- (NSMutableArray)configProfiles
{
  return self->_configProfiles;
}

- (void)setConfigProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_configProfiles, a3);
}

- (NSData)managedAppsData
{
  return self->_managedAppsData;
}

- (void)setManagedAppsData:(id)a3
{
  objc_storeStrong((id *)&self->_managedAppsData, a3);
}

- (NSData)rmAccountData
{
  return self->_rmAccountData;
}

- (void)setRmAccountData:(id)a3
{
  objc_storeStrong((id *)&self->_rmAccountData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmAccountData, 0);
  objc_storeStrong((id *)&self->_mdmProfile, 0);
  objc_storeStrong((id *)&self->_managedAppsData, 0);
  objc_storeStrong((id *)&self->_configProfiles, 0);
}

@end
