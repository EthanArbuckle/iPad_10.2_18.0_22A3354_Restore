@implementation MRAVEndpoint

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MRAVEndpoint uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)syncedOutputDevices
{
  unsigned int (**v3)(void);
  void *v4;
  void *v5;
  _QWORD v7[6];
  _QWORD v8[5];
  id v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__36;
  v8[4] = __Block_byref_object_dispose__36;
  v9 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__MRAVEndpoint_syncedOutputDevices__block_invoke;
  v7[3] = &unk_1E30CDDD0;
  v7[4] = self;
  v7[5] = v8;
  v3 = (unsigned int (**)(void))MEMORY[0x194036C44](v7, a2);
  if (v3[2]())
  {
    -[MRAVEndpoint outputContextDataSource](self, "outputContextDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outputDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  _Block_object_dispose(v8, 8);
  return (NSArray *)v5;
}

uint64_t __35__MRAVEndpoint_syncedOutputDevices__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportOutputContextSync");

  if ((v3 & 1) == 0)
  {
    v4 = 0;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    v7 = CFSTR("FF disabled");
    goto LABEL_5;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isLocalEndpoint") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "externalDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v6 = v9;
      objc_msgSend(v9, "deviceInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        if ((objc_msgSend(v10, "supportsOutputContextSync") & 1) != 0)
        {

          v4 = 1;
          goto LABEL_6;
        }
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v13 = *(void **)(v12 + 40);
        v14 = CFSTR("endpoint does not support outputContextSync");
      }
      else
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v13 = *(void **)(v12 + 40);
        v14 = CFSTR("deviceInfo==nil");
      }
      *(_QWORD *)(v12 + 40) = v14;

      v4 = 0;
      goto LABEL_6;
    }
    v4 = 0;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    v7 = CFSTR("not connected");
LABEL_5:
    *(_QWORD *)(v5 + 40) = v7;
LABEL_6:

    return v4;
  }
  return 1;
}

- (NSArray)outputDeviceUIDs
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MRAVEndpoint outputDevices](self, "outputDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "uid", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "uid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (_MRAVEndpointDescriptorProtobuf)descriptor
{
  _MRAVEndpointDescriptorProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_MRAVEndpointDescriptorProtobuf);
  -[MRAVEndpoint localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVEndpointDescriptorProtobuf setName:](v3, "setName:", v4);

  -[MRAVEndpoint designatedGroupLeader](self, "designatedGroupLeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVEndpointDescriptorProtobuf setDesignatedGroupLeader:](v3, "setDesignatedGroupLeader:", v6);

  -[MRAVEndpoint uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVEndpointDescriptorProtobuf setUniqueIdentifier:](v3, "setUniqueIdentifier:", v7);

  -[_MRAVEndpointDescriptorProtobuf setConnectionType:](v3, "setConnectionType:", -[MRAVEndpoint connectionType](self, "connectionType"));
  -[_MRAVEndpointDescriptorProtobuf setCanModifyGroupMembership:](v3, "setCanModifyGroupMembership:", -[MRAVEndpoint canModifyGroupMembership](self, "canModifyGroupMembership"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MRAVEndpoint outputDevices](self, "outputDevices", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "descriptor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MRAVEndpointDescriptorProtobuf addOutputDevices:](v3, "addOutputDevices:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v3;
}

- (NSString)localizedName
{
  return (NSString *)-[MRAVEndpoint _createLocalizedNameWithBuiltInDeviceNameBlock:](self, &__block_literal_global_87);
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRAVEndpoint;
  return -[MRAVEndpoint init](&v3, sel_init);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[MRAVEndpoint connectionType](self, "connectionType");
  if (v5 > 6)
    v6 = 0;
  else
    v6 = off_1E30CE760[v5];
  -[MRAVEndpoint uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVEndpoint outputDevices](self, "outputDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p (%@) uid=\"%@\" outputDevices = %@>"), v4, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (__CFString)_createLocalizedNameWithBuiltInDeviceNameBlock:(void *)a1
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  _BOOL4 v10;
  __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  void (**v39)(_QWORD);
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
  {
    v37 = 0;
    goto LABEL_38;
  }
  objc_msgSend(a1, "outputDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    v39 = v3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (!v14)
      goto LABEL_25;
    v15 = v14;
    v16 = *(_QWORD *)v41;
    while (1)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "length"))
        {
          objc_msgSend(v18, "logicalDeviceID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v20, "length"))
            goto LABEL_21;
          if ((objc_msgSend(v12, "containsObject:", v20) & 1) == 0)
          {
            objc_msgSend(v12, "addObject:", v20);
LABEL_21:
            objc_msgSend(v5, "addObject:", v19);
          }

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (!v15)
      {
LABEL_25:

        objc_msgSend(a1, "groupLeader");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isProxyGroupPlayer");

        if (v22)
        {
          v3 = v39;
          if (objc_msgSend(a1, "isLocalEndpoint"))
          {
            v39[2](v39);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(a1, "designatedGroupLeader");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "removeObject:", v23);
          }
          v32 = (void *)MEMORY[0x1E0CB3940];
          MRLocalizedStringWithFormat(CFSTR("ROUTE_NAME_ARROW_FORMAT"), 0, CFSTR("%@ %@"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          MRLocalizedString(CFSTR("ROUTE_NAMES_CONCAT_DELIMITER"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "componentsJoinedByString:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", v33, v23, v35);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v5, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          MRLocalizedString(CFSTR("ROUTE_NAMES_CONCAT_DELIMITER"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "componentsJoinedByString:", v23);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v3 = v39;
        }

        goto LABEL_34;
      }
    }
  }
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceType");
  v7 = objc_msgSend(v5, "deviceType");
  v8 = objc_msgSend(a1, "isLocalEndpoint");
  v10 = v6 == 4 || v7 == 5;
  if (v8 && v10)
  {
    v3[2](v3);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "groupLeader");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isProxyGroupPlayer");

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      MRLocalizedStringWithFormat(CFSTR("ROUTE_NAME_ARROW_FORMAT"), 0, CFSTR("%@ %@"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "groupLeader");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", v27, v29, v30);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = v5;
      if (!v5)
      {
        objc_msgSend(a1, "groupLeader");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "name");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v5)
LABEL_34:

    }
  }

  v36 = &stru_1E30D5AF8;
  if (v11)
    v36 = v11;
  v37 = v36;

LABEL_38:
  return v37;
}

- (BOOL)isLocalEndpoint
{
  return -[MRAVEndpoint connectionType](self, "connectionType") == 1;
}

id __29__MRAVEndpoint_localizedName__block_invoke()
{
  return +[MRAVOutputDevice localDeviceLocalizedName](MRAVOutputDevice, "localDeviceLocalizedName");
}

id __25__MRAVEndpoint_debugName__block_invoke()
{
  return +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
}

- (NSString)debugName
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[MRAVEndpoint _createLocalizedNameWithBuiltInDeviceNameBlock:](self, &__block_literal_global_85_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRAVEndpoint uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@-%@"), v5, v3);

  return (NSString *)v6;
}

- (MROutputContextDataSource)outputContextDataSource
{
  MRAVEndpoint *v2;
  MROutputContextDataSource *outputContextDataSource;
  NSObject *v4;
  void *v5;
  void *v6;
  MROutputContextDataSource *v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  outputContextDataSource = v2->_outputContextDataSource;
  if (!outputContextDataSource)
  {
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[MRAVEndpoint debugName](v2, "debugName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVEndpoint outputContextDataSource].cold.1(v5, v9, v4);
    }

    -[MRAVEndpoint _externalOutputContext](v2, "_externalOutputContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVEndpoint setOutputContextDataSource:](v2, "setOutputContextDataSource:", v6);

    outputContextDataSource = v2->_outputContextDataSource;
  }
  v7 = outputContextDataSource;
  objc_sync_exit(v2);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_outputContextDataSource, 0);
}

- (NSArray)resolvedOutputDevices
{
  void *v3;
  id v4;
  unsigned int (**v5)(void);
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  MRAVEndpoint *v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  -[MRAVEndpoint syncedOutputDevices](self, "syncedOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__36;
  v13[4] = __Block_byref_object_dispose__36;
  v14 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__MRAVEndpoint_resolvedOutputDevices__block_invoke;
  v9[3] = &unk_1E30CDDF8;
  v4 = v3;
  v11 = self;
  v12 = v13;
  v10 = v4;
  v5 = (unsigned int (**)(void))MEMORY[0x194036C44](v9);
  if (v5[2]())
  {
    v6 = v4;
  }
  else
  {
    -[MRAVEndpoint outputDevices](self, "outputDevices");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  _Block_object_dispose(v13, 8);
  return (NSArray *)v7;
}

uint64_t __37__MRAVEndpoint_resolvedOutputDevices__block_invoke(uint64_t a1)
{
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    return objc_msgSend(*(id *)(a1 + 40), "groupContainsDiscoverableGroupLeader");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = CFSTR("outputContext is uninitialized");

  return 0;
}

- (BOOL)isEqualToEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (-[MRAVEndpoint isEqual:](self, "isEqual:", v4))
  {
    -[MRAVEndpoint descriptor](self, "descriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MRAVEndpoint *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (MRAVEndpoint *)v4;
    if (self == v5)
    {
      v10 = 1;
    }
    else
    {
      -[MRAVEndpoint uniqueIdentifier](self, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[MRAVEndpoint uniqueIdentifier](v5, "uniqueIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          -[MRAVEndpoint uniqueIdentifier](self, "uniqueIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[MRAVEndpoint uniqueIdentifier](v5, "uniqueIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "isEqualToString:", v9);

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MRExternalDevice)externalDevice
{
  return 0;
}

- (void)scheduleEndpointOutputDevicesDidChangeNotification
{
  NSObject *v3;
  _QWORD block[5];

  if (!self->_outputDevicesDidChangeNotificationScheduled)
  {
    self->_outputDevicesDidChangeNotificationScheduled = 1;
    +[MRAVEndpoint _notificationSerialQueue]();
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__MRAVEndpoint_scheduleEndpointOutputDevicesDidChangeNotification__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

+ (id)_notificationSerialQueue
{
  objc_opt_self();
  if (_notificationSerialQueue___once_1 != -1)
    dispatch_once(&_notificationSerialQueue___once_1, &__block_literal_global_335);
  return (id)_notificationSerialQueue___notificationSerialQueue_1;
}

- (void)setOutputContextDataSource:(id)a3
{
  void *v5;
  MRAVEndpoint *v6;
  MROutputContextDataSource *outputContextDataSource;
  MROutputContextDataSource *v8;

  v8 = (MROutputContextDataSource *)a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  outputContextDataSource = v6->_outputContextDataSource;
  if (outputContextDataSource != v8)
  {
    if (outputContextDataSource)
    {
      objc_msgSend(v5, "removeObserver:name:object:", v6, CFSTR("MROutputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilitiesNotification"));
      objc_msgSend(v5, "removeObserver:name:object:", v6, CFSTR("MROutputContextDataSourceOutputDeviceDidChangeVolumeNotification"), v6->_outputContextDataSource);
      objc_msgSend(v5, "removeObserver:name:object:", v6, CFSTR("MROutputContextDataSourceOutputDeviceDidChangeVolumeMutedNotification"), v6->_outputContextDataSource);
      objc_msgSend(v5, "removeObserver:name:object:", v6, CFSTR("MROutputContextDataSourceDidAddOutputDeviceNotification"), v6->_outputContextDataSource);
      objc_msgSend(v5, "removeObserver:name:object:", v6, CFSTR("MROutputContextDataSourceDidChangeOutputDeviceNotification"), v6->_outputContextDataSource);
      objc_msgSend(v5, "removeObserver:name:object:", v6, CFSTR("MROutputContextDataSourceDidRemoveOutputDeviceNotification"), v6->_outputContextDataSource);
      objc_msgSend(v5, "removeObserver:name:object:", v6, CFSTR("MROutputContextDataSourceDidChangePredictedOutputDeviceNotification"), v6->_outputContextDataSource);
    }
    objc_storeStrong((id *)&v6->_outputContextDataSource, a3);
    if (v6->_outputContextDataSource)
    {
      objc_msgSend(v5, "addObserver:selector:name:object:", v6, sel_outputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilities_, CFSTR("MROutputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilitiesNotification"));
      objc_msgSend(v5, "addObserver:selector:name:object:", v6, sel_outputContextDataSourceOutputDeviceDidChangeVolume_, CFSTR("MROutputContextDataSourceOutputDeviceDidChangeVolumeNotification"), v6->_outputContextDataSource);
      objc_msgSend(v5, "addObserver:selector:name:object:", v6, sel_outputContextDataSourceOutputDeviceDidChangeVolumeMuted_, CFSTR("MROutputContextDataSourceOutputDeviceDidChangeVolumeMutedNotification"), v6->_outputContextDataSource);
      objc_msgSend(v5, "addObserver:selector:name:object:", v6, sel_outputContextDataSourceDidAddOutputDevice_, CFSTR("MROutputContextDataSourceDidAddOutputDeviceNotification"), v6->_outputContextDataSource);
      objc_msgSend(v5, "addObserver:selector:name:object:", v6, sel_outputContextDataSourceDidChangeOutputDevice_, CFSTR("MROutputContextDataSourceDidChangeOutputDeviceNotification"), v6->_outputContextDataSource);
      objc_msgSend(v5, "addObserver:selector:name:object:", v6, sel_outputContextDataSourceDidRemoveOutputDevice_, CFSTR("MROutputContextDataSourceDidRemoveOutputDeviceNotification"), v6->_outputContextDataSource);
      objc_msgSend(v5, "addObserver:selector:name:object:", v6, sel_outputContextDidChangePredictedOutputDevice_, CFSTR("MROutputContextDataSourceDidChangePredictedOutputDeviceNotification"), v6->_outputContextDataSource);
    }
  }
  objc_sync_exit(v6);

}

- (void)outputContextDataSourceOutputDeviceDidChangeVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MROutputContextDataSourceVolumeUserInfoKey"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_class();
  objc_msgSend(v9, "floatValue");
  objc_msgSend(v8, "_notifyVolumeDidChange:outputDevice:endpoint:", v7, self);

}

+ (void)_notifyVolumeDidChange:(float)a3 outputDevice:(id)a4 endpoint:(id)a5
{
  id v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  objc_msgSend(a1, "_userInfoFromEndpoint:outputDevice:", v8, a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("kMRAVEndpointVolumeUserInfoKey"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("kMRAVEndpointVolumeDidChangeNotification"), v8, v12);

}

- (void)outputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MROutputContextDataSourceVolumeCapabilitiesUserInfoKey"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_notifyVolumeCapabilitiesDidChange:outputDevice:endpoint:", objc_msgSend(v8, "intValue"), v7, self);
}

+ (void)_notifyVolumeCapabilitiesDidChange:(unsigned int)a3 outputDevice:(id)a4 endpoint:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  objc_msgSend(a1, "_userInfoFromEndpoint:outputDevice:", v8, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("kMRAVEndpointVolumeControlCapabilitiesUserInfoKey"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification"), v8, v11);

}

+ (id)_userInfoFromEndpoint:(id)a3 outputDevice:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(a3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("kMRAVEndpointIdentifierUserInfoKey"));
  if (v5)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("MRAVEndpointOutputDeviceUserInfoKey"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("kMRAVEndpointOutputDeviceIdentifierUserInfoKey"));
  }

  return v8;
}

void __66__MRAVEndpoint_scheduleEndpointOutputDevicesDidChangeNotification__block_invoke(uint64_t a1)
{
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("kMRAVEndpointOutputDevicesDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __40__MRAVEndpoint__notificationSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MediaRemote.MRAVEndpoint.NotificationQueue", v2);
  v1 = (void *)_notificationSerialQueue___notificationSerialQueue_1;
  _notificationSerialQueue___notificationSerialQueue_1 = (uint64_t)v0;

}

- (id)debugDescription
{
  MRAVEndpoint *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  MROutputContextDataSource *outputContextDataSource;
  void *v18;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  v5 = -[MRAVEndpoint connectionType](v2, "connectionType");
  if (v5 > 6)
    v6 = 0;
  else
    v6 = off_1E30CE760[v5];
  -[MRAVEndpoint uniqueIdentifier](v2, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p (%@) uid=\"%@\"), v4, v2, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRAVEndpoint outputDevices](v2, "outputDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[MRAVEndpoint outputDevices](v2, "outputDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mr_formattedDebugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("  outputDevices = %@\n"), v12);

  }
  -[MRAVEndpoint personalOutputDevices](v2, "personalOutputDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[MRAVEndpoint personalOutputDevices](v2, "personalOutputDevices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mr_formattedDebugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("  personalDevices = %@\n"), v16);

  }
  outputContextDataSource = v2->_outputContextDataSource;
  if (outputContextDataSource)
  {
    -[NSObject mr_formattedDebugDescription](outputContextDataSource, "mr_formattedDebugDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("  outputContextDataSource debug= %@\n"), v18);

  }
  objc_sync_exit(v2);

  return v8;
}

- (NSArray)outputDevices
{
  return 0;
}

- (NSArray)personalOutputDevices
{
  void *v2;
  void *v3;

  -[MRAVEndpoint externalDevice](self, "externalDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personalOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (MRAVOutputDevice)predictedOutputDevice
{
  return 0;
}

- (NSArray)predictedOutputDevices
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[MRAVEndpoint predictedOutputDevice](self, "predictedOutputDevice");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSArray)effectiveOutputDevices
{
  void *v3;
  id v4;
  void *v5;

  -[MRAVEndpoint predictedOutputDevices](self, "predictedOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    -[MRAVEndpoint outputDevices](self, "outputDevices");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSArray *)v5;
}

- (unint64_t)logicalOutputDeviceCount
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MRAVEndpoint outputDevices](self, "outputDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "logicalDeviceID", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
        {
          objc_msgSend(v9, "logicalDeviceID");
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v9, "uid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
            continue;
          objc_msgSend(v9, "uid");
          v12 = objc_claimAutoreleasedReturnValue();
        }
        v14 = (void *)v12;
        objc_msgSend(v3, "addObject:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v15 = objc_msgSend(v3, "count");
  return v15;
}

- (MRAVOutputDevice)designatedGroupLeader
{
  return 0;
}

- (NSString)uniqueIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVEndpoint uniqueIdentifier]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (BOOL)groupContainsDiscoverableGroupLeader
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  -[MRAVEndpoint designatedGroupLeader](self, "designatedGroupLeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAirPlayReceiverSessionActive");

  -[MRAVEndpoint designatedGroupLeader](self, "designatedGroupLeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = objc_msgSend(v5, "parentGroupContainsDiscoverableLeader");
  else
    v7 = objc_msgSend(v5, "groupContainsGroupLeader");
  v8 = v7;

  return v8;
}

- (BOOL)canModifyGroupMembership
{
  return 0;
}

- (BOOL)isProxyGroupPlayer
{
  return 0;
}

- (NSString)shortDescription
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[MRAVEndpoint connectionType](self, "connectionType");
  if (v5 > 6)
    v6 = 0;
  else
    v6 = off_1E30CE760[v5];
  -[MRAVEndpoint uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVEndpoint designatedGroupLeader](self, "designatedGroupLeader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p (%@) uid=\"%@\" leader=\"%@\">"), v4, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSDictionary)jsonEncodableDictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("uid");
  -[MRAVEndpoint uniqueIdentifier](self, "uniqueIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_1E30D5AF8;
  v12[1] = CFSTR("output-devices");
  v13[0] = v5;
  -[MRAVEndpoint outputDevices](self, "outputDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("jsonEncodableDictionaryRepresentation"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = MEMORY[0x1E0C9AA60];
  if (v7)
    v9 = v7;
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (MROrigin)origin
{
  void *v3;
  void *v4;

  if (-[MRAVEndpoint isLocalEndpoint](self, "isLocalEndpoint"))
  {
    +[MROrigin localOrigin](MROrigin, "localOrigin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MRAVEndpoint externalDevice](self, "externalDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customOrigin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (MROrigin *)v3;
}

- (BOOL)isCompanionEndpoint
{
  void *v2;
  BOOL v3;

  -[MRAVEndpoint groupLeader](self, "groupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostDeviceClass") == 1;

  return v3;
}

- (BOOL)isGroupable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MRAVEndpoint outputDevices](self, "outputDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_firstWhere:", &__block_literal_global_102);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

uint64_t __27__MRAVEndpoint_isGroupable__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isGroupable") ^ 1;
}

- (BOOL)isConnected
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVEndpoint isConnected]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (id)_externalOutputContext
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVEndpoint _externalOutputContext]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (MRGroupSessionInfo)groupSessionInfo
{
  void *v2;
  void *v3;

  -[MRAVEndpoint designatedGroupLeader](self, "designatedGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupSessionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRGroupSessionInfo *)v3;
}

- (MRDeviceInfo)deviceInfo
{
  void *v2;
  void *v3;

  -[MRAVEndpoint externalDevice](self, "externalDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRDeviceInfo *)v3;
}

- (void)connectToExternalDeviceWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  qos_class_t v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  unsigned int v34;
  _QWORD block[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MREndpointConnectionReasonUserInfoKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MRExternalDeviceConnectionReasonUserInfoKey"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MREndpointConnectionCorrelationIDUserInfoKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MRExternalDeviceConnectionCorrelationIDUserInfoKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v16 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = a3;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      a3 = v19;
    }

  }
  v21 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __71__MRAVEndpoint_connectToExternalDeviceWithOptions_userInfo_completion___block_invoke;
  v38[3] = &unk_1E30C6798;
  v22 = v9;
  v39 = v22;
  v23 = (void *)MEMORY[0x194036C44](v38);
  -[MRAVEndpoint externalDevice](self, "externalDevice");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v34 = a3;
    if (!v13)
      v13 = CFSTR("MRAVEndpoint");
    v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v13, CFSTR("MRExternalDeviceConnectionReasonUserInfoKey"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v16, CFSTR("MRExternalDeviceConnectionCorrelationIDUserInfoKey"));
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MRExternalDeviceConnectionClientBundleIDUserInfoKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("MRExternalDeviceConnectionClientBundleIDUserInfoKey"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v33 = v22;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bundleIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v32, CFSTR("MRExternalDeviceConnectionClientBundleIDUserInfoKey"));

      v22 = v33;
    }

    objc_msgSend(v24, "connectWithOptions:userInfo:completion:", v34, v25, v23);
  }
  else
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 100, CFSTR("Cannot connect to external device. This endpoint doesn't have a usable pipe."));
    v28 = qos_class_self();
    dispatch_get_global_queue(v28, 0);
    v29 = v22;
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = v21;
    block[1] = 3221225472;
    block[2] = __71__MRAVEndpoint_connectToExternalDeviceWithOptions_userInfo_completion___block_invoke_2;
    block[3] = &unk_1E30C6568;
    v36 = v27;
    v37 = v23;
    v25 = v27;
    dispatch_async(v30, block);

    v22 = v29;
  }

}

uint64_t __71__MRAVEndpoint_connectToExternalDeviceWithOptions_userInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __71__MRAVEndpoint_connectToExternalDeviceWithOptions_userInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)connectToExternalDeviceWithUserInfo:(id)a3 completion:(id)a4
{
  -[MRAVEndpoint connectToExternalDeviceWithOptions:userInfo:completion:](self, "connectToExternalDeviceWithOptions:userInfo:completion:", 0, a3, a4);
}

- (void)connectToExternalDeviceWithOptions:(unsigned int)a3 details:(id)a4 completion:(id)a5
{
  uint64_t v6;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = *(_QWORD *)&a3;
  v8 = (objc_class *)MEMORY[0x1E0C99E08];
  v9 = a5;
  v10 = a4;
  v13 = objc_alloc_init(v8);
  objc_msgSend(v10, "requestID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("MREndpointConnectionCorrelationIDUserInfoKey"));

  objc_msgSend(v10, "reason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("MREndpointConnectionReasonUserInfoKey"));
  -[MRAVEndpoint connectToExternalDeviceWithOptions:userInfo:completion:](self, "connectToExternalDeviceWithOptions:userInfo:completion:", v6, v13, v9);

}

+ (void)connectToEndpointContainingOutputDeviceUID:(id)a3 options:(unsigned int)a4 details:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  MRAVLightweightReconnaissanceSession *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  qos_class_t v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MRAVEndpoint.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("details"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v11, "requestID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("connectToEndpointWithOutputDeviceUID"), v15);

  if (v10)
    objc_msgSend(v16, "appendFormat:", CFSTR(" for %@"), v10);
  objc_msgSend(v11, "reason");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v11, "reason");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendFormat:", CFSTR(" because %@"), v18);

  }
  _MRLogForCategory(0xAuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v16;
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v36 = v16;
  v20 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke;
  v40[3] = &unk_1E30CDE60;
  v41 = v10;
  v21 = v11;
  v42 = v21;
  v43 = v13;
  v44 = v12;
  v22 = v12;
  v23 = v13;
  v24 = v10;
  v25 = (void *)MEMORY[0x194036C44](v40);
  v26 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "discoverEndpointTimeoutInterval");
  v29 = v28;
  objc_msgSend(v21, "requestReasonID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = qos_class_self();
  dispatch_get_global_queue(v31, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v20;
  v37[1] = 3221225472;
  v37[2] = __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke_131;
  v37[3] = &unk_1E30C7C28;
  v38 = v21;
  v39 = v25;
  v33 = v25;
  v34 = v21;
  -[MRAVLightweightReconnaissanceSession searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:](v26, "searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:", v24, v30, v32, v37, v29);

}

void __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  const __CFString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "debugName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(_QWORD *)(a1 + 32);
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v15)
      {
        if (!v16)
          goto LABEL_21;
        objc_msgSend(*(id *)(a1 + 40), "requestID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "debugName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        v31 = 138544386;
        v32 = CFSTR("connectToEndpointWithOutputDeviceUID");
        v33 = 2114;
        v34 = v10;
        v35 = 2112;
        v36 = v12;
        v37 = 2114;
        v38 = v17;
        v39 = 2048;
        v40 = v19;
        v20 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v21 = v8;
        v22 = 52;
      }
      else
      {
        if (!v16)
          goto LABEL_21;
        objc_msgSend(*(id *)(a1 + 40), "requestID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "debugName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        v31 = 138544130;
        v32 = CFSTR("connectToEndpointWithOutputDeviceUID");
        v33 = 2114;
        v34 = v10;
        v35 = 2112;
        v36 = v12;
        v37 = 2048;
        v38 = v28;
        v20 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v21 = v8;
        v22 = 42;
      }
      _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v31, v22);

    }
    else
    {
      if (v15)
      {
        if (!v16)
          goto LABEL_21;
        objc_msgSend(*(id *)(a1 + 40), "requestID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        v31 = 138544130;
        v32 = CFSTR("connectToEndpointWithOutputDeviceUID");
        v33 = 2114;
        v34 = v10;
        v35 = 2114;
        v36 = v23;
        v37 = 2048;
        v38 = v24;
        v25 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v26 = v8;
        v27 = 42;
      }
      else
      {
        if (!v16)
          goto LABEL_21;
        objc_msgSend(*(id *)(a1 + 40), "requestID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        v31 = 138543874;
        v32 = CFSTR("connectToEndpointWithOutputDeviceUID");
        v33 = 2114;
        v34 = v10;
        v35 = 2048;
        v36 = v29;
        v25 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v26 = v8;
        v27 = 32;
      }
      _os_log_impl(&dword_193827000, v26, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v31, v27);
    }
    goto LABEL_20;
  }
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9)
      goto LABEL_21;
    objc_msgSend(*(id *)(a1 + 40), "requestID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v31 = 138544386;
    v32 = CFSTR("connectToEndpointWithOutputDeviceUID");
    v33 = 2114;
    v34 = v10;
    v35 = 2114;
    v36 = v6;
    v37 = 2114;
    v38 = v11;
    v39 = 2048;
    v40 = v13;
    _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v31, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9)
    __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke_cold_1(a1, v6, v8);
LABEL_21:

  v30 = *(_QWORD *)(a1 + 56);
  if (v30)
    (*(void (**)(uint64_t, id, id))(v30 + 16))(v30, v5, v6);

}

void __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke_131(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke_2;
    v5[3] = &unk_1E30C6590;
    v4 = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    objc_msgSend(v6, "connectToExternalDeviceWithOptions:details:completion:", 0, v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __86__MRAVEndpoint_connectToEndpointContainingOutputDeviceUID_options_details_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)migrateToOrAddOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  MRPlaybackSessionMigrateRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  const __CFString *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  MRPlaybackSessionMigrateRequest *v28;
  id v29;
  void *v30;
  MRPlaybackSessionMigrateRequest *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void (**v36)(_QWORD);
  void *v37;
  NSObject *v38;
  void *v39;
  MRPlaybackSessionMigrateRequest *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  id v47;
  id v48;
  __CFString *v49;
  id v50;
  MRAVEndpoint *v51;
  _QWORD v52[4];
  MRPlaybackSessionMigrateRequest *v53;
  MRAVEndpoint *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  __CFString *v61;
  id v62;
  id v63;
  MRPlaybackSessionMigrateRequest *v64;
  id v65;
  id v66;
  uint8_t buf[4];
  const __CFString *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  const __CFString *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    v12 = (id)MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
  }
  v15 = objc_alloc_init(MRPlaybackSessionMigrateRequest);
  -[MRPlaybackSessionMigrateRequest setInitiator:](v15, "setInitiator:", CFSTR("routePicker"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackSessionMigrateRequest requestID](v15, "requestID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v11;
  -[MRAVEndpoint _initiatorStringWithInitiator:uid:](self, v11, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  v51 = self;
  -[MRAVEndpoint debugName](self, "debugName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  MRAVOutputDeviceArrayDescription(v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("source=%@ destination=%@"), v20, v21);

  v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("migrateToOrAddOutputDevices"), v17);
  v24 = v23;
  if (v22)
    -[__CFString appendFormat:](v23, "appendFormat:", CFSTR(" for %@"), v22);
  _MRLogForCategory(0xAuLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v68 = v24;
    _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }
  v49 = (__CFString *)v24;

  v26 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke;
  v59[3] = &unk_1E30CDE88;
  v60 = v22;
  v61 = CFSTR("migrateToOrAddOutputDevices");
  v27 = v17;
  v62 = v27;
  v63 = v16;
  v28 = v15;
  v64 = v28;
  v66 = v13;
  v29 = v12;
  v65 = v29;
  v48 = v13;
  v47 = v16;
  v46 = v22;
  v30 = (void *)MEMORY[0x194036C44](v59);
  v52[0] = v26;
  v52[1] = 3221225472;
  v52[2] = __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke_2;
  v52[3] = &unk_1E30CDEB0;
  v31 = v28;
  v53 = v31;
  v54 = v51;
  v32 = v10;
  v55 = v32;
  v56 = v18;
  v33 = v29;
  v57 = v33;
  v34 = v30;
  v58 = v34;
  v35 = v18;
  v36 = (void (**)(_QWORD))MEMORY[0x194036C44](v52);
  v37 = (void *)MRMediaRemoteCopyDeviceUID();

  if (v37)
  {
    _MRLogForCategory(0xAuLL);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v50;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v68 = CFSTR("migrateToOrAddOutputDevices");
      v69 = 2114;
      v70 = v27;
      v71 = 2112;
      v72 = CFSTR("Not attempting to migrate because local device is groupable...");
      _os_log_impl(&dword_193827000, v38, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    v40 = v31;
    v41 = 1;
  }
  else
  {
    v39 = v50;
    if (MRGroupSessionAllowsMigrationForEndpoint(v51))
    {
      objc_msgSend(v32, "mr_filter:", &__block_literal_global_145_0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

      if (!v43)
      {
        -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v31, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v31, "endpointOptions") | 2);
        -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v31, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v31, "endpointOptions") & 0xFFFFFFFFFFFFFFFBLL);
        -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v31, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v31, "endpointOptions") | 8);
        -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v31, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v31, "endpointOptions") & 0xFFFFFFFFFFFFFFEFLL | (16 * ((unint64_t)objc_msgSend(v32, "count") > 1)));
        -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v31, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v31, "endpointOptions") & 0xFFFFFFFFFFFFFFDFLL);
        -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v31, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v31, "endpointOptions") & 0xFFFFFFFFFFFFFFBFLL);
        -[MRAVEndpoint migrateToOutputDevices:request:initiator:queue:completion:](v51, "migrateToOutputDevices:request:initiator:queue:completion:", v32, v31, v50, v33, v34);
        goto LABEL_20;
      }
      _MRLogForCategory(0xAuLL);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v68 = CFSTR("migrateToOrAddOutputDevices");
        v69 = 2114;
        v70 = v27;
        v71 = 2112;
        v72 = CFSTR("Not attempting to migrate because device doesn't support migration..");
        _os_log_impl(&dword_193827000, v44, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      v40 = v31;
      v41 = 3;
    }
    else
    {
      _MRLogForCategory(0xAuLL);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v68 = CFSTR("migrateToOrAddOutputDevices");
        v69 = 2114;
        v70 = v27;
        v71 = 2112;
        v72 = CFSTR("Not attempting to migrate because endpoint is migration-restricted group session endpoint");
        _os_log_impl(&dword_193827000, v45, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      v40 = v31;
      v41 = 15;
    }
  }
  -[MRPlaybackSessionMigrateRequest setFallbackReason:](v40, "setFallbackReason:", v41);
  v36[2](v36);
