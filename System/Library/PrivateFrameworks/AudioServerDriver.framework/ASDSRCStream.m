@implementation ASDSRCStream

- (ASDSRCStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[ASDSRCStream initWithDirection:withPlugin:]", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Do not call %@"), v6);

  return 0;
}

- (ASDSRCStream)initWithOwningDevice:(id)a3 underlyingStreams:(id)a4 direction:(unsigned int)a5 plugin:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  ASDSRCStream *v12;
  ASDSRCStream *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *srcQueue;
  void *v20;
  void *v21;
  id v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *propertyQueue;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v7 = *(_QWORD *)&a5;
  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v37.receiver = self;
  v37.super_class = (Class)ASDSRCStream;
  v12 = -[ASDStream initWithDirection:withPlugin:](&v37, sel_initWithDirection_withPlugin_, v7, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_owningDevice, v10);
    objc_storeStrong((id *)&v13->_underlyingStreams, a4);
    v13->_ioReferenceCount = 0;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD17C8];
    -[ASDStream streamName](v13, "streamName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@.srcStream.%@.srcQueue"), v14, v16);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), 0);
    srcQueue = v13->_srcQueue;
    v13->_srcQueue = (OS_dispatch_queue *)v18;

    v20 = (void *)MEMORY[0x24BDD17C8];
    -[ASDStream streamName](v13, "streamName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@.srcStream.%@.propertyQueue"), v14, v21);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = dispatch_queue_create((const char *)objc_msgSend(v22, "UTF8String"), 0);
    propertyQueue = v13->_propertyQueue;
    v13->_propertyQueue = (OS_dispatch_queue *)v23;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = v11;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v34;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v25);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v28), "direction") != (_DWORD)v7)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("ASDSRCStream.mm"), 57, CFSTR("Underlying stream has a different direction than the SRC stream"));

          }
          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v26);
    }

    -[ASDSRCStream _updateMaximumFramesPerIOCycle](v13, "_updateMaximumFramesPerIOCycle");
    -[ASDSRCStream _updateLatency](v13, "_updateLatency");

  }
  return v13;
}

- (void)setUnderlyingStreams:(id)a3
{
  id v4;
  NSObject *srcQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  srcQueue = self->_srcQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ASDSRCStream_setUnderlyingStreams___block_invoke;
  block[3] = &unk_24DBCA180;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(srcQueue, block);

}

void __37__ASDSRCStream_setUnderlyingStreams___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 336), *(id *)(a1 + 40));
}

- (void)startStream
{
  NSObject *srcQueue;
  objc_super v4;
  _QWORD block[6];

  srcQueue = self->_srcQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__ASDSRCStream_startStream__block_invoke;
  block[3] = &unk_24DBCA1F8;
  block[4] = self;
  block[5] = a2;
  dispatch_sync(srcQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)ASDSRCStream;
  -[ASDStream startStream](&v4, sel_startStream);
}

uint64_t __27__ASDSRCStream_startStream__block_invoke(uint64_t a1)
{
  uint64_t result;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  result = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(result + 328))
  {
    objc_msgSend((id)result, "_updateMaximumFramesPerIOCycle");
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "startStream", (_QWORD)v8);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

    if ((objc_msgSend(*(id *)(a1 + 32), "_allocateStreamingResources") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("ASDSRCStream.mm"), 86, CFSTR("Couldn't allocate streaming resources"));

    }
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 328);
    result = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(result + 312) = 1;
  return result;
}

- (void)stopStream
{
  NSObject *srcQueue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASDSRCStream;
  -[ASDStream stopStream](&v5, sel_stopStream);
  srcQueue = self->_srcQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__ASDSRCStream_stopStream__block_invoke;
  block[3] = &unk_24DBC9F68;
  block[4] = self;
  dispatch_sync(srcQueue, block);
}

uint64_t __26__ASDSRCStream_stopStream__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(result + 32) + 312) = 0;
  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 328);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (!v3)
  {
    v5 = result;
    *(_QWORD *)(v1 + 328) = v4;
    v6 = *(_QWORD *)(result + 32);
    if (!*(_QWORD *)(v6 + 328))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v7 = *(id *)(v6 + 336);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "stopStream", (_QWORD)v11);
          }
          while (v8 != v10);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

      return objc_msgSend(*(id *)(v5 + 32), "_deallocateStreamingResources");
    }
  }
  return result;
}

