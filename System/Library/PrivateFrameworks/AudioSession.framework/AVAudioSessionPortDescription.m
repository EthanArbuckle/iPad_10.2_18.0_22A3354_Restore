@implementation AVAudioSessionPortDescription

- (AVAudioSessionPort)portType
{
  return (AVAudioSessionPort)*((id *)self->_impl + 2);
}

- (void)dealloc
{
  PortDescriptionImpl *impl;
  objc_super v4;

  impl = (PortDescriptionImpl *)self->_impl;
  if (impl)
  {
    PortDescriptionImpl::~PortDescriptionImpl(impl);
    MEMORY[0x1A1AF1C48]();
  }
  self->_impl = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSessionPortDescription;
  -[AVAudioSessionPortDescription dealloc](&v4, sel_dealloc);
}

- (AVAudioSessionPortDescription)initWithRawPortDescriptionXPC:(id)a3 owningSession:(id)a4
{
  id v6;
  id v7;
  AVAudioSessionPortDescription *v8;
  uint64_t v9;
  as::client *inited;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  __CFString *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  NSString *v31;
  StringUIntValueConverter *EndpointValueConverter;
  unint64_t UInt32;
  uint64_t v34;
  AVAudioSessionPortDescription *v35;
  NSObject *v36;
  objc_super v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)AVAudioSessionPortDescription;
  v8 = -[AVAudioSessionPortDescription init](&v38, sel_init);
  if (!v8)
  {
LABEL_15:
    v35 = v8;
    goto LABEL_19;
  }
  v9 = operator new();
  inited = (as::client *)objc_initWeak((id *)v9, v7);
  *(_QWORD *)(v9 + 37) = 0;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 8) = 0u;
  *(_OWORD *)(v9 + 48) = xmmword_19EFA2A20;
  *(_OWORD *)(v9 + 64) = 0u;
  *(_OWORD *)(v9 + 80) = 0u;
  v8->_impl = (void *)v9;
  if (v6)
  {
    v11 = -[AVAudioSessionPortDescription privateGetImplementation](v8, "privateGetImplementation");
    v12 = (id)*MEMORY[0x1E0D49E88];
    objc_msgSend(v6, "objectForKey:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(v11 + 8);
    *(_QWORD *)(v11 + 8) = v13;

    v15 = (id)*MEMORY[0x1E0D49EB8];
    objc_msgSend(v6, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
LABEL_10:
      v18 = (id)*MEMORY[0x1E0D49EA8];
      objc_msgSend(v6, "objectForKey:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(v11 + 24);
      *(_QWORD *)(v11 + 24) = v19;

      v21 = (id)*MEMORY[0x1E0D49EE8];
      objc_msgSend(v6, "objectForKey:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(v11 + 32);
      *(_QWORD *)(v11 + 32) = v22;

      v24 = (id)*MEMORY[0x1E0D49E98];
      objc_msgSend(v6, "objectForKey:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      *(_BYTE *)(v11 + 40) = objc_msgSend(v25, "BOOLValue");
      v26 = (id)*MEMORY[0x1E0D49EF0];
      objc_msgSend(v6, "objectForKey:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      *(_BYTE *)(v11 + 41) = objc_msgSend(v27, "BOOLValue");
      v28 = (id)*MEMORY[0x1E0D49EA0];
      objc_msgSend(v6, "objectForKey:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      *(_BYTE *)(v11 + 43) = objc_msgSend(v29, "BOOLValue");
      v30 = (id)*MEMORY[0x1E0D49E78];
      objc_msgSend(v6, "objectForKey:", v30);
      v31 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        EndpointValueConverter = (StringUIntValueConverter *)GetEndpointValueConverter();
        UInt32 = StringUIntValueConverter::getUInt32(EndpointValueConverter, v31);
        v34 = HIDWORD(UInt32);
        if ((UInt32 & 1) == 0)
          v34 = 1969977198;
        *(_QWORD *)(v11 + 56) = v34;
      }
      -[AVAudioSessionPortDescription configureChannelsAndDataSources:](v8, "configureChannelsAndDataSources:", v6);

      goto LABEL_15;
    }
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("USBInput")) & 1) != 0
      || (objc_msgSend(v16, "isEqualToString:", CFSTR("USB")) & 1) != 0
      || objc_msgSend(v16, "isEqualToString:", CFSTR("IDAM")))
    {
      v17 = CFSTR("USBAudio");

    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MicrophoneBluetooth")) & 1) != 0
           || objc_msgSend(v16, "isEqualToString:", CFSTR("HeadsetBT")))
    {
      v17 = CFSTR("BluetoothHFP");

    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("HeadphonesBT")))
    {
      v17 = CFSTR("BluetoothA2DPOutput");

    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("BluetoothLEOutput")))
    {
      v17 = CFSTR("BluetoothLE");

    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("CarAudioInput")) & 1) != 0
           || objc_msgSend(v16, "isEqualToString:", CFSTR("CarAudioOutput")))
    {
      v17 = CFSTR("CarAudio");

    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("AirTunes")))
    {
      v17 = CFSTR("AirPlay");

    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("AirPlayLowLatency")))
    {
      v17 = CFSTR("AirPlay");

      *(_BYTE *)(v11 + 44) = 1;
      *(_QWORD *)(v11 + 48) = 1;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Headphone")) & 1) != 0
           || objc_msgSend(v16, "isEqualToString:", CFSTR("TTY")))
    {
      v17 = CFSTR("Headphones");

    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("HDMI")) & 1) != 0
           || (objc_msgSend(v16, "isEqualToString:", CFSTR("HDMIOutput")) & 1) != 0
           || objc_msgSend(v16, "isEqualToString:", CFSTR("SystemCapture")))
    {
      v17 = CFSTR("HDMIOutput");

    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Thunderbolt")) & 1) != 0
           || objc_msgSend(v16, "isEqualToString:", CFSTR("ThunderboltInput")))
    {
      v17 = CFSTR("Thunderbolt");

    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("LineIn")))
    {
      v17 = CFSTR("LineIn");

    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("ContinuityMicrophone")))
    {
      v17 = CFSTR("ContinuityMicrophone");

    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("LineOut")))
    {
      v17 = CFSTR("LineOut");

    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("MicrophoneBuiltIn")))
    {
      v17 = CFSTR("MicrophoneBuiltIn");

    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("MicrophoneWired")))
    {
      v17 = CFSTR("MicrophoneWired");

    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("Receiver")))
    {
      v17 = CFSTR("Receiver");

    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("Speaker")))
    {
      v17 = CFSTR("Speaker");

    }
    else
    {
      if (!objc_msgSend(v16, "isEqualToString:", CFSTR("S/PDIF")))
        goto LABEL_9;
      v17 = CFSTR("S/PDIF");

    }
    v16 = v17;
