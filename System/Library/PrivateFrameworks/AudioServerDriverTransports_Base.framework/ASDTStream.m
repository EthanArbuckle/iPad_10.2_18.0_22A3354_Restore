@implementation ASDTStream

+ (id)streamForConfig:(id)a3 withDevice:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (objc_class *)objc_msgSend(v5, "asdtSubclass");
  if ((-[objc_class isSubclassOfClass:](v7, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v8 = (void *)objc_msgSend([v7 alloc], "initWithConfig:withDevice:", v5, v6);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Subclass"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASDTAudioDevice deviceForConfig:withDeviceManager:andPlugin:].cold.1(v9, v11);
    }
    v8 = 0;
  }

  return v8;
}

- (ASDTStream)initWithDirection:(unsigned int)a3 withDevice:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  ASDTStream *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend(v6, "plugin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)ASDTStream;
  v8 = -[ASDStream initWithDirection:withPlugin:](&v10, sel_initWithDirection_withPlugin_, v4, v7);

  if (v8)
    -[ASDTStream setDevice:](v8, "setDevice:", v6);

  return v8;
}

- (ASDTStream)initWithConfig:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  double v28;
  double v29;
  double v30;
  ASDTStream *v31;
  void *v32;
  void *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  unsigned int v45;
  uint8_t v46[128];
  uint8_t buf[32];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v45 = 0;
  if ((objc_msgSend(v6, "asdtDirection:", &v45) & 1) == 0)
    goto LABEL_33;
  v8 = v45;
  objc_msgSend(v7, "plugin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44.receiver = self;
  v44.super_class = (Class)ASDTStream;
  self = -[ASDStream initWithDirection:withPlugin:](&v44, sel_initWithDirection_withPlugin_, v8, v9);

  if (self)
  {
    -[ASDTStream setDevice:](self, "setDevice:", v7);
    objc_msgSend(v7, "samplingRates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asdtLatenciesForSamplingRates:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTStream setLatencies:](self, "setLatencies:", v11);

    -[ASDStream setStartingChannel:](self, "setStartingChannel:", objc_msgSend(v6, "asdtStartingChannel"));
    objc_msgSend(v6, "asdtName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDStream setStreamName:](self, "setStreamName:", v12);

    -[ASDStream streamName](self, "streamName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = v13 == 0;

    if ((_DWORD)v12)
    {
      if (v45 == 1768845428)
        v14 = CFSTR("Input");
      else
        v14 = CFSTR("Output");
      -[ASDStream setStreamName:](self, "setStreamName:", v14);
    }
    -[ASDStream setTerminalType:](self, "setTerminalType:", objc_msgSend(v6, "asdtTerminalType"));
    -[ASDTStream setIsolatedUseCaseID:](self, "setIsolatedUseCaseID:", objc_msgSend(v6, "asdtIsolatedUseCaseID"));
    objc_msgSend(v6, "asdtFormats");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v35, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v16 = v35;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v7, "samplingRates");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "asdtFormatsWithSamplingRates:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v15, "addObjectsFromArray:", v22);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v17);
    }

    if (objc_msgSend(v15, "count"))
    {
      -[ASDStream setPhysicalFormats:](self, "setPhysicalFormats:", v15);
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v23 = v15;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v37;
        while (2)
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v37 != v25)
              objc_enumerationMutation(v23);
            v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
            objc_msgSend(v27, "sampleRate");
            v29 = v28;
            objc_msgSend(v7, "samplingRate");
            if (v29 == v30)
            {
              -[ASDTStream setPhysicalFormat:](self, "setPhysicalFormat:", v27);
              goto LABEL_28;
            }
          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
          if (v24)
            continue;
          break;
        }
      }
LABEL_28:

      goto LABEL_29;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "deviceUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDStream streamName](self, "streamName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTStream initWithConfig:withDevice:].cold.1(v32, v33, buf);
    }

LABEL_33:
    v31 = 0;
    goto LABEL_34;
  }
LABEL_29:
  self = self;
  v31 = self;
LABEL_34:

  return v31;
}