- (BOOL)changePhysicalFormat:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[ASDStream physicalFormat](self, "physicalFormat");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[ASDObject owner](self, "owner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __37__ASDSRCStream_changePhysicalFormat___block_invoke;
    v8[3] = &unk_24DBCA180;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v6, "requestConfigurationChange:", v8);

  }
  return 1;
}

uint64_t __37__ASDSRCStream_changePhysicalFormat___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setPhysicalFormat:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sampleRate");
  objc_msgSend(v2, "setSamplingRate:");

  return objc_msgSend(*(id *)(a1 + 32), "updateLatency");
}

- (BOOL)_allocateStreamingResources
{
  char v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  uint64_t (**v7)();
  char v8;
  uint64_t (***v9)();
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__ASDSRCStream__allocateStreamingResources__block_invoke;
  v6[3] = &unk_24DBCA068;
  v6[4] = self;
  v7 = &off_24DBC9E00;
  v8 = 0;
  v9 = &v7;
  v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == &v7)
  {
    v4 = 4;
    v3 = &v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __43__ASDSRCStream__allocateStreamingResources__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  ASDSRCStreamHelper *v14;
  _QWORD *v15;
  ASDSRCStreamHelper *v16;
  size_t v17;
  double v18;
  double v19;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *__p;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  AudioStreamBasicDescription v33;
  _BYTE v34[40];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "physicalFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "audioStreamBasicDescription");
  else
    memset(&v33, 0, sizeof(v33));
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)v34, &v33);

  v30 = 0;
  v31 = 0;
  v32 = 0;
  __p = 0;
  v28 = 0;
  v29 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "readInputBlock");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "writeMixBlock");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v9 = v31;
        if ((unint64_t)v31 >= v32)
        {
          v10 = std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__emplace_back_slow_path<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks&>(&v30, &v21);
        }
        else
        {
          *v9 = MEMORY[0x220733498](v21);
          v9[1] = MEMORY[0x220733498](v22);
          v10 = (uint64_t)(v9 + 2);
        }
        v31 = (_QWORD *)v10;
        objc_msgSend(v8, "physicalFormat");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
          objc_msgSend(v11, "audioStreamBasicDescription");
        else
          memset(&v33, 0, sizeof(v33));
        std::vector<CAStreamBasicDescription>::emplace_back<AudioStreamBasicDescription>(&__p, &v33);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v5);
  }

  v13 = objc_msgSend(*(id *)(a1 + 32), "direction");
  v14 = (ASDSRCStreamHelper *)operator new();
  ASDSRCStreamHelper::ASDSRCStreamHelper(v14, v34, &__p, &v30, v13 == 1768845428, 127);
  std::unique_ptr<ASDSRCStreamHelper>::reset[abi:ne180100]((ASDSRCStreamHelper **)(*(_QWORD *)(a1 + 32) + 288), v14);
  v15 = *(_QWORD **)(a1 + 32);
  v16 = (ASDSRCStreamHelper *)v15[36];
  v17 = objc_msgSend(v15, "maximumFramesPerIOCycle");
  ASDSRCStreamHelper::allocateStreamingResources(v16, v17, v18, v19);
  if (__p)
  {
    v28 = __p;
    operator delete(__p);
  }
  *(_QWORD *)&v33.mSampleRate = &v30;
  std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
  return 1;
}

- (void)_deallocateStreamingResources
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[3];
  _QWORD *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__ASDSRCStream__deallocateStreamingResources__block_invoke;
  v4[3] = &unk_24DBC9F68;
  v4[4] = self;
  v5[0] = &off_24DBC9D70;
  v6 = v5;
  ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v4);
  v2 = v6;
  if (v6 == v5)
  {
    v3 = 4;
    v2 = v5;
  }
  else
  {
    if (!v6)
      return;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
}

ASDSRCStreamHelper *__45__ASDSRCStream__deallocateStreamingResources__block_invoke(uint64_t a1)
{
  ASDSRCStreamHelper::deallocateStreamingResources(*(ASDSRCStreamHelper **)(*(_QWORD *)(a1 + 32) + 288));
  return std::unique_ptr<ASDSRCStreamHelper>::reset[abi:ne180100]((ASDSRCStreamHelper **)(*(_QWORD *)(a1 + 32) + 288), 0);
}

- (void)updateLatency
{
  NSObject *srcQueue;
  _QWORD block[5];

  srcQueue = self->_srcQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__ASDSRCStream_updateLatency__block_invoke;
  block[3] = &unk_24DBC9F68;
  block[4] = self;
  dispatch_sync(srcQueue, block);
}

