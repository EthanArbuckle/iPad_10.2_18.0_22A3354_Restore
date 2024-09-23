@implementation ASDTIOPAudioLPMicStream

+ (id)ioServiceDependenciesForConfig:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __objc2_class **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "asdtExclavesBufferName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asdtServiceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = off_2508504F0;
  if (v4)
    v6 = off_250850500;
  -[__objc2_class dependencyForID:andConfiguration:](*v6, "dependencyForID:andConfiguration:", v5, v3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v11[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (ASDTIOPAudioLPMicStream)initWithConfig:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  objc_class *v22;
  id v23;
  objc_class *v24;
  void *v25;
  ASDTIOPAudioLPMicStream *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  ASDTIOPAudioLPMicStream *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  BOOL v40;
  void *v41;
  char v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  void *v48;
  objc_super v49;
  _BYTE v50[24];
  _QWORD v51[2];
  _QWORD v52[2];
  void *v53;
  _QWORD v54[5];
  _QWORD v55[7];

  v55[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v54[0] = *MEMORY[0x24BE0A5D8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE0A5C0];
  v12 = *MEMORY[0x24BE0A540];
  v55[0] = v10;
  v55[1] = v12;
  v13 = *MEMORY[0x24BE0A588];
  v54[1] = v11;
  v54[2] = v13;
  v55[2] = CFSTR("RX");
  v54[3] = *MEMORY[0x24BE0A5C8];
  v14 = *MEMORY[0x24BE0A578];
  v51[0] = *MEMORY[0x24BE0A570];
  v51[1] = v14;
  v15 = *MEMORY[0x24BE0A538];
  v52[0] = &unk_250853000;
  v52[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54[4] = *MEMORY[0x24BE0A5D0];
  v55[3] = v17;
  v55[4] = &unk_250853018;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asdtAddMissingEntriesFromDictionary:", v18);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "asdtServiceID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asdtExclavesBufferName");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if (v48)
      {
        v20 = 0;
        +[ASDTIOServiceManager matchedIOServiceForID:](ASDTIOPAudioIsolatedIOBufferServiceManager, "matchedIOServiceForID:", v19);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[ASDTIOServiceManager matchedIOServiceForID:](ASDTIOPAudioIOBufferServiceManager, "matchedIOServiceForID:", v19);
        v29 = objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v20 = v29;
      }
      v28 = v20;
      v27 = (void *)v21;
      if (!(v28 | v21))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDTIOPAudioLPMicStream initWithConfig:withDevice:].cold.4(v33, v48 == 0, (uint64_t)v50);
        }
        goto LABEL_36;
      }
    }
    else
    {
      v27 = 0;
      v28 = 0;
    }
    v49.receiver = self;
    v49.super_class = (Class)ASDTIOPAudioLPMicStream;
    v30 = -[ASDTExclavesStream initWithConfig:withDevice:](&v49, sel_initWithConfig_withDevice_, v8, v7);
    self = v30;
    if (!v30)
      goto LABEL_39;
    -[ASDTIOPAudioLPMicStream setIoBufferDevice:](v30, "setIoBufferDevice:", v28);
    -[ASDTIOPAudioLPMicStream setIsolatedIOBufferDevice:](self, "setIsolatedIOBufferDevice:", v27);
    -[ASDTIOPAudioLPMicStream ioBufferDevice](self, "ioBufferDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {

    }
    else
    {
      -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 == 0;

      if (v35)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[ASDTStream device](self, "device");
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "deviceUID");
          objc_claimAutoreleasedReturnValue();
          -[ASDStream streamName](self, "streamName");
          objc_claimAutoreleasedReturnValue();
          -[ASDTIOPAudioLPMicStream initWithConfig:withDevice:].cold.1();
        }
        goto LABEL_35;
      }
    }
    -[ASDTIOPAudioLPMicStream ioBufferDevice](self, "ioBufferDevice");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36
      || (-[ASDTIOPAudioLPMicStream ioBufferDevice](self, "ioBufferDevice"),
          v37 = (void *)objc_claimAutoreleasedReturnValue(),
          v38 = objc_msgSend(v37, "open"),
          v37,
          v36,
          (v38 & 1) != 0))
    {
      -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39 == 0;

      if (!v40)
      {
        -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "open");

        if ((v42 & 1) != 0)
        {
          if (!-[ASDTStream isolatedUseCaseID](self, "isolatedUseCaseID"))
          {
            objc_msgSend(v19, "identifier");
            v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v44 = objc_msgSend(v43, "UTF8String");
            if (v44)
            {
              v45 = 0;
              v46 = 0;
              do
              {
                if (!*(_BYTE *)(v44 + v45))
                  break;
                v46 = *(unsigned __int8 *)(v44 + v45++) | (v46 << 8);
              }
              while ((_DWORD)v45 != 4);
            }
            else
            {
              v46 = 0;
            }
            -[ASDTStream setIsolatedUseCaseID:](self, "setIsolatedUseCaseID:", v46);

          }
          goto LABEL_39;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[ASDTStream device](self, "device");
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "deviceUID");
          objc_claimAutoreleasedReturnValue();
          -[ASDStream streamName](self, "streamName");
          objc_claimAutoreleasedReturnValue();
          -[ASDTIOPAudioLPMicStream initWithConfig:withDevice:].cold.2();
        }
        goto LABEL_35;
      }