LABEL_20:

}

- (id)_initiatorStringWithInitiator:(void *)a3 uid:
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(a1, "appendString:", v5);
      if (objc_msgSend(v6, "length"))
        objc_msgSend(a1, "appendString:", CFSTR("/"));
    }
    objc_msgSend(a1, "appendString:", v6);
  }

  return a1;
}

void __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13)
        goto LABEL_14;
      v15 = *(void **)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v16 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v30 = v15;
      v31 = 2114;
      v32 = v14;
      v33 = 2114;
      v34 = v16;
      v35 = 2048;
      v36 = v17;
      v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v6;
      v20 = 42;
    }
    else
    {
      if (!v13)
        goto LABEL_14;
      v21 = *(void **)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138543874;
      v30 = v21;
      v31 = 2114;
      v32 = v22;
      v33 = 2048;
      v34 = v23;
      v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v6;
      v20 = 32;
    }
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7)
      goto LABEL_14;
    v9 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544386;
    v30 = v9;
    v31 = 2114;
    v32 = v8;
    v33 = 2114;
    v34 = v3;
    v35 = 2114;
    v36 = v10;
    v37 = 2048;
    v38 = v12;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v3, v6);
LABEL_14:

  objc_msgSend(*(id *)(a1 + 64), "finalize");
  MRLogCategoryMigrationOversize();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 64), "report");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v25;
    _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  v26 = *(void **)(a1 + 80);
  if (v26)
  {
    v28 = v26;
    v27 = v3;
    msv_dispatch_async_on_queue();

  }
}

uint64_t __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke_137(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("addOutputDevices"));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke_3;
  v6[3] = &unk_1E30C75E8;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 72);
  objc_msgSend(v5, "addOutputDevices:initiator:withReplyQueue:completion:", v2, v3, v4, v6);

}

void __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "endEvent:withError:", CFSTR("addOutputDevices"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __80__MRAVEndpoint_migrateToOrAddOutputDevices_initiator_withReplyQueue_completion___block_invoke_144(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsMigration") ^ 1;
}

- (void)migrateToOrSetOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  MRPlaybackSessionMigrateRequest *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  const __CFString *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  MRPlaybackSessionMigrateRequest *v27;
  id v28;
  void *v29;
  MRPlaybackSessionMigrateRequest *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void (**v35)(_QWORD);
  NSObject *v36;
  void *v37;
  MRPlaybackSessionMigrateRequest *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  __CFString *v48;
  id v49;
  MRAVEndpoint *v50;
  _QWORD v51[4];
  MRPlaybackSessionMigrateRequest *v52;
  MRAVEndpoint *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  __CFString *v60;
  id v61;
  id v62;
  MRPlaybackSessionMigrateRequest *v63;
  id v64;
  id v65;
  uint8_t buf[4];
  const __CFString *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  const __CFString *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    v12 = (id)MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
  }
  v15 = objc_alloc_init(MRPlaybackSessionMigrateRequest);
  -[MRPlaybackSessionMigrateRequest setInitiator:](v15, "setInitiator:", CFSTR("routePicker"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackSessionMigrateRequest requestID](v15, "requestID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVEndpoint _initiatorStringWithInitiator:uid:](self, v11, v17);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  v50 = self;
  -[MRAVEndpoint debugName](self, "debugName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  MRAVOutputDeviceArrayDescription(v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("source=%@ destination=%@"), v19, v20);

  v22 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("migrateToOrSetOutputDevices"), v17);
  v23 = v22;
  if (v21)
    -[__CFString appendFormat:](v22, "appendFormat:", CFSTR(" for %@"), v21);
  v49 = v11;
  _MRLogForCategory(0xAuLL);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v67 = v23;
    _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }
  v48 = (__CFString *)v23;

  v25 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke;
  v58[3] = &unk_1E30CDE88;
  v59 = v21;
  v60 = CFSTR("migrateToOrSetOutputDevices");
  v26 = v17;
  v61 = v26;
  v62 = v16;
  v27 = v15;
  v63 = v27;
  v65 = v13;
  v28 = v12;
  v64 = v28;
  v47 = v13;
  v46 = v16;
  v45 = v21;
  v29 = (void *)MEMORY[0x194036C44](v58);
  v51[0] = v25;
  v51[1] = 3221225472;
  v51[2] = __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke_2;
  v51[3] = &unk_1E30CDEB0;
  v30 = v27;
  v52 = v30;
  v53 = v50;
  v31 = v10;
  v54 = v31;
  v55 = v44;
  v32 = v28;
  v56 = v32;
  v33 = v29;
  v57 = v33;
  v34 = v44;
  v35 = (void (**)(_QWORD))MEMORY[0x194036C44](v51);
  if (-[MRAVEndpoint isCompanionEndpoint](v50, "isCompanionEndpoint"))
  {
    _MRLogForCategory(0xAuLL);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v49;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v67 = CFSTR("migrateToOrSetOutputDevices");
      v68 = 2114;
      v69 = v26;
      v70 = 2112;
      v71 = CFSTR("Not attempting to migrate because destination is companion...");
      _os_log_impl(&dword_193827000, v36, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    v38 = v30;
    v39 = 13;
LABEL_24:
    -[MRPlaybackSessionMigrateRequest setFallbackReason:](v38, "setFallbackReason:", v39);
    v35[2](v35);
    goto LABEL_25;
  }
  v40 = (void *)MRMediaRemoteCopyDeviceUID();

  if (v40)
  {
    _MRLogForCategory(0xAuLL);
    v41 = objc_claimAutoreleasedReturnValue();
    v37 = v49;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v67 = CFSTR("migrateToOrSetOutputDevices");
      v68 = 2114;
      v69 = v26;
      v70 = 2112;
      v71 = CFSTR("Not attempting to migrate because local device is groupable...");
      _os_log_impl(&dword_193827000, v41, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    v38 = v30;
    v39 = 1;
    goto LABEL_24;
  }
  v37 = v49;
  if (!MRGroupSessionAllowsMigrationForEndpoint(v50))
  {
    _MRLogForCategory(0xAuLL);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v67 = CFSTR("migrateToOrSetOutputDevices");
      v68 = 2114;
      v69 = v26;
      v70 = 2112;
      v71 = CFSTR("Not attempting to migrate because endpoint is migration-restricted group session endpoint");
      _os_log_impl(&dword_193827000, v42, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    v38 = v30;
    v39 = 15;
    goto LABEL_24;
  }
  if (MRAVOutputDeviceArrayNumberOfLogicalDevices(v31) != 1)
  {
    _MRLogForCategory(0xAuLL);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v67 = CFSTR("migrateToOrSetOutputDevices");
      v68 = 2114;
      v69 = v26;
      v70 = 2112;
      v71 = CFSTR("Not attempting to migrate because more than one logical device requested...");
      _os_log_impl(&dword_193827000, v43, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    v38 = v30;
    v39 = 2;
    goto LABEL_24;
  }
  -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v30, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v30, "endpointOptions") | 2);
  -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v30, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v30, "endpointOptions") | 4);
  -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v30, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v30, "endpointOptions") & 0xFFFFFFFFFFFFFFF7);
  -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v30, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v30, "endpointOptions") | 0x20);
  -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v30, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v30, "endpointOptions") | 0x10);
  -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v30, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v30, "endpointOptions") & 0xFFFFFFFFFFFFFFBFLL);
  -[MRAVEndpoint migrateToOutputDevices:request:initiator:queue:completion:](v50, "migrateToOutputDevices:request:initiator:queue:completion:", v31, v30, v49, v32, v33);
LABEL_25:

}

void __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13)
        goto LABEL_14;
      v15 = *(void **)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v16 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v30 = v15;
      v31 = 2114;
      v32 = v14;
      v33 = 2114;
      v34 = v16;
      v35 = 2048;
      v36 = v17;
      v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v6;
      v20 = 42;
    }
    else
    {
      if (!v13)
        goto LABEL_14;
      v21 = *(void **)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138543874;
      v30 = v21;
      v31 = 2114;
      v32 = v22;
      v33 = 2048;
      v34 = v23;
      v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v6;
      v20 = 32;
    }
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7)
      goto LABEL_14;
    v9 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544386;
    v30 = v9;
    v31 = 2114;
    v32 = v8;
    v33 = 2114;
    v34 = v3;
    v35 = 2114;
    v36 = v10;
    v37 = 2048;
    v38 = v12;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v3, v6);
LABEL_14:

  objc_msgSend(*(id *)(a1 + 64), "finalize");
  MRLogCategoryMigrationOversize();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 64), "report");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v25;
    _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  v26 = *(void **)(a1 + 80);
  if (v26)
  {
    v28 = v26;
    v27 = v3;
    msv_dispatch_async_on_queue();

  }
}

uint64_t __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke_150(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("setOutputDevices"));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke_3;
  v6[3] = &unk_1E30C75E8;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 72);
  objc_msgSend(v5, "setOutputDevices:initiator:withReplyQueue:completion:", v2, v3, v4, v6);

}

void __80__MRAVEndpoint_migrateToOrSetOutputDevices_initiator_withReplyQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "endEvent:withError:", CFSTR("setOutputDevices"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)migrateToOutputDevice:(id)a3 request:(id)a4 initiator:(id)a5 queue:(id)a6 completion:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "arrayWithObjects:count:", &v19, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRAVEndpoint migrateToOutputDevices:request:initiator:queue:completion:](self, "migrateToOutputDevices:request:initiator:queue:completion:", v18, v16, v15, v14, v13, v19, v20);
}

- (void)migrateToOutputDevices:(id)a3 request:(id)a4 initiator:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "supportOutOfProcessMigration");

  if (v17)
  {
    v18 = (void *)MRGetSharedService();
    if (-[MRAVEndpoint isLocalEndpoint](self, "isLocalEndpoint"))
    {
      MRMediaRemoteServiceMigrateFromEndpointToOutputDevices(v18, 0, v20, v12, v14, v15);
    }
    else
    {
      -[MRAVEndpoint uniqueIdentifier](self, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      MRMediaRemoteServiceMigrateFromEndpointToOutputDevices(v18, v19, v20, v12, v14, v15);

    }
  }
  else
  {
    -[MRAVEndpoint performMigrationToOutputDevices:request:initiator:queue:completion:](self, "performMigrationToOutputDevices:request:initiator:queue:completion:", v20, v12, v13, v14, v15);
  }

}

- (void)migrateToEndpoint:(id)a3 request:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportOutOfProcessMigration");

  if (v14)
  {
    v15 = (void *)MRGetSharedService();
    v16 = -[MRAVEndpoint isLocalEndpoint](self, "isLocalEndpoint");
    if (v16)
    {
      v17 = 0;
    }
    else
    {
      -[MRAVEndpoint uniqueIdentifier](self, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v19, "isLocalEndpoint"))
    {
      MRMediaRemoteServiceMigrateFromEndpointToEndpoint(v15, v17, 0, v10, v11, v12);
      if (v16)
        goto LABEL_11;
      goto LABEL_10;
    }
    objc_msgSend(v19, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemoteServiceMigrateFromEndpointToEndpoint(v15, v17, v18, v10, v11, v12);

    if (!v16)
LABEL_10:

  }
  else
  {
    -[MRAVEndpoint performMigrationToEndpoint:request:queue:completion:](self, "performMigrationToEndpoint:request:queue:completion:", v19, v10, v11, v12);
  }
LABEL_11:

}

- (void)migrateToEndpointOrModifyTopology:(id)a3 migrationRequest:(id)a4 topologyModificationRequest:(id)a5 withReplyQueue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __121__MRAVEndpoint_migrateToEndpointOrModifyTopology_migrationRequest_topologyModificationRequest_withReplyQueue_completion___block_invoke;
  v18[3] = &unk_1E30CDED8;
  v18[4] = self;
  v19 = v12;
  v20 = v13;
  v21 = v14;
  v15 = v13;
  v16 = v12;
  v17 = v14;
  -[MRAVEndpoint migrateToEndpoint:request:queue:completion:](self, "migrateToEndpoint:request:queue:completion:", a3, a4, v15, v18);

}

uint64_t __121__MRAVEndpoint_migrateToEndpointOrModifyTopology_migrationRequest_topologyModificationRequest_withReplyQueue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "modifyTopologyWithRequest:withReplyQueue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)performMigrationToOutputDevices:(id)a3 request:(id)a4 initiator:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MRPlaybackSessionMigrateRequest *v16;
  void *v17;
  id v18;
  MRPlaybackSessionMigrateRequest *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  const __CFString *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  MRPlaybackSessionMigrateRequest *v30;
  id v31;
  void *v32;
  uint64_t v33;
  MRPlaybackSessionMigrateRequest *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  MRPlaybackSessionMigrateRequest *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  MRPlaybackSessionMigrateRequest *v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  MRPlaybackSessionMigrateRequest *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  MRPlaybackSessionMigrateRequest *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  MRPlaybackSessionMigrateRequest *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  MRPlaybackSessionMigrateRequest *v75;
  id v76;
  id v77;
  id v78;
  void (**v79)(_QWORD, _QWORD, _QWORD, _QWORD);
  id LocalEndpoint;
  MRAVReconnaissanceSession *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  __CFString *v97;
  void *v98;
  void *v99;
  id v101;
  _QWORD v102[4];
  MRAVReconnaissanceSession *v103;
  id v104;
  void (**v105)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v106[4];
  __CFString *v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  _QWORD v113[4];
  __CFString *v114;
  id v115;
  MRAVEndpoint *v116;
  id v117;
  id v118;
  id v119;
  _QWORD v120[4];
  MRPlaybackSessionMigrateRequest *v121;
  id v122;
  __CFString *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  _QWORD v129[4];
  MRPlaybackSessionMigrateRequest *v130;
  __CFString *v131;
  MRAVEndpoint *v132;
  id v133;
  id v134;
  id v135;
  _QWORD v136[4];
  MRPlaybackSessionMigrateRequest *v137;
  id v138;
  id v139;
  id v140;
  _QWORD v141[4];
  __CFString *v142;
  id v143;
  MRPlaybackSessionMigrateRequest *v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  _QWORD v150[5];
  MRPlaybackSessionMigrateRequest *v151;
  id v152;
  id v153;
  id v154;
  _QWORD v155[4];
  MRPlaybackSessionMigrateRequest *v156;
  __CFString *v157;
  id v158;
  MRAVEndpoint *v159;
  id v160;
  id v161;
  id v162;
  id v163;
  _QWORD v164[4];
  id v165;
  __CFString *v166;
  id v167;
  id v168;
  id v169;
  MRPlaybackSessionMigrateRequest *v170;
  id v171;
  id v172;
  uint8_t buf[4];
  const __CFString *v174;
  __int16 v175;
  id v176;
  __int16 v177;
  const __CFString *v178;
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v91 = a7;
  if (v12)
  {
    if (v15)
      goto LABEL_3;
LABEL_6:
    v15 = (id)MEMORY[0x1E0C80D38];
    v18 = MEMORY[0x1E0C80D38];
    if (v13)
      goto LABEL_4;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVEndpoint.m"), 775, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination"));

  if (!v15)
    goto LABEL_6;
LABEL_3:
  if (v13)
  {
LABEL_4:
    v16 = (MRPlaybackSessionMigrateRequest *)v13;
    goto LABEL_8;
  }
LABEL_7:
  v16 = objc_alloc_init(MRPlaybackSessionMigrateRequest);