uint64_t __29__ASDSRCStream_updateLatency__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLatency");
}

- (void)_updateMaximumFramesPerIOCycle
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
  self->_maximumFramesPerIOCycle = objc_msgSend(WeakRetained, "timestampPeriod");

}

- (int64_t)maximumFramesPerIOCycle
{
  NSObject *propertyQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__ASDSRCStream_maximumFramesPerIOCycle__block_invoke;
  v5[3] = &unk_24DBCA2B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__ASDSRCStream_maximumFramesPerIOCycle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateMaximumFramesPerIOCycle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
  return result;
}

- (void)_updateLatency
{
  id WeakRetained;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  NSArray *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unsigned int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
  objc_msgSend(WeakRetained, "samplingRate");
  v5 = v4;
  objc_msgSend(WeakRetained, "underlyingDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "samplingRate");
  v8 = v7;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_underlyingStreams;
  v10 = 0;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v14, "latency", (_QWORD)v26) > v10)
          v10 = objc_msgSend(v14, "latency");
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  objc_msgSend(WeakRetained, "underlyingDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "samplingRate");
  v17 = v16;
  objc_msgSend(WeakRetained, "samplingRate");
  v19 = v17 != v18;

  if (v19)
  {
    objc_msgSend(WeakRetained, "underlyingDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "samplingRate");
    v22 = v21;
    objc_msgSend(WeakRetained, "samplingRate");
    v24 = v23;

    v25 = vcvtmd_u64_f64(5.0 / v22 * v24 + 0.5);
  }
  else
  {
    v25 = 0;
  }
  -[ASDStream setLatency:](self, "setLatency:", v25 + vcvtpd_u64_f64(v5 / v8 * (double)v10), (_QWORD)v26);

}

- (id)readInputBlock
{
  void *v2;
  _QWORD v4[5];
  _QWORD v5[4];

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = &self->_streamHelper;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__ASDSRCStream_readInputBlock__block_invoke;
  v4[3] = &unk_24DBCA370;
  v4[4] = v5;
  v2 = (void *)MEMORY[0x220733498](v4, a2);
  _Block_object_dispose(v5, 8);
  return v2;
}

uint64_t __30__ASDSRCStream_readInputBlock__block_invoke(uint64_t a1, uint64_t a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5, uint64_t a6)
{
  ASDSRCStreamHelper *v6;

  v6 = **(ASDSRCStreamHelper ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (!v6)
    __30__ASDSRCStream_readInputBlock__block_invoke_cold_1();
  return ASDSRCStreamHelper::readInput(v6, a2, a3, a4, a5, a6);
}

- (id)writeMixBlock
{
  void *v2;
  _QWORD v4[5];
  _QWORD v5[4];

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = &self->_streamHelper;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__ASDSRCStream_writeMixBlock__block_invoke;
  v4[3] = &unk_24DBCA370;
  v4[4] = v5;
  v2 = (void *)MEMORY[0x220733498](v4, a2);
  _Block_object_dispose(v5, 8);
  return v2;
}

uint64_t __29__ASDSRCStream_writeMixBlock__block_invoke(uint64_t a1, unsigned int a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5)
{
  ASDSRCStreamHelper *v5;

  v5 = **(ASDSRCStreamHelper ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (!v5)
    __29__ASDSRCStream_writeMixBlock__block_invoke_cold_1();
  return ASDSRCStreamHelper::writeMix(v5, a2, a3, a4, a5);
}

- (NSArray)underlyingStreams
{
  return self->_underlyingStreams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingStreams, 0);
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_srcQueue, 0);
  std::unique_ptr<ASDSRCStreamHelper>::reset[abi:ne180100](&self->_streamHelper.__ptr_.__value_, 0);
  objc_destroyWeak((id *)&self->_owningDevice);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 36) = 0;
  return self;
}

void __30__ASDSRCStream_readInputBlock__block_invoke_cold_1()
{
  __assert_rtn("-[ASDSRCStream readInputBlock]_block_invoke", "ASDSRCStream.mm", 222, "*streamHelper");
}

void __29__ASDSRCStream_writeMixBlock__block_invoke_cold_1()
{
  __assert_rtn("-[ASDSRCStream writeMixBlock]_block_invoke", "ASDSRCStream.mm", 233, "*streamHelper");
}

@end
