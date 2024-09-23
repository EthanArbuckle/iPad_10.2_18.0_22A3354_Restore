@implementation CSAudioInjectionEngine

- (CSAudioInjectionEngine)initWithStreamHandleId:(unint64_t)a3
{
  return -[CSAudioInjectionEngine initWithStreamHandleId:withInputRecordingNumberOfChannels:](self, "initWithStreamHandleId:withInputRecordingNumberOfChannels:", a3, objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels"));
}

- (CSAudioInjectionEngine)initWithStreamHandleId:(unint64_t)a3 withInputRecordingNumberOfChannels:(unsigned int)a4
{
  CSAudioInjectionEngine *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  double v9;
  uint64_t v10;
  NSMutableArray *injectionAudioFileList;
  uint64_t v12;
  NSMutableArray *injectionStartNotifyBlocks;
  uint64_t v14;
  NSMutableArray *injectionCompletionNotifyBlocks;
  uint64_t v16;
  NSUUID *uuid;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CSAudioInjectionEngine;
  v6 = -[CSAudioInjectionEngine init](&v19, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("CSAudioInjectionEngine", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_audioStreamHandleId = a3;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
    v6->_bufferDuration = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    injectionAudioFileList = v6->_injectionAudioFileList;
    v6->_injectionAudioFileList = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    injectionStartNotifyBlocks = v6->_injectionStartNotifyBlocks;
    v6->_injectionStartNotifyBlocks = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    injectionCompletionNotifyBlocks = v6->_injectionCompletionNotifyBlocks;
    v6->_injectionCompletionNotifyBlocks = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = objc_claimAutoreleasedReturnValue();
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v16;

    v6->_didSetScaleFactor = 0;
    v6->_scaleFactor = 0.01;
    v6->_inputRecordingNumberOfChannels = a4;
  }
  return v6;
}

- (void)dealloc
{
  OpaqueAudioConverter *deinterleaver;
  AudioBufferList *pNonInterleavedABL;
  objc_super v5;

  deinterleaver = self->_deinterleaver;
  if (deinterleaver)
    AudioConverterDispose(deinterleaver);
  pNonInterleavedABL = self->_pNonInterleavedABL;
  if (pNonInterleavedABL)
  {
    free(pNonInterleavedABL);
    self->_pNonInterleavedABL = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CSAudioInjectionEngine;
  -[CSAudioInjectionEngine dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAlwaysOnVoiceTriggerAvailable
{
  return 0;
}

- (BOOL)alwaysOnVoiceTriggerEnabled
{
  return 0;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CSAudioInjectionEngine_start__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_createDeInterleaverIfNeeded
{
  OpaqueAudioConverter **p_deinterleaver;
  uint64_t v4;
  BOOL v5;
  OSStatus v6;
  os_log_t *v7;
  OSStatus v8;
  NSObject *v9;
  AudioBufferList *pNonInterleavedABL;
  AudioBufferList *v11;
  NSObject *v12;
  AudioStreamBasicDescription v13;
  AudioStreamBasicDescription inSourceFormat;
  unsigned int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  OSStatus v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  self->_deinterleaver = 0;
  p_deinterleaver = &self->_deinterleaver;
  objc_msgSend(MEMORY[0x1E0D190F8], "lpcmNonInterleavedASBD");
  v4 = v15;
  if (objc_msgSend(MEMORY[0x1E0D19260], "shouldDeinterleaveAudioOnCS"))
    v5 = v15 >= 2;
  else
    v5 = 0;
  if (v5)
  {
    memset(&inSourceFormat, 0, sizeof(inSourceFormat));
    objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInterleavedASBD");
    objc_msgSend(MEMORY[0x1E0D190F8], "lpcmNonInterleavedASBD", 0, 0, 0, 0, 0);
    v6 = AudioConverterNew(&inSourceFormat, &v13, p_deinterleaver);
    v7 = (os_log_t *)MEMORY[0x1E0D18F60];
    if (v6)
    {
      v8 = v6;
      v9 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSAudioInjectionEngine _createDeInterleaverIfNeeded]";
        v18 = 1026;
        v19 = v8;
        _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Cannot create de-interleaver using AudioConverterNew: %{public}d", buf, 0x12u);
      }
      *p_deinterleaver = 0;
    }
    pNonInterleavedABL = self->_pNonInterleavedABL;
    if (pNonInterleavedABL)
      free(pNonInterleavedABL);
    v11 = (AudioBufferList *)malloc_type_malloc(24 * v4, 0x10800404ACF7207uLL);
    self->_pNonInterleavedABL = v11;
    v11->mNumberBuffers = v4;
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSAudioInjectionEngine _createDeInterleaverIfNeeded]";
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Created de-interleaver", buf, 0xCu);
    }
  }
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CSAudioInjectionEngine_stop__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_startAudioFeedingTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *audioFeedTimer;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  audioFeedTimer = self->_audioFeedTimer;
  self->_audioFeedTimer = v3;

  dispatch_source_set_timer((dispatch_source_t)self->_audioFeedTimer, 0, (unint64_t)(self->_bufferDuration * 1000000000.0), 0x5F5E100uLL);
  objc_initWeak(&location, self);
  v5 = self->_audioFeedTimer;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CSAudioInjectionEngine__startAudioFeedingTimer__block_invoke;
  v6[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  dispatch_resume((dispatch_object_t)self->_audioFeedTimer);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_readAudioBufferAndFeed
{
  CSAudioInjectionFileOption *fileOption;
  double v4;
  CSAudioInjectionFileOption *v5;
  CSAudioInjectionFileOption *v6;
  unint64_t v7;
  double v8;
  CSAudioInjectionFileOption *v9;
  double v10;
  CSAudioInjectionFileOption *v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  double v15;
  id v16;
  void (**v17)(_QWORD, _QWORD);
  const __CFURL *v18;
  OSStatus v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  double bufferDuration;
  unint64_t v26;
  double v27;
  unint64_t v28;
  size_t v29;
  void *v30;
  id v31;
  void *v32;
  id WeakRetained;
  char v34;
  id v35;
  size_t v36;
  void *v37;
  CSAudioInjectionFileOption *v38;
  int v39;
  id v40;
  OSStatus v41;
  float v42;
  BOOL v43;
  int v44;
  void *v45;
  CSAudioInjectionFileOption *v46;
  uint64_t v47;
  NSObject *v48;
  CSAudioInjectionFileOption *v49;
  void (**v50)(_QWORD, _QWORD);
  uint64_t v51;
  void *v52;
  unint64_t v53;
  CSAudioInjectionFileOption *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t i;
  CSAudioInjectionFileOption *v60;
  unint64_t v61;
  BOOL v62;
  float scaleFactor;
  float v64;
  float v65;
  id v66;
  char v67;
  id v68;
  NSObject *v69;
  void *v70;
  unsigned int v71;
  id v72;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  double v77;
  ExtAudioFileRef outExtAudioFile;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  _BYTE buf[32];
  uint64_t v104;
  _BYTE inPropertyData[32];
  uint64_t v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  fileOption = self->_fileOption;
  if (!fileOption || !-[CSAudioInjectionFileOption fFile](fileOption, "fFile"))
  {
    if (-[NSMutableArray count](self->_injectionAudioFileList, "count"))
    {
      -[NSMutableArray objectAtIndex:](self->_injectionAudioFileList, "objectAtIndex:", 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      outExtAudioFile = 0;
      -[NSMutableArray objectAtIndex:](self->_injectionStartNotifyBlocks, "objectAtIndex:", 0);
      v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_injectionAudioFileList, "removeObjectAtIndex:", 0);
      -[NSMutableArray removeObjectAtIndex:](self->_injectionStartNotifyBlocks, "removeObjectAtIndex:", 0);
      objc_msgSend(v16, "audioURL");
      v18 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v19 = ExtAudioFileOpenURL(v18, &outExtAudioFile);

      if (v19)
      {
        v20 = (void *)*MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
        {
          v69 = v20;
          objc_msgSend(v16, "audioURL");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)inPropertyData = 136315650;
          *(_QWORD *)&inPropertyData[4] = "-[CSAudioInjectionEngine _readAudioBufferAndFeed]";
          *(_WORD *)&inPropertyData[12] = 2112;
          *(_QWORD *)&inPropertyData[14] = v70;
          *(_WORD *)&inPropertyData[22] = 1024;
          *(_DWORD *)&inPropertyData[24] = v19;
          _os_log_error_impl(&dword_1C2614000, v69, OS_LOG_TYPE_ERROR, "%s Failed to open audio file %@, error : %d", inPropertyData, 0x1Cu);

        }
      }
      v106 = 0;
      memset(inPropertyData, 0, sizeof(inPropertyData));
      if (v16)
        objc_msgSend(v16, "outASBD");
      ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, inPropertyData);
      *(_OWORD *)buf = *(_OWORD *)inPropertyData;
      *(_OWORD *)&buf[16] = *(_OWORD *)&inPropertyData[16];
      v104 = v106;
      objc_msgSend(v16, "setOutASBD:", buf);
      objc_msgSend(v16, "setFFile:", outExtAudioFile);
      -[CSAudioInjectionEngine setFileOption:](self, "setFileOption:", v16);
      v21 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        objc_msgSend(v16, "description");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[CSAudioInjectionEngine _readAudioBufferAndFeed]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v23;
        _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s Streaming from %@", buf, 0x16u);

      }
      v24 = mach_absolute_time();
      v17[2](v17, v24);
    }
    else
    {
      if (!self->_isRecording)
        return;
      bufferDuration = self->_bufferDuration;
      -[CSAudioInjectionEngine _defaultOutASBD](self, "_defaultOutASBD");
      -[CSAudioInjectionEngine _defaultOutASBD](self, "_defaultOutASBD");
      LODWORD(v26) = v76;
      v27 = bufferDuration * v77 * (double)v26;
      -[CSAudioInjectionEngine _defaultOutASBD](self, "_defaultOutASBD");
      LODWORD(v28) = v75;
      v29 = (unint64_t)(v27 * (double)v28);
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)inPropertyData = 1;
      -[CSAudioInjectionEngine _defaultOutASBD](self, "_defaultOutASBD");
      *(_DWORD *)&inPropertyData[8] = v74;
      *(_DWORD *)&inPropertyData[12] = v29;
      v31 = objc_retainAutorelease(v30);
      *(_QWORD *)&inPropertyData[16] = objc_msgSend(v31, "bytes");
      v16 = objc_retainAutorelease(v31);
      memset((void *)objc_msgSend(v16, "bytes"), 1, v29);
      -[CSAudioInjectionEngine _deinterleaveBufferIfNeeded:](self, "_deinterleaveBufferIfNeeded:", inPropertyData);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSAudioInjectionEngine _compensateChannelDataIfNeeded:receivedNumChannels:](self, "_compensateChannelDataIfNeeded:receivedNumChannels:", v32, 1);
      v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) != 0)
      {
        v35 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v35, "audioEngineBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:isFileLoadedBuffer:", self, -[CSAudioInjectionEngine audioStreamHandleId](self, "audioStreamHandleId"), v17, 0, mach_absolute_time(), 0);

      }
    }

    goto LABEL_70;
  }
  v4 = self->_bufferDuration;
  v5 = self->_fileOption;
  if (!v5)
  {
    v102 = 0;
    v100 = 0u;
    v101 = 0u;
    v10 = v4 * 0.0;
    v7 = (unint64_t)v10;
LABEL_23:
    v99 = 0;
    v97 = 0u;
    v98 = 0u;
    goto LABEL_24;
  }
  -[CSAudioInjectionFileOption outASBD](v5, "outASBD");
  v6 = self->_fileOption;
  v7 = (unint64_t)(v4 * *(double *)&v100);
  v8 = self->_bufferDuration;
  if (!v6)
  {
    v10 = v8 * 0.0;
    goto LABEL_23;
  }
  -[CSAudioInjectionFileOption outASBD](v6, "outASBD");
  v9 = self->_fileOption;
  v10 = v8 * *(double *)&v97;
  if (!v9)
  {
LABEL_24:
    v96 = 0;
    v94 = 0u;
    v95 = 0u;
    v13 = v10 * 0.0;
    goto LABEL_25;
  }
  -[CSAudioInjectionFileOption outASBD](v9, "outASBD");
  v11 = self->_fileOption;
  LODWORD(v12) = DWORD2(v95);
  v13 = v10 * (double)v12;
  if (!v11)
  {
LABEL_25:
    v93 = 0;
    v91 = 0u;
    v92 = 0u;
    v15 = 0.0;
    goto LABEL_26;
  }
  -[CSAudioInjectionFileOption outASBD](v11, "outASBD");
  LODWORD(v14) = HIDWORD(v92);
  v15 = (double)v14;