LABEL_8:
  v19 = v16;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackSessionMigrateRequest requestID](v19, "requestID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v14;
  -[MRAVEndpoint _initiatorStringWithInitiator:uid:](self, v14, v20);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRAVEndpoint debugName](self, "debugName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  MRAVOutputDeviceArrayDescription(v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("source=%@ destination=%@"), v22, v23);

  v25 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("migrateToOutputDevice"), v20);
  v26 = v25;
  if (v24)
    -[__CFString appendFormat:](v25, "appendFormat:", CFSTR(" for %@"), v24);
  _MRLogForCategory(0xAuLL);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v174 = v26;
    _os_log_impl(&dword_193827000, v27, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }
  v97 = (__CFString *)v26;

  v28 = MEMORY[0x1E0C809B0];
  v164[0] = MEMORY[0x1E0C809B0];
  v164[1] = 3221225472;
  v164[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke;
  v164[3] = &unk_1E30C8348;
  v94 = v24;
  v165 = v94;
  v166 = CFSTR("migrateToOutputDevice");
  v29 = v20;
  v167 = v29;
  v93 = v95;
  v168 = v93;
  v96 = v13;
  v169 = v96;
  v30 = v19;
  v170 = v30;
  v92 = v91;
  v172 = v92;
  v31 = v15;
  v171 = v31;
  v32 = (void *)MEMORY[0x194036C44](v164);
  v155[0] = v28;
  v33 = v28;
  v155[1] = 3221225472;
  v155[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2;
  v155[3] = &unk_1E30CBD28;
  v34 = v30;
  v156 = v34;
  v157 = CFSTR("migrateToOutputDevice");
  v35 = v29;
  v158 = v35;
  v159 = self;
  v36 = v12;
  v160 = v36;
  v90 = v89;
  v161 = v90;
  v37 = v31;
  v162 = v37;
  v38 = v32;
  v163 = v38;
  v39 = (void *)MEMORY[0x194036C44](v155);
  v150[0] = v28;
  v150[1] = 3221225472;
  v150[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3;
  v150[3] = &unk_1E30CDF28;
  v150[4] = self;
  v40 = v34;
  v151 = v40;
  v41 = v37;
  v152 = v41;
  v42 = v38;
  v153 = v42;
  v43 = v39;
  v154 = v43;
  v44 = (void *)MEMORY[0x194036C44](v150);
  v141[0] = v33;
  v141[1] = 3221225472;
  v141[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_5;
  v141[3] = &unk_1E30CDF78;
  v142 = CFSTR("migrateToOutputDevice");
  v45 = v35;
  v143 = v45;
  v46 = v40;
  v144 = v46;
  v47 = v36;
  v145 = v47;
  v88 = v98;
  v146 = v88;
  v48 = v41;
  v147 = v48;
  v49 = v42;
  v148 = v49;
  v85 = v44;
  v149 = v85;
  v82 = (void *)MEMORY[0x194036C44](v141);
  v50 = MEMORY[0x1E0C809B0];
  v136[0] = MEMORY[0x1E0C809B0];
  v136[1] = 3221225472;
  v136[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_179;
  v136[3] = &unk_1E30CDFC8;
  v51 = v46;
  v137 = v51;
  v52 = v48;
  v138 = v52;
  v53 = v45;
  v139 = v53;
  v54 = v49;
  v140 = v54;
  v55 = (void *)MEMORY[0x194036C44](v136);
  v129[0] = v50;
  v129[1] = 3221225472;
  v129[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_4_190;
  v129[3] = &unk_1E30CE018;
  v56 = v51;
  v130 = v56;
  v84 = v55;
  v133 = v84;
  v131 = CFSTR("migrateToOutputDevice");
  v57 = v43;
  v134 = v57;
  v87 = v54;
  v135 = v87;
  v132 = self;
  v58 = (void *)MEMORY[0x194036C44](v129);
  objc_msgSend(v47, "mr_filter:", &__block_literal_global_205);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "count");

  if (v60)
  {
    _MRLogForCategory(0xAuLL);
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v174 = CFSTR("migrateToOutputDevice");
      v175 = 2114;
      v176 = v53;
      v177 = 2112;
      v178 = CFSTR("Migrating to silent primary. Will break any pre-existing groups...");
      _os_log_impl(&dword_193827000, v61, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v56, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v56, "endpointOptions") | 4);
  }
  objc_msgSend(v47, "mr_map:", &__block_literal_global_210_1);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = MEMORY[0x1E0C809B0];
  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_211;
  v120[3] = &unk_1E30CE0C8;
  v63 = v56;
  v121 = v63;
  v64 = v47;
  v122 = v64;
  v123 = CFSTR("migrateToOutputDevice");
  v65 = v53;
  v124 = v65;
  v83 = v85;
  v126 = v83;
  v86 = v52;
  v125 = v86;
  v66 = v57;
  v127 = v66;
  v67 = v82;
  v128 = v67;
  v68 = (void *)MEMORY[0x194036C44](v120);
  v113[0] = v62;
  v113[1] = 3221225472;
  v113[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3_222;
  v113[3] = &unk_1E30CE170;
  v114 = CFSTR("migrateToOutputDevice");
  v69 = v65;
  v115 = v69;
  v116 = self;
  v70 = v58;
  v118 = v70;
  v71 = v64;
  v117 = v71;
  v72 = v68;
  v119 = v72;
  v73 = (void *)MEMORY[0x194036C44](v113);
  v106[0] = v62;
  v106[1] = 3221225472;
  v106[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_4_242;
  v106[3] = &unk_1E30CE1B8;
  v107 = CFSTR("migrateToOutputDevice");
  v74 = v71;
  v101 = v69;
  v108 = v101;
  v75 = v63;
  v109 = v75;
  v76 = v66;
  v110 = v76;
  v77 = v73;
  v111 = v77;
  v78 = v72;
  v112 = v78;
  v79 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v106);
  if (objc_msgSend(v74, "mr_all:", &__block_literal_global_251))
  {
    LocalEndpoint = MRAVEndpointGetLocalEndpoint(0);
    ((void (**)(_QWORD, _QWORD, id, _QWORD))v79)[2](v79, 0, LocalEndpoint, 0);
  }
  else
  {
    objc_msgSend(v75, "startEvent:", CFSTR("search"));
    v102[0] = v62;
    v102[1] = 3221225472;
    v102[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_255;
    v102[3] = &unk_1E30CDC40;
    v103 = -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:]([MRAVReconnaissanceSession alloc], "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", v99, 0, 8);
    v104 = v75;
    v105 = v79;
    v81 = v103;
    -[MRAVReconnaissanceSession beginSearchWithTimeout:endpointsCompletion:](v81, "beginSearchWithTimeout:endpointsCompletion:", v102, 7.0);

  }
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13)
        goto LABEL_14;
      v15 = *(void **)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v16 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v30 = v15;
      v31 = 2114;
      v32 = v14;
      v33 = 2114;
      v34 = v16;
      v35 = 2048;
      v36 = v17;
      v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v6;
      v20 = 42;
    }
    else
    {
      if (!v13)
        goto LABEL_14;
      v21 = *(void **)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138543874;
      v30 = v21;
      v31 = 2114;
      v32 = v22;
      v33 = 2048;
      v34 = v23;
      v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v6;
      v20 = 32;
    }
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7)
      goto LABEL_14;
    v9 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544386;
    v30 = v9;
    v31 = 2114;
    v32 = v8;
    v33 = 2114;
    v34 = v3;
    v35 = 2114;
    v36 = v10;
    v37 = 2048;
    v38 = v12;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v3, v6);
LABEL_14:

  if (!*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 72), "finalize");
    MRLogCategoryMigrationOversize();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 72), "report");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v25;
      _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
  }
  v26 = *(void **)(a1 + 88);
  if (v26)
  {
    v28 = v26;
    v27 = v3;
    msv_dispatch_async_on_queue();

  }
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_164(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "endpointOptions") & 8) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Falling back to addOutputDevices because %@..."), v3);
    _MRLogForCategory(0xAuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v18 = v6;
      v19 = 2114;
      v20 = v7;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("addOutputDevices"));
    v8 = ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "playerOptions") >> 6) & 1;
    v9 = *(void **)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 72);
    v12 = *(_QWORD *)(a1 + 80);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_167;
    v13[3] = &unk_1E30C6878;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 88);
    objc_msgSend(v9, "addOutputDevices:initiator:fadeAudio:withReplyQueue:completion:", v10, v11, v8, v12, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }

}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_167(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("addOutputDevices"), v3);
  if (!v3 && (objc_msgSend(*(id *)(a1 + 32), "playerOptions") & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("play"));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@<%@>"), v6, v7);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"));

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_168;
    v9[3] = &unk_1E30C9458;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    MRMediaRemoteSendCommandToPlayer(0, v4, 0, 0, MEMORY[0x1E0C80D38], v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_168(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("play"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_4;
  v7[3] = &unk_1E30CDF00;
  v6 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v4, "performMigrationToEndpoint:request:queue:completion:", a2, v5, v6, v7);

}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFallbackReason:", MRPlaybackSessionMigrateFallbackReasonFromMRMediaRemoteError(objc_msgSend(v3, "code")));
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();

}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MRLogForCategory(0xAuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v18 = v5;
    v19 = 2114;
    v20 = v6;
    v21 = 2112;
    v22 = CFSTR("Migrating back to local. Route to selected output device then migrate.");
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, v3);
  objc_msgSend(*(id *)(a1 + 48), "startEvent:", CFSTR("routeToDevice"));
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_174;
  v10[3] = &unk_1E30CDF50;
  objc_copyWeak(&v16, (id *)buf);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 80);
  v15 = *(id *)(a1 + 88);
  objc_msgSend(v3, "setOutputDevices:initiator:withReplyQueue:completion:", v7, v8, v9, v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_174(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("routeToDevice"), v3);
    _MRLogForCategory(0xAuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = *(_QWORD *)(a1 + 48);
        v16 = 138543874;
        v17 = v7;
        v18 = 2114;
        v19 = v8;
        v20 = 2112;
        v21 = CFSTR("Failed to set route. Cancel migration.");
        _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v16, 0x20u);
      }

      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    else
    {
      if (v6)
      {
        v14 = *(_QWORD *)(a1 + 40);
        v15 = *(_QWORD *)(a1 + 48);
        v16 = 138543874;
        v17 = v14;
        v18 = 2114;
        v19 = v15;
        v20 = 2112;
        v21 = CFSTR("Successfully set route. Begin migration.");
        _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v16, 0x20u);
      }

      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    v9();
  }
  else
  {
    _MRLogForCategory(0xAuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v16 = 138543874;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      v20 = 2112;
      v21 = CFSTR("Failed to set route. Cancel migration.");
      _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v16, 0x20u);
    }

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 118);
    objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("routeToDevice"), v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_179(id *a1, void *a2)
{
  id v3;
  MRAVLightweightReconnaissanceSession *v4;
  id v5;
  id v6;
  MRAVLightweightReconnaissanceSession *v7;
  _QWORD v8[4];
  MRAVLightweightReconnaissanceSession *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(a1[4], "startEvent:", CFSTR("discoverDestinationEndpoint"));
  v4 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_182;
  v8[3] = &unk_1E30CDFA0;
  v9 = v4;
  v5 = a1[5];
  v10 = a1[4];
  v11 = a1[6];
  v12 = v3;
  v13 = a1[5];
  v14 = a1[7];
  v6 = v3;
  v7 = v4;
  -[MRAVLightweightReconnaissanceSession searchEndpointsForLeaderOutputDeviceUID:timeout:reason:queue:completion:](v7, "searchEndpointsForLeaderOutputDeviceUID:timeout:reason:queue:completion:", v6, CFSTR("discoverDestinationEndpoint"), v5, v8, 7.0);

}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_182(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v5, "endEvent:withError:", CFSTR("discoverDestinationEndpoint"), a3);
  objc_msgSend(*(id *)(a1 + 40), "startEvent:", CFSTR("updateActiveSystemEndpoint"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("migrationPlaybackSession<%@> for Expanse handoff"), *(_QWORD *)(a1 + 48));
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(void **)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3_187;
  v10[3] = &unk_1E30C7F50;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 72);
  MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithChangeType(v8, 0, 0, (uint64_t)v7, v9, v10);

}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3_187(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "endEvent:withError:", CFSTR("updateActiveSystemEndpoint"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_4_190(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  id *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  void *v20;
  _QWORD v21[4];
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_5_191;
  v23[3] = &unk_1E30CDFF0;
  v24 = a1[4];
  v27 = a1[7];
  v25 = a1[5];
  v5 = v3;
  v26 = v5;
  v28 = a1[8];
  v29 = a1[9];
  v6 = (void *)MEMORY[0x194036C44](v23);
  objc_msgSend(a1[4], "setRequestType:", 3);
  objc_msgSend(a1[4], "startEvent:", CFSTR("expanseMigration"));
  objc_msgSend(a1[6], "groupLeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsUID:", v5);

  _MRLogForCategory(0xAuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = a1[5];
      *(_DWORD *)buf = 138543874;
      v31 = v11;
      v32 = 2114;
      v33 = v5;
      v34 = 2112;
      v35 = CFSTR("Removing Apple TV from Expanse session.");
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    +[MRExpanseManager sharedManager](MRExpanseManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v4;
    v21[1] = 3221225472;
    v21[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_200;
    v21[3] = &unk_1E30C6798;
    v13 = &v22;
    v22 = v6;
    v14 = v6;
    objc_msgSend(v12, "removeTelevisionWithRouteIdentifierFromSession:completion:", v5, v21);
  }
  else
  {
    if (v10)
    {
      v15 = a1[5];
      *(_DWORD *)buf = 138543874;
      v31 = v15;
      v32 = 2114;
      v33 = v5;
      v34 = 2112;
      v35 = CFSTR("Migrating to Apple TV using Expanse handoff.");
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    +[MRExpanseManager sharedManager](MRExpanseManager, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_203;
    v18[3] = &unk_1E30C6590;
    v13 = &v20;
    v20 = v6;
    v19 = v5;
    v17 = v6;
    objc_msgSend(v16, "addTelevisionWithRouteIdentifierToSession:completion:", v19, v18);

    v12 = v19;
  }

}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_5_191(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("expanseMigration"), v6);
  if (v6)
  {
    objc_msgSend(v6, "mr_errorByEnvelopingWithMRError:", 174);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRExpanseManager sharedManager](MRExpanseManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "errorIsTelevisionCapabilitiesError:", v6);

    if (v9)
    {
      _MRLogForCategory(0xAuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v12 = *(_QWORD *)(a1 + 48);
        v14 = 138543874;
        v15 = v11;
        v16 = 2114;
        v17 = v12;
        v18 = 2112;
        v19 = CFSTR("Expanse fallback due to insufficient capabilities.");
        _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v14, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setFallbackReason:", 14);
      v13 = *(_QWORD *)(a1 + 64);
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 72);
    }
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_200(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_203(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_204(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isProxyGroupPlayer");
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_208(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_211(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "endpointOptions") & 0x40) == 0
    || (unint64_t)objc_msgSend(v3, "logicalOutputDeviceCount") < 2)
  {
    if (objc_msgSend(v3, "isLocalEndpoint"))
    {
      v8 = *(_QWORD *)(a1 + 88);
LABEL_12:
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
      goto LABEL_13;
    }
LABEL_11:
    v8 = *(_QWORD *)(a1 + 72);
    goto LABEL_12;
  }
  objc_msgSend(v3, "designatedGroupLeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) != 0)
  {

LABEL_8:
    _MRLogForCategory(0xAuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v27 = v14;
      v28 = 2114;
      v29 = v15;
      v30 = 2112;
      v31 = CFSTR("Migrating to group leader with group break behavior. Will reset output context on destination.");
      _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") | 4);
    goto LABEL_11;
  }
  objc_msgSend(v3, "designatedGroupLeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logicalDeviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logicalDeviceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v10, "isEqualToString:", v12);

  if ((v21 & 1) != 0)
    goto LABEL_8;
  _MRLogForCategory(0xAuLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    v27 = v17;
    v28 = 2114;
    v29 = v18;
    v30 = 2112;
    v31 = CFSTR("Migrating to secondary with group break behavior. Will form endpoint for secondary and migrate.");
    _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "mr_map:", &__block_literal_global_218_0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("createSecondaryEndpoint"));
  v20 = *(_QWORD *)(a1 + 64);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_221;
  v22[3] = &unk_1E30CE0A0;
  v23 = *(id *)(a1 + 32);
  v24 = *(id *)(a1 + 72);
  v25 = *(id *)(a1 + 80);
  +[MRAVEndpoint directEndpointForOutputDeviceUIDs:queue:completion:](MRAVEndpoint, "directEndpointForOutputDeviceUIDs:queue:completion:", v19, v20, v22);

LABEL_13:
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_216(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_221(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("createSecondaryEndpoint"), v5);
  if (v7)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setFallbackReason:", 12);
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();

}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3_222(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  int v47;
  _QWORD v48[4];
  NSObject *v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MRLogForCategory(0xAuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v51 = v5;
    v52 = 2114;
    v53 = v6;
    v54 = 2112;
    v55 = CFSTR("Checking for conversation handoff support.");
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  if (!objc_msgSend(v3, "isLocalEndpoint")
    || (+[MRExpanseManager sharedManager](MRExpanseManager, "sharedManager"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "expanseSessionHasRemoteActivity"),
        v7,
        !v8))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "isLocalEndpoint"))
    {
      +[MRExpanseManager sharedManager](MRExpanseManager, "sharedManager");
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!-[__CFString expanseHandoffSupported](v31, "expanseHandoffSupported"))
        goto LABEL_32;
      +[MRExpanseManager sharedManager](MRExpanseManager, "sharedManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "expanseSessionHasActiveActivity");

      if (v33)
      {
        _MRLogForCategory(0xAuLL);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = *(_QWORD *)(a1 + 32);
          v36 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v51 = v35;
          v52 = 2114;
          v53 = v36;
          v54 = 2112;
          v55 = CFSTR("Evaluating possible conversation push.");
          _os_log_impl(&dword_193827000, v34, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 56), "mr_compactMap:", &__block_literal_global_237);
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!-[__CFString count](v31, "count"))
          goto LABEL_32;
        if (objc_msgSend(*(id *)(a1 + 56), "count") != 1)
        {
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3_240;
          v48[3] = &unk_1E30C85A8;
          v44 = v3;
          v49 = v44;
          -[__CFString msv_firstWhere:](v31, "msv_firstWhere:", v48);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v45
            || (-[NSObject groupLeader](v44, "groupLeader"),
                v46 = (void *)objc_claimAutoreleasedReturnValue(),
                v47 = objc_msgSend(v46, "supportsSharePlayHandoff"),
                v46,
                !v47))
          {

            v41 = v49;
LABEL_31:

            goto LABEL_32;
          }
          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

          v40 = v49;
LABEL_29:

          goto LABEL_34;
        }
        objc_msgSend(*(id *)(a1 + 56), "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "supportsSharePlayHandoff");

        if (v38)
        {
          v39 = *(_QWORD *)(a1 + 64);
          -[__CFString firstObject](v31, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);
          goto LABEL_29;
        }
LABEL_32:

      }
    }
LABEL_33:
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_34;
  }
  _MRLogForCategory(0xAuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v51 = v10;
    v52 = 2114;
    v53 = v11;
    v54 = 2112;
    v55 = CFSTR("Evaluating possible conversation pull.");
    _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  +[MRExpanseManager sharedManager](MRExpanseManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "groupLeader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "deviceIsActiveTelevision:", v13);

  v15 = (void *)MEMORY[0x1E0CB3940];
  +[MRExpanseManager sharedManager](MRExpanseManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activeTelevisionRouteID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "groupLeader");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (!v14)
  {
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Failed to match activeTV: %@ to groupLeader: %@"), v17, v18);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    _MRLogForCategory(0xAuLL);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = *(_QWORD *)(a1 + 32);
      v43 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v51 = v42;
      v52 = 2114;
      v53 = v43;
      v54 = 2112;
      v55 = v31;
      _os_log_impl(&dword_193827000, v41, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }
    goto LABEL_31;
  }
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Matched activeTV: %@ to groupLeader: %@"), v17, v18);
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory(0xAuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v51 = v22;
    v52 = 2114;
    v53 = v23;
    v54 = 2112;
    v55 = v20;
    _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 48), "groupLeader");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "deviceSubtype");

  objc_msgSend(*(id *)(a1 + 48), "groupLeader");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v25 == 15)
  {
    objc_msgSend(v26, "clusterComposition");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "msv_firstWhere:", &__block_literal_global_231);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "uid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v26, "uid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v30)
    goto LABEL_33;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

LABEL_34:
}

BOOL __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_229(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceSubtype") == 13;
}

id __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_236(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (objc_msgSend(v2, "deviceSubtype") == 13)
  {
    objc_msgSend(v2, "uid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v2, "deviceSubtype") == 15)
  {
    objc_msgSend(v2, "clusterComposition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "msv_firstWhere:", &__block_literal_global_239);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_238(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceSubtype") == 13;
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_3_240(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "groupLeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsUID:", v3);

  return v5;
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_4_242(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void (*v13)(void);
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    if ((objc_msgSend(v8, "isLocalEndpoint") & 1) == 0)
    {
      if (!objc_msgSend(v7, "count")
        || (objc_msgSend(v7, "mr_filter:", &__block_literal_global_244),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "count"),
            v14,
            v15))
      {
        _MRLogForCategory(0xAuLL);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_QWORD *)(a1 + 32);
          v18 = *(_QWORD *)(a1 + 40);
          v21 = 138543874;
          v22 = v17;
          v23 = 2114;
          v24 = v18;
          v25 = 2112;
          v26 = CFSTR("Not attempting to migrate because device is not remote controllable.");
          _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v21, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 48), "setFallbackReason:", 3);
        v19 = *(_QWORD *)(a1 + 56);
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 39);
        (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
        goto LABEL_16;
      }
    }
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "supportExpanseMigration");

    if (v11)
      v12 = *(_QWORD *)(a1 + 64);
    else
      v12 = *(_QWORD *)(a1 + 72);
    v13 = *(void (**)(void))(v12 + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setFallbackReason:", 5);
    if (!v9)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 2, CFSTR("Output devices are not in the same endpoint"));
      (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v20);
LABEL_16:

      goto LABEL_17;
    }
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v13();
LABEL_17:

}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_5_243(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRemoteControllable") ^ 1;
}

uint64_t __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_250(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalDevice");
}

void __83__MRAVEndpoint_performMigrationToOutputDevices_request_initiator_queue_completion___block_invoke_2_255(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = a5;
  v12 = a4;
  v13 = a2;
  objc_msgSend(v9, "endEvent:withError:", CFSTR("search"), v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)performMigrationToEndpoint:(id)a3 request:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  MRPlaybackSessionMigrateRequest *v14;
  void *v15;
  id v16;
  MRPlaybackSessionMigrateRequest *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  const __CFString *v25;
  NSObject *v26;
  id v27;
  MRPlaybackSessionMigrateRequest *v28;
  id v29;
  void (**v30)(_QWORD, _QWORD);
  NSObject *v31;
  void *v32;
  void *ErrorWithDescription;
  unint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  MRPlaybackSessionMigrateRequest *v55;
  id v56;
  void (**v57)(_QWORD, _QWORD);
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  __CFString *v65;
  void *v66;
  _QWORD v67[4];
  MRPlaybackSessionMigrateRequest *v68;
  id v69;
  id v70;
  id v71;
  void (**v72)(_QWORD, _QWORD);
  _QWORD v73[4];
  MRPlaybackSessionMigrateRequest *v74;
  id v75;
  id v76;
  id v77;
  _QWORD v78[4];
  MRPlaybackSessionMigrateRequest *v79;
  __CFString *v80;
  void (**v81)(_QWORD, _QWORD);
  _QWORD v82[4];
  id v83;
  __CFString *v84;
  id v85;
  id v86;
  id v87;
  MRPlaybackSessionMigrateRequest *v88;
  id v89;
  id v90;
  uint8_t buf[4];
  const __CFString *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  const __CFString *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v60 = a6;
  if (v11)
  {
    if (v13)
      goto LABEL_3;
LABEL_6:
    v13 = (id)MEMORY[0x1E0C80D38];
    v16 = MEMORY[0x1E0C80D38];
    if (v12)
      goto LABEL_4;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVEndpoint.m"), 1054, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination"));

  if (!v13)
    goto LABEL_6;
LABEL_3:
  if (v12)
  {
LABEL_4:
    v14 = (MRPlaybackSessionMigrateRequest *)v12;
    goto LABEL_8;
  }
LABEL_7:
  v14 = objc_alloc_init(MRPlaybackSessionMigrateRequest);
LABEL_8:
  v17 = v14;
  -[MRPlaybackSessionMigrateRequest setOriginatorType:](v14, "setOriginatorType:", MRAnalyticsCompositionForEndpoint(self));
  -[MRPlaybackSessionMigrateRequest addDestinationType:](v17, "addDestinationType:", MRAnalyticsCompositionForEndpoint(v11));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackSessionMigrateRequest requestID](v17, "requestID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRAVEndpoint debugName](self, "debugName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v11;
  objc_msgSend(v11, "debugName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("source=%@ destination=%@"), v21, v22);

  v24 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("migrateToEndpoint"), v19);
  v25 = v24;
  if (v23)
    -[__CFString appendFormat:](v24, "appendFormat:", CFSTR(" for %@"), v23);
  _MRLogForCategory(0xAuLL);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v92 = v25;
    _os_log_impl(&dword_193827000, v26, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke;
  v82[3] = &unk_1E30C8348;
  v63 = v23;
  v83 = v63;
  v84 = CFSTR("migrateToEndpoint");
  v27 = v19;
  v85 = v27;
  v62 = v18;
  v86 = v62;
  v64 = v12;
  v87 = v64;
  v28 = v17;
  v88 = v28;
  v61 = v60;
  v90 = v61;
  v29 = v13;
  v89 = v29;
  v30 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](v82);
  v65 = (__CFString *)v25;
  if (-[MRAVEndpoint isLocalEndpoint](self, "isLocalEndpoint") && objc_msgSend(v66, "isLocalEndpoint"))
  {
    _MRLogForCategory(0xAuLL);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      -[MRPlaybackSessionMigrateRequest requestID](v28, "requestID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v92 = CFSTR("migrateToEndpoint");
      v93 = 2114;
      v94 = v32;
      v95 = 2112;
      v96 = CFSTR("Already airplaying to device. Removing All outputDevices instead...");
      _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);

    }
    -[MRPlaybackSessionMigrateRequest setRequestType:](v28, "setRequestType:", 1);
    -[MRPlaybackSessionMigrateRequest startEvent:](v28, "startEvent:", CFSTR("removeOutputDevices"));
    +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:](MRAVLocalEndpoint, "sharedLocalEndpointForRoutingContextWithUID:", 0);
    ErrorWithDescription = (void *)objc_claimAutoreleasedReturnValue();
    v34 = ((unint64_t)-[MRPlaybackSessionMigrateRequest playerOptions](v28, "playerOptions") >> 6) & 1;
    v35 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MRPlaybackSessionMigrateRequest initiator](v28, "initiator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackSessionMigrateRequest requestID](v28, "requestID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("%@-%@"), v36, v37, v61, v62, v63, v64, v65);
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_265;
    v78[3] = &unk_1E30C6878;
    v79 = v28;
    v80 = CFSTR("migrateToEndpoint");
    v81 = v30;
    objc_msgSend(ErrorWithDescription, "setOutputDevices:initiator:fadeAudio:withReplyQueue:completion:", 0, v38, v34, v29, v78);

    goto LABEL_20;
  }
  if ((-[MRPlaybackSessionMigrateRequest endpointOptions](v28, "endpointOptions") & 0x20) == 0)
  {
    -[MRAVEndpoint outputDevicesMatchingPredicate:](self, "outputDevicesMatchingPredicate:", &__block_literal_global_266);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    if (v40)
    {
      v41 = objc_alloc(MEMORY[0x1E0CB3940]);
      v42 = MRMediaRemotePlaybackSessionMigrateEndpointOptionsCopyDescription(32);
      -[MRAVEndpoint outputDevices](self, "outputDevices");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      MRAVOutputDeviceArrayDescription(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v41, "initWithFormat:", CFSTR("%@ option is not present and source contains %@"), v42, v44, v61, v62, v63, v64, v65);
      ErrorWithDescription = (void *)MRMediaRemoteCreateErrorWithDescription(150, (uint64_t)v45);

      ((void (**)(_QWORD, void *))v30)[2](v30, ErrorWithDescription);
LABEL_20:
      v46 = v66;
      goto LABEL_25;
    }
  }
  if ((-[MRPlaybackSessionMigrateRequest endpointOptions](v28, "endpointOptions") & 0x10) != 0
    || (objc_msgSend(v66, "outputDevices"),
        v47 = (void *)objc_claimAutoreleasedReturnValue(),
        v48 = MRAVOutputDeviceArrayNumberOfLogicalDevices(v47),
        v47,
        v48 < 2))
  {
    v54 = MEMORY[0x1E0C809B0];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_4;
    v73[3] = &unk_1E30CDFC8;
    v55 = v28;
    v74 = v55;
    v75 = v27;
    v56 = v29;
    v76 = v56;
    v57 = v30;
    v77 = v57;
    v58 = (void *)MEMORY[0x194036C44](v73);
    -[MRPlaybackSessionMigrateRequest startEvent:](v55, "startEvent:", CFSTR("connect"));
    v67[0] = v54;
    v67[1] = 3221225472;
    v67[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_6;
    v67[3] = &unk_1E30CE250;
    v68 = v55;
    v69 = v56;
    v46 = v66;
    v70 = v66;
    v71 = v58;
    v72 = v57;
    v59 = v58;
    -[MRAVEndpoint _prepareToMigrateToEndpoint:queue:completion:](self, v70, v69, v67);

    ErrorWithDescription = v74;
  }
  else
  {
    v49 = objc_alloc(MEMORY[0x1E0CB3940]);
    v50 = MRMediaRemotePlaybackSessionMigrateEndpointOptionsCopyDescription(16);
    v46 = v66;
    objc_msgSend(v66, "outputDevices");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    MRAVOutputDeviceArrayDescription(v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v49, "initWithFormat:", CFSTR("%@ option is not present and destination contains %@"), v50, v52, v61, v62, v63, v64, v65);
    ErrorWithDescription = (void *)MRMediaRemoteCreateErrorWithDescription(151, (uint64_t)v53);

    ((void (**)(_QWORD, void *))v30)[2](v30, ErrorWithDescription);
  }
LABEL_25:

}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13)
        goto LABEL_14;
      v15 = *(void **)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v16 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v30 = v15;
      v31 = 2114;
      v32 = v14;
      v33 = 2114;
      v34 = v16;
      v35 = 2048;
      v36 = v17;
      v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v6;
      v20 = 42;
    }
    else
    {
      if (!v13)
        goto LABEL_14;
      v21 = *(void **)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138543874;
      v30 = v21;
      v31 = 2114;
      v32 = v22;
      v33 = 2048;
      v34 = v23;
      v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v6;
      v20 = 32;
    }
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7)
      goto LABEL_14;
    v9 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544386;
    v30 = v9;
    v31 = 2114;
    v32 = v8;
    v33 = 2114;
    v34 = v3;
    v35 = 2114;
    v36 = v10;
    v37 = 2048;
    v38 = v12;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v3, v6);
