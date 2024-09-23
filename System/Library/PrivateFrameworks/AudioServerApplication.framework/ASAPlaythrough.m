@implementation ASAPlaythrough

- (ASAPlaythrough)initWithDevice:(id)a3 usingChannelMapping:(id)a4
{
  id v6;
  id v7;
  ASAPlaythrough *v8;
  void *v9;
  uint64_t v10;
  ASAAudioDevice *audioDevice;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASAPlaythrough;
  v8 = -[ASAPlaythrough init](&v13, sel_init);
  if (v8)
  {
    +[ASACoreAudio sharedCoreAudioObject](ASACoreAudio, "sharedCoreAudioObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "audioDeviceWithUID:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    audioDevice = v8->_audioDevice;
    v8->_audioDevice = (ASAAudioDevice *)v10;

    if (v8->_audioDevice)
    {
      objc_storeStrong((id *)&v8->_channelMapping, a4);
      v8->_aggregateID = 0;
    }
    else
    {

      v8 = 0;
    }

  }
  return v8;
}

- (ASAPlaythrough)initWithDevices:(id)a3 usingMainDevice:(id)a4 andClockDevice:(id)a5 withName:(id)a6 isPrivate:(BOOL)a7 usingChannelMapping:(id)a8
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  int v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
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
  const __CFDictionary *v48;
  void *v49;
  id v50;
  AudioObjectID v51;
  OSStatus AggregateDevice;
  int v53;
  ASAPlaythrough *v54;
  ASAPlaythrough *aggregateUID;
  int v56;
  ASAPlaythrough *v57;
  NSString *v58;
  _BOOL4 v61;
  void *v62;
  id v63;
  const __CFDictionary *v64;
  id v65;
  id obj;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[6];
  _QWORD v77[6];
  _QWORD v78[3];
  _QWORD v79[3];
  uint8_t buf[4];
  const __CFDictionary *v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v61 = a7;
  v84 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v65 = a5;
  v64 = (const __CFDictionary *)a6;
  v63 = a8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
  v62 = v13;
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v73;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v73 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        v22 = objc_msgSend(v15, "clockDomain");
        if (v22 != objc_msgSend(v21, "clockDomain"))
        {
          v23 = 0;
          goto LABEL_11;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
      if (v18)
        continue;
      break;
    }
  }
  v23 = 1;
