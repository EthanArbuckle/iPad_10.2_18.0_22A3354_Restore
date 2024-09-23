@implementation DAPlayAndRecord

- (DAPlayAndRecord)initWithFileURL:(id)a3 fileName:(id)a4 numberOfInputs:(id)a5 inputID:(int64_t)a6 outputID:(int64_t)a7 volume:(id)a8 channel:(id)a9 sendRawData:(BOOL)a10 delegate:(id)a11 sequentialAudioInput:(BOOL)a12 error:(id *)a13
{
  const __CFURL *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  DAPlayAndRecord *v25;
  AudioFileID *p_isa;
  DAPlayAndRecord *v27;
  objc_super v29;

  v19 = (const __CFURL *)a3;
  v20 = a4;
  v21 = a5;
  v22 = a8;
  v23 = a9;
  v24 = a11;
  v29.receiver = self;
  v29.super_class = (Class)DAPlayAndRecord;
  v25 = -[DAPlayAndRecord init](&v29, "init");
  p_isa = &v25->super.isa;
  if (!v25)
    goto LABEL_8;
  -[DAPlayAndRecord setError:](v25, "setError:", a13);
  -[AudioFileID setFileName:](p_isa, "setFileName:", v20);
  -[AudioFileID setFileURL:](p_isa, "setFileURL:", v19);
  -[AudioFileID setDelegate:](p_isa, "setDelegate:", v24);
  -[AudioFileID setNumInputs:](p_isa, "setNumInputs:", v21);
  -[AudioFileID setInputID:](p_isa, "setInputID:", a6);
  -[AudioFileID setOutputID:](p_isa, "setOutputID:", a7);
  -[AudioFileID setSendRawData:](p_isa, "setSendRawData:", a10);
  -[AudioFileID setSequentialAudioInput:](p_isa, "setSequentialAudioInput:", a12);
  -[AudioFileID setVolume:](p_isa, "setVolume:", v22);
  -[AudioFileID setChannel:](p_isa, "setChannel:", v23);
  -[AudioFileID setVolumeNeedsReset:](p_isa, "setVolumeNeedsReset:", 0);
  if (!AudioFileOpenURL(v19, kAudioFileReadPermission, 0x57415645u, p_isa + 8))
  {
    if (-[AudioFileID calculateFileDurationForFile:error:](p_isa, "calculateFileDurationForFile:error:", p_isa[8], -[AudioFileID error](p_isa, "error")))goto LABEL_5;
    if (-[AudioFileID createAUGraphWithError:](p_isa, "createAUGraphWithError:", -[AudioFileID error](p_isa, "error")))
    {
      v27 = 0;
      goto LABEL_9;
    }
LABEL_8:
    v27 = p_isa;
    goto LABEL_9;
  }
  +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -9, -[AudioFileID error](p_isa, "error"));
LABEL_5:
  v27 = 0;
LABEL_9:

  return v27;
}