LABEL_14:

  if (!*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 72), "finalize");
    MRLogCategoryMigrationOversize();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 72), "report");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v25;
      _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
  }
  v26 = *(void **)(a1 + 88);
  if (v26)
  {
    v28 = v26;
    v27 = v3;
    msv_dispatch_async_on_queue();

  }
}

uint64_t __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_259(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_265(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("removeOutputDevices"), v3);
  if (!v3 && (objc_msgSend(*(id *)(a1 + 32), "playerOptions") & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("play"));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@<%@>"), v6, v7);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"));

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_2;
    v9[3] = &unk_1E30C9458;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    MRMediaRemoteSendCommandToPlayer(0, v4, 0, 0, MEMORY[0x1E0C80D38], v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("play"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

BOOL __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceType") == 1;
}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "startEvent:", CFSTR("updateActiveSystemEndpoint"));
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = MRMediaRemotePlaybackSessionMigrateEndpointOptionsCopyDescription(2);
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("migrationPlaybackSession<%@> for option %@"), v6, v7);

  v9 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_5;
  v10[3] = &unk_1E30C7F50;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 56);
  MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithChangeType((uint64_t)v4, 0, 0, (uint64_t)v8, v9, v10);

}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "endEvent:withError:", CFSTR("updateActiveSystemEndpoint"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_6(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1[4], "endEvent:withError:", CFSTR("connect"), v9);
  if (v7 && v8)
  {
    v10 = a1[4];
    v11 = a1[5];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_7;
    v12[3] = &unk_1E30CE228;
    v13 = a1[6];
    v14 = a1[4];
    v15 = a1[5];
    v16 = a1[7];
    v17 = a1[8];
    MRMediaRemotePlaybackSessionMigrateForOriginWithRequest(v10, (uint64_t)v7, v8, v11, v12);

  }
  else
  {
    (*((void (**)(void))a1[8] + 2))();
  }

}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  MRAVLightweightReconnaissanceSession *v8;
  uint64_t v9;
  MRAVLightweightReconnaissanceSession *v10;
  _QWORD v11[4];
  MRAVLightweightReconnaissanceSession *v12;
  id v13;
  id v14;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "groupLeader");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "outputDeviceUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", v4))
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "outputDeviceUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    if ((objc_msgSend(*(id *)(a1 + 40), "endpointOptions") & 0x40) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "startEvent:", CFSTR("discoverDestinationEndpoint"));
      v8 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_8;
      v11[3] = &unk_1E30CE200;
      v12 = v8;
      v9 = *(_QWORD *)(a1 + 48);
      v13 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 56);
      v10 = v8;
      -[MRAVLightweightReconnaissanceSession searchEndpointsForLeaderOutputDeviceUID:timeout:reason:queue:completion:](v10, "searchEndpointsForLeaderOutputDeviceUID:timeout:reason:queue:completion:", v6, CFSTR("discoverDestinationEndpoint"), v9, v11, 7.0);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

void __68__MRAVEndpoint_performMigrationToEndpoint_request_queue_completion___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "endEvent:withError:", CFSTR("discoverDestinationEndpoint"), a3);
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v7, "designatedGroupLeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);

}

- (void)_prepareToMigrateToEndpoint:(void *)a3 queue:(void *)a4 completion:
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  MRBlockGuard *v17;
  id v18;
  MRBlockGuard *v19;
  void *v20;
  _QWORD block[4];
  MRBlockGuard *v22;
  id v23;
  void *v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  NSObject *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[5];
  NSObject *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  const __CFString *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_5:
        v44[0] = 0;
        v44[1] = v44;
        v44[2] = 0x3032000000;
        v44[3] = __Block_byref_object_copy__36;
        v44[4] = __Block_byref_object_dispose__36;
        v45 = 0;
        v42[0] = 0;
        v42[1] = v42;
        v42[2] = 0x3032000000;
        v42[3] = __Block_byref_object_copy__36;
        v42[4] = __Block_byref_object_dispose__36;
        v43 = 0;
        v40[0] = 0;
        v40[1] = v40;
        v40[2] = 0x3032000000;
        v40[3] = __Block_byref_object_copy__36;
        v40[4] = __Block_byref_object_dispose__36;
        v41 = 0;
        v11 = dispatch_group_create();
        v46 = CFSTR("MREndpointConnectionReasonUserInfoKey");
        v47[0] = CFSTR("prepareToMigrateToEndpoint");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v11);
        v13 = MEMORY[0x1E0C809B0];
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke;
        v36[3] = &unk_1E30C95C0;
        v38 = v40;
        v39 = v44;
        v36[4] = a1;
        v14 = v11;
        v37 = v14;
        objc_msgSend(a1, "connectToExternalDeviceWithUserInfo:completion:", v12, v36);
        dispatch_group_enter(v14);
        v31[0] = v13;
        v31[1] = 3221225472;
        v31[2] = __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke_2;
        v31[3] = &unk_1E30C95C0;
        v34 = v40;
        v35 = v42;
        v15 = v7;
        v32 = v15;
        v16 = v14;
        v33 = v16;
        objc_msgSend(v15, "connectToExternalDeviceWithUserInfo:completion:", v12, v31);
        v17 = [MRBlockGuard alloc];
        v29[0] = v13;
        v29[1] = 3221225472;
        v29[2] = __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke_3;
        v29[3] = &unk_1E30C6798;
        v18 = v9;
        v30 = v18;
        block[0] = v13;
        block[1] = 3221225472;
        block[2] = __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke_4;
        block[3] = &unk_1E30CE2C8;
        v22 = -[MRBlockGuard initWithTimeout:reason:queue:handler:](v17, "initWithTimeout:reason:queue:handler:", CFSTR("prepareToMigrateToEndpoint"), v8, v29, 7.0);
        v25 = v18;
        v26 = v40;
        v27 = v44;
        v28 = v42;
        v23 = v15;
        v24 = a1;
        v19 = v22;
        dispatch_group_notify(v16, v8, block);

        _Block_object_dispose(v40, 8);
        _Block_object_dispose(v42, 8);

        _Block_object_dispose(v44, 8);
        goto LABEL_6;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__prepareToMigrateToEndpoint_queue_completion_, a1, CFSTR("MRAVEndpoint.m"), 1191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination"));

      if (v8)
        goto LABEL_5;
    }
    v8 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    goto LABEL_5;
  }
LABEL_6:

}

- (void)canMigrateToEndpoint:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVEndpoint.m"), 1165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination"));

    if (v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!v10)
  {
LABEL_3:
    v10 = (id)MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
  }
LABEL_4:
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke;
  v22[3] = &unk_1E30C6590;
  v24 = v11;
  v14 = v10;
  v23 = v14;
  v15 = v11;
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke_3;
  v19[3] = &unk_1E30CE2A0;
  v20 = v14;
  v21 = (id)MEMORY[0x194036C44](v22);
  v16 = v21;
  v17 = v14;
  -[MRAVEndpoint _prepareToMigrateToEndpoint:queue:completion:](self, v9, v17, v19);

}

void __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v6 = v4;
    v5 = v3;
    msv_dispatch_async_on_queue();

  }
}

uint64_t __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  _QWORD v6[4];
  id v7;

  if (a2 && a3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke_4;
    v6[3] = &unk_1E30CE278;
    v5 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    MRMediaRemotePlaybackSessionRequestSupportedTypeForOrigin(a2, a3, v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __54__MRAVEndpoint_canMigrateToEndpoint_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_msgSend(*(id *)(a1 + 32), "origin");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_msgSend(*(id *)(a1 + 32), "origin");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

uint64_t __61__MRAVEndpoint__prepareToMigrateToEndpoint_queue_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  result = objc_msgSend(*(id *)(a1 + 32), "disarm");
  if ((_DWORD)result)
  {
    result = *(_QWORD *)(a1 + 56);
    if (result)
    {
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (!v3)
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
          && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
        {
          v3 = 0;
        }
        else
        {
          v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v5 = 40;
          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
            v5 = 48;
          v6 = objc_msgSend(v4, "initWithMRError:format:", 121, CFSTR("Both endpoints successfully connected but could not fetch the origin for %@"), *(_QWORD *)(a1 + v5));
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v8 = *(void **)(v7 + 40);
          *(_QWORD *)(v7 + 40) = v6;

          result = *(_QWORD *)(a1 + 56);
          v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        }
      }
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v3);
    }
  }
  return result;
}

- (void)removeOutputDeviceFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    v9 = (id)MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
  }
  v20 = CFSTR("MREndpointConnectionReasonUserInfoKey");
  v21[0] = CFSTR("removeOutputDeviceFromParentGroup");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__MRAVEndpoint_removeOutputDeviceFromParentGroup_queue_completion___block_invoke;
  v16[3] = &unk_1E30CE2F0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  -[MRAVEndpoint connectToExternalDeviceWithUserInfo:completion:](self, "connectToExternalDeviceWithUserInfo:completion:", v12, v16);

}

void __67__MRAVEndpoint_removeOutputDeviceFromParentGroup_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 56);
    if (v4)
    {
      v5 = *(NSObject **)(a1 + 48);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__MRAVEndpoint_removeOutputDeviceFromParentGroup_queue_completion___block_invoke_2;
      block[3] = &unk_1E30C6568;
      v11 = v4;
      v10 = v3;
      dispatch_async(v5, block);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "externalDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRAVEndpoint removeOutputDeviceFromParentGroup:queue:completion:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("MRAVEndpoint.m"), 1243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("externalDevice"));

    }
    objc_msgSend(v6, "removeFromParentGroup:queue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

uint64_t __67__MRAVEndpoint_removeOutputDeviceFromParentGroup_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)requestGroupSessionWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MRRequestDetails *v8;
  void *v9;
  void *v10;
  MRRequestDetails *v11;

  v6 = a4;
  v7 = a3;
  v8 = [MRRequestDetails alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRRequestDetails initWithName:requestID:reason:](v8, "initWithName:requestID:reason:", CFSTR("requestGroupSession"), v10, 0);

  -[MRAVEndpoint requestGroupSessionWithDetails:queue:completion:](self, "requestGroupSessionWithDetails:queue:completion:", v11, v7, v6);
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVEndpoint debugName](self, "debugName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v8, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@<%@>"), v14, v15);

  if (v12)
    objc_msgSend(v16, "appendFormat:", CFSTR(" for %@"), v12);
  _MRLogForCategory(0xAuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v16;
    _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke;
  v30[3] = &unk_1E30CE318;
  v31 = v12;
  v19 = v8;
  v32 = v19;
  v33 = v11;
  v34 = v10;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_291;
  v26[3] = &unk_1E30CE2F0;
  v26[4] = self;
  v27 = v19;
  v28 = v9;
  v29 = (id)MEMORY[0x194036C44](v30);
  v23 = v29;
  v24 = v9;
  v25 = v19;
  -[MRAVEndpoint connectToExternalDeviceWithOptions:details:completion:](self, "connectToExternalDeviceWithOptions:details:completion:", 0, v25, v26);

}

void __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[22];
  __int16 v33;
  uint64_t v34;
  _BYTE v35[24];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 40), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "requestID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)v32 = 138544386;
        *(_QWORD *)&v32[4] = v11;
        *(_WORD *)&v32[12] = 2114;
        *(_QWORD *)&v32[14] = v12;
        v33 = 2112;
        v34 = (uint64_t)v5;
        *(_WORD *)v35 = 2114;
        *(_QWORD *)&v35[2] = v13;
        *(_WORD *)&v35[10] = 2048;
        *(_QWORD *)&v35[12] = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v9;
        v18 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, v32, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10)
      goto LABEL_22;
    objc_msgSend(*(id *)(a1 + 40), "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "requestID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)v32 = 138544130;
    *(_QWORD *)&v32[4] = v11;
    *(_WORD *)&v32[12] = 2114;
    *(_QWORD *)&v32[14] = v12;
    v33 = 2112;
    v34 = (uint64_t)v5;
    *(_WORD *)v35 = 2048;
    *(_QWORD *)&v35[2] = v30;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v17 = v9;
    v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        objc_msgSend(*(id *)(a1 + 40), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "requestID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)v32 = 138544386;
        *(_QWORD *)&v32[4] = v11;
        *(_WORD *)&v32[12] = 2114;
        *(_QWORD *)&v32[14] = v12;
        v33 = 2114;
        v34 = (uint64_t)v6;
        *(_WORD *)v35 = 2114;
        *(_QWORD *)&v35[2] = v25;
        *(_WORD *)&v35[10] = 2048;
        *(_QWORD *)&v35[12] = v26;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", v32, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_cold_1(a1, (uint64_t)v6, (uint64_t)v9, v20, v21, v22, v23, v24, *(__int128 *)v32, *(int *)&v32[16], *(__int16 *)&v32[20], v33, v34, *(uint64_t *)v35, *(uint64_t *)&v35[8], *(uint64_t *)&v35[16], v36, v37, v38,
        v39,
        v40,
        v41,
        v42,
        v43,
        v44);
    }
    goto LABEL_22;
  }
  v27 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v27)
      goto LABEL_22;
    objc_msgSend(*(id *)(a1 + 40), "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "requestID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)v32 = 138543874;
    *(_QWORD *)&v32[4] = v11;
    *(_WORD *)&v32[12] = 2114;
    *(_QWORD *)&v32[14] = v12;
    v33 = 2048;
    v34 = v31;
    v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v17 = v9;
    v18 = 32;
    goto LABEL_16;
  }
  if (v27)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "requestID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)v32 = 138544130;
    *(_QWORD *)&v32[4] = v11;
    *(_WORD *)&v32[12] = 2114;
    *(_QWORD *)&v32[14] = v12;
    v33 = 2114;
    v34 = v28;
    *(_WORD *)v35 = 2048;
    *(_QWORD *)&v35[2] = v29;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_291(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_2;
    v6[3] = &unk_1E30C6568;
    v4 = *(NSObject **)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    v7 = v3;
    dispatch_async(v4, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "externalDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestGroupSessionWithDetails:queue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

uint64_t __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)volumeControlCapabilitiesOnQueue:(id)a3 completion:(id)a4
{
  -[MRAVEndpoint outputDeviceVolumeControlCapabilities:queue:completion:](self, "outputDeviceVolumeControlCapabilities:queue:completion:", 0, a3, a4);
}

- (unsigned)volumeCapabilities
{
  void *v2;
  unsigned int v3;

  -[MRAVEndpoint outputContextDataSource](self, "outputContextDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "volumeControlCapabilitiesForOutputDeviceUID:error:", 0, 0);

  return v3;
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  MRBlockGuard *v25;
  id v26;
  id v27;
  MRBlockGuard *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD v39[4];
  MRBlockGuard *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  __CFString *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRAVEndpoint debugName](self, "debugName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@-%@"), v15, v8);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("outputDeviceVolumeControlCapabilities"), v13);
  v18 = v17;
  if (v16)
    objc_msgSend(v17, "appendFormat:", CFSTR(" for %@"), v16);
  _MRLogForCategory(0xAuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v18;
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v35 = v18;
  v20 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke;
  v44[3] = &unk_1E30CE340;
  v45 = v16;
  v46 = CFSTR("outputDeviceVolumeControlCapabilities");
  v47 = v13;
  v48 = v11;
  v49 = v9;
  v50 = v10;
  v34 = v9;
  v33 = v10;
  v21 = v11;
  v22 = v13;
  v23 = v16;
  v24 = (void *)MEMORY[0x194036C44](v44);
  v25 = [MRBlockGuard alloc];
  v42[0] = v20;
  v42[1] = 3221225472;
  v42[2] = __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_2;
  v42[3] = &unk_1E30C6798;
  v26 = v24;
  v43 = v26;
  v39[0] = v20;
  v39[1] = 3221225472;
  v39[2] = __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_3;
  v39[3] = &unk_1E30C7660;
  v40 = -[MRBlockGuard initWithTimeout:reason:handler:](v25, "initWithTimeout:reason:handler:", CFSTR("outputDeviceVolumeControlCapabilities"), v42, 7.0);
  v41 = v26;
  v27 = v26;
  v28 = v40;
  v29 = (void *)MEMORY[0x194036C44](v39);
  v51[0] = CFSTR("MREndpointConnectionReasonUserInfoKey");
  v51[1] = CFSTR("MREndpointConnectionCorrelationIDUserInfoKey");
  v52[0] = CFSTR("outputDeviceVolumeControlCapabilities");
  v52[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v20;
  v36[1] = 3221225472;
  v36[2] = __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_4;
  v36[3] = &unk_1E30C6878;
  v36[4] = self;
  v37 = v8;
  v38 = v29;
  v31 = v29;
  v32 = v8;
  -[MRAVEndpoint connectToExternalDeviceWithUserInfo:completion:](self, "connectToExternalDeviceWithUserInfo:completion:", v30, v36);

}

void __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  _QWORD block[4];
  id v43;
  id v44;
  int v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    MRMediaRemoteVolumeControlCapabilitiesDescription(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = a1[4];
    _MRLogForCategory(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v15)
      {
        if (!v16)
          goto LABEL_21;
        v17 = a1[5];
        v18 = a1[6];
        MRMediaRemoteVolumeControlCapabilitiesDescription(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138544386;
        v47 = v17;
        v48 = 2114;
        v49 = v18;
        v50 = 2112;
        v51 = v12;
        v52 = 2114;
        v53 = v19;
        v54 = 2048;
        v55 = v21;
        v22 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v23 = v7;
        v24 = 52;
      }
      else
      {
        if (!v16)
          goto LABEL_21;
        v32 = a1[5];
        v33 = a1[6];
        MRMediaRemoteVolumeControlCapabilitiesDescription(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138544130;
        v47 = v32;
        v48 = 2114;
        v49 = v33;
        v50 = 2112;
        v51 = v12;
        v52 = 2048;
        v53 = v34;
        v22 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v23 = v7;
        v24 = 42;
      }
      _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);

    }
    else
    {
      if (v15)
      {
        if (!v16)
          goto LABEL_21;
        v26 = a1[5];
        v25 = a1[6];
        v27 = (void *)a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138544130;
        v47 = v26;
        v48 = 2114;
        v49 = v25;
        v50 = 2114;
        v51 = v27;
        v52 = 2048;
        v53 = v28;
        v29 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v30 = v7;
        v31 = 42;
      }
      else
      {
        if (!v16)
          goto LABEL_21;
        v35 = a1[5];
        v36 = a1[6];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138543874;
        v47 = v35;
        v48 = 2114;
        v49 = v36;
        v50 = 2048;
        v51 = v37;
        v29 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v30 = v7;
        v31 = 32;
      }
      _os_log_impl(&dword_193827000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    }
    goto LABEL_20;
  }
  v6 = a1[4];
  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8)
      goto LABEL_21;
    v10 = a1[5];
    v9 = a1[6];
    v11 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", a1[7]);
    *(_DWORD *)buf = 138544386;
    v47 = v10;
    v48 = 2114;
    v49 = v9;
    v50 = 2114;
    v51 = v5;
    v52 = 2114;
    v53 = v11;
    v54 = 2048;
    v55 = v13;
    _os_log_error_impl(&dword_193827000, v7, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v8)
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v5, v7);
LABEL_21:

  v38 = (void *)a1[9];
  if (v38)
  {
    v39 = a1[8];
    v40 = v39;
    if (!v39)
    {
      v40 = MEMORY[0x1E0C80D38];
      v41 = MEMORY[0x1E0C80D38];
      v38 = (void *)a1[9];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_294;
    block[3] = &unk_1E30C7638;
    v44 = v38;
    v45 = a2;
    v43 = v5;
    dispatch_async(v40, block);
    if (!v39)

  }
}

uint64_t __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_294(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__MRAVEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MRAVEndpoint translateClusterUIDIfNeeded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "outputContextDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v7, "volumeControlCapabilitiesForOutputDeviceUID:error:", v6, &v8);
    v5 = v8;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)translateClusterUIDIfNeeded:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "outputDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__MRAVEndpoint_translateClusterUIDIfNeeded___block_invoke;
    v15[3] = &unk_1E30C5F68;
    v5 = v3;
    v16 = v5;
    objc_msgSend(v4, "mr_first:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "externalDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isClusterAware");

    if ((v9 & 1) == 0 && objc_msgSend(v6, "deviceSubtype") == 15)
    {
      objc_msgSend(v6, "uid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "isEqualToString:", v10);

      if (v11)
      {
        objc_msgSend(v6, "primaryID");
        v12 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v12;
      }
    }
    v3 = v5;

    v13 = v3;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unsigned)volumeControlCapabilitiesForOutputDeviceUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MRAVEndpoint outputContextDataSource](self, "outputContextDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVEndpoint translateClusterUIDIfNeeded:](self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "volumeControlCapabilitiesForOutputDeviceUID:error:", v6, 0);
  return v4;
}