LABEL_11:

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v16;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
  if (v24)
  {
    v25 = v24;
    v26 = v14;
    v27 = *(_QWORD *)v69;

    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v69 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        if ((v23 & 1) != 0)
        {
          v30 = 0;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v81 = v64;
            _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "All devices in aggregate %@ share a clock domain, disabling drift compensation", buf, 0xCu);
            v30 = 0;
          }
        }
        else
        {
          objc_msgSend(v65, "deviceUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "deviceUID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v31, "isEqualToString:", v32);

          v30 = v33 ^ 1u;
        }
        v78[0] = CFSTR("uid");
        objc_msgSend(v29, "deviceUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = v34;
        v78[1] = CFSTR("drift");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v79[1] = v35;
        v78[2] = CFSTR("drift quality");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 127);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v79[2] = v36;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, v78, 3);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v67, "addObject:", v37);
        objc_msgSend(v29, "deviceUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "appendFormat:", CFSTR("%@%@"), &stru_24E0456E0, v38);

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    }
    while (v25);
    v15 = 0;
    v14 = v26;
  }

  v39 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v65, "deviceUID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    objc_msgSend(v65, "deviceUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("%@"), v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v39, "stringWithFormat:", CFSTR("%@"), &stru_24E0456E0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v43 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v62, "deviceUID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_msgSend(v62, "deviceUID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("%@"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v43, "stringWithFormat:", CFSTR("%@"), &stru_24E0456E0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v76[0] = CFSTR("name");
  v76[1] = CFSTR("uid");
  v77[0] = v64;
  v77[1] = v14;
  v76[2] = CFSTR("clock");
  v76[3] = CFSTR("master");
  v77[2] = v42;
  v77[3] = v46;
  v77[4] = v67;
  v76[4] = CFSTR("subdevices");
  v76[5] = CFSTR("private");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v61);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v77[5] = v47;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v77, v76, 6);
  v48 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v81 = v48;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Aggregate %@", buf, 0xCu);
  }
  +[ASACoreAudio sharedCoreAudioObject](ASACoreAudio, "sharedCoreAudioObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "pluginWithBundleID:", CFSTR("com.apple.audio.V5"));
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "audioDeviceObjectIDWithUID:", v14);
  *(_DWORD *)buf = v51;
  if (v51 && !AudioHardwareDestroyAggregateDevice(v51))
  {
    while (1)
    {
      *(_DWORD *)buf = objc_msgSend(v50, "audioDeviceObjectIDWithUID:", v14);
      if (!*(_DWORD *)buf)
        break;
      usleep(0x186A0u);
    }
  }
  AggregateDevice = AudioHardwareCreateAggregateDevice(v48, (AudioObjectID *)buf);
  if (AggregateDevice)
  {
    v53 = AggregateDevice;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASAPlaythrough initWithDevices:usingMainDevice:andClockDevice:withName:isPrivate:usingChannelMapping:].cold.1(v53);
    v54 = 0;
    aggregateUID = self;
    goto LABEL_44;
  }
  while (1)
  {
    v56 = *(_DWORD *)buf;
    if (v56 == objc_msgSend(v50, "audioDeviceObjectIDWithUID:", v14))
      break;
    usleep(0x2710u);
  }
  v57 = -[ASAPlaythrough initWithDevice:usingChannelMapping:](self, "initWithDevice:usingChannelMapping:", v14, v63);
  v54 = v57;
  if (v57)
  {
    v57->_aggregateID = *(_DWORD *)buf;
    v58 = v14;
    aggregateUID = (ASAPlaythrough *)v54->_aggregateUID;
    v54->_aggregateUID = v58;
LABEL_44:

  }
  return v54;
}

- (ASAPlaythrough)initWithDevices:(id)a3 usingMainDevice:(id)a4 andClockDeviceUID:(id)a5 withName:(id)a6 isPrivate:(BOOL)a7 usingChannelMapping:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  ASAPlaythrough *v26;
  _BOOL4 v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v29 = a7;
  v36 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v30 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a8;
  v16 = (void *)objc_opt_new();
  +[ASACoreAudio sharedCoreAudioObject](ASACoreAudio, "sharedCoreAudioObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v17, "audioDeviceWithUID:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v22));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v16, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v20);
  }

  objc_msgSend(v17, "audioDeviceWithUID:", v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "clockDeviceWithUID:", v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[ASAPlaythrough initWithDevices:usingMainDevice:andClockDevice:withName:isPrivate:usingChannelMapping:](self, "initWithDevices:usingMainDevice:andClockDevice:withName:isPrivate:usingChannelMapping:", v16, v24, v25, v14, v29, v15);

  return v26;
}