LABEL_26:
  v36 = (unint64_t)(v13 * v15);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)inPropertyData = 1;
  v38 = self->_fileOption;
  if (v38)
  {
    -[CSAudioInjectionFileOption outASBD](v38, "outASBD");
    v39 = HIDWORD(v89);
  }
  else
  {
    v39 = 0;
    v90 = 0;
    v88 = 0u;
    v89 = 0u;
  }
  *(_DWORD *)&inPropertyData[8] = v39;
  *(_DWORD *)&inPropertyData[12] = v36;
  v40 = objc_retainAutorelease(v37);
  *(_QWORD *)&inPropertyData[16] = objc_msgSend(v40, "bytes");
  v16 = objc_retainAutorelease(v40);
  memset((void *)objc_msgSend(v16, "bytes"), 1, v36);
  LODWORD(outExtAudioFile) = v36;
  v41 = ExtAudioFileRead(-[CSAudioInjectionFileOption fFile](self->_fileOption, "fFile"), (UInt32 *)&outExtAudioFile, (AudioBufferList *)inPropertyData);
  if (!self->_didSetScaleFactor)
  {
    -[CSAudioInjectionFileOption scaleFactor](self->_fileOption, "scaleFactor");
    self->_scaleFactor = v42;
    self->_didSetScaleFactor = 1;
  }
  if (v41)
    v43 = 0;
  else
    v43 = v7 == outExtAudioFile;
  v44 = v43;
  if (v41 || !(_DWORD)outExtAudioFile)
  {
    if (v41)
    {
      v48 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[CSAudioInjectionEngine _readAudioBufferAndFeed]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v41;
        _os_log_error_impl(&dword_1C2614000, v48, OS_LOG_TYPE_ERROR, "%s ::: Error reading data from audio file : %d", buf, 0x12u);
      }
    }
    ExtAudioFileDispose(-[CSAudioInjectionFileOption fFile](self->_fileOption, "fFile"));
    -[CSAudioInjectionFileOption setFFile:](self->_fileOption, "setFFile:", 0);
    v49 = self->_fileOption;
    self->_fileOption = 0;

    -[NSMutableArray objectAtIndex:](self->_injectionCompletionNotifyBlocks, "objectAtIndex:", 0);
    v50 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_injectionCompletionNotifyBlocks, "removeObjectAtIndex:", 0);
    self->_didSetScaleFactor = 0;
    self->_scaleFactor = 0.01;
    v51 = mach_absolute_time();
    v50[2](v50, v51);
