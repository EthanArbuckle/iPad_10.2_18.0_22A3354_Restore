@implementation MRExternalJSONClientConnection

- (MRExternalJSONClientConnection)initWithConnection:(id)a3 queue:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRExternalJSONClientConnection;
  return -[MRExternalClientConnection initWithConnection:queue:](&v5, sel_initWithConnection_queue_, a3, a4);
}

- (id)dataForMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[MRProtocolClientConnection disconnected](self, "disconnected"))
  {
    v36[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v26 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "messages");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    v5 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (!v8)
    {
LABEL_24:

      v4 = v26;
      goto LABEL_25;
    }
    v9 = v8;
    v10 = *(_QWORD *)v30;
LABEL_7:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "type");
      if (v14 != 15)
      {
        if (v14 == 52)
        {
          -[MRExternalJSONClientConnection _encodeVolumeDidChange:](self, "_encodeVolumeDidChange:", v12);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v13;
          v17 = v15;
          v18 = CFSTR("volume");
          goto LABEL_15;
        }
        if (v14 != 37)
        {
          objc_msgSend(v12, "description");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("unsupportedMessage"));

          _MRLogForCategory(4uLL);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v12;
            _os_log_error_impl(&dword_193827000, v15, OS_LOG_TYPE_ERROR, "[ExternalJSONClientConnection] Unsupported message: %{public}@", buf, 0xCu);
          }
          goto LABEL_18;
        }
      }
      -[MRExternalJSONClientConnection _encodeDeviceInfo:](self, "_encodeDeviceInfo:", v12);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v13;
      v17 = v15;
      v18 = CFSTR("deviceInfo");
LABEL_15:
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v18);
LABEL_18:

      objc_msgSend(v12, "replyIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("identifier"));

      v28 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 0, &v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v28;
      if (v21)
      {
        v23 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
        objc_msgSend(MEMORY[0x1E0D4D080], "createHeader:", objc_msgSend(v21, "length"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject appendData:](v23, "appendData:", v24);
        -[NSObject appendData:](v23, "appendData:", v21);
        objc_msgSend(v5, "appendData:", v23);

      }
      else
      {
        _MRLogForCategory(4uLL);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v34 = v22;
          _os_log_error_impl(&dword_193827000, v23, OS_LOG_TYPE_ERROR, "[ExternalJSONClientConnection] Failed to encode message: %{public}@", buf, 0xCu);
        }
      }

      if (v9 == ++v11)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (!v9)
          goto LABEL_24;
        goto LABEL_7;
      }
    }
  }
  v5 = 0;
LABEL_25:

  return v5;
}

- (id)_protocolMessageFromData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *artwork;
  NSDictionary *v11;
  NSDictionary *deviceInfo;
  NSDictionary *v13;
  NSDictionary *volume;
  NSDictionary *v15;
  NSDictionary *playerPath;
  NSDictionary *v17;
  NSDictionary *playbackQueue;
  NSDictionary *v19;
  NSDictionary *supportedCommands;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _MRVolumeControlAvailabilityProtobuf *v28;
  _MRVolumeControlCapabilitiesDidChangeMessageProtobuf *v29;
  _MRGetVolumeControlCapabilitiesResultMessageProtobuf *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  _MRVolumeDidChangeMessageProtobuf *v36;
  double v37;
  void *v38;
  _MRGetVolumeResultMessageProtobuf *v39;
  double v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v48;
  _MRVolumeControlCapabilitiesDidChangeMessageProtobuf *v49;
  _MRVolumeControlAvailabilityProtobuf *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v59);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v59;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_27:
    v23 = v5;
    goto LABEL_28;
  }
  v8 = v6;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("artwork"));
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  artwork = self->_artwork;
  self->_artwork = v9;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = v11;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("volume"));
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  volume = self->_volume;
  self->_volume = v13;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("playerPath"));
  v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  playerPath = self->_playerPath;
  self->_playerPath = v15;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("playbackQueue"));
  v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  playbackQueue = self->_playbackQueue;
  self->_playbackQueue = v17;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("supportedCommands"));
  v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  supportedCommands = self->_supportedCommands;
  self->_supportedCommands = v19;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRExternalJSONClientConnection _processDeviceInfo:](self, "_processDeviceInfo:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v5, "addObject:", v22);
  if (!-[MRProtocolClientConnection disconnected](self, "disconnected"))
  {
    -[MRExternalJSONClientConnection _processSetState:](self, "_processSetState:", v21);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
      objc_msgSend(v5, "addObjectsFromArray:", v54);
    v53 = v7;
    if (self->_volume)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_deviceInfo, "objectForKeyedSubscript:", CFSTR("deviceUID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "length"))
      {
        v51 = v24;
        -[NSDictionary objectForKeyedSubscript:](self->_volume, "objectForKeyedSubscript:", CFSTR("volumeCapabilities"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_volume, "objectForKeyedSubscript:", CFSTR("volumeCapabilities"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "unsignedLongValue");

          v28 = objc_alloc_init(_MRVolumeControlAvailabilityProtobuf);
          -[_MRVolumeControlAvailabilityProtobuf setVolumeControlAvailable:](v28, "setVolumeControlAvailable:", (_DWORD)v27 != 0);
          v50 = v28;
          -[_MRVolumeControlAvailabilityProtobuf setVolumeCapabilities:](v28, "setVolumeCapabilities:", v27);
          v29 = objc_alloc_init(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf);
          -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf setCapabilities:](v29, "setCapabilities:", v28);
          -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf setEndpointUID:](v29, "setEndpointUID:", v51);
          v49 = v29;
          -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf setOutputDeviceUID:](v29, "setOutputDeviceUID:", v51);
          -[MRExternalJSONClientConnection _createProtocolMessage:underlyingCodableMessage:](self, "_createProtocolMessage:underlyingCodableMessage:", objc_opt_class(), v29);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v48);
          v30 = objc_alloc_init(_MRGetVolumeControlCapabilitiesResultMessageProtobuf);
          -[_MRGetVolumeControlCapabilitiesResultMessageProtobuf setCapabilities:](v30, "setCapabilities:", v50);
          -[MRExternalJSONClientConnection _createProtocolMessage:underlyingCodableMessage:](self, "_createProtocolMessage:underlyingCodableMessage:", objc_opt_class(), v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v31);
        }
        -[NSDictionary objectForKeyedSubscript:](self->_volume, "objectForKeyedSubscript:", CFSTR("volumeLevel"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_volume, "objectForKeyedSubscript:", CFSTR("volumeLevel"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "floatValue");
          v35 = v34;

          v36 = objc_alloc_init(_MRVolumeDidChangeMessageProtobuf);
          LODWORD(v37) = v35;
          -[_MRVolumeDidChangeMessageProtobuf setVolume:](v36, "setVolume:", v37);
          -[_MRVolumeDidChangeMessageProtobuf setEndpointUID:](v36, "setEndpointUID:", v51);
          -[_MRVolumeDidChangeMessageProtobuf setOutputDeviceUID:](v36, "setOutputDeviceUID:", v51);
          -[MRExternalJSONClientConnection _createProtocolMessage:underlyingCodableMessage:](self, "_createProtocolMessage:underlyingCodableMessage:", objc_opt_class(), v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v38);
          v39 = objc_alloc_init(_MRGetVolumeResultMessageProtobuf);
          LODWORD(v40) = v35;
          -[_MRGetVolumeResultMessageProtobuf setVolume:](v39, "setVolume:", v40);
          -[MRExternalJSONClientConnection _createProtocolMessage:underlyingCodableMessage:](self, "_createProtocolMessage:underlyingCodableMessage:", objc_opt_class(), v39);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v51;
          objc_msgSend(v5, "addObject:", v22);

        }
        else
        {
          v24 = v51;
        }
        v7 = v53;
      }

    }
    if (objc_msgSend(v21, "length"))
    {
      v52 = v4;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v41 = v5;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v56 != v44)
              objc_enumerationMutation(v41);
            v46 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            objc_msgSend(v46, "setReplyIdentifier:", v21);
            objc_msgSend(v46, "setIsIncomingReply:", 1);
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        }
        while (v43);
      }

      v4 = v52;
      v7 = v53;
    }

    goto LABEL_27;
  }

  v23 = 0;