LABEL_9:
    objc_storeStrong((id *)(v11 + 16), v16);
    goto LABEL_10;
  }
  v36 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(inited));
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "AVAudioSessionPortImpl.mm";
    v41 = 1024;
    v42 = 329;
    _os_log_impl(&dword_19EF50000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d Unexpected nil value for port description", buf, 0x12u);
  }
  v35 = 0;
LABEL_19:

  return v35;
}

+ (id)privateCreateArray:(id)a3 owningSession:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  AVAudioSessionPortDescription *v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_msgSend(v5, "count");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        objc_msgSend(v5, "objectAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[AVAudioSessionPortDescription initWithRawPortDescriptionXPC:owningSession:]([AVAudioSessionPortDescription alloc], "initWithRawPortDescriptionXPC:owningSession:", v10, v6);
        if (v11)
          objc_msgSend(v8, "insertObject:atIndex:", v11, i);

      }
    }
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v8);

  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  }

  return v12;
}

- (void)configureChannelsAndDataSources:(id)a3
{
  PortDescriptionImpl *v4;
  void *v5;
  uint64_t v6;
  AVAudioSessionPortDescription *v7;
  id v8;
  id var12;
  id v10;
  id WeakRetained;
  id var1;
  id v13;
  uint64_t v14;
  id var13;
  id var14;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  AVAudioSessionPortDescription *obj;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v4 = -[AVAudioSessionPortDescription privateGetImplementation](self, "privateGetImplementation");
  v24 = (id)*MEMORY[0x1E0D49EC0];
  objc_msgSend(v30, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)*MEMORY[0x1E0D49E58];
  objc_msgSend(v30, "objectForKey:");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = self;
  objc_sync_enter(v7);
  v25 = (void *)v6;
  v8 = +[AVAudioSessionChannelDescription privateCreateArray:portUID:](AVAudioSessionChannelDescription, "privateCreateArray:portUID:", v6, v4->var4);
  var12 = v4->var12;
  v4->var12 = v8;

  objc_sync_exit(v7);
  v10 = (id)*MEMORY[0x1E0D49E70];
  v29 = (id)*MEMORY[0x1E0D49E80];
  v26 = v10;
  objc_msgSend(v30, "objectForKey:", v10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(&v4->var0);
  if (objc_msgSend(WeakRetained, "allowAllBuiltInDataSources"))
  {
    objc_msgSend(v30, "objectForKey:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v32, "count") + objc_msgSend(v31, "count"));
  objc_msgSend(v33, "addObjectsFromArray:", v31);
  if (v32)
    objc_msgSend(v33, "addObjectsFromArray:", v32);
  if (objc_msgSend(v33, "count") == 1)
  {

    v33 = 0;
  }
  obj = v7;
  objc_sync_enter(obj);
  var1 = v4->var1;
  v13 = objc_loadWeakRetained(&v4->var0);
  +[AVAudioSessionDataSourceDescription privateCreateArray:portID:sessionID:](AVAudioSessionDataSourceDescription, "privateCreateArray:portID:sessionID:", v33, var1, objc_msgSend(v13, "opaqueSessionID"));
  v14 = objc_claimAutoreleasedReturnValue();
  var13 = v4->var13;
  v4->var13 = (id)v14;

  var14 = v4->var14;
  v4->var14 = 0;

  if (v5)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v17 = v4->var13;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v21, "dataSourceID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToNumber:", v5);

          if (v23)
          {
            objc_storeStrong(&v4->var14, v21);
            goto LABEL_19;
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_19:

  }
  objc_sync_exit(obj);

  PortDescriptionImpl::ValidateRequiredFields(v4);
}

- (PortDescriptionImpl)privateGetImplementation
{
  return (PortDescriptionImpl *)self->_impl;
}

- (void)setSupportsSpatialAudio:(BOOL)a3
{
  *(_BYTE *)(-[AVAudioSessionPortDescription privateGetImplementation](self, "privateGetImplementation") + 42) = a3;
}

- (NSString)portName
{
  return (NSString *)*((id *)self->_impl + 3);
}

- (BOOL)isEqual:(id)a3
{
  AVAudioSessionPortDescription *v4;
  AVAudioSessionPortDescription *v5;
  BOOL v6;

  v4 = (AVAudioSessionPortDescription *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[AVAudioSessionPortDescription isEqualToPort:compareStrict:](self, "isEqualToPort:compareStrict:", v5, 1);

  return v6;
}

- (BOOL)isEqualToPort:(id)a3 compareStrict:(BOOL)a4
{
  _BOOL4 v4;
  AVAudioSessionPortDescription *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  BOOL v35;

  v4 = a4;
  v6 = (AVAudioSessionPortDescription *)a3;
  if (self == v6)
    goto LABEL_19;
  -[AVAudioSessionPortDescription UID](self, "UID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioSessionPortDescription UID](v6, "UID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
    goto LABEL_20;
  -[AVAudioSessionPortDescription portType](self, "portType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioSessionPortDescription portType](v6, "portType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
    goto LABEL_20;
  -[AVAudioSessionPortDescription portName](self, "portName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioSessionPortDescription portName](v6, "portName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
    goto LABEL_20;
  if (v4)
  {
    -[AVAudioSessionPortDescription channels](self, "channels");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioSessionPortDescription channels](v6, "channels");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (v16 != 0) ^ (v17 == 0);

    if ((v18 & 1) == 0)
      goto LABEL_20;
    -[AVAudioSessionPortDescription channels](self, "channels");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[AVAudioSessionPortDescription channels](self, "channels");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioSessionPortDescription channels](v6, "channels");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqualToArray:", v21);

      if ((v22 & 1) == 0)
        goto LABEL_20;
    }
    -[AVAudioSessionPortDescription dataSources](self, "dataSources");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {

    }
    else
    {
      -[AVAudioSessionPortDescription dataSources](v6, "dataSources");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        goto LABEL_19;
    }
    -[AVAudioSessionPortDescription dataSources](self, "dataSources");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[AVAudioSessionPortDescription dataSources](v6, "dataSources");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
        goto LABEL_20;
    }
    -[AVAudioSessionPortDescription dataSources](self, "dataSources");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioSessionPortDescription dataSources](v6, "dataSources");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqualToArray:", v28);

    if ((v29 & 1) == 0)
      goto LABEL_20;
    -[AVAudioSessionPortDescription selectedDataSource](self, "selectedDataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {

      goto LABEL_18;
    }
    -[AVAudioSessionPortDescription selectedDataSource](v6, "selectedDataSource");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
LABEL_18:
      -[AVAudioSessionPortDescription selectedDataSource](self, "selectedDataSource");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioSessionPortDescription selectedDataSource](v6, "selectedDataSource");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqual:", v33);

      if ((v34 & 1) != 0)
        goto LABEL_19;
LABEL_20:
      v35 = 0;
      goto LABEL_21;
    }
  }