- (char)ioBuffer
{
  return 0;
}

- (unsigned)ioBufferSize
{
  return 0;
}

- (id)updateClientPositionBlock
{
  return 0;
}

- (void)setUpdateClientPositionCopy:(id)a3
{
  void *v4;
  id updateClientPositionCopy;
  id v6;

  v6 = a3;
  v4 = (void *)objc_msgSend(v6, "copy");
  updateClientPositionCopy = self->_updateClientPositionCopy;
  self->_updateClientPositionCopy = v4;

  -[ASDTStream setUpdateClientPositionUnretained:](self, "setUpdateClientPositionUnretained:", self->_updateClientPositionCopy);
}

- (id)getUpdateClientPositionUnretainedAddress
{
  return &self->_updateClientPositionUnretained;
}

- (int)pmSleepStream
{
  return 0;
}

- (int)pmIdleStream:(int)a3
{
  -[ASDTStream setUpdateClientPositionCopy:](self, "setUpdateClientPositionCopy:", 0);
  -[ASDTStream setUpdateClientPositionUnretained:](self, "setUpdateClientPositionUnretained:", 0);
  return 0;
}

- (int)pmPrepareStream:(int)a3
{
  return 0;
}

- (int)pmPrewarmStream:(int)a3
{
  return 0;
}

- (int)pmOnStream
{
  return 0;
}

- (int)pmStateTransition:(int)a3
{
  int v3;

  if (a3 <= 1937008995)
  {
    if (a3 > 1685092204)
    {
      if (a3 != 1685092205)
      {
        if (a3 == 1685286000)
          return -[ASDTStream pmSleepStream](self, "pmSleepStream");
        return 0;
      }
      return -[ASDTStream pmPrewarmStream:](self, "pmPrewarmStream:");
    }
    if (a3 == 1684628588)
      return -[ASDTStream pmIdleStream:](self, "pmIdleStream:");
    v3 = 1685090418;
LABEL_12:
    if (a3 == v3)
      return -[ASDTStream pmPrepareStream:](self, "pmPrepareStream:");
    return 0;
  }
  if (a3 <= 1970304876)
  {
    if (a3 == 1937008996)
      return -[ASDTStream pmIdleStream:](self, "pmIdleStream:");
    v3 = 1970303090;
    goto LABEL_12;
  }
  switch(a3)
  {
    case 1970304877:
      return -[ASDTStream pmPrewarmStream:](self, "pmPrewarmStream:");
    case 1970435438:
      return -[ASDTStream pmOnStream](self, "pmOnStream");
    case 1970563428:
      return -[ASDTStream pmIdleStream:](self, "pmIdleStream:");
  }
  return 0;
}

- (void)clearBuffer
{
  char *v3;
  unsigned int v4;

  if (-[ASDTStream ioBuffer](self, "ioBuffer") && -[ASDTStream ioBufferSize](self, "ioBufferSize"))
  {
    v3 = -[ASDTStream ioBuffer](self, "ioBuffer");
    v4 = -[ASDTStream ioBufferSize](self, "ioBufferSize");
    if (v4)
      bzero(v3, v4);
  }
}

- (void)updateLatency
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ASDTStream latencies](self, "latencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[ASDStream physicalFormat](self, "physicalFormat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sampleRate");
    objc_msgSend(v4, "numberWithDouble:");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[ASDTStream latencies](self, "latencies");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDStream setLatency:](self, "setLatency:", objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setLatencies:(id)a3
{
  objc_storeStrong((id *)&self->_latencies, a3);
  -[ASDTStream updateLatency](self, "updateLatency");
}

- (void)setPhysicalFormat:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ASDTStream;
  -[ASDStream setPhysicalFormat:](&v5, sel_setPhysicalFormat_, v4);
  -[ASDTStream updateLatency](self, "updateLatency");

}