LABEL_28:

  return v23;
}

- (id)_processDeviceInfo:(id)a3
{
  _MRDeviceInfoMessageProtobuf *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (self->_deviceInfo)
  {
    v4 = objc_alloc_init(_MRDeviceInfoMessageProtobuf);
    -[NSDictionary objectForKeyedSubscript:](self->_deviceInfo, "objectForKeyedSubscript:", CFSTR("deviceName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRDeviceInfoMessageProtobuf setName:](v4, "setName:", v5);

    -[NSDictionary objectForKeyedSubscript:](self->_deviceInfo, "objectForKeyedSubscript:", CFSTR("systemVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRDeviceInfoMessageProtobuf setSystemBuildVersion:](v4, "setSystemBuildVersion:", v6);

    -[NSDictionary objectForKeyedSubscript:](self->_deviceInfo, "objectForKeyedSubscript:", CFSTR("protocolVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRDeviceInfoMessageProtobuf setProtocolVersion:](v4, "setProtocolVersion:", objc_msgSend(v7, "longLongValue"));

    -[_MRDeviceInfoMessageProtobuf setAllowsPairing:](v4, "setAllowsPairing:", 0);
    -[NSDictionary objectForKeyedSubscript:](self->_deviceInfo, "objectForKeyedSubscript:", CFSTR("deviceClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRDeviceInfoMessageProtobuf setDeviceClass:](v4, "setDeviceClass:", -[_MRDeviceInfoMessageProtobuf StringAsDeviceClass:](v4, "StringAsDeviceClass:", v8));

    -[_MRDeviceInfoMessageProtobuf setIsProxyGroupPlayer:](v4, "setIsProxyGroupPlayer:", 0);
    -[_MRDeviceInfoMessageProtobuf setIsGroupLeader:](v4, "setIsGroupLeader:", 0);
    -[NSDictionary objectForKeyedSubscript:](self->_deviceInfo, "objectForKeyedSubscript:", CFSTR("deviceUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRDeviceInfoMessageProtobuf setDeviceUID:](v4, "setDeviceUID:", v9);

    -[NSDictionary objectForKeyedSubscript:](self->_deviceInfo, "objectForKeyedSubscript:", CFSTR("deviceUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRDeviceInfoMessageProtobuf setUniqueIdentifier:](v4, "setUniqueIdentifier:", v10);

    -[_MRDeviceInfoMessageProtobuf setSupportsSystemPairing:](v4, "setSupportsSystemPairing:", 0);
    -[_MRDeviceInfoMessageProtobuf setSupportsSharedQueue:](v4, "setSupportsSharedQueue:", 1);
    -[NSDictionary objectForKeyedSubscript:](self->_deviceInfo, "objectForKeyedSubscript:", CFSTR("lastSupportedMessageType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRDeviceInfoMessageProtobuf setLastSupportedMessageType:](v4, "setLastSupportedMessageType:", objc_msgSend(v11, "unsignedIntValue"));

    -[MRExternalJSONClientConnection _createProtocolMessage:underlyingCodableMessage:](self, "_createProtocolMessage:underlyingCodableMessage:", objc_opt_class(), v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)_encodeDeviceInfo:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingCodableMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("deviceName"));

  objc_msgSend(v6, "systemBuildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("systemVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "protocolVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("protocolVersion"));

  objc_msgSend(v6, "deviceClassAsString:", objc_msgSend(v6, "deviceClass"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("deviceClass"));

  objc_msgSend(v6, "deviceUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("deviceUID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v6, "lastSupportedMessageType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("lastSupportedMessageType"));

  return v5;
}

- (id)_processSetState:(id)a3
{
  id v4;
  void *LocalOrigin;
  _MRNowPlayingPlayerPathProtobuf *v6;
  _MROriginProtobuf *v7;
  uint64_t UniqueIdentifier;
  void *v9;
  void *DisplayName;
  void *v11;
  _MRNowPlayingClientProtobuf *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _MRNowPlayingClientProtobuf *v18;
  void *v19;
  void *v20;
  NSDictionary **p_playbackQueue;
  NSDictionary *playbackQueue;
  _BOOL4 v23;
  unint64_t v24;
  _MRContentItemProtobuf *v25;
  void *v26;
  void *v27;
  _MRContentItemMetadataProtobuf *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void *v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  double v185;
  double v186;
  void *v187;
  void *v188;
  void *v189;
  double v190;
  double v191;
  void *v192;
  void *v193;
  void *v194;
  double v195;
  double v196;
  void *v197;
  void *v198;
  void *v199;
  double v200;
  double v201;
  void *v202;
  void *v203;
  void *v204;
  double v205;
  double v206;
  void *v207;
  void *v208;
  void *v209;
  double v210;
  double v211;
  void *v212;
  void *v213;
  void *v214;
  int v215;
  int v216;
  void *v217;
  double v218;
  void *v219;
  void *v220;
  uint64_t v221;
  void *v222;
  void *v223;
  void *v224;
  uint64_t v225;
  void *v226;
  void *v227;
  void *v228;
  uint64_t v229;
  void *v230;
  void *v231;
  void *v232;
  uint64_t v233;
  void *v234;
  void *v235;
  void *v236;
  uint64_t v237;
  void *v238;
  void *v239;
  void *v240;
  uint64_t v241;
  void *v242;
  void *v243;
  void *v244;
  uint64_t v245;
  void *v246;
  void *v247;
  void *v248;
  uint64_t v249;
  void *v250;
  void *v251;
  void *v252;
  uint64_t v253;
  void *v254;
  void *v255;
  void *v256;
  uint64_t v257;
  void *v258;
  void *v259;
  void *v260;
  int v261;
  int v262;
  void *v263;
  double v264;
  void *v265;
  void *v266;
  uint64_t v267;
  void *v268;
  void *v269;
  void *v270;
  uint64_t v271;
  void *v272;
  void *v273;
  void *v274;
  uint64_t v275;
  void *v276;
  void *v277;
  void *v278;
  uint64_t v279;
  void *v280;
  void *v281;
  void *v282;
  uint64_t v283;
  void *v284;
  void *v285;
  void *v286;
  uint64_t v287;
  void *v288;
  void *v289;
  void *v290;
  uint64_t v291;
  void *v292;
  void *v293;
  void *v294;
  uint64_t v295;
  void *v296;
  void *v297;
  void *v298;
  int v299;
  int v300;
  void *v301;
  double v302;
  void *v303;
  void *v304;
  int v305;
  int v306;
  void *v307;
  double v308;
  void *v309;
  void *v310;
  uint64_t v311;
  void *v312;
  void *v313;
  void *v314;
  uint64_t v315;
  void *v316;
  void *v317;
  void *v318;
  uint64_t v319;
  void *v320;
  void *v321;
  void *v322;
  uint64_t v323;
  void *v324;
  void *v325;
  void *v326;
  uint64_t v327;
  void *v328;
  void *v329;
  void *v330;
  uint64_t v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  NSDictionary *artwork;
  void *v338;
  id v339;
  void *v340;
  void *v341;
  _MRUpdateContentItemArtworkMessageProtobuf *v342;
  void *v343;
  _MRUpdateContentItemArtworkMessageProtobuf *v344;
  void *v345;
  _MRUpdateContentItemArtworkMessageProtobuf *v346;
  _MRPlaybackQueueProtobuf *v347;
  void *v348;
  void *v349;
  void *v350;
  const __CFString *v351;
  const __CFString *v352;
  uint64_t i;
  const __CFString *v354;
  const __CFString *v355;
  void *v356;
  _MRCommandInfoProtobuf *v357;
  void *v358;
  void *v359;
  void *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t j;
  void *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t k;
  void *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t m;
  void *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t n;
  double v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  _MRSetStateMessageProtobuf *v406;
  void *v407;
  void *v408;
  _MRNowPlayingClientProtobuf *v409;
  _MRSetNowPlayingClientMessageProtobuf *v410;
  void *v411;
  id v412;
  _MRUpdateContentItemArtworkMessageProtobuf *v414;
  _MRNowPlayingPlayerPathProtobuf *v415;
  id v416;
  _MRNowPlayingClientProtobuf *v417;
  _MRPlaybackQueueProtobuf *v418;
  NSDictionary *obj;
  uint64_t v420;
  _MRSupportedCommandsProtobuf *v421;
  uint64_t v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  _BYTE v443[128];
  _BYTE v444[128];
  _BYTE v445[128];
  _BYTE v446[128];
  _BYTE v447[128];
  uint64_t v448;

  v448 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_playerPath)
  {
    LocalOrigin = MRMediaRemoteGetLocalOrigin();
    v6 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
    v7 = objc_alloc_init(_MROriginProtobuf);
    -[_MRNowPlayingPlayerPathProtobuf setOrigin:](v6, "setOrigin:", v7);

    UniqueIdentifier = MROriginGetUniqueIdentifier(LocalOrigin);
    -[_MRNowPlayingPlayerPathProtobuf origin](v6, "origin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIdentifier:", UniqueIdentifier);

    DisplayName = MROriginGetDisplayName(LocalOrigin);
    -[_MRNowPlayingPlayerPathProtobuf origin](v6, "origin");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisplayName:", DisplayName);

    v12 = objc_alloc_init(_MRNowPlayingClientProtobuf);
    -[_MRNowPlayingPlayerPathProtobuf setClient:](v6, "setClient:", v12);

    -[NSDictionary objectForKeyedSubscript:](self->_playerPath, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRNowPlayingPlayerPathProtobuf client](v6, "client");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBundleIdentifier:", v13);

    -[NSDictionary objectForKeyedSubscript:](self->_playerPath, "objectForKeyedSubscript:", CFSTR("displayName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRNowPlayingPlayerPathProtobuf client](v6, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDisplayName:", v15);

    -[_MRNowPlayingPlayerPathProtobuf client](v6, "client");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setProcessIdentifier:", 1);

    v18 = objc_alloc_init(_MRNowPlayingClientProtobuf);
    -[NSDictionary objectForKeyedSubscript:](self->_playerPath, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRNowPlayingClientProtobuf setBundleIdentifier:](v18, "setBundleIdentifier:", v19);

    -[NSDictionary objectForKeyedSubscript:](self->_playerPath, "objectForKeyedSubscript:", CFSTR("displayName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRNowPlayingClientProtobuf setDisplayName:](v18, "setDisplayName:", v20);

    v417 = v18;
    -[_MRNowPlayingClientProtobuf setProcessIdentifier:](v18, "setProcessIdentifier:", 1);
  }
  else
  {
    v6 = 0;
    v417 = 0;
  }
  p_playbackQueue = &self->_playbackQueue;
  playbackQueue = self->_playbackQueue;
  v23 = playbackQueue != 0;
  v24 = 0x1E0C99000;
  if (playbackQueue)
  {
    v25 = objc_alloc_init(_MRContentItemProtobuf);
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("queueIdentifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf setIdentifier:](v25, "setIdentifier:", v26);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("queueIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf setQueueIdentifier:](v25, "setQueueIdentifier:", v27);

    v28 = objc_alloc_init(_MRContentItemMetadataProtobuf);
    -[_MRContentItemProtobuf setMetadata:](v25, "setMetadata:", v28);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("albumArtistName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAlbumArtistName:", v29);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("albumName"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAlbumName:", v31);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("artworkIdentifier"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setArtworkIdentifier:", v33);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("artworkMIMEType"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setArtworkMIMEType:", v35);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("artworkURL"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setArtworkURL:", v37);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("assetURLString"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAssetURLString:", v39);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("collectionIdentifier"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCollectionIdentifier:", v41);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("composer"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setComposer:", v43);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("contentIdentifier"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setContentIdentifier:", v45);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("internationalStandardRecordingCode"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setInternationalStandardRecordingCode:", v47);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("directorName"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setDirectorName:", v49);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("genre"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setGenre:", v51);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("localizedContentRating"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setLocalizedContentRating:", v53);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("lyricsURL"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setLyricsURL:", v55);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("serviceIdentifier"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setServiceIdentifier:", v57);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("profileIdentifier"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setProfileIdentifier:", v59);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("radioStationName"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setRadioStationName:", v61);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("radioStationString"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setRadioStationString:", v63);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("seriesName"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setSeriesName:", v65);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("serviceIdentifier"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setServiceIdentifier:", v67);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setSubtitle:", v69);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("title"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setTitle:", v71);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("trackArtistName"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemProtobuf metadata](v25, "metadata");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setTrackArtistName:", v73);

    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("appMetricsData"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v75)
    {
      v76 = objc_alloc(MEMORY[0x1E0C99D50]);
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("appMetricsData"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = (void *)objc_msgSend(v76, "initWithBase64EncodedString:options:", v77, 0);
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setAppMetricsData:", v78);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("artworkURLTemplatesData"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      v81 = objc_alloc(MEMORY[0x1E0C99D50]);
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("artworkURLTemplatesData"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = (void *)objc_msgSend(v81, "initWithBase64EncodedString:options:", v82, 0);
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setArtworkURLTemplatesData:", v83);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("collectionInfoData"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85)
    {
      v86 = objc_alloc(MEMORY[0x1E0C99D50]);
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("collectionInfoData"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = (void *)objc_msgSend(v86, "initWithBase64EncodedString:options:", v87, 0);
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "setCollectionInfoData:", v88);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("currentPlaybackDateData"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      v91 = objc_alloc(MEMORY[0x1E0C99D50]);
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("currentPlaybackDateData"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = (void *)objc_msgSend(v91, "initWithBase64EncodedString:options:", v92, 0);
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setCurrentPlaybackDateData:", v93);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("deviceSpecificUserInfoData"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    if (v95)
    {
      v96 = objc_alloc(MEMORY[0x1E0C99D50]);
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("deviceSpecificUserInfoData"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = (void *)objc_msgSend(v96, "initWithBase64EncodedString:options:", v97, 0);
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setDeviceSpecificUserInfoData:", v98);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("nowPlayingInfoData"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      v101 = objc_alloc(MEMORY[0x1E0C99D50]);
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("nowPlayingInfoData"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = (void *)objc_msgSend(v101, "initWithBase64EncodedString:options:", v102, 0);
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "setNowPlayingInfoData:", v103);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("purchaseInfoData"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    if (v105)
    {
      v106 = objc_alloc(MEMORY[0x1E0C99D50]);
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("purchaseInfoData"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = (void *)objc_msgSend(v106, "initWithBase64EncodedString:options:", v107, 0);
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "setPurchaseInfoData:", v108);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("userInfoData"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    if (v110)
    {
      v111 = objc_alloc(MEMORY[0x1E0C99D50]);
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("userInfoData"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = (void *)objc_msgSend(v111, "initWithBase64EncodedString:options:", v112, 0);
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "setUserInfoData:", v113);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("artworkAvailable"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    if (v115)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("artworkAvailable"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v116, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "setArtworkAvailable:", v117);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("infoAvailable"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    if (v119)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("infoAvailable"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = objc_msgSend(v120, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "setInfoAvailable:", v121);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isAlwaysLive"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    if (v123)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isAlwaysLive"));
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend(v124, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "setIsAlwaysLive:", v125);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isContainer"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    if (v127)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isContainer"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = objc_msgSend(v128, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "setIsContainer:", v129);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isCurrentlyPlaying"));
    v131 = (void *)objc_claimAutoreleasedReturnValue();

    if (v131)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isCurrentlyPlaying"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = objc_msgSend(v132, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "setIsCurrentlyPlaying:", v133);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isExplicitItem"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    if (v135)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isExplicitItem"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = objc_msgSend(v136, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "setIsExplicitItem:", v137);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isInWishList"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();

    if (v139)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isInWishList"));
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = objc_msgSend(v140, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "setIsInWishList:", v141);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isLiked"));
    v143 = (void *)objc_claimAutoreleasedReturnValue();

    if (v143)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isLiked"));
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = objc_msgSend(v144, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "setIsLiked:", v145);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isLoading"));
    v147 = (void *)objc_claimAutoreleasedReturnValue();

    if (v147)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isLoading"));
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = objc_msgSend(v148, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "setIsLoading:", v149);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isInTransition"));
    v151 = (void *)objc_claimAutoreleasedReturnValue();

    if (v151)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isInTransition"));
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = objc_msgSend(v152, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "setIsInTransition:", v153);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isPlayable"));
    v155 = (void *)objc_claimAutoreleasedReturnValue();

    if (v155)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isPlayable"));
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = objc_msgSend(v156, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "setIsPlayable:", v157);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isSharable"));
    v159 = (void *)objc_claimAutoreleasedReturnValue();

    if (v159)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isSharable"));
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v161 = objc_msgSend(v160, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "setIsSharable:", v161);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isAdvertisement"));
    v163 = (void *)objc_claimAutoreleasedReturnValue();

    if (v163)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isAdvertisement"));
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = objc_msgSend(v164, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "setIsAdvertisement:", v165);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isSteerable"));
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    if (v167)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isSteerable"));
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = objc_msgSend(v168, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "setIsSteerable:", v169);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isStreamingContent"));
    v171 = (void *)objc_claimAutoreleasedReturnValue();

    if (v171)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("isStreamingContent"));
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      v173 = objc_msgSend(v172, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "setIsStreamingContent:", v173);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("languageOptionsAvailable"));
    v175 = (void *)objc_claimAutoreleasedReturnValue();

    if (v175)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("languageOptionsAvailable"));
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = objc_msgSend(v176, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "setLanguageOptionsAvailable:", v177);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("lyricsAvailable"));
    v179 = (void *)objc_claimAutoreleasedReturnValue();

    if (v179)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("lyricsAvailable"));
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = objc_msgSend(v180, "BOOLValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "setLyricsAvailable:", v181);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("duration"));
    v183 = (void *)objc_claimAutoreleasedReturnValue();

    if (v183)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("duration"));
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "doubleValue");
      v186 = v185;
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "setDuration:", v186);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("elapsedTime"));
    v188 = (void *)objc_claimAutoreleasedReturnValue();

    if (v188)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("elapsedTime"));
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "doubleValue");
      v191 = v190;
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "setElapsedTime:", v191);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("elapsedTimeTimestamp"));
    v193 = (void *)objc_claimAutoreleasedReturnValue();

    if (v193)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("elapsedTimeTimestamp"));
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "doubleValue");
      v196 = v195;
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "setElapsedTimeTimestamp:", v196);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("inferredTimestamp"));
    v198 = (void *)objc_claimAutoreleasedReturnValue();

    if (v198)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("inferredTimestamp"));
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "doubleValue");
      v201 = v200;
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "setInferredTimestamp:", v201);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("releaseDate"));
    v203 = (void *)objc_claimAutoreleasedReturnValue();

    if (v203)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("releaseDate"));
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "doubleValue");
      v206 = v205;
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v207, "setReleaseDate:", v206);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("startTime"));
    v208 = (void *)objc_claimAutoreleasedReturnValue();

    if (v208)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("startTime"));
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "doubleValue");
      v211 = v210;
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "setStartTime:", v211);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("defaultPlaybackRate"));
    v213 = (void *)objc_claimAutoreleasedReturnValue();

    if (v213)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("defaultPlaybackRate"));
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "floatValue");
      v216 = v215;
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v218) = v216;
      objc_msgSend(v217, "setDefaultPlaybackRate:", v218);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("iTunesStoreAlbumIdentifier"));
    v219 = (void *)objc_claimAutoreleasedReturnValue();

    if (v219)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("iTunesStoreAlbumIdentifier"));
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      v221 = objc_msgSend(v220, "longLongValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v222, "setITunesStoreAlbumIdentifier:", v221);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("iTunesStoreArtistIdentifier"));
    v223 = (void *)objc_claimAutoreleasedReturnValue();

    if (v223)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("iTunesStoreArtistIdentifier"));
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      v225 = objc_msgSend(v224, "longLongValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v226, "setITunesStoreArtistIdentifier:", v225);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("iTunesStoreIdentifier"));
    v227 = (void *)objc_claimAutoreleasedReturnValue();

    if (v227)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("iTunesStoreIdentifier"));
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = objc_msgSend(v228, "longLongValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v230, "setITunesStoreIdentifier:", v229);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("iTunesStoreSubscriptionIdentifier"));
    v231 = (void *)objc_claimAutoreleasedReturnValue();

    if (v231)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("iTunesStoreSubscriptionIdentifier"));
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v233 = objc_msgSend(v232, "longLongValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v234, "setITunesStoreSubscriptionIdentifier:", v233);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("legacyUniqueIdentifier"));
    v235 = (void *)objc_claimAutoreleasedReturnValue();

    if (v235)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("legacyUniqueIdentifier"));
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      v237 = objc_msgSend(v236, "longLongValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "setLegacyUniqueIdentifier:", v237);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("radioStationIdentifier"));
    v239 = (void *)objc_claimAutoreleasedReturnValue();

    if (v239)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("radioStationIdentifier"));
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      v241 = objc_msgSend(v240, "longLongValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v242, "setRadioStationIdentifier:", v241);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("artworkDataHeightDeprecated"));
    v243 = (void *)objc_claimAutoreleasedReturnValue();

    if (v243)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("artworkDataHeightDeprecated"));
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      v245 = objc_msgSend(v244, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "setArtworkDataHeightDeprecated:", v245);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("artworkDataWidthDeprecated"));
    v247 = (void *)objc_claimAutoreleasedReturnValue();

    if (v247)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("artworkDataWidthDeprecated"));
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      v249 = objc_msgSend(v248, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v250, "setArtworkDataWidthDeprecated:", v249);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("chapterCount"));
    v251 = (void *)objc_claimAutoreleasedReturnValue();

    if (v251)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("chapterCount"));
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      v253 = objc_msgSend(v252, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "setChapterCount:", v253);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("discNumber"));
    v255 = (void *)objc_claimAutoreleasedReturnValue();

    if (v255)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("discNumber"));
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      v257 = objc_msgSend(v256, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v258, "setDiscNumber:", v257);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("downloadProgress"));
    v259 = (void *)objc_claimAutoreleasedReturnValue();

    if (v259)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("downloadProgress"));
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v260, "floatValue");
      v262 = v261;
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v264) = v262;
      objc_msgSend(v263, "setDownloadProgress:", v264);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("downloadState"));
    v265 = (void *)objc_claimAutoreleasedReturnValue();

    if (v265)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("downloadState"));
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      v267 = objc_msgSend(v266, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v268, "setDownloadState:", v267);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("editingStyleFlags"));
    v269 = (void *)objc_claimAutoreleasedReturnValue();

    if (v269)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("editingStyleFlags"));
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      v271 = objc_msgSend(v270, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v272, "setEditingStyleFlags:", v271);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("episodeNumber"));
    v273 = (void *)objc_claimAutoreleasedReturnValue();

    if (v273)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("episodeNumber"));
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      v275 = objc_msgSend(v274, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v276, "setEpisodeNumber:", v275);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("episodeType"));
    v277 = (void *)objc_claimAutoreleasedReturnValue();

    if (v277)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("episodeType"));
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      v279 = objc_msgSend(v278, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "setEpisodeType:", v279);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("mediaSubType"));
    v281 = (void *)objc_claimAutoreleasedReturnValue();

    if (v281)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("mediaSubType"));
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      v283 = objc_msgSend(v282, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v284, "setMediaSubType:", v283);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("mediaType"));
    v285 = (void *)objc_claimAutoreleasedReturnValue();

    if (v285)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("mediaType"));
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      v287 = objc_msgSend(v286, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v288, "setMediaType:", v287);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("numberOfSections"));
    v289 = (void *)objc_claimAutoreleasedReturnValue();

    if (v289)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("numberOfSections"));
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      v291 = objc_msgSend(v290, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v292, "setNumberOfSections:", v291);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("playCount"));
    v293 = (void *)objc_claimAutoreleasedReturnValue();

    if (v293)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("playCount"));
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      v295 = objc_msgSend(v294, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v296, "setPlayCount:", v295);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("playbackProgress"));
    v297 = (void *)objc_claimAutoreleasedReturnValue();

    if (v297)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("playbackProgress"));
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v298, "floatValue");
      v300 = v299;
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v302) = v300;
      objc_msgSend(v301, "setPlaybackProgress:", v302);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("playbackRate"));
    v303 = (void *)objc_claimAutoreleasedReturnValue();

    if (v303)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("playbackRate"));
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v304, "floatValue");
      v306 = v305;
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v307 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v308) = v306;
      objc_msgSend(v307, "setPlaybackRate:", v308);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("playlistType"));
    v309 = (void *)objc_claimAutoreleasedReturnValue();

    if (v309)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("playlistType"));
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      v311 = objc_msgSend(v310, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v312, "setPlaylistType:", v311);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("radioStationType"));
    v313 = (void *)objc_claimAutoreleasedReturnValue();

    if (v313)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("radioStationType"));
      v314 = (void *)objc_claimAutoreleasedReturnValue();
      v315 = objc_msgSend(v314, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v316, "setRadioStationType:", v315);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("seasonNumber"));
    v317 = (void *)objc_claimAutoreleasedReturnValue();

    if (v317)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("seasonNumber"));
      v318 = (void *)objc_claimAutoreleasedReturnValue();
      v319 = objc_msgSend(v318, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v320, "setSeasonNumber:", v319);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("totalDiscCount"));
    v321 = (void *)objc_claimAutoreleasedReturnValue();

    if (v321)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("totalDiscCount"));
      v322 = (void *)objc_claimAutoreleasedReturnValue();
      v323 = objc_msgSend(v322, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v324, "setTotalDiscCount:", v323);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("totalTrackCount"));
    v325 = (void *)objc_claimAutoreleasedReturnValue();

    if (v325)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("totalTrackCount"));
      v326 = (void *)objc_claimAutoreleasedReturnValue();
      v327 = objc_msgSend(v326, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v328 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v328, "setTotalTrackCount:", v327);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("trackNumber"));
    v329 = (void *)objc_claimAutoreleasedReturnValue();

    if (v329)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("trackNumber"));
      v330 = (void *)objc_claimAutoreleasedReturnValue();
      v331 = objc_msgSend(v330, "intValue");
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v332, "setTrackNumber:", v331);

    }
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("classicalWork"));
    v333 = (void *)objc_claimAutoreleasedReturnValue();

    if (v333)
    {
      -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("classicalWork"));
      v334 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v334, "stringValue");
      v335 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MRContentItemProtobuf metadata](v25, "metadata");
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v336, "setClassicalWork:", v335);

    }
    artwork = self->_artwork;
    if (artwork)
    {
      -[NSDictionary objectForKeyedSubscript:](artwork, "objectForKeyedSubscript:", CFSTR("jpeg"));
      v338 = (void *)objc_claimAutoreleasedReturnValue();

      if (v338)
      {
        v339 = objc_alloc(MEMORY[0x1E0C99D50]);
        -[NSDictionary objectForKeyedSubscript:](self->_artwork, "objectForKeyedSubscript:", CFSTR("jpeg"));
        v340 = (void *)objc_claimAutoreleasedReturnValue();
        v341 = (void *)objc_msgSend(v339, "initWithBase64EncodedString:options:", v340, 0);
        -[_MRContentItemProtobuf setArtworkData:](v25, "setArtworkData:", v341);

      }
      v342 = objc_alloc_init(_MRUpdateContentItemArtworkMessageProtobuf);
      v24 = 0x1E0C99000uLL;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v343 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MRUpdateContentItemArtworkMessageProtobuf setContentItems:](v342, "setContentItems:", v343);

      v344 = v342;
      -[_MRUpdateContentItemArtworkMessageProtobuf contentItems](v342, "contentItems");
      v345 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v345, "addObject:", v25);

    }
    else
    {
      v344 = 0;
      v24 = 0x1E0C99000uLL;
    }
    v347 = objc_alloc_init(_MRPlaybackQueueProtobuf);
    -[_MRPlaybackQueueProtobuf setLocation:](v347, "setLocation:", 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackQueueProtobuf setContentItems:](v347, "setContentItems:", v348);

    -[_MRPlaybackQueueProtobuf contentItems](v347, "contentItems");
    v349 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v349, "addObject:", v25);

    -[_MRPlaybackQueueProtobuf setResolvedPlayerPath:](v347, "setResolvedPlayerPath:", v6);
    -[NSDictionary objectForKeyedSubscript:](*p_playbackQueue, "objectForKeyedSubscript:", CFSTR("queueIdentifier"));
    v350 = (void *)objc_claimAutoreleasedReturnValue();
    v418 = v347;
    -[_MRPlaybackQueueProtobuf setQueueIdentifier:](v347, "setQueueIdentifier:", v350);

    v346 = v344;
  }
  else
  {
    v346 = 0;
    v418 = 0;
  }
  if (self->_supportedCommands)
  {
    v414 = v346;
    v415 = v6;
    v416 = v4;
    v421 = objc_alloc_init(_MRSupportedCommandsProtobuf);
    v439 = 0u;
    v440 = 0u;
    v441 = 0u;
    v442 = 0u;
    obj = self->_supportedCommands;
    v422 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v439, v447, 16);
    if (v422)
    {
      v420 = *(_QWORD *)v440;
      v351 = CFSTR("command");
      v352 = CFSTR("maximumRating");
      do
      {
        for (i = 0; i != v422; ++i)
        {
          v354 = v352;
          v355 = v351;
          if (*(_QWORD *)v440 != v420)
            objc_enumerationMutation(obj);
          v356 = *(void **)(*((_QWORD *)&v439 + 1) + 8 * i);
          v357 = objc_alloc_init(_MRCommandInfoProtobuf);
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("localizedShortTitle"));
          v358 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MRCommandInfoProtobuf setLocalizedShortTitle:](v357, "setLocalizedShortTitle:", v358);

          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("localizedTitle"));
          v359 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MRCommandInfoProtobuf setLocalizedTitle:](v357, "setLocalizedTitle:", v359);

          v437 = 0u;
          v438 = 0u;
          v435 = 0u;
          v436 = 0u;
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("preferredIntervals"));
          v360 = (void *)objc_claimAutoreleasedReturnValue();
          v361 = objc_msgSend(v360, "countByEnumeratingWithState:objects:count:", &v435, v446, 16);
          if (v361)
          {
            v362 = v361;
            v363 = *(_QWORD *)v436;
            do
            {
              for (j = 0; j != v362; ++j)
              {
                if (*(_QWORD *)v436 != v363)
                  objc_enumerationMutation(v360);
                objc_msgSend(*(id *)(*((_QWORD *)&v435 + 1) + 8 * j), "doubleValue", v414);
                -[_MRCommandInfoProtobuf addPreferredInterval:](v357, "addPreferredInterval:");
              }
              v362 = objc_msgSend(v360, "countByEnumeratingWithState:objects:count:", &v435, v446, 16);
            }
            while (v362);
          }

          v433 = 0u;
          v434 = 0u;
          v431 = 0u;
          v432 = 0u;
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("supportedInterstionPositions"));
          v365 = (void *)objc_claimAutoreleasedReturnValue();
          v366 = objc_msgSend(v365, "countByEnumeratingWithState:objects:count:", &v431, v445, 16);
          if (v366)
          {
            v367 = v366;
            v368 = *(_QWORD *)v432;
            do
            {
              for (k = 0; k != v367; ++k)
              {
                if (*(_QWORD *)v432 != v368)
                  objc_enumerationMutation(v365);
                -[_MRCommandInfoProtobuf addSupportedInsertionPositions:](v357, "addSupportedInsertionPositions:", objc_msgSend(*(id *)(*((_QWORD *)&v431 + 1) + 8 * k), "intValue", v414));
              }
              v367 = objc_msgSend(v365, "countByEnumeratingWithState:objects:count:", &v431, v445, 16);
            }
            while (v367);
          }

          v429 = 0u;
          v430 = 0u;
          v427 = 0u;
          v428 = 0u;
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("supportedPlaybackQueueTypes"));
          v370 = (void *)objc_claimAutoreleasedReturnValue();
          v371 = objc_msgSend(v370, "countByEnumeratingWithState:objects:count:", &v427, v444, 16);
          if (v371)
          {
            v372 = v371;
            v373 = *(_QWORD *)v428;
            do
            {
              for (m = 0; m != v372; ++m)
              {
                if (*(_QWORD *)v428 != v373)
                  objc_enumerationMutation(v370);
                -[_MRCommandInfoProtobuf addSupportedPlaybackQueueTypes:](v357, "addSupportedPlaybackQueueTypes:", objc_msgSend(*(id *)(*((_QWORD *)&v427 + 1) + 8 * m), "intValue", v414));
              }
              v372 = objc_msgSend(v370, "countByEnumeratingWithState:objects:count:", &v427, v444, 16);
            }
            while (v372);
          }

          v425 = 0u;
          v426 = 0u;
          v423 = 0u;
          v424 = 0u;
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("supportedRates"));
          v375 = (void *)objc_claimAutoreleasedReturnValue();
          v376 = objc_msgSend(v375, "countByEnumeratingWithState:objects:count:", &v423, v443, 16);
          if (v376)
          {
            v377 = v376;
            v378 = *(_QWORD *)v424;
            do
            {
              for (n = 0; n != v377; ++n)
              {
                if (*(_QWORD *)v424 != v378)
                  objc_enumerationMutation(v375);
                objc_msgSend(*(id *)(*((_QWORD *)&v423 + 1) + 8 * n), "doubleValue", v414);
                *(float *)&v380 = v380;
                -[_MRCommandInfoProtobuf addSupportedRate:](v357, "addSupportedRate:", v380);
              }
              v377 = objc_msgSend(v375, "countByEnumeratingWithState:objects:count:", &v423, v443, 16);
            }
            while (v377);
          }

          v351 = v355;
          objc_msgSend(v356, "objectForKeyedSubscript:", v355);
          v381 = (void *)objc_claimAutoreleasedReturnValue();

          if (v381)
          {
            objc_msgSend(v356, "objectForKeyedSubscript:", v355);
            v382 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MRCommandInfoProtobuf setCommand:](v357, "setCommand:", objc_msgSend(v382, "intValue"));

          }
          v352 = v354;
          objc_msgSend(v356, "objectForKeyedSubscript:", v354, v414);
          v383 = (void *)objc_claimAutoreleasedReturnValue();

          if (v383)
          {
            objc_msgSend(v356, "objectForKeyedSubscript:", v354);
            v384 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v384, "floatValue");
            -[_MRCommandInfoProtobuf setMaximumRating:](v357, "setMaximumRating:");

          }
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("minimumRating"));
          v385 = (void *)objc_claimAutoreleasedReturnValue();

          if (v385)
          {
            objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("minimumRating"));
            v386 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v386, "floatValue");
            -[_MRCommandInfoProtobuf setMinimumRating:](v357, "setMinimumRating:");

          }
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("preferredPlaybackRate"));
          v387 = (void *)objc_claimAutoreleasedReturnValue();

          if (v387)
          {
            objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("preferredPlaybackRate"));
            v388 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v388, "floatValue");
            -[_MRCommandInfoProtobuf setPreferredPlaybackRate:](v357, "setPreferredPlaybackRate:");

          }
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("canScrub"));
          v389 = (void *)objc_claimAutoreleasedReturnValue();

          if (v389)
          {
            objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("canScrub"));
            v390 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MRCommandInfoProtobuf setCanScrub:](v357, "setCanScrub:", objc_msgSend(v390, "intValue"));

          }
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("numAvailableSkips"));
          v391 = (void *)objc_claimAutoreleasedReturnValue();

          if (v391)
          {
            objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("numAvailableSkips"));
            v392 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MRCommandInfoProtobuf setNumAvailableSkips:](v357, "setNumAvailableSkips:", objc_msgSend(v392, "intValue"));

          }
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("presentationStyle"));
          v393 = (void *)objc_claimAutoreleasedReturnValue();

          if (v393)
          {
            objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("presentationStyle"));
            v394 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MRCommandInfoProtobuf setPresentationStyle:](v357, "setPresentationStyle:", objc_msgSend(v394, "intValue"));

          }
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("skipFrequency"));
          v395 = (void *)objc_claimAutoreleasedReturnValue();

          if (v395)
          {
            objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("skipFrequency"));
            v396 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MRCommandInfoProtobuf setSkipFrequency:](v357, "setSkipFrequency:", objc_msgSend(v396, "intValue"));

          }
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("skipInterval"));
          v397 = (void *)objc_claimAutoreleasedReturnValue();

          if (v397)
          {
            objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("skipInterval"));
            v398 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MRCommandInfoProtobuf setSkipInterval:](v357, "setSkipInterval:", objc_msgSend(v398, "intValue"));

          }
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("upNextItemCount"));
          v399 = (void *)objc_claimAutoreleasedReturnValue();

          if (v399)
          {
            objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("upNextItemCount"));
            v400 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MRCommandInfoProtobuf setUpNextItemCount:](v357, "setUpNextItemCount:", objc_msgSend(v400, "intValue"));

          }
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("active"));
          v401 = (void *)objc_claimAutoreleasedReturnValue();

          if (v401)
          {
            objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("active"));
            v402 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MRCommandInfoProtobuf setActive:](v357, "setActive:", objc_msgSend(v402, "BOOLValue"));

          }
          objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("enabled"));
          v403 = (void *)objc_claimAutoreleasedReturnValue();

          if (v403)
          {
            objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("enabled"));
            v404 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MRCommandInfoProtobuf setEnabled:](v357, "setEnabled:", objc_msgSend(v404, "BOOLValue"));

          }
          -[_MRSupportedCommandsProtobuf addSupportedCommand:](v421, "addSupportedCommand:", v357);

        }
        v422 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v439, v447, 16);
      }
      while (v422);
    }

    v23 = 1;
    v6 = v415;
    v4 = v416;
    v346 = v414;
    v24 = 0x1E0C99000;
  }
  else
  {
    v421 = 0;
  }
  objc_msgSend(*(id *)(v24 + 3560), "array", v414);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if (!v6)
    {
      v412 = 0;
      v409 = v417;
      goto LABEL_202;
    }
    v406 = objc_alloc_init(_MRSetStateMessageProtobuf);
    -[_MRSetStateMessageProtobuf setPlayerPath:](v406, "setPlayerPath:", v6);
    -[_MRSetStateMessageProtobuf setPlaybackQueue:](v406, "setPlaybackQueue:", v418);
    -[_MRSetStateMessageProtobuf setSupportedCommands:](v406, "setSupportedCommands:", v421);
    -[MRExternalJSONClientConnection _createProtocolMessage:underlyingCodableMessage:](self, "_createProtocolMessage:underlyingCodableMessage:", objc_opt_class(), v406);
    v407 = (void *)objc_claimAutoreleasedReturnValue();
    if (v346)
    {
      -[MRExternalJSONClientConnection _createProtocolMessage:underlyingCodableMessage:](self, "_createProtocolMessage:underlyingCodableMessage:", objc_opt_class(), v346);
      v408 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v405, "addObject:", v408);

    }
    objc_msgSend(v405, "addObject:", v407);

  }
  v409 = v417;
  if (v417)
  {
    v410 = objc_alloc_init(_MRSetNowPlayingClientMessageProtobuf);
    -[_MRSetNowPlayingClientMessageProtobuf setClient:](v410, "setClient:", v417);
    -[MRExternalJSONClientConnection _createProtocolMessage:underlyingCodableMessage:](self, "_createProtocolMessage:underlyingCodableMessage:", objc_opt_class(), v410);
    v411 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v405, "addObject:", v411);

  }
  v412 = v405;
LABEL_202:

  return v412;
}

- (id)_encodeVolumeDidChange:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  int v15;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingCodableMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endpointUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("deviceUID"));

  v8 = (void *)MEMORY[0x1E0CB3598];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "volume");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "decimalValue");
  }
  else
  {
    v14[0] = 0;
    v14[1] = 0;
    v15 = 0;
  }
  objc_msgSend(v8, "decimalNumberWithDecimal:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("volumeLevel"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("muting"));
  return v5;
}

- (id)_createProtocolMessage:(Class)a3 underlyingCodableMessage:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_msgSend([a3 alloc], "initWithUnderlyingCodableMessage:error:", v5, 0);

  objc_msgSend(v6, "setTimestamp:", mach_absolute_time());
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
}

@end
