@implementation _MRAVModifyOutputContextRequestProtobuf

- (int)outputContextType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_outputContextType;
  else
    return 0;
}

- (void)setOutputContextType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_outputContextType = a3;
}

- (void)setHasOutputContextType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOutputContextType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)outputContextTypeAsString:(int)a3
{
  if (a3 < 6)
    return *(&off_1E30D05A8 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOutputContextType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SharedAudioPresentation")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SharedSystemAudio")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SharedSystemScreen")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iTunesAudio")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Auxiliary")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearAddingOutputDeviceUIDs
{
  -[NSMutableArray removeAllObjects](self->_addingOutputDeviceUIDs, "removeAllObjects");
}

- (void)addAddingOutputDeviceUID:(id)a3
{
  id v4;
  NSMutableArray *addingOutputDeviceUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  addingOutputDeviceUIDs = self->_addingOutputDeviceUIDs;
  v8 = v4;
  if (!addingOutputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_addingOutputDeviceUIDs;
    self->_addingOutputDeviceUIDs = v6;

    v4 = v8;
    addingOutputDeviceUIDs = self->_addingOutputDeviceUIDs;
  }
  -[NSMutableArray addObject:](addingOutputDeviceUIDs, "addObject:", v4);

}

- (unint64_t)addingOutputDeviceUIDsCount
{
  return -[NSMutableArray count](self->_addingOutputDeviceUIDs, "count");
}

- (id)addingOutputDeviceUIDAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_addingOutputDeviceUIDs, "objectAtIndex:", a3);
}

+ (Class)addingOutputDeviceUIDType
{
  return (Class)objc_opt_class();
}

- (void)clearRemovingOutputDeviceUIDs
{
  -[NSMutableArray removeAllObjects](self->_removingOutputDeviceUIDs, "removeAllObjects");
}

- (void)addRemovingOutputDeviceUID:(id)a3
{
  id v4;
  NSMutableArray *removingOutputDeviceUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  removingOutputDeviceUIDs = self->_removingOutputDeviceUIDs;
  v8 = v4;
  if (!removingOutputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_removingOutputDeviceUIDs;
    self->_removingOutputDeviceUIDs = v6;

    v4 = v8;
    removingOutputDeviceUIDs = self->_removingOutputDeviceUIDs;
  }
  -[NSMutableArray addObject:](removingOutputDeviceUIDs, "addObject:", v4);

}

- (unint64_t)removingOutputDeviceUIDsCount
{
  return -[NSMutableArray count](self->_removingOutputDeviceUIDs, "count");
}

- (id)removingOutputDeviceUIDAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_removingOutputDeviceUIDs, "objectAtIndex:", a3);
}

+ (Class)removingOutputDeviceUIDType
{
  return (Class)objc_opt_class();
}

- (void)clearSettingOutputDeviceUIDs
{
  -[NSMutableArray removeAllObjects](self->_settingOutputDeviceUIDs, "removeAllObjects");
}

- (void)addSettingOutputDeviceUID:(id)a3
{
  id v4;
  NSMutableArray *settingOutputDeviceUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  settingOutputDeviceUIDs = self->_settingOutputDeviceUIDs;
  v8 = v4;
  if (!settingOutputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_settingOutputDeviceUIDs;
    self->_settingOutputDeviceUIDs = v6;

    v4 = v8;
    settingOutputDeviceUIDs = self->_settingOutputDeviceUIDs;
  }
  -[NSMutableArray addObject:](settingOutputDeviceUIDs, "addObject:", v4);

}

- (unint64_t)settingOutputDeviceUIDsCount
{
  return -[NSMutableArray count](self->_settingOutputDeviceUIDs, "count");
}

- (id)settingOutputDeviceUIDAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_settingOutputDeviceUIDs, "objectAtIndex:", a3);
}

+ (Class)settingOutputDeviceUIDType
{
  return (Class)objc_opt_class();
}

- (void)clearClusterAwareAddingOutputDeviceUIDs
{
  -[NSMutableArray removeAllObjects](self->_clusterAwareAddingOutputDeviceUIDs, "removeAllObjects");
}