LABEL_39:
      self = self;

      v26 = self;
      goto LABEL_40;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTStream device](self, "device");
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "deviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDStream streamName](self, "streamName");
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioLPMicStream initWithConfig:withDevice:].cold.3();
    }
LABEL_35:

LABEL_36:
    v26 = 0;
LABEL_40:

    goto LABEL_41;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOPAudioLPMicStream initWithConfig:withDevice:].cold.5(v25, (uint64_t)v50, (uint64_t)v23, v23);
  }
  v26 = 0;
LABEL_41:

  return v26;
}

- (BOOL)updateFromStreamDescription:(StreamDescription *)a3
{
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  if (-[ASDStream isActive](self, "isActive"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTStream device](self, "device");
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "deviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDStream streamName](self, "streamName");
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioLPMicStream updateFromStreamDescription:].cold.1();
    }
    return 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0A270]), "initWithAudioStreamBasicDescription:", a3);
    -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "asdtEquivalentNativeFloatPacked");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    if (v6)
    {
      -[ASDStream setLatency:](self, "setLatency:", a3->var9);
      -[ASDTStream setSafetyOffset:](self, "setSafetyOffset:", a3->var10);
      v14[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDStream setPhysicalFormats:](self, "setPhysicalFormats:", v9);

      -[ASDTStream setPhysicalFormat:](self, "setPhysicalFormat:", v6);
      -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTIOPAudioLPMicStream parent](self, "parent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v11, "setStreamDescription:withBufferFrameSize:", a3, objc_msgSend(v12, "ioBufferSizeFrames"));

      }
      else
      {
        v5 = 1;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDTStream device](self, "device");
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "deviceUID");
        objc_claimAutoreleasedReturnValue();
        -[ASDStream streamName](self, "streamName");
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOPAudioLPMicStream updateFromStreamDescription:].cold.2();
      }
      v5 = 0;
    }

  }
  return v5;
}

- (char)ioBuffer
{
  return self->_ioBuffer;
}

- (unsigned)ioBufferSize
{
  return self->_ioBufferSize;
}