LABEL_69:

    goto LABEL_70;
  }
  if (self->_isRecording)
  {
    -[CSAudioInjectionEngine _deinterleaveBufferIfNeeded:](self, "_deinterleaveBufferIfNeeded:", inPropertyData);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = self->_fileOption;
    if (v46)
    {
      -[CSAudioInjectionFileOption outASBD](v46, "outASBD");
      v47 = HIDWORD(v86);
    }
    else
    {
      v47 = 0;
      v87 = 0;
      v85 = 0u;
      v86 = 0u;
    }
    -[CSAudioInjectionEngine _compensateChannelDataIfNeeded:receivedNumChannels:](self, "_compensateChannelDataIfNeeded:receivedNumChannels:", v45, v47);
    v50 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithData:", v50);
    v53 = objc_msgSend(v50, "length");
    v54 = self->_fileOption;
    v71 = v44;
    v72 = v52;
    if (v54)
    {
      -[CSAudioInjectionFileOption outASBD](v54, "outASBD");
      v55 = HIDWORD(v83);
    }
    else
    {
      v55 = 0;
      v84 = 0;
      v82 = 0u;
      v83 = 0u;
    }
    if (self->_scaleFactor < 1.0)
    {
      v73 = objc_msgSend(objc_retainAutorelease(v52), "bytes");
      if (v53 >> 1 >= v55)
      {
        v56 = 0;
        v57 = (v53 >> 1) / v55;
        while (1)
        {
          v58 = 0;
          do
          {
            for (i = 0; ; ++i)
            {
              v60 = self->_fileOption;
              if (v60)
              {
                -[CSAudioInjectionFileOption outASBD](v60, "outASBD");
                v61 = HIDWORD(v80);
              }
              else
              {
                v61 = 0;
                v81 = 0;
                v79 = 0u;
                v80 = 0u;
              }
              if (i >= v61)
                break;
              *(_WORD *)(v73 + 2 * v56 + 2 * v58 + 2 * i * v57) = (int)(float)(self->_scaleFactor
                                                                             * (float)*(__int16 *)(v73
                                                                                                 + 2 * v56
                                                                                                 + 2 * v58
                                                                                                 + 2 * i * v57));
            }
            v62 = v58 >= 6;
            v58 += 2;
          }
          while (!v62);
          scaleFactor = self->_scaleFactor;
          -[CSAudioInjectionFileOption scaleFactor](self->_fileOption, "scaleFactor");
          if ((float)(scaleFactor + v64) >= 1.0)
            break;
          -[CSAudioInjectionFileOption scaleFactor](self->_fileOption, "scaleFactor");
          self->_scaleFactor = v65 + self->_scaleFactor;
          v56 += 16;
          if (v56 >= v57)
            goto LABEL_66;
        }
        self->_scaleFactor = 1.0;
      }
    }
LABEL_66:
    v66 = objc_loadWeakRetained((id *)&self->_delegate);
    v67 = objc_opt_respondsToSelector();

    if ((v67 & 1) != 0)
    {
      v68 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v68, "audioEngineBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:isFileLoadedBuffer:", self, -[CSAudioInjectionEngine audioStreamHandleId](self, "audioStreamHandleId"), v72, 0, mach_absolute_time(), v71);

    }
    goto LABEL_69;
  }