- (void)setVolume:(float)a3 queue:(id)a4 completion:(id)a5
{
  -[MRAVEndpoint setVolume:details:queue:completion:](self, "setVolume:details:queue:completion:", 0, a4, a5);
}

- (void)setVolume:(float)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
  -[MRAVEndpoint setOutputDeviceVolume:outputDevice:details:queue:completion:](self, "setOutputDeviceVolume:outputDevice:details:queue:completion:", 0, a4, a5, a6);
}

- (void)setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 queue:(id)a5 completion:(id)a6
{
  -[MRAVEndpoint setOutputDeviceVolume:outputDevice:details:queue:completion:](self, "setOutputDeviceVolume:outputDevice:details:queue:completion:", a4, 0, a5, a6);
}

- (void)setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MRRequestDetails *v16;
  MRRequestDetails *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  MRRequestDetails *v33;
  id v34;
  void *v35;
  MRBlockGuard *v36;
  id v37;
  id v38;
  MRBlockGuard *v39;
  void *v40;
  double v41;
  MRAVEndpoint *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  MRBlockGuard *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  __CFString *v52;
  MRRequestDetails *v53;
  id v54;
  id v55;
  id v56;
  float v57;
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v43 = v13;
  if (v13)
  {
    v16 = (MRRequestDetails *)v13;
  }
  else
  {
    v17 = [MRRequestDetails alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MRRequestDetails initWithName:requestID:reason:](v17, "initWithName:requestID:reason:", CFSTR("setOutputDeviceVolume"), v19, 0);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  v42 = self;
  -[MRAVEndpoint debugName](self, "debugName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@-%@"), v22, v12);

  v24 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[MRRequestDetails requestID](v16, "requestID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("Endpoint.setOutputDeviceVolume"), v25);

  if (v23)
    objc_msgSend(v26, "appendFormat:", CFSTR(" for %@"), v23);
  v44 = v26;
  v27 = v12;
  _MRLogForCategory(0xAuLL);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v59 = v44;
    _os_log_impl(&dword_193827000, v28, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v29 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
  v50[3] = &unk_1E30CE368;
  v57 = a3;
  v51 = v23;
  v52 = CFSTR("Endpoint.setOutputDeviceVolume");
  v53 = v16;
  v54 = v20;
  v55 = v14;
  v56 = v15;
  v30 = v14;
  v31 = v15;
  v32 = v20;
  v33 = v16;
  v34 = v23;
  v35 = (void *)MEMORY[0x194036C44](v50);
  v36 = [MRBlockGuard alloc];
  v48[0] = v29;
  v48[1] = 3221225472;
  v48[2] = __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_2;
  v48[3] = &unk_1E30C6798;
  v37 = v35;
  v49 = v37;
  v45[0] = v29;
  v45[1] = 3221225472;
  v45[2] = __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_3;
  v45[3] = &unk_1E30C75E8;
  v46 = -[MRBlockGuard initWithTimeout:reason:handler:](v36, "initWithTimeout:reason:handler:", CFSTR("Endpoint.setOutputDeviceVolume"), v48, 7.0);
  v47 = v37;
  v38 = v37;
  v39 = v46;
  v40 = (void *)MEMORY[0x194036C44](v45);
  *(float *)&v41 = a3;
  -[MRAVEndpoint _setOutputDeviceVolume:outputDevice:details:queue:completion:](v42, "_setOutputDeviceVolume:outputDevice:details:queue:completion:", v27, v33, v30, v40, v41);

}

void __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 80);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_QWORD *)(a1 + 32);
    _MRLogForCategory(0xAuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v14)
      {
        if (!v15)
          goto LABEL_21;
        v16 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "requestID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = *(_DWORD *)(a1 + 80);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544386;
        v43 = v16;
        v44 = 2114;
        v45 = v9;
        v46 = 2112;
        v47 = v11;
        v48 = 2114;
        v49 = v18;
        v50 = 2048;
        v51 = v20;
        v21 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v22 = v6;
        v23 = 52;
      }
      else
      {
        if (!v15)
          goto LABEL_21;
        v30 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "requestID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v31) = *(_DWORD *)(a1 + 80);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544130;
        v43 = v30;
        v44 = 2114;
        v45 = v9;
        v46 = 2112;
        v47 = v11;
        v48 = 2048;
        v49 = v32;
        v21 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v22 = v6;
        v23 = 42;
      }
      _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);

    }
    else
    {
      if (v14)
      {
        if (!v15)
          goto LABEL_21;
        v24 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "requestID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544130;
        v43 = v24;
        v44 = 2114;
        v45 = v9;
        v46 = 2114;
        v47 = v25;
        v48 = 2048;
        v49 = v26;
        v27 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v28 = v6;
        v29 = 42;
      }
      else
      {
        if (!v15)
          goto LABEL_21;
        v33 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "requestID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138543874;
        v43 = v33;
        v44 = 2114;
        v45 = v9;
        v46 = 2048;
        v47 = v34;
        v27 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v28 = v6;
        v29 = 32;
      }
      _os_log_impl(&dword_193827000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
    }
    goto LABEL_20;
  }
  v5 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (!v7)
      goto LABEL_21;
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "requestID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544386;
    v43 = v8;
    v44 = 2114;
    v45 = v9;
    v46 = 2114;
    v47 = v3;
    v48 = 2114;
    v49 = v10;
    v50 = 2048;
    v51 = v12;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v7)
    __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_cold_1(a1, v3, v6);
LABEL_21:

  v35 = *(void **)(a1 + 72);
  if (v35)
  {
    v36 = *(NSObject **)(a1 + 64);
    v37 = v36;
    if (!v36)
    {
      v37 = MEMORY[0x1E0C80D38];
      v38 = MEMORY[0x1E0C80D38];
      v35 = *(void **)(a1 + 72);
    }
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_301;
    v39[3] = &unk_1E30C6568;
    v41 = v35;
    v40 = v3;
    dispatch_async(v37, v39);
    if (!v36)

  }
}

uint64_t __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_301(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  float v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27 = CFSTR("MREndpointConnectionReasonUserInfoKey");
  v28[0] = CFSTR("setOutputDeviceVolume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__MRAVEndpoint__setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
  v21[3] = &unk_1E30CE390;
  v21[4] = self;
  v22 = v12;
  v26 = a3;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  -[MRAVEndpoint connectToExternalDeviceWithUserInfo:completion:](self, "connectToExternalDeviceWithUserInfo:completion:", v16, v21);

}

void __77__MRAVEndpoint__setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  id v5;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    -[MRAVEndpoint translateClusterUIDIfNeeded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "externalDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = *(_DWORD *)(a1 + 72);
    objc_msgSend(v3, "setOutputDeviceVolume:outputDeviceUID:details:queue:completion:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v4);

  }
}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  -[MRAVEndpoint outputContextDataSource](self, "outputContextDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  return v4;
}

- (void)volumeOnQueue:(id)a3 completion:(id)a4
{
  -[MRAVEndpoint outputDeviceVolume:queue:completion:](self, "outputDeviceVolume:queue:completion:", 0, a3, a4);
}

- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  MRBlockGuard *v25;
  id v26;
  id v27;
  MRBlockGuard *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD v39[4];
  MRBlockGuard *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  __CFString *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRAVEndpoint debugName](self, "debugName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@-%@"), v15, v8);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("Endpoint.outputDeviceVolume"), v13);
  v18 = v17;
  if (v16)
    objc_msgSend(v17, "appendFormat:", CFSTR(" for %@"), v16);
  _MRLogForCategory(0xAuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v18;
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v35 = v18;
  v20 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke;
  v44[3] = &unk_1E30CE3B8;
  v45 = v16;
  v46 = CFSTR("Endpoint.outputDeviceVolume");
  v47 = v13;
  v48 = v11;
  v49 = v9;
  v50 = v10;
  v34 = v9;
  v33 = v10;
  v21 = v11;
  v22 = v13;
  v23 = v16;
  v24 = (void *)MEMORY[0x194036C44](v44);
  v25 = [MRBlockGuard alloc];
  v42[0] = v20;
  v42[1] = 3221225472;
  v42[2] = __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_2;
  v42[3] = &unk_1E30C6798;
  v26 = v24;
  v43 = v26;
  v39[0] = v20;
  v39[1] = 3221225472;
  v39[2] = __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_3;
  v39[3] = &unk_1E30C76D8;
  v40 = -[MRBlockGuard initWithTimeout:reason:handler:](v25, "initWithTimeout:reason:handler:", CFSTR("Endpoint.outputDeviceVolume"), v42, 7.0);
  v41 = v26;
  v27 = v26;
  v28 = v40;
  v29 = (void *)MEMORY[0x194036C44](v39);
  v51[0] = CFSTR("MREndpointConnectionReasonUserInfoKey");
  v51[1] = CFSTR("MREndpointConnectionCorrelationIDUserInfoKey");
  v52[0] = CFSTR("Endpoint.outputDeviceVolume");
  v52[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v20;
  v36[1] = 3221225472;
  v36[2] = __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_4;
  v36[3] = &unk_1E30C6878;
  v36[4] = self;
  v37 = v8;
  v38 = v29;
  v31 = v29;
  v32 = v8;
  -[MRAVEndpoint connectToExternalDeviceWithUserInfo:completion:](self, "connectToExternalDeviceWithUserInfo:completion:", v30, v36);

}

void __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke(_QWORD *a1, void *a2, float a3)
{
  id v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  _QWORD block[4];
  id v45;
  id v46;
  float v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!v5)
  {
    *(float *)&v6 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = a1[4];
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v19 = a1[5];
        v20 = a1[6];
        *(float *)&v18 = a3;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138544386;
        v49 = v19;
        v50 = 2114;
        v51 = v20;
        v52 = 2112;
        v53 = v13;
        v54 = 2114;
        v55 = v21;
        v56 = 2048;
        v57 = v23;
        v24 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v25 = v8;
        v26 = 52;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v34 = a1[5];
        v35 = a1[6];
        *(float *)&v18 = a3;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138544130;
        v49 = v34;
        v50 = 2114;
        v51 = v35;
        v52 = 2112;
        v53 = v13;
        v54 = 2048;
        v55 = v36;
        v24 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v25 = v8;
        v26 = 42;
      }
      _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);

    }
    else
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v28 = a1[5];
        v27 = a1[6];
        v29 = (void *)a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138544130;
        v49 = v28;
        v50 = 2114;
        v51 = v27;
        v52 = 2114;
        v53 = v29;
        v54 = 2048;
        v55 = v30;
        v31 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v32 = v8;
        v33 = 42;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v37 = a1[5];
        v38 = a1[6];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138543874;
        v49 = v37;
        v50 = 2114;
        v51 = v38;
        v52 = 2048;
        v53 = v39;
        v31 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v32 = v8;
        v33 = 32;
      }
      _os_log_impl(&dword_193827000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
    }
    goto LABEL_20;
  }
  v7 = a1[4];
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9)
      goto LABEL_21;
    v11 = a1[5];
    v10 = a1[6];
    v12 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
    *(_DWORD *)buf = 138544386;
    v49 = v11;
    v50 = 2114;
    v51 = v10;
    v52 = 2114;
    v53 = v5;
    v54 = 2114;
    v55 = v12;
    v56 = 2048;
    v57 = v14;
    _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9)
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v5, v8);
LABEL_21:

  v40 = (void *)a1[9];
  if (v40)
  {
    v41 = a1[8];
    v42 = v41;
    if (!v41)
    {
      v42 = MEMORY[0x1E0C80D38];
      v43 = MEMORY[0x1E0C80D38];
      v40 = (void *)a1[9];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_304;
    block[3] = &unk_1E30C7638;
    v46 = v40;
    v47 = a3;
    v45 = v5;
    dispatch_async(v42, block);
    if (!v41)

  }
}

uint64_t __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_304(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, float))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(float *)(a1 + 48));
}

uint64_t __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 32) + 16))(0.0);
}

void __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_3(uint64_t a1, void *a2, float a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(float))(*(_QWORD *)(a1 + 40) + 16))(a3);

}

void __52__MRAVEndpoint_outputDeviceVolume_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  id v5;
  void *v6;
  void *v7;
  float v8;
  id v9;

  v3 = a2;
  v4 = 0.0;
  v5 = v3;
  if (!v3)
  {
    -[MRAVEndpoint translateClusterUIDIfNeeded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "outputContextDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v7, "volumeForOutputDeviceUID:error:", v6, &v9);
    v4 = v8;
    v5 = v9;

  }
  (*(void (**)(float))(*(_QWORD *)(a1 + 48) + 16))(v4);

}

- (float)volumeForOutputDeviceUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;

  v4 = a3;
  -[MRAVEndpoint outputContextDataSource](self, "outputContextDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVEndpoint translateClusterUIDIfNeeded:](self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "volumeForOutputDeviceUID:error:", v6, 0);
  v8 = v7;

  return v8;
}

- (void)adjustVolume:(int64_t)a3 queue:(id)a4 completion:(id)a5
{
  -[MRAVEndpoint adjustOutputDeviceVolume:outputDevice:queue:completion:](self, "adjustOutputDeviceVolume:outputDevice:queue:completion:", a3, 0, a4, a5);
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDevice:(id)a4 queue:(id)a5 completion:(id)a6
{
  -[MRAVEndpoint adjustOutputDeviceVolume:outputDevice:details:queue:completion:](self, "adjustOutputDeviceVolume:outputDevice:details:queue:completion:", a3, a4, 0, a5, a6);
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  MRRequestDetails *v15;
  MRRequestDetails *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  MRRequestDetails *v28;
  id v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  __CFString *v34;
  MRRequestDetails *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (v12)
  {
    v15 = (MRRequestDetails *)v12;
  }
  else
  {
    v16 = [MRRequestDetails alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MRRequestDetails initWithName:requestID:reason:](v16, "initWithName:requestID:reason:", CFSTR("adjustOutputDeviceVolume"), v18, 0);

  }
  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRAVEndpoint debugName](self, "debugName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("%@-%@"), v20, v11);

  v22 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[MRRequestDetails requestID](v15, "requestID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("Endpoint.adjustOutputDeviceVolume"), v23);

  if (v21)
    objc_msgSend(v24, "appendFormat:", CFSTR(" for %@"), v21);
  _MRLogForCategory(0xAuLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v24;
    _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __79__MRAVEndpoint_adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
  v32[3] = &unk_1E30CE3E0;
  v33 = v21;
  v34 = CFSTR("Endpoint.adjustOutputDeviceVolume");
  v36 = v13;
  v37 = v14;
  v35 = v15;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v21;
  v30 = (void *)MEMORY[0x194036C44](v32);
  -[MRAVEndpoint _adjustOutputDeviceVolume:outputDevice:details:queue:completion:](self, "_adjustOutputDeviceVolume:outputDevice:details:queue:completion:", a3, v11, v28, v26, v30);

}

void __79__MRAVEndpoint_adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  _BYTE buf[24];
  uint64_t v37;
  _BYTE v38[24];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v19 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v19)
        goto LABEL_14;
      v20 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v17);
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2114;
      v37 = v21;
      *(_WORD *)v38 = 2048;
      *(_QWORD *)&v38[2] = v22;
      v23 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v24 = v6;
      v25 = 42;
    }
    else
    {
      if (!v19)
        goto LABEL_14;
      v26 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v17);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2048;
      v37 = v27;
      v23 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v24 = v6;
      v25 = 32;
    }
    _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7)
      goto LABEL_14;
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "requestID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v17);
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2114;
    v37 = (uint64_t)v3;
    *(_WORD *)v38 = 2114;
    *(_QWORD *)&v38[2] = v15;
    *(_WORD *)&v38[10] = 2048;
    *(_QWORD *)&v38[12] = v18;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
    __79__MRAVEndpoint_adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_cold_1(a1, (uint64_t)v3, (uint64_t)v6, v8, v9, v10, v11, v12, v29, v30, SWORD2(v30), SHIWORD(v30), v31, v32, v34, *(uint64_t *)buf, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16], v37,
      *(uint64_t *)v38,
      *(uint64_t *)&v38[8],
      *(uint64_t *)&v38[16],
      v39,
      v40,
      v41);
LABEL_14:

  v28 = *(void **)(a1 + 64);
  if (v28)
  {
    v35 = v28;
    v33 = v3;
    msv_dispatch_async_on_queue();

  }
}

