@implementation ASDTIOA2Stream

- (ASDTIOA2Stream)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 direction:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  ASDTIOA2Stream *v9;
  ASDTIOA2Stream *v10;
  void *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDTIOA2Stream;
  v9 = -[ASDTExclavesStream initWithDirection:withDevice:](&v13, sel_initWithDirection_withDevice_, v5, v8);
  v10 = v9;
  if (v9)
  {
    v9->_userClientID = v6;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDStream setStreamName:](v10, "setStreamName:", v11);

    -[ASDTIOA2Stream _synchronizeWithHardware](v10, "_synchronizeWithHardware");
    -[ASDTIOA2Stream setIsActive:](v10, "setIsActive:", 1);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[ASDTIOA2Stream _releaseIOBuffer](self, "_releaseIOBuffer");
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2Stream;
  -[ASDTIOA2Stream dealloc](&v3, sel_dealloc);
}

- (void)setIsActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[ASDTIOA2Stream ioa2Device](self, "ioa2Device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setStreamActive:streamUCID:", v3, self->_userClientID);

  v6.receiver = self;
  v6.super_class = (Class)ASDTIOA2Stream;
  -[ASDStream setIsActive:](&v6, sel_setIsActive_, v3);
}

- (BOOL)_mapIOBuffer
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int ioBufferByteSize;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[ASDStream direction](self, "direction") == 1768845428
    && -[ASDTExclavesStream usesExclavesNamedBuffer](self, "usesExclavesNamedBuffer"))
  {
    -[ASDTIOA2Stream physicalFormat](self, "physicalFormat");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend((id)v3, "bytesPerFrame") << 12;

    LOBYTE(v3) = -[ASDTExclavesStream allocExclavesNamedBuffer:](self, "allocExclavesNamedBuffer:", v4);
    self->_ioBufferByteSize = -[ASDTExclavesStream exclavesBufferSize](self, "exclavesBufferSize");
    if ((v3 & 1) == 0)
      goto LABEL_4;
  }
  else
  {
    -[ASDTIOA2Stream ioa2Device](self, "ioa2Device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_mapIOBuffer:ofSize:forStream:", &self->_ioBuffer, &self->_ioBufferByteSize, self->_userClientID);

    if ((v7 & 1) == 0)
    {
LABEL_4:
      v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v5)
      {
        -[ASDTStream device](self, "device");
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "deviceUID");
        objc_claimAutoreleasedReturnValue();
        -[ASDStream streamName](self, "streamName");
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Stream _mapIOBuffer].cold.1();
        LOBYTE(v5) = 0;
      }
      return v5;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDTStream device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDStream streamName](self, "streamName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ioBufferByteSize = self->_ioBufferByteSize;
    v13 = 138412802;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 1024;
    v18 = ioBufferByteSize;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@:%@: Buffer mapped with size %d", (uint8_t *)&v13, 0x1Cu);

  }
  LOBYTE(v5) = 1;
  return v5;
}

- (void)_releaseIOBuffer
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = -[ASDTExclavesStream exclavesBuffer](self, "exclavesBuffer");
  v4 = v3 != 0;
  if (v3)
    -[ASDTExclavesStream freeExclavesNamedBuffer](self, "freeExclavesNamedBuffer");
  if (self->_ioBuffer)
  {
    -[ASDTIOA2Stream ioa2Device](self, "ioa2Device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_releaseIOBuffer:", self->_ioBuffer);

    self->_ioBuffer = 0;
    v4 = 1;
  }
  if (self->_ioBufferByteSize)
    self->_ioBufferByteSize = 0;
  if (v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDTStream device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDStream streamName](self, "streamName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@:%@: Buffer released", (uint8_t *)&v9, 0x16u);

  }
}