LABEL_70:

}

- (BOOL)injectAudio:(id)a3
{
  double v3;

  LODWORD(v3) = 1008981770;
  return -[CSAudioInjectionEngine injectAudio:withScaleFactor:playbackStarted:completion:](self, "injectAudio:withScaleFactor:playbackStarted:completion:", a3, 0, 0, v3);
}

- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  _BYTE v15[40];

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[CSAudioInjectionEngine _defaultOutASBD](self, "_defaultOutASBD");
  *(float *)&v13 = a4;
  LOBYTE(self) = -[CSAudioInjectionEngine injectAudio:withScaleFactor:outASBD:playbackStarted:completion:](self, "injectAudio:withScaleFactor:outASBD:playbackStarted:completion:", v12, v15, v11, v10, v13);

  return (char)self;
}

- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5 playbackStarted:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  CSAudioInjectionFileOption *v26;
  __int128 v27;
  CSAudioInjectionFileOption *v28;
  NSObject *queue;
  CSAudioInjectionFileOption *v30;
  BOOL v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v37;
  _QWORD block[5];
  CSAudioInjectionFileOption *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _BYTE buf[32];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __89__CSAudioInjectionEngine_injectAudio_withScaleFactor_outASBD_playbackStarted_completion___block_invoke;
  v44[3] = &unk_1E7C25C98;
  v16 = v13;
  v45 = v16;
  v17 = (void *)MEMORY[0x1C3BC4734](v44);
  v42[0] = v15;
  v42[1] = 3221225472;
  v42[2] = __89__CSAudioInjectionEngine_injectAudio_withScaleFactor_outASBD_playbackStarted_completion___block_invoke_2;
  v42[3] = &unk_1E7C25C98;
  v18 = v14;
  v43 = v18;
  v19 = MEMORY[0x1C3BC4734](v42);
  v20 = (void *)v19;
  if (!v12)
  {
    v32 = *MEMORY[0x1E0D18F60];
    v31 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[CSAudioInjectionEngine injectAudio:withScaleFactor:outASBD:playbackStarted:completion:]";
    _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s Cannot speak nil Audio URL", buf, 0xCu);
LABEL_8:
    v31 = 0;
    goto LABEL_9;
  }
  v37 = v16;
  v21 = (void *)v19;
  v22 = v17;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "fileExistsAtPath:", v24);

  if ((v25 & 1) == 0)
  {
    v33 = (void *)*MEMORY[0x1E0D18F60];
    v31 = 0;
    v17 = v22;
    v20 = v21;
    v16 = v37;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v34 = v33;
    objc_msgSend(v12, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSAudioInjectionEngine injectAudio:withScaleFactor:outASBD:playbackStarted:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v35;
    _os_log_impl(&dword_1C2614000, v34, OS_LOG_TYPE_DEFAULT, "%s Cannot speak since audio file does not exists : %@", buf, 0x16u);

    goto LABEL_8;
  }
  v26 = [CSAudioInjectionFileOption alloc];
  v27 = *(_OWORD *)&a5->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a5->mSampleRate;
  *(_OWORD *)&buf[16] = v27;
  v47 = *(_QWORD *)&a5->mBitsPerChannel;
  v28 = -[CSAudioInjectionFileOption initWithAudioURL:withScaleFactor:outASBD:](v26, "initWithAudioURL:withScaleFactor:outASBD:", v12, buf, COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&buf[4], LODWORD(a4))));
  queue = self->_queue;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __89__CSAudioInjectionEngine_injectAudio_withScaleFactor_outASBD_playbackStarted_completion___block_invoke_19;
  block[3] = &unk_1E7C25CC0;
  block[4] = self;
  v39 = v28;
  v17 = v22;
  v40 = v22;
  v20 = v21;
  v41 = v21;
  v30 = v28;
  dispatch_async(queue, block);

  v31 = 1;
  v16 = v37;