- (int)startAudioTestCase
{
  float v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t i;
  float v8;
  void *v9;
  signed int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;
  void *v19;
  signed int v20;
  OSStatus v21;
  OSStatus Property;
  int v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  unsigned __int8 v31;
  DAPlayAndRecord *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  id v36;
  int64_t v37;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  _DWORD v44[11];
  uint64_t inData;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  UInt32 ioDataSize;
  uint64_t outPropertyData;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  int64_t v60;

  -[DAPlayAndRecord fileTimeInFrames](self, "fileTimeInFrames");
  self->sourceSignal = (float *)malloc_type_malloc(vcvts_n_u32_f32(v3, 2uLL), 0xE582BCD0uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs"));
  self->receiveSignals = (float **)malloc_type_malloc(8 * (int)objc_msgSend(v4, "intValue"), 0x80040B8603338uLL);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs"));
  v6 = objc_msgSend(v5, "intValue");

  if (v6 >= 1)
  {
    for (i = 0; i < v10; ++i)
    {
      -[DAPlayAndRecord fileTimeInFrames](self, "fileTimeInFrames");
      self->receiveSignals[i] = (float *)malloc_type_malloc(vcvts_n_u32_f32(v8, 2uLL), 0xE14B5C75uLL);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs"));
      v10 = objc_msgSend(v9, "intValue");

    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs"));
  self->recordBufferList = (AudioBufferList *)malloc_type_malloc(16 * (int)(objc_msgSend(v11, "intValue") - 1) + 24, 0x5FBF3A37uLL);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs"));
  self->recordBufferList->mNumberBuffers = objc_msgSend(v12, "unsignedIntValue");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs"));
  v14 = objc_msgSend(v13, "intValue");

  if (v14 >= 1)
  {
    v15 = 0;
    v16 = 0;
    do
    {
      v17 = malloc_type_malloc(0x1000uLL, 0xEE1632AEuLL);
      v18 = (char *)self->recordBufferList + v15;
      *((_DWORD *)v18 + 2) = 1;
      *((_DWORD *)v18 + 3) = 4096;
      *((_QWORD *)v18 + 2) = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs"));
      ++v16;
      v20 = objc_msgSend(v19, "intValue");

      v15 += 16;
    }
    while (v16 < v20);
  }
  v21 = AudioUnitReset(self->generatorUnit, 0, 0);
  if (!v21)
  {
    outPropertyData = 0;
    ioDataSize = 8;
    Property = AudioFileGetProperty(self->testSignalFile, 0x70636E74u, &ioDataSize, &outPropertyData);
    if (Property)
    {
      +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -43, -[DAPlayAndRecord error](self, "error"));
      return Property;
    }
    v49 = 1;
    v51 = 0u;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v48 = 0u;
    v47 = 0u;
    v46 = 0u;
    inData = 0;
    v50 = 0;
    *(_QWORD *)&v51 = 0;
    *((_QWORD *)&v51 + 1) = self->testSignalFile;
    v23 = outPropertyData;
    +[DAAudioUnitHelper getBasicStreamDescription](DAAudioUnitHelper, "getBasicStreamDescription");
    LODWORD(v54) = v44[6] * v23;
    Property = AudioUnitSetProperty(self->generatorUnit, 0xCEFu, 0, 0, &inData, 0x70u);
    if (Property)
    {
      +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -44, -[DAPlayAndRecord error](self, "error"));
      return Property;
    }
    v44[0] = 0;
    Property = AudioUnitSetProperty(self->generatorUnit, 0xCF0u, 0, 0, v44, 4u);
    if (Property)
    {
      +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -45, -[DAPlayAndRecord error](self, "error"));
      return Property;
    }
    v42 = 0u;
    v41 = 0u;
    v40 = 0u;
    v43 = 1;
    v39 = 0xBFF0000000000000;
    Property = AudioUnitSetProperty(self->generatorUnit, 0xCE5u, 0, 0, &v39, 0x40u);
    if (Property)
    {
      +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -46, -[DAPlayAndRecord error](self, "error"));
      return Property;
    }
    -[DAPlayAndRecord setPlayFrameCount:](self, "setPlayFrameCount:", 0);
    -[DAPlayAndRecord setRecordFrameCount:](self, "setRecordFrameCount:", 0);
    if (-[DAPlayAndRecord outputID](self, "outputID"))
    {
      if ((id)-[DAPlayAndRecord outputID](self, "outputID") == (id)1)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
        v25 = objc_msgSend(v24, "overrideOutputAudioPort:error:", 1936747378, -[DAPlayAndRecord error](self, "error"));

        if ((v25 & 1) == 0)
        {
          +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -48, -[DAPlayAndRecord error](self, "error"));
          return 0;
        }
      }
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
      v27 = objc_msgSend(v26, "overrideOutputAudioPort:error:", 0, -[DAPlayAndRecord error](self, "error"));

      if ((v27 & 1) == 0)
      {
        +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -47, -[DAPlayAndRecord error](self, "error"));
        return 0;
      }
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    if (-[DAPlayAndRecord outputID](self, "outputID"))
      v29 = CFSTR("Audio/Video");
    else
      v29 = CFSTR("PlayAndRecord");
    objc_msgSend(v28, "getVolume:forCategory:", &self->previousDeviceVolume, v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord volume](self, "volume"));
    objc_msgSend(v30, "floatValue");
    v31 = -[DAPlayAndRecord setDeviceVolume:](self, "setDeviceVolume:");

    if ((v31 & 1) != 0)
    {
      v32 = self;
      objc_sync_enter(v32);
      -[DAPlayAndRecord setVolumeNeedsReset:](v32, "setVolumeNeedsReset:", 1);
      if (!-[DAPlayAndRecord isCancelled](v32, "isCancelled"))
      {
        v33 = DiagnosticLogHandleForCategory(3);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord fileURL](v32, "fileURL"));
          v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "lastPathComponent"));
          v37 = -[DAPlayAndRecord outputID](v32, "outputID");
          *(_DWORD *)buf = 138412546;
          v58 = v36;
          v59 = 2048;
          v60 = v37;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Beginning %@ (outputID = %ld).", buf, 0x16u);

        }
        Property = AUGraphStart(v32->testCaseGraph);
        if (Property)
        {
          +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", 2, -[DAPlayAndRecord error](v32, "error"));
          objc_sync_exit(v32);

          return Property;
        }
      }
      objc_sync_exit(v32);

    }
    else
    {
      +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -51, -[DAPlayAndRecord error](self, "error"));
    }
    return 0;
  }
  Property = v21;
  +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -43, -[DAPlayAndRecord error](self, "error"));
  return Property;
}

