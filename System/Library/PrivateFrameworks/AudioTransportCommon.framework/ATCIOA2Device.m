@implementation ATCIOA2Device

+ (id)iokitMatchingDictionary
{
  return (id)objc_msgSend(MEMORY[0x24BE516C0], "serviceMatching:", CFSTR("IOAudio2Device"));
}

- (ATCIOA2Device)initWithService:(id)a3
{
  id v5;
  ATCIOA2Device *v6;
  ATCIOA2Device *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *uid;
  id v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  IOKNotificationPort *notificationPort;
  uint64_t v17;
  IOKConnection *connection;
  IOKConnection *v19;
  IOAudio2EngineStatus *v20;
  unsigned int v21;
  dispatch_source_t v22;
  OS_dispatch_source *notificationSource;
  NSObject *v24;
  ATCIOA2Device *v25;
  uint64_t v26;
  NSArray *inputStreams;
  uint64_t v28;
  NSArray *outputStreams;
  NSArray *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *availableSampleRates;
  uint64_t v47;
  NSObject *v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD handler[4];
  ATCIOA2Device *v59;
  uint64_t v60;
  IOAudio2EngineStatus *v61;
  objc_super v62;
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  int v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v62.receiver = self;
  v62.super_class = (Class)ATCIOA2Device;
  v6 = -[ATCIOA2Device init](&v62, sel_init);
  if (!v6)
    goto LABEL_50;
  v7 = v6;
  objc_msgSend(v5, "propertyForKey:", CFSTR("device name"));
  v8 = objc_claimAutoreleasedReturnValue();
  name = v7->_name;
  v7->_name = (NSString *)v8;

  objc_msgSend(v5, "propertyForKey:", CFSTR("device UID"));
  v10 = objc_claimAutoreleasedReturnValue();
  uid = v7->_uid;
  v7->_uid = (NSString *)v10;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.audio.AudioTransportCommon.aeadevice.%@"), v7->_uid);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v13;

  if (!v7->_queue)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316418;
    v66 = "_queue != nil";
    v67 = 2048;
    v68 = 0;
    v69 = 2048;
    v70 = 0;
    v71 = 2080;
    v72 = &unk_219847856;
    v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
    v75 = 1024;
    v76 = 75;
    v48 = MEMORY[0x24BDACB70];
LABEL_48:
    _os_log_impl(&dword_219843000, v48, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_49;
  }
  v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE516B8]), "initOnDispatchQueue:", v7->_queue);
  notificationPort = v7->_notificationPort;
  v7->_notificationPort = (IOKNotificationPort *)v15;

  if (!v7->_notificationPort)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316418;
    v66 = "_notificationPort != nil";
    v67 = 2048;
    v68 = 0;
    v69 = 2048;
    v70 = 0;
    v71 = 2080;
    v72 = &unk_219847856;
    v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
    v75 = 1024;
    v76 = 78;
    v48 = MEMORY[0x24BDACB70];
    goto LABEL_48;
  }
  objc_msgSend(v5, "connectToServiceOfType:", 0);
  v17 = objc_claimAutoreleasedReturnValue();
  connection = v7->_connection;
  v7->_connection = (IOKConnection *)v17;

  v19 = v7->_connection;
  if (!v19)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316418;
    v66 = "_connection != nil";
    v67 = 2048;
    v68 = 0;
    v69 = 2048;
    v70 = 0;
    v71 = 2080;
    v72 = &unk_219847856;
    v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
    v75 = 1024;
    v76 = 81;
    v48 = MEMORY[0x24BDACB70];
    goto LABEL_48;
  }
  v60 = 0;
  v61 = 0;
  if ((-[IOKConnection mapMemory64OfType:withOptions:atAddress:ofSize:error:](v19, "mapMemory64OfType:withOptions:atAddress:ofSize:error:", 0, 1, &v61, &v60, 0) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316418;
    v66 = "success";
    v67 = 2048;
    v68 = 0;
    v69 = 2048;
    v70 = 0;
    v71 = 2080;
    v72 = &unk_219847856;
    v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
    v75 = 1024;
    v76 = 87;
    v48 = MEMORY[0x24BDACB70];
    goto LABEL_48;
  }
  if (v60 != 40)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316418;
    v66 = "size == sizeof(IOAudio2EngineStatus)";
    v67 = 2048;
    v68 = 0;
    v69 = 2048;
    v70 = 0;
    v71 = 2080;
    v72 = &unk_219847856;
    v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
    v75 = 1024;
    v76 = 88;
    v48 = MEMORY[0x24BDACB70];
    goto LABEL_48;
  }
  v20 = v61;
  v7->_engineStatus = v61;
  if (!v20)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316418;
    v66 = "_engineStatus != nil";
    v67 = 2048;
    v68 = 0;
    v69 = 2048;
    v70 = 0;
    v71 = 2080;
    v72 = &unk_219847856;
    v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
    v75 = 1024;
    v76 = 91;
    v48 = MEMORY[0x24BDACB70];
    goto LABEL_48;
  }
  v21 = -[IOKNotificationPort machPort](v7->_notificationPort, "machPort");
  v22 = dispatch_source_create(MEMORY[0x24BDAC9E0], v21, 0, (dispatch_queue_t)v7->_queue);
  notificationSource = v7->_notificationSource;
  v7->_notificationSource = (OS_dispatch_source *)v22;

  v24 = v7->_notificationSource;
  if (!v24)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v66 = "_notificationSource != nil";
      v67 = 2048;
      v68 = 0;
      v69 = 2048;
      v70 = 0;
      v71 = 2080;
      v72 = &unk_219847856;
      v73 = 2080;
      v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
      v75 = 1024;
      v76 = 94;
      v48 = MEMORY[0x24BDACB70];
      goto LABEL_48;
    }