LABEL_9:

  return v31;
}

- (BOOL)isRecording
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__CSAudioInjectionEngine_isRecording__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startAudioStreamWithOption:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CSAudioInjectionEngine_startAudioStreamWithOption___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopAudioStream
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CSAudioInjectionEngine_stopAudioStream__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_deinterleaveBufferIfNeeded:(AudioBufferList *)a3
{
  id v5;
  uint64_t v6;
  UInt32 v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  OpaqueAudioConverter *deinterleaver;
  OSStatus v12;
  OSStatus v13;
  NSObject *v14;
  unsigned int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  OSStatus v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_deinterleaver && a3->mBuffers[0].mNumberChannels >= 2)
  {
    v5 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a3->mBuffers[0].mDataByteSize));
    v6 = objc_msgSend(v5, "mutableBytes");
    v7 = a3->mBuffers[0].mDataByteSize / a3->mBuffers[0].mNumberChannels;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (char *)self->_pNonInterleavedABL + v8;
      *((_DWORD *)v10 + 2) = 1;
      *((_DWORD *)v10 + 3) = v7;
      *((_QWORD *)v10 + 2) = v6 + v7 * v9++;
      v8 += 16;
    }
    while (v9 < a3->mBuffers[0].mNumberChannels);
    deinterleaver = self->_deinterleaver;
    objc_msgSend(MEMORY[0x1E0D190F8], "lpcmNonInterleavedASBD");
    v12 = AudioConverterConvertComplexBuffer(deinterleaver, v7 / v16, a3, self->_pNonInterleavedABL);
    if (v12)
    {
      v13 = v12;
      v14 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSAudioInjectionEngine _deinterleaveBufferIfNeeded:]";
        v19 = 1026;
        v20 = v13;
        _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s Failed to deinterleave the data: %{public}d", buf, 0x12u);
      }
    }
  }
  else
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3->mBuffers[0].mData, a3->mBuffers[0].mDataByteSize);
  }
  return v5;
}