uint64_t __79__MRAVEndpoint_adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_310(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_adjustOutputDeviceVolume:(int64_t)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  int64_t v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v29[0] = CFSTR("MREndpointConnectionReasonUserInfoKey");
  objc_msgSend(v13, "reason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = CFSTR("MREndpointConnectionCorrelationIDUserInfoKey");
  v30[0] = v16;
  objc_msgSend(v13, "requestID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__MRAVEndpoint__adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
  v23[3] = &unk_1E30CE408;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = a3;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  -[MRAVEndpoint connectToExternalDeviceWithUserInfo:completion:](self, "connectToExternalDeviceWithUserInfo:completion:", v18, v23);

}

void __80__MRAVEndpoint__adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    -[MRAVEndpoint translateClusterUIDIfNeeded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "externalDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "adjustOutputDeviceVolume:outputDeviceUID:details:queue:completion:", *(_QWORD *)(a1 + 72), v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
}

- (void)muteVolume:(BOOL)a3 queue:(id)a4 completion:(id)a5
{
  -[MRAVEndpoint muteVolume:details:queue:completion:](self, "muteVolume:details:queue:completion:", a3, 0, a4, a5);
}

- (void)muteVolume:(BOOL)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
  -[MRAVEndpoint muteOutputDeviceVolume:outputDevice:details:queue:completion:](self, "muteOutputDeviceVolume:outputDevice:details:queue:completion:", a3, 0, 0, a5, a6);
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDevice:(id)a4 queue:(id)a5 completion:(id)a6
{
  -[MRAVEndpoint muteOutputDeviceVolume:outputDevice:details:queue:completion:](self, "muteOutputDeviceVolume:outputDevice:details:queue:completion:", a3, a4, 0, a5, a6);
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  MRRequestDetails *v16;
  MRRequestDetails *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  MRRequestDetails *v33;
  id v34;
  void *v35;
  MRBlockGuard *v36;
  void *v37;
  id v38;
  MRBlockGuard *v39;
  id v40;
  MRBlockGuard *v41;
  void *v42;
  MRAVEndpoint *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  MRBlockGuard *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  __CFString *v54;
  MRRequestDetails *v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v10 = a3;
  v61 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v45 = v13;
  if (v13)
  {
    v16 = (MRRequestDetails *)v13;
  }
  else
  {
    v17 = [MRRequestDetails alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MRRequestDetails initWithName:requestID:reason:](v17, "initWithName:requestID:reason:", CFSTR("muteOutputDeviceVolume"), v19, CFSTR("API"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  v43 = self;
  -[MRAVEndpoint debugName](self, "debugName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v10;
  v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@-%@ -> %u"), v22, v12, v10);

  v24 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[MRRequestDetails requestID](v16, "requestID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("Endpoint.muteOutputDeviceVolume"), v25);

  if (v23)
    objc_msgSend(v26, "appendFormat:", CFSTR(" for %@"), v23);
  v46 = v26;
  v27 = v12;
  _MRLogForCategory(0xAuLL);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v60 = v46;
    _os_log_impl(&dword_193827000, v28, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v29 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
  v52[3] = &unk_1E30CB258;
  v53 = v23;
  v54 = CFSTR("Endpoint.muteOutputDeviceVolume");
  v55 = v16;
  v56 = v20;
  v57 = v14;
  v58 = v15;
  v30 = v14;
  v31 = v15;
  v32 = v20;
  v33 = v16;
  v34 = v23;
  v35 = (void *)MEMORY[0x194036C44](v52);
  v36 = [MRBlockGuard alloc];
  -[MRRequestDetails name](v33, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v29;
  v50[1] = 3221225472;
  v50[2] = __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_2;
  v50[3] = &unk_1E30C6798;
  v38 = v35;
  v51 = v38;
  v39 = -[MRBlockGuard initWithTimeout:reason:handler:](v36, "initWithTimeout:reason:handler:", v37, v50, 7.0);

  v47[0] = v29;
  v47[1] = 3221225472;
  v47[2] = __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_3;
  v47[3] = &unk_1E30C75E8;
  v48 = v39;
  v49 = v38;
  v40 = v38;
  v41 = v39;
  v42 = (void *)MEMORY[0x194036C44](v47);
  -[MRAVEndpoint _muteOutputDeviceVolume:outputDevice:details:queue:completion:](v43, "_muteOutputDeviceVolume:outputDevice:details:queue:completion:", v44, v27, v33, v30, v42);

}

void __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13)
        goto LABEL_14;
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v26 = v14;
      v27 = 2114;
      v28 = v9;
      v29 = 2114;
      v30 = v15;
      v31 = 2048;
      v32 = v16;
      v17 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v18 = v6;
      v19 = 42;
    }
    else
    {
      if (!v13)
        goto LABEL_14;
      v20 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138543874;
      v26 = v20;
      v27 = 2114;
      v28 = v9;
      v29 = 2048;
      v30 = v21;
      v17 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v18 = v6;
      v19 = 32;
    }
    _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7)
      goto LABEL_14;
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "requestID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544386;
    v26 = v8;
    v27 = 2114;
    v28 = v9;
    v29 = 2114;
    v30 = v3;
    v31 = 2114;
    v32 = v10;
    v33 = 2048;
    v34 = v12;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
    __76__MRAVEndpoint_setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_cold_1(a1, v3, v6);
LABEL_14:

  v22 = *(void **)(a1 + 72);
  if (v22)
  {
    v24 = v22;
    v23 = v3;
    msv_dispatch_async_on_queue();

  }
}

uint64_t __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_319(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__MRAVEndpoint_muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_muteOutputDeviceVolume:(BOOL)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v29[0] = CFSTR("MREndpointConnectionReasonUserInfoKey");
  objc_msgSend(v13, "reason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = CFSTR("MREndpointConnectionCorrelationIDUserInfoKey");
  v30[0] = v16;
  objc_msgSend(v13, "requestID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__MRAVEndpoint__muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
  v23[3] = &unk_1E30CE430;
  v23[4] = self;
  v24 = v12;
  v28 = a3;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  -[MRAVEndpoint connectToExternalDeviceWithUserInfo:completion:](self, "connectToExternalDeviceWithUserInfo:completion:", v18, v23);

}

void __78__MRAVEndpoint__muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    -[MRAVEndpoint translateClusterUIDIfNeeded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "externalDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "muteOutputDeviceVolume:outputDeviceUID:details:queue:completion:", *(unsigned __int8 *)(a1 + 72), v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
}

- (BOOL)isVolumeMuted
{
  void *v2;
  char v3;

  -[MRAVEndpoint outputContextDataSource](self, "outputContextDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVolumeMuted");

  return v3;
}

- (void)volumeMutedOnQueue:(id)a3 completion:(id)a4
{
  -[MRAVEndpoint outputDeviceVolumeMuted:queue:completion:](self, "outputDeviceVolumeMuted:queue:completion:", 0, a3, a4);
}

- (void)outputDeviceVolumeMuted:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  MRBlockGuard *v25;
  id v26;
  id v27;
  MRBlockGuard *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD v39[4];
  MRBlockGuard *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  __CFString *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRAVEndpoint debugName](self, "debugName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@-%@"), v15, v8);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("Endpoint.outputDeviceVolumeMuted"), v13);
  v18 = v17;
  if (v16)
    objc_msgSend(v17, "appendFormat:", CFSTR(" for %@"), v16);
  _MRLogForCategory(0xAuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v18;
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v35 = v18;
  v20 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke;
  v44[3] = &unk_1E30CE480;
  v45 = v16;
  v46 = CFSTR("Endpoint.outputDeviceVolumeMuted");
  v47 = v13;
  v48 = v11;
  v49 = v9;
  v50 = v10;
  v34 = v9;
  v33 = v10;
  v21 = v11;
  v22 = v13;
  v23 = v16;
  v24 = (void *)MEMORY[0x194036C44](v44);
  v25 = [MRBlockGuard alloc];
  v42[0] = v20;
  v42[1] = 3221225472;
  v42[2] = __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_2;
  v42[3] = &unk_1E30C6798;
  v26 = v24;
  v43 = v26;
  v39[0] = v20;
  v39[1] = 3221225472;
  v39[2] = __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_3;
  v39[3] = &unk_1E30CE4A8;
  v40 = -[MRBlockGuard initWithTimeout:reason:handler:](v25, "initWithTimeout:reason:handler:", CFSTR("Endpoint.outputDeviceVolumeMuted"), v42, 7.0);
  v41 = v26;
  v27 = v26;
  v28 = v40;
  v29 = (void *)MEMORY[0x194036C44](v39);
  v51[0] = CFSTR("MREndpointConnectionReasonUserInfoKey");
  v51[1] = CFSTR("MREndpointConnectionCorrelationIDUserInfoKey");
  v52[0] = CFSTR("Endpoint.outputDeviceVolumeMuted");
  v52[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v20;
  v36[1] = 3221225472;
  v36[2] = __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_4;
  v36[3] = &unk_1E30C6878;
  v36[4] = self;
  v37 = v8;
  v38 = v29;
  v31 = v29;
  v32 = v8;
  -[MRAVEndpoint connectToExternalDeviceWithUserInfo:completion:](self, "connectToExternalDeviceWithUserInfo:completion:", v30, v36);

}

void __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  _QWORD block[4];
  id v43;
  id v44;
  char v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = a1[4];
    _MRLogForCategory(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v15)
      {
        if (!v16)
          goto LABEL_21;
        v17 = a1[5];
        v18 = a1[6];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138544386;
        v47 = v17;
        v48 = 2114;
        v49 = v18;
        v50 = 2112;
        v51 = v12;
        v52 = 2114;
        v53 = v19;
        v54 = 2048;
        v55 = v21;
        v22 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v23 = v7;
        v24 = 52;
      }
      else
      {
        if (!v16)
          goto LABEL_21;
        v32 = a1[5];
        v33 = a1[6];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138544130;
        v47 = v32;
        v48 = 2114;
        v49 = v33;
        v50 = 2112;
        v51 = v12;
        v52 = 2048;
        v53 = v34;
        v22 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v23 = v7;
        v24 = 42;
      }
      _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);

    }
    else
    {
      if (v15)
      {
        if (!v16)
          goto LABEL_21;
        v26 = a1[5];
        v25 = a1[6];
        v27 = (void *)a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138544130;
        v47 = v26;
        v48 = 2114;
        v49 = v25;
        v50 = 2114;
        v51 = v27;
        v52 = 2048;
        v53 = v28;
        v29 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v30 = v7;
        v31 = 42;
      }
      else
      {
        if (!v16)
          goto LABEL_21;
        v35 = a1[5];
        v36 = a1[6];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138543874;
        v47 = v35;
        v48 = 2114;
        v49 = v36;
        v50 = 2048;
        v51 = v37;
        v29 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v30 = v7;
        v31 = 32;
      }
      _os_log_impl(&dword_193827000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    }
    goto LABEL_20;
  }
  v6 = a1[4];
  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8)
      goto LABEL_21;
    v10 = a1[5];
    v9 = a1[6];
    v11 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", a1[7]);
    *(_DWORD *)buf = 138544386;
    v47 = v10;
    v48 = 2114;
    v49 = v9;
    v50 = 2114;
    v51 = v5;
    v52 = 2114;
    v53 = v11;
    v54 = 2048;
    v55 = v13;
    _os_log_error_impl(&dword_193827000, v7, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v8)
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v5, v7);
LABEL_21:

  v38 = (void *)a1[9];
  if (v38)
  {
    v39 = a1[8];
    v40 = v39;
    if (!v39)
    {
      v40 = MEMORY[0x1E0C80D38];
      v41 = MEMORY[0x1E0C80D38];
      v38 = (void *)a1[9];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_322;
    block[3] = &unk_1E30CE458;
    v44 = v38;
    v45 = a2;
    v43 = v5;
    dispatch_async(v40, block);
    if (!v39)

  }
}

uint64_t __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_322(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__MRAVEndpoint_outputDeviceVolumeMuted_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MRAVEndpoint translateClusterUIDIfNeeded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "outputContextDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v7, "volumeMutedForOutputDeviceID:error:", v6, &v8);
    v5 = v8;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (BOOL)volumeMutedForOutputDeviceUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MRAVEndpoint outputContextDataSource](self, "outputContextDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVEndpoint translateClusterUIDIfNeeded:](self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "volumeMutedForOutputDeviceID:error:", v6, 0);
  return (char)v4;
}

- (void)waitForPlaybackWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  MRNowPlayingControllerHelper *v19;
  uint64_t v20;
  MRNowPlayingControllerHelper *v21;
  id v22;
  id v23;
  void *v24;
  MRBlockGuard *v25;
  id v26;
  MRBlockGuard *v27;
  id v28;
  void *v29;
  MRDestination *v30;
  MRNowPlayingControllerConfiguration *v31;
  MRNowPlayingController *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  MRBlockGuard *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  MRNowPlayingControllerHelper *v53;
  id v54;
  __CFString *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRAVEndpoint debugName](self, "debugName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@-%lf"), v14, *(_QWORD *)&a3);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("Endpoint.waitForPlaybackWithTimeout"), v12);
  v17 = v16;
  if (v15)
    objc_msgSend(v16, "appendFormat:", CFSTR(" for %@"), v15);
  v40 = v17;
  _MRLogForCategory(0xAuLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v40;
    _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v19 = objc_alloc_init(MRNowPlayingControllerHelper);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__36;
  v64 = __Block_byref_object_dispose__36;
  v65 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke;
  v52[3] = &unk_1E30CE4D0;
  v21 = v19;
  v53 = v21;
  p_buf = &buf;
  v39 = v15;
  v54 = v39;
  v55 = CFSTR("Endpoint.waitForPlaybackWithTimeout");
  v22 = v12;
  v56 = v22;
  v23 = v10;
  v57 = v23;
  v38 = v9;
  v59 = v38;
  v37 = v8;
  v58 = v37;
  v24 = (void *)MEMORY[0x194036C44](v52);
  v25 = [MRBlockGuard alloc];
  v50[0] = v20;
  v50[1] = 3221225472;
  v50[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_2;
  v50[3] = &unk_1E30C6798;
  v26 = v24;
  v51 = v26;
  v47[0] = v20;
  v47[1] = 3221225472;
  v47[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_3;
  v47[3] = &unk_1E30C75E8;
  v27 = -[MRBlockGuard initWithTimeout:reason:handler:](v25, "initWithTimeout:reason:handler:", CFSTR("Endpoint.waitForPlaybackWithTimeout"), v50, a3);
  v48 = v27;
  v28 = v26;
  v49 = v28;
  v29 = (void *)MEMORY[0x194036C44](v47);
  v30 = -[MRDestination initWithEndpoint:]([MRDestination alloc], "initWithEndpoint:", self);
  v31 = -[MRNowPlayingControllerConfiguration initWithDestination:]([MRNowPlayingControllerConfiguration alloc], "initWithDestination:", v30);
  -[MRNowPlayingControllerConfiguration setRequestPlaybackState:](v31, "setRequestPlaybackState:", 1);
  v32 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v31);
  v33 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v32;

  v45[0] = v20;
  v45[1] = 3221225472;
  v45[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_4;
  v45[3] = &unk_1E30CE4F8;
  v34 = v29;
  v46 = v34;
  -[MRNowPlayingControllerHelper setDidLoadResponse:](v21, "setDidLoadResponse:", v45);
  v43[0] = v20;
  v43[1] = 3221225472;
  v43[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_5;
  v43[3] = &unk_1E30C6798;
  v35 = v34;
  v44 = v35;
  -[MRNowPlayingControllerHelper setDidFailWithError:](v21, "setDidFailWithError:", v43);
  v41[0] = v20;
  v41[1] = 3221225472;
  v41[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_6;
  v41[3] = &unk_1E30CA878;
  v36 = v35;
  v42 = v36;
  -[MRNowPlayingControllerHelper setPlaybackStateDidChange:](v21, "setPlaybackStateDidChange:", v41);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setDelegate:", v21);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "beginLoadingUpdates");

  _Block_object_dispose(&buf, 8);
}

void __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "endLoadingUpdates");
  v5 = *(_QWORD *)(a1 + 40);
  _MRLogForCategory(0xAuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v3)
  {
    v14 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v14)
        goto LABEL_14;
      v16 = *(_QWORD *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 56);
      v17 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
      *(_DWORD *)buf = 138544130;
      v33 = v16;
      v34 = 2114;
      v35 = v15;
      v36 = 2114;
      v37 = v17;
      v38 = 2048;
      v39 = v18;
      v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v20 = v7;
      v21 = 42;
    }
    else
    {
      if (!v14)
        goto LABEL_14;
      v22 = *(_QWORD *)(a1 + 48);
      v23 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
      *(_DWORD *)buf = 138543874;
      v33 = v22;
      v34 = 2114;
      v35 = v23;
      v36 = 2048;
      v37 = v24;
      v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v20 = v7;
      v21 = 32;
    }
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_13;
  }
  v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (!v8)
      goto LABEL_14;
    v10 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    *(_DWORD *)buf = 138544386;
    v33 = v10;
    v34 = 2114;
    v35 = v9;
    v36 = 2114;
    v37 = v3;
    v38 = 2114;
    v39 = v11;
    v40 = 2048;
    v41 = v13;
    _os_log_error_impl(&dword_193827000, v7, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v8)
    __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_cold_1(a1, v3, v7);
LABEL_14:

  v25 = *(void **)(a1 + 80);
  if (v25)
  {
    v26 = *(NSObject **)(a1 + 72);
    v27 = v26;
    if (!v26)
    {
      v27 = MEMORY[0x1E0C80D38];
      v28 = MEMORY[0x1E0C80D38];
      v25 = *(void **)(a1 + 80);
    }
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_329;
    v29[3] = &unk_1E30C6568;
    v31 = v25;
    v30 = v3;
    dispatch_async(v27, v29);
    if (!v26)

  }
}

uint64_t __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_329(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;

  result = MRMediaRemotePlaybackStateIsAdvancing(objc_msgSend(a2, "playbackState"));
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

uint64_t __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__MRAVEndpoint_waitForPlaybackWithTimeout_queue_completion___block_invoke_6(uint64_t a1, int a2)
{
  uint64_t result;

  result = MRMediaRemotePlaybackStateIsAdvancing(a2);
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

uint64_t __44__MRAVEndpoint_translateClusterUIDIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(a1 + 32));
}

- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    v12 = (id)MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
  }
  v25 = CFSTR("MREndpointConnectionReasonUserInfoKey");
  v26[0] = CFSTR("setListeningMode");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__MRAVEndpoint_setListeningMode_outputDeviceUID_queue_completion___block_invoke;
  v20[3] = &unk_1E30CD3A8;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  -[MRAVEndpoint connectToExternalDeviceWithUserInfo:completion:](self, "connectToExternalDeviceWithUserInfo:completion:", v15, v20);

}

void __66__MRAVEndpoint_setListeningMode_outputDeviceUID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 64);
    if (v4)
    {
      v5 = *(NSObject **)(a1 + 56);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __66__MRAVEndpoint_setListeningMode_outputDeviceUID_queue_completion___block_invoke_2;
      v7[3] = &unk_1E30C6568;
      v9 = v4;
      v8 = v3;
      dispatch_async(v5, v7);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "externalDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setListeningMode:outputDeviceUID:queue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
}

uint64_t __66__MRAVEndpoint_setListeningMode_outputDeviceUID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v7 = a5;
  v8 = a6;
  if (!v7)
  {
    v7 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C80D38];
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__MRAVEndpoint_setAllowsHeadTrackedSpatialAudio_outputDeviceUID_queue_completion___block_invoke;
  block[3] = &unk_1E30C6770;
  v12 = v8;
  v10 = v8;
  dispatch_async(v7, block);

}

uint64_t __82__MRAVEndpoint_setAllowsHeadTrackedSpatialAudio_outputDeviceUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setHeadTrackedSpatialAudioMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v7 = a5;
  v8 = a6;
  if (!v7)
  {
    v7 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C80D38];
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__MRAVEndpoint_setHeadTrackedSpatialAudioMode_outputDeviceUID_queue_completion___block_invoke;
  block[3] = &unk_1E30C6770;
  v12 = v8;
  v10 = v8;
  dispatch_async(v7, block);

}

uint64_t __80__MRAVEndpoint_setHeadTrackedSpatialAudioMode_outputDeviceUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    v11 = (id)MEMORY[0x1E0C80D38];
    v13 = MEMORY[0x1E0C80D38];
  }
  v23 = CFSTR("MREndpointConnectionReasonUserInfoKey");
  v24[0] = CFSTR("setConversationDetectionEnabled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__MRAVEndpoint_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke;
  v18[3] = &unk_1E30CE540;
  v22 = a3;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[MRAVEndpoint connectToExternalDeviceWithUserInfo:completion:](self, "connectToExternalDeviceWithUserInfo:completion:", v14, v18);

}

void __81__MRAVEndpoint_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 56);
    if (v4)
    {
      v5 = *(NSObject **)(a1 + 48);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __81__MRAVEndpoint_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke_2;
      v7[3] = &unk_1E30C6568;
      v9 = v4;
      v8 = v3;
      dispatch_async(v5, v7);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "externalDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConversationDetectionEnabled:outputDeviceUID:queue:completion:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

uint64_t __81__MRAVEndpoint_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)outputDevicesMatchingPredicate:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[MRAVEndpoint outputDevices](self, "outputDevices", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (v4[2](v4, v11))
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (id)outputDeviceUIDsMatchingPredicate:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MRAVEndpoint outputDevicesMatchingPredicate:](self, "outputDevicesMatchingPredicate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "uid", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)effectivelyEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  if (!-[MRAVEndpoint isEqual:](self, "isEqual:", v4))
    goto LABEL_4;
  v5 = objc_alloc(MEMORY[0x1E0C99E40]);
  -[MRAVEndpoint outputDeviceUIDs](self, "outputDeviceUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  v8 = objc_alloc(MEMORY[0x1E0C99E40]);
  objc_msgSend(v4, "outputDeviceUIDs");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  LOBYTE(v9) = objc_msgSend(v7, "isEqualToOrderedSet:", v10);
  if ((v9 & 1) != 0)
    v11 = 1;
  else
LABEL_4:
    v11 = 0;

  return v11;
}

- (BOOL)containsOutputDeviceWithUID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  -[MRAVEndpoint outputDeviceForUID:](self, "outputDeviceForUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 1;
  }
  else
  {
    -[MRAVEndpoint groupLeader](self, "groupLeader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_msgSend(v7, "supportsMultiplayer") & 1) == 0 && (objc_msgSend(v7, "containsUID:", v4) & 1) != 0;

  }
  return v6;
}

- (id)outputDeviceForUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MRAVEndpoint outputDevices](self, "outputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__MRAVEndpoint_outputDeviceForUID___block_invoke;
  v9[3] = &unk_1E30C5F68;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "msv_firstWhere:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __35__MRAVEndpoint_outputDeviceForUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(a1 + 32));
}

- (void)outputContextDataSourceOutputDeviceDidChangeVolumeMuted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MROutputContextDataSourceVolumeMutedUserInfoKey"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_notifyVolumeMutedDidChange:outputDevice:endpoint:", objc_msgSend(v8, "BOOLValue"), v7, self);
}

- (void)outputContextDataSourceDidAddOutputDevice:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_notifyDidAddOutputDevice:endpoint:", v5, self);
}

- (void)outputContextDataSourceDidChangeOutputDevice:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_notifyDidChangeOutputDevice:endpoint:", v5, self);
}

- (void)outputContextDataSourceDidRemoveOutputDevice:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_notifyDidRemoveOutputDevice:endpoint:", v5, self);
}

- (void)outputContextDidChangePredictedOutputDevice:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_notifyDidChangePredictedOutputDevice:endpoint:", v5, self);
}

+ (void)_notifyEndpointDidConnect:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "_userInfoFromEndpoint:outputDevice:", v4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MRAVEndpointDidConnectNotification"), v4, v6);

}

+ (void)_notifyEndpointDidDisconnect:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_userInfoFromEndpoint:outputDevice:", v7, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB3388]);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("MRAVEndpointDidDisconnectNotification"), v7, v9);

}

+ (void)_notifyVolumeMutedDidChange:(BOOL)a3 outputDevice:(id)a4 endpoint:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v8 = a5;
  objc_msgSend(a1, "_userInfoFromEndpoint:outputDevice:", v8, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("MRAVEndpointVolumeMutedUserInfoKey"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("MRAVEndpointVolumeMutedDidChangeNotification"), v8, v11);

}

+ (void)_notifyDidAddOutputDevice:(id)a3 endpoint:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = v14;
  v9 = v7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MRAVEndpoint.m"), 2028, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDevice"));

    v8 = 0;
  }
  objc_msgSend(a1, "_userInfoFromEndpoint:outputDevice:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("MRAVEndpointDidAddOutputDeviceNotification"), v9, v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("kMRAVEndpointOutputDevicesDidChangeNotification"), v9, v10);

}

+ (void)_notifyDidChangeOutputDevice:(id)a3 endpoint:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = v14;
  v9 = v7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MRAVEndpoint.m"), 2040, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDevice"));

    v8 = 0;
  }
  objc_msgSend(a1, "_userInfoFromEndpoint:outputDevice:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("MRAVEndpointDidChangeOutputDeviceNotification"), v9, v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("kMRAVEndpointOutputDevicesDidChangeNotification"), v9, v10);

}

+ (void)_notifyDidRemoveOutputDevice:(id)a3 endpoint:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = v14;
  v9 = v7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MRAVEndpoint.m"), 2052, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDevice"));

    v8 = 0;
  }
  objc_msgSend(a1, "_userInfoFromEndpoint:outputDevice:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("MRAVEndpointDidRemoveOutputDeviceNotification"), v9, v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("kMRAVEndpointOutputDevicesDidChangeNotification"), v9, v10);

}

+ (void)_notifyDidChangePredictedOutputDevice:(id)a3 endpoint:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a1, "_userInfoFromEndpoint:outputDevice:", v6, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("kMRAVEndpointPredictedOutputDeviceDidChangeNotification"), v6, v8);

}

+ (void)_notifyGroupSessionInfoDidChange:(id)a3 endpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_userInfoFromEndpoint:outputDevice:", v6, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("MRAVEndpointGroupSessionInfoUserInfoKey"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("MRAVEndpointGroupSessionInfoDidChangeNotification"), v6, v9);

}

+ (void)_notifyGroupSessionHostingEligibilityDidChangeForEndpoint:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "_userInfoFromEndpoint:outputDevice:", v4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MRAVEndpointGroupSessionHostingEligibilityDidChangeNotification"), v4, v6);

}

+ (void)hostedEndpointForOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  __CFString *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  __CFString *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99D68];
  v10 = a4;
  objc_msgSend(v9, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIDs=(%@)"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __67__MRAVEndpoint_hostedEndpointForOutputDeviceUIDs_queue_completion___block_invoke;
  v30[3] = &unk_1E30CDBA0;
  v15 = v14;
  v31 = v15;
  v32 = CFSTR("hostedEndpointForOutputDeviceUIDs");
  v16 = v13;
  v33 = v16;
  v17 = v11;
  v34 = v17;
  v18 = v8;
  v35 = v18;
  v19 = (void *)MEMORY[0x194036C44](v30);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("hostedEndpointForOutputDeviceUIDs"), v16);
  v21 = v20;
  if (v15)
    objc_msgSend(v20, "appendFormat:", CFSTR(" for %@"), v15);
  _MRLogForCategory(0xAuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v21;
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v23 = (void *)MRGetSharedService();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __67__MRAVEndpoint_hostedEndpointForOutputDeviceUIDs_queue_completion___block_invoke_363;
  v26[3] = &unk_1E30CE200;
  v27 = CFSTR("hostedEndpointForOutputDeviceUIDs");
  v28 = v16;
  v29 = v19;
  v24 = v19;
  v25 = v16;
  MRMediaRemoteServiceCreateHostedEndpointForDevices(v23, (uint64_t)v7, v10, v26);

}

void __67__MRAVEndpoint_hostedEndpointForOutputDeviceUIDs_queue_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        v12 = a1[5];
        v11 = a1[6];
        v13 = a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
        v35 = 138544386;
        v36 = v12;
        v37 = 2114;
        v38 = v11;
        v39 = 2112;
        v40 = v5;
        v41 = 2114;
        v42 = v13;
        v43 = 2048;
        v44 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v9;
        v18 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v35, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10)
      goto LABEL_22;
    v29 = a1[5];
    v30 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
    v35 = 138544130;
    v36 = v29;
    v37 = 2114;
    v38 = v30;
    v39 = 2112;
    v40 = v5;
    v41 = 2048;
    v42 = v31;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v17 = v9;
    v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        v21 = a1[5];
        v20 = a1[6];
        v22 = a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
        v35 = 138544386;
        v36 = v21;
        v37 = 2114;
        v38 = v20;
        v39 = 2114;
        v40 = v6;
        v41 = 2114;
        v42 = v22;
        v43 = 2048;
        v44 = v23;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v35, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v9);
    }
    goto LABEL_22;
  }
  v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24)
      goto LABEL_22;
    v32 = a1[5];
    v33 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
    v35 = 138543874;
    v36 = v32;
    v37 = 2114;
    v38 = v33;
    v39 = 2048;
    v40 = v34;
    v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v17 = v9;
    v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    v26 = a1[5];
    v25 = a1[6];
    v27 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
    v35 = 138544130;
    v36 = v26;
    v37 = 2114;
    v38 = v25;
    v39 = 2114;
    v40 = v27;
    v41 = 2048;
    v42 = v28;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  (*(void (**)(void))(a1[8] + 16))();
}

void __67__MRAVEndpoint_hostedEndpointForOutputDeviceUIDs_queue_completion___block_invoke_363(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Endpoint: %@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    v10 = a1[5];
    *(_DWORD *)buf = 138543874;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  if (v6 && !MRMediaRemoteErrorIsInformational(v6))
    v11 = *(void (**)(void))(a1[6] + 16);
  else
    v11 = *(void (**)(void))(a1[6] + 16);
  v11();

}

+ (void)directEndpointForOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  __CFString *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  __CFString *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99D68];
  v10 = a4;
  objc_msgSend(v9, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIDs=(%@)"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __67__MRAVEndpoint_directEndpointForOutputDeviceUIDs_queue_completion___block_invoke;
  v30[3] = &unk_1E30CDBA0;
  v15 = v14;
  v31 = v15;
  v32 = CFSTR("directEndpointForOutputDeviceUIDs");
  v16 = v13;
  v33 = v16;
  v17 = v11;
  v34 = v17;
  v18 = v8;
  v35 = v18;
  v19 = (void *)MEMORY[0x194036C44](v30);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("directEndpointForOutputDeviceUIDs"), v16);
  v21 = v20;
  if (v15)
    objc_msgSend(v20, "appendFormat:", CFSTR(" for %@"), v15);
  _MRLogForCategory(0xAuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v21;
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v23 = (void *)MRGetSharedService();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __67__MRAVEndpoint_directEndpointForOutputDeviceUIDs_queue_completion___block_invoke_368;
  v26[3] = &unk_1E30CE200;
  v27 = CFSTR("directEndpointForOutputDeviceUIDs");
  v28 = v16;
  v29 = v19;
  v24 = v19;
  v25 = v16;
  MRMediaRemoteServiceCreateDirectEndpointForDevices(v23, (uint64_t)v7, v10, v26);

}

void __67__MRAVEndpoint_directEndpointForOutputDeviceUIDs_queue_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        v12 = a1[5];
        v11 = a1[6];
        v13 = a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
        v35 = 138544386;
        v36 = v12;
        v37 = 2114;
        v38 = v11;
        v39 = 2112;
        v40 = v5;
        v41 = 2114;
        v42 = v13;
        v43 = 2048;
        v44 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v9;
        v18 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v35, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10)
      goto LABEL_22;
    v29 = a1[5];
    v30 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
    v35 = 138544130;
    v36 = v29;
    v37 = 2114;
    v38 = v30;
    v39 = 2112;
    v40 = v5;
    v41 = 2048;
    v42 = v31;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v17 = v9;
    v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        v21 = a1[5];
        v20 = a1[6];
        v22 = a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
        v35 = 138544386;
        v36 = v21;
        v37 = 2114;
        v38 = v20;
        v39 = 2114;
        v40 = v6;
        v41 = 2114;
        v42 = v22;
        v43 = 2048;
        v44 = v23;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v35, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v9);
    }
    goto LABEL_22;
  }
  v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24)
      goto LABEL_22;
    v32 = a1[5];
    v33 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
    v35 = 138543874;
    v36 = v32;
    v37 = 2114;
    v38 = v33;
    v39 = 2048;
    v40 = v34;
    v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v17 = v9;
    v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    v26 = a1[5];
    v25 = a1[6];
    v27 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
    v35 = 138544130;
    v36 = v26;
    v37 = 2114;
    v38 = v25;
    v39 = 2114;
    v40 = v27;
    v41 = 2048;
    v42 = v28;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  (*(void (**)(void))(a1[8] + 16))();
}

void __67__MRAVEndpoint_directEndpointForOutputDeviceUIDs_queue_completion___block_invoke_368(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Endpoint: %@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    v10 = a1[5];
    *(_DWORD *)buf = 138543874;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  if (v6 && !MRMediaRemoteErrorIsInformational(v6))
    v11 = *(void (**)(void))(a1[6] + 16);
  else
    v11 = *(void (**)(void))(a1[6] + 16);
  v11();

}