- (void)addClusterAwareAddingOutputDeviceUID:(id)a3
{
  id v4;
  NSMutableArray *clusterAwareAddingOutputDeviceUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  clusterAwareAddingOutputDeviceUIDs = self->_clusterAwareAddingOutputDeviceUIDs;
  v8 = v4;
  if (!clusterAwareAddingOutputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_clusterAwareAddingOutputDeviceUIDs;
    self->_clusterAwareAddingOutputDeviceUIDs = v6;

    v4 = v8;
    clusterAwareAddingOutputDeviceUIDs = self->_clusterAwareAddingOutputDeviceUIDs;
  }
  -[NSMutableArray addObject:](clusterAwareAddingOutputDeviceUIDs, "addObject:", v4);

}

- (unint64_t)clusterAwareAddingOutputDeviceUIDsCount
{
  return -[NSMutableArray count](self->_clusterAwareAddingOutputDeviceUIDs, "count");
}

- (id)clusterAwareAddingOutputDeviceUIDAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_clusterAwareAddingOutputDeviceUIDs, "objectAtIndex:", a3);
}

+ (Class)clusterAwareAddingOutputDeviceUIDType
{
  return (Class)objc_opt_class();
}

- (void)clearClusterAwareRemovingOutputDeviceUIDs
{
  -[NSMutableArray removeAllObjects](self->_clusterAwareRemovingOutputDeviceUIDs, "removeAllObjects");
}

- (void)addClusterAwareRemovingOutputDeviceUID:(id)a3
{
  id v4;
  NSMutableArray *clusterAwareRemovingOutputDeviceUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  clusterAwareRemovingOutputDeviceUIDs = self->_clusterAwareRemovingOutputDeviceUIDs;
  v8 = v4;
  if (!clusterAwareRemovingOutputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_clusterAwareRemovingOutputDeviceUIDs;
    self->_clusterAwareRemovingOutputDeviceUIDs = v6;

    v4 = v8;
    clusterAwareRemovingOutputDeviceUIDs = self->_clusterAwareRemovingOutputDeviceUIDs;
  }
  -[NSMutableArray addObject:](clusterAwareRemovingOutputDeviceUIDs, "addObject:", v4);

}

- (unint64_t)clusterAwareRemovingOutputDeviceUIDsCount
{
  return -[NSMutableArray count](self->_clusterAwareRemovingOutputDeviceUIDs, "count");
}

- (id)clusterAwareRemovingOutputDeviceUIDAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_clusterAwareRemovingOutputDeviceUIDs, "objectAtIndex:", a3);
}

+ (Class)clusterAwareRemovingOutputDeviceUIDType
{
  return (Class)objc_opt_class();
}

- (void)clearClusterAwareSettingOutputDeviceUIDs
{
  -[NSMutableArray removeAllObjects](self->_clusterAwareSettingOutputDeviceUIDs, "removeAllObjects");
}

- (void)addClusterAwareSettingOutputDeviceUID:(id)a3
{
  id v4;
  NSMutableArray *clusterAwareSettingOutputDeviceUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  clusterAwareSettingOutputDeviceUIDs = self->_clusterAwareSettingOutputDeviceUIDs;
  v8 = v4;
  if (!clusterAwareSettingOutputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_clusterAwareSettingOutputDeviceUIDs;
    self->_clusterAwareSettingOutputDeviceUIDs = v6;

    v4 = v8;
    clusterAwareSettingOutputDeviceUIDs = self->_clusterAwareSettingOutputDeviceUIDs;
  }
  -[NSMutableArray addObject:](clusterAwareSettingOutputDeviceUIDs, "addObject:", v4);

}

- (unint64_t)clusterAwareSettingOutputDeviceUIDsCount
{
  return -[NSMutableArray count](self->_clusterAwareSettingOutputDeviceUIDs, "count");
}

- (id)clusterAwareSettingOutputDeviceUIDAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_clusterAwareSettingOutputDeviceUIDs, "objectAtIndex:", a3);
}