- (BOOL)mapIOBuffer
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unsigned int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[ASDTIOPAudioLPMicStream parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ioBufferSizeFrames");

  -[ASDTExclavesStream exclavesBufferName](self, "exclavesBufferName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[ASDTIOPAudioLPMicStream ioBufferDevice](self, "ioBufferDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[ASDTIOPAudioLPMicStream ioBufferDevice](self, "ioBufferDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      self->_ioBuffer = (char *)objc_msgSend(v10, "mapIOBuffer");

      if (self->_ioBuffer)
      {
        -[ASDStream physicalFormat](self, "physicalFormat");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "bytesPerFrame");

        -[ASDTIOPAudioLPMicStream ioBufferDevice](self, "ioBufferDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "ioBufferSize");
        v15 = v12 * v4;

        if (v14 >= v12 * v4)
        {
          self->_ioBufferSize = v15;
          goto LABEL_4;
        }
        v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (!v8)
          return v8;
        -[ASDTStream device](self, "device");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "deviceUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDStream streamName](self, "streamName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTIOPAudioLPMicStream ioBufferDevice](self, "ioBufferDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138413058;
        v22 = v17;
        v23 = 2112;
        v24 = v18;
        v25 = 1024;
        v26 = objc_msgSend(v19, "ioBufferSize");
        v27 = 1024;
        v28 = v15;
        _os_log_error_impl(&dword_236D88000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@:%@: Mapped IO buffer is too small: %u < %u", (uint8_t *)&v21, 0x22u);

      }
      else
      {
        v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (!v8)
          return v8;
        -[ASDTStream device](self, "device");
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "deviceUID");
        objc_claimAutoreleasedReturnValue();
        -[ASDStream streamName](self, "streamName");
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOPAudioLPMicStream mapIOBuffer].cold.1();
      }
    }
LABEL_14:
    LOBYTE(v8) = 0;
    return v8;
  }
  -[ASDStream physicalFormat](self, "physicalFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "bytesPerFrame") << 12;

  if (!-[ASDTExclavesStream allocExclavesNamedBuffer:](self, "allocExclavesNamedBuffer:", v7))
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!v8)
      return v8;
    -[ASDTStream device](self, "device");
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "deviceUID");
    objc_claimAutoreleasedReturnValue();
    -[ASDStream streamName](self, "streamName");
    objc_claimAutoreleasedReturnValue();
    -[ASDTIOPAudioLPMicStream mapIOBuffer].cold.2();
    goto LABEL_14;
  }
  self->_ioBuffer = 0;
  self->_ioBufferSize = v7;
LABEL_4:
  LOBYTE(v8) = 1;
  return v8;
}

- (void)releaseIOBuffer
{
  void *v3;
  void *v4;
  void *v5;

  -[ASDTExclavesStream exclavesBufferName](self, "exclavesBufferName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ASDTExclavesStream freeExclavesNamedBuffer](self, "freeExclavesNamedBuffer");
  -[ASDTIOPAudioLPMicStream ioBufferDevice](self, "ioBufferDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASDTIOPAudioLPMicStream ioBufferDevice](self, "ioBufferDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "releaseIOBuffer");

    self->_ioBuffer = 0;
  }
  self->_ioBufferSize = 0;
}

- (int)pmPrewarmStream:(int)a3
{
  int result;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ASDTIOPAudioLPMicStream;
  result = -[ASDTStream pmPrewarmStream:](&v11, sel_pmPrewarmStream_);
  if (a3 == 1970304877 && !result)
  {
    -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return 0;
    -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "setupIO");

    if ((v8 & 1) != 0)
    {
      -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "setupClientIO:withBufferFrameSize:", -[ASDTStream isolatedUseCaseID](self, "isolatedUseCaseID"), 0);

      if ((v10 & 1) != 0)
        return 0;
      return 561214578;
    }
    else
    {
      return 1852990585;
    }
  }
  return result;
}

- (int)pmPrepareStream:(int)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  if (a3 == 1685090418)
  {
    -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "teardownClientIO:", -[ASDTStream isolatedUseCaseID](self, "isolatedUseCaseID"));

      -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "teardownIO");

    }
  }
  else if (a3 == 1970303090 && !-[ASDTIOPAudioLPMicStream mapIOBuffer](self, "mapIOBuffer"))
  {
    return 561214578;
  }
  v9.receiver = self;
  v9.super_class = (Class)ASDTIOPAudioLPMicStream;
  return -[ASDTStream pmPrepareStream:](&v9, sel_pmPrepareStream_, v3);
}

- (int)pmIdleStream:(int)a3
{
  uint64_t v3;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  if (a3 == 1684628588)
    -[ASDTIOPAudioLPMicStream releaseIOBuffer](self, "releaseIOBuffer");
  v6.receiver = self;
  v6.super_class = (Class)ASDTIOPAudioLPMicStream;
  return -[ASDTStream pmIdleStream:](&v6, sel_pmIdleStream_, v3);
}