+ (void)createEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "createEndpointWithOutputDeviceUIDs:options:queue:completion:", a3, 0, a4, a5);
}

+ (void)createEndpointWithOutputDeviceUIDs:(id)a3 options:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v31[4];
  __CFString *v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  __CFString *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("UIDs=(%@)"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke;
  v36[3] = &unk_1E30CDFA0;
  v17 = v16;
  v37 = v17;
  v38 = CFSTR("createEndpointWithOutputDeviceUIDs");
  v18 = v13;
  v39 = v18;
  v19 = v11;
  v40 = v19;
  v20 = v9;
  v41 = v20;
  v21 = v10;
  v42 = v21;
  v22 = (void *)MEMORY[0x194036C44](v36);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("createEndpointWithOutputDeviceUIDs"), v18);
  v24 = v23;
  if (v17)
    objc_msgSend(v23, "appendFormat:", CFSTR(" for %@"), v17);
  _MRLogForCategory(0xAuLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v24;
    _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v26 = (void *)MRGetSharedService();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke_374;
  v31[3] = &unk_1E30CE590;
  v32 = CFSTR("createEndpointWithOutputDeviceUIDs");
  v33 = v18;
  v34 = v8;
  v35 = v22;
  v27 = v8;
  v28 = v22;
  v29 = v18;
  MRMediaRemoteServiceCreateGroupWithDevicesLeaderOptions(v26, (uint64_t)v27, v20, a4, v31);

}

void __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  _QWORD block[4];
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        v12 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544386;
        v44 = v12;
        v45 = 2114;
        v46 = v11;
        v47 = 2112;
        v48 = v5;
        v49 = 2114;
        v50 = v13;
        v51 = 2048;
        v52 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v9;
        v18 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10)
      goto LABEL_22;
    v29 = *(_QWORD *)(a1 + 40);
    v30 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v44 = v29;
    v45 = 2114;
    v46 = v30;
    v47 = 2112;
    v48 = v5;
    v49 = 2048;
    v50 = v31;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v17 = v9;
    v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        v21 = *(_QWORD *)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 48);
        v22 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544386;
        v44 = v21;
        v45 = 2114;
        v46 = v20;
        v47 = 2114;
        v48 = v6;
        v49 = 2114;
        v50 = v22;
        v51 = 2048;
        v52 = v23;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v9);
    }
    goto LABEL_22;
  }
  v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24)
      goto LABEL_22;
    v32 = *(_QWORD *)(a1 + 40);
    v33 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138543874;
    v44 = v32;
    v45 = 2114;
    v46 = v33;
    v47 = 2048;
    v48 = v34;
    v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v17 = v9;
    v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    v26 = *(_QWORD *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 48);
    v27 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v44 = v26;
    v45 = 2114;
    v46 = v25;
    v47 = 2114;
    v48 = v27;
    v49 = 2048;
    v50 = v28;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke_373;
  block[3] = &unk_1E30C6658;
  v35 = *(NSObject **)(a1 + 64);
  v36 = *(id *)(a1 + 72);
  v41 = v6;
  v42 = v36;
  v40 = v5;
  v37 = v6;
  v38 = v5;
  dispatch_async(v35, block);

}

uint64_t __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke_373(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke_374(id *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  MRAVReconnaissanceSession *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("leader UID: %@"), a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[4];
    v9 = a1[5];
    *(_DWORD *)buf = 138543874;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  if (v5 && !MRMediaRemoteErrorIsInformational(v5))
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v10 = -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:]([MRAVReconnaissanceSession alloc], "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", a1[6], 0, 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke_377;
    v11[3] = &unk_1E30CE568;
    v12 = a1[6];
    v13 = a1[4];
    v14 = a1[5];
    v15 = a1[7];
    -[MRAVReconnaissanceSession beginSearchWithTimeout:completion:](v10, "beginSearchWithTimeout:completion:", v11, 30.0);

  }
}

void __76__MRAVEndpoint_createEndpointWithOutputDeviceUIDs_options_queue_completion___block_invoke_377(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "outputDeviceUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = objc_msgSend(*(id *)(a1 + 32), "count");

  if (v9 != v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "outputDeviceUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Missing devices in formed endpoint. Expected: %@, got: %@"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    _MRLogForCategory(0xAuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v19 = v16;
      v20 = 2114;
      v21 = v17;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (void)pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  MRRequestDetails *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  __CFString *v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (MRRequestDetails *)a4;
  v30 = a5;
  v11 = a6;
  if (!v10)
    v10 = -[MRRequestDetails initWithName:requestID:reason:]([MRRequestDetails alloc], "initWithName:requestID:reason:", CFSTR("pauseOutputDeviceUIDs"), 0, CFSTR("API"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRRequestDetails requestID](v10, "requestID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIDs=(%@)"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __63__MRAVEndpoint_pauseOutputDeviceUIDs_details_queue_completion___block_invoke;
  v33[3] = &unk_1E30CD3A8;
  v15 = v14;
  v34 = v15;
  v35 = CFSTR("pauseOutputDeviceUIDs");
  v16 = v13;
  v36 = v16;
  v29 = v12;
  v37 = v29;
  v28 = v11;
  v38 = v28;
  v17 = (void *)MEMORY[0x194036C44](v33);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("pauseOutputDeviceUIDs"), v16);
  v19 = v18;
  if (v15)
    objc_msgSend(v18, "appendFormat:", CFSTR(" for %@"), v15);
  _MRLogForCategory(0xAuLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v19;
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  MRCreateXPCMessage(0x30000000000002FuLL);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  MRAddPropertyListToXPCMessage(v21, (uint64_t)v9, "MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY");
  -[MRRequestDetails data](v10, "data");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  MRAddDataToXPCMessage(v21, v23, "MRXPC_REQUEST_DETAILS");

  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "service");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mrXPCConnection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __63__MRAVEndpoint_pauseOutputDeviceUIDs_details_queue_completion___block_invoke_385;
  v31[3] = &unk_1E30C6C80;
  v32 = v17;
  v27 = v17;
  objc_msgSend(v26, "sendMessage:queue:reply:", v21, v30, v31);

}

void __63__MRAVEndpoint_pauseOutputDeviceUIDs_details_queue_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1[4];
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13)
        goto LABEL_14;
      v15 = a1[5];
      v14 = a1[6];
      v16 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
      v24 = 138544130;
      v25 = v15;
      v26 = 2114;
      v27 = v14;
      v28 = 2114;
      v29 = v16;
      v30 = 2048;
      v31 = v17;
      v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v6;
      v20 = 42;
    }
    else
    {
      if (!v13)
        goto LABEL_14;
      v21 = a1[5];
      v22 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
      v24 = 138543874;
      v25 = v21;
      v26 = 2114;
      v27 = v22;
      v28 = 2048;
      v29 = v23;
      v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v6;
      v20 = 32;
    }
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v24, v20);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v7)
    {
      v9 = a1[5];
      v8 = a1[6];
      v10 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
      v24 = 138544386;
      v25 = v9;
      v26 = 2114;
      v27 = v8;
      v28 = 2114;
      v29 = v3;
      v30 = 2114;
      v31 = v10;
      v32 = 2048;
      v33 = v12;
      _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v24, 0x34u);
LABEL_13:

    }
  }
  else if (v7)
  {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v3, v6);
  }
LABEL_14:

  (*(void (**)(void))(a1[8] + 16))();
}

uint64_t __63__MRAVEndpoint_pauseOutputDeviceUIDs_details_queue_completion___block_invoke_385(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toEachEndpointContainingOutputDeviceUIDs:(id)a5 timeout:(double)a6 queue:(id)a7 completion:(id)a8
{
  id v12;
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *value_4;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  __CFString *v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a8;
  v14 = (objc_class *)MEMORY[0x1E0C99E08];
  v39 = a7;
  v15 = a4;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithDictionary:", v15);

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("kMRMediaRemoteOptionCommandID"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v12;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIDs=(%@)"), v12);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __106__MRAVEndpoint_sendCommand_withOptions_toEachEndpointContainingOutputDeviceUIDs_timeout_queue_completion___block_invoke;
  v42[3] = &unk_1E30CE5B8;
  v43 = CFSTR("sendCommandToOutputDeviceUIDs");
  v25 = v21;
  v44 = v25;
  v35 = v20;
  v45 = v35;
  v36 = v13;
  v46 = v36;
  v26 = (void *)MEMORY[0x194036C44](v42);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("sendCommandToOutputDeviceUIDs"), v25);
  v28 = v27;
  if (v23)
    objc_msgSend(v27, "appendFormat:", CFSTR(" for %@"), v23);
  value_4 = (void *)v23;
  _MRLogForCategory(0xAuLL);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v48 = v28;
    _os_log_impl(&dword_193827000, v29, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  MRCreateXPCMessage(0x300000000000031uLL);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v30, "command", a3);
  MRAddPropertyListToXPCMessage(v30, (uint64_t)v16, "commandOptions");
  MRAddPropertyListToXPCMessage(v30, (uint64_t)v12, "MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY");
  xpc_dictionary_set_double(v30, "timeout", a6);
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "service");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "mrXPCConnection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v24;
  v40[1] = 3221225472;
  v40[2] = __106__MRAVEndpoint_sendCommand_withOptions_toEachEndpointContainingOutputDeviceUIDs_timeout_queue_completion___block_invoke_393;
  v40[3] = &unk_1E30C6C80;
  v41 = v26;
  v34 = v26;
  objc_msgSend(v33, "sendMessage:queue:reply:", v30, v39, v40);

}

void __106__MRAVEndpoint_sendCommand_withOptions_toEachEndpointContainingOutputDeviceUIDs_timeout_queue_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 && !v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v9 = a1[4];
    v10 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", a1[6]);
    v20 = 138544130;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    v24 = 2112;
    v25 = v5;
    v26 = 2048;
    v27 = v12;
    v13 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v14 = v8;
    v15 = 42;
LABEL_10:
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, v15);

    goto LABEL_11;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v16 = a1[4];
    v17 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", a1[6]);
    v20 = 138543874;
    v21 = v16;
    v22 = 2114;
    v23 = v17;
    v24 = 2048;
    v25 = v18;
    v13 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v14 = v8;
    v15 = 32;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __106__MRAVEndpoint_sendCommand_withOptions_toEachEndpointContainingOutputDeviceUIDs_timeout_queue_completion___block_invoke_cold_1(a1, v6, v8);
LABEL_11:

  v19 = a1[7];
  if (v19)
    (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v5, v6);

}

void __106__MRAVEndpoint_sendCommand_withOptions_toEachEndpointContainingOutputDeviceUIDs_timeout_queue_completion___block_invoke_393(uint64_t a1, void *a2, void *a3)
{
  id v5;
  UInt8 *v6;
  id v7;

  v5 = a3;
  v6 = (UInt8 *)MRCreateDataFromXPCMessage(a2, "commandResultsData");
  MRCreateArrayFromData(v6, &__block_literal_global_396);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

MRCommandResult *__106__MRAVEndpoint_sendCommand_withOptions_toEachEndpointContainingOutputDeviceUIDs_timeout_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  MRCommandResult *v3;

  v2 = a2;
  v3 = -[MRCommandResult initWithData:]([MRCommandResult alloc], "initWithData:", v2);

  return v3;
}

+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toNewEndpointContainingOutputDeviceUIDs:(id)a5 nowPlayingClient:(id)a6 timeout:(double)a7 queue:(id)a8 completion:(id)a9
{
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  MRPlayerPath *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id value_4;
  id v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  __CFString *v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a9;
  v16 = (objc_class *)MEMORY[0x1E0C99E08];
  v42 = a8;
  v17 = a6;
  v18 = a4;
  v19 = (void *)objc_msgSend([v16 alloc], "initWithDictionary:", v18);

  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("kMRMediaRemoteOptionCommandID"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v14;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIDs=(%@)"), v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __122__MRAVEndpoint_sendCommand_withOptions_toNewEndpointContainingOutputDeviceUIDs_nowPlayingClient_timeout_queue_completion___block_invoke;
  v45[3] = &unk_1E30CE600;
  v46 = CFSTR("sendCommandToNewGroupContainingOutputDeviceUIDs");
  v27 = v24;
  v47 = v27;
  value_4 = v23;
  v48 = value_4;
  v40 = v15;
  v49 = v40;
  v28 = (void *)MEMORY[0x194036C44](v45);
  v41 = v27;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("sendCommandToNewGroupContainingOutputDeviceUIDs"), v27);
  v30 = v29;
  if (v26)
    objc_msgSend(v29, "appendFormat:", CFSTR(" for %@"), v26);
  _MRLogForCategory(0xAuLL);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v51 = v30;
    _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  MRCreateXPCMessage(0x300000000000032uLL);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v32, "command", a3);
  MRAddPropertyListToXPCMessage(v32, (uint64_t)v19, "commandOptions");
  MRAddPropertyListToXPCMessage(v32, (uint64_t)v25, "MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY");
  v33 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", 0, v17, 0);

  MRAddPlayerPathToXPCMessage(v32, v33);
  xpc_dictionary_set_double(v32, "timeout", a7);
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "service");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "mrXPCConnection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __122__MRAVEndpoint_sendCommand_withOptions_toNewEndpointContainingOutputDeviceUIDs_nowPlayingClient_timeout_queue_completion___block_invoke_402;
  v43[3] = &unk_1E30C6C80;
  v44 = v28;
  v37 = v28;
  objc_msgSend(v36, "sendMessage:queue:reply:", v32, v42, v43);

}

void __122__MRAVEndpoint_sendCommand_withOptions_toNewEndpointContainingOutputDeviceUIDs_nowPlayingClient_timeout_queue_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !v7)
  {
    objc_msgSend(v5, "debugName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _MRLogForCategory(0xAuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v11 = a1[4];
        v12 = a1[5];
        objc_msgSend(v5, "debugName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", a1[6]);
        v40 = 138544386;
        v41 = v11;
        v42 = 2114;
        v43 = v12;
        v44 = 2112;
        v45 = v6;
        v46 = 2114;
        v47 = v13;
        v48 = 2048;
        v49 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v9;
        v18 = 52;
LABEL_13:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v40, v18);
        goto LABEL_14;
      }
      goto LABEL_23;
    }
    if (!v10)
      goto LABEL_23;
    v31 = a1[4];
    v32 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", a1[6]);
    v40 = 138544130;
    v41 = v31;
    v42 = 2114;
    v43 = v32;
    v44 = 2112;
    v45 = v6;
    v46 = 2048;
    v47 = v33;
    v34 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v35 = v9;
    v36 = 42;
LABEL_21:
    _os_log_impl(&dword_193827000, v35, OS_LOG_TYPE_DEFAULT, v34, (uint8_t *)&v40, v36);
    goto LABEL_22;
  }
  objc_msgSend(v6, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "debugName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory(0xAuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  v9 = v21;
  if (v19)
  {
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        v23 = a1[4];
        v24 = a1[5];
        objc_msgSend(v6, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "debugName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "timeIntervalSinceDate:", a1[6]);
        v40 = 138544386;
        v41 = v23;
        v42 = 2114;
        v43 = v24;
        v44 = 2114;
        v45 = v13;
        v46 = 2114;
        v47 = v14;
        v48 = 2048;
        v49 = v26;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v40, 0x34u);

LABEL_14:
LABEL_22:

        goto LABEL_23;
      }
    }
    else if (v22)
    {
      __122__MRAVEndpoint_sendCommand_withOptions_toNewEndpointContainingOutputDeviceUIDs_nowPlayingClient_timeout_queue_completion___block_invoke_cold_1(a1, v6, v9);
    }
    goto LABEL_23;
  }
  v27 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (!v20)
  {
    if (!v27)
      goto LABEL_23;
    v37 = a1[4];
    v38 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", a1[6]);
    v40 = 138543874;
    v41 = v37;
    v42 = 2114;
    v43 = v38;
    v44 = 2048;
    v45 = v39;
    v34 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v35 = v9;
    v36 = 32;
    goto LABEL_21;
  }
  if (v27)
  {
    v28 = a1[4];
    v29 = a1[5];
    objc_msgSend(v5, "debugName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", a1[6]);
    v40 = 138544130;
    v41 = v28;
    v42 = 2114;
    v43 = v29;
    v44 = 2114;
    v45 = v13;
    v46 = 2048;
    v47 = v30;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    v17 = v9;
    v18 = 42;
    goto LABEL_13;
  }
LABEL_23:

  (*(void (**)(void))(a1[7] + 16))();
}

void __122__MRAVEndpoint_sendCommand_withOptions_toNewEndpointContainingOutputDeviceUIDs_nowPlayingClient_timeout_queue_completion___block_invoke_402(uint64_t a1, void *a2, void *a3)
{
  id v5;
  MRCommandResult *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  MRCreateCommandResultFromXPCMessage(v8);
  v6 = (MRCommandResult *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = -[MRCommandResult initWithError:]([MRCommandResult alloc], "initWithError:", v5);
  v7 = (void *)MRCreateEndpointFromXPCMessage(v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)findMyGroupLeaderWithTimeout:(double)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  void *v26;
  MRAVReconnaissanceSession *v27;
  void *v28;
  MRAVReconnaissanceSession *v29;
  MRAVReconnaissanceSession *v30;
  _QWORD v31[4];
  MRAVReconnaissanceSession *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  _QWORD v34[4];
  __CFString *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "requestID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("findMyGroupLeader"), v14);

  _MRLogForCategory(0xAuLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v15;
    _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke;
  v34[3] = &unk_1E30CDBC8;
  v35 = CFSTR("findMyGroupLeader");
  v17 = v9;
  v36 = v17;
  v18 = v12;
  v37 = v18;
  v19 = v11;
  v39 = v19;
  v20 = v10;
  v38 = v20;
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v34);
  +[MRDeviceInfoRequest localDeviceInfo](MRDeviceInfoRequest, "localDeviceInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "groupContainsDiscoverableGroupLeader");
  v24 = objc_msgSend(v22, "isAirPlayActive");
  v25 = 1;
  if (v23)
    v25 = 2;
  if (!v24)
    v25 = 0;
  if (v25)
  {
    if (v25 == 1)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 33);
      ((void (**)(_QWORD, _QWORD, void *))v21)[2](v21, 0, v26);
    }
    else
    {
      v26 = (void *)MRMediaRemoteCopyDeviceUID();
      if (v26)
      {
        v27 = [MRAVReconnaissanceSession alloc];
        v40 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:details:](v27, "initWithOutputDeviceUIDs:outputDeviceGroupID:features:details:", v28, 0, 8, v17);

        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke_2;
        v31[3] = &unk_1E30CDBF0;
        v32 = v29;
        v33 = v21;
        v30 = v29;
        -[MRAVReconnaissanceSession beginSearchWithTimeout:completion:](v30, "beginSearchWithTimeout:completion:", v31, a3);

      }
      else
      {
        v30 = (MRAVReconnaissanceSession *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 39);
        ((void (**)(_QWORD, _QWORD, MRAVReconnaissanceSession *))v21)[2](v21, 0, v30);
      }

    }
  }
  else
  {
    v21[2](v21, 0, 0);
  }

}

void __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 && !v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "requestID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544130;
    v26 = v9;
    v27 = 2114;
    v28 = v10;
    v29 = 2112;
    v30 = v5;
    v31 = 2048;
    v32 = v12;
    v13 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v14 = v8;
    v15 = 42;
LABEL_10:
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);

    goto LABEL_11;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "requestID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138543874;
    v26 = v16;
    v27 = 2114;
    v28 = v10;
    v29 = 2048;
    v30 = v17;
    v13 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v14 = v8;
    v15 = 32;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke_cold_1(a1, v6, v8);
LABEL_11:

  v18 = *(void **)(a1 + 64);
  if (v18)
  {
    v19 = *(NSObject **)(a1 + 56);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke_405;
    v21[3] = &unk_1E30C6658;
    v24 = v18;
    v22 = v5;
    v23 = v6;
    MRCreateDonatedQosBlock(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v19, v20);

  }
}

uint64_t __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke_405(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __70__MRAVEndpoint_findMyGroupLeaderWithTimeout_details_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  id v8;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v8 = *(id *)(a1 + 32);
  v7(v6, a3, a4);

}

- (void)willStartingPlaybackToOutputDeviceInterruptPlayback:(id)a3 duration:(double)a4 queue:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v10, "UUID");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVEndpoint _willStartingPlaybackToOutputDeviceInterruptPlayback:duration:requestID:queue:completion:](self, v13, v14, v12, v11, a4);

}

- (void)_willStartingPlaybackToOutputDeviceInterruptPlayback:(void *)a3 duration:(void *)a4 requestID:(void *)a5 queue:(double)a6 completion:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  const __CFString *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  int v30;
  void *v31;
  MRBlockGuard *v32;
  id v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  void *v35;
  uint64_t v36;
  void *v37;
  id *v38;
  void *v39;
  id v40;
  void *v41;
  MRNowPlayingControllerConfiguration *v42;
  MRNowPlayingController *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void (**v47)(_QWORD, _QWORD, _QWORD);
  MRBlockGuard *v48;
  id v49;
  __CFString *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  __CFString *v56;
  id v57;
  id v58;
  void (**v59)(_QWORD, _QWORD, _QWORD);
  double v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  const __CFString *v64;
  id v65;
  id v66;
  id v67;
  void (**v68)(_QWORD, _QWORD, _QWORD);
  double v69;
  _QWORD v70[4];
  MRBlockGuard *v71;
  void (**v72)(_QWORD, _QWORD, _QWORD);
  _QWORD v73[4];
  __CFString *v74;
  id v75;
  id v76;
  _QWORD v77[5];
  id v78;
  __CFString *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  uint8_t buf[4];
  const __CFString *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  const __CFString *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v14;
  if (a1)
  {
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion_, a1, CFSTR("MRAVEndpoint.m"), 2400, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    }
    v54 = v15;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", sel__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion_, a1, CFSTR("MRAVEndpoint.m"), 2401, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(a1, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "localizedName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("endpoint=%@(%@), outputDevice=%@"), v18, v19, v11);

    v21 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("willStartingPlaybackToOutputDeviceInterruptPlayback"), v12);
    v22 = v21;
    if (v20)
      -[__CFString appendFormat:](v21, "appendFormat:", CFSTR(" for %@"), v20);
    v53 = v11;
    _MRLogForCategory(0xAuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    v15 = v54;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v85 = v22;
      _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }
    v50 = (__CFString *)v22;

    v24 = MEMORY[0x1E0C809B0];
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke;
    v77[3] = &unk_1E30CE678;
    v77[4] = a1;
    v49 = v20;
    v78 = v49;
    v79 = CFSTR("willStartingPlaybackToOutputDeviceInterruptPlayback");
    v52 = v12;
    v25 = v12;
    v80 = v25;
    v26 = v16;
    v81 = v26;
    v51 = v13;
    v27 = v13;
    v82 = v27;
    v83 = v54;
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v77);
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "supportMultiplayerHost");

    if (v30)
    {
      v28[2](v28, 0, 0);
      v11 = v53;
      v31 = v49;
    }
    else
    {
      v32 = [MRBlockGuard alloc];
      v73[0] = v24;
      v73[1] = 3221225472;
      v73[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_2;
      v73[3] = &unk_1E30C6878;
      v74 = CFSTR("willStartingPlaybackToOutputDeviceInterruptPlayback");
      v33 = v25;
      v75 = v33;
      v34 = v28;
      v76 = v34;
      v70[0] = v24;
      v70[1] = 3221225472;
      v70[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_431;
      v70[3] = &unk_1E30CE6A0;
      v48 = -[MRBlockGuard initWithTimeout:reason:handler:](v32, "initWithTimeout:reason:handler:", CFSTR("willStartingPlaybackToOutputDeviceInterruptPlayback"), v73, 3.0);
      v71 = v48;
      v72 = v34;
      v47 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v70);
      if (objc_msgSend(a1, "isLocalEndpoint")
        && (+[MRAVClusterController sharedController](MRAVClusterController, "sharedController"),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            v36 = objc_msgSend(v35, "clusterStatus"),
            v35,
            v36 == 2))
      {
        +[MRAVClusterController sharedController](MRAVClusterController, "sharedController");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = v24;
        v63[1] = 3221225472;
        v63[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_2_432;
        v63[3] = &unk_1E30CE6C8;
        v38 = (id *)&v64;
        v64 = CFSTR("willStartingPlaybackToOutputDeviceInterruptPlayback");
        v65 = v33;
        v11 = v53;
        v66 = v53;
        v69 = a6;
        v67 = v27;
        v39 = v47;
        v68 = v47;
        objc_msgSend(v37, "getClusterLeaderEndpoint:", v63);

        v40 = v65;
      }
      else
      {
        objc_msgSend(a1, "outputDevices");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = v24;
        v61[1] = 3221225472;
        v61[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_435;
        v61[3] = &unk_1E30C5F68;
        v38 = &v62;
        v62 = v53;
        objc_msgSend(v41, "mr_filter:", v61);
        v40 = (id)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v40, "count"))
        {
          v42 = -[MRNowPlayingControllerConfiguration initWithEndpoint:]([MRNowPlayingControllerConfiguration alloc], "initWithEndpoint:", a1);
          -[MRNowPlayingControllerConfiguration setRequestPlaybackQueue:](v42, "setRequestPlaybackQueue:", 1);
          -[MRNowPlayingControllerConfiguration setRequestPlaybackState:](v42, "setRequestPlaybackState:", 1);
          -[MRNowPlayingControllerConfiguration setLabel:](v42, "setLabel:", CFSTR("CheckForInterrupt"));
          v43 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v42);
          v55[0] = v24;
          v55[1] = 3221225472;
          v55[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_440;
          v55[3] = &unk_1E30CE6F0;
          v56 = CFSTR("willStartingPlaybackToOutputDeviceInterruptPlayback");
          v57 = v33;
          v39 = v47;
          v59 = v47;
          v60 = a6;
          v40 = v40;
          v58 = v40;
          -[MRNowPlayingController performRequestWithCompletion:](v43, "performRequestWithCompletion:", v55);

        }
        else
        {
          _MRLogForCategory(0xAuLL);
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v85 = CFSTR("willStartingPlaybackToOutputDeviceInterruptPlayback");
            v86 = 2114;
            v87 = v33;
            v88 = 2112;
            v89 = CFSTR("Endpoint is routed to specified outputDevice");
            _os_log_impl(&dword_193827000, v44, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
          }

          v39 = v47;
          v47[2](v47, 0, 0);
        }
        v11 = v53;
      }
      v15 = v54;
      v31 = v49;

    }
    v13 = v51;
    v12 = v52;
  }

}

