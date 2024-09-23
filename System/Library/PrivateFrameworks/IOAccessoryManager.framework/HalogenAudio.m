@implementation HalogenAudio

- (id)initAudioWithParameters:(id)a3 nInputChannels:(int)a4 nOutputChannels:(int)a5 sampleRate:(int)a6 bitDepth:(int)a7 inputFrameSizeInBytes:(int)a8 outputFrameSizeInBytes:(int)a9
{
  HalogenAudio *v15;
  HalogenAudio *v16;
  uint8_t v18[16];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HalogenAudio;
  v15 = -[HalogenAudio init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_nInputChannels = a4;
    v15->_nOutputChannels = a5;
    v15->_sampleRate = a6;
    v15->_bitDepth = a7;
    v15->_inputFrameSizeInBytes = a8;
    v15->_outputFrameSizeInBytes = a9;
    if (a3)
    {
      -[HalogenAudio setHalogenUnitDelegate:](v15, "setHalogenUnitDelegate:", a3);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenAudio:initAudioPath did not receive a valid halogenUnit.", v18, 2u);
      }

      return 0;
    }
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[HalogenAudio _deinitAudioInstance](self, "_deinitAudioInstance");
  v3.receiver = self;
  v3.super_class = (Class)HalogenAudio;
  -[HalogenAudio dealloc](&v3, sel_dealloc);
}

- (void)_deinitAudioInstance
{
  OpaqueAudioComponentInstance *audioComponentInst;
  uint8_t v4[16];

  audioComponentInst = self->_audioComponentInst;
  if (audioComponentInst)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenAudio:Uninitializing AudioUnit instance.", v4, 2u);
      audioComponentInst = self->_audioComponentInst;
    }
    AudioUnitUninitialize(audioComponentInst);
    AudioComponentInstanceDispose(self->_audioComponentInst);
    self->_audioComponentInst = 0;
  }
}

- (BOOL)startAudioUnit
{
  unsigned int bitDepth;
  double sampleRate;
  int nOutputChannels;
  int inputFrameSizeInBytes;
  int outputFrameSizeInBytes;
  OpaqueAudioComponent *Next;
  OpaqueAudioComponentInstance **p_audioComponentInst;
  OSStatus v10;
  OpaqueAudioComponentInstance *v11;
  OSStatus v12;
  OSStatus v13;
  OSStatus v14;
  OSStatus v15;
  OSStatus v16;
  OSStatus v17;
  OSStatus v18;
  OSStatus v19;
  OSStatus v20;
  BOOL result;
  _BOOL4 v22;
  NSObject *v23;
  const char *v24;
  _BOOL4 v25;
  uint32_t v26;
  OSStatus v27;
  _BOOL4 v28;
  OSStatus v29;
  _BOOL4 v30;
  OSStatus v31;
  _BOOL4 v32;
  OSStatus v33;
  _BOOL4 v34;
  OSStatus v35;
  _BOOL4 v36;
  OSStatus v37;
  _BOOL4 v38;
  OSStatus v39;
  _BOOL4 v40;
  OSStatus v41;
  _BOOL4 v42;
  OSStatus v43;
  _BOOL4 v44;
  int v45;
  int inData;
  AudioComponentDescription inDesc;
  _QWORD v48[2];
  int v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  _QWORD v54[2];
  int v55;
  int v56;
  int v57;
  int nInputChannels;
  uint64_t v59;
  uint64_t (*v60)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  HalogenAudio *v61;
  uint8_t buf[4];
  OSStatus v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v60 = (uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0xAAAAAAAAAAAAAAAALL;
  v61 = (HalogenAudio *)0xAAAAAAAAAAAAAAAALL;
  v59 = 0;
  bitDepth = self->_bitDepth;
  sampleRate = (double)self->_sampleRate;
  nOutputChannels = self->_nOutputChannels;
  inputFrameSizeInBytes = self->_inputFrameSizeInBytes;
  outputFrameSizeInBytes = self->_outputFrameSizeInBytes;
  nInputChannels = self->_nInputChannels;
  LODWORD(v59) = bitDepth;
  v52 = nOutputChannels;
  v53 = bitDepth;
  v55 = inputFrameSizeInBytes;
  v56 = 1;
  v57 = inputFrameSizeInBytes;
  *(double *)v54 = sampleRate;
  v54[1] = 0x96C70636DLL;
  v50 = 1;
  v51 = outputFrameSizeInBytes;
  v49 = outputFrameSizeInBytes;
  *(double *)v48 = sampleRate;
  v48[1] = 0x96C70636DLL;
  *(_OWORD *)&inDesc.componentType = xmmword_1D13E7E50;
  inDesc.componentFlagsMask = 0;
  Next = AudioComponentFindNext(0, &inDesc);
  if (!Next)
  {
    v25 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v25)
    {
      *(_WORD *)buf = 0;
      v23 = MEMORY[0x1E0C81028];
      v24 = "HalogenAudio:AudioComponentFindNext() failed to find kAudioUnitSubType_LDCMIO";
      v26 = 2;
LABEL_38:
      _os_log_impl(&dword_1D13BF000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
      return 0;
    }
    return result;
  }
  p_audioComponentInst = &self->_audioComponentInst;
  v10 = AudioComponentInstanceNew(Next, &self->_audioComponentInst);
  if (v10 || (v11 = *p_audioComponentInst) == 0)
  {
    v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v22)
      return result;
    *(_DWORD *)buf = 67109120;
    v63 = v10;
    v23 = MEMORY[0x1E0C81028];
    v24 = "HalogenAudio:AudioComponentInstanceNew() failed (status = 0x%x) ";
    goto LABEL_37;
  }
  inData = 1;
  v12 = AudioUnitSetProperty(v11, 0x7D3u, 1u, 1u, &inData, 4u);
  if (v12)
  {
    v27 = v12;
    v28 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v28)
      return result;
    *(_DWORD *)buf = 67109120;
    v63 = v27;
    v23 = MEMORY[0x1E0C81028];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_EnableIO/1 (status = 0x%x)";
    goto LABEL_37;
  }
  v13 = AudioUnitSetProperty(*p_audioComponentInst, 0x7D3u, 2u, 0, &inData, 4u);
  if (v13)
  {
    v29 = v13;
    v30 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v30)
      return result;
    *(_DWORD *)buf = 67109120;
    v63 = v29;
    v23 = MEMORY[0x1E0C81028];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_EnableIO/0 (status = 0x%x)";
    goto LABEL_37;
  }
  v14 = AudioUnitSetProperty(*p_audioComponentInst, 8u, 1u, 0, v48, 0x28u);
  if (v14)
  {
    v31 = v14;
    v32 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v32)
      return result;
    *(_DWORD *)buf = 67109120;
    v63 = v31;
    v23 = MEMORY[0x1E0C81028];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioUnitProperty_StreamFormat/kAudioUnitScope_Input (status = 0x%x)";
    goto LABEL_37;
  }
  v45 = 0;
  v15 = AudioUnitSetProperty(*p_audioComponentInst, 0x33u, 2u, 1u, &v45, 4u);
  if (v15)
  {
    v33 = v15;
    v34 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v34)
      return result;
    *(_DWORD *)buf = 67109120;
    v63 = v33;
    v23 = MEMORY[0x1E0C81028];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioUnitProperty_ShouldAllocateBuffer (status = 0x%x)";
    goto LABEL_37;
  }
  v16 = AudioUnitSetProperty(*p_audioComponentInst, 8u, 2u, 1u, v54, 0x28u);
  if (v16)
  {
    v35 = v16;
    v36 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v36)
      return result;
    *(_DWORD *)buf = 67109120;
    v63 = v35;
    v23 = MEMORY[0x1E0C81028];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioUnitProperty_StreamFormat/kAudioUnitScope_Output (status = 0x%x)";
    goto LABEL_37;
  }
  v60 = recordCallback;
  v61 = self;
  v17 = AudioUnitSetProperty(self->_audioComponentInst, 0x7D5u, 0, 1u, &v60, 0x10u);
  if (v17)
  {
    v37 = v17;
    v38 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v38)
      return result;
    *(_DWORD *)buf = 67109120;
    v63 = v37;
    v23 = MEMORY[0x1E0C81028];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_SetInputCallback (status = 0x%x)";
    goto LABEL_37;
  }
  v60 = playbackCallback;
  v61 = self;
  v18 = AudioUnitSetProperty(self->_audioComponentInst, 0x17u, 0, 0, &v60, 0x10u);
  if (v18)
  {
    v39 = v18;
    v40 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v40)
      return result;
    *(_DWORD *)buf = 67109120;
    v63 = v39;
    v23 = MEMORY[0x1E0C81028];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_SetRenderCallback (status = 0x%x)";
    goto LABEL_37;
  }
  v19 = AudioUnitInitialize(*p_audioComponentInst);
  if (v19)
  {
    v41 = v19;
    v42 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v42)
      return result;
    *(_DWORD *)buf = 67109120;
    v63 = v41;
    v23 = MEMORY[0x1E0C81028];
    v24 = "HalogenAudio:AudioUnitInitialize() failed (status = 0x%x)";