- (void)_synchronizeWithHardware
{
  void *v3;
  id v4;
  void *v5;
  const applesauce::CF::DictionaryRef *v6;
  const applesauce::CF::DictionaryRef *v7;
  const applesauce::CF::DictionaryRef *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  AudioStreamRangedDescription *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  CFTypeRef cf;
  id v32[7];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CFTypeRef v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[ASDTIOA2Stream ioa2Device](self, "ioa2Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_streamInfoForStream:", self->_userClientID);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      CFRetain(v4);
    applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&v37, v5);
    v25 = v5;

    -[ASDStream setStartingChannel:](self, "setStartingChannel:", ASDT::IOA2UserClient::GetStreamInfo_StartingChannel((const __CFDictionary **)&v37, v6));
    -[ASDStream setTerminalType:](self, "setTerminalType:", ASDT::IOA2UserClient::GetStreamInfo_TerminalType((const __CFDictionary **)&v37, v7));
    -[ASDTIOA2Stream setUsesIsolatedIO:](self, "setUsesIsolatedIO:", ASDT::IOA2UserClient::GetStreamInfo_UsesIsolatedIO((ASDT::IOA2UserClient *)&v37, v8));
    if (-[ASDTIOA2Stream usesIsolatedIO](self, "usesIsolatedIO"))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array", v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ASDT::IOA2UserClient::CopyStreamInfo_AvailableFormats((const __CFDictionary **)&v37, v32);
    v9 = v32[0];
    v10 = v9;
    if (v9)
      CFRelease(v9);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v11);
          v15 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v16 = v15;
          if (v15)
            CFRetain(v15);
          applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v16);

          if (ASDT::IOA2UserClient::ConstructASRDFromDictionary((const __CFDictionary **)&cf, (const applesauce::CF::DictionaryRef *)v32, v17))
          {
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0A270]), "initWithAudioStreamRangedDescription:", v32);
            if (-[ASDTIOA2Stream usesIsolatedIO](self, "usesIsolatedIO"))
            {
              objc_msgSend(v18, "asdtEquivalentNativeFloatPacked");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKey:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20 == 0;

              if (v21)
              {
                objc_msgSend(v29, "setObject:forKey:", v18, v19);
                objc_msgSend(v30, "addObject:", v19);
              }
              else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                -[ASDTStream device](self, "device");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "deviceUID");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[ASDStream streamName](self, "streamName");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v39 = v22;
                v40 = 2112;
                v41 = v23;
                v42 = 2112;
                v43 = v18;
                _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@:%@: Duplicate isolated IO format: %@", buf, 0x20u);

              }
            }
            else
            {
              objc_msgSend(v30, "addObject:", v18);
            }

          }
          if (cf)
            CFRelease(cf);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
      }
      while (v12);
    }

    v24 = (void *)objc_msgSend(v29, "copy");
    -[ASDTIOA2Stream setIsolatedIOFormatMap:](self, "setIsolatedIOFormatMap:", v24);

    -[ASDTIOA2Stream setPhysicalFormats:](self, "setPhysicalFormats:", v30);
    if (v37)
      CFRelease(v37);

    v3 = v27;
  }

}

- (void)setPhysicalFormats:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[ASDStream physicalFormats](self, "physicalFormats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDTIOA2Stream;
    -[ASDStream setPhysicalFormats:](&v7, sel_setPhysicalFormats_, v4);
  }

}

- (id)physicalFormat
{
  void *v3;
  id v4;
  void *v5;
  AudioStreamBasicDescription *v6;
  void *v7;
  uint64_t v8;
  _OWORD v10[2];
  uint64_t v11;
  CFTypeRef cf;

  -[ASDTIOA2Stream ioa2Device](self, "ioa2Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_streamInfoForStream:", self->_userClientID);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    CFRetain(v4);
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v5);

  v11 = 0;
  memset(v10, 0, sizeof(v10));
  if ((ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat((const __CFDictionary **)&cf, (const applesauce::CF::DictionaryRef *)v10, v6) & 1) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0A270]), "initWithAudioStreamBasicDescription:", v10);
    if (-[ASDTIOA2Stream usesIsolatedIO](self, "usesIsolatedIO"))
    {
      objc_msgSend(v7, "asdtEquivalentNativeFloatPacked");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
  }
  else
  {
    v7 = 0;
  }
  if (cf)
    CFRelease(cf);

  return v7;
}

