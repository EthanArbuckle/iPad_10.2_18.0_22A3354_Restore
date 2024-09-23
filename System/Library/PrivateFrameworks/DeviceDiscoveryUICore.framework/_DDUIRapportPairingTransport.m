@implementation _DDUIRapportPairingTransport

- (_DDUIRapportPairingTransport)initWithMode:(unint64_t)a3
{
  id v5;
  _DDUIRapportPairingTransport *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0D83900]);
  v6 = -[_DDUIRapportPairingTransport initWithMode:companionLinkClient:](self, "initWithMode:companionLinkClient:", a3, v5);

  return v6;
}

- (_DDUIRapportPairingTransport)initWithMode:(unint64_t)a3 companionLinkClient:(id)a4
{
  id v7;
  _DDUIRapportPairingTransport *v8;
  RPClient *v9;
  RPClient *rpClient;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSMapTable *transportSessionByUUID;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  _DDUIRapportPairingTransport *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_DDUIRapportPairingTransport;
  v8 = -[_DDUIRapportPairingTransport init](&v18, sel_init);
  if (v8)
  {
    v9 = (RPClient *)objc_alloc_init(MEMORY[0x1E0D838E8]);
    rpClient = v8->_rpClient;
    v8->_rpClient = v9;

    objc_storeStrong((id *)&v8->_client, a4);
    DDUICorePrimaryQueue();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPCompanionLinkClient setDispatchQueue:](v8->_client, "setDispatchQueue:", v11);

    if (a3)
      v12 = 0;
    else
      v12 = 4231174;
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      v13 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C87B2000, v13, OS_LOG_TYPE_DEFAULT, "Starting discovery with AWDL enabled", buf, 2u);
      }

    }
    else
    {
      v12 |= 0x400000uLL;
    }
    -[RPCompanionLinkClient setControlFlags:](v8->_client, "setControlFlags:", v12);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    transportSessionByUUID = v8->_transportSessionByUUID;
    v8->_transportSessionByUUID = (NSMapTable *)v14;

    v16 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v8;
      _os_log_impl(&dword_1C87B2000, v16, OS_LOG_TYPE_DEFAULT, "-[_DDUIRapportPairingTransport init] {self: %p}", buf, 0xCu);
    }

  }
  return v8;
}

