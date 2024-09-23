@implementation ASDTIOA2LegacyStream

- (ASDTIOA2LegacyStream)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 direction:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  ASDTIOA2LegacyStream *v9;
  ASDTIOA2LegacyStream *v10;
  objc_super v12;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDTIOA2LegacyStream;
  v9 = -[ASDTStream initWithDirection:withDevice:](&v12, sel_initWithDirection_withDevice_, v5, v8);
  v10 = v9;
  if (v9)
  {
    v9->_userClientID = a4;
    -[ASDStream setIsActive:](v9, "setIsActive:", 1);
    -[ASDTIOA2LegacyStream _synchronizeWithHardware](v10, "_synchronizeWithHardware");
  }

  return v10;
}

- (void)_pushActiveState
{
  id v3;

  -[ASDTIOA2LegacyStream ioa2Device](self, "ioa2Device");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setStreamActive:streamUCID:", -[ASDStream isActive](self, "isActive"), self->_userClientID);

}

- (void)_mapIOBuffer
{
  void *v3;
  unsigned int ioBufferByteSize;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  -[ASDTIOA2LegacyStream ioa2Device](self, "ioa2Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapIOBuffer:ofSize:forStream:", &self->_ioBuffer, &self->_ioBufferByteSize, self->_userClientID);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    ioBufferByteSize = self->_ioBufferByteSize;
    v5[0] = 67109120;
    v5[1] = ioBufferByteSize;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Buffer mapped with size %d", (uint8_t *)v5, 8u);
  }
}

- (void)_releaseIOBuffer
{
  void *v3;
  uint8_t v4[16];

  -[ASDTIOA2LegacyStream ioa2Device](self, "ioa2Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_releaseIOBuffer:forStream:", self->_ioBuffer, self->_userClientID);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Buffer released", v4, 2u);
  }
  self->_ioBuffer = 0;
  self->_ioBufferByteSize = 0;
}

- (void)_synchronizeWithHardware
{
  -[ASDTIOA2LegacyStream _getStartingChannel](self, "_getStartingChannel");
  -[ASDTIOA2LegacyStream _buildFormatList](self, "_buildFormatList");
}

- (void)_getStartingChannel
{
  void *v3;
  unsigned int v4;
  uint64_t v5;

  -[ASDTIOA2LegacyStream ioa2Device](self, "ioa2Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_streamStartingChannel:", self->_userClientID);

  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  -[ASDStream setStartingChannel:](self, "setStartingChannel:", v5);
}

- (void)_buildFormatList
{
  void *v3;
  void *v4;
  id v5;
  AudioStreamRangedDescription *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE v11[56];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[ASDTIOA2LegacyStream ioa2Device](self, "ioa2Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "_availableFormatsForStream:", self->_userClientID);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if (ASDT::IOA2UCDevice::ConstructASRDFromDictionary(*(ASDT::IOA2UCDevice **)(*((_QWORD *)&v12 + 1) + 8 * v9), (const __CFDictionary *)v11, v6))
          {
            v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0A270]), "initWithAudioStreamRangedDescription:", v11);
            objc_msgSend(v4, "addObject:", v10);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  -[ASDStream setPhysicalFormats:](self, "setPhysicalFormats:", v4);

}

- (id)physicalFormat
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  std::recursive_mutex *v10;
  uint64_t v11;

  -[ASDTIOA2LegacyStream ioa2Device](self, "ioa2Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "scopedLock");
    v9 = 0;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend(v4, "_currentFormatForStream:", self->_userClientID, 0, 0, 0, 0, 0);
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v9 = 0;
    v7 = 0u;
    v8 = 0u;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0A270]), "initWithAudioStreamBasicDescription:", &v7);
  if ((_BYTE)v11)
    std::recursive_mutex::unlock(v10);

  return v5;
}

- (void)setPhysicalFormat:(id)a3
{
  id v4;
  void *v5;
  _OWORD v6[2];
  uint64_t v7;

  v4 = a3;
  -[ASDTIOA2LegacyStream ioa2Device](self, "ioa2Device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "audioStreamBasicDescription");
  }
  else
  {
    v7 = 0;
    memset(v6, 0, sizeof(v6));
  }
  objc_msgSend(v5, "_setCurrentFormat:forStream:", v6, self->_userClientID);

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
  -[ASDTIOA2LegacyStream physicalFormat](self, "physicalFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    -[ASDTStream device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __45__ASDTIOA2LegacyStream_changePhysicalFormat___block_invoke;
    v9[3] = &unk_25084B3C8;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    objc_msgSend(v7, "requestConfigurationChange:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return 1;
}

void __45__ASDTIOA2LegacyStream_changePhysicalFormat___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id WeakRetained;
  id v13;
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setPhysicalFormat:", v2);

  v13 = objc_loadWeakRetained(v3);
  objc_msgSend(v13, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "samplingRate");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "sampleRate");
  v8 = v7;

  if (v6 != v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "sampleRate");
    v10 = v9;
    v14 = objc_loadWeakRetained(v3);
    objc_msgSend(v14, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSamplingRate:", v10);

  }
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
  -[ASDTIOA2LegacyStream ioa2Device](self, "ioa2Device");
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

@end