+ (Class)clusterAwareSettingOutputDeviceUIDType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRequest
{
  return self->_request != 0;
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
  v8.super_class = (Class)_MRAVModifyOutputContextRequestProtobuf;
  -[_MRAVModifyOutputContextRequestProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVModifyOutputContextRequestProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t outputContextType;
  void *v5;
  NSMutableArray *addingOutputDeviceUIDs;
  NSMutableArray *removingOutputDeviceUIDs;
  NSMutableArray *settingOutputDeviceUIDs;
  NSMutableArray *clusterAwareAddingOutputDeviceUIDs;
  NSMutableArray *clusterAwareRemovingOutputDeviceUIDs;
  NSMutableArray *clusterAwareSettingOutputDeviceUIDs;
  _MRGroupTopologyModificationRequestProtobuf *request;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    outputContextType = self->_outputContextType;
    if (outputContextType >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_outputContextType);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E30D05A8 + outputContextType);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("outputContextType"));

  }
  addingOutputDeviceUIDs = self->_addingOutputDeviceUIDs;
  if (addingOutputDeviceUIDs)
    objc_msgSend(v3, "setObject:forKey:", addingOutputDeviceUIDs, CFSTR("addingOutputDeviceUID"));
  removingOutputDeviceUIDs = self->_removingOutputDeviceUIDs;
  if (removingOutputDeviceUIDs)
    objc_msgSend(v3, "setObject:forKey:", removingOutputDeviceUIDs, CFSTR("removingOutputDeviceUID"));
  settingOutputDeviceUIDs = self->_settingOutputDeviceUIDs;
  if (settingOutputDeviceUIDs)
    objc_msgSend(v3, "setObject:forKey:", settingOutputDeviceUIDs, CFSTR("settingOutputDeviceUID"));
  clusterAwareAddingOutputDeviceUIDs = self->_clusterAwareAddingOutputDeviceUIDs;
  if (clusterAwareAddingOutputDeviceUIDs)
    objc_msgSend(v3, "setObject:forKey:", clusterAwareAddingOutputDeviceUIDs, CFSTR("clusterAwareAddingOutputDeviceUID"));
  clusterAwareRemovingOutputDeviceUIDs = self->_clusterAwareRemovingOutputDeviceUIDs;
  if (clusterAwareRemovingOutputDeviceUIDs)
    objc_msgSend(v3, "setObject:forKey:", clusterAwareRemovingOutputDeviceUIDs, CFSTR("clusterAwareRemovingOutputDeviceUID"));
  clusterAwareSettingOutputDeviceUIDs = self->_clusterAwareSettingOutputDeviceUIDs;
  if (clusterAwareSettingOutputDeviceUIDs)
    objc_msgSend(v3, "setObject:forKey:", clusterAwareSettingOutputDeviceUIDs, CFSTR("clusterAwareSettingOutputDeviceUID"));
  request = self->_request;
  if (request)
  {
    -[_MRGroupTopologyModificationRequestProtobuf dictionaryRepresentation](request, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("request"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAVModifyOutputContextRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v5 = self->_addingOutputDeviceUIDs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v7);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = self->_removingOutputDeviceUIDs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v52;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v12);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v15 = self->_settingOutputDeviceUIDs;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v48;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    }
    while (v17);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v20 = self->_clusterAwareAddingOutputDeviceUIDs;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v44;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
    }
    while (v22);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v25 = self->_clusterAwareRemovingOutputDeviceUIDs;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteStringField();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
    }
    while (v27);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = self->_clusterAwareSettingOutputDeviceUIDs;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteStringField();
        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
    }
    while (v32);
  }

  if (self->_request)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t ii;
  void *v28;
  id v29;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[10] = self->_outputContextType;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  v29 = v4;
  if (-[_MRAVModifyOutputContextRequestProtobuf addingOutputDeviceUIDsCount](self, "addingOutputDeviceUIDsCount"))
  {
    objc_msgSend(v29, "clearAddingOutputDeviceUIDs");
    v5 = -[_MRAVModifyOutputContextRequestProtobuf addingOutputDeviceUIDsCount](self, "addingOutputDeviceUIDsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[_MRAVModifyOutputContextRequestProtobuf addingOutputDeviceUIDAtIndex:](self, "addingOutputDeviceUIDAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addAddingOutputDeviceUID:", v8);

      }
    }
  }
  if (-[_MRAVModifyOutputContextRequestProtobuf removingOutputDeviceUIDsCount](self, "removingOutputDeviceUIDsCount"))
  {
    objc_msgSend(v29, "clearRemovingOutputDeviceUIDs");
    v9 = -[_MRAVModifyOutputContextRequestProtobuf removingOutputDeviceUIDsCount](self, "removingOutputDeviceUIDsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[_MRAVModifyOutputContextRequestProtobuf removingOutputDeviceUIDAtIndex:](self, "removingOutputDeviceUIDAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addRemovingOutputDeviceUID:", v12);

      }
    }
  }
  if (-[_MRAVModifyOutputContextRequestProtobuf settingOutputDeviceUIDsCount](self, "settingOutputDeviceUIDsCount"))
  {
    objc_msgSend(v29, "clearSettingOutputDeviceUIDs");
    v13 = -[_MRAVModifyOutputContextRequestProtobuf settingOutputDeviceUIDsCount](self, "settingOutputDeviceUIDsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[_MRAVModifyOutputContextRequestProtobuf settingOutputDeviceUIDAtIndex:](self, "settingOutputDeviceUIDAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addSettingOutputDeviceUID:", v16);

      }
    }
  }
  if (-[_MRAVModifyOutputContextRequestProtobuf clusterAwareAddingOutputDeviceUIDsCount](self, "clusterAwareAddingOutputDeviceUIDsCount"))
  {
    objc_msgSend(v29, "clearClusterAwareAddingOutputDeviceUIDs");
    v17 = -[_MRAVModifyOutputContextRequestProtobuf clusterAwareAddingOutputDeviceUIDsCount](self, "clusterAwareAddingOutputDeviceUIDsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[_MRAVModifyOutputContextRequestProtobuf clusterAwareAddingOutputDeviceUIDAtIndex:](self, "clusterAwareAddingOutputDeviceUIDAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addClusterAwareAddingOutputDeviceUID:", v20);

      }
    }
  }
  if (-[_MRAVModifyOutputContextRequestProtobuf clusterAwareRemovingOutputDeviceUIDsCount](self, "clusterAwareRemovingOutputDeviceUIDsCount"))
  {
    objc_msgSend(v29, "clearClusterAwareRemovingOutputDeviceUIDs");
    v21 = -[_MRAVModifyOutputContextRequestProtobuf clusterAwareRemovingOutputDeviceUIDsCount](self, "clusterAwareRemovingOutputDeviceUIDsCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[_MRAVModifyOutputContextRequestProtobuf clusterAwareRemovingOutputDeviceUIDAtIndex:](self, "clusterAwareRemovingOutputDeviceUIDAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addClusterAwareRemovingOutputDeviceUID:", v24);

      }
    }
  }
  if (-[_MRAVModifyOutputContextRequestProtobuf clusterAwareSettingOutputDeviceUIDsCount](self, "clusterAwareSettingOutputDeviceUIDsCount"))
  {
    objc_msgSend(v29, "clearClusterAwareSettingOutputDeviceUIDs");
    v25 = -[_MRAVModifyOutputContextRequestProtobuf clusterAwareSettingOutputDeviceUIDsCount](self, "clusterAwareSettingOutputDeviceUIDsCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[_MRAVModifyOutputContextRequestProtobuf clusterAwareSettingOutputDeviceUIDAtIndex:](self, "clusterAwareSettingOutputDeviceUIDAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addClusterAwareSettingOutputDeviceUID:", v28);

      }
    }
  }
  if (self->_request)
    objc_msgSend(v29, "setRequest:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_outputContextType;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v7 = self->_addingOutputDeviceUIDs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v67;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v67 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addAddingOutputDeviceUID:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v9);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v13 = self->_removingOutputDeviceUIDs;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v63;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v63 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * v17), "copyWithZone:", a3);
        objc_msgSend(v6, "addRemovingOutputDeviceUID:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    }
    while (v15);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v19 = self->_settingOutputDeviceUIDs;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v59;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v59 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v23), "copyWithZone:", a3);
        objc_msgSend(v6, "addSettingOutputDeviceUID:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
    }
    while (v21);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v25 = self->_clusterAwareAddingOutputDeviceUIDs;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v55;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v55 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v29), "copyWithZone:", a3);
        objc_msgSend(v6, "addClusterAwareAddingOutputDeviceUID:", v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
    }
    while (v27);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v31 = self->_clusterAwareRemovingOutputDeviceUIDs;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v50, v71, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v51;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v51 != v34)
          objc_enumerationMutation(v31);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v35), "copyWithZone:", a3);
        objc_msgSend(v6, "addClusterAwareRemovingOutputDeviceUID:", v36);

        ++v35;
      }
      while (v33 != v35);
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v50, v71, 16);
    }
    while (v33);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v37 = self->_clusterAwareSettingOutputDeviceUIDs;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v46, v70, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v47;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(v37);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v41), "copyWithZone:", a3, (_QWORD)v46);
        objc_msgSend(v6, "addClusterAwareSettingOutputDeviceUID:", v42);

        ++v41;
      }
      while (v39 != v41);
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v46, v70, 16);
    }
    while (v39);
  }

  v43 = -[_MRGroupTopologyModificationRequestProtobuf copyWithZone:](self->_request, "copyWithZone:", a3);
  v44 = (void *)v6[7];
  v6[7] = v43;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *addingOutputDeviceUIDs;
  NSMutableArray *removingOutputDeviceUIDs;
  NSMutableArray *settingOutputDeviceUIDs;
  NSMutableArray *clusterAwareAddingOutputDeviceUIDs;
  NSMutableArray *clusterAwareRemovingOutputDeviceUIDs;
  NSMutableArray *clusterAwareSettingOutputDeviceUIDs;
  _MRGroupTopologyModificationRequestProtobuf *request;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_outputContextType != *((_DWORD *)v4 + 10))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  addingOutputDeviceUIDs = self->_addingOutputDeviceUIDs;
  if ((unint64_t)addingOutputDeviceUIDs | *((_QWORD *)v4 + 1)
    && !-[NSMutableArray isEqual:](addingOutputDeviceUIDs, "isEqual:"))
  {
    goto LABEL_21;
  }
  removingOutputDeviceUIDs = self->_removingOutputDeviceUIDs;
  if ((unint64_t)removingOutputDeviceUIDs | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](removingOutputDeviceUIDs, "isEqual:"))
      goto LABEL_21;
  }
  settingOutputDeviceUIDs = self->_settingOutputDeviceUIDs;
  if ((unint64_t)settingOutputDeviceUIDs | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](settingOutputDeviceUIDs, "isEqual:"))
      goto LABEL_21;
  }
  clusterAwareAddingOutputDeviceUIDs = self->_clusterAwareAddingOutputDeviceUIDs;
  if ((unint64_t)clusterAwareAddingOutputDeviceUIDs | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](clusterAwareAddingOutputDeviceUIDs, "isEqual:"))
      goto LABEL_21;
  }
  clusterAwareRemovingOutputDeviceUIDs = self->_clusterAwareRemovingOutputDeviceUIDs;
  if ((unint64_t)clusterAwareRemovingOutputDeviceUIDs | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](clusterAwareRemovingOutputDeviceUIDs, "isEqual:"))
      goto LABEL_21;
  }
  clusterAwareSettingOutputDeviceUIDs = self->_clusterAwareSettingOutputDeviceUIDs;
  if ((unint64_t)clusterAwareSettingOutputDeviceUIDs | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](clusterAwareSettingOutputDeviceUIDs, "isEqual:"))
      goto LABEL_21;
  }
  request = self->_request;
  if ((unint64_t)request | *((_QWORD *)v4 + 7))
    v12 = -[_MRGroupTopologyModificationRequestProtobuf isEqual:](request, "isEqual:");
  else
    v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_outputContextType;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_addingOutputDeviceUIDs, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_removingOutputDeviceUIDs, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_settingOutputDeviceUIDs, "hash");
  v7 = -[NSMutableArray hash](self->_clusterAwareAddingOutputDeviceUIDs, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_clusterAwareRemovingOutputDeviceUIDs, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_clusterAwareSettingOutputDeviceUIDs, "hash");
  return v9 ^ -[_MRGroupTopologyModificationRequestProtobuf hash](self->_request, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  _MRGroupTopologyModificationRequestProtobuf *request;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    self->_outputContextType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v6 = *((id *)v4 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v59 != v9)
          objc_enumerationMutation(v6);
        -[_MRAVModifyOutputContextRequestProtobuf addAddingOutputDeviceUID:](self, "addAddingOutputDeviceUID:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v8);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v11 = v5[6];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(v11);
        -[_MRAVModifyOutputContextRequestProtobuf addRemovingOutputDeviceUID:](self, "addRemovingOutputDeviceUID:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v13);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v16 = v5[8];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v51 != v19)
          objc_enumerationMutation(v16);
        -[_MRAVModifyOutputContextRequestProtobuf addSettingOutputDeviceUID:](self, "addSettingOutputDeviceUID:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
    }
    while (v18);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v21 = v5[2];
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v47;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v47 != v24)
          objc_enumerationMutation(v21);
        -[_MRAVModifyOutputContextRequestProtobuf addClusterAwareAddingOutputDeviceUID:](self, "addClusterAwareAddingOutputDeviceUID:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * m));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
    }
    while (v23);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v26 = v5[3];
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v43;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(v26);
        -[_MRAVModifyOutputContextRequestProtobuf addClusterAwareRemovingOutputDeviceUID:](self, "addClusterAwareRemovingOutputDeviceUID:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * n));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
    }
    while (v28);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v31 = v5[4];
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v39;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(v31);
        -[_MRAVModifyOutputContextRequestProtobuf addClusterAwareSettingOutputDeviceUID:](self, "addClusterAwareSettingOutputDeviceUID:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * ii), (_QWORD)v38);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
    }
    while (v33);
  }

  request = self->_request;
  v37 = v5[7];
  if (request)
  {
    if (v37)
      -[_MRGroupTopologyModificationRequestProtobuf mergeFrom:](request, "mergeFrom:");
  }
  else if (v37)
  {
    -[_MRAVModifyOutputContextRequestProtobuf setRequest:](self, "setRequest:");
  }

}