- (void)endAudioTestCase
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int64_t v14;

  AUGraphStop(self->testCaseGraph);
  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord fileURL](self, "fileURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v11 = 138412546;
    v12 = v6;
    v13 = 2048;
    v14 = -[DAPlayAndRecord outputID](self, "outputID");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Ended %@ (outputID = %ld).", (uint8_t *)&v11, 0x16u);

  }
  -[DAPlayAndRecord resetToPreviousVolume](self, "resetToPreviousVolume");
  v7 = objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord makeSignalsDataObjects](self, "makeSignalsDataObjects"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v7));
  -[DAPlayAndRecord setResults:](self, "setResults:", v8);

  -[DAPlayAndRecord sendRawData](self, "sendRawData");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord delegate](self, "delegate"));
  LOBYTE(v7) = objc_opt_respondsToSelector(v9, "playAndRecordFinished");

  if ((v7 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord delegate](self, "delegate"));
    objc_msgSend(v10, "playAndRecordFinished");

  }
}

- (void)cancel
{
  DAPlayAndRecord *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  int64_t v10;

  v2 = self;
  objc_sync_enter(v2);
  -[DAPlayAndRecord setIsCancelled:](v2, "setIsCancelled:", 1);
  AUGraphStop(v2->testCaseGraph);
  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord fileURL](v2, "fileURL"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = 138412546;
    v8 = v6;
    v9 = 2048;
    v10 = -[DAPlayAndRecord outputID](v2, "outputID");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Cancelled %@ (outputID = %ld).", (uint8_t *)&v7, 0x16u);

  }
  objc_sync_exit(v2);

  -[DAPlayAndRecord resetToPreviousVolume](v2, "resetToPreviousVolume");
}

- (void)resetToPreviousVolume
{
  double v2;
  DAPlayAndRecord *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[DAPlayAndRecord volumeNeedsReset](obj, "volumeNeedsReset"))
  {
    *(float *)&v2 = obj->previousDeviceVolume;
    -[DAPlayAndRecord setDeviceVolume:](obj, "setDeviceVolume:", v2);
    -[DAPlayAndRecord setVolumeNeedsReset:](obj, "setVolumeNeedsReset:", 0);
  }
  objc_sync_exit(obj);

}