LABEL_49:

LABEL_50:
    v25 = 0;
    goto LABEL_51;
  }
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __33__ATCIOA2Device_initWithService___block_invoke;
  handler[3] = &unk_24DB6EDF8;
  v25 = v7;
  v59 = v25;
  dispatch_source_set_event_handler(v24, handler);
  dispatch_resume((dispatch_object_t)v7->_notificationSource);
  if ((-[IOKConnection setNotificationPort:ofType:withReference:error:](v7->_connection, "setNotificationPort:ofType:withReference:error:", v7->_notificationPort, 0, v25, 0) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v66 = "success";
      v67 = 2048;
      v68 = 0;
      v69 = 2048;
      v70 = 0;
      v71 = 2080;
      v72 = &unk_219847856;
      v73 = 2080;
      v74 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
      v75 = 1024;
      v76 = 130;
      _os_log_impl(&dword_219843000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    availableSampleRates = v25;
    v25 = 0;
    goto LABEL_32;
  }
  objc_storeStrong((id *)&v25->_service, a3);
  -[ATCIOA2Device _buildInputStreams](v25, "_buildInputStreams");
  v26 = objc_claimAutoreleasedReturnValue();
  inputStreams = v25->_inputStreams;
  v25->_inputStreams = (NSArray *)v26;

  -[ATCIOA2Device _buildOutputStreams](v25, "_buildOutputStreams");
  v28 = objc_claimAutoreleasedReturnValue();
  outputStreams = v25->_outputStreams;
  v25->_outputStreams = (NSArray *)v28;

  if (-[NSArray count](v25->_inputStreams, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[NSArray firstObject](v25->_inputStreams, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "availableFormats");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v55 != v35)
            objc_enumerationMutation(v32);
          v37 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "sampleRate");
          objc_msgSend(v37, "numberWithDouble:");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSArray containsObject:](v30, "containsObject:", v38))
            -[NSArray addObject:](v30, "addObject:", v38);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      }
      while (v34);
    }
  }
  else
  {
    if (!-[NSArray count](v25->_outputStreams, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v47 = objc_claimAutoreleasedReturnValue();
      availableSampleRates = v25->_availableSampleRates;
      v25->_availableSampleRates = (NSArray *)v47;
      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[NSArray firstObject](v25->_outputStreams, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "availableFormats");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v51 != v42)
            objc_enumerationMutation(v32);
          v44 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "sampleRate");
          objc_msgSend(v44, "numberWithDouble:");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSArray containsObject:](v30, "containsObject:", v45))
            -[NSArray addObject:](v30, "addObject:", v45);

        }
        v41 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
      }
      while (v41);
    }
  }

  availableSampleRates = v25->_availableSampleRates;
  v25->_availableSampleRates = v30;