- (NSArray)availableDevices
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  uint64_t v60;
  void *v61;
  int v62;
  void *v63;
  char v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t k;
  _DDUIRapportDevice *v79;
  void *v81;
  void *v82;
  void *context;
  id v84;
  void *v85;
  char *subsystem;
  id obj;
  void *v88;
  void *v89;
  _DDUIRapportPairingTransport *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint8_t v110[128];
  uint8_t buf[4];
  void *v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1CAA33CE8](self, a2);
  v84 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v90 = self;
  -[RPCompanionLinkClient activeDevices](self->_client, "activeDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v112 = v4;
    _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "Finding available devices among %@", buf, 0xCu);
  }

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v104;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v104 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v9);
        objc_msgSend(v10, "model");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v90->_wantedDeviceTypes & DDUIDeviceTypeForModelString(v11);

        if (v12)
        {
          objc_msgSend(v10, "sourceVersion");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            objc_msgSend(v10, "sourceVersion");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "integerValue");

            if (v15 < 400)
              goto LABEL_34;
            objc_msgSend(v10, "idsDeviceIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v88;
            if (v16)
            {
              objc_msgSend(v10, "idsDeviceIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v84, "containsObject:", v17))
              {
                v88 = v17;

                goto LABEL_14;
              }
            }
            objc_msgSend(v10, "idsDeviceIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v17;
            if (v26)
            {

LABEL_26:
              if (v16)
              {

              }
            }
            else
            {
              objc_msgSend(v10, "identifier");
              v29 = objc_claimAutoreleasedReturnValue();
              if (!v29)
                goto LABEL_26;
              v30 = (void *)v29;
              objc_msgSend(v10, "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v84, "containsObject:", v31);

              if (v16)
              {

                if ((v32 & 1) == 0)
                  goto LABEL_28;
              }
              else if (!v32)
              {
                goto LABEL_28;
              }
LABEL_14:
              if ((objc_msgSend(v10, "statusFlags") & 4) == 0)
                goto LABEL_34;
              if (objc_msgSend(v3, "count"))
              {
                v18 = 0;
                while (1)
                {
                  objc_msgSend(v3, "objectAtIndexedSubscript:", v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "idsDeviceIdentifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "idsDeviceIdentifier");
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (!v21)
                    break;
                  v22 = (void *)v21;
                  v23 = objc_msgSend(v20, "isEqual:", v21);

                  if (v23)
                    goto LABEL_19;
LABEL_20:
                  if (++v18 >= (unint64_t)objc_msgSend(v3, "count"))
                    goto LABEL_28;
                }
                objc_msgSend(v10, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v20, "isEqual:", v24);

                if ((v25 & 1) == 0)
                  goto LABEL_20;
LABEL_19:
                objc_msgSend(v3, "removeObjectAtIndex:", v18--);
                goto LABEL_20;
              }
            }
LABEL_28:
            v27 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v112 = v10;
              _os_log_impl(&dword_1C87B2000, v27, OS_LOG_TYPE_DEFAULT, "Found acceptable device %@", buf, 0xCu);
            }

            objc_msgSend(v3, "addObject:", v10);
            objc_msgSend(v10, "idsDeviceIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              objc_msgSend(v84, "addObject:", v13);
            }
            else
            {
              objc_msgSend(v10, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "addObject:", v28);

            }
          }

        }
LABEL_34:
        ++v9;
      }
      while (v9 != v7);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
      v7 = v33;
    }
    while (v33);
  }

  v34 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  -[_DDUIRapportPairingTransport previousAvailableDevices](v90, "previousAvailableDevices");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v100 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
        objc_msgSend(v40, "idsDeviceIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          objc_msgSend(v34, "addObject:", v41);
        }
        else
        {
          objc_msgSend(v40, "identifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v42);

        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
    }
    while (v37);
  }

  v89 = (void *)objc_msgSend(v84, "mutableCopy");
  objc_msgSend(v89, "minusSet:", v34);
  v43 = (void *)objc_msgSend(v34, "mutableCopy");
  objc_msgSend(v43, "minusSet:", v84);
  v82 = v34;
  v85 = (void *)objc_msgSend(v34, "mutableCopy");
  objc_msgSend(v85, "unionSet:", v84);
  -[_DDUIRapportPairingTransport previousAvailableDevices](v90, "previousAvailableDevices");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "mutableCopy");
  v46 = v45;
  if (v45)
  {
    v47 = v45;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v47 = (id)objc_claimAutoreleasedReturnValue();
  }
  v48 = v47;

  if (objc_msgSend(v48, "count"))
  {
    v49 = 0;
    do
    {
      objc_msgSend(v48, "objectAtIndexedSubscript:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "idsDeviceIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      if (v51)
      {
        v53 = v51;
      }
      else
      {
        objc_msgSend(v50, "identifier");
        v53 = (id)objc_claimAutoreleasedReturnValue();
      }
      v54 = v53;

      if (objc_msgSend(v43, "containsObject:", v54))
        objc_msgSend(v48, "removeObjectAtIndex:", v49--);

      ++v49;
    }
    while (v49 < objc_msgSend(v48, "count"));
  }
  v81 = v43;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  subsystem = (char *)v3;
  v55 = objc_msgSend(subsystem, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v96;
    do
    {
      for (j = 0; j != v56; ++j)
      {
        if (*(_QWORD *)v96 != v57)
          objc_enumerationMutation(subsystem);
        v59 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
        objc_msgSend(v59, "idsDeviceIdentifier", v81);
        v60 = objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          v61 = (void *)v60;
          v62 = objc_msgSend(v89, "containsObject:", v60);

          if (v62)
            goto LABEL_71;
        }
        else
        {
          objc_msgSend(v59, "identifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v89, "containsObject:", v63);

          if ((v64 & 1) != 0)
          {
LABEL_71:
            objc_msgSend(v48, "addObject:", v59);
            continue;
          }
        }
        objc_msgSend(v59, "idsDeviceIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v85, "containsObject:", v65);

        if (v66 && objc_msgSend(v48, "count"))
        {
          v67 = 0;
          while (1)
          {
            objc_msgSend(v59, "idsDeviceIdentifier");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectAtIndexedSubscript:", v67);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "idsDeviceIdentifier");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v68, "isEqual:", v70);

            if (v71)
              break;
            if (++v67 >= (unint64_t)objc_msgSend(v48, "count"))
              goto LABEL_80;
          }
          objc_msgSend(v48, "replaceObjectAtIndex:withObject:", v67, v59);
        }
LABEL_80:
        ;
      }
      v56 = objc_msgSend(subsystem, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
    }
    while (v56);
  }

  v72 = (void *)objc_msgSend(v48, "copy");
  objc_autoreleasePoolPop(context);
  -[_DDUIRapportPairingTransport setPreviousAvailableDevices:](v90, "setPreviousAvailableDevices:", v72);
  v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v74 = v72;
  v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v92;
    do
    {
      for (k = 0; k != v76; ++k)
      {
        if (*(_QWORD *)v92 != v77)
          objc_enumerationMutation(v74);
        v79 = -[_DDUIRapportDevice initWithRPCompanionLinkDevice:]([_DDUIRapportDevice alloc], "initWithRPCompanionLinkDevice:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * k));
        objc_msgSend(v73, "addObject:", v79);

      }
      v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
    }
    while (v76);
  }

  return (NSArray *)v73;
}

- (void)invalidate
{
  RPCompanionLinkClient *client;

  -[RPCompanionLinkClient invalidate](self->_client, "invalidate");
  client = self->_client;
  self->_client = 0;

}

- (void)setAvailableDevicesChangedHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id availableDevicesChangedHandler;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _BYTE buf[12];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_availableDevicesChangedHandler != v4)
  {
    v5 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1CAA33E80](v4);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = self;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport set devices changed handler {self: %p, availableDevicesChangedHandler: %@}", buf, 0x16u);

    }
    v7 = (void *)MEMORY[0x1CAA33E80](v4);
    availableDevicesChangedHandler = self->_availableDevicesChangedHandler;
    self->_availableDevicesChangedHandler = v7;

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66___DDUIRapportPairingTransport_setAvailableDevicesChangedHandler___block_invoke;
    v14[3] = &unk_1E81B42B8;
    objc_copyWeak(&v16, (id *)buf);
    v10 = v4;
    v15 = v10;
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_client, "setDeviceFoundHandler:", v14);
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __66___DDUIRapportPairingTransport_setAvailableDevicesChangedHandler___block_invoke_2;
    v11[3] = &unk_1E81B42B8;
    objc_copyWeak(&v13, (id *)buf);
    v12 = v10;
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_client, "setDeviceLostHandler:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

}