- (void)startStream
{
  objc_super v3;

  -[ASDTStream clearBuffer](self, "clearBuffer");
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOPAudioLPMicStream;
  -[ASDStream startStream](&v3, sel_startStream);
  -[ASDStream setIsActive:](self, "setIsActive:", 1);
}

- (void)stopStream
{
  objc_super v3;

  -[ASDStream setIsActive:](self, "setIsActive:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOPAudioLPMicStream;
  -[ASDStream stopStream](&v3, sel_stopStream);
}

- (id)exclavesReadInput
{
  void *v3;
  int v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[7];
  int v12;

  -[ASDStream physicalFormat](self, "physicalFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bytesPerFrame");

  v5 = -[ASDTStream isolatedUseCaseID](self, "isolatedUseCaseID");
  v6 = -[ASDTExclavesStream exclavesBuffer](self, "exclavesBuffer");
  if (v6)
  {
    v7 = v6;
    -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userClient");

    if (v9)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __44__ASDTIOPAudioLPMicStream_exclavesReadInput__block_invoke;
      v11[3] = &__block_descriptor_60_e195_i40__0I8r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_12_v20_v28I36l;
      v11[4] = v9;
      v11[5] = v5;
      v11[6] = v7;
      v12 = v4;
      v6 = _Block_copy(v11);
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

uint64_t __44__ASDTIOPAudioLPMicStream_exclavesReadInput__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned __int8 *a4)
{
  if (!a3)
    __44__ASDTIOPAudioLPMicStream_exclavesReadInput__block_invoke_cold_1();
  if (!a4)
    __44__ASDTIOPAudioLPMicStream_exclavesReadInput__block_invoke_cold_2();
  if (ASDT::IOPAudio::IsolatedIOBuffer::UserClient::ReadInput(*(ASDT::IOPAudio::IsolatedIOBuffer::UserClient **)(a1 + 32)))
    return ASDT::Exclaves::NamedBuffer::Read(*(ASDT::Exclaves::NamedBuffer **)(a1 + 48), a4);
  else
    return 560227702;
}

- (id)readIsolatedInputBlock
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[5];

  -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userClient");

  if (v3)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__ASDTIOPAudioLPMicStream_readIsolatedInputBlock__block_invoke;
    aBlock[3] = &__block_descriptor_40_e187_i28__0Q8I16r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_20l;
    aBlock[4] = v3;
    v4 = _Block_copy(aBlock);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t __49__ASDTIOPAudioLPMicStream_readIsolatedInputBlock__block_invoke(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  if (!a4)
    __49__ASDTIOPAudioLPMicStream_readIsolatedInputBlock__block_invoke_cold_1();
  if (ASDT::IOPAudio::IsolatedIOBuffer::UserClient::ReadInput(*(ASDT::IOPAudio::IsolatedIOBuffer::UserClient **)(a1 + 32)))
    return 0;
  else
    return 560227702;
}

- (int)setupIsolatedIOForUseCase:(unint64_t)a3 withFrameSize:(unsigned int)a4
{
  uint64_t v4;
  void *v6;

  v4 = *(_QWORD *)&a4;
  -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "setupClientIO:withBufferFrameSize:", a3, v4);

  if ((_DWORD)v4)
    return 0;
  else
    return 561214578;
}

- (int)teardownIsolatedIOForUseCase:(unint64_t)a3
{
  void *v4;

  -[ASDTIOPAudioLPMicStream isolatedIOBufferDevice](self, "isolatedIOBufferDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v4, "teardownClientIO:", a3);

  if ((_DWORD)a3)
    return 0;
  else
    return 561214578;
}

- (ASDTIOPAudioIsolatedIOBufferDevice)isolatedIOBufferDevice
{
  return self->_isolatedIOBufferDevice;
}

- (void)setIsolatedIOBufferDevice:(id)a3
{
  objc_storeStrong((id *)&self->_isolatedIOBufferDevice, a3);
}

- (ASDTIOPAudioIOBufferDevice)ioBufferDevice
{
  return self->_ioBufferDevice;
}

- (void)setIoBufferDevice:(id)a3
{
  objc_storeStrong((id *)&self->_ioBufferDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioBufferDevice, 0);
  objc_storeStrong((id *)&self->_isolatedIOBufferDevice, 0);
}

- (void)initWithConfig:withDevice:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(v3, v4, v5, 5.778e-34);
  OUTLINED_FUNCTION_2_2(&dword_236D88000, MEMORY[0x24BDACB70], v6, "%@:%@: No (Isolated)IOBuffer defined for this stream.", v7);

  OUTLINED_FUNCTION_3_2();
}

- (void)initWithConfig:withDevice:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(v3, v4, v5, 5.778e-34);
  OUTLINED_FUNCTION_2_2(&dword_236D88000, MEMORY[0x24BDACB70], v6, "%@:%@: Failed to open connection to IsolatedIOBuffer user client", v7);

  OUTLINED_FUNCTION_3_2();
}