- (BOOL)start
{
  void *v3;
  int v4;
  size_t v5;
  _QWORD *v6;
  void *v7;
  $3CF287503559622E07D78CA61CDBEDC6 *ioContext;
  unsigned int var2;
  unint64_t v10;
  void *v11;
  size_t v12;
  _QWORD *v13;
  void *v14;
  $3CF287503559622E07D78CA61CDBEDC6 *v15;
  unsigned int var1;
  unint64_t v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  void *v22;
  uint8_t v24[16];

  if (-[ASAPlaythrough playing](self, "playing"))
    -[ASAPlaythrough stop](self, "stop");
  -[ASAPlaythrough _createIOContext](self, "_createIOContext");
  if (!self->_ioContext)
    return 0;
  -[ASAPlaythrough audioDevice](self, "audioDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "createAudioProcID:forIOProc:withClientData:error:", &self->_procID, InputOutputProc, self->_ioContext, 0);

  if (!v4)
    return 0;
  v5 = 4 * self->_ioContext->var2 + 12;
  v6 = malloc_type_calloc(1uLL, v5, 0x945B8045uLL);
  v7 = v6;
  if (v6)
  {
    *v6 = self->_procID;
    ioContext = self->_ioContext;
    var2 = ioContext->var2;
    *((_DWORD *)v6 + 2) = var2;
    if (var2)
    {
      v10 = 0;
      do
        *((_DWORD *)v6 + v10++ + 3) = 1;
      while (v10 < ioContext->var2);
    }
    -[ASAPlaythrough audioDevice](self, "audioDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1937077093, v7, v5, 0, 0);

  }
  free(v7);
  v12 = 4 * self->_ioContext->var1 + 12;
  v13 = malloc_type_calloc(1uLL, v12, 0x4AF65C22uLL);
  v14 = v13;
  if (v13)
  {
    *v13 = self->_procID;
    v15 = self->_ioContext;
    var1 = v15->var1;
    *((_DWORD *)v13 + 2) = var1;
    if (var1)
    {
      v17 = 0;
      do
        *((_DWORD *)v13 + v17++ + 3) = 1;
      while (v17 < v15->var1);
    }
    -[ASAPlaythrough audioDevice](self, "audioDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMainInputProperty:withData:ofSize:withQualifier:ofSize:", 1937077093, v14, v12, 0, 0);

  }
  free(v14);
  -[ASAPlaythrough audioDevice](self, "audioDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "startAudioProc:error:", self->_procID, 0);

  if (!v20)
  {
    -[ASAPlaythrough audioDevice](self, "audioDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "destroyAudioProcID:error:", self->_procID, 0);

    self->_procID = 0;
    -[ASAPlaythrough _destroyIOContext](self, "_destroyIOContext");
    return 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Audio Proc Started\n", v24, 2u);
  }
  v21 = 1;
  -[ASAPlaythrough setPlaying:](self, "setPlaying:", 1);
  return v21;
}

- (BOOL)stop
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  v3 = -[ASAPlaythrough playing](self, "playing");
  if (v3)
  {
    -[ASAPlaythrough audioDevice](self, "audioDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAudioProc:error:", self->_procID, 0);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Audio Proc Stoped\n", v7, 2u);
    }
    -[ASAPlaythrough audioDevice](self, "audioDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "destroyAudioProcID:error:", self->_procID, 0);

    self->_procID = 0;
    -[ASAPlaythrough _destroyIOContext](self, "_destroyIOContext");
    -[ASAPlaythrough setPlaying:](self, "setPlaying:", 0);
  }
  return v3;
}

- (void)_createIOContext
{
  $3CF287503559622E07D78CA61CDBEDC6 *v3;
  $3CF287503559622E07D78CA61CDBEDC6 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  UInt32 v9;
  uint64_t v10;
  uint64_t i;
  ASAStream *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  UInt32 v18;
  uint64_t v19;
  uint64_t j;
  ASAStream *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UInt32 v27;
  size_t v28;
  float *v29;
  unsigned int v30;
  AudioBufferList **v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  __int128 v38;
  void *v39;
  void *v40;
  void *v41;
  UInt32 mChannelsPerFrame;
  UInt32 v43;
  UInt32 v44;
  AudioBufferList *v45;
  AudioBufferList **var9;
  unint64_t v47;
  unsigned int var0;
  UInt32 v49;
  float *var4;
  unsigned int v51;
  unsigned int v52;
  uint64_t v53;
  UInt32 *p_mNumberBuffers;
  UInt32 *v55;
  _DWORD *v56;
  int v57;
  unsigned int v58;
  UInt32 v59;
  float *v60;
  uint64_t v61;
  _QWORD *v62;
  unsigned int v63;
  AudioBufferList **v64;
  __int128 v65;
  unsigned int v66;
  NSObject *v67;
  void *v68;
  __int128 v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  AudioBufferList *v74;
  _DWORD *v75;
  _DWORD *v76;
  AudioFormatID v77;
  UInt32 v78;
  unint64_t v79;
  int v80;
  void *v81;
  AudioFormatID v82;
  __int128 v83;
  int v84;
  id v85;
  ASAPlaythrough *v86;
  uint64_t v87;
  id v88;
  id v89;
  char v90;
  id v91;
  id obj;
  uint64_t v93;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  AudioStreamBasicDescription inSourceFormat;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  AudioStreamBasicDescription v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  AudioStreamBasicDescription inDestinationFormat;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v3 = ($3CF287503559622E07D78CA61CDBEDC6 *)malloc_type_calloc(1uLL, 0x48uLL, 0x10A0040D5B763B2uLL);
  if (v3)
  {
    v4 = v3;
    -[ASAPlaythrough audioDevice](self, "audioDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputStreamObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v111;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v111 != v10)
            objc_enumerationMutation(obj);
          v12 = -[ASAObject initWithAudioObjectID:]([ASAStream alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * i), "unsignedIntValue"));
          objc_msgSend(v95, "addObject:", v12);
          -[ASAStream virtualFormat](v12, "virtualFormat");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 += objc_msgSend(v13, "channelsPerFrame");

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    -[ASAPlaythrough audioDevice](self, "audioDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "outputStreamObjectIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v91 = v15;
    v16 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v106, v117, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v107;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v107 != v19)
            objc_enumerationMutation(v91);
          v21 = -[ASAObject initWithAudioObjectID:]([ASAStream alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * j), "unsignedIntValue"));
          objc_msgSend(v94, "addObject:", v21);
          -[ASAStream virtualFormat](v21, "virtualFormat");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v18 += objc_msgSend(v22, "channelsPerFrame");

        }
        v17 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v106, v117, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

    memset(&v105, 0, sizeof(v105));
    objc_msgSend(v95, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "virtualFormat");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      objc_msgSend(v24, "audioStreamBasicDescription");
    else
      memset(&v105, 0, sizeof(v105));

    v105.mFormatFlags |= 0x20u;
    v105.mBytesPerPacket = 4;
    v105.mChannelsPerFrame = v18;
    v105.mBytesPerFrame = 4;
    -[ASAPlaythrough audioDevice](self, "audioDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v4->var0 = objc_msgSend(v26, "ioBufferFrameSize");

    if (v9 <= v18)
      v27 = v18;
    else
      v27 = v9;
    v28 = 4 * v27 * v4->var0;
    v4->var3 = v28;
    v29 = (float *)malloc_type_calloc(1uLL, v28, 0x88B34020uLL);
    v4->var4 = v29;
    if (!v29)
      goto LABEL_94;
    v30 = objc_msgSend(obj, "count");
    v4->var1 = v30;
    v4->var5 = (OpaqueAudioConverter **)malloc_type_calloc(v30, 8uLL, 0x2004093837F09uLL);
    v4->var7 = (AudioBufferList **)malloc_type_calloc(v4->var1, 8uLL, 0x2004093837F09uLL);
    v31 = (AudioBufferList **)malloc_type_calloc(v4->var1, 8uLL, 0x2004093837F09uLL);
    v4->var9 = v31;
    if (v4->var5)
    {
      v32 = 0;
      if (v4->var7 && v31)
      {
        v86 = self;
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v88 = v95;
        v33 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
        if (v33)
        {
          v34 = v33;
          v35 = 0;
          v36 = 0;
          v90 = 0;
          v93 = *(_QWORD *)v102;
          do
          {
            v37 = 0;
            v38 = 0uLL;
            do
            {
              if (*(_QWORD *)v102 != v93)
              {
                objc_enumerationMutation(v88);
                v38 = 0uLL;
              }
              v39 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v37);
              *(_QWORD *)&inSourceFormat.mBitsPerChannel = 0;
              *(_OWORD *)&inSourceFormat.mSampleRate = v38;
              *(_OWORD *)&inSourceFormat.mBytesPerPacket = v38;
              objc_msgSend(v39, "virtualFormat");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v40;
              if (v40)
                objc_msgSend(v40, "audioStreamBasicDescription");
              else
                memset(&inSourceFormat, 0, sizeof(inSourceFormat));

              inDestinationFormat = inSourceFormat;
              inDestinationFormat.mFormatFlags = inSourceFormat.mFormatFlags | 0x20;
              inDestinationFormat.mBytesPerPacket = 4;
              inDestinationFormat.mBytesPerFrame = 4;
              AudioConverterNew(&inSourceFormat, &inDestinationFormat, &v4->var5[v35]);
              mChannelsPerFrame = inSourceFormat.mChannelsPerFrame;
              v43 = inSourceFormat.mChannelsPerFrame - 1;
              v44 = (inSourceFormat.mChannelsPerFrame - 1) & ((int)(inSourceFormat.mFormatFlags << 26) >> 31);
              v4->var7[v35] = (AudioBufferList *)malloc_type_calloc(1uLL, 16 * v44 + 24, 0x706C4E01uLL);
              v4->var9[v35] = (AudioBufferList *)malloc_type_calloc(1uLL, 16 * v43 + 24, 0x15FCF6FBuLL);
              if (v4->var5[v35])
              {
                v45 = v4->var7[v35];
                v38 = 0uLL;
                if (v45 && (var9 = v4->var9, var9[v35]))
                {
                  v47 = 0;
                  v45->mNumberBuffers = v44 + 1;
                  var0 = v4->var0;
                  v49 = v4->var0 * inDestinationFormat.mBytesPerFrame;
                  var4 = v4->var4;
                  if (mChannelsPerFrame <= 1)
                    v51 = 1;
                  else
                    v51 = mChannelsPerFrame;
                  v52 = v36 * var0;
                  v53 = 16 * v51;
                  do
                  {
                    p_mNumberBuffers = &var9[v35]->mNumberBuffers;
                    *p_mNumberBuffers = mChannelsPerFrame;
                    v55 = &p_mNumberBuffers[v47 / 4];
                    v55[2] = 1;
                    v55[3] = v49;
                    *((_QWORD *)v55 + 2) = &var4[v52];
                    v52 += var0;
                    v47 += 16;
                  }
                  while (v53 != v47);
                }
                else
                {
                  v90 = 1;
                }
              }
              else
              {
                v90 = 1;
                v38 = 0uLL;
              }
              ++v35;
              v36 += inSourceFormat.mChannelsPerFrame;
              ++v37;
            }
            while (v37 != v34);
            v34 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v101, v116, 16, *(double *)&v38);
          }
          while (v34);
        }
        else
        {
          v90 = 0;
        }

        v32 = v90 & 1;
        self = v86;
      }
    }
    else
    {
      v32 = 0;
    }
    v56 = malloc_type_calloc(1uLL, 16 * (v18 - 1) + 24, 0xA008C1ACuLL);
    v4->var10 = (AudioBufferList *)v56;
    if (v56)
    {
      *v56 = v18;
      if (v18)
      {
        v57 = 0;
        v58 = v4->var0;
        v59 = v4->var0 * v105.mBytesPerFrame;
        v60 = v4->var4;
        v61 = v18;
        v62 = v56 + 4;
        do
        {
          *((_DWORD *)v62 - 2) = 1;
          *((_DWORD *)v62 - 1) = v59;
          *v62 = &v60[v57];
          v62 += 2;
          v57 += v58;
          --v61;
        }
        while (v61);
      }
    }
    v63 = objc_msgSend(v91, "count");
    v4->var2 = v63;
    v4->var6 = (OpaqueAudioConverter **)malloc_type_calloc(v63, 8uLL, 0x2004093837F09uLL);
    v64 = (AudioBufferList **)malloc_type_calloc(v4->var2, 8uLL, 0x2004093837F09uLL);
    v4->var8 = v64;
    if (v4->var6 && v64)
    {
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v85 = v94;
      v89 = (id)objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v96, v114, 16);
      if (v89)
      {
        v66 = 0;
        v87 = *(_QWORD *)v97;
        v67 = MEMORY[0x24BDACB70];
        *(_QWORD *)&v65 = 67109632;
        v83 = v65;
        do
        {
          v68 = 0;
          v69 = 0uLL;
          do
          {
            if (*(_QWORD *)v97 != v87)
            {
              objc_enumerationMutation(v85);
              v69 = 0uLL;
            }
            v70 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)v68);
            *(_QWORD *)&inSourceFormat.mBitsPerChannel = 0;
            *(_OWORD *)&inSourceFormat.mSampleRate = v69;
            *(_OWORD *)&inSourceFormat.mBytesPerPacket = v69;
            objc_msgSend(v70, "virtualFormat", v83);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = v71;
            if (v71)
              objc_msgSend(v71, "audioStreamBasicDescription");
            else
              memset(&inSourceFormat, 0, sizeof(inSourceFormat));

            AudioConverterNew(&v105, &inSourceFormat, &v4->var6[v66]);
            v73 = (inSourceFormat.mChannelsPerFrame - 1) & ((int)(inSourceFormat.mFormatFlags << 26) >> 31);
            v4->var8[v66] = (AudioBufferList *)malloc_type_calloc(1uLL, 16 * v73 + 24, 0x9284C4C4uLL);
            if (v4->var6[v66] && (v74 = v4->var8[v66]) != 0)
            {
              v74->mNumberBuffers = v73 + 1;
              v75 = malloc_type_calloc(inSourceFormat.mChannelsPerFrame, 4uLL, 0x100004052888210uLL);
              if (v75)
              {
                v76 = v75;
                if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                {
                  v77 = objc_msgSend(v70, "startingChannel");
                  *(_QWORD *)&inDestinationFormat.mSampleRate = __PAIR64__(v66, v83);
                  LOWORD(inDestinationFormat.mFormatID) = 1024;
                  *(AudioFormatID *)((char *)&inDestinationFormat.mFormatID + 2) = v77;
                  HIWORD(inDestinationFormat.mFormatFlags) = 1024;
                  inDestinationFormat.mBytesPerPacket = inSourceFormat.mChannelsPerFrame;
                  _os_log_impl(&dword_21C46C000, v67, OS_LOG_TYPE_DEFAULT, "Output Audio Map for %u starting at %u with %u channels\n", (uint8_t *)&inDestinationFormat, 0x14u);
                }
                v78 = inSourceFormat.mChannelsPerFrame;
                if (inSourceFormat.mChannelsPerFrame)
                {
                  v84 = v32;
                  v79 = 0;
                  do
                  {
                    v80 = v79 + objc_msgSend(v70, "startingChannel") - 1;
                    if (-[NSArray count](self->_channelMapping, "count") <= v80)
                    {
                      v76[v79] = -1;
                    }
                    else
                    {
                      -[NSArray objectAtIndexedSubscript:](self->_channelMapping, "objectAtIndexedSubscript:", v80);
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v76[v79] = objc_msgSend(v81, "intValue");

                    }
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                    {
                      v82 = v76[v79];
                      LODWORD(inDestinationFormat.mSampleRate) = 67109376;
                      HIDWORD(inDestinationFormat.mSampleRate) = v79;
                      LOWORD(inDestinationFormat.mFormatID) = 1024;
                      *(AudioFormatID *)((char *)&inDestinationFormat.mFormatID + 2) = v82;
                      _os_log_impl(&dword_21C46C000, v67, OS_LOG_TYPE_DEFAULT, "%d: %d\n", (uint8_t *)&inDestinationFormat, 0xEu);
                    }
                    ++v79;
                    v78 = inSourceFormat.mChannelsPerFrame;
                  }
                  while (v79 < inSourceFormat.mChannelsPerFrame);
                  v32 = v84;
                }
                AudioConverterSetProperty(v4->var6[v66], 0x63686D70u, 4 * v78, v76);
                free(v76);
              }
            }
            else
            {
              v32 = 1;
            }
            ++v66;
            v68 = (char *)v68 + 1;
            v69 = 0uLL;
          }
          while (v68 != v89);
          v89 = (id)objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v96, v114, 16, 0.0);
        }
        while (v89);
      }

    }
    if (v4->var5 && v4->var7 && v4->var9 && v4->var10 && v4->var6 && !((v4->var8 == 0) | v32 & 1))
      self->_ioContext = v4;
    else