- (BOOL)setDeviceVolume:(float)a3
{
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int64_t v11;
  void *v12;
  double v13;
  unsigned __int8 v14;
  float v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;

  v16 = 0.0;
  v5 = -[DAPlayAndRecord outputID](self, "outputID");
  v6 = CFSTR("Audio/Video");
  if (!v5)
    v6 = CFSTR("PlayAndRecord");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  objc_msgSend(v8, "getVolume:forCategory:", &v16, v7);

  v9 = DiagnosticLogHandleForCategory(3);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = -[DAPlayAndRecord outputID](self, "outputID");
    *(_DWORD *)buf = 138413058;
    v18 = v7;
    v19 = 2048;
    v20 = v11;
    v21 = 2048;
    v22 = v16;
    v23 = 2048;
    v24 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Changing %@ Volume (outputID = %ld): %f -> %f", buf, 0x2Au);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  *(float *)&v13 = a3;
  v14 = objc_msgSend(v12, "setVolumeTo:forCategory:", v7, v13);

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  free(self->recordBufferList);
  v3.receiver = self;
  v3.super_class = (Class)DAPlayAndRecord;
  -[DAPlayAndRecord dealloc](&v3, "dealloc");
}

- (void)grabPlayBackFrameData:(AudioBufferList *)a3 withNumberOfFrames:(unsigned int)a4
{
  float v7;
  float v8;
  void *v9;
  unsigned int v10;
  UInt32 mNumberBuffers;
  float *sourceSignal;
  float *v13;
  void *v14;

  v7 = (float)-[DAPlayAndRecord playFrameCount](self, "playFrameCount");
  -[DAPlayAndRecord fileTimeInFrames](self, "fileTimeInFrames");
  if (v8 >= v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord channel](self, "channel"));
    v10 = objc_msgSend(v9, "intValue");
    mNumberBuffers = a3->mNumberBuffers;

    if (v10 < mNumberBuffers)
    {
      sourceSignal = self->sourceSignal;
      v13 = &sourceSignal[-[DAPlayAndRecord playFrameCount](self, "playFrameCount")];
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord channel](self, "channel"));
      memcpy(v13, a3->mBuffers[(int)objc_msgSend(v14, "intValue")].mData, 4 * a4);

      -[DAPlayAndRecord setPlayFrameCount:](self, "setPlayFrameCount:", -[DAPlayAndRecord playFrameCount](self, "playFrameCount") + a4);
    }
  }
}

- (void)grabRecordedFrameData:(AudioBufferList *)a3 withNumberOfFrames:(unsigned int)a4
{
  float v7;
  float v8;
  void *v9;
  unsigned int v10;
  UInt32 mNumberBuffers;
  float v12;
  float v13;
  void *v14;
  int v15;
  uint64_t v16;
  void **p_mData;
  float *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  signed int v22;

  v7 = (float)(-[DAPlayAndRecord recordFrameCount](self, "recordFrameCount") + a4);
  -[DAPlayAndRecord fileTimeInFrames](self, "fileTimeInFrames");
  if (v8 >= v7
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs")),
        v10 = objc_msgSend(v9, "intValue"),
        mNumberBuffers = a3->mNumberBuffers,
        v9,
        v10 <= mNumberBuffers))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs"));
    v15 = objc_msgSend(v14, "intValue");

    if (v15 >= 1)
    {
      v16 = 0;
      p_mData = &a3->mBuffers[0].mData;
      do
      {
        v18 = self->receiveSignals[v16];
        v19 = -[DAPlayAndRecord recordFrameCount](self, "recordFrameCount");
        v20 = *p_mData;
        p_mData += 2;
        memcpy(&v18[v19], v20, 4 * a4);
        ++v16;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs"));
        v22 = objc_msgSend(v21, "intValue");

      }
      while (v16 < v22);
    }
  }
  else
  {
    v12 = (float)-[DAPlayAndRecord recordFrameCount](self, "recordFrameCount");
    -[DAPlayAndRecord fileTimeInFrames](self, "fileTimeInFrames");
    if ((float)(v13 + 16384.0) <= v12)
      -[DAPlayAndRecord endAudioTestCase](self, "endAudioTestCase");
  }
  -[DAPlayAndRecord setRecordFrameCount:](self, "setRecordFrameCount:", -[DAPlayAndRecord recordFrameCount](self, "recordFrameCount") + a4);
}