- (void)initWithConfig:withDevice:.cold.3()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(v3, v4, v5, 5.778e-34);
  OUTLINED_FUNCTION_2_2(&dword_236D88000, MEMORY[0x24BDACB70], v6, "%@:%@: Failed to open connection to IOBuffer user client", v7);

  OUTLINED_FUNCTION_3_2();
}

- (void)initWithConfig:(uint64_t)a3 withDevice:.cold.4(void *a1, char a2, uint64_t a3)
{
  const char *v4;

  v4 = "Isolated";
  if ((a2 & 1) != 0)
    v4 = "";
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2080;
  *(_QWORD *)(a3 + 14) = v4;
  OUTLINED_FUNCTION_2_2(&dword_236D88000, MEMORY[0x24BDACB70], a3, "%@: Failed to create %sIOBufferDevice user client", (uint8_t *)a3);

}

- (void)initWithConfig:(uint64_t)a3 withDevice:(void *)a4 .cold.5(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_2_2(&dword_236D88000, MEMORY[0x24BDACB70], a3, "%@: Bad parent device class: %@", (uint8_t *)a2);

}

- (void)updateFromStreamDescription:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(v3, v4, v5, 5.778e-34);
  OUTLINED_FUNCTION_2_2(&dword_236D88000, MEMORY[0x24BDACB70], v6, "%@:%@: Cannot update stream format while active.", v7);

  OUTLINED_FUNCTION_3_2();
}

- (void)updateFromStreamDescription:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(v3, v4, v5, 5.778e-34);
  OUTLINED_FUNCTION_2_2(&dword_236D88000, MEMORY[0x24BDACB70], v6, "%@:%@: Failed to allocate stream format.", v7);

  OUTLINED_FUNCTION_3_2();
}

- (void)mapIOBuffer
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(v3, v4, v5, 5.778e-34);
  OUTLINED_FUNCTION_2_2(&dword_236D88000, MEMORY[0x24BDACB70], v6, "%@:%@: Failed to map exclaves named buffer", v7);

  OUTLINED_FUNCTION_3_2();
}

void __44__ASDTIOPAudioLPMicStream_exclavesReadInput__block_invoke_cold_1()
{
  __assert_rtn("-[ASDTIOPAudioLPMicStream exclavesReadInput]_block_invoke", "ASDTIOPAudioLPMicStream.mm", 327, "ioCycleInfo");
}

void __44__ASDTIOPAudioLPMicStream_exclavesReadInput__block_invoke_cold_2()
{
  __assert_rtn("-[ASDTIOPAudioLPMicStream exclavesReadInput]_block_invoke", "ASDTIOPAudioLPMicStream.mm", 328, "ioMainBuffer");
}

void __49__ASDTIOPAudioLPMicStream_readIsolatedInputBlock__block_invoke_cold_1()
{
  __assert_rtn("-[ASDTIOPAudioLPMicStream readIsolatedInputBlock]_block_invoke", "ASDTIOPAudioLPMicStream.mm", 361, "inIOCycleInfo");
}

@end