- (id)readOrWriteBlock
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  id *v8;
  char *v9;
  _QWORD v11[6];
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;

  -[ASDStream physicalFormat](self, "physicalFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bytesPerFrame");

  v5 = -[ASDTStream ioBufferSize](self, "ioBufferSize");
  v6 = -[ASDStream direction](self, "direction");
  -[ASDTStream updateClientPositionBlock](self, "updateClientPositionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTStream setUpdateClientPositionCopy:](self, "setUpdateClientPositionCopy:", v7);

  v8 = -[ASDTStream getUpdateClientPositionUnretainedAddress](self, "getUpdateClientPositionUnretainedAddress");
  v9 = -[ASDTStream ioBuffer](self, "ioBuffer");
  if (v9)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __30__ASDTStream_readOrWriteBlock__block_invoke;
    v11[3] = &__block_descriptor_64_e195_i40__0I8r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_12_v20_v28I36l;
    v12 = v4;
    v13 = v6;
    v14 = v5 / v4;
    v15 = v5;
    v11[4] = v9;
    v11[5] = v8;
    v9 = (char *)_Block_copy(v11);
  }
  return v9;
}

uint64_t __30__ASDTStream_readOrWriteBlock__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, char *a4)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  size_t v17;
  size_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  if (!a3)
    __30__ASDTStream_readOrWriteBlock__block_invoke_cold_1();
  if (!a4)
    __30__ASDTStream_readOrWriteBlock__block_invoke_cold_2();
  v7 = *(unsigned int *)(a1 + 48);
  v8 = *(_DWORD *)(a1 + 52);
  v9 = 144;
  if (v8 == 1768845428)
    v9 = 80;
  v10 = (unint64_t)*(double *)(a3 + v9);
  v11 = *(unsigned int *)(a1 + 60);
  v12 = v7 * a2;
  v13 = v10 % *(unsigned int *)(a1 + 56) * v7;
  v14 = *(char **)(a1 + 32);
  if (v8 == 1768845428)
    v15 = &v14[v13];
  else
    v15 = a4;
  if (v8 == 1768845428)
    v16 = a4;
  else
    v16 = &v14[v13];
  v17 = v11 - v13;
  if (v11 - v13 >= v12)
    v18 = v12;
  else
    v18 = v11 - v13;
  memcpy(v16, v15, v18);
  if (v17 < v12)
  {
    if (v8 == 1768845428)
      v19 = &a4[v18];
    else
      v19 = v14;
    if (v8 == 1768845428)
      v20 = v14;
    else
      v20 = &a4[v18];
    memcpy(v19, v20, v12 - v18);
  }
  v21 = **(_QWORD **)(a1 + 40);
  if (v21)
    (*(void (**)(uint64_t, unint64_t))(v21 + 16))(v21, v10 + a2);
  return 0;
}