LABEL_94:
      -[ASAPlaythrough _freeIOContext:](self, "_freeIOContext:", v4);

  }
}

- (void)_destroyIOContext
{
  -[ASAPlaythrough _freeIOContext:](self, "_freeIOContext:", self->_ioContext);
  self->_ioContext = 0;
}

- (void)_freeIOContext:(id *)a3
{
  OpaqueAudioConverter **var6;
  unint64_t var2;
  unint64_t i;
  OpaqueAudioConverter *v7;
  OpaqueAudioConverter **var5;
  unint64_t var1;
  unint64_t j;
  OpaqueAudioConverter *v11;
  AudioBufferList **var7;
  unint64_t v13;
  AudioBufferList **var9;
  unint64_t v15;
  AudioBufferList **var8;
  unint64_t v17;

  if (a3)
  {
    var6 = a3->var6;
    if (var6)
    {
      var2 = a3->var2;
      if ((_DWORD)var2)
      {
        for (i = 0; i < var2; ++i)
        {
          v7 = a3->var6[i];
          if (v7)
          {
            AudioConverterDispose(v7);
            var2 = a3->var2;
          }
        }
        var6 = a3->var6;
      }
      free(var6);
    }
    var5 = a3->var5;
    if (var5)
    {
      var1 = a3->var1;
      if ((_DWORD)var1)
      {
        for (j = 0; j < var1; ++j)
        {
          v11 = a3->var5[j];
          if (v11)
          {
            AudioConverterDispose(v11);
            var1 = a3->var1;
          }
        }
        var5 = a3->var5;
      }
      free(var5);
    }
    var7 = a3->var7;
    if (var7)
    {
      if (a3->var1)
      {
        v13 = 0;
        do
          free(a3->var7[v13++]);
        while (v13 < a3->var1);
        var7 = a3->var7;
      }
      free(var7);
    }
    var9 = a3->var9;
    if (var9)
    {
      if (a3->var1)
      {
        v15 = 0;
        do
          free(a3->var9[v15++]);
        while (v15 < a3->var1);
        var9 = a3->var9;
      }
      free(var9);
    }
    var8 = a3->var8;
    if (var8)
    {
      if (a3->var2)
      {
        v17 = 0;
        do
          free(a3->var8[v17++]);
        while (v17 < a3->var2);
        var8 = a3->var8;
      }
      free(var8);
    }
    free(a3->var10);
    free(a3->var4);
    free(a3);
  }
}

- (void)dealloc
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to destroy aggregate device with object ID %d, error: 0x%x", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_3();
}

- (ASAAudioDevice)audioDevice
{
  return (ASAAudioDevice *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAudioDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)playing
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDevice, 0);
  objc_storeStrong((id *)&self->_aggregateUID, 0);
  objc_storeStrong((id *)&self->_channelMapping, 0);
}

- (void)initWithDevices:(int)a1 usingMainDevice:andClockDevice:withName:isPrivate:usingChannelMapping:.cold.1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create aggregate with error 0x%x", (uint8_t *)v1, 8u);
}

@end