- (id)_compensateChannelDataIfNeeded:(id)a3 receivedNumChannels:(unsigned int)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  unsigned int inputRecordingNumberOfChannels;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (self->_inputRecordingNumberOfChannels <= a4)
  {
    v8 = v6;
  }
  else
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v6, "length") / (unint64_t)a4 * self->_inputRecordingNumberOfChannels);
    v9 = _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat, 1) <= 0x888888888888888uLL)
    {
      inputRecordingNumberOfChannels = self->_inputRecordingNumberOfChannels;
      v11 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315650;
        v14 = "-[CSAudioInjectionEngine _compensateChannelDataIfNeeded:receivedNumChannels:]";
        v15 = 1026;
        v16 = inputRecordingNumberOfChannels - a4;
        v17 = 2050;
        v18 = v9;
        _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Compensating %{public}u channel(s), heartbeat = %{public}lld", (uint8_t *)&v13, 0x1Cu);
        v9 = _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat;
      }
    }
    _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat = v9 + 1;
    objc_msgSend(v8, "replaceBytesInRange:withBytes:", 0, objc_msgSend(v7, "length"), objc_msgSend(objc_retainAutorelease(v7), "bytes"));
  }

  return v8;
}

- (AudioStreamBasicDescription)_defaultOutASBD
{
  AudioStreamBasicDescription *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
    result = (AudioStreamBasicDescription *)objc_msgSend(MEMORY[0x1E0D190F8], "lpcmFloatASBD");
  else
    result = (AudioStreamBasicDescription *)objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16ASBD");
  v5 = v7;
  *(_OWORD *)&retstr->mSampleRate = v6;
  *(_OWORD *)&retstr->mBytesPerPacket = v5;
  *(_QWORD *)&retstr->mBitsPerChannel = v8;
  return result;
}