LABEL_32:

LABEL_51:
  return v25;
}

void __33__ATCIOA2Device_initWithService___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  __int128 *v4;
  mach_msg_header_t v5;
  unsigned int v6;
  __int128 v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x219A33E74]();
  v5.msgh_local_port = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "machPort", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (mach_msg(&v5, 2, 0, 0x88u, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "machPort"), 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v9 = "theError == noErr";
      v10 = 2048;
      v11 = 0;
      v12 = 2048;
      v13 = 0;
      v14 = 2080;
      v15 = &unk_219847856;
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/AudioTransportCommon/ATCIOA2Device.m";
      v18 = 1024;
      v19 = 113;
      _os_log_impl(&dword_219843000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
  }
  else if (v6)
  {
    v3 = 0;
    v4 = &v7;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "handleNotification:", v4);
      ++v3;
      v4 += 2;
    }
    while (v3 < v6);
  }
  objc_autoreleasePoolPop(v2);
}

- (double)sampleRate
{
  void *v2;
  id v3;
  double v4;

  -[IOKService propertyForKey:](self->_service, "propertyForKey:", CFSTR("sample rate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = IOAudio2Fixed64ToFloat64(objc_msgSend(v3, "longLongValue"));

  return v4;
}

- (BOOL)changeToSampleRate:(double)a3 error:(id *)a4
{
  unint64_t v7;

  v7 = Float64ToIOAudio2Fixed64(a3);
  return -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:", 4, 0, 0, &v7, 8, 0, 0, 0, 0, a4);
}

- (unsigned)clockDomain
{
  void *v2;
  id v3;
  unsigned int v4;

  -[IOKService propertyForKey:](self->_service, "propertyForKey:", CFSTR("clock domain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (unsigned)inputSafetyOffset
{
  void *v2;
  id v3;
  unsigned int v4;

  -[IOKService propertyForKey:](self->_service, "propertyForKey:", CFSTR("input safety offset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (unsigned)inputLatency
{
  void *v2;
  id v3;
  unsigned int v4;

  -[IOKService propertyForKey:](self->_service, "propertyForKey:", CFSTR("input latency"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (unsigned)outputSafetyOffset
{
  void *v2;
  id v3;
  unsigned int v4;

  -[IOKService propertyForKey:](self->_service, "propertyForKey:", CFSTR("output safety offset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (unsigned)outputLatency
{
  void *v2;
  id v3;
  unsigned int v4;

  -[IOKService propertyForKey:](self->_service, "propertyForKey:", CFSTR("output latency"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (unsigned)ioBufferSize
{
  void *v2;
  id v3;
  unsigned int v4;

  -[IOKService propertyForKey:](self->_service, "propertyForKey:", CFSTR("io buffer frame size"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (id)_buildInputStreams
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ATCIOA2Stream *v11;
  id v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[IOKService propertyForKey:](self->_service, "propertyForKey:", CFSTR("input streams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v5);
          v11 = -[ATCIOA2Stream initWithService:connection:index:input:description:]([ATCIOA2Stream alloc], "initWithService:connection:index:input:description:", self->_service, self->_connection, v8 + v10, 1, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
          if (v11)
            objc_msgSend(v4, "addObject:", v11);

          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v8 += v10;
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count"))
      v12 = v4;
    else
      v12 = 0;

    v3 = v14;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_buildOutputStreams
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ATCIOA2Stream *v11;
  id v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[IOKService propertyForKey:](self->_service, "propertyForKey:", CFSTR("output streams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v5);
          v11 = -[ATCIOA2Stream initWithService:connection:index:input:description:]([ATCIOA2Stream alloc], "initWithService:connection:index:input:description:", self->_service, self->_connection, v8 + v10, 0, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
          if (v11)
            objc_msgSend(v4, "addObject:", v11);

          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v8 += v10;
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count"))
      v12 = v4;
    else
      v12 = 0;

    v3 = v14;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)startIOError:(id *)a3
{
  return -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:", 0, 0, 0, 0, 0, 0, 0, 0, 0, a3);
}

- (BOOL)stopIOError:(id *)a3
{
  return -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:", 1, 0, 0, 0, 0, 0, 0, 0, 0, a3);
}

- (BOOL)performConfiigChangeForNotification:(IOAudio2Notification *)a3 error:(id *)a4
{
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  -[IOKService properties](self->_service, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:", 3, 0, 0, a3, 32, 0, 0, 0, 0, a4);
  -[IOKService properties](self->_service, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v7, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectsInArray:", v13);

  v14 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v9, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectsInArray:", v17);

  -[ATCIOA2Device _buildInputStreams](self, "_buildInputStreams");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATCIOA2Device setInputStreams:](self, "setInputStreams:", v18);

  -[ATCIOA2Device _buildOutputStreams](self, "_buildOutputStreams");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATCIOA2Device setOutputStreams:](self, "setOutputStreams:", v19);

  -[ATCIOA2Device inputStreams](self, "inputStreams");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    v44 = v16;
    v45 = v12;
    v46 = v8;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[ATCIOA2Device inputStreams](self, "inputStreams");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "availableFormats");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v52 != v28)
            objc_enumerationMutation(v25);
          v30 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "sampleRate");
          objc_msgSend(v30, "numberWithDouble:");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v22, "containsObject:", v31) & 1) == 0)
            objc_msgSend(v22, "addObject:", v31);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v27);
    }
  }
  else
  {
    -[ATCIOA2Device outputStreams](self, "outputStreams");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (!v33)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATCIOA2Device setAvailableSampleRates:](self, "setAvailableSampleRates:", v43);

      goto LABEL_23;
    }
    v44 = v16;
    v45 = v12;
    v46 = v8;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[ATCIOA2Device outputStreams](self, "outputStreams");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "availableFormats");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v48 != v38)
            objc_enumerationMutation(v25);
          v40 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "sampleRate");
          objc_msgSend(v40, "numberWithDouble:");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v22, "containsObject:", v41) & 1) == 0)
            objc_msgSend(v22, "addObject:", v41);

        }
        v37 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v37);
    }
  }

  -[ATCIOA2Device setAvailableSampleRates:](self, "setAvailableSampleRates:", v22);
  v8 = v46;
  v16 = v44;
  v12 = v45;
LABEL_23:

  return v8;
}

- (void)handleNotification:(IOAudio2Notification *)a3
{
  unsigned int var1;
  __int128 v6;
  void (**v7)(void);
  NSObject *v8;
  const char *v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  uint8_t buf[16];

  var1 = a3->var1;
  if (var1 == 1751215220)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v8 = MEMORY[0x24BDACB70];
    v9 = "IO Stopped";
LABEL_13:
    _os_log_impl(&dword_219843000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
    return;
  }
  if (var1 == 1735354734)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v8 = MEMORY[0x24BDACB70];
    v9 = "IO Started";
    goto LABEL_13;
  }
  if (var1 != 1668247142)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v8 = MEMORY[0x24BDACB70];
    v9 = "Received an unexpected IOAudio2Notification";
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219843000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Request Config Change", buf, 2u);
  }
  v6 = *(_OWORD *)&a3->var4;
  v11 = *(_OWORD *)&a3->var0;
  v12 = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__ATCIOA2Device_handleNotification___block_invoke;
  v10[3] = &unk_24DB6EE20;
  v10[4] = self;
  v7 = (void (**)(void))MEMORY[0x219A33F58](v10);
  v7[2]();

}

void __36__ATCIOA2Device_handleNotification___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v4[2];

  v2 = (void *)MEMORY[0x219A33E74]();
  v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  objc_msgSend(*(id *)(a1 + 32), "performConfiigChangeForNotification:error:", v4, 0);
  objc_autoreleasePoolPop(v2);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ATCIOA2Device;
  -[ATCIOA2Device dealloc](&v2, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSArray)availableSampleRates
{
  return self->_availableSampleRates;
}

- (void)setAvailableSampleRates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)inputStreams
{
  return self->_inputStreams;
}

- (void)setInputStreams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)outputStreams
{
  return self->_outputStreams;
}

- (void)setOutputStreams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStreams, 0);
  objc_storeStrong((id *)&self->_inputStreams, 0);
  objc_storeStrong((id *)&self->_availableSampleRates, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_notificationSource, 0);
  objc_storeStrong((id *)&self->_notificationPort, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