- (id)writeMixBlock
{
  void *v3;

  if (-[ASDStream direction](self, "direction") == 1869968496)
  {
    -[ASDTStream readOrWriteBlock](self, "readOrWriteBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)readInputBlock
{
  void *v3;

  if (-[ASDStream direction](self, "direction") == 1768845428)
  {
    -[ASDTStream readOrWriteBlock](self, "readOrWriteBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)writeZerosToMixMilliseconds:(unsigned int)a3 atSampleTime:(unint64_t)a4
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  char *v13;
  char *v14;
  unsigned int v15;
  uint64_t v16;
  void (**v17)(_QWORD, _QWORD);
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char *v23;
  id WeakRetained;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  unsigned int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[ASDStream physicalFormat](self, "physicalFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sampleRate");
  v9 = v8;

  -[ASDStream physicalFormat](self, "physicalFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "bytesPerFrame");

  v12 = -[ASDTStream ioBufferSize](self, "ioBufferSize");
  v13 = -[ASDTStream ioBuffer](self, "ioBuffer");
  if (v13)
  {
    if (v12)
    {
      v14 = v13;
      if (-[ASDStream direction](self, "direction") != 1768845428)
      {
        v15 = (v9 / 1000.0 * (double)a3);
        v16 = v11 * v15;
        if (v16 >= v12)
        {
          -[ASDTStream clearBuffer](self, "clearBuffer");
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          {
            WeakRetained = objc_loadWeakRetained((id *)&self->_device);
            objc_msgSend(WeakRetained, "deviceUID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 138412802;
            v29 = v25;
            v30 = 2048;
            v31 = a4;
            v32 = 1024;
            v33 = v15;
            _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@ Sample time: %llu, Zero frames: %u", (uint8_t *)&v28, 0x1Cu);

          }
          -[ASDTStream updateClientPositionBlock](self, "updateClientPositionBlock");
          v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v18 = a4 % (v12 / v11) * v11;
          if (v12 - v18 >= v16)
            v19 = v11 * v15;
          else
            v19 = v12 - v18;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          {
            -[ASDTStream device](self, "device");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "deviceUID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 138412802;
            v29 = v27;
            v30 = 2048;
            v31 = v18;
            v32 = 1024;
            v33 = v19;
            _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@ First fill to offset %llu size %u", (uint8_t *)&v28, 0x1Cu);

          }
          v20 = v16 - v19;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          {
            -[ASDTStream device](self, "device");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "deviceUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASDTStream writeZerosToMixMilliseconds:atSampleTime:].cold.1(v22, v16 - v19, (uint8_t *)&v28, v21);
          }
          if (v19)
          {
            v23 = &v14[v18];
            do
            {
              *v23++ = 0;
              --v19;
            }
            while (v19);
          }
          for (; v20; --v20)
            *v14++ = 0;
          if (v17)
            v17[2](v17, a4 + v15);

        }
      }
    }
  }
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASDTStream;
  -[ASDStream diagnosticDescriptionWithIndent:walkTree:](&v24, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    ioBufferSize:        %u\n"), v6, -[ASDTStream ioBufferSize](self, "ioBufferSize"));
  -[ASDTStream latencies](self, "latencies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") == 0;

  if (!v9)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    latencies (sampeRate : frames):\n"), v6);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[ASDTStream latencies](self, "latencies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
          -[ASDTStream latencies](self, "latencies");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "doubleValue");
          objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %6.0lf : %u\n"), v6, v17, objc_msgSend(v16, "unsignedIntValue"));

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v11);
    }

  }
  return v7;
}

- (NSDictionary)latencies
{
  return self->_latencies;
}

- (unsigned)safetyOffset
{
  return self->_safetyOffset;
}

- (void)setSafetyOffset:(unsigned int)a3
{
  self->_safetyOffset = a3;
}

- (ASDTAudioDevice)device
{
  return (ASDTAudioDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (void)setDevice:(id)a3
{
  objc_storeWeak((id *)&self->_device, a3);
}

- (id)updateClientPositionCopy
{
  return self->_updateClientPositionCopy;
}

- (id)updateClientPositionUnretained
{
  return self->_updateClientPositionUnretained;
}

- (void)setUpdateClientPositionUnretained:(id)a3
{
  self->_updateClientPositionUnretained = a3;
}

- (unint64_t)isolatedUseCaseID
{
  return self->_isolatedUseCaseID;
}

- (void)setIsolatedUseCaseID:(unint64_t)a3
{
  self->_isolatedUseCaseID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateClientPositionCopy, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_latencies, 0);
}

- (void)initWithConfig:(uint8_t *)buf withDevice:.cold.1(void *a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: %@: Stream has no formats.", buf, 0x16u);

  OUTLINED_FUNCTION_1_5();
}

void __30__ASDTStream_readOrWriteBlock__block_invoke_cold_1()
{
  __assert_rtn("-[ASDTStream readOrWriteBlock]_block_invoke", "ASDTStream.mm", 244, "ioCycleInfo");
}

void __30__ASDTStream_readOrWriteBlock__block_invoke_cold_2()
{
  __assert_rtn("-[ASDTStream readOrWriteBlock]_block_invoke", "ASDTStream.mm", 245, "ioMainBuffer");
}

- (void)writeZerosToMixMilliseconds:(uint8_t *)buf atSampleTime:(void *)a4 .cold.1(void *a1, int a2, uint8_t *buf, void *a4)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@ Second fill to offset 0 size %u", buf, 0x12u);

  OUTLINED_FUNCTION_1_5();
}

@end