- (unint64_t)audioStreamHandleId
{
  return self->_audioStreamHandleId;
}

- (void)setAudioStreamHandleId:(unint64_t)a3
{
  self->_audioStreamHandleId = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSAudioInjectionEngineDelegate)delegate
{
  return (CSAudioInjectionEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CSAudioInjectionFileOption)fileOption
{
  return self->_fileOption;
}

- (void)setFileOption:(id)a3
{
  objc_storeStrong((id *)&self->_fileOption, a3);
}

- (OS_dispatch_source)audioFeedTimer
{
  return self->_audioFeedTimer;
}

- (void)setAudioFeedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_audioFeedTimer, a3);
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (AudioStreamBasicDescription)outASBD
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].mBytesPerPacket;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[3].mSampleRate;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[3].mBitsPerChannel;
  return self;
}

- (void)setOutASBD:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_outASBD.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_outASBD.mBytesPerPacket = v4;
  *(_OWORD *)&self->_outASBD.mSampleRate = v3;
}

- (double)bufferDuration
{
  return self->_bufferDuration;
}

- (void)setBufferDuration:(double)a3
{
  self->_bufferDuration = a3;
}

- (NSMutableArray)injectionAudioFileList
{
  return self->_injectionAudioFileList;
}

- (void)setInjectionAudioFileList:(id)a3
{
  objc_storeStrong((id *)&self->_injectionAudioFileList, a3);
}