- (id)sessionForDevice:(id)a3 bundleID:(id)a4 serviceIdentifier:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _DDUIRapportOutgoingTransportSession *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSMapTable *transportSessionByUUID;
  void *v28;
  int v30;
  _DDUIRapportPairingTransport *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 134218498;
    v31 = self;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_1C87B2000, v12, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport creating transport session {self: %p, device: %@, serviceIdentifier %@}", (uint8_t *)&v30, 0x20u);
  }

  v13 = -[_DDUIRapportOutgoingTransportSession initWithServiceIdentifier:]([_DDUIRapportOutgoingTransportSession alloc], "initWithServiceIdentifier:", v10);
  v14 = objc_alloc_init(MEMORY[0x1E0D83908]);
  objc_msgSend(v9, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIdentifier:", v15);

  v16 = objc_alloc_init(MEMORY[0x1E0D83900]);
  -[_DDUIRapportOutgoingTransportSession setClient:](v13, "setClient:", v16);

  DDUICorePrimaryQueue();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DDUIRapportOutgoingTransportSession client](v13, "client");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDispatchQueue:", v17);

  -[_DDUIRapportOutgoingTransportSession client](v13, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setServiceType:", CFSTR("com.apple.devicediscoveryui.rapportwake"));

  -[_DDUIRapportOutgoingTransportSession client](v13, "client");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDestinationDevice:", v14);

  -[_DDUIRapportOutgoingTransportSession client](v13, "client");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setUseCase:", 327680);

  -[_DDUIRapportOutgoingTransportSession client](v13, "client");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBleClientUseCase:", 327680);

  -[_DDUIRapportOutgoingTransportSession client](v13, "client");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAppID:", v11);

  if (_os_feature_enabled_impl())
  {
    v24 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1C87B2000, v24, OS_LOG_TYPE_DEFAULT, "Creating session with AWDL enabled", (uint8_t *)&v30, 2u);
    }

    v25 = 262;
  }
  else
  {
    v25 = 4194566;
  }
  -[_DDUIRapportOutgoingTransportSession client](v13, "client");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setControlFlags:", objc_msgSend(v26, "controlFlags") | v25);

  transportSessionByUUID = self->_transportSessionByUUID;
  -[_DDUIRapportOutgoingTransportSession sessionID](v13, "sessionID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](transportSessionByUUID, "setObject:forKey:", v13, v28);

  -[_DDUIRapportPairingTransport _setupListeningForResponseMessagesIfNeeded](self, "_setupListeningForResponseMessagesIfNeeded");
  return v13;
}