LABEL_19:
  v35 = 1;
LABEL_21:

  return v35;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AVAudioSessionPortDescription UID](self, "UID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)channels
{
  AVAudioSessionPortDescription *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *((id *)v2->_impl + 8);
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)dataSources
{
  AVAudioSessionPortDescription *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *((id *)v2->_impl + 9);
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (BOOL)hasHardwareVoiceCallProcessing
{
  return *((_BYTE *)self->_impl + 41);
}

- (BOOL)isSpatialAudioEnabled
{
  return *((_BYTE *)self->_impl + 42);
}

- (BOOL)isLiveListenSupported
{
  return *((_BYTE *)self->_impl + 43);
}

- (BOOL)isHeadphones
{
  return *((_BYTE *)self->_impl + 40);
}

- (BOOL)isLowLatencyAirPlay
{
  return *((_BYTE *)self->_impl + 44);
}

- (int64_t)portSubType
{
  return *((_QWORD *)self->_impl + 6);
}

- (unint64_t)endpointType
{
  return *((_QWORD *)self->_impl + 7);
}

- (AVAudioSessionDataSourceDescription)selectedDataSource
{
  AVAudioSessionPortDescription *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *((id *)v2->_impl + 10);
  objc_sync_exit(v2);

  return (AVAudioSessionDataSourceDescription *)v3;
}

- (AVAudioSessionDataSourceDescription)preferredDataSource
{
  void *impl;
  id WeakRetained;
  void *v5;
  AVAudioSessionPortDescription *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  WeakRetained = objc_loadWeakRetained((id *)impl);
  copyDataSourcePreference(objc_msgSend(WeakRetained, "opaqueSessionID"), *((NSNumber **)impl + 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = *((id *)impl + 9);
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "dataSourceID", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v5, "isEqualToNumber:", v12);

          if (v13)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v6);
  }
  else
  {
    v8 = 0;
  }

  return (AVAudioSessionDataSourceDescription *)v8;
}

- (NSString)UID
{
  return (NSString *)*((id *)self->_impl + 4);
}

- (id)description
{
  void *impl;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  impl = self->_impl;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *((_QWORD *)impl + 2);
  v8 = *((_QWORD *)impl + 3);
  v9 = *((_QWORD *)impl + 4);
  objc_msgSend(*((id *)impl + 10), "dataSourceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, type = %@; name = %@; UID = %@; selectedDataSource = %@>"),
    v6,
    self,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)setPreferredDataSource:(AVAudioSessionDataSourceDescription *)dataSource error:(NSError *)outError
{
  AVAudioSessionDataSourceDescription *v6;
  PortDescriptionImpl *v7;
  id *p_var0;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  void *v16;
  id WeakRetained;
  unint64_t *p_shared_owners;
  unint64_t v19;
  id v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  char v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  as::client::XPCConnection *v29;
  std::__shared_weak_count *v30;
  as::client::XPCConnection *v31;
  std::__shared_weak_count *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v6 = dataSource;
  v7 = -[AVAudioSessionPortDescription privateGetImplementation](self, "privateGetImplementation");
  p_var0 = &v7->var0;
  if (v6)
  {
    v9 = (id)*MEMORY[0x1E0D49F08];
    v35[0] = v9;
    -[AVAudioSessionPortDescription privateGetID](self, "privateGetID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v10;
    v11 = (id)*MEMORY[0x1E0D49EF8];
    v35[1] = v11;
    -[AVAudioSessionDataSourceDescription dataSourceID](v6, "dataSourceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id *)MEMORY[0x1E0D49AA0];
  }
  else
  {
    if (!v7->var15)
    {
      v24 = 1;
      goto LABEL_19;
    }
    v9 = (id)*MEMORY[0x1E0D49F08];
    v33[0] = v9;
    -[AVAudioSessionPortDescription privateGetID](self, "privateGetID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v10;
    v11 = (id)*MEMORY[0x1E0D49EF8];
    v33[1] = v11;
    objc_msgSend(p_var0[11], "dataSourceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id *)MEMORY[0x1E0D49720];
  }

  v15 = *v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(p_var0 + 11, dataSource);
  WeakRetained = objc_loadWeakRetained(p_var0);
  AVAudioSessionGetXPCConnection(objc_msgSend(WeakRetained, "opaqueSessionID"), &v31);

  v29 = v31;
  v30 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
  }
  v20 = objc_loadWeakRetained(p_var0);
  as::client::api_utils::SetPropertyXPC(&v29, objc_msgSend(v20, "opaqueSessionID"), v15, v16, 1);

  v21 = v30;
  if (v30)
  {
    v22 = (unint64_t *)&v30->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = FormatNSErrorForReturn();
  v25 = v32;
  if (v32)
  {
    v26 = (unint64_t *)&v32->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

LABEL_19:
  return v24;
}

- (id)privateGetID
{
  return *((id *)self->_impl + 1);
}

@end