- (void)setPhysicalFormat:(id)a3 alwaysNotify:(BOOL)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ASDTIOA2Stream physicalFormat](self, "physicalFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {
    v8 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    -[ASDTStream device](self, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deviceUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDStream streamName](self, "streamName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v18;
    v23 = 2112;
    v24 = v19;
    v25 = 2112;
    v26 = v7;
    _os_log_debug_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@:%@: setPhysicalFormat: Old: %@", buf, 0x20u);

  }
  v9 = v6;
  if (!-[ASDTIOA2Stream usesIsolatedIO](self, "usesIsolatedIO")
    || (-[ASDTIOA2Stream isolatedIOFormatMap](self, "isolatedIOFormatMap"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "objectForKey:", v9),
        v11 = objc_claimAutoreleasedReturnValue(),
        v9,
        v10,
        (v9 = (id)v11) != 0))
  {
    -[ASDTIOA2Stream ioa2Device](self, "ioa2Device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "_setCurrentFormat:forStream:", v9, self->_userClientID);

LABEL_8:
    if (a4 || v8)
    {
      v20.receiver = self;
      v20.super_class = (Class)ASDTIOA2Stream;
      -[ASDTStream setPhysicalFormat:](&v20, sel_setPhysicalFormat_, v6);
    }
    if (v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDTStream device](self, "device");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deviceUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDStream streamName](self, "streamName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Stream physicalFormat](self, "physicalFormat");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@:%@: setPhysicalFormat: New: %@", buf, 0x20u);

    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTStream device](self, "device");
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "deviceUID");
    objc_claimAutoreleasedReturnValue();
    -[ASDStream streamName](self, "streamName");
    objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2Stream setPhysicalFormat:alwaysNotify:].cold.1();
  }
LABEL_14:

}

- (void)setPhysicalFormat:(id)a3
{
  -[ASDTIOA2Stream setPhysicalFormat:alwaysNotify:](self, "setPhysicalFormat:alwaysNotify:", a3, 0);
}

- (BOOL)changePhysicalFormat:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  -[ASDTIOA2Stream physicalFormat](self, "physicalFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    -[ASDTStream device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__ASDTIOA2Stream_changePhysicalFormat___block_invoke;
    v9[3] = &unk_25084B3C8;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    objc_msgSend(v7, "requestConfigurationChange:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return 1;
}

void __39__ASDTIOA2Stream_changePhysicalFormat___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id WeakRetained;
  id v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setPhysicalFormat:alwaysNotify:", *(_QWORD *)(a1 + 32), 1);

  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "samplingRate");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "sampleRate");
  v7 = v6;

  if (v5 != v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "sampleRate");
    v9 = v8;
    v13 = objc_loadWeakRetained(v2);
    objc_msgSend(v13, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSamplingRate:", v9);

  }
}

- (void)asyncDeviceChangedToSamplingRate:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2Stream;
  -[ASDStream deviceChangedToSamplingRate:](&v3, sel_deviceChangedToSamplingRate_, a3);
}

- (BOOL)deviceChangedToSamplingRate:(double)a3
{
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  -[ASDTIOA2Stream ioa2Device](self, "ioa2Device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "concurrentQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ASDTIOA2Stream_deviceChangedToSamplingRate___block_invoke;
  block[3] = &unk_25084B3F0;
  objc_copyWeak(v9, &location);
  v9[1] = *(id *)&a3;
  dispatch_async(v6, block);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return 1;
}

void __46__ASDTIOA2Stream_deviceChangedToSamplingRate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "asyncDeviceChangedToSamplingRate:", *(double *)(a1 + 40));

}

- (char)ioBuffer
{
  return self->_ioBuffer;
}

- (unsigned)ioBufferSize
{
  return self->_ioBufferByteSize;
}