- (NSMutableArray)injectionStartNotifyBlocks
{
  return self->_injectionStartNotifyBlocks;
}

- (void)setInjectionStartNotifyBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_injectionStartNotifyBlocks, a3);
}

- (NSMutableArray)injectionCompletionNotifyBlocks
{
  return self->_injectionCompletionNotifyBlocks;
}

- (void)setInjectionCompletionNotifyBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_injectionCompletionNotifyBlocks, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (OpaqueAudioConverter)deinterleaver
{
  return self->_deinterleaver;
}

- (void)setDeinterleaver:(OpaqueAudioConverter *)a3
{
  self->_deinterleaver = a3;
}

- (AudioBufferList)pNonInterleavedABL
{
  return self->_pNonInterleavedABL;
}

- (void)setPNonInterleavedABL:(AudioBufferList *)a3
{
  self->_pNonInterleavedABL = a3;
}

- (BOOL)didSetScaleFactor
{
  return self->_didSetScaleFactor;
}

- (void)setDidSetScaleFactor:(BOOL)a3
{
  self->_didSetScaleFactor = a3;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(float)a3
{
  self->_scaleFactor = a3;
}

- (unsigned)inputRecordingNumberOfChannels
{
  return self->_inputRecordingNumberOfChannels;
}

- (void)setInputRecordingNumberOfChannels:(unsigned int)a3
{
  self->_inputRecordingNumberOfChannels = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_injectionCompletionNotifyBlocks, 0);
  objc_storeStrong((id *)&self->_injectionStartNotifyBlocks, 0);
  objc_storeStrong((id *)&self->_injectionAudioFileList, 0);
  objc_storeStrong((id *)&self->_audioFeedTimer, 0);
  objc_storeStrong((id *)&self->_fileOption, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __41__CSAudioInjectionEngine_stopAudioStream__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  char v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSAudioInjectionEngine stopAudioStream]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Calling stopAudioStream", (uint8_t *)&v6, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v5, "audioEngineDidStopRecord:audioStreamHandleId:reason:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"), 0);

  }
}

void __53__CSAudioInjectionEngine_startAudioStreamWithOption___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v4, "audioEngineDidStartRecord:audioStreamHandleId:successfully:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"), 1, 0);

  }
}

uint64_t __37__CSAudioInjectionEngine_isRecording__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t __89__CSAudioInjectionEngine_injectAudio_withScaleFactor_outASBD_playbackStarted_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __89__CSAudioInjectionEngine_injectAudio_withScaleFactor_outASBD_playbackStarted_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __89__CSAudioInjectionEngine_injectAudio_withScaleFactor_outASBD_playbackStarted_completion___block_invoke_19(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 72), "addObject:", a1[5]);
  v2 = *(void **)(a1[4] + 80);
  v3 = (void *)MEMORY[0x1C3BC4734](a1[6]);
  objc_msgSend(v2, "addObject:", v3);

  v4 = *(void **)(a1[4] + 88);
  v5 = (id)MEMORY[0x1C3BC4734](a1[7]);
  objc_msgSend(v4, "addObject:", v5);

}

void __49__CSAudioInjectionEngine__startAudioFeedingTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_readAudioBufferAndFeed");

}

void __30__CSAudioInjectionEngine_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  char v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    v8 = 136315394;
    v9 = "-[CSAudioInjectionEngine stop]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Stopping AudioInjectionEngine : %@", (uint8_t *)&v8, 0x16u);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 56));
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 8))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v4 + 40));
    v6 = objc_opt_respondsToSelector();

    v4 = *(_QWORD *)(a1 + 32);
    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)(v4 + 40));
      objc_msgSend(v7, "audioEngineDidStopRecord:audioStreamHandleId:reason:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"), 3);

      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_BYTE *)(v4 + 8) = 0;
}

uint64_t __31__CSAudioInjectionEngine_start__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_createDeInterleaverIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_startAudioFeedingTimer");
}

@end
