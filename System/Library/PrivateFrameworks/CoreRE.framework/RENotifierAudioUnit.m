@implementation RENotifierAudioUnit

+ (void)registerToAudioUnit
{
  if (+[RENotifierAudioUnit registerToAudioUnit]::onceToken != -1)
    dispatch_once(&+[RENotifierAudioUnit registerToAudioUnit]::onceToken, &__block_literal_global_4);
}

void __42__RENotifierAudioUnit_registerToAudioUnit__block_invoke()
{
  void *v0;
  void *v1;
  __int128 v2;
  int v3;

  v0 = (void *)MEMORY[0x24BDB6BD8];
  objc_opt_self();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v2 = *(_OWORD *)"nguatonrlppa";
  objc_msgSend(v0, "registerSubclass:asComponentDescription:name:version:", v1, &v2, CFSTR("RE Notifier Audio Unit"), 1);

}

- (RENotifierAudioUnit)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5
{
  RENotifierAudioUnit *v5;
  void *v6;
  uint64_t v7;
  AUAudioUnitBus *inputBus;
  uint64_t v9;
  AUAudioUnitBus *outputBus;
  id v11;
  void *v12;
  uint64_t v13;
  AUAudioUnitBusArray *inputBusArray;
  id v15;
  void *v16;
  uint64_t v17;
  AUAudioUnitBusArray *outputBusArray;
  objc_super v20;
  AudioComponentDescription v21;
  AUAudioUnitBus *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v21 = *a3;
  v20.receiver = self;
  v20.super_class = (Class)RENotifierAudioUnit;
  v5 = -[AUAudioUnit initWithComponentDescription:options:error:](&v20, sel_initWithComponentDescription_options_error_, &v21, *(_QWORD *)&a4, a5);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initStandardFormatWithSampleRate:channels:", 1, 48000.0);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDB6BE0]), "initWithFormat:error:", v6, 0);
    inputBus = v5->_inputBus;
    v5->_inputBus = (AUAudioUnitBus *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDB6BE0]), "initWithFormat:error:", v6, 0);
    outputBus = v5->_outputBus;
    v5->_outputBus = (AUAudioUnitBus *)v9;

    v11 = objc_alloc(MEMORY[0x24BDB6BE8]);
    v23[0] = v5->_inputBus;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithAudioUnit:busType:busses:", v5, 1, v12);
    inputBusArray = v5->_inputBusArray;
    v5->_inputBusArray = (AUAudioUnitBusArray *)v13;

    v15 = objc_alloc(MEMORY[0x24BDB6BE8]);
    v22 = v5->_outputBus;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithAudioUnit:busType:busses:", v5, 2, v16);
    outputBusArray = v5->_outputBusArray;
    v5->_outputBusArray = (AUAudioUnitBusArray *)v17;

    atomic_store(0, (unsigned __int8 *)&v5->_hasNotified);
  }
  return v5;
}

- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3
{
  void *v5;
  void (**v6)(void);
  objc_super v8;

  atomic_store(0, (unsigned __int8 *)&self->_hasNotified);
  -[RENotifierAudioUnit didAllocate](self, "didAllocate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RENotifierAudioUnit didAllocate](self, "didAllocate");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
  -[AUAudioUnit setRenderResourcesAllocated:](self, "setRenderResourcesAllocated:", 1);
  v8.receiver = self;
  v8.super_class = (Class)RENotifierAudioUnit;
  return -[AUAudioUnit allocateRenderResourcesAndReturnError:](&v8, sel_allocateRenderResourcesAndReturnError_, a3);
}

- (void)deallocateRenderResources
{
  void *v3;
  void (**v4)(void);

  -[RENotifierAudioUnit didDeallocate](self, "didDeallocate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RENotifierAudioUnit didDeallocate](self, "didDeallocate");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  -[AUAudioUnit setRenderResourcesAllocated:](self, "setRenderResourcesAllocated:", 0);
}

- (void)resetNotifications
{
  atomic_store(0, (unsigned __int8 *)&self->_hasNotified);
}

- (BOOL)hasNotified
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_hasNotified);
  return v2 & 1;
}

- (id)internalRenderBlock
{
  void *v3;
  _QWORD aBlock[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__RENotifierAudioUnit_internalRenderBlock__block_invoke;
  aBlock[3] = &unk_24ED3D6E8;
  objc_copyWeak(&v6, &location);
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

uint64_t __42__RENotifierAudioUnit_internalRenderBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, _DWORD *a6)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  void *v13;
  void (**v14)(void);
  uint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    v11 = WeakRetained + 608;
    do
    {
      if (__ldaxr(v11))
      {
        __clrex();
        goto LABEL_9;
      }
    }
    while (__stlxr(1u, v11));
    objc_msgSend(*(id *)(a1 + 32), "firstRender");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "firstRender");
      v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v14[2]();

    }
LABEL_9:
    if (*a6)
    {
      v16 = 0;
      v17 = 4 * a4;
      v18 = 4;
      do
      {
        bzero(*(void **)&a6[v18], v17);
        ++v16;
        v18 += 4;
      }
      while (v16 < *a6);
    }
    v15 = 0;
  }
  else
  {
    v15 = 4294956433;
  }

  return v15;
}

- (id)channelCapabilities
{
  return &unk_24EDB7B48;
}

- (id)inputBusses
{
  return self->_inputBusArray;
}

- (id)outputBusses
{
  return self->_outputBusArray;
}

- (id)didAllocate
{
  return self->_didAllocate;
}

- (void)setDidAllocate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (id)didDeallocate
{
  return self->_didDeallocate;
}

- (void)setDidDeallocate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (id)firstRender
{
  return self->_firstRender;
}

- (void)setFirstRender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstRender, 0);
  objc_storeStrong(&self->_didDeallocate, 0);
  objc_storeStrong(&self->_didAllocate, 0);
  objc_storeStrong((id *)&self->_outputBusArray, 0);
  objc_storeStrong((id *)&self->_outputBus, 0);
  objc_storeStrong((id *)&self->_inputBusArray, 0);
  objc_storeStrong((id *)&self->_inputBus, 0);
}

@end