LABEL_37:
    v26 = 8;
    goto LABEL_38;
  }
  v20 = AudioOutputUnitStart(*p_audioComponentInst);
  if (!v20)
    return 1;
  v43 = v20;
  v44 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v44)
  {
    *(_DWORD *)buf = 67109120;
    v63 = v43;
    v23 = MEMORY[0x1E0C81028];
    v24 = "HalogenAudio:AudioUnitStart() failed (status = 0x%x)";
    goto LABEL_37;
  }
  return result;
}

- (BOOL)stopAudioUnit
{
  OSStatus v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = AudioOutputUnitStop(self->_audioComponentInst);
  if (v2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v2;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenAudio:AudioUnitStop() failed (status = 0x%x)", (uint8_t *)v4, 8u);
  }
  return v2 == 0;
}

- (OpaqueAudioComponentInstance)getAudioComponentInstance
{
  return self->_audioComponentInst;
}

- (HalogenAudioDelegate)halogenUnitDelegate
{
  return self->_halogenUnitDelegate;
}

- (void)setHalogenUnitDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (OpaqueAudioComponentInstance)audioComponentInst
{
  return self->_audioComponentInst;
}

- (void)setAudioComponentInst:(OpaqueAudioComponentInstance *)a3
{
  self->_audioComponentInst = a3;
}

- (int)nInputChannels
{
  return self->_nInputChannels;
}

- (void)setNInputChannels:(int)a3
{
  self->_nInputChannels = a3;
}

- (int)nOutputChannels
{
  return self->_nOutputChannels;
}

- (void)setNOutputChannels:(int)a3
{
  self->_nOutputChannels = a3;
}

- (int)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(int)a3
{
  self->_sampleRate = a3;
}

- (int)bitDepth
{
  return self->_bitDepth;
}

- (void)setBitDepth:(int)a3
{
  self->_bitDepth = a3;
}

- (int)inputFrameSizeInBytes
{
  return self->_inputFrameSizeInBytes;
}

- (void)setInputFrameSizeInBytes:(int)a3
{
  self->_inputFrameSizeInBytes = a3;
}

- (int)outputFrameSizeInBytes
{
  return self->_outputFrameSizeInBytes;
}

- (void)setOutputFrameSizeInBytes:(int)a3
{
  self->_outputFrameSizeInBytes = a3;
}

@end