- (void)willStartingPlaybackToOutputDevicesInterruptPlayback:(id)a3 originatingOutputDeviceUID:(id)a4 duration:(double)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  const __CFString *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void (**v32)(_QWORD, _QWORD);
  void *v33;
  void *v34;
  char v35;
  void *v36;
  MRNowPlayingRequest *v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  __CFString *v55;
  void *v56;
  _QWORD v57[4];
  void (**v58)(_QWORD, _QWORD);
  _QWORD v59[4];
  id v60;
  void (**v61)(_QWORD, _QWORD);
  _QWORD v62[4];
  id v63;
  __CFString *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  const __CFString *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  MRNowPlayingRequest *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVEndpoint.m"), 2348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVEndpoint.m"), 2349, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_3:
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRAVEndpoint uniqueIdentifier](self, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVEndpoint localizedName](self, "localizedName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("endpoint=%@(%@), outputDevices=%@ originatingOutputDeviceUID=%@"), v17, v18, v12, v13);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("willStartingPlaybackToOutputDeviceInterruptPlayback"), v22);
  v24 = v23;
  if (v19)
    -[__CFString appendFormat:](v23, "appendFormat:", CFSTR(" for %@"), v19);
  v53 = v12;
  v56 = v13;
  _MRLogForCategory(0xAuLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v70 = v24;
    _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }
  v55 = (__CFString *)v24;

  v26 = MEMORY[0x1E0C809B0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke;
  v62[3] = &unk_1E30CE628;
  v27 = v19;
  v63 = v27;
  v64 = CFSTR("willStartingPlaybackToOutputDeviceInterruptPlayback");
  v28 = v22;
  v65 = v28;
  v29 = v20;
  v66 = v29;
  v30 = v14;
  v67 = v30;
  v31 = v15;
  v68 = v31;
  v32 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](v62);
  +[MRDeviceInfoRequest localDeviceInfo](MRDeviceInfoRequest, "localDeviceInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "canHostMultiplayerStream");

  if ((v35 & 1) != 0)
  {
    if (objc_msgSend(v53, "count"))
    {
      v36 = v53;
    }
    else
    {
      v36 = (void *)objc_msgSend(v53, "mutableCopy");
      v38 = (uint64_t)v56;
      if (!v56)
      {
        objc_msgSend(v33, "WHAIdentifier");
        v38 = objc_claimAutoreleasedReturnValue();
      }
      v56 = (void *)v38;
      objc_msgSend(v36, "addObject:");

    }
    objc_msgSend(v33, "WHAIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v36, "containsObject:", v39);

    if (v40
      && (+[MRAVClusterController sharedController](MRAVClusterController, "sharedController"),
          v41 = (void *)objc_claimAutoreleasedReturnValue(),
          v42 = objc_msgSend(v41, "clusterStatus"),
          v41,
          v42 == 2))
    {
      v37 = (MRNowPlayingRequest *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cluster secondaries cannot answer this question. Defaulting to No"));
      _MRLogForCategory(0xAuLL);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v70 = CFSTR("willStartingPlaybackToOutputDeviceInterruptPlayback");
        v71 = 2114;
        v72 = v28;
        v73 = 2112;
        v74 = v37;
        _os_log_impl(&dword_193827000, v43, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      v32[2](v32, 0);
    }
    else
    {
      MRCreateXPCMessage(0x30000000000002AuLL);
      v37 = (MRNowPlayingRequest *)objc_claimAutoreleasedReturnValue();
      MRAddPropertyListToXPCMessage(v37, (uint64_t)v36, "MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY");
      +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "service");
      v52 = v31;
      v54 = v33;
      v45 = v28;
      v46 = v27;
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "mrXPCConnection");
      v48 = v29;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke_421;
      v57[3] = &unk_1E30C6C80;
      v58 = v32;
      objc_msgSend(v49, "sendMessage:queue:reply:", v37, v30, v57);

      v29 = v48;
      v27 = v46;
      v28 = v45;
      v31 = v52;
      v33 = v54;

    }
  }
  else
  {
    v37 = objc_alloc_init(MRNowPlayingRequest);
    v59[0] = v26;
    v59[1] = 3221225472;
    v59[2] = __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke_2;
    v59[3] = &unk_1E30CE650;
    v61 = v32;
    v60 = v33;
    -[MRNowPlayingRequest requestIsPlayingOnQueue:completion:](v37, "requestIsPlayingOnQueue:completion:", v30, v59);

    v36 = v53;
  }

}

void __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  _QWORD v31[4];
  id v32;
  char v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v5)
    {
      if (!v7)
        goto LABEL_15;
      v18 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      v19 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v35 = v18;
      v36 = 2114;
      v37 = v17;
      v38 = 2114;
      v39 = v19;
      v40 = 2048;
      v41 = v20;
      v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v22 = v6;
      v23 = 42;
    }
    else
    {
      if (!v7)
        goto LABEL_15;
      v27 = *(_QWORD *)(a1 + 40);
      v28 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138543874;
      v35 = v27;
      v36 = 2114;
      v37 = v28;
      v38 = 2048;
      v39 = v29;
      v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v22 = v6;
      v23 = 32;
    }
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    goto LABEL_14;
  }
  if (v5)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v35 = v8;
      v36 = 2114;
      v37 = v9;
      v38 = 2112;
      v39 = v10;
      v40 = 2114;
      v41 = v11;
      v42 = 2048;
      v43 = v13;
      v14 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v15 = v6;
      v16 = 52;
LABEL_10:
      _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);

LABEL_14:
    }
  }
  else if (v7)
  {
    v24 = *(_QWORD *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v35 = v24;
    v36 = 2114;
    v37 = v25;
    v38 = 2112;
    v39 = v10;
    v40 = 2048;
    v41 = v26;
    v14 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v15 = v6;
    v16 = 42;
    goto LABEL_10;
  }
LABEL_15:

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke_415;
  v31[3] = &unk_1E30C65B8;
  v30 = *(NSObject **)(a1 + 64);
  v32 = *(id *)(a1 + 72);
  v33 = a2;
  dispatch_async(v30, v31);

}

uint64_t __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke_415(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if ((_DWORD)a2)
    a2 = objc_msgSend(*(id *)(a1 + 32), "isProxyGroupPlayer");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, a2);
}

uint64_t __122__MRAVEndpoint_willStartingPlaybackToOutputDevicesInterruptPlayback_originatingOutputDeviceUID_duration_queue_completion___block_invoke_421(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v2;
  _BOOL8 v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = xpc_dictionary_get_BOOL(xdict, "MRXPC_BOOL_RESULT_KEY");
  return (*(uint64_t (**)(uint64_t, _BOOL8))(v2 + 16))(v2, v3);
}

void __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  _QWORD block[4];
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (!v5)
    goto LABEL_6;
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v6, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("Will interrupt %@ on %@"), v10, v5);

  if (!v11)
  {
LABEL_6:
    v23 = *(_QWORD *)(a1 + 40);
    _MRLogForCategory(0xAuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v24)
      {
        v26 = *(_QWORD *)(a1 + 48);
        v25 = *(_QWORD *)(a1 + 56);
        v27 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
        *(_DWORD *)buf = 138544130;
        v48 = v26;
        v49 = 2114;
        v50 = v25;
        v51 = 2114;
        v52 = v27;
        v53 = 2048;
        v54 = v29;
        v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v31 = v13;
        v32 = 42;
LABEL_11:
        _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);

      }
    }
    else if (v24)
    {
      v33 = *(_QWORD *)(a1 + 48);
      v34 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
      *(_DWORD *)buf = 138543874;
      v48 = v33;
      v49 = 2114;
      v50 = v34;
      v51 = 2048;
      v52 = v35;
      v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v31 = v13;
      v32 = 32;
      goto LABEL_11;
    }
    v11 = 0;
    goto LABEL_16;
  }
  v12 = *(_QWORD *)(a1 + 40);
  _MRLogForCategory(0xAuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v16 = *(_QWORD *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
      *(_DWORD *)buf = 138544386;
      v48 = v16;
      v49 = 2114;
      v50 = v15;
      v51 = 2112;
      v52 = v11;
      v53 = 2114;
      v54 = v17;
      v55 = 2048;
      v56 = v19;
      v20 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v21 = v13;
      v22 = 52;
LABEL_15:
      _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);

    }
  }
  else if (v14)
  {
    v36 = *(_QWORD *)(a1 + 48);
    v37 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    *(_DWORD *)buf = 138544130;
    v48 = v36;
    v49 = 2114;
    v50 = v37;
    v51 = 2112;
    v52 = v11;
    v53 = 2048;
    v54 = v38;
    v20 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v21 = v13;
    v22 = 42;
    goto LABEL_15;
  }
LABEL_16:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_429;
  block[3] = &unk_1E30C6658;
  v39 = *(NSObject **)(a1 + 72);
  v40 = *(id *)(a1 + 80);
  v45 = v6;
  v46 = v40;
  v44 = v5;
  v41 = v6;
  v42 = v5;
  dispatch_async(v39, block);

}

uint64_t __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_429(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MRLogForCategory(0xAuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_431(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_2_432(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MRLogForCategory(0xAuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2112;
    v12 = CFSTR("Redirected to cluster groupLeader");
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v7, 0x20u);
  }

  -[MRAVEndpoint _willStartingPlaybackToOutputDeviceInterruptPlayback:duration:requestID:queue:completion:](v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_435(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

void __105__MRAVEndpoint__willStartingPlaybackToOutputDeviceInterruptPlayback_duration_requestID_queue_completion___block_invoke_440(double *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("error requesting playbackQueue %@"), v6);
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_4:

      (*(void (**)(void))(*((_QWORD *)a1 + 7) + 16))();
      goto LABEL_7;
    }
LABEL_3:
    v9 = *((_QWORD *)a1 + 4);
    v10 = *((_QWORD *)a1 + 5);
    *(_DWORD *)buf = 138543874;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    goto LABEL_4;
  }
  if (objc_msgSend(v5, "playbackState") != 1)
  {
    objc_msgSend(v5, "lastPlayingDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceNow");
    v13 = -v12;

    if (a1[8] <= v13)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("timeSincePlaying is greater than specified duration %lf > %lf"), *(_QWORD *)&v13, *((_QWORD *)a1 + 8));
      _MRLogForCategory(0xAuLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_4;
      goto LABEL_3;
    }
  }
LABEL_7:
  v16 = a1 + 6;
  v14 = *((_QWORD *)a1 + 6);
  v15 = v16[1];
  objc_msgSend(v5, "playbackQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, v14, v19);

}

- (id)discoverySessionWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (-[MRAVEndpoint isLocalEndpoint](self, "isLocalEndpoint")
    || (-[MRAVEndpoint supportsExternalDiscovery]((uint64_t)self) & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v4, "copy");
    -[MRAVEndpoint _externalDiscoverySessionDestinationUID](self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOutputDeviceUID:", v6);

    +[MRAVRoutingDiscoverySession discoverySessionWithConfiguration:](MRAVRoutingDiscoverySession, "discoverySessionWithConfiguration:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _MRLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MRAVEndpoint discoverySessionWithConfiguration:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (uint64_t)supportsExternalDiscovery
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    v1 = (void *)result;
    if ((objc_msgSend((id)result, "isCompanionEndpoint") & 1) != 0)
    {
      return 1;
    }
    else
    {
      objc_msgSend(v1, "externalDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "supportsExternalDiscovery");

      return v3;
    }
  }
  return result;
}

- (id)_externalDiscoverySessionDestinationUID
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v1 = a1;
  if (a1)
  {
    if (objc_msgSend(a1, "isLocalEndpoint"))
    {
      +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
      v1 = (id)objc_claimAutoreleasedReturnValue();
      return v1;
    }
    objc_msgSend(v1, "externalDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deviceInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "buildVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("19K"));

    if (v5)
    {
      objc_msgSend(v1, "externalDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceUID");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v1, "designatedGroupLeader");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clusterID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9;
      if (!v9)
      {
        objc_msgSend(v1, "designatedGroupLeader");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uid");
        v1 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      v8 = v9;
    }
    v1 = v8;
LABEL_10:

  }
  return v1;
}

- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = CFSTR("MREndpointConnectionReasonUserInfoKey");
  v20[0] = CFSTR("createHostedEndpoint");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__MRAVEndpoint_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke;
  v15[3] = &unk_1E30CE2F0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[MRAVEndpoint connectToExternalDeviceWithOptions:userInfo:completion:](self, "connectToExternalDeviceWithOptions:userInfo:completion:", 0, v11, v15);

}

void __74__MRAVEndpoint_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__MRAVEndpoint_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_2;
    v6[3] = &unk_1E30C6568;
    v4 = *(NSObject **)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    v7 = v3;
    dispatch_async(v4, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "externalDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createHostedEndpointWithOutputDeviceUIDs:queue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

uint64_t __74__MRAVEndpoint_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  int v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVEndpoint.m"), 2530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  if (!v10)
  {
LABEL_3:
    v10 = (id)MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
  }
LABEL_4:
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVEndpoint outputDevices](self, "outputDevices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  v16 = MRAnalyticsCompositionForEndpoint(self);
  v17 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "requestDetails");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "requestID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("Endpoint.modifyTopologyWithRequest"), v19);

  if (v9)
    objc_msgSend(v20, "appendFormat:", CFSTR(" for %@"), v9);
  _MRLogForCategory(0xAuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v20;
    _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (MSVDeviceOSIsInternalInstall())
  {
    MRLogCategoryDiscoveryOversize();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "requestDetails");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "requestID");
      v32 = v15;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = v16;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v24;
      v41 = 2112;
      v42 = v25;
      _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, "Endpoint.modifyTopologyWithRequest<%@> %@", buf, 0x16u);

      v16 = v31;
      v15 = v32;

    }
  }
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __68__MRAVEndpoint_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke;
  v33[3] = &unk_1E30CE718;
  v33[4] = self;
  v34 = v9;
  v35 = v13;
  v36 = v11;
  v38 = v16;
  v37 = v15;
  v26 = v11;
  v27 = v13;
  v28 = v9;
  v29 = (void *)MEMORY[0x194036C44](v33);
  -[MRAVEndpoint _modifyTopologyWithRequest:withReplyQueue:completion:](self, "_modifyTopologyWithRequest:withReplyQueue:completion:", v28, v10, v29);

}

void __68__MRAVEndpoint_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString **v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  _BYTE v26[22];
  __int16 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __68__MRAVEndpoint_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_cold_1(a1, (uint64_t)v3, (uint64_t)v6, v7, v8, v9, v10, v11, *(__int128 *)v26, *(int *)&v26[16], *(__int16 *)&v26[20], v27, v28, v29, v30, v31, v32, v33, v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "requestDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)v26 = 138543874;
    *(_QWORD *)&v26[4] = CFSTR("Endpoint.modifyTopologyWithRequest");
    *(_WORD *)&v26[12] = 2114;
    *(_QWORD *)&v26[14] = v13;
    v27 = 2048;
    v28 = v15;
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", v26, 0x20u);

  }
  v16 = *(_QWORD *)(a1 + 56);
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);
  v17 = objc_msgSend(*(id *)(a1 + 40), "type");
  v18 = kMRTopologyModificationTypeAdd;
  switch(v17)
  {
    case 0:
      goto LABEL_14;
    case 1:
      goto LABEL_12;
    case 2:
      v18 = kMRTopologyModificationTypeRemove;
      goto LABEL_12;
    case 3:
      v18 = kMRTopologyModificationTypeSet;
LABEL_12:
      v19 = *v18;
      break;
    default:
      v19 = 0;
      break;
  }
  v20 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "requestDetails");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reason");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(_DWORD *)(a1 + 72);
  v24 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "outputDevices");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  MRAnalyticsTrackTopologyChangeEvent(CFSTR("set"), v20, v22, v23, v24, v25, 0, v3);

LABEL_14:
}

- (void)_modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__36;
  v26[4] = __Block_byref_object_dispose__36;
  v11 = v8;
  v27 = v11;
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke;
  v23[3] = &unk_1E30C6590;
  v13 = v10;
  v25 = v13;
  v14 = v9;
  v24 = v14;
  v15 = (void *)MEMORY[0x194036C44](v23);
  v28 = CFSTR("MREndpointConnectionReasonUserInfoKey");
  v29[0] = CFSTR("modifyOutputContext");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_3;
  v19[3] = &unk_1E30CE740;
  v22 = v26;
  v19[4] = self;
  v17 = v14;
  v20 = v17;
  v18 = v15;
  v21 = v18;
  -[MRAVEndpoint connectToExternalDeviceWithOptions:userInfo:completion:](self, "connectToExternalDeviceWithOptions:userInfo:completion:", 1, v16, v19);

  _Block_object_dispose(v26, 8);
}

void __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v6 = v4;
    v5 = v3;
    msv_dispatch_async_on_queue();

  }
}

uint64_t __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "outputDevices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v5 = (void *)MRMediaRemoteCopyDeviceUID();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "outputDevices");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_4;
      v13[3] = &unk_1E30C7028;
      v14 = v5;
      v7 = v5;
      objc_msgSend(v6, "msv_map:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "copyWithOutputDeviceUIDs:", v8);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    objc_msgSend(*(id *)(a1 + 32), "externalDevice");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modifyTopologyWithRequest:withReplyQueue:completion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

id __69__MRAVEndpoint__modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "isLocalDevice") && (v4 = *(void **)(a1 + 32)) != 0)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v3, "uid");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)outputDeviceWithUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__MRAVEndpoint_outputDeviceWithUID___block_invoke;
  v9[3] = &unk_1E30C5F68;
  v10 = v4;
  v5 = v4;
  -[MRAVEndpoint outputDevicesMatchingPredicate:](self, "outputDevicesMatchingPredicate:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __36__MRAVEndpoint_outputDeviceWithUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(a1 + 32));
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements
{
  return self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
}

- (void)addOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MRRequestDetails *v14;
  void *v15;
  void *v16;
  MRGroupTopologyModificationRequest *v17;
  MRRequestDetails *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [MRRequestDetails alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MRRequestDetails initWithName:requestID:reason:](v14, "initWithName:requestID:reason:", CFSTR("Endpoint.addOutputDevices"), v16, v12);

  v17 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDevices:]([MRGroupTopologyModificationRequest alloc], "initWithRequestDetails:type:outputDevices:", v18, 1, v13);
  -[MRAVEndpoint modifyTopologyWithRequest:withReplyQueue:completion:](self, "modifyTopologyWithRequest:withReplyQueue:completion:", v17, v11, v10);

}

- (void)addOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withReplyQueue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  _MRLogForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[MRAVEndpoint(Deprecated) addOutputDevices:initiator:fadeAudio:withReplyQueue:completion:].cold.1();

  -[MRAVEndpoint addOutputDevices:initiator:withReplyQueue:completion:](self, "addOutputDevices:initiator:withReplyQueue:completion:", v14, v13, v12, v11);
}

- (void)removeOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MRRequestDetails *v14;
  void *v15;
  void *v16;
  MRGroupTopologyModificationRequest *v17;
  MRRequestDetails *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [MRRequestDetails alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MRRequestDetails initWithName:requestID:reason:](v14, "initWithName:requestID:reason:", CFSTR("Endpoint.removeOutputDevices"), v16, v12);

  v17 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDevices:]([MRGroupTopologyModificationRequest alloc], "initWithRequestDetails:type:outputDevices:", v18, 2, v13);
  -[MRAVEndpoint modifyTopologyWithRequest:withReplyQueue:completion:](self, "modifyTopologyWithRequest:withReplyQueue:completion:", v17, v11, v10);

}

- (void)removeOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withReplyQueue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  _MRLogForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[MRAVEndpoint(Deprecated) addOutputDevices:initiator:fadeAudio:withReplyQueue:completion:].cold.1();

  -[MRAVEndpoint removeOutputDevices:initiator:withReplyQueue:completion:](self, "removeOutputDevices:initiator:withReplyQueue:completion:", v14, v13, v12, v11);
}

- (void)setOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MRRequestDetails *v14;
  void *v15;
  void *v16;
  MRGroupTopologyModificationRequest *v17;
  MRRequestDetails *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [MRRequestDetails alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MRRequestDetails initWithName:requestID:reason:](v14, "initWithName:requestID:reason:", CFSTR("Endpoint.setOutputDevices"), v16, v12);

  v17 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDevices:]([MRGroupTopologyModificationRequest alloc], "initWithRequestDetails:type:outputDevices:", v18, 3, v13);
  -[MRAVEndpoint modifyTopologyWithRequest:withReplyQueue:completion:](self, "modifyTopologyWithRequest:withReplyQueue:completion:", v17, v11, v10);

}

- (void)setOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withReplyQueue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  _MRLogForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[MRAVEndpoint(Deprecated) addOutputDevices:initiator:fadeAudio:withReplyQueue:completion:].cold.1();

  -[MRAVEndpoint setOutputDevices:initiator:withReplyQueue:completion:](self, "setOutputDevices:initiator:withReplyQueue:completion:", v14, v13, v12, v11);
}

void __64__MRAVEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, int a10, __int16 a11, __int16 a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;

  OUTLINED_FUNCTION_11_0();
  a24 = v29;
  a25 = v30;
  OUTLINED_FUNCTION_11_1();
  a17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v31 + 40), "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v27 + 40), "requestID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16(v34, v35);
  LODWORD(a9) = 138544130;
  *(_QWORD *)((char *)&a9 + 4) = v32;
  WORD6(a9) = 2114;
  *(_QWORD *)((char *)&a9 + 14) = v33;
  a12 = 2114;
  a13 = v26;
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_6(&dword_193827000, v25, v36, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&a9);

  OUTLINED_FUNCTION_0();
}

void __79__MRAVEndpoint_adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, int a10, __int16 a11, __int16 a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;

  OUTLINED_FUNCTION_11_0();
  a24 = v28;
  a25 = v29;
  OUTLINED_FUNCTION_11_1();
  a17 = *MEMORY[0x1E0C80C00];
  v31 = *(_QWORD *)(v30 + 40);
  objc_msgSend(*(id *)(v30 + 48), "requestID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v27 + 48), "startDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "timeIntervalSinceDate:", v34);
  LODWORD(a9) = 138544130;
  *(_QWORD *)((char *)&a9 + 4) = v31;
  WORD6(a9) = 2114;
  *(_QWORD *)((char *)&a9 + 14) = v32;
  a12 = 2114;
  a13 = v26;
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_6(&dword_193827000, v25, v35, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&a9);

  OUTLINED_FUNCTION_0();
}

- (void)outputContextDataSource
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "[AVEndpoint] %@ OutputContextDataSource not set, fetching manually...", buf, 0xCu);

}

- (void)discoverySessionWithConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_0(&dword_193827000, v0, v1, "[AVEndpoint] Endpoint does not support external discovery", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __68__MRAVEndpoint_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, int a10, __int16 a11, __int16 a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;

  OUTLINED_FUNCTION_11_0();
  a24 = v28;
  a25 = v29;
  OUTLINED_FUNCTION_11_1();
  a17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v30 + 40), "requestDetails");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "requestID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16(v33, v34);
  LODWORD(a9) = 138544130;
  *(_QWORD *)((char *)&a9 + 4) = CFSTR("Endpoint.modifyTopologyWithRequest");
  WORD6(a9) = 2114;
  *(_QWORD *)((char *)&a9 + 14) = v32;
  a12 = 2114;
  a13 = v26;
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_6(&dword_193827000, v25, v35, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&a9);

  OUTLINED_FUNCTION_0();
}

@end