- (int)createAUGraphWithError:(id *)a3
{
  OpaqueAUGraph **p_testCaseGraph;
  OSStatus v6;
  OSStatus v7;
  uint64_t v8;
  void *v10;
  OSStatus v11;
  OSStatus v12;
  OSStatus v13;
  OSStatus v14;
  OSStatus v15;
  OpaqueAudioComponentInstance **p_remoteIOUnit;
  OSStatus v17;
  OSStatus v18;
  OSStatus v19;
  OSStatus v20;
  OSStatus v21;
  OSStatus v22;
  OSStatus v23;
  OSStatus v24;
  OSStatus v25;
  OSStatus v26;
  OSStatus v27;
  OSStatus v28;
  OSStatus v29;
  OSStatus v30;
  OSStatus v31;
  OSStatus v32;
  OSStatus v33;
  OSStatus v34;
  OSStatus v35;
  OSStatus v36;
  OSStatus v37;
  OSStatus v38;
  OSStatus v39;
  int inData;
  AudioComponentDescription v41;
  AudioComponentDescription v42;
  AudioComponentDescription inDescription;
  AudioComponentDescription outDescription;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  AUNode v48;
  AUNode v49[2];
  AUNode outNode[2];
  AudioUnit v51;
  AudioUnit v52;
  AudioUnit outAudioUnit;

  p_testCaseGraph = &self->testCaseGraph;
  v6 = NewAUGraph(&self->testCaseGraph);
  if (v6 || (v6 = AUGraphOpen(*p_testCaseGraph)) != 0)
  {
    v7 = v6;
    v8 = -11;
  }
  else
  {
    v52 = 0;
    outAudioUnit = 0;
    v51 = 0;
    *(_QWORD *)v49 = 0;
    *(_QWORD *)outNode = 0;
    v48 = 0;
    v47 = 0;
    v45 = 0u;
    v46 = 0u;
    +[DAAudioUnitHelper getBasicStreamDescription](DAAudioUnitHelper, "getBasicStreamDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs"));
    HIDWORD(v46) = objc_msgSend(v10, "unsignedIntValue");

    memset(&outDescription, 0, sizeof(outDescription));
    +[DAAudioUnitHelper getGeneratorDescription](DAAudioUnitHelper, "getGeneratorDescription");
    memset(&inDescription, 0, sizeof(inDescription));
    +[DAAudioUnitHelper getRemoteIODescription](DAAudioUnitHelper, "getRemoteIODescription");
    memset(&v42, 0, sizeof(v42));
    +[DAAudioUnitHelper getBandPassDescription](DAAudioUnitHelper, "getBandPassDescription");
    memset(&v41, 0, sizeof(v41));
    +[DAAudioUnitHelper getMixerDescription](DAAudioUnitHelper, "getMixerDescription");
    v11 = AUGraphAddNode(self->testCaseGraph, &inDescription, &outNode[1]);
    if (v11)
    {
      v7 = v11;
      v8 = -13;
    }
    else
    {
      v12 = AUGraphAddNode(*p_testCaseGraph, &outDescription, outNode);
      if (v12)
      {
        v7 = v12;
        v8 = -14;
      }
      else
      {
        v13 = AUGraphAddNode(*p_testCaseGraph, &v42, &v49[1]);
        if (v13)
        {
          v7 = v13;
          v8 = -15;
        }
        else
        {
          v14 = AUGraphAddNode(*p_testCaseGraph, &v42, v49);
          if (v14)
          {
            v7 = v14;
            v8 = -16;
          }
          else
          {
            v15 = AUGraphAddNode(*p_testCaseGraph, &v41, &v48);
            if (v15)
            {
              v7 = v15;
              v8 = -17;
            }
            else
            {
              p_remoteIOUnit = &self->remoteIOUnit;
              v17 = AUGraphNodeInfo(self->testCaseGraph, outNode[1], &inDescription, &self->remoteIOUnit);
              if (v17)
              {
                v7 = v17;
                v8 = -18;
              }
              else
              {
                v18 = AUGraphNodeInfo(self->testCaseGraph, outNode[0], &outDescription, &self->generatorUnit);
                if (v18)
                {
                  v7 = v18;
                  v8 = -19;
                }
                else
                {
                  v19 = AUGraphNodeInfo(*p_testCaseGraph, v49[1], &v42, &outAudioUnit);
                  if (v19)
                  {
                    v7 = v19;
                    v8 = -20;
                  }
                  else
                  {
                    v20 = AUGraphNodeInfo(*p_testCaseGraph, v49[0], &v42, &v52);
                    if (v20)
                    {
                      v7 = v20;
                      v8 = -21;
                    }
                    else
                    {
                      v21 = AUGraphNodeInfo(*p_testCaseGraph, v48, &v41, &v51);
                      if (v21)
                      {
                        v7 = v21;
                        v8 = -22;
                      }
                      else
                      {
                        inData = 1;
                        v22 = AudioUnitSetProperty(*p_remoteIOUnit, 0x7D3u, 1u, 1u, &inData, 4u);
                        if (v22)
                        {
                          v7 = v22;
                          v8 = -23;
                        }
                        else
                        {
                          v23 = AudioUnitSetProperty(*p_remoteIOUnit, 8u, 1u, 0, &v45, 0x28u);
                          if (v23)
                          {
                            v7 = v23;
                            v8 = -24;
                          }
                          else
                          {
                            v24 = AudioUnitSetProperty(*p_remoteIOUnit, 8u, 2u, 1u, &v45, 0x28u);
                            if (v24)
                            {
                              v7 = v24;
                              v8 = -25;
                            }
                            else
                            {
                              v25 = AudioUnitSetProperty(self->generatorUnit, 0xCEEu, 0, 0, &self->testSignalFile, 8u);
                              if (v25)
                              {
                                v7 = v25;
                                v8 = -26;
                              }
                              else
                              {
                                v26 = AudioUnitSetParameter(outAudioUnit, 0, 0, 0, 2000.0, 0);
                                if (v26)
                                {
                                  v7 = v26;
                                  v8 = -27;
                                }
                                else
                                {
                                  v27 = AudioUnitSetParameter(outAudioUnit, 1u, 0, 0, 4800.0, 0);
                                  if (v27)
                                  {
                                    v7 = v27;
                                    v8 = -28;
                                  }
                                  else
                                  {
                                    v28 = AudioUnitSetParameter(v52, 0, 0, 0, 2000.0, 0);
                                    if (v28)
                                    {
                                      v7 = v28;
                                      v8 = -29;
                                    }
                                    else
                                    {
                                      v29 = AudioUnitSetParameter(v52, 1u, 0, 0, 4800.0, 0);
                                      if (v29)
                                      {
                                        v7 = v29;
                                        v8 = -30;
                                      }
                                      else
                                      {
                                        v30 = AudioUnitSetProperty(v52, 8u, 1u, 0, &v45, 0x28u);
                                        if (v30)
                                        {
                                          v7 = v30;
                                          v8 = -31;
                                        }
                                        else
                                        {
                                          v31 = AudioUnitSetProperty(v52, 8u, 2u, 0, &v45, 0x28u);
                                          if (v31)
                                          {
                                            v7 = v31;
                                            v8 = -32;
                                          }
                                          else
                                          {
                                            v32 = AudioUnitSetParameter(v51, 1u, 1u, 2u, 0.0, 0);
                                            if (v32)
                                            {
                                              v7 = v32;
                                              v8 = -33;
                                            }
                                            else
                                            {
                                              v33 = AUGraphConnectNodeInput(*p_testCaseGraph, outNode[0], 0, v48, 1u);
                                              if (v33)
                                              {
                                                v7 = v33;
                                                v8 = -34;
                                              }
                                              else
                                              {
                                                v34 = AUGraphConnectNodeInput(*p_testCaseGraph, outNode[1], 1u, v49[0], 0);
                                                if (v34)
                                                {
                                                  v7 = v34;
                                                  v8 = -35;
                                                }
                                                else
                                                {
                                                  v35 = AUGraphConnectNodeInput(*p_testCaseGraph, v49[0], 0, v48, 2u);
                                                  if (v35)
                                                  {
                                                    v7 = v35;
                                                    v8 = -36;
                                                  }
                                                  else
                                                  {
                                                    v36 = AUGraphConnectNodeInput(*p_testCaseGraph, v48, 0, outNode[1], 0);
                                                    if (v36)
                                                    {
                                                      v7 = v36;
                                                      v8 = -37;
                                                    }
                                                    else
                                                    {
                                                      self->recordCallBack.inputProc = (AURenderCallback)sub_1000084E8;
                                                      self->recordCallBack.inputProcRefCon = self;
                                                      v37 = AudioUnitSetProperty(self->remoteIOUnit, 0x7D5u, 0, 1u, &self->recordCallBack, 0x10u);
                                                      if (v37)
                                                      {
                                                        v7 = v37;
                                                        v8 = -38;
                                                      }
                                                      else
                                                      {
                                                        self->recordBPCallBack.inputProc = (AURenderCallback)sub_1000084FC;
                                                        self->recordBPCallBack.inputProcRefCon = self;
                                                        v38 = AudioUnitAddRenderNotify(v52, (AURenderCallback)sub_1000084FC, self);
                                                        if (v38)
                                                        {
                                                          v7 = v38;
                                                          v8 = -39;
                                                        }
                                                        else
                                                        {
                                                          self->playCallBack.inputProc = (AURenderCallback)sub_10000852C;
                                                          self->playCallBack.inputProcRefCon = self;
                                                          v39 = AudioUnitAddRenderNotify(self->generatorUnit, (AURenderCallback)sub_10000852C, self);
                                                          if (v39)
                                                          {
                                                            v7 = v39;
                                                            v8 = -40;
                                                          }
                                                          else
                                                          {
                                                            v7 = AUGraphInitialize(*p_testCaseGraph);
                                                            if (!v7)
                                                              return v7;
                                                            v8 = -41;
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", v8, a3);
  return v7;
}

- (id)makeSignalsDataObjects
{
  void *v3;
  DASignalData *v4;
  float *sourceSignal;
  float *v6;
  int v7;
  int v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  double v12;
  DASignalData *v13;
  void *v14;
  int v15;
  uint64_t v16;
  DASignalData *v17;
  float *v18;
  float *v19;
  int v20;
  int v21;
  int64_t v22;
  void *v23;
  double v24;
  DASignalData *v25;
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[DAPlayAndRecord sequentialAudioInput](self, "sequentialAudioInput"))
  {
    v4 = [DASignalData alloc];
    sourceSignal = self->sourceSignal;
    v6 = *self->receiveSignals;
    -[DAPlayAndRecord fileTimeInFrames](self, "fileTimeInFrames");
    v8 = v7;
    v9 = -[DAPlayAndRecord outputID](self, "outputID");
    v10 = -[DAPlayAndRecord inputID](self, "inputID");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord fileName](self, "fileName"));
    LODWORD(v12) = v8;
    v13 = -[DASignalData initWithSourceSignal:receivedSignal:minimumDelay:maximumDelay:fileTimeInFrames:outputID:inputID:fileName:](v4, "initWithSourceSignal:receivedSignal:minimumDelay:maximumDelay:fileTimeInFrames:outputID:inputID:fileName:", sourceSignal, v6, 1900, 3000, v9, v10, v12, v11);

    objc_msgSend(v3, "addObject:", v13);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs"));
    v15 = objc_msgSend(v14, "intValue");

    if (v15 >= 1)
    {
      v16 = 0;
      do
      {
        v17 = [DASignalData alloc];
        v18 = self->sourceSignal;
        v19 = self->receiveSignals[v16];
        -[DAPlayAndRecord fileTimeInFrames](self, "fileTimeInFrames");
        v21 = v20;
        v22 = -[DAPlayAndRecord outputID](self, "outputID");
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord fileName](self, "fileName"));
        LODWORD(v24) = v21;
        v25 = -[DASignalData initWithSourceSignal:receivedSignal:minimumDelay:maximumDelay:fileTimeInFrames:outputID:inputID:fileName:](v17, "initWithSourceSignal:receivedSignal:minimumDelay:maximumDelay:fileTimeInFrames:outputID:inputID:fileName:", v18, v19, 1900, 3000, v22, v16, v24, v23);

        objc_msgSend(v3, "addObject:", v25);
        ++v16;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[DAPlayAndRecord numInputs](self, "numInputs"));
        LODWORD(v18) = objc_msgSend(v26, "intValue");

      }
      while (v16 < (int)v18);
    }
  }
  free(self->receiveSignals);
  return v3;
}

- (int)calculateFileDurationForFile:(OpaqueAudioFileID *)a3 error:(id *)a4
{
  OSStatus Property;
  uint64_t v7;
  double v8;
  unsigned int v10;
  UInt32 ioDataSize;
  uint64_t outPropertyData;

  outPropertyData = 0;
  ioDataSize = 8;
  Property = AudioFileGetProperty(self->testSignalFile, 0x70636E74u, &ioDataSize, &outPropertyData);
  if (Property)
  {
    +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -10, a4);
  }
  else
  {
    v7 = outPropertyData;
    +[DAAudioUnitHelper getBasicStreamDescription](DAAudioUnitHelper, "getBasicStreamDescription");
    *(float *)&v8 = (float)(v7 * (unint64_t)v10);
    -[DAPlayAndRecord setFileTimeInFrames:](self, "setFileTimeInFrames:", v8);
  }
  return Property;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (DAAudioPlayAndRecordDelegate)delegate
{
  return (DAAudioPlayAndRecordDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (float)fileTimeInFrames
{
  return self->_fileTimeInFrames;
}

- (void)setFileTimeInFrames:(float)a3
{
  self->_fileTimeInFrames = a3;
}

- (unsigned)playFrameCount
{
  return self->_playFrameCount;
}

- (void)setPlayFrameCount:(unsigned int)a3
{
  self->_playFrameCount = a3;
}

- (unsigned)recordFrameCount
{
  return self->_recordFrameCount;
}

- (void)setRecordFrameCount:(unsigned int)a3
{
  self->_recordFrameCount = a3;
}

- (NSNumber)numInputs
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setNumInputs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (OpaqueExtAudioFile)recordedSoundFile
{
  return self->_recordedSoundFile;
}

- (void)setRecordedSoundFile:(OpaqueExtAudioFile *)a3
{
  self->_recordedSoundFile = a3;
}

- (int64_t)inputID
{
  return self->_inputID;
}

- (void)setInputID:(int64_t)a3
{
  self->_inputID = a3;
}

- (int64_t)outputID
{
  return self->_outputID;
}

- (void)setOutputID:(int64_t)a3
{
  self->_outputID = a3;
}

- (NSNumber)volume
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setVolume:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 200, 1);
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSNumber)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (BOOL)sendRawData
{
  return self->_sendRawData;
}

- (void)setSendRawData:(BOOL)a3
{
  self->_sendRawData = a3;
}

- (BOOL)sequentialAudioInput
{
  return self->_sequentialAudioInput;
}

- (void)setSequentialAudioInput:(BOOL)a3
{
  self->_sequentialAudioInput = a3;
}

- (id)error
{
  return self->_error;
}

- (void)setError:(id *)a3
{
  self->_error = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)volumeNeedsReset
{
  return self->_volumeNeedsReset;
}

- (void)setVolumeNeedsReset:(BOOL)a3
{
  self->_volumeNeedsReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_numInputs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