- (id)updateClientPositionBlock
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[ASDStream direction](self, "direction");
  -[ASDTIOA2Stream ioa2Device](self, "ioa2Device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1768845428)
    objc_msgSend(v4, "updateClientInputPositionBlock");
  else
    objc_msgSend(v4, "updateClientOutputPositionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x23B8030C8]();

  return v7;
}

- (int)pmPrewarmStream:(int)a3
{
  int result;
  void *v6;
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASDTIOA2Stream;
  result = -[ASDTStream pmPrewarmStream:](&v8, sel_pmPrewarmStream_);
  if (a3 == 1970304877 && !result)
  {
    if (-[ASDTIOA2Stream _mapIOBuffer](self, "_mapIOBuffer"))
    {
      -[ASDTStream clearBuffer](self, "clearBuffer");
      if (-[ASDTIOA2Stream usesIsolatedIO](self, "usesIsolatedIO")
        && -[ASDStream direction](self, "direction") == 1768845428
        && (-[ASDTIOA2Stream ioa2Device](self, "ioa2Device"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v7 = objc_msgSend(v6, "_setupForIsolatedIO:forUseCase:withIOFrameBufferSize:", self->_userClientID, -[ASDTStream isolatedUseCaseID](self, "isolatedUseCaseID"), 0), v6, (v7 & 1) == 0))
      {
        return 561214578;
      }
      else
      {
        return 0;
      }
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
  void *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  if (a3 == 1685090418)
  {
    if (-[ASDTIOA2Stream usesIsolatedIO](self, "usesIsolatedIO")
      && -[ASDStream direction](self, "direction") == 1768845428)
    {
      -[ASDTIOA2Stream ioa2Device](self, "ioa2Device");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_teardownForIsolatedIO:forUseCase:", self->_userClientID, -[ASDTStream isolatedUseCaseID](self, "isolatedUseCaseID"));

    }
    -[ASDTIOA2Stream _releaseIOBuffer](self, "_releaseIOBuffer");
  }
  v7.receiver = self;
  v7.super_class = (Class)ASDTIOA2Stream;
  return -[ASDTStream pmPrepareStream:](&v7, sel_pmPrepareStream_, v3);
}

- (id)exclavesReadInput
{
  void *v3;
  int v4;
  unsigned int v5;
  unint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[8];
  unsigned int v15;
  int v16;

  -[ASDTIOA2Stream physicalFormat](self, "physicalFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bytesPerFrame");

  v5 = -[ASDTIOA2Stream userClientID](self, "userClientID");
  v6 = -[ASDTStream isolatedUseCaseID](self, "isolatedUseCaseID");
  -[ASDTIOA2Stream updateClientPositionBlock](self, "updateClientPositionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTStream setUpdateClientPositionCopy:](self, "setUpdateClientPositionCopy:", v7);

  v8 = -[ASDTStream getUpdateClientPositionUnretainedAddress](self, "getUpdateClientPositionUnretainedAddress");
  v9 = -[ASDTExclavesStream exclavesBuffer](self, "exclavesBuffer");
  if (v9)
  {
    v10 = v9;
    -[ASDTIOA2Stream ioa2Device](self, "ioa2Device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ioa2UserClient");

    if (v12)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __35__ASDTIOA2Stream_exclavesReadInput__block_invoke;
      v14[3] = &__block_descriptor_72_e195_i40__0I8r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_12_v20_v28I36l;
      v14[4] = v12;
      v14[5] = v6;
      v15 = v5;
      v16 = v4;
      v14[6] = v10;
      v14[7] = v8;
      v9 = (void *)MEMORY[0x23B8030C8](v14);
    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
}

uint64_t __35__ASDTIOA2Stream_exclavesReadInput__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!a3)
    __35__ASDTIOA2Stream_exclavesReadInput__block_invoke_cold_1();
  if (!a4)
    __35__ASDTIOA2Stream_exclavesReadInput__block_invoke_cold_2();
  v7 = (unint64_t)*(double *)(a3 + 80);
  if (ASDT::IOA2UserClient::DoIsolatedIO(*(ASDT::IOA2UserClient **)(a1 + 32), *(_DWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), 0x72656164u, a2, v7, *(_QWORD *)(a3 + 88)))v8 = ASDT::Exclaves::NamedBuffer::Read(*(ASDT::Exclaves::NamedBuffer **)(a1 + 48), a4);
  else
    v8 = 560227702;
  v9 = **(_QWORD **)(a1 + 56);
  if (v9)
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v7 + a2);
  return v8;
}

- (id)readIsolatedInputBlock
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  _QWORD v9[6];
  unsigned int v10;

  v3 = -[ASDTIOA2Stream userClientID](self, "userClientID");
  -[ASDTIOA2Stream ioa2Device](self, "ioa2Device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ioa2UserClient");

  if (v5 && -[ASDTIOA2Stream usesIsolatedIO](self, "usesIsolatedIO"))
  {
    v6 = -[ASDTStream getUpdateClientPositionUnretainedAddress](self, "getUpdateClientPositionUnretainedAddress");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40__ASDTIOA2Stream_readIsolatedInputBlock__block_invoke;
    v9[3] = &__block_descriptor_52_e187_i28__0Q8I16r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_20l;
    v10 = v3;
    v9[4] = v5;
    v9[5] = v6;
    v7 = (void *)MEMORY[0x23B8030C8](v9);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

uint64_t __40__ASDTIOA2Stream_readIsolatedInputBlock__block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  int v7;
  uint64_t v8;

  if (!a4)
    __40__ASDTIOA2Stream_readIsolatedInputBlock__block_invoke_cold_1();
  v6 = (unint64_t)*(double *)(a4 + 80);
  v7 = ASDT::IOA2UserClient::DoIsolatedIO(*(ASDT::IOA2UserClient **)(a1 + 32), *(_DWORD *)(a1 + 48), a2, 0x72656164u, a3, v6, *(_QWORD *)(a4 + 88));
  v8 = **(_QWORD **)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v6 + a3);
  if (v7)
    return 0;
  else
    return 560227702;
}

- (BOOL)marked
{
  return self->_marked;
}

- (void)setMarked:(BOOL)a3
{
  self->_marked = a3;
}

- (unsigned)userClientID
{
  return self->_userClientID;
}

- (BOOL)usesIsolatedIO
{
  return self->_usesIsolatedIO;
}

- (void)setUsesIsolatedIO:(BOOL)a3
{
  self->_usesIsolatedIO = a3;
}

- (NSDictionary)isolatedIOFormatMap
{
  return self->_isolatedIOFormatMap;
}

- (void)setIsolatedIOFormatMap:(id)a3
{
  objc_storeStrong((id *)&self->_isolatedIOFormatMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolatedIOFormatMap, 0);
}

- (void)_mapIOBuffer
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3, v4, v5, 5.778e-34);
  OUTLINED_FUNCTION_2_0(&dword_236D43000, MEMORY[0x24BDACB70], v6, "%@:%@: Failed to map IO buffer", v7);

  OUTLINED_FUNCTION_3_0();
}

- (void)setPhysicalFormat:alwaysNotify:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3, v4, v5, 5.778e-34);
  OUTLINED_FUNCTION_2_0(&dword_236D43000, MEMORY[0x24BDACB70], v6, "%@:%@: setPhysicalFormat: Failed to identify physical format from map.", v7);

  OUTLINED_FUNCTION_3_0();
}

void __35__ASDTIOA2Stream_exclavesReadInput__block_invoke_cold_1()
{
  __assert_rtn("-[ASDTIOA2Stream exclavesReadInput]_block_invoke", "ASDTIOA2Stream.mm", 366, "ioCycleInfo");
}

void __35__ASDTIOA2Stream_exclavesReadInput__block_invoke_cold_2()
{
  __assert_rtn("-[ASDTIOA2Stream exclavesReadInput]_block_invoke", "ASDTIOA2Stream.mm", 367, "ioMainBuffer");
}

void __40__ASDTIOA2Stream_readIsolatedInputBlock__block_invoke_cold_1()
{
  __assert_rtn("-[ASDTIOA2Stream readIsolatedInputBlock]_block_invoke", "ASDTIOA2Stream.mm", 411, "inIOCycleInfo");
}

@end