- (NSMutableArray)addingOutputDeviceUIDs
{
  return self->_addingOutputDeviceUIDs;
}

- (void)setAddingOutputDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_addingOutputDeviceUIDs, a3);
}

- (NSMutableArray)removingOutputDeviceUIDs
{
  return self->_removingOutputDeviceUIDs;
}

- (void)setRemovingOutputDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_removingOutputDeviceUIDs, a3);
}

- (NSMutableArray)settingOutputDeviceUIDs
{
  return self->_settingOutputDeviceUIDs;
}

- (void)setSettingOutputDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_settingOutputDeviceUIDs, a3);
}

- (NSMutableArray)clusterAwareAddingOutputDeviceUIDs
{
  return self->_clusterAwareAddingOutputDeviceUIDs;
}

- (void)setClusterAwareAddingOutputDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_clusterAwareAddingOutputDeviceUIDs, a3);
}

- (NSMutableArray)clusterAwareRemovingOutputDeviceUIDs
{
  return self->_clusterAwareRemovingOutputDeviceUIDs;
}

- (void)setClusterAwareRemovingOutputDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_clusterAwareRemovingOutputDeviceUIDs, a3);
}

- (NSMutableArray)clusterAwareSettingOutputDeviceUIDs
{
  return self->_clusterAwareSettingOutputDeviceUIDs;
}

- (void)setClusterAwareSettingOutputDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_clusterAwareSettingOutputDeviceUIDs, a3);
}

- (_MRGroupTopologyModificationRequestProtobuf)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_removingOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_clusterAwareSettingOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_clusterAwareRemovingOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_clusterAwareAddingOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_addingOutputDeviceUIDs, 0);
}

@end