- (void)activateForDeviceTypes:(unsigned int)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  RPCompanionLinkClient *client;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  _DDUIRapportPairingTransport *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    DDUIDeviceTypeString(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1CAA33E80](v6);
    *(_DWORD *)buf = 134218498;
    v15 = self;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1C87B2000, v7, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport activating {self: %p, deviceTypes: %@, completion: %@}", buf, 0x20u);

  }
  self->_wantedDeviceTypes = a3;
  client = self->_client;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70___DDUIRapportPairingTransport_activateForDeviceTypes_withCompletion___block_invoke;
  v12[3] = &unk_1E81B42E0;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[RPCompanionLinkClient activateWithCompletion:](client, "activateWithCompletion:", v12);

}

- (void)_setupListeningForResponseMessagesIfNeeded
{
  RPCompanionLinkClient *client;
  _QWORD v4[4];
  id v5;
  id location;

  if (!self->_listeningForResponses)
  {
    self->_listeningForResponses = 1;
    location = 0;
    objc_initWeak(&location, self);
    client = self->_client;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __74___DDUIRapportPairingTransport__setupListeningForResponseMessagesIfNeeded__block_invoke;
    v4[3] = &unk_1E81B4308;
    objc_copyWeak(&v5, &location);
    -[RPCompanionLinkClient registerRequestID:options:handler:](client, "registerRequestID:options:handler:", CFSTR("DDUI-pair-resp"), 0, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)setupListeningForSessionsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  RPCompanionLinkClient *client;
  uint64_t v8;
  id v9;
  RPCompanionLinkClient *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;
  uint8_t buf[4];
  _DDUIRapportPairingTransport *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v5 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1CAA33E80](v4);
    *(_DWORD *)buf = 134218242;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport setup listening {self: %p, incomingSessionHandler: %@}", buf, 0x16u);

  }
  client = self->_client;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69___DDUIRapportPairingTransport_setupListeningForSessionsWithHandler___block_invoke;
  v14[3] = &unk_1E81B4330;
  objc_copyWeak(&v16, &location);
  v14[4] = self;
  v9 = v4;
  v15 = v9;
  -[RPCompanionLinkClient registerRequestID:options:handler:](client, "registerRequestID:options:handler:", CFSTR("DDUI-pair-init"), 0, v14);
  v10 = self->_client;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __69___DDUIRapportPairingTransport_setupListeningForSessionsWithHandler___block_invoke_27;
  v12[3] = &unk_1E81B4358;
  v12[4] = self;
  v11 = v9;
  v13 = v11;
  -[RPCompanionLinkClient registerRequestID:options:handler:](v10, "registerRequestID:options:handler:", CFSTR("_ccConfirmStart"), 0, v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)shouldReauthenticateDevice:(id)a3 forServiceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_DDUIRapportPairingTransport rpClient](self, "rpClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91___DDUIRapportPairingTransport_shouldReauthenticateDevice_forServiceIdentifier_completion___block_invoke;
  v14[3] = &unk_1E81B4380;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "queryDeviceToListenerMapping:deviceID:completion:", v9, v12, v14);

}

- (void)createListenerMappingForDevice:(id)a3 forServiceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_DDUIRapportPairingTransport rpClient](self, "rpClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95___DDUIRapportPairingTransport_createListenerMappingForDevice_forServiceIdentifier_completion___block_invoke;
  v14[3] = &unk_1E81B4380;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "createDeviceToListenerMapping:deviceID:completion:", v9, v12, v14);

}

- (id)availableDevicesChangedHandler
{
  return self->_availableDevicesChangedHandler;
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (RPClient)rpClient
{
  return self->_rpClient;
}

- (void)setRpClient:(id)a3
{
  objc_storeStrong((id *)&self->_rpClient, a3);
}

- (NSMapTable)transportSessionByUUID
{
  return self->_transportSessionByUUID;
}

- (void)setTransportSessionByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_transportSessionByUUID, a3);
}

- (unsigned)wantedDeviceTypes
{
  return self->_wantedDeviceTypes;
}

- (void)setWantedDeviceTypes:(unsigned int)a3
{
  self->_wantedDeviceTypes = a3;
}

- (BOOL)listeningForResponses
{
  return self->_listeningForResponses;
}

- (void)setListeningForResponses:(BOOL)a3
{
  self->_listeningForResponses = a3;
}

- (NSArray)previousAvailableDevices
{
  return self->_previousAvailableDevices;
}

- (void)setPreviousAvailableDevices:(id)a3
{
  objc_storeStrong((id *)&self->_previousAvailableDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAvailableDevices, 0);
  objc_storeStrong((id *)&self->_transportSessionByUUID, 0);
  objc_storeStrong((id *)&self->_rpClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_availableDevicesChangedHandler, 0);
}

@end
