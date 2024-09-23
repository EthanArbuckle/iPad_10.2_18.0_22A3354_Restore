@implementation MOVStreamWriter

- (void)writerStatusChanged:(int64_t)a3 writerDelegate:(id)a4 delegateCallbackQueue:(id)a5
{
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  MOVStreamWriter *v12;
  int64_t v13;

  v8 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__MOVStreamWriter_Delegate__writerStatusChanged_writerDelegate_delegateCallbackQueue___block_invoke;
  block[3] = &unk_24CA44C98;
  v11 = v8;
  v12 = self;
  v13 = a3;
  v9 = v8;
  dispatch_async((dispatch_queue_t)a5, block);

}

void __86__MOVStreamWriter_Delegate__writerStatusChanged_writerDelegate_delegateCallbackQueue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x212BC9B10]();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "streamWriter:changedStatusTo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    switch(*(_QWORD *)(a1 + 48))
    {
      case 3:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 32), "streamWriterDidFinishPreparing");
        break;
      case 5:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 32), "streamWriterDidFinishRecording");
        break;
      case 7:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 32), "streamWriterDidCancelRecording:", *(_QWORD *)(a1 + 40));
        break;
      case 8:
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v3 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "criticalError");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "streamWriterDidFailWithError:", v4);

        }
        break;
      default:
        break;
    }
  }
  objc_autoreleasePoolPop(v2);
}

- (void)writingSessionDidStartAtTime:(id *)a3 streamId:(id)a4 mediaType:(int64_t)a5 writerDelegate:(id)a6 delegateCallbackQueue:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  MOVStreamWriter *v17;
  id v18;
  int64_t v19;
  __int128 v20;
  int64_t var3;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __114__MOVStreamWriter_Delegate__writingSessionDidStartAtTime_streamId_mediaType_writerDelegate_delegateCallbackQueue___block_invoke;
    block[3] = &unk_24CA44CC0;
    v16 = v13;
    v17 = self;
    v20 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v18 = v12;
    v19 = a5;
    dispatch_async(v14, block);

  }
}

void __114__MOVStreamWriter_Delegate__writingSessionDidStartAtTime_streamId_mediaType_writerDelegate_delegateCallbackQueue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x212BC9B10]();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_OWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 80);
  objc_msgSend(v3, "streamWriter:writingSessionDidStartAtTime:stream:mediaType:", v4, &v7, v5, v6);
  objc_autoreleasePoolPop(v2);
}

- (MOVStreamWriter)initWithURL:(id)a3 andExpectedFrameRate:(double)a4
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  char *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  dispatch_queue_t v18;
  void *v19;
  dispatch_semaphore_t v20;
  void *v21;
  dispatch_semaphore_t v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  void *v26;
  __int128 *v27;
  void *v28;
  os_log_t v29;
  void *v30;
  MOVStreamWriter *v31;
  id v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  objc_super v38;
  char v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    +[MIOLog recheckDebugEnabled](MIOLog, "recheckDebugEnabled");
    v39 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v9, &v39);
    if (v39)
      v11 = v10;
    else
      v11 = 0;

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Target path is an existing directory."), 0);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v33);
    }
    v38.receiver = self;
    v38.super_class = (Class)MOVStreamWriter;
    v12 = -[MOVStreamWriter init](&v38, sel_init);
    if (v12)
    {
      if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v7, "path");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v14;
          _os_log_impl(&dword_210675000, v13, OS_LOG_TYPE_DEBUG, "MOVStreamWriter init with URL %{public}@", buf, 0xCu);

        }
      }
      objc_msgSend(v12, "setLegacyKeysMode:", 1);
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = dispatch_queue_create("com.apple.streamwriter.writing", v15);
      v17 = (void *)*((_QWORD *)v12 + 2);
      *((_QWORD *)v12 + 2) = v16;

      v18 = dispatch_queue_create("com.apple.streamwriter.processing", 0);
      v19 = (void *)*((_QWORD *)v12 + 3);
      *((_QWORD *)v12 + 3) = v18;

      v20 = dispatch_semaphore_create(0);
      v21 = (void *)*((_QWORD *)v12 + 4);
      *((_QWORD *)v12 + 4) = v20;

      v22 = dispatch_semaphore_create(0);
      v23 = (void *)*((_QWORD *)v12 + 5);
      *((_QWORD *)v12 + 5) = v22;

      objc_storeStrong((id *)v12 + 9, a3);
      objc_storeWeak((id *)v12 + 62, 0);
      *((double *)v12 + 11) = a4;
      v24 = MEMORY[0x24BDBD8B8];
      v25 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)(v12 + 104) = *MEMORY[0x24BDBD8B8];
      *((_WORD *)v12 + 48) = 1;
      *(_OWORD *)(v12 + 120) = v25;
      *(_OWORD *)(v12 + 136) = *(_OWORD *)(v24 + 32);
      *((_OWORD *)v12 + 23) = xmmword_2106E4620;
      *((_QWORD *)v12 + 48) = 30;
      *((_QWORD *)v12 + 8) = 0x404E000000000000;
      *((_DWORD *)v12 + 116) = 16800;
      *((_DWORD *)v12 + 117) = 0;
      v12[352] = 0;
      objc_msgSend(v12, "setWriteThreadCount:", 0);
      v26 = (void *)objc_opt_new();
      objc_msgSend(v12, "activateNewState:byEvent:", v26, CFSTR("init"));

      v27 = (__int128 *)MEMORY[0x24BDC0D38];
      v36 = *MEMORY[0x24BDC0D38];
      v37 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
      objc_msgSend(v12, "setSessionStartTime:", &v36);
      v34 = *v27;
      v35 = *((_QWORD *)v27 + 2);
      objc_msgSend(v12, "setMovieFragmentInterval:", &v34);
      objc_msgSend(v12, "setInProcessRecording:", 0);
      v28 = (void *)*((_QWORD *)v12 + 56);
      *((_QWORD *)v12 + 56) = 0;

      v29 = os_log_create("com.apple.movstreamwriter.writeravf", "PointsOfInterest");
      v30 = (void *)*((_QWORD *)v12 + 54);
      *((_QWORD *)v12 + 54) = v29;

      *((_QWORD *)v12 + 55) = os_signpost_id_generate(*((os_log_t *)v12 + 54));
    }
    self = v12;
    v31 = self;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)dealloc
{
  NSObject *v3;
  MOVStreamWriter *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *p_pair1;
  id timeoutBlock;
  OS_dispatch_queue *m_delegateCallbackQueue;
  OS_dispatch_queue *m_writingQueue;
  BOOL v9;
  MOVStreamWriter *v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *v11;
  NSURL *m_writeURL;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *v14;
  MOVStreamWriter *v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *v16;
  objc_class *v17;
  NSURL *v18;
  OS_dispatch_queue *v19;
  OS_dispatch_queue *v20;
  OS_dispatch_queue *v21;
  OS_dispatch_queue *v22;
  objc_super v23;
  uint8_t buf[16];

  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v3, OS_LOG_TYPE_DEBUG, "MOVStreamWriter dealloc", buf, 2u);
    }

  }
  -[MOVStreamWriter removeIsReadyObservers](self, "removeIsReadyObservers");
  begin_node = (MOVStreamWriter *)self->m_streamDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
  if (begin_node != (MOVStreamWriter *)&self->m_streamDataMap.__tree_.__pair1_)
  {
    do
    {
      timeoutBlock = begin_node->_timeoutBlock;
      if (timeoutBlock)
        CFRelease(timeoutBlock);
      m_delegateCallbackQueue = begin_node->m_delegateCallbackQueue;
      if (m_delegateCallbackQueue)
      {
        do
        {
          m_writingQueue = m_delegateCallbackQueue;
          m_delegateCallbackQueue = *(OS_dispatch_queue **)m_delegateCallbackQueue;
        }
        while (m_delegateCallbackQueue);
      }
      else
      {
        do
        {
          m_writingQueue = begin_node->m_writingQueue;
          v9 = *(_QWORD *)m_writingQueue == (_QWORD)begin_node;
          begin_node = (MOVStreamWriter *)m_writingQueue;
        }
        while (!v9);
      }
      begin_node = (MOVStreamWriter *)m_writingQueue;
    }
    while (m_writingQueue != (OS_dispatch_queue *)p_pair1);
  }
  v10 = (MOVStreamWriter *)self->m_metadataDataMap.__tree_.__begin_node_;
  self->m_streamDataMap.__tree_.__begin_node_ = p_pair1;
  self->m_streamDataMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->m_streamDataMap.__tree_.__pair3_.__value_ = 0;
  v11 = &self->m_metadataDataMap.__tree_.__pair1_;
  if (v10 != (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_)
  {
    do
    {
      m_writeURL = v10->m_writeURL;
      if (m_writeURL)
        CFRelease(m_writeURL);
      v13 = v10->m_delegateCallbackQueue;
      if (v13)
      {
        do
        {
          v14 = v13;
          v13 = *(OS_dispatch_queue **)v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = v10->m_writingQueue;
          v9 = *(_QWORD *)v14 == (_QWORD)v10;
          v10 = (MOVStreamWriter *)v14;
        }
        while (!v9);
      }
      v10 = (MOVStreamWriter *)v14;
    }
    while (v14 != (OS_dispatch_queue *)v11);
  }
  self->m_metadataDataMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->m_metadataDataMap.__tree_.__pair3_.__value_ = 0;
  self->m_metadataDataMap.__tree_.__begin_node_ = v11;
  v15 = (MOVStreamWriter *)self->m_associatedMetadataDataMap.__tree_.__begin_node_;
  v16 = &self->m_associatedMetadataDataMap.__tree_.__pair1_;
  if (v15 != (MOVStreamWriter *)&self->m_associatedMetadataDataMap.__tree_.__pair1_)
  {
    do
    {
      v17 = (objc_class *)v15->_timeoutBlock;
      if (v17 != (objc_class *)&v15->_finishingTimeout)
      {
        do
        {
          v18 = (NSURL *)*((_QWORD *)v17 + 9);
          if (v18)
            CFRelease(v18);
          v19 = (OS_dispatch_queue *)*((_QWORD *)v17 + 1);
          if (v19)
          {
            do
            {
              v20 = v19;
              v19 = *(OS_dispatch_queue **)v19;
            }
            while (v19);
          }
          else
          {
            do
            {
              v20 = (OS_dispatch_queue *)*((_QWORD *)v17 + 2);
              v9 = *(_QWORD *)v20 == (_QWORD)v17;
              v17 = v20;
            }
            while (!v9);
          }
          v17 = v20;
        }
        while (v20 != (OS_dispatch_queue *)&v15->_finishingTimeout);
      }
      v21 = v15->m_delegateCallbackQueue;
      if (v21)
      {
        do
        {
          v22 = v21;
          v21 = *(OS_dispatch_queue **)v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          v22 = v15->m_writingQueue;
          v9 = *(_QWORD *)v22 == (_QWORD)v15;
          v15 = (MOVStreamWriter *)v22;
        }
        while (!v9);
      }
      v15 = (MOVStreamWriter *)v22;
    }
    while (v22 != (OS_dispatch_queue *)v16);
  }
  self->m_associatedMetadataDataMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->m_associatedMetadataDataMap.__tree_.__pair3_.__value_ = 0;
  self->m_associatedMetadataDataMap.__tree_.__begin_node_ = v16;
  v23.receiver = self;
  v23.super_class = (Class)MOVStreamWriter;
  -[MOVStreamWriter dealloc](&v23, sel_dealloc);
}

- (void)setMultiplexWritingDisabled:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  +[MIOLog defaultLog](MIOLog, "defaultLog", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_210675000, v3, OS_LOG_TYPE_INFO, "Setting multiplexWritingDisabled is not supported anymore.", v4, 2u);
  }

}

- (BOOL)multiplexWritingDisabled
{
  return 0;
}

- (MIOMovieMetadataUtility)movieMetadataUtility
{
  MIOMovieMetadataUtility *v3;
  void *v4;
  MIOMovieMetadataUtility *v5;
  id v6;
  MIOMovieMetadataUtility *movieMetadataUtility;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[MOVStreamWriter status](self, "status") == 5 && !self->_movieMetadataUtility)
  {
    v3 = [MIOMovieMetadataUtility alloc];
    -[AVAssetWriter outputURL](self->m_assetWriter, "outputURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v5 = -[MIOMovieMetadataUtility initWithURL:error:](v3, "initWithURL:error:", v4, &v10);
    v6 = v10;
    movieMetadataUtility = self->_movieMetadataUtility;
    self->_movieMetadataUtility = v5;

    if (!self->_movieMetadataUtility)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v6;
        _os_log_impl(&dword_210675000, v8, OS_LOG_TYPE_ERROR, "Eror creating movieMetadataUtility: %{public}@.", buf, 0xCu);
      }

    }
  }
  return self->_movieMetadataUtility;
}

- (BOOL)setMediaTimeScale:(int)a3 forStream:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t *v9;
  _BOOL4 v10;
  BOOL v11;
  void *__p[2];
  char v14;

  v8 = a4;
  if ((-[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self) & 1) != 0)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    {
      v10 = -[MOVStreamWriter isAudioStream:](self, "isAudioStream:", v9);
      if (v10)
      {
        if (a5)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "writerErrorWithMessage:code:", CFSTR("Cannot set baseMediaTimeScale for audio stream."), 7);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        *((_DWORD *)v9 + 52) = a3;
      }
      v11 = !v10;
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "writerErrorWithMessage:code:", CFSTR("Unknown stream id."), 7);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    if (v14 < 0)
      operator delete(__p[0]);
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "writerErrorWithMessage:code:", CFSTR("Cannot set baseMediaTimeScale in current writer state."), 17);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)setMediaTimeScale:(int)a3 forMetadataStream:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t **p_m_metadataDataMap;
  uint64_t v10;
  BOOL v11;
  void *__p[2];
  char v14;

  v8 = a4;
  if ((-[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self) & 1) != 0)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    p_m_metadataDataMap = (uint64_t **)&self->m_metadataDataMap;
    v11 = v10 != 0;
    if (v10)
    {
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "writerErrorWithMessage:code:", CFSTR("Unknown metadata stream id."), 7);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v14 < 0)
      operator delete(__p[0]);
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "writerErrorWithMessage:code:", CFSTR("Cannot set baseMediaTimeScale in current writer state."), 17);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeWithSeconds:(SEL)a3
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, a4, -[MOVStreamWriter baseMediaTimeScale](self, "baseMediaTimeScale"));
}

- (BOOL)isAudioStream:(StreamRecordingData *)a3
{
  return CMFormatDescriptionGetMediaType(a3->var0) == 1936684398;
}

- (unint64_t)defaultWritingBufferCapacity
{
  return self->_defaultWritingBufferCapacity;
}

- (void)setDefaultWritingBufferCapacity:(unint64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *v7;
  BOOL v8;

  self->_defaultWritingBufferCapacity = a3;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)self->m_streamDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
  if (begin_node != &self->m_streamDataMap.__tree_.__pair1_)
  {
    do
    {
      if (!-[MOVStreamWriter isAudioStream:](self, "isAudioStream:", &begin_node[7]))
        begin_node[15].__value_.__left_ = (void *)self->_defaultWritingBufferCapacity;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v7 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[2].__value_.__left_;
          v8 = v7->__value_.__left_ == begin_node;
          begin_node = v7;
        }
        while (!v8);
      }
      begin_node = v7;
    }
    while (v7 != p_pair1);
  }
}

- (unint64_t)defaultAudioWritingBufferCapacity
{
  return self->_defaultAudioWritingBufferCapacity;
}

- (void)setDefaultAudioWritingBufferCapacity:(unint64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *v7;
  BOOL v8;

  self->_defaultAudioWritingBufferCapacity = a3;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)self->m_streamDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
  if (begin_node != &self->m_streamDataMap.__tree_.__pair1_)
  {
    do
    {
      if (-[MOVStreamWriter isAudioStream:](self, "isAudioStream:", &begin_node[7]))
        begin_node[15].__value_.__left_ = (void *)self->_defaultAudioWritingBufferCapacity;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v7 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[2].__value_.__left_;
          v8 = v7->__value_.__left_ == begin_node;
          begin_node = v7;
        }
        while (!v8);
      }
      begin_node = v7;
    }
    while (v7 != p_pair1);
  }
}

- (unint64_t)defaultMetadataWritingBufferCapacity
{
  return self->_defaultMetadataWritingBufferCapacity;
}

- (void)setDefaultMetadataWritingBufferCapacity:(unint64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *begin_node;
  MOVStreamWriter *left;
  MOVStreamWriter *v5;
  BOOL v6;

  self->_defaultMetadataWritingBufferCapacity = a3;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)self->m_metadataDataMap.__tree_.__begin_node_;
  if (begin_node != &self->m_metadataDataMap.__tree_.__pair1_)
  {
    do
    {
      begin_node[12].__value_.__left_ = (void *)self->_defaultMetadataWritingBufferCapacity;
      left = (MOVStreamWriter *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v5 = left;
          left = (MOVStreamWriter *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v5 = (MOVStreamWriter *)begin_node[2].__value_.__left_;
          v6 = v5->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v5;
        }
        while (!v6);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v5;
    }
    while (v5 != (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_);
  }
}

- (void)setWritingBufferCapacity:(unint64_t)a3 forStream:(id)a4
{
  id v6;
  uint64_t *v7;
  id v8;
  id v9;
  void *__p[2];
  char v11;

  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Unknown stream id."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  if (-[MOVStreamWriter isAudioStream:](self, "isAudioStream:", v7))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Stream is an audio stream, use [MOVStreamWriter setWritingBufferCapacity:forAudioStream:]"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v7[8] = a3;
  if (v11 < 0)
    operator delete(__p[0]);

}

- (void)setWritingBufferCapacity:(unint64_t)a3 forAudioStream:(id)a4
{
  id v6;
  uint64_t *v7;
  id v8;
  id v9;
  void *__p[2];
  char v11;

  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Unknown stream id."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  if (!-[MOVStreamWriter isAudioStream:](self, "isAudioStream:", v7))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Stream is a video stream, use [MOVStreamWriter setWritingBufferCapacity:forStream:]"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v7[8] = a3;
  if (v11 < 0)
    operator delete(__p[0]);

}

- (void)setWritingBufferCapacity:(unint64_t)a3 forMetadataStream:(id)a4
{
  id v6;
  uint64_t **p_m_metadataDataMap;
  id v8;
  void *__p[2];
  char v10;

  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  p_m_metadataDataMap = (uint64_t **)&self->m_metadataDataMap;
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Unknown stream id."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  if (v10 < 0)
    operator delete(__p[0]);

}

- (unint64_t)writingBufferCapacityForStream:(id)a3
{
  id v4;
  uint64_t *v5;
  unint64_t v6;
  id v8;
  id v9;
  void *__p[2];
  char v11;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Unknown stream id."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  if (-[MOVStreamWriter isAudioStream:](self, "isAudioStream:", v5))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Stream is an audio stream, use [MOVStreamWriter writingBufferCapacityForAudioStream:]"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v6 = v5[8];
  if (v11 < 0)
    operator delete(__p[0]);

  return v6;
}

- (unint64_t)writingBufferCapacityForAudioStream:(id)a3
{
  id v4;
  uint64_t *v5;
  unint64_t v6;
  id v8;
  id v9;
  void *__p[2];
  char v11;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Unknown stream id."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  if (!-[MOVStreamWriter isAudioStream:](self, "isAudioStream:", v5))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Stream is not an audio stream, use [MOVStreamWriter writingBufferCapacityForStream:]"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v6 = v5[8];
  if (v11 < 0)
    operator delete(__p[0]);

  return v6;
}

- (unint64_t)writingBufferCapacityForMetadataStream:(id)a3
{
  id v4;
  uint64_t **p_m_metadataDataMap;
  unint64_t v6;
  id v8;
  void *__p[2];
  char v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  p_m_metadataDataMap = (uint64_t **)&self->m_metadataDataMap;
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Unknown stream id."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  if (v10 < 0)
    operator delete(__p[0]);

  return v6;
}

- (unint64_t)writingBufferUsageForStream:(id)a3
{
  id v4;
  uint64_t *v5;
  unint64_t v6;
  id v8;
  id v9;
  void *__p[2];
  char v11;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Unknown stream id."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  if (-[MOVStreamWriter isAudioStream:](self, "isAudioStream:", v5))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Stream is an audio stream, use [MOVStreamWriter writingBufferUsageForAudioStream:]"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v6 = objc_msgSend((id)v5[7], "count");
  if (v11 < 0)
    operator delete(__p[0]);

  return v6;
}

- (unint64_t)writingBufferUsageForAudioStream:(id)a3
{
  id v4;
  uint64_t *v5;
  unint64_t v6;
  id v8;
  id v9;
  void *__p[2];
  char v11;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Unknown stream id."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  if (!-[MOVStreamWriter isAudioStream:](self, "isAudioStream:", v5))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Stream is not an audio stream, use [MOVStreamWriter writingBufferUsageForStream:]"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v6 = objc_msgSend((id)v5[7], "count");
  if (v11 < 0)
    operator delete(__p[0]);

  return v6;
}

- (unint64_t)writingBufferUsageForMetadataStream:(id)a3
{
  id v4;
  uint64_t **p_m_metadataDataMap;
  unint64_t v6;
  id v8;
  void *__p[2];
  char v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  p_m_metadataDataMap = (uint64_t **)&self->m_metadataDataMap;
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Unknown stream id."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  if (v10 < 0)
    operator delete(__p[0]);

  return v6;
}

- (void)setCriticalError:(id)a3
{
  objc_storeStrong((id *)&self->_criticalError, a3);
}

- (NSError)criticalError
{
  return self->_criticalError;
}

- (BOOL)activateNewState:(id)a3 byEvent:(id)a4
{
  MOVStreamWriterState *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = (MOVStreamWriterState *)a3;
  v8 = a4;
  if (v7 && self->_state != v7)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = objc_opt_class();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("State Change: %@ - (%@) -> %@"), v10, v8, objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_210675000, v12, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }

    v13 = -[MOVStreamWriterState writerStatus](self->_state, "writerStatus");
    objc_storeStrong((id *)&self->_state, a3);
    -[MOVStreamWriter setCanWriteData:](self, "setCanWriteData:", -[MOVStreamWriterState canWriteData:](self->_state, "canWriteData:", self));
    v14 = -[MOVStreamWriterState writerStatus](self->_state, "writerStatus");
    -[MOVStreamWriterState activateWithContext:](self->_state, "activateWithContext:", self);
    if (v13 != v14)
    {
      -[MOVStreamWriter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
      -[MOVStreamWriter didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
      -[MOVStreamWriter delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;

      if (!v16)
      {
        -[MOVStreamWriter delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOVStreamWriter writerStatusChanged:writerDelegate:delegateCallbackQueue:](self, "writerStatusChanged:writerDelegate:delegateCallbackQueue:", v14, v17, self->m_delegateCallbackQueue);

      }
    }

  }
  return v7 != 0;
}

- (void)deleteMOVFile
{
  void *v3;
  NSURL *m_writeURL;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  m_writeURL = self->m_writeURL;
  v6 = 0;
  objc_msgSend(v3, "removeItemAtURL:error:", m_writeURL, &v6);
  v5 = v6;

  if (v5)
    -[MOVStreamWriter informDelegateAboutError:](self, "informDelegateAboutError:", v5);

}

- (int64_t)status
{
  MOVStreamWriter *v2;
  MOVStreamWriterState *state;
  int64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  if (state)
    v4 = -[MOVStreamWriterState writerStatus](state, "writerStatus");
  else
    v4 = 0;
  objc_sync_exit(v2);

  return v4;
}

- (void)setDelegate:(id)a3 callbackQueue:(id)a4
{
  OS_dispatch_queue *v6;
  MOVStreamWriter *v7;
  OS_dispatch_queue *m_delegateCallbackQueue;
  id v9;
  id v10;

  v10 = a3;
  v6 = (OS_dispatch_queue *)a4;
  if (v10 && !v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Caller must provide a delegateCallbackQueue"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v7 = self;
  objc_sync_enter(v7);
  -[MOVStreamWriter setDelegate:](v7, "setDelegate:", v10);
  m_delegateCallbackQueue = v7->m_delegateCallbackQueue;
  v7->m_delegateCallbackQueue = v6;

  objc_sync_exit(v7);
}

- (BOOL)enableAVEHighPerformanceProfile
{
  int v3;

  v3 = -[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self);
  if (v3)
    self->m_enableAVEHighPerformanceProfile = 1;
  return v3;
}

- (BOOL)setExpectedFrameRate:(double)a3
{
  int v4;

  if (self->m_expectedFrameRate >= 0.0)
  {
    v4 = -[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self);
    if (v4)
    {
      self->m_expectedFrameRate = a3;
      LOBYTE(v4) = 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)setVideoTransform:(CGAffineTransform *)a3
{
  int v5;
  __int128 v6;
  __int128 v7;

  v5 = -[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self);
  if (v5)
  {
    v6 = *(_OWORD *)&a3->a;
    v7 = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->m_videoTransform.tx = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->m_videoTransform.c = v7;
    *(_OWORD *)&self->m_videoTransform.a = v6;
  }
  return v5;
}

- (BOOL)relateStream:(id)a3 toStream:(id)a4 relationSpecifier:(id)a5
{
  return -[MOVStreamWriter relateStream:toStream:relationSpecifier:error:](self, "relateStream:toStream:relationSpecifier:error:", a3, a4, a5, 0);
}

- (BOOL)relateStream:(id)a3 toStream:(id)a4 relationSpecifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t **p_m_streamDataMap;
  uint64_t v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *p_pair1;
  id v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  uint64_t *v21;
  id v22;
  void *v23;
  void *v24;
  void *__p[2];
  char v27;
  void *v28[2];
  char v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((-[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self) & 1) != 0)
  {
    v13 = objc_retainAutorelease(v10);
    std::string::basic_string[abi:ne180100]<0>(v28, (char *)objc_msgSend(v13, "UTF8String"));
    p_m_streamDataMap = (uint64_t **)&self->m_streamDataMap;
    p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
    if (p_pair1 == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v15)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find track for stream %@"), v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a6, v24, 26);

      v20 = 0;
    }
    else
    {
      v17 = objc_retainAutorelease(v11);
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v17, "UTF8String"));
      v19 = p_pair1 == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v18;
      v20 = p_pair1 != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v18;
      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find track for stream %@"), v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a6, v23, 26);
      }
      else
      {
        objc_storeStrong((id *)v21 + 13, v17);
        v22 = v12;
        v23 = (void *)v21[14];
        v21[14] = (uint64_t)v22;
      }

      if (v27 < 0)
        operator delete(__p[0]);
    }
    if (v29 < 0)
      operator delete(v28[0]);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)setRealTimeCapture:(BOOL)a3
{
  int v5;

  v5 = -[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self);
  if (v5)
    self->m_realtime = a3;
  return v5;
}

- (BOOL)setShouldOptimizeForNetworkUse:(BOOL)a3
{
  int v5;

  v5 = -[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self);
  if (v5)
    self->m_shouldOptimizeForNetworkUse = a3;
  return v5;
}

- (BOOL)shouldOptimizeForNetworkUse
{
  return self->m_shouldOptimizeForNetworkUse;
}

- (void)logFifoUsage
{
  NSObject *v2;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *left;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  int v9;
  MOVStreamWriter *isa;
  MOVStreamWriter *v11;
  BOOL v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  MOVStreamWriter *v19;
  MOVStreamWriter *v20;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v2, OS_LOG_TYPE_INFO, "[FIFO] Usage:", buf, 2u);
  }

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)self->m_streamDataMap.__tree_.__begin_node_;
  if (begin_node != &self->m_streamDataMap.__tree_.__pair1_)
  {
    do
    {
      left = begin_node + 4;
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)left->__value_.__left_;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", left);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = objc_msgSend(begin_node[32].__value_.__left_, "fifoItemCount");
        v8 = objc_msgSend(begin_node[9].__value_.__left_, "isReadyForMoreMediaData");
        v9 = objc_msgSend(begin_node[10].__value_.__left_, "isReadyForMoreMediaData");
        *(_DWORD *)buf = 138544130;
        v23 = v5;
        v24 = 2048;
        v25 = v7;
        v26 = 1024;
        v27 = v8;
        v28 = 1024;
        v29 = v9;
        _os_log_impl(&dword_210675000, v6, OS_LOG_TYPE_INFO, "  [FIFO] %{public}@ = %lu ready: %d %d", buf, 0x22u);
      }

      isa = (MOVStreamWriter *)begin_node[1].__value_.__left_;
      if (isa)
      {
        do
        {
          v11 = isa;
          isa = (MOVStreamWriter *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          v11 = (MOVStreamWriter *)begin_node[2].__value_.__left_;
          v12 = v11->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v11;
        }
        while (!v12);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v11;
    }
    while (v11 != (MOVStreamWriter *)&self->m_streamDataMap.__tree_.__pair1_);
  }
  v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)self->m_metadataDataMap.__tree_.__begin_node_;
  if (v13 != &self->m_metadataDataMap.__tree_.__pair1_)
  {
    do
    {
      v14 = v13 + 4;
      if (SHIBYTE(v13[6].__value_.__left_) < 0)
        v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v14->__value_.__left_;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(v13[15].__value_.__left_, "fifoItemCount");
        v18 = objc_msgSend(v13[7].__value_.__left_, "isReadyForMoreMediaData");
        *(_DWORD *)buf = 138543874;
        v23 = v15;
        v24 = 2048;
        v25 = v17;
        v26 = 1024;
        v27 = v18;
        _os_log_impl(&dword_210675000, v16, OS_LOG_TYPE_INFO, "  [FIFO] %{public}@ = %lu (metadata)  ready: %d", buf, 0x1Cu);
      }

      v19 = (MOVStreamWriter *)v13[1].__value_.__left_;
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (MOVStreamWriter *)v19->super.isa;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (MOVStreamWriter *)v13[2].__value_.__left_;
          v12 = v20->super.isa == (Class)v13;
          v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v20;
        }
        while (!v12);
      }
      v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v20;
    }
    while (v20 != (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_);
  }
}

- (BOOL)checkIfFifoAreEmpty
{
  MOVStreamWriter *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *p_pair1;
  OS_dispatch_queue *m_delegateCallbackQueue;
  OS_dispatch_queue *m_writingQueue;
  BOOL v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *v9;
  uint64_t v10;
  BOOL result;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *v13;

  begin_node = (MOVStreamWriter *)self->m_streamDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
  if (begin_node == (MOVStreamWriter *)&self->m_streamDataMap.__tree_.__pair1_)
  {
LABEL_9:
    v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)self->m_metadataDataMap.__tree_.__begin_node_;
    v9 = &self->m_metadataDataMap.__tree_.__pair1_;
    if (v8 == v9)
    {
      return 1;
    }
    else
    {
      do
      {
        v10 = objc_msgSend(v8[15].__value_.__left_, "fifoItemCount");
        result = v10 == 0;
        if (v10)
          break;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v8[1].__value_.__left_;
        if (left)
        {
          do
          {
            v13 = left;
            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)left->__value_.__left_;
          }
          while (left);
        }
        else
        {
          do
          {
            v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v8[2].__value_.__left_;
            v7 = v13->__value_.__left_ == v8;
            v8 = v13;
          }
          while (!v7);
        }
        v8 = v13;
      }
      while (v13 != v9);
    }
  }
  else
  {
    while (!objc_msgSend(begin_node->m_associatedMetadataDataMap.__tree_.__begin_node_, "fifoItemCount"))
    {
      m_delegateCallbackQueue = begin_node->m_delegateCallbackQueue;
      if (m_delegateCallbackQueue)
      {
        do
        {
          m_writingQueue = m_delegateCallbackQueue;
          m_delegateCallbackQueue = *(OS_dispatch_queue **)m_delegateCallbackQueue;
        }
        while (m_delegateCallbackQueue);
      }
      else
      {
        do
        {
          m_writingQueue = begin_node->m_writingQueue;
          v7 = *(_QWORD *)m_writingQueue == (_QWORD)begin_node;
          begin_node = (MOVStreamWriter *)m_writingQueue;
        }
        while (!v7);
      }
      begin_node = (MOVStreamWriter *)m_writingQueue;
      if (m_writingQueue == (OS_dispatch_queue *)p_pair1)
        goto LABEL_9;
    }
    return 0;
  }
  return result;
}

- (void)addMetadataTrack:(id)a3
{
  -[MOVStreamWriter addMetadataTrack:formatDescription:](self, "addMetadataTrack:formatDescription:", a3, 0);
}

- (void)addMetadataTrack:(id)a3 copyData:(BOOL)a4
{
  id v6;
  id v7;
  void *__p[2];
  char v9;

  v6 = a3;
  -[MOVStreamWriter addMetadataTrack:formatDescription:](self, "addMetadataTrack:formatDescription:", v6, 0);
  v7 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  if (v9 < 0)
    operator delete(__p[0]);

}

- (void)addTimeRangeMetadataTrack:(id)a3
{
  id v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *begin_node;
  uint64_t **p_m_metadataDataMap;
  MOVStreamWriter *left;
  MOVStreamWriter *v8;
  BOOL v9;
  const void *v10;
  id v11;
  id v12;
  id v13;
  void *__p[2];
  char v15;

  v4 = a3;
  p_m_metadataDataMap = (uint64_t **)&self->m_metadataDataMap;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)self->m_metadataDataMap.__tree_.__begin_node_;
  if (begin_node != &self->m_metadataDataMap.__tree_.__pair1_)
  {
    do
    {
      if (BYTE1(begin_node[14].__value_.__left_))
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot add two time range metadata tracks to the same writer"), 0);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v12);
      }
      left = (MOVStreamWriter *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v8 = left;
          left = (MOVStreamWriter *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v8 = (MOVStreamWriter *)begin_node[2].__value_.__left_;
          v9 = v8->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v8;
        }
        while (!v9);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v8;
    }
    while (v8 != (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_);
  }
  v10 = (const void *)objc_msgSend(MEMORY[0x24BDB2588], "createMIOTimeRangeMetadataStreamFormatDescription");
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot create format description for time range metadata track."), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  -[MOVStreamWriter addMetadataTrack:formatDescription:](self, "addMetadataTrack:formatDescription:", v4, v10);
  CFRelease(v10);
  v11 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v11, "UTF8String"));
  if (v15 < 0)
    operator delete(__p[0]);

}

- (void)addMetadataTrack:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4
{
  id v6;
  id v7;
  MOVStreamWriter *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *end;
  __int128 v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  id v22;
  const __CFString *v23;
  id v24;
  opaqueCMFormatDescription *v25;
  void *__p[2];
  uint64_t v27;
  void **v28;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Invalid metadata streamId 'nil'."), 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v7 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  v8 = self;
  objc_sync_enter(v8);
  if ((-[MOVStreamWriterState canConfigure:](v8->_state, "canConfigure:", v8) & 1) == 0)
  {
    v23 = CFSTR("Cannot add tracks while not idle");
    goto LABEL_18;
  }
  {
    v23 = CFSTR("Cannot add two metadata tracks with the same name");
LABEL_18:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v23, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v9 = (void *)objc_opt_new();
  v10 = v9;
  v11 = -[MOVStreamWriter defaultMetadataWritingBufferCapacity](v8, "defaultMetadataWritingBufferCapacity");
  if (a4)
    CFRetain(a4);
  v25 = a4;
  v12 = (void *)objc_opt_new();
  v14 = (void *)*v13;
  *v13 = 0;

  v15 = (void *)v13[1];
  v13[1] = 0;

  *((_BYTE *)v13 + 24) = 0;
  v13[2] = (uint64_t)v25;
  objc_storeStrong((id *)v13 + 4, v9);
  v16 = (void *)v13[6];
  v13[5] = v11;
  v13[6] = 0;

  *((_WORD *)v13 + 28) = 1;
  objc_storeStrong((id *)v13 + 8, v12);
  *((_DWORD *)v13 + 18) = 0;
  end = v8->m_orderedMetadataStreamNames.__end_;
  if (end >= v8->m_orderedMetadataStreamNames.__end_cap_.__value_)
  {
    v19 = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v8->m_orderedMetadataStreamNames, (__int128 *)__p);
  }
  else
  {
    if (SHIBYTE(v27) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)v8->m_orderedMetadataStreamNames.__end_, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    }
    else
    {
      v18 = *(_OWORD *)__p;
      end[2] = v27;
      *(_OWORD *)end = v18;
    }
    v19 = (uint64_t)(end + 3);
    v8->m_orderedMetadataStreamNames.__end_ = end + 3;
  }
  v8->m_orderedMetadataStreamNames.__end_ = (void *)v19;
  v28 = __p;
  v20 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v8->m_lastPtsForMetadataStream, (const void **)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v28);
  v21 = MEMORY[0x24BDC0D38];
  *(_OWORD *)(v20 + 7) = *MEMORY[0x24BDC0D38];
  v20[9] = *(_QWORD *)(v21 + 16);

  objc_sync_exit(v8);
  if (SHIBYTE(v27) < 0)
    operator delete(__p[0]);

}

- (void)addMetadataTrackAssociatedWith:(id)a3 withIdentifier:(id)a4 withFormatDescription:(opaqueCMFormatDescription *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  id v22;
  id v23;
  unint64_t v24;
  __int16 v25;
  void *v26;
  void *__p[2];
  char v28;
  const void *v29[2];
  char v30;

  v8 = a3;
  v9 = a4;
  v10 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(v29, (char *)objc_msgSend(v10, "UTF8String"));
  v11 = objc_retainAutorelease(v9);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v11, "UTF8String"));
  if ((-[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self) & 1) == 0)
  {
    v21 = CFSTR("Cannot add tracks while not idle");
    goto LABEL_15;
  }
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to find stream with identifier %@"), v10);
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  {
    {
      v21 = CFSTR("Cannot add two metadata tracks with the same name");
LABEL_15:
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v21, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v23);
    }
  }
  if (a5)
    CFRetain(a5);
  v24 = -[MOVStreamWriter defaultMetadataWritingBufferCapacity](self, "defaultMetadataWritingBufferCapacity");
  LOBYTE(v25) = 1;
  v26 = (void *)objc_opt_new();
  v15 = (void *)*v14;
  *v14 = 0;

  v16 = (void *)v14[1];
  v14[1] = 0;

  *((_BYTE *)v14 + 24) = 0;
  v14[2] = (uint64_t)a5;
  v17 = (void *)v14[4];
  v14[4] = 0;

  v18 = (void *)v14[6];
  v14[5] = v24;
  v14[6] = 0;

  *((_WORD *)v14 + 28) = v25;
  v19 = (void *)v14[8];
  v14[8] = (uint64_t)v26;
  v20 = v26;

  *((_DWORD *)v14 + 18) = 0;
  if (v28 < 0)
    operator delete(__p[0]);
  if (v30 < 0)
    operator delete((void *)v29[0]);

}

- (void)addTrackForStreamWithIdentifier:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 recordingConfiguration:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  MOVStreamWriter *v12;
  CMVideoDimensions Dimensions;
  CMMediaType MediaType;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  char isKindOfClass;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  id v29;
  CFTypeRef v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  int v52;
  _QWORD *end;
  __int128 v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t *v57;
  const __CFString *v58;
  id v59;
  const __CFString *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  char v67;
  id obj[2];
  id v69[2];
  id v70[2];
  uint64_t v71;
  id v72[2];
  id v73[2];
  id v74[2];
  id v75;
  char v76;
  id v77;
  __int128 v78;
  __int128 v79;
  id v80;
  uint64_t v81;
  int v82;
  id v83;
  int v84;
  char v85;
  __int128 v86;
  uint64_t v87;
  __int128 *v88[2];

  v8 = a3;
  v9 = a5;
  v65 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(&v86, (char *)objc_msgSend(v65, "UTF8String"));
  if (!v9 || !objc_msgSend(v9, "count"))
  {
    v58 = CFSTR("recordingConfiguration cannot be null or empty");
    goto LABEL_46;
  }
  if (!a4)
  {
    objc_msgSend(v9, "valueForKey:", CFSTR("StreamEncoderType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if (v11 != 17)
    {
      v58 = CFSTR("Format description cannot be null");
LABEL_46:
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v58, 0);
      v59 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v59);
    }
  }
  v12 = self;
  objc_sync_enter(v12);
  if ((-[MOVStreamWriterState canConfigure:](v12->_state, "canConfigure:", v12) & 1) == 0)
  {
    v60 = CFSTR("Cannot add tracks while not idle");
    goto LABEL_49;
  }
  {
    v60 = CFSTR("Cannot add two tracks with the same stream name");
LABEL_49:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v60, 0);
    v61 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v61);
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("PixelBufferExactBytesPerRow"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    if (!+[MOVStreamIOUtility verifyExactBytesPerRow:width:height:pixelFormat:](MOVStreamIOUtility, "verifyExactBytesPerRow:width:height:pixelFormat:", v64, Dimensions.width, *(uint64_t *)&Dimensions >> 32, CMFormatDescriptionGetMediaSubType(a4)))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not matching kMIOPixelBufferExactBytesPerRow value %@."), v64);
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
      v62 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v62);
    }
  }
  MediaType = CMFormatDescriptionGetMediaType(a4);
  objc_msgSend(v9, "objectForKey:", CFSTR("VideoTrackTypeInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15 && MediaType != 1936684398)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No video track type info (MIOVideoTrackTypeInfo) specified for stream '%@'."), v65);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", v16, 0);

  }
  objc_msgSend(v9, "objectForKey:", CFSTR("BufferCacheMode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v18;
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = objc_msgSend(v18, "intValue");
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Surface cache mode (MIOBufferCacheMode) is not an NSNumber value, specified for stream '%@'."), v65);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", v20, 0);

  }
  v19 = 0;
LABEL_17:
  objc_msgSend(v9, "objectForKey:", CFSTR("EncodeAttachments"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_30;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Encode attachment keys for stream '%@' are not provided as an Array."), v65);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
      goto LABEL_29;
    goto LABEL_28;
  }
  v23 = v22;
  if (objc_msgSend(v23, "count"))
  {
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v26 = 0;
      goto LABEL_27;
    }
    v28 = CFSTR("Encode attachment keys for stream '%@' are not Strings.");
  }
  else
  {
    v28 = CFSTR("Encode attachment keys for stream '%@' are defined but empty.");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v28, v65);
  v26 = objc_claimAutoreleasedReturnValue();
LABEL_27:

  v27 = (void *)v26;
  if (v26)
  {
LABEL_28:

    v22 = 0;
    v29 = (id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", v27, 0);
  }
LABEL_29:

LABEL_30:
  v80 = 0;
  v83 = 0;
  *(_OWORD *)obj = 0u;
  *(_OWORD *)v69 = 0u;
  *(_OWORD *)v70 = 0u;
  *(_OWORD *)v72 = 0u;
  *(_OWORD *)v73 = 0u;
  *(_OWORD *)v74 = 0u;
  v77 = 0;
  v75 = 0;
  if (a4)
    v30 = CFRetain(a4);
  else
    v30 = 0;
  v66 = (id)v30;
  v31 = (void *)objc_msgSend(v9, "copy");
  v32 = v69[1];
  v69[1] = v31;

  v67 = 0;
  v33 = v73[1];
  v73[1] = 0;

  objc_storeStrong(&v75, v22);
  objc_msgSend(v9, "objectForKey:", CFSTR("DoNotRecordAttachments"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v34, "BOOLValue");

  v35 = (void *)objc_opt_new();
  v36 = v77;
  v77 = v35;

  v37 = MEMORY[0x24BDC0D38];
  v78 = *MEMORY[0x24BDC0D38];
  *(_QWORD *)&v79 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
  if (MediaType == 1936684398)
    v38 = -[MOVStreamWriter defaultAudioWritingBufferCapacity](v12, "defaultAudioWritingBufferCapacity");
  else
    v38 = -[MOVStreamWriter defaultWritingBufferCapacity](v12, "defaultWritingBufferCapacity");
  v71 = v38;
  v39 = (void *)objc_opt_new();
  objc_storeStrong(&v70[1], v39);
  *((_QWORD *)&v79 + 1) = 0;
  v40 = (void *)objc_opt_new();
  v41 = v80;
  v80 = v40;

  v82 = v19;
  v84 = 0;
  v42 = (void *)objc_opt_new();
  v43 = v83;
  v83 = v42;

  v85 = v12->m_streamDataMap.__tree_.__pair3_.__value_
      - (2 * (v12->m_streamDataMap.__tree_.__pair3_.__value_ / 3)
       + (((v12->m_streamDataMap.__tree_.__pair3_.__value_ * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64) >> 1));
  +[MOVStreamPreProcessorFactory defaultFactory](MOVStreamPreProcessorFactory, "defaultFactory");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "preProcessorForFormat:recordingConfiguration:", v66, v9);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v73[0];
  v73[0] = v45;

  v47 = +[MOVStreamOutputSettings outputSettingsForStream:defaultFrameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "outputSettingsForStream:defaultFrameRate:enableAVEHighPerformanceProfile:", &v66, v12->m_enableAVEHighPerformanceProfile, v12->m_expectedFrameRate);
  v49 = (uint64_t)v66;
  *((_BYTE *)v48 + 8) = v67;
  *v48 = v49;
  objc_storeStrong((id *)v48 + 2, obj[0]);
  objc_storeStrong((id *)v48 + 3, obj[1]);
  objc_storeStrong((id *)v48 + 4, v69[0]);
  objc_storeStrong((id *)v48 + 5, v69[1]);
  objc_storeStrong((id *)v48 + 6, v70[0]);
  objc_storeStrong((id *)v48 + 7, v70[1]);
  v48[8] = v71;
  objc_storeStrong((id *)v48 + 9, v72[0]);
  objc_storeStrong((id *)v48 + 10, v72[1]);
  objc_storeStrong((id *)v48 + 11, v73[0]);
  objc_storeStrong((id *)v48 + 12, v73[1]);
  objc_storeStrong((id *)v48 + 13, v74[0]);
  objc_storeStrong((id *)v48 + 14, v74[1]);
  objc_storeStrong((id *)v48 + 15, v75);
  *((_BYTE *)v48 + 128) = v76;
  objc_storeStrong((id *)v48 + 17, v77);
  v50 = v79;
  *((_OWORD *)v48 + 9) = v78;
  *((_OWORD *)v48 + 10) = v50;
  objc_storeStrong((id *)v48 + 22, v80);
  v51 = v81;
  *((_DWORD *)v48 + 48) = v82;
  v48[23] = v51;
  objc_storeStrong((id *)v48 + 25, v83);
  v52 = v84;
  *((_BYTE *)v48 + 212) = v85;
  *((_DWORD *)v48 + 52) = v52;
  end = v12->m_orderedStreamNames.__end_;
  if (end >= v12->m_orderedStreamNames.__end_cap_.__value_)
  {
    v55 = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v12->m_orderedStreamNames, &v86);
  }
  else
  {
    if (SHIBYTE(v87) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)v12->m_orderedStreamNames.__end_, (const std::string::value_type *)v86, *((std::string::size_type *)&v86 + 1));
    }
    else
    {
      v54 = v86;
      end[2] = v87;
      *(_OWORD *)end = v54;
    }
    v55 = (uint64_t)(end + 3);
    v12->m_orderedStreamNames.__end_ = end + 3;
  }
  v12->m_orderedStreamNames.__end_ = (void *)v55;
  v88[0] = &v86;
  v56 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v12->m_lastPtsForStream, (const void **)&v86, (uint64_t)&std::piecewise_construct, v88);
  *(_OWORD *)(v56 + 7) = *(_OWORD *)v37;
  v56[9] = *(_QWORD *)(v37 + 16);
  v88[0] = &v86;
  v57 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v12->m_lastPtsForAttachmentsStream, (const void **)&v86, (uint64_t)&std::piecewise_construct, v88);
  *(_OWORD *)(v57 + 7) = *(_OWORD *)v37;
  v57[9] = *(_QWORD *)(v37 + 16);

  objc_sync_exit(v12);

  if (SHIBYTE(v87) < 0)
    operator delete((void *)v86);

}

- (void)addAudioTrackForStreamWithIdentifier:(id)a3 audioFormat:(id)a4 additionalSettings:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "formatDescription");
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid audio format"), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  +[MOVStreamIOUtility audioNoneEncoderConfig](MOVStreamIOUtility, "audioNoneEncoderConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("AudioFormatObject"));
  if (v9)
    objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("AdditionalAudioSettings"));
  -[MOVStreamWriter addTrackForStreamWithIdentifier:formatDescription:recordingConfiguration:](self, "addTrackForStreamWithIdentifier:formatDescription:recordingConfiguration:", v14, v10, v12);

}

- (BOOL)setTrackMetadata:(id)a3 forStream:(id)a4
{
  return -[MOVStreamWriter setTrackMetadata:forStream:error:](self, "setTrackMetadata:forStream:error:", a3, a4, 0);
}

- (BOOL)setTrackMetadata:(id)a3 forStream:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t *v16;
  id v17;
  BOOL v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *__p[2];
  char v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v8 = a4;
  if ((-[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self) & 1) != 0)
  {
    v9 = objc_retainAutorelease(v8);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v9, "UTF8String"));
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find track for stream %@"), v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a5, v10, 26);
LABEL_17:
      v18 = 0;
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = v21;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v10, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[MOVStreamWriter isCustomTrackMetadataCompatibleObject:](self, "isCustomTrackMetadataCompatibleObject:", v15))
            {
              if (a5)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Incompatible item %@:%@."), v14, objc_opt_class());
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", v19, 10);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_17;
            }

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
          if (v11)
            continue;
          break;
        }
      }

      v17 = v10;
      v10 = (id)v16[9];
      v16[9] = (uint64_t)v17;
      v18 = 1;
    }

    if (v27 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)setTrackMetadataItems:(id)a3 forStream:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t **p_m_streamDataMap;
  MOVStreamWriter *v12;
  BOOL v13;
  BOOL v14;
  uint64_t *v15;
  id v16;
  void *v17;
  void *__p[2];
  char v20;

  v8 = a3;
  v9 = a4;
  if ((-[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self) & 1) != 0)
  {
    v10 = objc_retainAutorelease(v9);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v10, "UTF8String"));
    p_m_streamDataMap = (uint64_t **)&self->m_streamDataMap;
    v13 = &self->m_streamDataMap.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v12;
    v14 = &self->m_streamDataMap.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v12;
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find track for stream %@"), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a5, v17, 26);
    }
    else
    {
      v16 = v8;
      v17 = (void *)v15[10];
      v15[10] = (uint64_t)v16;
    }

    if (v20 < 0)
      operator delete(__p[0]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a5, CFSTR("Writer is not in MIOWriterStatusInit state."), 17);
    v14 = 0;
  }

  return v14;
}

- (BOOL)setTrackMetadata:(id)a3 forMetadataStream:(id)a4
{
  return -[MOVStreamWriter setTrackMetadata:forMetadataStream:error:](self, "setTrackMetadata:forMetadataStream:error:", a3, a4, 0);
}

- (BOOL)setTrackMetadata:(id)a3 forMetadataStream:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t *v16;
  id v17;
  BOOL v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *__p[2];
  char v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v8 = a4;
  if ((-[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self) & 1) != 0)
  {
    v9 = objc_retainAutorelease(v8);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v9, "UTF8String"));
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find track for stream %@"), v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a5, v10, 26);
LABEL_17:
      v18 = 0;
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = v21;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v10, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[MOVStreamWriter isCustomTrackMetadataCompatibleObject:](self, "isCustomTrackMetadataCompatibleObject:", v15))
            {
              if (a5)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Incompatible item %@:%@."), v14, objc_opt_class());
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", v19, 10);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_17;
            }

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
          if (v11)
            continue;
          break;
        }
      }

      v17 = v10;
      v10 = (id)v16[6];
      v16[6] = (uint64_t)v17;
      v18 = 1;
    }

    if (v27 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)prepareToRecordWithMovieMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  MOVStreamWriter *v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v4 = a3;
  if ((-[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Current state does not support prepareToRecord."), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->m_writeURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v15);
  if (v15)
    v8 = v7;
  else
    v8 = 0;

  if (v8 == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Target path is an existing directory."), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v9 = self;
  objc_sync_enter(v9);
  -[MOVStreamWriter setMovMetadataItems:](v9, "setMovMetadataItems:", v4);
  -[MOVStreamWriterState prepareRecording:](self->_state, "prepareRecording:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MOVStreamWriter activateNewState:byEvent:](v9, "activateNewState:byEvent:", v10, CFSTR("prepareToRecord"));

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Current state does not support prepareToRecord."), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  objc_sync_exit(v9);

}

- (void)executePrepareToRecordWithMovieMetadata:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_DEBUG, "Start prepareToRecordWithMovieMetadata", buf, 2u);
    }

  }
  v6 = dispatch_queue_create("prepareQueue", 0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__MOVStreamWriter_executePrepareToRecordWithMovieMetadata___block_invoke;
  v8[3] = &unk_24CA44CE8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __59__MOVStreamWriter_executePrepareToRecordWithMovieMetadata___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  _BYTE *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  Float64 Seconds;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  int v52;
  void *v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  void *context;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  CMTime time;
  id v71;
  uint8_t buf[4];
  Float64 v73;
  int v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x212BC9B10]();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), 0);

  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v3, OS_LOG_TYPE_INFO, "Init av writer...", buf, 2u);
  }

  v4 = (id)*MEMORY[0x24BDB1C40];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("mp4"));

  if (v7)
  {
    v8 = (id)*MEMORY[0x24BDB1C30];

    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v9, OS_LOG_TYPE_INFO, "⚠️⚠️⚠️ WARNING [MOVStreamIO]: Selected file type is 'mp4'. Be aware that this can and will cause data loss. If you can please use 'mov'. ⚠️⚠️⚠️", buf, 2u);
    }

    v4 = v8;
  }
  v10 = objc_alloc(MEMORY[0x24BDB2400]);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v71 = 0;
  v12 = objc_msgSend(v10, "initWithURL:fileType:error:", v11, v4, &v71);
  v13 = v71;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 80);
  *(_QWORD *)(v14 + 80) = v12;

  if (objc_msgSend(*(id *)(a1 + 32), "inProcessRecording"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v16, OS_LOG_TYPE_INFO, "AVAssetWriter set requiresInProcessOperation = YES", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("requiresInProcessOperation"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "valueForKey:", CFSTR("requiresInProcessOperation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = objc_msgSend(v17, "intValue");
      *(_DWORD *)buf = 67109120;
      LODWORD(v73) = v19;
      _os_log_impl(&dword_210675000, v18, OS_LOG_TYPE_INFO, "Check AVAssetWriter.requiresInProcessOperation is %d", buf, 8u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setShouldOptimizeForNetworkUse:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 97));
  v20 = *(_BYTE **)(a1 + 32);
  if (!v20[97])
    goto LABEL_17;
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v21, OS_LOG_TYPE_INFO, "AVAssetWriter shouldOptimizeForNetworkUse = YES", buf, 2u);
  }

  v20 = *(_BYTE **)(a1 + 32);
  if (v20)
  {
LABEL_17:
    objc_msgSend(v20, "movieFragmentInterval");
    if ((v74 & 1) != 0)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = *(void **)(a1 + 32);
        if (v23)
          objc_msgSend(v23, "movieFragmentInterval");
        else
          memset(&time, 0, sizeof(time));
        Seconds = CMTimeGetSeconds(&time);
        *(_DWORD *)buf = 134217984;
        v73 = Seconds;
        _os_log_impl(&dword_210675000, v22, OS_LOG_TYPE_INFO, "MOVStreamWriter set movieFragmentInterval to %f", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "movieFragmentInterval");
      v25 = *(_QWORD *)(a1 + 32);
      v66 = v68;
      v67 = v69;
      objc_msgSend(*(id *)(v25 + 80), "setMovieFragmentInterval:", &v66);
    }
  }
  if (!v13)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v26, OS_LOG_TYPE_INFO, "Writer setupAssetWriterStreamInputs", buf, 2u);
    }

    v27 = *(void **)(a1 + 32);
    v65 = 0;
    objc_msgSend(v27, "setupAssetWriterStreamInputsWithError:", &v65);
    v13 = v65;
    if (!v13)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v28, OS_LOG_TYPE_INFO, "Writer setupMetadataInputs", buf, 2u);
      }

      v29 = *(void **)(a1 + 32);
      v64 = 0;
      objc_msgSend(v29, "setupMetadataInputsWithError:", &v64);
      v13 = v64;
      if (!v13)
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210675000, v30, OS_LOG_TYPE_INFO, "Writer setupAssociatedMetadataInputs", buf, 2u);
        }

        v31 = *(void **)(a1 + 32);
        v63 = 0;
        objc_msgSend(v31, "setupAssociatedMetadataInputsWithError:", &v63);
        v13 = v63;
      }
    }
  }
  v32 = (void *)objc_opt_new();
  +[MOVStreamWriter getMOVStreamIOMetadataItem](MOVStreamWriter, "getMOVStreamIOMetadataItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    objc_msgSend(v32, "addObject:", v33);
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v32, "addObjectsFromArray:");
  objc_msgSend(*(id *)(a1 + 32), "timeRangeMetadataKeyHint");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 == 0;

  if (!v35)
  {
    objc_msgSend(*(id *)(a1 + 32), "timeRangeMetadataKeyHint");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOVStreamWriter getTimeRangeMetadataKeyHintMetadataItem:error:](MOVStreamWriter, "getTimeRangeMetadataKeyHintMetadataItem:error:", v36, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
      objc_msgSend(v32, "addObject:", v37);

  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v38, OS_LOG_TYPE_INFO, "Writer add MOV metadata", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setMetadata:", v32);
  if (!v13)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v39, OS_LOG_TYPE_INFO, "Writer startWriting", buf, 2u);
    }

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "startWriting"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v40, OS_LOG_TYPE_INFO, "Writer register KVO", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "addIsReadyObservers");
      v13 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "error");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v41 = *(id *)(a1 + 32);
  objc_sync_enter(v41);
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v42, OS_LOG_TYPE_INFO, "Writer transition status", buf, 2u);
  }

  v43 = *(_QWORD **)(a1 + 32);
  v44 = (void *)v43[45];
  if (v13)
  {
    objc_msgSend(v44, "criticalErrorOccurred:context:", v13, *(_QWORD *)(a1 + 32));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activateNewState:byEvent:", v45, CFSTR("executePrepareToRecord"));
  }
  else
  {
    objc_msgSend(v44, "prepareFinished:", *(_QWORD *)(a1 + 32));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v43, "activateNewState:byEvent:", v46, CFSTR("executePrepareToRecord"));

    if ((v47 & 1) == 0)
      __assert_rtn("-[MOVStreamWriter executePrepareToRecordWithMovieMetadata:]_block_invoke", "MOVStreamWriter.mm", 1286, "0");
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.movstreamio.framework"));
    if (objc_msgSend(v45, "BOOLForKey:", CFSTR("MULTI_THREAD_WRITING")))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v48, OS_LOG_TYPE_INFO, "Multi thread writing mode enabled.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = *(_QWORD *)(a1 + 32);
      v51 = *(void **)(v50 + 408);
      *(_QWORD *)(v50 + 408) = v49;

      v52 = 0;
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "startWritingThreadForNonMetadataOnlyThreadId:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "addObject:", v53);

        v54 = v52++;
      }
      while (v54 < 2);
      objc_msgSend(*(id *)(a1 + 32), "startWritingThreadForMetadata");
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = *(_QWORD *)(a1 + 32);
      v57 = *(void **)(v56 + 416);
      *(_QWORD *)(v56 + 416) = v55;

      objc_msgSend(*(id *)(a1 + 32), "startWritingThreadForNonMetadataOnlyThreadId:", 255);
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = *(_QWORD *)(a1 + 32);
      v60 = *(void **)(v59 + 424);
      *(_QWORD *)(v59 + 424) = v58;

    }
    else
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v61, OS_LOG_TYPE_INFO, "Default thread writing mode enabled.", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "startWritingThread");
    }
  }

  objc_sync_exit(v41);
  objc_autoreleasePoolPop(context);
}

- (void)addIsReadyObservers
{
  NSObject *v0;
  uint8_t v1[16];

  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_210675000, v0, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: 'addIsReadyObservers' called twice ⛔️⛔️⛔️", v1, 2u);
  }

  __assert_rtn("-[MOVStreamWriter addIsReadyObservers]", "MOVStreamWriter.mm", 1323, "0");
}

- (void)removeIsReadyObservers
{
  MOVStreamWriter *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *p_pair1;
  OS_dispatch_queue *m_delegateCallbackQueue;
  OS_dispatch_queue *m_writingQueue;
  BOOL v7;
  MOVStreamWriter *v8;
  OS_dispatch_queue *v9;
  MOVStreamWriter *v10;

  if (self->m_observingIsReady)
  {
    self->m_observingIsReady = 0;
    begin_node = (MOVStreamWriter *)self->m_streamDataMap.__tree_.__begin_node_;
    p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
    if (begin_node != (MOVStreamWriter *)&self->m_streamDataMap.__tree_.__pair1_)
    {
      do
      {
        -[NSURL removeObserver:forKeyPath:](begin_node->m_writeURL, "removeObserver:forKeyPath:", self, CFSTR("readyForMoreMediaData"));
        -[AVAssetWriter removeObserver:forKeyPath:](begin_node->m_assetWriter, "removeObserver:forKeyPath:", self, CFSTR("readyForMoreMediaData"));
        m_delegateCallbackQueue = begin_node->m_delegateCallbackQueue;
        if (m_delegateCallbackQueue)
        {
          do
          {
            m_writingQueue = m_delegateCallbackQueue;
            m_delegateCallbackQueue = *(OS_dispatch_queue **)m_delegateCallbackQueue;
          }
          while (m_delegateCallbackQueue);
        }
        else
        {
          do
          {
            m_writingQueue = begin_node->m_writingQueue;
            v7 = *(_QWORD *)m_writingQueue == (_QWORD)begin_node;
            begin_node = (MOVStreamWriter *)m_writingQueue;
          }
          while (!v7);
        }
        begin_node = (MOVStreamWriter *)m_writingQueue;
      }
      while (m_writingQueue != (OS_dispatch_queue *)p_pair1);
    }
    v8 = (MOVStreamWriter *)self->m_metadataDataMap.__tree_.__begin_node_;
    if (v8 != (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_)
    {
      do
      {
        objc_msgSend(v8->_timeoutBlock, "removeObserver:forKeyPath:", self, CFSTR("readyForMoreMediaData"));
        v9 = v8->m_delegateCallbackQueue;
        if (v9)
        {
          do
          {
            v10 = (MOVStreamWriter *)v9;
            v9 = *(OS_dispatch_queue **)v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            v10 = (MOVStreamWriter *)v8->m_writingQueue;
            v7 = v10->super.isa == (Class)v8;
            v8 = v10;
          }
          while (!v7);
        }
        v8 = v10;
      }
      while (v10 != (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *begin_node;
  id v13;
  BOOL v14;
  MOVStreamWriter *left;
  MOVStreamWriter *v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *v17;
  void *v18;
  NSObject *v19;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *v20;
  id v21;
  MOVStreamWriter *isa;
  MOVStreamWriter *v23;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *v24;
  void *v25;
  NSObject *v26;
  int v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDD0E70]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)self->m_streamDataMap.__tree_.__begin_node_;
  if (begin_node != &self->m_streamDataMap.__tree_.__pair1_)
  {
    while (1)
    {
      v13 = begin_node[9].__value_.__left_;
      objc_sync_enter(v13);
      v14 = begin_node[9].__value_.__left_ == v8 || begin_node[10].__value_.__left_ == v8;
      if (v14)
        break;
      objc_sync_exit(v13);

      left = (MOVStreamWriter *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v16 = left;
          left = (MOVStreamWriter *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v16 = (MOVStreamWriter *)begin_node[2].__value_.__left_;
          v14 = v16->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v16;
        }
        while (!v14);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v16;
      if (v16 == (MOVStreamWriter *)&self->m_streamDataMap.__tree_.__pair1_)
        goto LABEL_22;
    }
    v17 = begin_node + 4;
    if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
      v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v17->__value_.__left_;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v27 = 138543618;
      v28 = v18;
      v29 = 1024;
      v30 = v11;
      _os_log_impl(&dword_210675000, v19, OS_LOG_TYPE_INFO, "[KVO] Update stream '%{public}@' input ready: %d", (uint8_t *)&v27, 0x12u);
    }

    if (-[MOVStreamWriterState writerStatus](self->_state, "writerStatus") == 3)
      -[MOVStreamWriter informDelegateAboutIsReady:forStream:](self, "informDelegateAboutIsReady:forStream:", v11, v18);
    if ((_DWORD)v11)
      -[MOVStreamWriter consumeSamplesOfVideoAudioStream:](self, "consumeSamplesOfVideoAudioStream:", v18);

    objc_sync_exit(v13);
  }
LABEL_22:
  v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)self->m_metadataDataMap.__tree_.__begin_node_;
  if (v20 != &self->m_metadataDataMap.__tree_.__pair1_)
  {
    while (1)
    {
      v21 = v20[7].__value_.__left_;
      objc_sync_enter(v21);
      if (v20[7].__value_.__left_ == v8)
        break;
      objc_sync_exit(v21);

      isa = (MOVStreamWriter *)v20[1].__value_.__left_;
      if (isa)
      {
        do
        {
          v23 = isa;
          isa = (MOVStreamWriter *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          v23 = (MOVStreamWriter *)v20[2].__value_.__left_;
          v14 = v23->super.isa == (Class)v20;
          v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v23;
        }
        while (!v14);
      }
      v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v23;
      if (v23 == (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_)
        goto LABEL_40;
    }
    v24 = v20 + 4;
    if (SHIBYTE(v20[6].__value_.__left_) < 0)
      v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v24->__value_.__left_;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = 138543618;
      v28 = v25;
      v29 = 1024;
      v30 = v11;
      _os_log_impl(&dword_210675000, v26, OS_LOG_TYPE_INFO, "[KVO] Update metadata stream '%{public}@' input ready: %d", (uint8_t *)&v27, 0x12u);
    }

    if (-[MOVStreamWriterState writerStatus](self->_state, "writerStatus") == 3)
      -[MOVStreamWriter informDelegateAboutIsReady:forStream:](self, "informDelegateAboutIsReady:forStream:", v11, v25);
    if ((_DWORD)v11)
      -[MOVStreamWriter consumeMetadatOfMetadataStream:](self, "consumeMetadatOfMetadataStream:", v25);

    objc_sync_exit(v21);
  }
LABEL_40:

}

- (int)attachmentSerializationModeForStream:()basic_string<char withDefaultMode:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  int v3;
  int v4;
  void *v5;
  void *v6;

  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v4 = objc_msgSend(v5, "intValue");

  return v4;
}

- (void)appendPixelBuffer:(__CVBuffer *)a3 presentationTime:(id *)a4 toStreamId:(id)a5
{
  NSObject *v8;
  Float64 Seconds;
  uint64_t *v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *m_processingQueue;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  std::string __p;
  __CVBuffer *v31;
  uint64_t *v32;
  __int128 v33;
  int64_t v34;
  __int128 v35;
  int64_t var3;
  CMTime time;
  std::string v38;
  uint8_t buf[4];
  Float64 v40;
  _WORD v41[6];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v27 = objc_retainAutorelease(a5);
  std::string::basic_string[abi:ne180100]<0>(&v38, (char *)objc_msgSend(v27, "UTF8String"));
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot append to stream that hasn't been set up."), 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  if ((-[MOVStreamWriterState canAppendData:](self->_state, "canAppendData:", self) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot append: writer is not recording. Current writer state: %@"), objc_opt_class());
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      time = (CMTime)*a4;
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 134218242;
      v40 = Seconds;
      v41[0] = 2114;
      *(_QWORD *)&v41[1] = v27;
      _os_log_impl(&dword_210675000, v8, OS_LOG_TYPE_DEBUG, "MOVStreamWriter appendPixelBuffer at '%5.3f' to stream '%{public}@'", buf, 0x16u);
    }

  }
  -[MOVStreamWriter sessionStartTime](self, "sessionStartTime");
  if ((v41[0] & 1) == 0)
  {
    v35 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[MOVStreamWriter setSessionStartTime:](self, "setSessionStartTime:", &v35);
  }
  v11 = v10;
  if (!v10[6])
    goto LABEL_12;
  v12 = (id)v10[22];
  objc_sync_enter(v12);
  v13 = objc_msgSend((id)v11[6], "pendingFrames");
  v14 = v11[21];
  objc_sync_exit(v12);

  v15 = (id)v11[7];
  objc_sync_enter(v15);
  v16 = objc_msgSend((id)v11[7], "count");
  objc_sync_exit(v15);

  v17 = v13 & ~(v13 >> 63);
  v18 = v11[8];
  if (v14 + v17 + v16 > v18)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[VTEncoder] processing buffer for stream '%@' is full, dropping buffer (Pending:%lld Queue:%ld Fifo:%ld Capacity:%ld) (%llu/%llu/%llu/%llu)."), v27, v17, v14, v16, v18, -[MOVStreamWriter writeThreadCount](self, "writeThreadCount"), objc_msgSend((id)v11[25], "visitCount"), objc_msgSend((id)v11[25], "attemptCount"), objc_msgSend((id)v11[25], "writeCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v19, 18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorByAddingStreamId:", v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[MOVStreamWriter informDelegateAboutError:](self, "informDelegateAboutError:", v21);
    -[MOVStreamWriter triggerWritingThread](self, "triggerWritingThread");

  }
  else
  {
LABEL_12:
    v22 = (id)v11[22];
    objc_sync_enter(v22);
    ++v11[21];
    objc_sync_exit(v22);

    CVPixelBufferRetain(a3);
    m_processingQueue = self->m_processingQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3321888768;
    block[2] = __65__MOVStreamWriter_appendPixelBuffer_presentationTime_toStreamId___block_invoke;
    block[3] = &unk_24CA44658;
    block[4] = self;
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&__p, v38.__r_.__value_.__l.__data_, v38.__r_.__value_.__l.__size_);
    else
      __p = v38;
    v31 = a3;
    v24 = v27;
    v33 = *(_OWORD *)&a4->var0;
    v34 = a4->var3;
    v29 = v24;
    v32 = v11;
    dispatch_async(m_processingQueue, block);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38.__r_.__value_.__l.__data_);

}

void __65__MOVStreamWriter_appendPixelBuffer_presentationTime_toStreamId___block_invoke(uint64_t a1)
{
  void *v2;
  _OWORD *v3;
  uint64_t *v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  char *v8;
  char *v9;
  uint64_t v10;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v21;
  CMTimeEpoch v22;
  __int128 v23;
  __int128 *v24;
  CMTimeEpoch v25;
  void *v26;
  id v27;
  id *v28;
  void *v29;
  id v30;
  id v31;
  const opaqueCMFormatDescription *v32;
  uint64_t v33;
  uint64_t **v34;
  uint64_t *v35;
  uint64_t *v36;
  CMTimeValue v37;
  CMTimeFlags v38;
  CMTimeEpoch v39;
  CMTimeValue v40;
  void *v41;
  Float64 Seconds;
  void *v43;
  void *v44;
  void *v45;
  CMSampleBufferRef v46;
  uint64_t v47;
  opaqueCMFormatDescription *v48;
  void *v49;
  void *v50;
  id v51;
  std::string v52;
  __int128 v53;
  uint64_t v54;
  CMTime v55;
  CMTime time;
  CMTime time2;
  CMTime time1;
  __int128 v59;
  uint64_t v60;
  CMSampleTimingInfo sampleTiming;
  CMSampleBufferRef sampleBufferOut;
  id v63;
  __int128 v64;
  uint64_t v65;
  std::string v66;
  __int128 *v67;
  CMTimeValue v68;
  CMTimeScale v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BC9B10]();
  v3 = (_OWORD *)(a1 + 48);
  if (*((_BYTE *)v4 + 128))
  {
    v5 = 0;
    goto LABEL_17;
  }
  v6 = +[MIOPixelBufferUtility isPixelBufferRawBayer:](MIOPixelBufferUtility, "isPixelBufferRawBayer:", *(_QWORD *)(a1 + 72));
  v7 = +[MIOPixelBufferUtility isPixelBufferCompandedRawBayer:](MIOPixelBufferUtility, "isPixelBufferCompandedRawBayer:", *(_QWORD *)(a1 + 72));
  v8 = *(char **)(a1 + 32);
  if (*(char *)(a1 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(&v66, *(const std::string::value_type **)(a1 + 48), *(_QWORD *)(a1 + 56));
    v9 = *(char **)(a1 + 32);
  }
  else
  {
    *(_OWORD *)&v66.__r_.__value_.__l.__data_ = *v3;
    v66.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 64);
    v9 = v8;
  }
  v10 = objc_msgSend(v8, "attachmentSerializationModeForStream:withDefaultMode:fromMap:", &v66, 1, v9 + 160);
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v66.__r_.__value_.__l.__data_);
  if (v6)
  {
    if ((_DWORD)v10 == 1)
      goto LABEL_16;
  }
  else if ((_DWORD)v10 == 1 || !v7)
  {
    goto LABEL_16;
  }
  v12 = (id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", CFSTR("Mode for pixel buffer attachments for RawBayer pixel buffers is not set to PLIST! Default format is overridden by client (kMIOFrameAttachmentSerializationMode), this will be ignored for RawBayer."), 0);
  v10 = 1;
LABEL_16:
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(void **)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v64 = *(_OWORD *)(a1 + 88);
  v65 = *(_QWORD *)(a1 + 104);
  objc_msgSend(v14, "getMetadataGroupForBuffer:stream:presentationTime:serializationMode:", v13, v15, &v64, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  v16 = (void *)v4[11];
  v17 = *(_QWORD *)(a1 + 72);
  v63 = 0;
  v18 = (void *)objc_msgSend(v16, "processedPixelBufferCopyOf:streamData:error:", v17, v4, &v63);
  v19 = v63;
  CFRelease(*(CFTypeRef *)(a1 + 72));
  v20 = *(void **)(a1 + 32);
  if (v18)
  {
    if ((objc_msgSend(v20, "canWriteData") & 1) != 0)
    {
      sampleBufferOut = 0;
      v21 = *(_OWORD *)(MEMORY[0x24BDC0DC0] + 48);
      *(_OWORD *)&sampleTiming.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x24BDC0DC0] + 32);
      *(_OWORD *)&sampleTiming.decodeTimeStamp.value = v21;
      v22 = *(_QWORD *)(MEMORY[0x24BDC0DC0] + 64);
      v23 = *(_OWORD *)(MEMORY[0x24BDC0DC0] + 16);
      *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x24BDC0DC0];
      *(_OWORD *)&sampleTiming.duration.epoch = v23;
      v24 = (__int128 *)(a1 + 88);
      *(_OWORD *)&sampleTiming.presentationTimeStamp.value = *(_OWORD *)(a1 + 88);
      v25 = *(_QWORD *)(a1 + 104);
      sampleTiming.decodeTimeStamp.epoch = v22;
      sampleTiming.presentationTimeStamp.epoch = v25;
      v26 = (void *)v4[6];
      if (v26)
      {
        v59 = *v24;
        v60 = *(_QWORD *)(a1 + 104);
        objc_msgSend(v26, "encodeFrame:pts:frameProperties:metadata:", v18, &v59, 0, v5);
        CFRelease(v18);
      }
      else
      {
        v32 = (const opaqueCMFormatDescription *)objc_msgSend((id)v4[11], "formatDescriptionForPixelBuffer:streamData:", v18, v4);
        v33 = CMSampleBufferCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], (CVImageBufferRef)v18, 1u, 0, 0, v32, &sampleTiming, &sampleBufferOut);
        if (sampleBufferOut)
        {
          v34 = (uint64_t **)(*(_QWORD *)(a1 + 32) + 280);
          v67 = (__int128 *)(a1 + 48);
          v35 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v34, (const void **)(a1 + 48), (uint64_t)&std::piecewise_construct, &v67);
          v37 = v35[7];
          v36 = v35 + 7;
          v68 = v37;
          v38 = *((_DWORD *)v36 + 3);
          v69 = *((_DWORD *)v36 + 2);
          if ((v38 & 1) == 0)
            goto LABEL_27;
          v39 = v36[2];
          v40 = *v36;
          time1.timescale = *((_DWORD *)v36 + 2);
          time1.flags = v38;
          time1.epoch = v39;
          *(_OWORD *)&time2.value = *v24;
          time2.epoch = *(_QWORD *)(a1 + 104);
          time1.value = v40;
          if (CMTimeCompare(&time1, &time2) < 0)
          {
LABEL_27:
            v45 = *(void **)(a1 + 32);
            v46 = sampleBufferOut;
            v53 = *v24;
            v54 = *(_QWORD *)(a1 + 104);
            if (*(char *)(a1 + 71) < 0)
            {
              std::string::__init_copy_ctor_external(&v52, *(const std::string::value_type **)(a1 + 48), *(_QWORD *)(a1 + 56));
            }
            else
            {
              *(_OWORD *)&v52.__r_.__value_.__l.__data_ = *v3;
              v52.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 64);
            }
            objc_msgSend(v45, "newSampleReady:metadata:presentationTime:streamKey:streamId:isAudioSample:", v46, v5, &v53, &v52, *(_QWORD *)(a1 + 40), 0);
            if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v52.__r_.__value_.__l.__data_);
          }
          else
          {
            CFRelease(sampleBufferOut);
            v41 = (void *)MEMORY[0x24BDD17C8];
            *(_OWORD *)&time.value = *v24;
            time.epoch = *(_QWORD *)(a1 + 104);
            Seconds = CMTimeGetSeconds(&time);
            v55.value = v68;
            v55.timescale = v69;
            v55.flags = v38;
            v55.epoch = v39;
            objc_msgSend(v41, "stringWithFormat:", CFSTR("Sample buffer was appended with presentation timestamp (%f) less than (or equal to) previous sample buffer (%f) for stream '%@'. Dropping frame."), *(_QWORD *)&Seconds, CMTimeGetSeconds(&v55), *(_QWORD *)(a1 + 40));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v43, 15);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "informDelegateAboutError:", v44);

          }
        }
        else
        {
          v47 = v33;
          v48 = +[MOVStreamIOUtility formatForPixelBuffer:](MOVStreamIOUtility, "formatForPixelBuffer:", v18);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sample buffer creation failed (error: %i) for stream '%@'. Dropping frame. Info: Used FD: %@  Buffer FD: %@"), v47, *(_QWORD *)(a1 + 40), v32, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
            CFRelease(v48);
          objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v49, 14);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "informDelegateAboutError:", v50);

        }
        CFRelease(v18);
      }
      v51 = *(id *)(*(_QWORD *)(a1 + 80) + 176);
      objc_sync_enter(v51);
      --v4[21];
      objc_sync_exit(v51);

    }
    else
    {
      CFRelease(v18);
      v31 = *(id *)(*(_QWORD *)(a1 + 80) + 176);
      objc_sync_enter(v31);
      --v4[21];
      objc_sync_exit(v31);

    }
  }
  else
  {
    v27 = v20;
    objc_sync_enter(v27);
    v28 = *(id **)(a1 + 32);
    objc_msgSend(v28[45], "criticalErrorOccurred:context:", v19, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateNewState:byEvent:", v29, CFSTR("appendPixelBuffer"));

    objc_sync_exit(v27);
    v30 = *(id *)(*(_QWORD *)(a1 + 80) + 176);
    objc_sync_enter(v30);
    --v4[21];
    objc_sync_exit(v30);

  }
  objc_autoreleasePoolPop(v2);
}

- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 attachmentMetadata:(id)a4 streamId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  Float64 Seconds;
  NSObject *m_processingQueue;
  id v14;
  id v15;
  const __CFString *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  opaqueCMSampleBuffer *v25;
  std::string __p[2];
  CMTime time;
  CMTime v28;
  CMTime v29;
  std::string v30;
  uint8_t buf[4];
  Float64 v32;
  _WORD v33[6];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (!a3)
  {
    v16 = CFSTR("Sample Buffer cannot be nil.");
    goto LABEL_23;
  }
  if (!v8)
  {
    v16 = CFSTR("Attachments cannot be nil.");
LABEL_23:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  v10 = objc_retainAutorelease(v9);
  std::string::basic_string[abi:ne180100]<0>(&v30, (char *)objc_msgSend(v10, "UTF8String"));
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot append to a stream that hasn't been set up."), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  if (!-[MOVStreamWriter getPixelFormatForStream:fromMap:](self, "getPixelFormatForStream:fromMap:", v10, &self->m_streamDataMap))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Pixel format not defined for stream '%@'."), v10);
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], objc_claimAutoreleasedReturnValue(), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  memset(&v29, 0, sizeof(v29));
  CMSampleBufferGetPresentationTimeStamp(&v29, a3);
  if ((v29.flags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sample Buffer with invalid PTS for stream '%@'."), v10);
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], objc_claimAutoreleasedReturnValue(), 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  -[MOVStreamWriter sessionStartTime](self, "sessionStartTime");
  if ((v33[0] & 1) == 0)
  {
    v28 = v29;
    -[MOVStreamWriter setSessionStartTime:](self, "setSessionStartTime:", &v28);
  }
  if (-[MOVStreamWriter encoderTypeForStream:](self, "encoderTypeForStream:", v10) - 19 <= 0xFFFFFFFD)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot append sample buffer with encoder type not MIOStreamEncoderTypeNone."), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      time = v29;
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 134218242;
      v32 = Seconds;
      v33[0] = 2114;
      *(_QWORD *)&v33[1] = v10;
      _os_log_impl(&dword_210675000, v11, OS_LOG_TYPE_DEBUG, "MOVStreamWriter appendSampleBuffer at '%5.3f' to stream '%{public}@'", buf, 0x16u);
    }

  }
  CFRetain(a3);
  m_processingQueue = self->m_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = __71__MOVStreamWriter_appendVideoSampleBuffer_attachmentMetadata_streamId___block_invoke;
  block[3] = &unk_24CA44738;
  block[4] = self;
  v25 = a3;
  v14 = v8;
  v23 = v14;
  __p[1] = (std::string)v29;
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(__p, v30.__r_.__value_.__l.__data_, v30.__r_.__value_.__l.__size_);
  else
    __p[0] = v30;
  v15 = v10;
  v24 = v15;
  dispatch_async(m_processingQueue, block);

  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p[0].__r_.__value_.__l.__data_);

  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);

}

void __71__MOVStreamWriter_appendVideoSampleBuffer_attachmentMetadata_streamId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  std::string __p;
  __int128 v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x212BC9B10]();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(_OWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 104);
  if (*(char *)(a1 + 87) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 64), *(_QWORD *)(a1 + 72));
  else
    __p = *(std::string *)(a1 + 64);
  objc_msgSend(v4, "newSampleReady:metadata:presentationTime:streamKey:streamId:isAudioSample:", v3, v5, &v7, &__p, *(_QWORD *)(a1 + 48), 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  objc_autoreleasePoolPop(v2);
}

- (void)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 attachments:(id)a4 streamId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  Float64 Seconds;
  NSObject *m_processingQueue;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  MOVStreamWriter *v22;
  id v23;
  std::string __p;
  opaqueCMSampleBuffer *v25;
  CMTime v26;
  CMTime v27;
  CMTime time;
  CMTime v29;
  std::string v30;
  uint8_t buf[4];
  Float64 v32;
  _WORD v33[6];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Sample Buffer cannot be nil."), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v10 = objc_retainAutorelease(v9);
  std::string::basic_string[abi:ne180100]<0>(&v30, (char *)objc_msgSend(v10, "UTF8String"));
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot append to a stream that hasn't been set up."), 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  if ((-[MOVStreamWriterState canAppendData:](self->_state, "canAppendData:", self) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot append: writer is not recording. Current writer state: %@"), objc_opt_class());
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  if (!-[MOVStreamWriter getPixelFormatForStream:fromMap:](self, "getPixelFormatForStream:fromMap:", v10, &self->m_streamDataMap))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Pixel format not defined for stream '%@'."), v10);
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], objc_claimAutoreleasedReturnValue(), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  memset(&v29, 0, sizeof(v29));
  CMSampleBufferGetPresentationTimeStamp(&v29, a3);
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      time = v29;
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 134218242;
      v32 = Seconds;
      v33[0] = 2114;
      *(_QWORD *)&v33[1] = v10;
      _os_log_impl(&dword_210675000, v11, OS_LOG_TYPE_DEBUG, "MOVStreamWriter appendSampleBuffer at '%5.3f' to stream '%{public}@'", buf, 0x16u);
    }

  }
  -[MOVStreamWriter sessionStartTime](self, "sessionStartTime");
  if ((v33[0] & 1) == 0)
  {
    v27 = v29;
    -[MOVStreamWriter setSessionStartTime:](self, "setSessionStartTime:", &v27);
  }
  CFRetain(a3);
  m_processingQueue = self->m_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = __59__MOVStreamWriter_appendSampleBuffer_attachments_streamId___block_invoke;
  block[3] = &unk_24CA44700;
  v14 = v8;
  v21 = v14;
  v22 = self;
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v30.__r_.__value_.__l.__data_, v30.__r_.__value_.__l.__size_);
  else
    __p = v30;
  v25 = a3;
  v26 = v29;
  v15 = v10;
  v23 = v15;
  dispatch_async(m_processingQueue, block);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);

}

void __59__MOVStreamWriter_appendSampleBuffer_attachments_streamId___block_invoke(uint64_t a1)
{
  void *v2;
  char *v3;
  char *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  std::string __p;
  __int128 v20;
  uint64_t v21;
  CMTime duration;
  CMTime start;
  CMTimeRange v24;
  void *v25;
  void *v26;
  std::string v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BC9B10]();
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = *(char **)(a1 + 40);
    if (*(char *)(a1 + 79) < 0)
    {
      std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(a1 + 56), *(_QWORD *)(a1 + 64));
      v4 = *(char **)(a1 + 40);
    }
    else
    {
      v27 = *(std::string *)(a1 + 56);
      v4 = v3;
    }
    v6 = objc_msgSend(v3, "attachmentSerializationModeForStream:withDefaultMode:fromMap:", &v27, 1, v4 + 160);
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v27.__r_.__value_.__l.__data_);
    v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    if (v6)
    {
      +[MOVStreamIOUtility getPlistFriendlyCopyOf:](MOVStreamIOUtility, "getPlistFriendlyCopyOf:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v25);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v25;
    }
    else
    {
      +[MOVStreamIOUtility getJsonFriendlyCopy:](MOVStreamIOUtility, "getJsonFriendlyCopy:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v8, 0, &v26);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v26;
    }
    v11 = (void *)v9;
    v12 = v10;
    if (v12)
    {
      v13 = v12;
      objc_msgSend(*(id *)(a1 + 40), "informDelegateAboutError:", v12);
      CFRelease(*(CFTypeRef *)(a1 + 80));

      v5 = 0;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_attachments"));
    objc_msgSend(v14, "setDataType:", *MEMORY[0x24BDC0C08]);
    objc_msgSend(v14, "setExtraAttributes:", 0);
    objc_msgSend(v14, "setValue:", v11);
    v15 = objc_alloc(MEMORY[0x24BDB26C0]);
    v28[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    start = *(CMTime *)(a1 + 88);
    duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
    CMTimeRangeMake(&v24, &start, &duration);
    v5 = (void *)objc_msgSend(v15, "initWithItems:timeRange:", v16, &v24);

  }
  else
  {
    v5 = 0;
  }
  v17 = *(void **)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 80);
  v20 = *(_OWORD *)(a1 + 88);
  v21 = *(_QWORD *)(a1 + 104);
  if (*(char *)(a1 + 79) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 56), *(_QWORD *)(a1 + 64));
  else
    __p = *(std::string *)(a1 + 56);
  objc_msgSend(v17, "newSampleReady:metadata:presentationTime:streamKey:streamId:isAudioSample:", v18, v5, &v20, &__p, *(_QWORD *)(a1 + 48), 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_19:

  objc_autoreleasePoolPop(v2);
}

- (void)newSampleReady:(opaqueCMSampleBuffer *)a3 metadata:(id)a4 presentationTime:(id *)a5 streamKey:()basic_string<char streamId:()std:(std::allocator<char>> *)a6 :char_traits<char> isAudioSample:
{
  void *v6;
  char v7;
  void *v8;
  uint64_t *v12;
  id v13;
  void *v14;
  NSObject *v15;
  const void *v16;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *var0;
  void *v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  __int128 v22;
  void *v23;
  char v25;
  id v26;
  id v27;
  _BYTE buf[12];
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v25 = v7;
  v8 = v6;
  v31 = *MEMORY[0x24BDAC8D0];
  v26 = a4;
  v27 = v8;
  v13 = (id)v12[7];
  objc_sync_enter(v13);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setSampleBuffer:", a3);
  objc_msgSend(v14, "setMetadata:", v26);
  objc_msgSend(v13, "addObject:", v14);
  objc_msgSend((id)v12[25], "setFifoItemCount:", objc_msgSend(v13, "count"));
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v27;
      v29 = 2048;
      v30 = objc_msgSend(v13, "count");
      _os_log_impl(&dword_210675000, v15, OS_LOG_TYPE_DEBUG, "[FIFO] add to fifo '%{public}@' %ld", buf, 0x16u);
    }

  }
  if (objc_msgSend(v13, "count") > (unint64_t)v12[8]
    && -[MOVStreamWriter fifoDropsEnabled:](self, "fifoDropsEnabled:", v12))
  {
    objc_msgSend(v13, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (const void *)objc_msgSend(v23, "sampleBuffer");
    objc_msgSend(v13, "removeObjectAtIndex:", 0);
    CFRelease(v16);
    var0 = a6;
    if (*((char *)&a6->var0.var0.var0.var1 + 23) < 0)
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a6->var0.var0.var0.var1.var0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[FIFO] FIFO buffer for stream '%s' is full, dropping older buffer (%llu/%llu/%llu/%llu) ."), var0, -[MOVStreamWriter writeThreadCount](self, "writeThreadCount"), objc_msgSend((id)v12[25], "visitCount"), objc_msgSend((id)v12[25], "attemptCount"), objc_msgSend((id)v12[25], "writeCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v18, 18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorByAddingStreamId:", v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[MOVStreamWriter informDelegateAboutError:](self, "informDelegateAboutError:", v20);
  }

  objc_sync_exit(v13);
  if ((v25 & 1) == 0)
  {
    *(_QWORD *)buf = a6;
    v21 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->m_lastPtsForStream, (const void **)a6, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
    v22 = *(_OWORD *)&a5->var0;
    v21[9] = a5->var3;
    *(_OWORD *)(v21 + 7) = v22;
  }
  -[MOVStreamWriter consumeSamplesOfVideoAudioStream:](self, "consumeSamplesOfVideoAudioStream:", v27);

}

- (void)encoder:(id)a3 encodedSampleBuffer:(opaqueCMSampleBuffer *)a4 metadata:(id)a5 presentationTime:(id *)a6 streamId:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  CMTimeValue v17;
  CMTimeFlags v18;
  CMTimeEpoch v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  Float64 Seconds;
  void *v26;
  void *v27;
  std::string v28;
  __int128 v29;
  int64_t var3;
  __int128 v31;
  int64_t v32;
  CMTime v33;
  CMTime time;
  CMTime time2;
  CMTime time1;
  std::string v37;
  std::string *v38;
  CMTimeValue v39;
  CMTimeScale v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = objc_retainAutorelease(a7);
  std::string::basic_string[abi:ne180100]<0>(&v37, (char *)objc_msgSend(v14, "UTF8String"));
  v38 = &v37;
  v15 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->m_lastPtsForStream, (const void **)&v37.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (__int128 **)&v38);
  v17 = v15[7];
  v16 = v15 + 7;
  v39 = v17;
  v18 = *((_DWORD *)v16 + 3);
  v40 = *((_DWORD *)v16 + 2);
  if ((v18 & 1) == 0
    || (v19 = v16[2],
        time1.value = *v16,
        time1.timescale = *((_DWORD *)v16 + 2),
        time1.flags = v18,
        time1.epoch = v19,
        time2 = (CMTime)*a6,
        CMTimeCompare(&time1, &time2) < 0)
    || (objc_msgSend(v12, "frameReorderingEnabled") & 1) != 0)
  {
    -[MOVStreamWriter delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) == 0
      || (-[MOVStreamWriter delegate](self, "delegate"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v31 = *(_OWORD *)&a6->var0,
          v32 = a6->var3,
          v23 = objc_msgSend(v22, "streamWriter:encodedBuffer:pts:metadata:forStream:", self, a4, &v31, v13, v14),
          v22,
          (v23 & 1) == 0))
    {
      v29 = *(_OWORD *)&a6->var0;
      var3 = a6->var3;
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v28, v37.__r_.__value_.__l.__data_, v37.__r_.__value_.__l.__size_);
      else
        v28 = v37;
      -[MOVStreamWriter newSampleReady:metadata:presentationTime:streamKey:streamId:isAudioSample:](self, "newSampleReady:metadata:presentationTime:streamKey:streamId:isAudioSample:", a4, v13, &v29, &v28, v14, 0);
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v28.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    CFRelease(a4);
    v24 = (void *)MEMORY[0x24BDD17C8];
    time = (CMTime)*a6;
    Seconds = CMTimeGetSeconds(&time);
    v33.value = v39;
    v33.timescale = v40;
    v33.flags = v18;
    v33.epoch = v19;
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Sample buffer was appended with presentation timestamp (%f) less than (or equal to) previous sample buffer (%f) for stream '%@'. Dropping frame."), *(_QWORD *)&Seconds, CMTimeGetSeconds(&v33), v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v26, 15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamWriter informDelegateAboutError:](self, "informDelegateAboutError:", v27);

  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37.__r_.__value_.__l.__data_);

}

- (void)encoder:(id)a3 encodingFailedForStream:(id)a4
{
  id v6;
  MOVStreamWriter *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sample buffer encoding failed (encoder status: %i flags: %d) for stream '%@'."), objc_msgSend(v11, "lastEncodingStatus"), objc_msgSend(v11, "lastEncodingInfoFlags"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v8, 14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamWriterState criticalErrorOccurred:context:](v7->_state, "criticalErrorOccurred:context:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamWriter activateNewState:byEvent:](v7, "activateNewState:byEvent:", v10, CFSTR("encodingFailedForStream"));

  objc_sync_exit(v7);
}

- (void)simulateFailure
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("SIMULATED ERROR FOR TESTING"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MOVStreamWriterState criticalErrorOccurred:context:](self->_state, "criticalErrorOccurred:context:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamWriter activateNewState:byEvent:](self, "activateNewState:byEvent:", v3, CFSTR("simulateFailure"));

}

- (id)encoder:(id)a3 overrideVideoEncoderSpecificationForStreamId:(id)a4
{
  id v5;
  void *v6;
  MOVStreamWriter *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  -[MOVStreamWriter customEncoderConfigDelegate](self, "customEncoderConfigDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MOVStreamWriter customEncoderConfigDelegate](self, "customEncoderConfigDelegate");
    v7 = (MOVStreamWriter *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamWriter streamWriter:overrideVideoEncoderSpecificationForStream:](v7, "streamWriter:overrideVideoEncoderSpecificationForStream:", self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = self;
    objc_sync_enter(v7);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing customEncoderConfigDelegate '%@'. Cannot encode!"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v9, 14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamWriterState criticalErrorOccurred:context:](v7->_state, "criticalErrorOccurred:context:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamWriter activateNewState:byEvent:](v7, "activateNewState:byEvent:", v11, CFSTR("overrideVideoEncoderSpecificationForStreamId"));

    objc_sync_exit(v7);
    v8 = 0;
  }

  return v8;
}

- (BOOL)encoder:(id)a3 configureSessionOverride:(OpaqueVTCompressionSession *)a4 streamId:(id)a5
{
  id v7;
  void *v8;
  MOVStreamWriter *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a5;
  -[MOVStreamWriter customEncoderConfigDelegate](self, "customEncoderConfigDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MOVStreamWriter customEncoderConfigDelegate](self, "customEncoderConfigDelegate");
    v9 = (MOVStreamWriter *)objc_claimAutoreleasedReturnValue();
    v10 = -[MOVStreamWriter streamWriter:configureSessionOverride:forStream:](v9, "streamWriter:configureSessionOverride:forStream:", self, a4, v7);
  }
  else
  {
    v9 = self;
    objc_sync_enter(v9);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing customEncoderConfigDelegate '%@'. Cannot encode!"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v11, 14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamWriterState criticalErrorOccurred:context:](v9->_state, "criticalErrorOccurred:context:", v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamWriter activateNewState:byEvent:](v9, "activateNewState:byEvent:", v13, CFSTR("configureSessionOverride"));

    objc_sync_exit(v9);
    v10 = 0;
  }

  return v10;
}

- (unsigned)encoder:(id)a3 codecTypeOverrideForstreamId:(id)a4
{
  id v5;
  void *v6;
  MOVStreamWriter *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  -[MOVStreamWriter customEncoderConfigDelegate](self, "customEncoderConfigDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MOVStreamWriter customEncoderConfigDelegate](self, "customEncoderConfigDelegate");
    v7 = (MOVStreamWriter *)objc_claimAutoreleasedReturnValue();
    v8 = -[MOVStreamWriter streamWriter:codecTypeOverrideForStream:](v7, "streamWriter:codecTypeOverrideForStream:", self, v5);
  }
  else
  {
    v7 = self;
    objc_sync_enter(v7);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing customEncoderConfigDelegate '%@'. Cannot encode!"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v9, 14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamWriterState criticalErrorOccurred:context:](v7->_state, "criticalErrorOccurred:context:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamWriter activateNewState:byEvent:](v7, "activateNewState:byEvent:", v11, CFSTR("codecTypeOverrideForstreamId"));

    objc_sync_exit(v7);
    v8 = 0;
  }

  return v8;
}

- (void)appendTimeMetadataGroup:(id)a3 toStream:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  Float64 Seconds;
  NSObject *m_processingQueue;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  MOVStreamWriter *v16;
  id v17;
  CMTime v18;
  CMTime v19;
  CMTime time;
  CMTime v21;
  const void *v22[2];
  char v23;
  _BYTE buf[32];
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(v22, (char *)objc_msgSend(v7, "UTF8String"));
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot append metadata when the track was never added. Call addMetadataTrack: before prepareToRecord."), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  if (v6)
  {
    objc_msgSend(v6, "timeRange");
  }
  else
  {
    v25 = 0u;
    memset(buf, 0, sizeof(buf));
  }
  v21 = *(CMTime *)buf;
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      time = v21;
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 134218242;
      *(Float64 *)&buf[4] = Seconds;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_210675000, v8, OS_LOG_TYPE_DEBUG, "MOVStreamWriter metadata group at '%5.3f' to stream '%{public}@'", buf, 0x16u);
    }

  }
  -[MOVStreamWriter sessionStartTime](self, "sessionStartTime");
  if ((buf[12] & 1) == 0)
  {
    v19 = v21;
    -[MOVStreamWriter setSessionStartTime:](self, "setSessionStartTime:", &v19);
  }
  m_processingQueue = self->m_processingQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __52__MOVStreamWriter_appendTimeMetadataGroup_toStream___block_invoke;
  v14[3] = &unk_24CA44D10;
  v18 = v21;
  v11 = v7;
  v15 = v11;
  v16 = self;
  v12 = v6;
  v17 = v12;
  dispatch_async(m_processingQueue, v14);

  if (v23 < 0)
    operator delete((void *)v22[0]);

}

void __52__MOVStreamWriter_appendTimeMetadataGroup_toStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x212BC9B10]();
  if ((*(_BYTE *)(a1 + 68) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "queueMetadataGroup:stream:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid time stamp is not supported for metadata for stream '%@'."), *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v3, 16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "informDelegateAboutError:", v4);

  }
  objc_autoreleasePoolPop(v2);
}

- (void)appendTimeCode:(CVSMPTETime *)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5 withTimeStamp:(id *)a6 toStream:(id)a7
{
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  CMTimeValue v15;
  CMTimeFlags v16;
  CMTimeEpoch v17;
  CMTimeValue v18;
  void *v19;
  Float64 v20;
  void *v21;
  void *v22;
  NSObject *v23;
  Float64 Seconds;
  NSObject *m_processingQueue;
  const __CFString *v26;
  id v27;
  _QWORD block[4];
  id v29;
  MOVStreamWriter *v30;
  unint64_t v31;
  unint64_t v32;
  std::string __p;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  int64_t v37;
  __int128 v38;
  int64_t var3;
  CMTime v40;
  CMTime v41;
  CMTime time;
  CMTime time2;
  CMTime time1;
  std::string v45;
  _BYTE buf[12];
  _WORD v47[6];
  CMTimeValue v48;
  CMTimeScale v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v12 = objc_retainAutorelease(a7);
  std::string::basic_string[abi:ne180100]<0>(&v45, (char *)objc_msgSend(v12, "UTF8String"));
  {
    v26 = CFSTR("Cannot append metadata when the track was never added. Call addMetadataTrack: before prepareToRecord.");
    goto LABEL_23;
  }
  {
    v26 = CFSTR("Can only append metadata to time range metadata track.");
LABEL_23:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v26, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  *(_QWORD *)buf = &v45;
  v13 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->m_lastPtsForMetadataStream, (const void **)&v45.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
  v15 = v13[7];
  v14 = v13 + 7;
  v48 = v15;
  v16 = *((_DWORD *)v14 + 3);
  v49 = *((_DWORD *)v14 + 2);
  if ((v16 & 1) == 0
    || (v17 = v14[2],
        v18 = *v14,
        time1.timescale = *((_DWORD *)v14 + 2),
        time1.flags = v16,
        time1.epoch = v17,
        time2 = (CMTime)*a6,
        time1.value = v18,
        CMTimeCompare(&time1, &time2) < 0))
  {
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v40 = (CMTime)*a6;
        Seconds = CMTimeGetSeconds(&v40);
        *(_DWORD *)buf = 134218242;
        *(Float64 *)&buf[4] = Seconds;
        v47[0] = 2114;
        *(_QWORD *)&v47[1] = v12;
        _os_log_impl(&dword_210675000, v23, OS_LOG_TYPE_DEBUG, "MOVStreamWriter time range metadata at '%5.3f' to stream '%{public}@'", buf, 0x16u);
      }

    }
    -[MOVStreamWriter sessionStartTime](self, "sessionStartTime");
    if ((v47[0] & 1) == 0)
    {
      v38 = *(_OWORD *)&a6->var0;
      var3 = a6->var3;
      -[MOVStreamWriter setSessionStartTime:](self, "setSessionStartTime:", &v38);
    }
    m_processingQueue = self->m_processingQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3321888768;
    block[2] = __75__MOVStreamWriter_appendTimeCode_startTime_endTime_withTimeStamp_toStream___block_invoke;
    block[3] = &unk_24CA44690;
    v31 = a4;
    v32 = a5;
    v34 = *(_OWORD *)&a3->subframes;
    v35 = *(_QWORD *)&a3->hours;
    v36 = *(_OWORD *)&a6->var0;
    v37 = a6->var3;
    v29 = v12;
    v30 = self;
    if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&__p, v45.__r_.__value_.__l.__data_, v45.__r_.__value_.__l.__size_);
    else
      __p = v45;
    dispatch_async(m_processingQueue, block);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v21 = v29;
  }
  else
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    time = (CMTime)*a6;
    v20 = CMTimeGetSeconds(&time);
    v41.value = v48;
    v41.timescale = v49;
    v41.flags = v16;
    v41.epoch = v17;
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Metadata was appended with presentation timestamp (%f) less than (or equal to) previous sample buffer (%f) for stream '%@'. Dropping sample."), *(_QWORD *)&v20, CMTimeGetSeconds(&v41), v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v21, 15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamWriter informDelegateAboutError:](self, "informDelegateAboutError:", v22);

  }
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);

}

void __75__MOVStreamWriter_appendTimeCode_startTime_endTime_withTimeStamp_toStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t **v10;
  uint64_t *v11;
  __int128 v12;
  id v13;
  CMTime duration;
  CMTime start;
  CMTimeRange v16;
  __int128 v17;
  uint64_t v18;
  __int128 *v19;

  v2 = (void *)MEMORY[0x212BC9B10]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
  objc_msgSend(MEMORY[0x24BDB2588], "metadataItemForTimeRangeMetadataStartTime:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x24BDB2588], "metadataItemForTimeRangeMetadataEndTime:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v17 = *(_OWORD *)(a1 + 88);
  v18 = *(_QWORD *)(a1 + 104);
  objc_msgSend(MEMORY[0x24BDB2588], "metadataItemForTimeCode:", &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  if ((*(_BYTE *)(a1 + 124) & 1) != 0)
  {
    v9 = objc_alloc(MEMORY[0x24BDB26C0]);
    start = *(CMTime *)(a1 + 112);
    duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
    CMTimeRangeMake(&v16, &start, &duration);
    v7 = (void *)objc_msgSend(v9, "initWithItems:timeRange:", v3, &v16);
    if (!v7)
    {
      v13 = (id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", CFSTR("No metadata appended because the AVTimedMetadataGroup* is nil"), 0);
      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 40), "queueMetadataGroup:stream:", v7, *(_QWORD *)(a1 + 32));
    v10 = (uint64_t **)(*(_QWORD *)(a1 + 40) + 304);
    v19 = (__int128 *)(a1 + 64);
    v11 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v10, (const void **)(a1 + 64), (uint64_t)&std::piecewise_construct, &v19);
    v12 = *(_OWORD *)(a1 + 112);
    v11[9] = *(_QWORD *)(a1 + 128);
    *(_OWORD *)(v11 + 7) = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid time stamp is not supported for metadata for stream '%@'."), *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v7, 16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "informDelegateAboutError:", v8);

  }
LABEL_6:

  objc_autoreleasePoolPop(v2);
}

- (void)appendMetadata:(id)a3 withTimeStamp:(id *)a4 toStream:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  Float64 Seconds;
  NSObject *m_processingQueue;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  MOVStreamWriter *v18;
  id v19;
  std::string __p;
  __int128 v21;
  int64_t v22;
  __int128 v23;
  int64_t var3;
  CMTime time;
  std::string v26;
  uint8_t buf[4];
  Float64 v28;
  _WORD v29[6];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_retainAutorelease(a5);
  std::string::basic_string[abi:ne180100]<0>(&v26, (char *)objc_msgSend(v9, "UTF8String"));
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot append metadata when the track was never added. Call addMetadataTrack: before prepareToRecord."), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      time = (CMTime)*a4;
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 134218242;
      v28 = Seconds;
      v29[0] = 2114;
      *(_QWORD *)&v29[1] = v9;
      _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_DEBUG, "MOVStreamWriter metadata at '%5.3f' to stream '%{public}@'", buf, 0x16u);
    }

  }
  -[MOVStreamWriter sessionStartTime](self, "sessionStartTime");
  if ((v29[0] & 1) == 0)
  {
    v23 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[MOVStreamWriter setSessionStartTime:](self, "setSessionStartTime:", &v23);
  }
  m_processingQueue = self->m_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = __57__MOVStreamWriter_appendMetadata_withTimeStamp_toStream___block_invoke;
  block[3] = &unk_24CA446C8;
  v13 = v8;
  v17 = v13;
  v18 = self;
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v26.__r_.__value_.__l.__data_, v26.__r_.__value_.__l.__size_);
  else
    __p = v26;
  v21 = *(_OWORD *)&a4->var0;
  v22 = a4->var3;
  v14 = v9;
  v19 = v14;
  dispatch_async(m_processingQueue, block);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);

}

void __57__MOVStreamWriter_appendMetadata_withTimeStamp_toStream___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  CMTime *v16;
  uint64_t **v17;
  uint64_t *v18;
  uint64_t *v19;
  CMTimeValue v20;
  CMTimeFlags v21;
  CMTimeEpoch v22;
  CMTimeValue v23;
  void *v24;
  Float64 Seconds;
  void *v26;
  void *v27;
  uint64_t **v28;
  uint64_t *v29;
  __int128 v30;
  id v31;
  const void **v32;
  void *context;
  uint64_t v34;
  id obj;
  void *v36;
  CMTime v37;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTime duration;
  CMTime start;
  CMTimeRange v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  const void **v48;
  CMTimeValue v49;
  CMTimeScale v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x212BC9B10]();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v32 = (const void **)(a1 + 56);
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v34 = a1;
    obj = *(id *)(a1 + 32);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v45;
      v5 = *MEMORY[0x24BDC0C08];
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v45 != v4)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          if (*((_BYTE *)v2 + 24))
            v10 = CFSTR("mdta/com.apple.rawIMUDict");
          else
            v10 = CFSTR("mdta/com.apple.metadata_stream_item");
          objc_msgSend(v8, "setIdentifier:", v10);
          objc_msgSend(v9, "setDataType:", v5);
          objc_msgSend(v9, "setExtraAttributes:", 0);
          if (*((_BYTE *)v2 + 56))
          {
            v11 = (void *)objc_msgSend(v7, "copy");
            objc_msgSend(v9, "setValue:", v11);

          }
          else
          {
            objc_msgSend(v9, "setValue:", v7);
          }
          objc_msgSend(v36, "addObject:", v9);

        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      }
      while (v3);
    }

    if ((*(_BYTE *)(a1 + 92) & 1) != 0)
    {
      v15 = objc_alloc(MEMORY[0x24BDB26C0]);
      v16 = (CMTime *)(a1 + 80);
      start = *(CMTime *)(a1 + 80);
      duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
      CMTimeRangeMake(&v43, &start, &duration);
      v12 = (void *)objc_msgSend(v15, "initWithItems:timeRange:", v36, &v43);
      v17 = (uint64_t **)(*(_QWORD *)(a1 + 40) + 304);
      v48 = (const void **)(a1 + 56);
      v18 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v17, v32, (uint64_t)&std::piecewise_construct, (__int128 **)&v48);
      v20 = v18[7];
      v19 = v18 + 7;
      v49 = v20;
      v21 = *((_DWORD *)v19 + 3);
      v50 = *((_DWORD *)v19 + 2);
      if ((v21 & 1) == 0
        || (v22 = v19[2],
            v23 = *v19,
            time1.timescale = *((_DWORD *)v19 + 2),
            time1.flags = v21,
            time1.epoch = v22,
            time2 = *v16,
            time1.value = v23,
            CMTimeCompare(&time1, &time2) < 0))
      {
        if (v12)
        {
          objc_msgSend(*(id *)(v34 + 40), "queueMetadataGroup:stream:", v12, *(_QWORD *)(v34 + 48));
          v28 = (uint64_t **)(*(_QWORD *)(v34 + 40) + 304);
          v48 = v32;
          v29 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v28, v32, (uint64_t)&std::piecewise_construct, (__int128 **)&v48);
          v30 = *(_OWORD *)&v16->value;
          v29[9] = v16->epoch;
          *(_OWORD *)(v29 + 7) = v30;
        }
        else
        {
          v31 = (id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", CFSTR("No metadata appended because the AVTimedMetadataGroup* is nil"), 0);
        }
      }
      else
      {
        v24 = (void *)MEMORY[0x24BDD17C8];
        time = *v16;
        Seconds = CMTimeGetSeconds(&time);
        v37.value = v49;
        v37.timescale = v50;
        v37.flags = v21;
        v37.epoch = v22;
        objc_msgSend(v24, "stringWithFormat:", CFSTR("Metadata was appended with presentation timestamp (%f) less than (or equal to) previous sample buffer (%f) for stream '%@'. Dropping sample."), *(_QWORD *)&Seconds, CMTimeGetSeconds(&v37), *(_QWORD *)(v34 + 48));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v26, 15);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v34 + 40), "informDelegateAboutError:", v27);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid time stamp is not supported for metadata for stream '%@'."), *(_QWORD *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v12, 16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "informDelegateAboutError:", v13);

    }
  }
  else
  {
    v14 = (id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", CFSTR("No metadata appended because it's empty"), 0);
  }
  objc_autoreleasePoolPop(context);
}

- (void)queueMetadataGroup:(id)a3 stream:(id)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *__p[2];
  char v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  v9 = (id)v8[4];
  objc_sync_enter(v9);
  objc_msgSend(v9, "addObject:", v6);
  objc_msgSend((id)v8[8], "setFifoItemCount:", objc_msgSend(v9, "count"));
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 138543618;
      v18 = v7;
      v19 = 2048;
      v20 = v11;
      _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_DEBUG, "[FIFO] add to fifo '%{public}@' %ld", buf, 0x16u);
    }

  }
  if (objc_msgSend(v9, "count") > (unint64_t)v8[5])
  {
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FIFO buffer for metadata stream '%@' is full, dropping older buffer (%llu/%llu/%llu/%llu)."), v7, -[MOVStreamWriter writeThreadCount](self, "writeThreadCount"), objc_msgSend((id)v8[8], "visitCount"), objc_msgSend((id)v8[8], "attemptCount"), objc_msgSend((id)v8[8], "writeCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v12, 18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorByAddingStreamId:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[MOVStreamWriter informDelegateAboutError:](self, "informDelegateAboutError:", v14);
  }
  objc_sync_exit(v9);

  -[MOVStreamWriter consumeMetadatOfMetadataStream:](self, "consumeMetadatOfMetadataStream:", v7);
  if (v16 < 0)
    operator delete(__p[0]);

}

- (void)appendMetadata:(id)a3 associatedWith:(id)a4 toStream:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *m_processingQueue;
  id v14;
  _QWORD v15[5];
  id v16;
  std::string v17;
  std::string __p;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  std::string v24;
  std::string v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_retainAutorelease(v9);
  std::string::basic_string[abi:ne180100]<0>(&v25, (char *)objc_msgSend(v11, "UTF8String"));
  v12 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(&v24, (char *)objc_msgSend(v12, "UTF8String"));
  -[MOVStreamWriter sessionStartTime](self, "sessionStartTime");
  if ((BYTE12(v21) & 1) == 0)
  {
    if (v8)
    {
      objc_msgSend(v8, "timeRange");
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
      v21 = 0u;
    }
    v19 = v21;
    v20 = v22;
    -[MOVStreamWriter setSessionStartTime:](self, "setSessionStartTime:", &v19);
  }
  m_processingQueue = self->m_processingQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3321888768;
  v15[2] = __58__MOVStreamWriter_appendMetadata_associatedWith_toStream___block_invoke;
  v15[3] = &unk_24CA447A8;
  v15[4] = self;
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v17, v25.__r_.__value_.__l.__data_, v25.__r_.__value_.__l.__size_);
  else
    v17 = v25;
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
  else
    __p = v24;
  v14 = v8;
  v16 = v14;
  dispatch_async(m_processingQueue, v15);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);

}

void __58__MOVStreamWriter_appendMetadata_associatedWith_toStream___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  std::string __p;
  std::string v9;

  v2 = (void *)MEMORY[0x212BC9B10]();
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot append associated metadata when the track was never added. Call addMetadataTrackAssociatedWith:forIdentifier: before prepareToRecord."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    if (*(char *)(a1 + 95) < 0)
      std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)(a1 + 72), *(_QWORD *)(a1 + 80));
    else
      v9 = *(std::string *)(a1 + 72);
    if (*(char *)(a1 + 71) < 0)
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 48), *(_QWORD *)(a1 + 56));
    else
      __p = *(std::string *)(a1 + 48);
    objc_msgSend(v5, "asyncWriteAssociatedMetadata:metadataKey:associatedStreamKey:", v4, &v9, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v9.__r_.__value_.__l.__data_);
  }
  else
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", CFSTR("No metadata appended because it's empty"), 0);
  }
  objc_autoreleasePoolPop(v2);
}

- (BOOL)startSessionWithFallbackSampleTime:(id *)a3 streamId:(id)a4 mediaType:(int64_t)a5 writerDelegate:(id)a6 delegateCallbackQueue:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  MOVStreamWriter *v17;
  BOOL v18;
  char flags;
  NSObject *v20;
  Float64 Seconds;
  AVAssetWriter *m_assetWriter;
  CMTime v24;
  CMTime v25;
  CMTime time;
  CMTime v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  Float64 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = self;
  objc_sync_enter(v17);
  if (v17->m_haveStartedSession)
  {
    v18 = 1;
  }
  else
  {
    memset(&v27, 0, sizeof(v27));
    -[MOVStreamWriter sessionStartTime](v17, "sessionStartTime");
    flags = (unsigned __int128)0 >> 96;
    if ((unsigned __int128)0 >> 96 != 1)
    {
      v27 = (CMTime)*a3;
      flags = v27.flags;
    }
    if ((flags & 0x1D) == 1)
    {
      if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          time = v27;
          Seconds = CMTimeGetSeconds(&time);
          *(_DWORD *)buf = 138543618;
          v29 = v14;
          v30 = 2048;
          v31 = Seconds;
          _os_log_impl(&dword_210675000, v20, OS_LOG_TYPE_DEBUG, "Start Session by '%{public}@' at %f", buf, 0x16u);
        }

      }
      m_assetWriter = v17->m_assetWriter;
      v25 = v27;
      -[AVAssetWriter startSessionAtSourceTime:](m_assetWriter, "startSessionAtSourceTime:", &v25);
      v24 = v27;
      -[MOVStreamWriter writingSessionDidStartAtTime:streamId:mediaType:writerDelegate:delegateCallbackQueue:](v17, "writingSessionDidStartAtTime:streamId:mediaType:writerDelegate:delegateCallbackQueue:", &v24, v14, a5, v15, v16);
      v18 = 1;
      v17->m_haveStartedSession = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a8, CFSTR("Writer invalid sessionStartTime, startSession failed."), 16);
      v18 = 0;
    }
  }
  objc_sync_exit(v17);

  return v18;
}

- (void)asyncWriteAssociatedMetadata:(id)a3 metadataKey:()basic_string<char associatedStreamKey:()std:(std::allocator<char>> *)a4 :char_traits<char>
{
  uint64_t v4;
  uint64_t v5;
  id v8;
  NSObject *m_writingQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  __rep var0;
  std::string __p;

  v5 = v4;
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("nullptr IMU metadata"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  m_writingQueue = self->m_writingQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3321888768;
  v12[2] = __80__MOVStreamWriter_asyncWriteAssociatedMetadata_metadataKey_associatedStreamKey___block_invoke;
  v12[3] = &unk_24CA447A8;
  v12[4] = self;
  v10 = v8;
  v13 = v10;
  if (*((char *)&a4->var0.var0.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external((std::string *)&var0, a4->var0.var0.var0.var1.var0, a4->var0.var0.var0.var1.var1);
  else
    var0 = a4->var0.var0;
  if (*(char *)(v5 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v5, *(_QWORD *)(v5 + 8));
  else
    __p = *(std::string *)v5;
  dispatch_async(m_writingQueue, v12);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (*((char *)&var0.var0.var1 + 23) < 0)
    operator delete(var0.var0.var1.var0);

}

void __80__MOVStreamWriter_asyncWriteAssociatedMetadata_metadataKey_associatedStreamKey___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  _QWORD *v13;
  uint64_t *v14;
  _QWORD *v15;
  id *v16;
  char v17;
  id *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id *v23;
  void *v24;
  void *v25;
  id v26;
  id *v27;
  void *v28;
  id v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BC9B10]();
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v4 = objc_msgSend(*(id *)(a1 + 32), "canWriteData");
  objc_sync_exit(v3);

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v5 + 98))
    {
      v6 = *(void **)(a1 + 40);
      if (v6)
      {
        objc_msgSend(v6, "timeRange");
      }
      else
      {
        v33 = 0u;
        v34 = 0u;
        v32 = 0u;
      }
      v30 = v32;
      v31 = v33;
      v7 = (_QWORD *)(a1 + 48);
      if (*(char *)(a1 + 71) < 0)
        v7 = (_QWORD *)*v7;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v29 = 0;
      v11 = objc_msgSend((id)v5, "startSessionWithFallbackSampleTime:streamId:mediaType:writerDelegate:delegateCallbackQueue:error:", &v30, v8, 2, v9, v10, &v29);
      v12 = v29;

      if ((v11 & 1) == 0)
      {
        v22 = *(id *)(a1 + 32);
        objc_sync_enter(v22);
        v23 = *(id **)(a1 + 32);
        objc_msgSend(v23[45], "criticalErrorOccurred:context:", v12, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "activateNewState:byEvent:", v24, CFSTR("asyncWriteAssociatedMetadata"));

        objc_sync_exit(v22);
        goto LABEL_23;
      }

      v5 = *(_QWORD *)(a1 + 32);
    }
    v13 = (_QWORD *)(a1 + 72);
    v15 = (_QWORD *)(a1 + 48);
    if (objc_msgSend(*v16, "isReadyForMoreMediaData"))
    {
      if (*(_QWORD *)(a1 + 40))
      {
        v17 = objc_msgSend(v16[1], "appendTimedMetadataGroup:");
        v18 = *(id **)(a1 + 32);
        if ((v17 & 1) != 0)
        {
          if (*(char *)(a1 + 71) < 0)
            v15 = (_QWORD *)*v15;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "informDelegateAboutMediaWrittenForStream:mediaType:", v19, 2);

        }
        else
        {
          objc_msgSend(v18[10], "error");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = *(id *)(a1 + 32);
          objc_sync_enter(v26);
          v27 = *(id **)(a1 + 32);
          objc_msgSend(v27[45], "criticalErrorOccurred:context:", v25, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "activateNewState:byEvent:", v28, CFSTR("asyncWriteAssociatedMetadata"));

          objc_sync_exit(v26);
        }
      }
    }
    else
    {
      if (*(char *)(a1 + 71) < 0)
        v15 = (_QWORD *)*v15;
      if (*(char *)(a1 + 95) < 0)
        v13 = (_QWORD *)*v13;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s associated with %s] metadata input not ready for more data, dropping samples"), v15, v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", v20, 0);

    }
  }
LABEL_23:
  objc_autoreleasePoolPop(v2);
}

- (void)appendAudioBuffer:(opaqueCMSampleBuffer *)a3 forStream:(id)a4
{
  id v6;
  id v7;
  NSObject *m_processingQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  opaqueCMSampleBuffer *v14;
  std::string __p;
  CMTime v16;
  CMTime v17;
  int v18;
  std::string v19;

  v6 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot append audioSample <null>."), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v7 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&v19, (char *)objc_msgSend(v7, "UTF8String"));
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot append stream type that hasn't been set up."), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  -[MOVStreamWriter sessionStartTime](self, "sessionStartTime");
  if ((v18 & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp(&v17, a3);
    v16 = v17;
    -[MOVStreamWriter setSessionStartTime:](self, "setSessionStartTime:", &v16);
  }
  CFRetain(a3);
  m_processingQueue = self->m_processingQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3321888768;
  v12[2] = __47__MOVStreamWriter_appendAudioBuffer_forStream___block_invoke;
  v12[3] = &unk_24CA44770;
  v14 = a3;
  v12[4] = self;
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
  else
    __p = v19;
  v9 = v7;
  v13 = v9;
  dispatch_async(m_processingQueue, v12);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__r_.__value_.__l.__data_);

}

void __47__MOVStreamWriter_appendAudioBuffer_forStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  opaqueCMSampleBuffer *v5;
  id v6;
  std::string __p;
  CMTime v8;

  v2 = (void *)MEMORY[0x212BC9B10]();
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "getAudioMetadataForBuffer:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    v5 = *(opaqueCMSampleBuffer **)(a1 + 48);
    CMSampleBufferGetPresentationTimeStamp(&v8, v5);
    if (*(char *)(a1 + 79) < 0)
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 56), *(_QWORD *)(a1 + 64));
    else
      __p = *(std::string *)(a1 + 56);
    objc_msgSend(v4, "newSampleReady:metadata:presentationTime:streamKey:streamId:isAudioSample:", v5, v3, &v8, &__p, *(_QWORD *)(a1 + 40), 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);

  }
  else
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", CFSTR("Could not append audio sample because it is nil"), 0);
  }
  objc_autoreleasePoolPop(v2);
}

- (void)finishRecording
{
  NSObject *v3;
  MOVStreamWriter *v4;
  void *v5;
  BOOL v6;
  const __CFString *v7;
  id v8;
  uint8_t v9[16];

  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_210675000, v3, OS_LOG_TYPE_INFO, "[FINISH] finishRecording", v9, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  if ((-[MOVStreamWriterState canFinishRecording:](v4->_state, "canFinishRecording:", v4) & 1) == 0)
  {
    v7 = CFSTR("Current writer state does not support finishRecording.");
    goto LABEL_8;
  }
  -[MOVStreamWriterState finishRecording:](v4->_state, "finishRecording:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOVStreamWriter activateNewState:byEvent:](v4, "activateNewState:byEvent:", v5, CFSTR("finishRecording"));

  if (!v6)
  {
    v7 = CFSTR("Cannot finishRecording.");
LABEL_8:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  objc_sync_exit(v4);

}

- (void)finishAndDrainFifoFirst
{
  void *v3;
  BOOL v4;
  NSObject *v5;
  MOVStreamWriter *obj;
  uint8_t buf[16];

  if (-[MOVStreamWriter checkIfFifoAreEmpty](self, "checkIfFifoAreEmpty"))
  {
    obj = self;
    objc_sync_enter(obj);
    -[MOVStreamWriterState nextFinishStep:](obj->_state, "nextFinishStep:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[MOVStreamWriter activateNewState:byEvent:](obj, "activateNewState:byEvent:", v3, CFSTR("finishAndDrainFifoFirst"));

    if (!v4)
      __assert_rtn("-[MOVStreamWriter finishAndDrainFifoFirst]", "MOVStreamWriter.mm", 2399, "0");
    objc_sync_exit(obj);

  }
  else
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_INFO, "[FINISH] startFinishingTimeoutTimer (items in fifos)", buf, 2u);
    }

    -[MOVStreamWriter triggerWritingThread](self, "triggerWritingThread");
    -[MOVStreamWriter startFinishingTimeoutTimer](self, "startFinishingTimeoutTimer");
  }
}

- (void)setFinishingTimeout:(double)a3
{
  MOVStreamWriter *v4;
  NSObject *v5;
  int v6;
  double v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  if (a3 < 45.0)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 134218240;
      v7 = a3;
      v8 = 2048;
      v9 = 0x4046800000000000;
      _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_ERROR, "⚠️⚠️⚠️ WARNING [MOVStreamIO]: setFinishingTimeout to %.1f sec below recommended minimum value %.1f sec.", (uint8_t *)&v6, 0x16u);
    }

  }
  v4->_finishingTimeout = a3;
  objc_sync_exit(v4);

}

- (double)finishingTimeout
{
  MOVStreamWriter *v2;
  double finishingTimeout;

  v2 = self;
  objc_sync_enter(v2);
  finishingTimeout = v2->_finishingTimeout;
  objc_sync_exit(v2);

  return finishingTimeout;
}

- (void)startFinishingTimeoutTimer
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *timeoutQueue;

  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.movstreamwriter.timeout", 0);
  timeoutQueue = self->_timeoutQueue;
  self->_timeoutQueue = v3;

  -[MOVStreamWriter resubmitTimeoutBlock](self, "resubmitTimeoutBlock");
}

- (void)resubmitTimeoutBlock
{
  dispatch_block_t v3;
  id timeoutBlock;
  double v5;
  dispatch_time_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __39__MOVStreamWriter_resubmitTimeoutBlock__block_invoke;
  v10 = &unk_24CA44D38;
  objc_copyWeak(&v11, &location);
  v3 = dispatch_block_create((dispatch_block_flags_t)0, &v7);
  timeoutBlock = self->_timeoutBlock;
  self->_timeoutBlock = v3;

  -[MOVStreamWriter finishingTimeout](self, "finishingTimeout", v7, v8, v9, v10);
  v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  dispatch_after(v6, (dispatch_queue_t)self->_timeoutQueue, self->_timeoutBlock);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __39__MOVStreamWriter_resubmitTimeoutBlock__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(WeakRetained, "status") == 4)
  {
    objc_msgSend(WeakRetained, "informDelegateAboutFinishingTimeout");
    objc_msgSend(WeakRetained, "forceFinishRecording");
  }

}

- (void)resetTimeoutRefTime
{
  id timeoutBlock;

  timeoutBlock = self->_timeoutBlock;
  if (timeoutBlock)
  {
    dispatch_block_cancel(timeoutBlock);
    -[MOVStreamWriter resubmitTimeoutBlock](self, "resubmitTimeoutBlock");
  }
}

- (void)cancelTimeoutBlock
{
  id timeoutBlock;

  timeoutBlock = self->_timeoutBlock;
  if (timeoutBlock)
    dispatch_block_cancel(timeoutBlock);
}

- (void)cancelRecording
{
  void *v2;
  MOVStreamWriter *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MOVStreamWriterState cancelRecording:](obj->_state, "cancelRecording:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamWriter activateNewState:byEvent:](obj, "activateNewState:byEvent:", v2, CFSTR("cancelRecording"));

  objc_sync_exit(obj);
}

- (void)clearAllFifoQueues
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *p_pair1;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *v11;
  BOOL v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *v14;
  id v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)self->m_streamDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
  if (begin_node != &self->m_streamDataMap.__tree_.__pair1_)
  {
    do
    {
      v5 = begin_node[14].__value_.__left_;
      objc_sync_enter(v5);
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v19 != v8)
              objc_enumerationMutation(v6);
            CFRelease((CFTypeRef)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "sampleBuffer"));
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v7);
      }

      objc_msgSend(v6, "removeAllObjects");
      objc_msgSend(begin_node[32].__value_.__left_, "setFifoItemCount:", 0);
      objc_sync_exit(v6);

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v11 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[2].__value_.__left_;
          v12 = v11->__value_.__left_ == begin_node;
          begin_node = v11;
        }
        while (!v12);
      }
      begin_node = v11;
    }
    while (v11 != p_pair1);
  }
  v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)self->m_metadataDataMap.__tree_.__begin_node_;
  v14 = &self->m_metadataDataMap.__tree_.__pair1_;
  if (v13 != v14)
  {
    do
    {
      v15 = v13[11].__value_.__left_;
      objc_sync_enter(v15);
      objc_msgSend(v15, "removeAllObjects");
      objc_msgSend(v13[15].__value_.__left_, "setFifoItemCount:", 0);
      objc_sync_exit(v15);

      v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v13[1].__value_.__left_;
      if (v16)
      {
        do
        {
          v17 = v16;
          v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v16->__value_.__left_;
        }
        while (v16);
      }
      else
      {
        do
        {
          v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v13[2].__value_.__left_;
          v12 = v17->__value_.__left_ == v13;
          v13 = v17;
        }
        while (!v12);
      }
      v13 = v17;
    }
    while (v17 != v14);
  }
}

- (void)forceFinishRecording
{
  void *v2;
  MOVStreamWriter *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MOVStreamWriterState forceFinishRecording:](obj->_state, "forceFinishRecording:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamWriter activateNewState:byEvent:](obj, "activateNewState:byEvent:", v2, CFSTR("forceFinishRecording"));

  objc_sync_exit(obj);
}

- (void)closeEncodersAfterFailure
{
  NSObject *v3;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *p_pair1;
  void *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *v8;
  BOOL v9;
  dispatch_time_t v10;
  NSObject *v11;
  __int16 v12[8];

  v3 = dispatch_group_create();
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)self->m_streamDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
  if (begin_node != p_pair1)
  {
    do
    {
      left = begin_node[13].__value_.__left_;
      if (left)
        objc_msgSend(left, "closeEncoderInDispatchGroup:", v3);
      v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[1].__value_.__left_;
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v7->__value_.__left_;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[2].__value_.__left_;
          v9 = v8->__value_.__left_ == begin_node;
          begin_node = v8;
        }
        while (!v9);
      }
      begin_node = v8;
    }
    while (v8 != p_pair1);
  }
  v10 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v3, v10))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 0;
      _os_log_impl(&dword_210675000, v11, OS_LOG_TYPE_ERROR, "Timeout closing encoders.", (uint8_t *)v12, 2u);
    }

  }
}

- (void)processForceFinishRecording
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v3, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording", buf, 2u);
  }

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__MOVStreamWriter_processForceFinishRecording__block_invoke;
  block[3] = &unk_24CA44D60;
  block[4] = self;
  dispatch_async(v4, block);

}

void __46__MOVStreamWriter_processForceFinishRecording__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  NSObject *v14;
  double v15;
  dispatch_time_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  NSObject *v23;
  NSObject *v24;
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t buf[16];

  v2 = (void *)MEMORY[0x212BC9B10]();
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v3, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 01", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "cancelTimeoutBlock");
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_210675000, v4, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 02", v30, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "clearAllFifoQueues");
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 03", v29, 2u);
  }

  v6 = dispatch_group_create();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD **)(v7 + 160);
  v9 = (_QWORD *)(v7 + 168);
  if (v8 != (_QWORD *)(v7 + 168))
  {
    do
    {
      v10 = (void *)v8[13];
      if (v10)
        objc_msgSend(v10, "closeEncoderInDispatchGroup:", v6);
      v11 = (_QWORD *)v8[1];
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (_QWORD *)v8[2];
          v13 = *v12 == (_QWORD)v8;
          v8 = v12;
        }
        while (!v13);
      }
      v8 = v12;
    }
    while (v12 != v9);
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 04", v28, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishingTimeout");
  v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
  dispatch_group_wait(v6, v16);
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_210675000, v17, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 05", v27, 2u);
  }

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(_QWORD **)(v18 + 160);
  v20 = (_QWORD *)(v18 + 168);
  if (v19 != (_QWORD *)(v18 + 168))
  {
    do
    {
      objc_msgSend((id)v19[9], "markAsFinished");
      objc_msgSend((id)v19[10], "markAsFinished");
      v21 = (_QWORD *)v19[1];
      if (v21)
      {
        do
        {
          v22 = v21;
          v21 = (_QWORD *)*v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          v22 = (_QWORD *)v19[2];
          v13 = *v22 == (_QWORD)v19;
          v19 = v22;
        }
        while (!v13);
      }
      v19 = v22;
    }
    while (v22 != v20);
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_210675000, v23, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 06", v26, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setFinalConsume:", 1);
  objc_msgSend(*(id *)(a1 + 32), "triggerWritingThread");
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_210675000, v24, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 07", v25, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishAVWriter");
  objc_autoreleasePoolPop(v2);
}

- (void)finishAVWriter
{
  NSObject *v3;
  AVAssetWriter *m_assetWriter;
  _QWORD v5[5];
  uint8_t buf[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v3, OS_LOG_TYPE_INFO, "[FINISH] finishAVWriter 01", buf, 2u);
  }

  m_assetWriter = self->m_assetWriter;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__MOVStreamWriter_finishAVWriter__block_invoke;
  v5[3] = &unk_24CA44D60;
  v5[4] = self;
  -[AVAssetWriter finishWritingWithCompletionHandler:](m_assetWriter, "finishWritingWithCompletionHandler:", v5);
}

void __33__MOVStreamWriter_finishAVWriter__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id *v5;
  void *v6;
  char v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  _BYTE v15[24];
  uint8_t buf[16];

  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v2, OS_LOG_TYPE_INFO, "[FINISH] finishAVWriter 02", buf, 2u);
  }

  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5[45], "criticalErrorOccurred:context:", v4, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "activateNewState:byEvent:", v6, CFSTR("finishAVWriter"));

    if ((v7 & 1) == 0)
      __assert_rtn("-[MOVStreamWriter finishAVWriter]_block_invoke", "MOVStreamWriter.mm", 2589, "0");
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "preserveSessionStartTime"))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionStartTime");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "outputURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v9 = +[MOVStreamIOUtility saveSessionStartTime:toMovieAtURL:error:](MOVStreamIOUtility, "saveSessionStartTime:toMovieAtURL:error:", v15, v8, &v14);
      v10 = v14;

      if (v9)
      {
        v4 = v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error saving sessionStartTime: %@"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "writerErrorWithMessage:code:", v11, 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "informDelegateAboutError:", v4);
      }
    }
    else
    {
      v4 = 0;
    }
    v12 = *(id **)(a1 + 32);
    objc_msgSend(v12[45], "nextFinishStep:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v12, "activateNewState:byEvent:", v13, CFSTR("finishAVWriter"));

    if ((v12 & 1) == 0)
      __assert_rtn("-[MOVStreamWriter finishAVWriter]_block_invoke", "MOVStreamWriter.mm", 2605, "0");
  }

  objc_sync_exit(v3);
}

- (void)processCancelRecording
{
  NSObject *m_processingQueue;
  _QWORD block[5];

  m_processingQueue = self->m_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__MOVStreamWriter_processCancelRecording__block_invoke;
  block[3] = &unk_24CA44D60;
  block[4] = self;
  dispatch_async(m_processingQueue, block);
}

void __41__MOVStreamWriter_processCancelRecording__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  v2 = (void *)MEMORY[0x212BC9B10]();
  v3 = *(id **)(a1 + 32);
  if (v3[10])
  {
    v4 = objc_msgSend(v3[10], "status");
    v3 = *(id **)(a1 + 32);
    if (v4 == 1)
    {
      objc_msgSend(v3[10], "cancelWriting");
      v3 = *(id **)(a1 + 32);
    }
  }
  objc_msgSend(v3, "clearAllFifoQueues");
  objc_msgSend(*(id *)(a1 + 32), "closeEncodersAfterFailure");
  objc_msgSend(*(id *)(a1 + 32), "setFinalConsume:", 1);
  objc_msgSend(*(id *)(a1 + 32), "triggerWritingThread");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__MOVStreamWriter_processCancelRecording__block_invoke_2;
  block[3] = &unk_24CA44D60;
  block[4] = v5;
  dispatch_async(v6, block);
  objc_autoreleasePoolPop(v2);
}

void __41__MOVStreamWriter_processCancelRecording__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__MOVStreamWriter_processCancelRecording__block_invoke_3;
  block[3] = &unk_24CA44D60;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __41__MOVStreamWriter_processCancelRecording__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  void *v5;

  v2 = (void *)MEMORY[0x212BC9B10]();
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v4 = *(id **)(a1 + 32);
  objc_msgSend(v4[45], "finishedCancelRecording:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateNewState:byEvent:", v5, CFSTR("processCancelRecording"));

  objc_sync_exit(v3);
  objc_autoreleasePoolPop(v2);
}

- (void)deleteFileOnCancel
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  id v8;
  id v9;

  v3 = (void *)objc_opt_new();
  -[NSURL path](self->m_writeURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) != 0)
  {
    -[NSURL path](self->m_writeURL, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v7 = objc_msgSend(v3, "removeItemAtPath:error:", v6, &v9);
    v8 = v9;

    if ((v7 & 1) == 0)
      -[MOVStreamWriter informDelegateAboutError:](self, "informDelegateAboutError:", v8);
  }
  else
  {
    v8 = 0;
  }

}

- (void)processFinishRecording
{
  NSObject *m_processingQueue;
  _QWORD block[5];

  m_processingQueue = self->m_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__MOVStreamWriter_processFinishRecording__block_invoke;
  block[3] = &unk_24CA44D60;
  block[4] = self;
  dispatch_async(m_processingQueue, block);
}

void __41__MOVStreamWriter_processFinishRecording__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  double v15;
  dispatch_time_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  id v32;
  NSObject *v33;
  id *v34;
  void *v35;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = (void *)MEMORY[0x212BC9B10]();
  objc_msgSend(*(id *)(a1 + 32), "logFifoUsage");
  v3 = dispatch_group_create();
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v4, OS_LOG_TYPE_DEBUG, "Close all VT encoders.", buf, 2u);
    }

  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 01", buf, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD **)(v6 + 160);
  v8 = (_QWORD *)(v6 + 168);
  if (v7 != (_QWORD *)(v6 + 168))
  {
    do
    {
      v9 = (void *)v7[13];
      if (v9)
        objc_msgSend(v9, "closeEncoderInDispatchGroup:", v3);
      v10 = (_QWORD *)v7[1];
      if (v10)
      {
        do
        {
          v11 = v10;
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v11 = (_QWORD *)v7[2];
          v12 = *v11 == (_QWORD)v7;
          v7 = v11;
        }
        while (!v12);
      }
      v7 = v11;
    }
    while (v11 != v8);
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v13, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 02", buf, 2u);
  }

  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_DEBUG, "Wait for encoders...", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "finishingTimeout");
  v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
  dispatch_group_wait(v3, v16);
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v17, OS_LOG_TYPE_DEBUG, "All encoders closed.", buf, 2u);
    }

  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v18, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 03", buf, 2u);
  }

  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(_QWORD **)(v19 + 160);
  v21 = (_QWORD *)(v19 + 168);
  if (v20 != (_QWORD *)(v19 + 168))
  {
    do
    {
      v22 = (void *)v20[13];
      if (v22)
      {
        v20[13] = 0;

      }
      v23 = (_QWORD *)v20[1];
      if (v23)
      {
        do
        {
          v24 = v23;
          v23 = (_QWORD *)*v23;
        }
        while (v23);
      }
      else
      {
        do
        {
          v24 = (_QWORD *)v20[2];
          v12 = *v24 == (_QWORD)v20;
          v20 = v24;
        }
        while (!v12);
      }
      v20 = v24;
    }
    while (v24 != v21);
  }

  objc_autoreleasePoolPop(v2);
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v25, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 04", buf, 2u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "checkIfFifoAreEmpty") & 1) != 0)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v26, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 05", buf, 2u);
    }

    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v27, OS_LOG_TYPE_INFO, "Last Trigger!", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setFinalConsume:", 1);
    objc_msgSend(*(id *)(a1 + 32), "triggerWritingThread");
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v28, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 06", buf, 2u);
    }

    v29 = *(_QWORD *)(a1 + 32);
    v30 = *(NSObject **)(v29 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__MOVStreamWriter_processFinishRecording__block_invoke_360;
    block[3] = &unk_24CA44D60;
    block[4] = v29;
    dispatch_async(v30, block);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logFifoUsage");
    v31 = *(id *)(a1 + 32);
    objc_sync_enter(v31);
    v32 = (id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", CFSTR("Late frames arrived from encoder. Drain fifos again..."), 0);
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v33, OS_LOG_TYPE_INFO, "Still frames in Fifo. Wait...", buf, 2u);
    }

    v34 = *(id **)(a1 + 32);
    objc_msgSend(v34[45], "finishRecording:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateNewState:byEvent:", v35, CFSTR("processFinishRecording-checkIfFifoAreEmpty"));

    objc_sync_exit(v31);
  }
}

void __41__MOVStreamWriter_processFinishRecording__block_invoke_360(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  os_signpost_id_t v7;
  _QWORD *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id *v22;
  void *v23;
  NSObject *v24;
  void *context;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x212BC9B10]();
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v2, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 07", buf, 2u);
  }

  v3 = os_signpost_id_generate(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 432));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD **)(v4 + 160);
  v6 = (_QWORD *)(v4 + 168);
  if (v5 != (_QWORD *)(v4 + 168))
  {
    v7 = v3;
    do
    {
      v8 = v5 + 4;
      if (*((char *)v5 + 55) < 0)
        v8 = (_QWORD *)*v8;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v5[24], "count"))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v32 = v9;
          _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_INFO, "Writing pending frame attachments for stream '%{public}@'.", buf, 0xCu);
        }

      }
      objc_msgSend((id)v5[24], "sortedArrayUsingComparator:", &__block_literal_global_3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v5[24], "removeAllObjects");
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v27;
LABEL_13:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v12);
          if ((objc_msgSend(*(id *)(a1 + 32), "writeVideoFrameStreamAttachmentsData:toMetadataAdaptor:ofStream:signpost:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15), v5[11], v9, v7) & 1) == 0)break;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            if (v13)
              goto LABEL_13;
            break;
          }
        }
      }

      v16 = (_QWORD *)v5[1];
      if (v16)
      {
        do
        {
          v17 = v16;
          v16 = (_QWORD *)*v16;
        }
        while (v16);
      }
      else
      {
        do
        {
          v17 = (_QWORD *)v5[2];
          v18 = *v17 == (_QWORD)v5;
          v5 = v17;
        }
        while (!v18);
      }
      v5 = v17;
    }
    while (v17 != v6);
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v19, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 08", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "cancelTimeoutBlock");
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v20, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 09", buf, 2u);
  }

  v21 = *(id *)(a1 + 32);
  objc_sync_enter(v21);
  v22 = *(id **)(a1 + 32);
  objc_msgSend(v22[45], "nextFinishStep:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = objc_msgSend(v22, "activateNewState:byEvent:", v23, CFSTR("processFinishRecording"));

  objc_sync_exit(v21);
  if ((v22 & 1) != 0)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v24, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 10", buf, 2u);
    }

  }
  objc_autoreleasePoolPop(context);
}

uint64_t __41__MOVStreamWriter_processFinishRecording__block_invoke_361(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  CMTime v8;
  CMTime time1;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CMTime v15;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    objc_msgSend(v4, "timeRange");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }
  *(_OWORD *)&v15.value = v12;
  v15.epoch = v13;
  if (v5)
  {
    objc_msgSend(v5, "timeRange");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }
  v10 = v12;
  v11 = v13;
  time1 = v15;
  *(_OWORD *)&v8.value = v12;
  v8.epoch = v13;
  v6 = CMTimeCompare(&time1, &v8);

  return v6;
}

- (void)checkForFinishing
{
  MOVStreamWriter *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint8_t v9[16];

  v2 = self;
  objc_sync_enter(v2);
  -[MOVStreamWriter state](v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stopWriterWhenFifosAreEmpty:", v2);

  if (v4 && -[MOVStreamWriter checkIfFifoAreEmpty](v2, "checkIfFifoAreEmpty"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_INFO, "FINISHING!", v9, 2u);
    }

    -[MOVStreamWriter state](v2, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextFinishStep:", v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MOVStreamWriter activateNewState:byEvent:](v2, "activateNewState:byEvent:", v7, CFSTR("checkForFinishing"));

    if (!v8)
      __assert_rtn("-[MOVStreamWriter checkForFinishing]", "MOVStreamWriter.mm", 2774, "0");
  }
  objc_sync_exit(v2);

}

- (void)triggerWritingThread
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_writingSema);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_writingMetadataSema);
}

- (int)getCountByPriorityForFifo:(unint64_t)a3 capacity:(unint64_t)a4
{
  if (a3 <= 2)
    return 1;
  else
    return 2;
}

- (void)startWritingThread
{
  id v3;
  NSThread *v4;
  NSThread *writeThread;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDD17F0]);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __37__MOVStreamWriter_startWritingThread__block_invoke;
  v9 = &unk_24CA44D38;
  objc_copyWeak(&v10, &location);
  v4 = (NSThread *)objc_msgSend(v3, "initWithBlock:", &v6);
  writeThread = self->_writeThread;
  self->_writeThread = v4;

  -[NSThread setName:](self->_writeThread, "setName:", CFSTR("MOVStreamWriter"), v6, v7, v8, v9);
  -[NSThread setQualityOfService:](self->_writeThread, "setQualityOfService:", 33);
  -[NSThread start](self->_writeThread, "start");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __37__MOVStreamWriter_startWritingThread__block_invoke(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD *v11;
  int v12;
  std::string *v13;
  unsigned int v14;
  id v15;
  int v16;
  NSObject *v17;
  opaqueCMSampleBuffer *v18;
  void *v19;
  NSObject *v20;
  Float64 v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char v27;
  id v28;
  NSObject *v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  int v33;
  int v34;
  _QWORD *v35;
  _QWORD *v36;
  BOOL v37;
  char *v38;
  void *v39;
  _QWORD *v40;
  std::string *v41;
  void *v42;
  id v43;
  int v44;
  int v45;
  NSObject *v46;
  NSObject *v47;
  Float64 Seconds;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  _QWORD *v52;
  void *v53;
  uint64_t v54;
  char v55;
  id v56;
  NSObject *v57;
  void *v58;
  BOOL v59;
  NSObject *v60;
  int v61;
  _QWORD *v62;
  _QWORD *v63;
  char *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  dispatch_time_t v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  os_signpost_id_t spid;
  unint64_t v78;
  NSObject *v79;
  os_signpost_id_t v80;
  NSObject *log;
  NSObject *v82;
  void *context;
  unint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  os_signpost_id_t v87;
  uint64_t v88;
  char v89;
  void *v90;
  char *WeakRetained;
  id v92;
  __int128 v93;
  uint64_t v94;
  CMTime v95;
  std::string v96;
  id v97;
  CMTime v98;
  CMTime time;
  _BYTE buf[32];
  __int128 v101;
  std::string v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "setThreadPriority:", 1.0) & 1) == 0)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v1, OS_LOG_TYPE_ERROR, "[WritingThread] Cannot set priority to 1.0.", buf, 2u);
      }

    }
    v2 = os_log_create("com.apple.movstreamwriter.writingthread", "PointsOfInterest");
    v3 = os_signpost_id_generate(v2);
    v79 = v2;
    v4 = os_signpost_id_generate(v2);
    v5 = WeakRetained;
    v87 = os_signpost_id_generate(*((os_log_t *)WeakRetained + 54));
    spid = v4;
    v78 = v4 - 1;
    v80 = v3;
    v86 = WeakRetained + 168;
    v84 = v3 - 1;
    v85 = WeakRetained + 216;
LABEL_7:
    if (objc_msgSend(v5, "canWriteData"))
    {
      v6 = v79;
      v7 = v6;
      log = v6;
      if (v78 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v8 = os_signpost_enabled(v6);
        v7 = log;
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_210675000, log, OS_SIGNPOST_INTERVAL_BEGIN, spid, "write thread", (const char *)&unk_2106EBECF, buf, 2u);
          v7 = log;
        }
      }

      while (1)
      {
        v9 = log;
        v10 = v9;
        if (v84 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_210675000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v80, "write fifo samples", (const char *)&unk_2106EBECF, buf, 2u);
        }
        v82 = v10;

        context = (void *)MEMORY[0x212BC9B10]();
        v11 = (_QWORD *)*((_QWORD *)WeakRetained + 20);
        if (v11 == v86)
        {
          v12 = 0;
          v89 = 0;
LABEL_68:
          v40 = (_QWORD *)*((_QWORD *)WeakRetained + 26);
          if (v40 == v85)
          {
LABEL_123:
            v33 = 0;
            if ((v89 & 1) == 0 && v12)
            {
              if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
              {
                +[MIOLog defaultLog](MIOLog, "defaultLog");
                v66 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&buf[4] = v12;
                  _os_log_impl(&dword_210675000, v66, OS_LOG_TYPE_DEBUG, "[WritingThread] nothing written (attempts: %d).", buf, 8u);
                }

              }
              v33 = 0;
            }
          }
          else
          {
            while (1)
            {
              if (*((char *)v40 + 55) < 0)
                std::string::__init_copy_ctor_external(&v96, (const std::string::value_type *)v40[4], v40[5]);
              else
                v96 = *(std::string *)(v40 + 4);
              if ((v96.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v41 = &v96;
              else
                v41 = (std::string *)v96.__r_.__value_.__r.__words[0];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v40[15], "setVisitCount:", objc_msgSend((id)v40[15], "visitCount") + 1);
              v43 = (id)v40[11];
              objc_sync_enter(v43);
              v44 = objc_msgSend(WeakRetained, "getCountByPriorityForFifo:capacity:", objc_msgSend((id)v40[11], "count"), v40[12]);
              if (v44 >= 1)
              {
                do
                {
                  if (objc_msgSend(v43, "count"))
                  {
                    objc_msgSend((id)v40[15], "setAttemptCount:", objc_msgSend((id)v40[15], "attemptCount") + 1);
                    v45 = objc_msgSend((id)v40[7], "isReadyForMoreMediaData");
                    ++v12;
                    if (!v45)
                    {
                      if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                        break;
                      +[MIOLog defaultLog](MIOLog, "defaultLog");
                      v46 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138543362;
                        *(_QWORD *)&buf[4] = v42;
                        _os_log_impl(&dword_210675000, v46, OS_LOG_TYPE_DEBUG, "[WritingThread] Input for %{public}@ not ready.", buf, 0xCu);
                      }
                      v33 = 0;
                      goto LABEL_122;
                    }
                    if (!objc_msgSend(v43, "count"))
                      goto LABEL_105;
                    objc_msgSend(v43, "firstObject");
                    v46 = objc_claimAutoreleasedReturnValue();
                    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                    {
                      +[MIOLog defaultLog](MIOLog, "defaultLog");
                      v47 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                      {
                        if (v46)
                        {
                          -[NSObject timeRange](v46, "timeRange");
                        }
                        else
                        {
                          v101 = 0u;
                          memset(buf, 0, sizeof(buf));
                        }
                        v95 = *(CMTime *)buf;
                        Seconds = CMTimeGetSeconds(&v95);
                        v49 = objc_msgSend(v43, "count");
                        v50 = v40[12];
                        LODWORD(v102.__r_.__value_.__l.__data_) = 138544130;
                        *(std::string::size_type *)((char *)v102.__r_.__value_.__r.__words + 4) = (std::string::size_type)v42;
                        WORD2(v102.__r_.__value_.__r.__words[1]) = 2048;
                        *(Float64 *)((char *)&v102.__r_.__value_.__r.__words[1] + 6) = Seconds;
                        HIWORD(v102.__r_.__value_.__r.__words[2]) = 2048;
                        v103 = v49;
                        v104 = 2048;
                        v105 = v50;
                        _os_log_impl(&dword_210675000, v47, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Consume (%{public}@) PTS: %f (%lu/%lu)", (uint8_t *)&v102, 0x2Au);
                      }

                    }
                    v51 = WeakRetained;
                    if (!WeakRetained[98])
                    {
                      if (v46)
                      {
                        v52 = WeakRetained;
                        -[NSObject timeRange](v46, "timeRange");
                      }
                      else
                      {
                        v101 = 0u;
                        memset(buf, 0, sizeof(buf));
                        v52 = WeakRetained;
                      }
                      v93 = *(_OWORD *)buf;
                      v94 = *(_QWORD *)&buf[16];
                      objc_msgSend(v52, "delegate");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      v54 = v52[1];
                      v92 = 0;
                      v55 = objc_msgSend(v52, "startSessionWithFallbackSampleTime:streamId:mediaType:writerDelegate:delegateCallbackQueue:error:", &v93, v42, 2, v53, v54, &v92);
                      v56 = v92;

                      if ((v55 & 1) == 0)
                      {
                        v64 = WeakRetained;
                        objc_sync_enter(v64);
                        objc_msgSend(*((id *)WeakRetained + 45), "criticalErrorOccurred:context:", v56, v64);
                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v64, "activateNewState:byEvent:", v65, CFSTR("startWritingThread-metadata"));

                        objc_sync_exit(v64);
                        v33 = 1;
LABEL_122:

                        v61 = v45 ^ 1;
                        goto LABEL_111;
                      }

                      v51 = WeakRetained;
                    }
                    if (objc_msgSend(v51, "canWriteData"))
                    {
                      objc_msgSend(WeakRetained, "writeMetadata:forStreamId:", v46, v42);
                      objc_msgSend((id)v40[15], "setWriteCount:", objc_msgSend((id)v40[15], "writeCount") + 1);
                      v89 = 1;
                    }
                    else
                    {
                      +[MIOLog defaultLog](MIOLog, "defaultLog");
                      v57 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(*((id *)WeakRetained + 45), "name");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543618;
                        *(_QWORD *)&buf[4] = v42;
                        *(_WORD *)&buf[12] = 2114;
                        *(_QWORD *)&buf[14] = v58;
                        _os_log_impl(&dword_210675000, v57, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: [FIFO] CANNOT Write Item of metadata stream '%{public}@' for state %{public}@ ⛔️⛔️⛔️", buf, 0x16u);

                      }
                    }
                    objc_msgSend(v43, "removeObjectAtIndex:", 0);
                    objc_msgSend((id)v40[15], "setFifoItemCount:", objc_msgSend(v43, "count"));
                    v59 = objc_msgSend(v43, "count") == 0;

                    if (v59)
                    {
LABEL_105:
                      if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                      {
                        +[MIOLog defaultLog](MIOLog, "defaultLog");
                        v60 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138543362;
                          *(_QWORD *)&buf[4] = v42;
                          _os_log_impl(&dword_210675000, v60, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Precheck All Fifo items written '%{public}@'", buf, 0xCu);
                        }

                      }
                      objc_msgSend(WeakRetained, "checkForFinishing");
                      break;
                    }
                  }
                  --v44;
                }
                while (v44);
              }
              v33 = 0;
              v61 = 1;
LABEL_111:
              objc_sync_exit(v43);

              if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v96.__r_.__value_.__l.__data_);
              if (!v61)
                break;
              v62 = (_QWORD *)v40[1];
              if (v62)
              {
                do
                {
                  v63 = v62;
                  v62 = (_QWORD *)*v62;
                }
                while (v62);
              }
              else
              {
                do
                {
                  v63 = (_QWORD *)v40[2];
                  v37 = *v63 == (_QWORD)v40;
                  v40 = v63;
                }
                while (!v37);
              }
              v40 = v63;
              if (v63 == v85)
                goto LABEL_123;
            }
          }
        }
        else
        {
          v89 = 0;
          v12 = 0;
          while (1)
          {
            objc_msgSend((id)v11[32], "setVisitCount:", objc_msgSend((id)v11[32], "visitCount") + 1);
            if (*((char *)v11 + 55) < 0)
              std::string::__init_copy_ctor_external(&v102, (const std::string::value_type *)v11[4], v11[5]);
            else
              v102 = *(std::string *)(v11 + 4);
            if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v13 = &v102;
            else
              v13 = (std::string *)v102.__r_.__value_.__r.__words[0];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(WeakRetained, "isAudioStream:", v11 + 7);
            v15 = (id)v11[14];
            objc_sync_enter(v15);
            v16 = objc_msgSend(WeakRetained, "getCountByPriorityForFifo:capacity:", objc_msgSend((id)v11[14], "count"), v11[15]);
            if (v16 >= 1)
            {
              v88 = v14;
              do
              {
                if (objc_msgSend((id)v11[14], "count"))
                {
                  objc_msgSend((id)v11[32], "setAttemptCount:", objc_msgSend((id)v11[32], "attemptCount") + 1);
                  ++v12;
                  if (!objc_msgSend((id)v11[9], "isReadyForMoreMediaData")
                    || !*((_BYTE *)v11 + 184) && !objc_msgSend((id)v11[10], "isReadyForMoreMediaData"))
                  {
                    if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                      break;
                    +[MIOLog defaultLog](MIOLog, "defaultLog");
                    v17 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      *(_QWORD *)&buf[4] = v90;
                      _os_log_impl(&dword_210675000, v17, OS_LOG_TYPE_DEBUG, "[WritingThread] Input for %{public}@ not ready.", buf, 0xCu);
                    }
                    v33 = 0;
                    v34 = 1;
                    goto LABEL_66;
                  }
                  if (!objc_msgSend(v15, "count"))
                    goto LABEL_45;
                  objc_msgSend(v15, "firstObject");
                  v17 = objc_claimAutoreleasedReturnValue();
                  v18 = (opaqueCMSampleBuffer *)-[NSObject sampleBuffer](v17, "sampleBuffer");
                  -[NSObject metadata](v17, "metadata");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                  {
                    +[MIOLog defaultLog](MIOLog, "defaultLog");
                    v20 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                    {
                      CMSampleBufferGetPresentationTimeStamp(&time, v18);
                      v21 = CMTimeGetSeconds(&time);
                      v22 = objc_msgSend(v15, "count");
                      v23 = v11[15];
                      *(_DWORD *)buf = 138544130;
                      *(_QWORD *)&buf[4] = v90;
                      *(_WORD *)&buf[12] = 2048;
                      *(Float64 *)&buf[14] = v21;
                      *(_WORD *)&buf[22] = 2048;
                      *(_QWORD *)&buf[24] = v22;
                      LOWORD(v101) = 2048;
                      *(_QWORD *)((char *)&v101 + 2) = v23;
                      _os_log_impl(&dword_210675000, v20, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Consume (%{public}@) PTS: %f (%lu/%lu)", buf, 0x2Au);
                    }

                  }
                  v24 = WeakRetained;
                  if (!WeakRetained[98])
                  {
                    CMSampleBufferGetPresentationTimeStamp(&v98, v18);
                    objc_msgSend(WeakRetained, "delegate");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v26 = *((_QWORD *)WeakRetained + 1);
                    v97 = 0;
                    v27 = objc_msgSend(WeakRetained, "startSessionWithFallbackSampleTime:streamId:mediaType:writerDelegate:delegateCallbackQueue:error:", &v98, v90, v88, v25, v26, &v97);
                    v28 = v97;

                    if ((v27 & 1) == 0)
                    {
                      v38 = WeakRetained;
                      objc_sync_enter(v38);
                      objc_msgSend(*((id *)WeakRetained + 45), "criticalErrorOccurred:context:", v28, v38);
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "activateNewState:byEvent:", v39, CFSTR("startWritingThread-sample"));

                      objc_sync_exit(v38);
                      v34 = 0;
                      v33 = 1;
LABEL_66:

                      goto LABEL_55;
                    }

                    v24 = WeakRetained;
                  }
                  if (objc_msgSend(v24, "canWriteData"))
                  {
                    objc_msgSend(WeakRetained, "writeSampleBuffer:andMetadata:forStreamId:signpost:", v18, v19, v90, v87);
                    objc_msgSend((id)v11[32], "setWriteCount:", objc_msgSend((id)v11[32], "writeCount") + 1);
                    v89 = 1;
                  }
                  else
                  {
                    +[MIOLog defaultLog](MIOLog, "defaultLog");
                    v29 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(*((id *)WeakRetained + 45), "name");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      *(_QWORD *)&buf[4] = v90;
                      *(_WORD *)&buf[12] = 2114;
                      *(_QWORD *)&buf[14] = v30;
                      _os_log_impl(&dword_210675000, v29, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: [FIFO] CANNOT Write Item of stream '%{public}@' for state %{public}@ ⛔️⛔️⛔️", buf, 0x16u);

                    }
                  }
                  objc_msgSend(v15, "removeObjectAtIndex:", 0);
                  objc_msgSend((id)v11[32], "setFifoItemCount:", objc_msgSend(v15, "count"));
                  CFRelease(v18);
                  v31 = objc_msgSend(v15, "count") == 0;

                  if (v31)
                  {
LABEL_45:
                    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                    {
                      +[MIOLog defaultLog](MIOLog, "defaultLog");
                      v32 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138543362;
                        *(_QWORD *)&buf[4] = v90;
                        _os_log_impl(&dword_210675000, v32, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Precheck All Fifo items written '%{public}@'", buf, 0xCu);
                      }

                    }
                    objc_msgSend(WeakRetained, "checkForFinishing");
                    break;
                  }
                }
                --v16;
              }
              while (v16);
            }
            v33 = 0;
            v34 = 1;
LABEL_55:
            objc_sync_exit(v15);

            if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v102.__r_.__value_.__l.__data_);
            if (!v34)
              break;
            v35 = (_QWORD *)v11[1];
            if (v35)
            {
              do
              {
                v36 = v35;
                v35 = (_QWORD *)*v35;
              }
              while (v35);
            }
            else
            {
              do
              {
                v36 = (_QWORD *)v11[2];
                v37 = *v36 == (_QWORD)v11;
                v11 = v36;
              }
              while (!v37);
            }
            v11 = v36;
            if (v36 == v86)
              goto LABEL_68;
          }
        }
        objc_autoreleasePoolPop(context);
        if (v33)
          break;
        v67 = v82;
        v68 = v67;
        if (v84 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_210675000, v68, OS_SIGNPOST_INTERVAL_END, v80, "write fifo samples", (const char *)&unk_2106EBECF, buf, 2u);
        }

        if ((v89 & 1) == 0)
        {
          if (!objc_msgSend(WeakRetained, "finalConsume"))
          {
            v69 = *((_QWORD *)WeakRetained + 4);
            v70 = dispatch_time(0, 11100000);
            dispatch_semaphore_wait(v69, v70);
            v71 = v68;
            v72 = v71;
            if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_210675000, v72, OS_SIGNPOST_INTERVAL_END, spid, "write thread", (const char *)&unk_2106EBECF, buf, 2u);
            }

            v5 = WeakRetained;
            objc_msgSend(WeakRetained, "setWriteThreadCount:", objc_msgSend(WeakRetained, "writeThreadCount") + 1);
            goto LABEL_7;
          }
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_210675000, v73, OS_LOG_TYPE_INFO, "[WritingThread] finalConsume", buf, 2u);
          }

          v74 = v68;
          v75 = v74;
          if (v78 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v74))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_210675000, v75, OS_SIGNPOST_INTERVAL_END, spid, "write thread", (const char *)&unk_2106EBECF, buf, 2u);
          }

          goto LABEL_146;
        }
      }
    }
    else
    {
LABEL_146:
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v76, OS_LOG_TYPE_INFO, "[WritingThread] Exiting writing loop.", buf, 2u);
      }

    }
  }

}

- (void)consumeMetadatOfMetadataStream:(id)a3
{
  id v4;
  NSObject *v5;
  MOVStreamWriter *v6;
  void *v7;
  char isKindOfClass;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_DEBUG, "consumeMetadatOfMetadataStream: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  v6 = self;
  objc_sync_enter(v6);
  -[MOVStreamWriter state](v6, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[MOVStreamWriter resetTimeoutRefTime](v6, "resetTimeoutRefTime");
  objc_sync_exit(v6);

  -[MOVStreamWriter triggerWritingThread](v6, "triggerWritingThread");
}

- (void)consumeSamplesOfVideoAudioStream:(id)a3
{
  id v4;
  NSObject *v5;
  MOVStreamWriter *v6;
  void *v7;
  char isKindOfClass;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_DEBUG, "consumeSamplesOfVideoAudioStream: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  v6 = self;
  objc_sync_enter(v6);
  -[MOVStreamWriter state](v6, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[MOVStreamWriter resetTimeoutRefTime](v6, "resetTimeoutRefTime");
  objc_sync_exit(v6);

  -[MOVStreamWriter triggerWritingThread](v6, "triggerWritingThread");
}

- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3 andMetadata:(id)a4 forStreamId:(id)a5 signpost:(unint64_t)a6
{
  id v10;
  uint64_t *v11;
  __uint64_t v12;
  OS_os_log *v13;
  NSObject *v14;
  char v15;
  OS_os_log *v16;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  _OWORD *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __uint64_t v27;
  unint64_t v28;
  NSObject *v29;
  void *v30;
  MOVStreamWriter *v31;
  void *v32;
  int32_t v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CMTime time2;
  CMTime time1;
  CMTime v42;
  void *__p[2];
  char v44;
  _BYTE v45[128];
  CMTime buf[2];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v35 = a4;
  v10 = objc_retainAutorelease(a5);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v10, "UTF8String"));
  v12 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v13 = self->_perfLogAVF;
  v14 = v13;
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
  {
    LOWORD(buf[0].value) = 0;
    _os_signpost_emit_with_name_impl(&dword_210675000, v14, OS_SIGNPOST_INTERVAL_BEGIN, a6, "mio.appendSampleBuffer", (const char *)&unk_2106EBECF, (uint8_t *)buf, 2u);
  }

  v15 = objc_msgSend((id)v11[2], "appendSampleBuffer:", a3);
  v16 = self->_perfLogAVF;
  v17 = v16;
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v16))
  {
    LOWORD(buf[0].value) = 0;
    _os_signpost_emit_with_name_impl(&dword_210675000, v17, OS_SIGNPOST_INTERVAL_END, a6, "mio.appendSampleBuffer", (const char *)&unk_2106EBECF, (uint8_t *)buf, 2u);
  }

  if ((v15 & 1) != 0)
  {
    v18 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v12;
    if (v18 > 0xA7D8C0)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf[0].value) = 138543618;
        *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v10;
        LOWORD(buf[0].flags) = 2048;
        *(_QWORD *)((char *)&buf[0].flags + 2) = v18;
        _os_log_impl(&dword_210675000, v19, OS_LOG_TYPE_ERROR, "[MIO PERF] duration %{public}@ %llu", (uint8_t *)buf, 0x16u);
      }

    }
    if (!v35 || *((_BYTE *)v11 + 128))
    {
LABEL_31:
      -[MOVStreamWriter informDelegateAboutMediaWrittenForStream:mediaType:](self, "informDelegateAboutMediaWrittenForStream:mediaType:", v10, v11[23]);
      goto LABEL_33;
    }
    objc_msgSend(v35, "timeRange");
    v42 = buf[0];
    if (objc_msgSend((id)v11[6], "frameReorderingEnabled"))
    {
      v20 = v11 + 18;
      if ((*((_BYTE *)v11 + 156) & 1) != 0)
      {
        *(_OWORD *)&time1.value = *v20;
        time1.epoch = v11[20];
        time2 = v42;
        v33 = CMTimeCompare(&time1, &time2);
        v34 = (void *)v11[17];
        if (v33 < 1)
        {
          objc_msgSend(v34, "sortedArrayUsingComparator:", &__block_literal_global_380);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v11[17], "removeAllObjects");
          objc_msgSend((id)v11[17], "addObject:", v35);
          *v20 = *(_OWORD *)&v42.value;
          v11[20] = v42.epoch;
        }
        else
        {
          objc_msgSend(v34, "addObject:", v35);
          v21 = 0;
        }
        goto LABEL_18;
      }
      *v20 = *(_OWORD *)&v42.value;
      v11[20] = v42.epoch;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v35);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v37;
LABEL_20:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(v22);
        v26 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v25);
        v27 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        if (!-[MOVStreamWriter writeVideoFrameStreamAttachmentsData:toMetadataAdaptor:ofStream:signpost:](self, "writeVideoFrameStreamAttachmentsData:toMetadataAdaptor:ofStream:signpost:", v26, v11[4], v10, a6))break;
        v28 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v27;
        if (v28 > 0xA7D8C0)
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf[0].value) = 138543618;
            *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v10;
            LOWORD(buf[0].flags) = 2048;
            *(_QWORD *)((char *)&buf[0].flags + 2) = v28;
            _os_log_impl(&dword_210675000, v29, OS_LOG_TYPE_INFO, "[MIO PERF a] %{public}@ duration %llu", (uint8_t *)buf, 0x16u);
          }

        }
        if (v23 == ++v25)
        {
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          if (v23)
            goto LABEL_20;
          break;
        }
      }
    }

    goto LABEL_31;
  }
  -[AVAssetWriter error](self->m_assetWriter, "error");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = self;
  objc_sync_enter(v31);
  -[MOVStreamWriterState criticalErrorOccurred:context:](v31->_state, "criticalErrorOccurred:context:", v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamWriter activateNewState:byEvent:](v31, "activateNewState:byEvent:", v32, CFSTR("writeSampleBuffer"));

  objc_sync_exit(v31);
LABEL_33:
  if (v44 < 0)
    operator delete(__p[0]);

}

uint64_t __70__MOVStreamWriter_writeSampleBuffer_andMetadata_forStreamId_signpost___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  CMTime v8;
  CMTime time1;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CMTime v15;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    objc_msgSend(v4, "timeRange");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }
  *(_OWORD *)&v15.value = v12;
  v15.epoch = v13;
  if (v5)
  {
    objc_msgSend(v5, "timeRange");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }
  v10 = v12;
  v11 = v13;
  time1 = v15;
  *(_OWORD *)&v8.value = v12;
  v8.epoch = v13;
  v6 = CMTimeCompare(&time1, &v8);

  return v6;
}

- (BOOL)writeVideoFrameStreamAttachmentsData:(id)a3 toMetadataAdaptor:(id)a4 ofStream:(id)a5 signpost:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t *v13;
  CMTimeFlags v14;
  CMTimeEpoch v15;
  void *v16;
  Float64 Seconds;
  void *v18;
  void *v19;
  OS_os_log *v20;
  NSObject *v21;
  char v22;
  OS_os_log *v23;
  NSObject *v24;
  uint64_t *v25;
  _BOOL4 v26;
  void *v27;
  MOVStreamWriter *v28;
  void *v29;
  CMTime v31;
  CMTime time;
  CMTime time2;
  CMTime time1;
  uint8_t buf[16];
  __int128 v36;
  __int128 v37;
  CMTime v38;
  const void *v39[2];
  char v40;
  CMTimeValue v41;
  CMTimeScale v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = objc_retainAutorelease(a5);
  std::string::basic_string[abi:ne180100]<0>(v39, (char *)objc_msgSend(v12, "UTF8String"));
  *(_QWORD *)buf = v39;
  v13 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->m_lastPtsForAttachmentsStream, v39, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
  v41 = v13[7];
  v14 = *((_DWORD *)v13 + 17);
  v42 = *((_DWORD *)v13 + 16);
  v15 = v13[9];
  if (v10)
  {
    objc_msgSend(v10, "timeRange");
  }
  else
  {
    v37 = 0u;
    *(_OWORD *)buf = 0u;
    v36 = 0u;
  }
  *(_OWORD *)&v38.value = *(_OWORD *)buf;
  v38.epoch = v36;
  if ((v14 & 1) == 0
    || (time1.timescale = v42,
        time1.flags = v14,
        time1.epoch = v15,
        time2 = v38,
        time1.value = v41,
        CMTimeCompare(&time1, &time2) < 0))
  {
    v20 = self->_perfLogAVF;
    v21 = v20;
    if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210675000, v21, OS_SIGNPOST_INTERVAL_BEGIN, a6, "mio.att_appendTimedMetadataGroup", (const char *)&unk_2106EBECF, buf, 2u);
    }

    v22 = objc_msgSend(v11, "appendTimedMetadataGroup:", v10);
    v23 = self->_perfLogAVF;
    v24 = v23;
    if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210675000, v24, OS_SIGNPOST_INTERVAL_END, a6, "mio.att_appendTimedMetadataGroup", (const char *)&unk_2106EBECF, buf, 2u);
    }

    if ((v22 & 1) != 0)
    {
      *(_QWORD *)buf = v39;
      v25 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->m_lastPtsForAttachmentsStream, v39, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
      *(CMTime *)(v25 + 7) = v38;
      v26 = 1;
      goto LABEL_17;
    }
    -[AVAssetWriter error](self->m_assetWriter, "error");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = self;
    objc_sync_enter(v28);
    -[MOVStreamWriterState criticalErrorOccurred:context:](v28->_state, "criticalErrorOccurred:context:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamWriter activateNewState:byEvent:](v28, "activateNewState:byEvent:", v29, CFSTR("writeMetadataOfSample"));

    objc_sync_exit(v28);
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    time = v38;
    Seconds = CMTimeGetSeconds(&time);
    v31.value = v41;
    v31.timescale = v42;
    v31.flags = v14;
    v31.epoch = v15;
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Sample buffers attachments appended with presentation timestamp (%f) less than (or equal to) previous sample buffer (%f) for stream '%@'. Inconsistency!"), *(_QWORD *)&Seconds, CMTimeGetSeconds(&v31), v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v18, 15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamWriter informDelegateAboutError:](self, "informDelegateAboutError:", v19);

  }
  v26 = 0;
LABEL_17:
  if ((v40 & 0x80000000) == 0)
  {
    if (!v26)
      goto LABEL_22;
    goto LABEL_21;
  }
  operator delete((void *)v39[0]);
  if (v26)
LABEL_21:
    LOBYTE(v26) = 1;
LABEL_22:

  return v26;
}

- (void)writeMetadata:(id)a3 forStreamId:(id)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  uint64_t *v9;
  NSObject *v10;
  OS_os_log *v11;
  NSObject *v12;
  os_signpost_id_t avfAppendMetadataSignPost;
  int v14;
  OS_os_log *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  void *v19;
  MOVStreamWriter *v20;
  void *v21;
  void *__p[2];
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  if (v6)
  {
    v9 = v8;
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v7;
        _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_DEBUG, "writeMetadata: call 'metadataAdaptor appendTimedMetadataGroup' for stream: %@", buf, 0xCu);
      }

    }
    v11 = self->_perfLogAVF;
    v12 = v11;
    avfAppendMetadataSignPost = self->_avfAppendMetadataSignPost;
    if (avfAppendMetadataSignPost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210675000, v12, OS_SIGNPOST_INTERVAL_BEGIN, avfAppendMetadataSignPost, "mio.append.timed.metadata.group", (const char *)&unk_2106EBECF, buf, 2u);
    }

    v14 = objc_msgSend((id)v9[1], "appendTimedMetadataGroup:", v6);
    v15 = self->_perfLogAVF;
    v16 = v15;
    v17 = self->_avfAppendMetadataSignPost;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210675000, v16, OS_SIGNPOST_INTERVAL_END, v17, "mio.append.timed.metadata.group", (const char *)&unk_2106EBECF, buf, 2u);
    }

    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v7;
        v26 = 1024;
        v27 = v14;
        _os_log_impl(&dword_210675000, v18, OS_LOG_TYPE_DEBUG, "writeMetadata: call 'metadataAdaptor appendTimedMetadataGroup' for stream: %@ Success: %d", buf, 0x12u);
      }

    }
    if ((v14 & 1) != 0)
    {
      -[MOVStreamWriter informDelegateAboutMediaWrittenForStream:mediaType:](self, "informDelegateAboutMediaWrittenForStream:mediaType:", v7, 2);
    }
    else
    {
      -[AVAssetWriter error](self->m_assetWriter, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = self;
      objc_sync_enter(v20);
      -[MOVStreamWriterState criticalErrorOccurred:context:](v20->_state, "criticalErrorOccurred:context:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOVStreamWriter activateNewState:byEvent:](v20, "activateNewState:byEvent:", v21, CFSTR("writeMetadata"));

      objc_sync_exit(v20);
    }
  }
  if (v23 < 0)
    operator delete(__p[0]);

}

- (double)getExpectedFrameRateForStream:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double m_expectedFrameRate;
  void *__p[2];
  char v13;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "objectForKey:", CFSTR("ExpectedFrameRateForStream")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        (v8 = v7) != 0))
  {
    objc_msgSend(v7, "doubleValue");
    m_expectedFrameRate = v9;

  }
  else
  {
    m_expectedFrameRate = self->m_expectedFrameRate;
  }

  if (v13 < 0)
    operator delete(__p[0]);

  return m_expectedFrameRate;
}

- (CGAffineTransform)getVideoTransformForStream:(SEL)a3
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __int128 v10;
  CGAffineTransform *result;
  void *__p[2];
  char v13;

  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  v8 = v7;
  if (v7
    && (objc_msgSend(v7, "objectForKey:", CFSTR("VideoTransform")),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    +[MOVStreamIOUtility CGAffineTransformValueFromNSValue:](MOVStreamIOUtility, "CGAffineTransformValueFromNSValue:", v9);

  }
  else
  {
    v10 = *(_OWORD *)&self->m_videoTransform.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&self->m_videoTransform.a;
    *(_OWORD *)&retstr->c = v10;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&self->m_videoTransform.tx;
  }

  if (v13 < 0)
    operator delete(__p[0]);

  return result;
}

- (int)encoderTypeForStream:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *__p[2];
  char v11;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v6 = v5;
  if (!v5)
    __assert_rtn("-[MOVStreamWriter encoderTypeForStream:]", "MOVStreamWriter.mm", 3260, "configuration");
  objc_msgSend(v5, "objectForKey:", CFSTR("StreamEncoderType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if (v11 < 0)
    operator delete(__p[0]);

  return v8;
}

- (void)setupAssetWriterStreamInputsWithError:(id *)a3
{
  char *begin;
  uint64_t **p_m_streamDataMap;
  uint64_t *v5;
  const std::string::value_type *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  _BOOL4 v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  MOVStreamVideoEncoderInterface *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  MOVStreamVideoEncoderInterface *v21;
  uint64_t v22;
  void *v23;
  int v24;
  const void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  uint64_t MediaType;
  void *v30;
  const void *v31;
  void *v32;
  int v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  __int128 v62;
  id WeakRetained;
  char v64;
  void *v65;
  void *v66;
  opaqueCMFormatDescription *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  char v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  id *location;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  char *end;
  void *v88;
  map<std::string, (anonymous namespace)::StreamRecordingData, std::less<std::string>, std::allocator<std::pair<const std::string, (anonymous namespace)::StreamRecordingData>>> *v89;
  void *v90;
  void *v91;
  void *v93;
  std::string v94;
  _QWORD v95[13];
  _QWORD v96[2];
  uint64_t v97;
  _QWORD v98[5];
  _QWORD v99[9];
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  const void *v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  begin = (char *)self->m_orderedStreamNames.__begin_;
  end = (char *)self->m_orderedStreamNames.__end_;
  if (begin != end)
  {
    p_m_streamDataMap = (uint64_t **)&self->m_streamDataMap;
    location = (id *)&self->_delegate;
    v85 = (void *)*MEMORY[0x24BDB1D50];
    v80 = (void *)*MEMORY[0x24BDB1CF0];
    v77 = *MEMORY[0x24BDB20E8];
    v78 = *MEMORY[0x24BDB1D10];
    v89 = &self->m_streamDataMap;
    while (1)
    {
      v6 = begin;
      if (begin[23] < 0)
        v6 = *(const std::string::value_type **)begin;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      +[MOVStreamOutputSettings outputSettingsForStream:defaultFrameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "outputSettingsForStream:defaultFrameRate:enableAVEHighPerformanceProfile:", v5, self->m_enableAVEHighPerformanceProfile, self->m_expectedFrameRate);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v93;
      v90 = v7;
      if (!v7)
        goto LABEL_29;
      objc_msgSend(v7, "settings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == 0;

      if (v10)
        break;
      v8 = v93;
      objc_msgSend(v90, "settings");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = -[MOVStreamWriter inProcessRecording](self, "inProcessRecording");
      v91 = (void *)v11;
      if (v11)
        v13 = v12;
      else
        v13 = 0;
      if (v13)
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v101 = v93;
          _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_ERROR, "MOVStreamWriter.inProcessRecording requires custom or none encoder settings. Encoding for stream %{public}@ will not performed in process!", buf, 0xCu);
        }
LABEL_20:

        v8 = v93;
      }
LABEL_30:
      MediaType = CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)*v5);
      +[MIOMediaTypeUtility matchingAVMediaTypeFromCMType:](MIOMediaTypeUtility, "matchingAVMediaTypeFromCMType:", MediaType);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v5[23] = +[MIOMediaTypeUtility matchingMIOMediaTypeFromCMType:](MIOMediaTypeUtility, "matchingMIOMediaTypeFromCMType:", MediaType);
      if (*v5)
      {
        if (!v30)
          goto LABEL_39;
      }
      else
      {
        v35 = v85;

        v5[23] = 0;
        v30 = v35;
        v8 = v93;
        if (!v35)
        {
LABEL_39:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported media type (%d) for stream '%@'."), MediaType, v8);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a3, v36, 11);

LABEL_41:
          v38 = 1;
          goto LABEL_101;
        }
      }
      if (!-[AVAssetWriter canApplyOutputSettings:forMediaType:](self->m_assetWriter, "canApplyOutputSettings:forMediaType:", v91, v30))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to use output settings (%@) for track '%@'."), v91, v8);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a3, v37, 11);

        goto LABEL_41;
      }
      v84 = *((_DWORD *)v5 + 52);
      if (v84 <= 0)
        v84 = -[MOVStreamWriter baseMediaTimeScale](self, "baseMediaTimeScale");
      v31 = (const void *)objc_msgSend((id)v5[11], "createTrackFormatDescriptionFromStreamData:", v5);
      +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "skipSourceHint");

      if (v33)
      {
        v34 = v93;
        if (v31)
        {
          CFRelease(v31);
          v31 = 0;
        }
      }
      else
      {
        v34 = v93;
      }
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v101 = v34;
        _os_log_impl(&dword_210675000, v39, OS_LOG_TYPE_INFO, "Will add AVAssetWriterInput for stream '%{public}@'", buf, 0xCu);
      }

      if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          v101 = v93;
          v102 = 2114;
          v103 = v91;
          v104 = 2114;
          v105 = v31;
          _os_log_impl(&dword_210675000, v40, OS_LOG_TYPE_DEBUG, "Will add AVAssetWriterInput for stream '%{public}@' with outputSettings: %{public}@ \n sourceFormatHint: %{public}@", buf, 0x20u);
        }

      }
      v41 = objc_msgSend(objc_alloc(MEMORY[0x24BDB2408]), "initWithMediaType:outputSettings:sourceFormatHint:", v30, v91, v31);
      v42 = (void *)v5[2];
      v5[2] = v41;

      if (v31)
        CFRelease(v31);
      if (v30 != v80)
        objc_msgSend((id)v5[2], "setMediaTimeScale:", v84);
      if (v30 == v85)
      {
        -[MOVStreamWriter getVideoTransformForStream:](self, "getVideoTransformForStream:", v93);
        *(_OWORD *)v95 = *(_OWORD *)&v95[7];
        *(_OWORD *)&v95[2] = *(_OWORD *)&v95[9];
        *(_OWORD *)&v95[4] = *(_OWORD *)&v95[11];
        objc_msgSend((id)v5[2], "setTransform:", v95);
      }
      objc_msgSend((id)v5[2], "setExpectsMediaDataInRealTime:", self->m_realtime);
      if (-[MOVStreamWriter legacyKeysMode](self, "legacyKeysMode"))
      {
        -[MOVStreamWriter getTrackMetadataForStream:](self, "getTrackMetadataForStream:", v93);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v99[0] = v83;
        -[MOVStreamWriter getLegacyTrackMetadataForStream:](self, "getLegacyTrackMetadataForStream:", v93);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v99[1] = v82;
        -[MOVStreamWriter getTrackInputPixelFormatMetadataForStream:fromMap:](self, "getTrackInputPixelFormatMetadataForStream:fromMap:", v93, v89);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v99[2] = v81;
        -[MOVStreamWriter getTrackEncodedPixelFormatMetadataForStream:fromMap:](self, "getTrackEncodedPixelFormatMetadataForStream:fromMap:", v93, v89);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v99[3] = v43;
        -[MOVStreamWriter getLegacyTrackInputPixelFormatMetadataForStream:fromMap:](self, "getLegacyTrackInputPixelFormatMetadataForStream:fromMap:", v93, v89);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v99[4] = v44;
        -[MOVStreamWriter getLegacyTrackEncodedPixelFormatMetadataForStream:fromMap:](self, "getLegacyTrackEncodedPixelFormatMetadataForStream:fromMap:", v93, v89);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v99[5] = v45;
        -[MOVStreamWriter getLegacyTrackMetadataForAttachmentsSerializationMode:fromMap:](self, "getLegacyTrackMetadataForAttachmentsSerializationMode:fromMap:", v93, v89);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v99[6] = v46;
        -[MOVStreamWriter getTrackMetadataForAttachmentsSerializationMode:fromMap:](self, "getTrackMetadataForAttachmentsSerializationMode:fromMap:", v93, v89);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v99[7] = v47;
        -[MOVStreamWriter getTrackMetadataForTrackTypeInfo:fromMap:](self, "getTrackMetadataForTrackTypeInfo:fromMap:", v93, v89);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v99[8] = v48;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 9);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = (void *)objc_msgSend(v49, "mutableCopy");

      }
      else
      {
        -[MOVStreamWriter getTrackMetadataForStream:](self, "getTrackMetadataForStream:", v93);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v98[0] = v83;
        -[MOVStreamWriter getTrackInputPixelFormatMetadataForStream:fromMap:](self, "getTrackInputPixelFormatMetadataForStream:fromMap:", v93, v89);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v98[1] = v82;
        -[MOVStreamWriter getTrackEncodedPixelFormatMetadataForStream:fromMap:](self, "getTrackEncodedPixelFormatMetadataForStream:fromMap:", v93, v89);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v98[2] = v81;
        -[MOVStreamWriter getTrackMetadataForAttachmentsSerializationMode:fromMap:](self, "getTrackMetadataForAttachmentsSerializationMode:fromMap:", v93, v89);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v98[3] = v43;
        -[MOVStreamWriter getTrackMetadataForTrackTypeInfo:fromMap:](self, "getTrackMetadataForTrackTypeInfo:fromMap:", v93, v89);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v98[4] = v44;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 5);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = (void *)objc_msgSend(v45, "mutableCopy");
      }

      if (v5[13] && v5[14])
      {
        -[MOVStreamWriter createRelatedToStreamMetadata:](self, "createRelatedToStreamMetadata:");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "addObject:", v50);

        -[MOVStreamWriter createRelationSpecifierMetadata:](self, "createRelationSpecifierMetadata:", v5[14]);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "addObject:", v51);

      }
      -[MOVStreamWriter getTrackMetadataForExactBytesPerRow:fromMap:error:](self, "getTrackMetadataForExactBytesPerRow:fromMap:error:", v93, v89, a3);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v52;
      if (!*a3 || v52)
      {
        if (v52)
          objc_msgSend(v88, "addObject:", v52);
        objc_msgSend(MEMORY[0x24BDB2588], "qtTrackMetadataItemsForStreamId:", v93);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "addObjectsFromArray:", v54);

        v55 = v88;
        if (+[MIOPixelBufferUtility isPixelFormatRawBayer:](MIOPixelBufferUtility, "isPixelFormatRawBayer:", -[MOVStreamWriter getPixelFormatForStream:fromMap:](self, "getPixelFormatForStream:fromMap:", v93, v89)))
        {
          -[MOVStreamWriter getTrackMetadataForRawBayerRearrangeType:fromMap:](self, "getTrackMetadataForRawBayerRearrangeType:fromMap:", v93, v89);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (v56)
            objc_msgSend(v88, "addObject:", v56);

          v55 = v88;
        }
        objc_msgSend((id)v5[5], "objectForKey:", CFSTR("OutputPixelFormatOverride"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v57;
        if (v57)
        {
          objc_msgSend(MEMORY[0x24BDB2588], "trackMetadataItemWithOutputPixelFormatOverride:", objc_msgSend(v57, "intValue"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59)
            objc_msgSend(v55, "addObject:", v59);

          v55 = v88;
        }
        -[MOVStreamWriter customTrackMetadataForStream:fromMap:](self, "customTrackMetadataForStream:fromMap:", v93, v89);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60)
          objc_msgSend(v55, "addObjectsFromArray:", v60);
        v61 = (void *)objc_msgSend(v55, "copy");
        objc_msgSend((id)v5[2], "setMetadata:", v61);

        if (begin[23] < 0)
        {
          std::string::__init_copy_ctor_external(&v94, *(const std::string::value_type **)begin, *((_QWORD *)begin + 1));
        }
        else
        {
          v62 = *(_OWORD *)begin;
          v94.__r_.__value_.__r.__words[2] = *((_QWORD *)begin + 2);
          *(_OWORD *)&v94.__r_.__value_.__l.__data_ = v62;
        }
        objc_msgSend((id)v5[2], "setMarksOutputTrackAsEnabled:", -[MOVStreamWriter marksOutputTracksAsEnabledForStream:fromMap:](self, "marksOutputTracksAsEnabledForStream:fromMap:", &v94, v89));
        if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v94.__r_.__value_.__l.__data_);
        if (*((_BYTE *)v5 + 128))
        {
          if (-[AVAssetWriter canAddInput:](self->m_assetWriter, "canAddInput:", v5[2]))
          {
            -[AVAssetWriter addInput:](self->m_assetWriter, "addInput:", v5[2]);
            WeakRetained = objc_loadWeakRetained(location);
            v64 = objc_opt_respondsToSelector();

            if ((v64 & 1) != 0)
            {
              v65 = objc_loadWeakRetained(location);
              v97 = v5[2];
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v97, 1);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "streamWriter:stream:preparedTrackInputs:mediaType:", self, v93, v66, v5[23]);
              goto LABEL_85;
            }
            v38 = 0;
LABEL_99:

            goto LABEL_100;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't add stream input to the asset writer to stream: %@"), v93);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a3, v65, 13);
LABEL_97:
          v38 = 1;
LABEL_98:

          goto LABEL_99;
        }
        v67 = -[MOVStreamWriter createMetadataFormatDescription:](self, "createMetadataFormatDescription:", CFSTR("mdta/com.apple.stream_sample_attachments"));
        if (!v67)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to get metadata format description for stream: %@"), v93);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a3, v65, 12);
          goto LABEL_97;
        }
        v68 = objc_msgSend(objc_alloc(MEMORY[0x24BDB2408]), "initWithMediaType:outputSettings:sourceFormatHint:", v78, 0, v67);
        v69 = (void *)v5[3];
        v5[3] = v68;

        CFRelease(v67);
        +[MOVStreamIOUtility qtTrackNameForAssociatedAttachmentsTrack:](MOVStreamIOUtility, "qtTrackNameForAssociatedAttachmentsTrack:", v93);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDB2588], "qtTrackMetadataItemsForStreamId:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v5[3], "setMetadata:", v66);
        objc_msgSend((id)v5[3], "setMediaTimeScale:", v84);
        objc_msgSend((id)v5[3], "setExpectsMediaDataInRealTime:", self->m_realtime);
        objc_msgSend((id)v5[3], "addTrackAssociationWithTrackOfInput:type:", v5[2], v77);
        objc_msgSend(MEMORY[0x24BDB2410], "assetWriterInputMetadataAdaptorWithAssetWriterInput:", v5[3]);
        v70 = objc_claimAutoreleasedReturnValue();
        v71 = (void *)v5[4];
        v5[4] = v70;

        if (-[AVAssetWriter canAddInput:](self->m_assetWriter, "canAddInput:", v5[2])
          && -[AVAssetWriter canAddInput:](self->m_assetWriter, "canAddInput:", v5[3]))
        {
          -[AVAssetWriter addInput:](self->m_assetWriter, "addInput:", v5[2]);
          -[AVAssetWriter addInput:](self->m_assetWriter, "addInput:", v5[3]);
          v72 = objc_loadWeakRetained(location);
          v73 = objc_opt_respondsToSelector();

          if ((v73 & 1) != 0)
          {
            v74 = objc_loadWeakRetained(location);
            v75 = v5[3];
            v96[0] = v5[2];
            v96[1] = v75;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 2);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "streamWriter:stream:preparedTrackInputs:mediaType:", self, v93, v76, v5[23]);

            v38 = 0;
            goto LABEL_93;
          }
LABEL_85:
          v38 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't add stream and metadata inputs to the asset writer to stream: %@"), v93);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a3, v74, 13);
          v38 = 1;
LABEL_93:

        }
        goto LABEL_98;
      }
      v38 = 1;
LABEL_100:

LABEL_101:
      p_m_streamDataMap = (uint64_t **)&self->m_streamDataMap;
      if (!v38)
      {
        begin += 24;
        if (begin != end)
          continue;
      }
      return;
    }
    objc_msgSend(v90, "config");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;

    if (v16)
    {
      v21 = [MOVStreamVideoEncoderInterface alloc];
      objc_msgSend(v90, "expectedFrameRate");
      v22 = -[MOVStreamVideoEncoderInterface initWithExpectedFrameRate:forStream:delegate:enableAVEHighPerformanceProfile:](v21, "initWithExpectedFrameRate:forStream:delegate:enableAVEHighPerformanceProfile:", v93, self, self->m_enableAVEHighPerformanceProfile);
      v18 = (void *)v5[6];
      v5[6] = v22;
    }
    else
    {
      v17 = [MOVStreamVideoEncoderInterface alloc];
      objc_msgSend(v90, "config");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[MOVStreamVideoEncoderInterface initForStream:configuration:delegate:](v17, "initForStream:configuration:delegate:", v93, v18, self);
      v20 = (void *)v5[6];
      v5[6] = v19;

    }
    objc_msgSend((id)v5[6], "setCustomEncoderConfig:", objc_msgSend(v90, "useCustomEncoderConfig"));
    +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "disableVTPreSetup");

    if (v24)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v101 = v93;
        _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_INFO, "Pre-initialize VTCompressionSession for stream '%{public}@' disabled.", buf, 0xCu);
      }
      v91 = 0;
      goto LABEL_20;
    }
    v25 = (const void *)objc_msgSend((id)v5[11], "createTrackFormatDescriptionFromStreamData:", v5);
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v101 = v93;
      _os_log_impl(&dword_210675000, v26, OS_LOG_TYPE_INFO, "Pre-initialize VTCompressionSession for stream '%{public}@'...", buf, 0xCu);
    }

    v8 = v93;
    if ((objc_msgSend((id)v5[6], "preSetupWithFormatDescription:", v25) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Orig fd: %@  Used fd: %@"), *v5, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v101 = v93;
        v102 = 2114;
        v103 = v27;
        _os_log_impl(&dword_210675000, v28, OS_LOG_TYPE_INFO, "Pre-initialize VTCompressionSession for stream '%{public}@' failed (%{public}@)! Will try again after first pixel buffer is appended...", buf, 0x16u);
      }

      v8 = v93;
    }
    if (v25)
      CFRelease(v25);
LABEL_29:
    v91 = 0;
    goto LABEL_30;
  }
}

- (void)setupMetadataInputsWithError:(id *)a3
{
  _QWORD *begin;
  uint64_t *v4;
  _QWORD *v5;
  void *v6;
  opaqueCMFormatDescription *v7;
  __CFString *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _BOOL4 v27;
  id WeakRetained;
  char v29;
  void *v30;
  void *v31;
  void *v33;
  id *location;
  uint64_t v36;
  _QWORD *end;
  uint64_t v38;
  uint64_t **p_m_metadataDataMap;
  uint64_t v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  begin = self->m_orderedMetadataStreamNames.__begin_;
  end = self->m_orderedMetadataStreamNames.__end_;
  if (begin != end)
  {
    p_m_metadataDataMap = (uint64_t **)&self->m_metadataDataMap;
    location = (id *)&self->_delegate;
    v36 = *MEMORY[0x24BDB1D10];
    v38 = *MEMORY[0x24BDC0C38];
    while (1)
    {
      v5 = begin;
      if (*((char *)begin + 23) < 0)
        v5 = (_QWORD *)*begin;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (opaqueCMFormatDescription *)v4[2];
      if (!v7)
      {
        v8 = *((_BYTE *)v4 + 24) ? CFSTR("mdta/com.apple.rawIMUDict") : CFSTR("mdta/com.apple.metadata_stream_item");
        v7 = -[MOVStreamWriter createMetadataFormatDescription:](self, "createMetadataFormatDescription:", v8);
        if (!v7)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to get metadata format description for stream: %@"), v6);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a3, v33, 12);

          return;
        }
      }
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDB2408]), "initWithMediaType:outputSettings:sourceFormatHint:", v36, 0, v7);
      v10 = (id)*v4;
      *v4 = v9;

      v4[2] = 0;
      CFRelease(v7);
      v11 = *((unsigned int *)v4 + 18);
      if ((int)v11 <= 0)
        v11 = -[MOVStreamWriter baseMediaTimeScale](self, "baseMediaTimeScale");
      objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (*((_BYTE *)v4 + 24))
        v14 = CFSTR("mdta/com.apple.imuTrackType");
      else
        v14 = CFSTR("mdta/com.apple.track_kind");
      objc_msgSend(v12, "setIdentifier:", v14);
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v6;
        _os_log_impl(&dword_210675000, v15, OS_LOG_TYPE_INFO, "Setup metadata track with streamId \"%{public}@\", buf, 0xCu);
      }

      objc_msgSend(v13, "setDataType:", v38);
      objc_msgSend(v13, "setExtraAttributes:", 0);
      objc_msgSend(v13, "setValue:", v6);
      if (-[MOVStreamWriter legacyKeysMode](self, "legacyKeysMode"))
      {
        objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[MIOVersion versionZero](MIOVersion, "versionZero");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionedKey:modifier:", CFSTR("mdta/com.apple.track_kind"), CFSTR("metadata"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setIdentifier:", v18);

        if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v16, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v43 = v20;
            _os_log_impl(&dword_210675000, v19, OS_LOG_TYPE_DEBUG, "Setup metadata track with legacy identifier \"%{public}@\", buf, 0xCu);

          }
        }
        objc_msgSend(v16, "setDataType:", v38);
        objc_msgSend(v16, "setExtraAttributes:", 0);
        objc_msgSend(v16, "setValue:", v6);
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v13, v16, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v13, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[MOVStreamWriter getTrackMetadataForTimeRangeMetadata:fromMap:](self, "getTrackMetadataForTimeRangeMetadata:fromMap:", v6, p_m_metadataDataMap);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v22);
      -[MOVStreamWriter customMetadataTrackMetadataForStream:fromMap:](self, "customMetadataTrackMetadataForStream:fromMap:", v6, p_m_metadataDataMap);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
        objc_msgSend(v21, "addObjectsFromArray:", v23);
      objc_msgSend(MEMORY[0x24BDB2588], "qtTrackMetadataItemsForStreamId:", v6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectsFromArray:", v24);

      objc_msgSend((id)*v4, "setMetadata:", v21);
      objc_msgSend((id)*v4, "setMediaTimeScale:", v11);
      objc_msgSend((id)*v4, "setExpectsMediaDataInRealTime:", self->m_realtime);
      objc_msgSend(MEMORY[0x24BDB2410], "assetWriterInputMetadataAdaptorWithAssetWriterInput:", *v4);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v4[1];
      v4[1] = v25;

      v27 = -[AVAssetWriter canAddInput:](self->m_assetWriter, "canAddInput:", *v4);
      if (!v27)
        break;
      -[AVAssetWriter addInput:](self->m_assetWriter, "addInput:", *v4);
      WeakRetained = objc_loadWeakRetained(location);
      v29 = objc_opt_respondsToSelector();

      if ((v29 & 1) != 0)
      {
        v30 = objc_loadWeakRetained(location);
        v41 = *v4;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "streamWriter:stream:preparedTrackInputs:mediaType:", self, v6, v31, 2);

LABEL_30:
      }

      begin += 3;
      if (begin == end || !v27)
        return;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't add metadata input to the asset writer to stream: %@"), v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a3, v30, 13);
    goto LABEL_30;
  }
}

- (void)setupAssociatedMetadataInputsWithError:(id *)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *left;
  void *v6;
  void *v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  opaqueCMFormatDescription *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id WeakRetained;
  char v23;
  id v24;
  void *v25;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *v26;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *v27;
  BOOL v28;
  int v29;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *v30;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *v31;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *p_pair1;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t **p_m_streamDataMap;
  id *location;
  std::string v39;
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)self->m_associatedMetadataDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_associatedMetadataDataMap.__tree_.__pair1_;
  if (begin_node != &self->m_associatedMetadataDataMap.__tree_.__pair1_)
  {
    p_m_streamDataMap = (uint64_t **)&self->m_streamDataMap;
    v35 = *MEMORY[0x24BDB1D10];
    v36 = *MEMORY[0x24BDC0C38];
    v34 = *MEMORY[0x24BDB20E8];
    location = (id *)&self->_delegate;
    while (1)
    {
      left = begin_node + 4;
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
      {
        std::string::__init_copy_ctor_external(&v39, (const std::string::value_type *)begin_node[4].__value_.__left_, (std::string::size_type)begin_node[5].__value_.__left_);
        v6 = (void *)MEMORY[0x24BDD17C8];
        if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)left->__value_.__left_;
      }
      else
      {
        *(_OWORD *)&v39.__r_.__value_.__l.__data_ = *(_OWORD *)&left->__value_.__left_;
        v39.__r_.__value_.__r.__words[2] = (std::string::size_type)begin_node[6].__value_.__left_;
        v6 = (void *)MEMORY[0x24BDD17C8];
      }
      objc_msgSend(v6, "stringWithUTF8String:", left);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)begin_node[7].__value_.__left_;
      if (v8 != &begin_node[8])
      {
        while (1)
        {
          v9 = v8 + 4;
          if (SHIBYTE(v8[6].__value_.__left_) < 0)
            v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)v9->__value_.__left_;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *((unsigned int *)v11 + 52);
          if ((int)v12 <= 0)
            v12 = -[MOVStreamWriter baseMediaTimeScale](self, "baseMediaTimeScale");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mdta/%@"), v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setIdentifier:", v13);
          objc_msgSend(v14, "setDataType:", v36);
          objc_msgSend(v14, "setExtraAttributes:", 0);
          objc_msgSend(v14, "setValue:", v7);
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v43 = v7;
            v44 = 2114;
            v45 = v10;
            _os_log_impl(&dword_210675000, v15, OS_LOG_TYPE_INFO, "Setup associated metadata track for streamId \"%{public}@\" metadataId \"%{public}@\", buf, 0x16u);
          }

          v16 = (opaqueCMFormatDescription *)v8[9].__value_.__left_;
          if (!v16)
          {
            v16 = -[MOVStreamWriter createMetadataFormatDescription:](self, "createMetadataFormatDescription:", v13);
            if (!v16)
              break;
          }
          v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDB2408]), "initWithMediaType:outputSettings:sourceFormatHint:", v35, 0, v16);
          v18 = v8[7].__value_.__left_;
          v8[7].__value_.__left_ = (void *)v17;

          v8[9].__value_.__left_ = 0;
          CFRelease(v16);
          v41 = v14;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8[7].__value_.__left_, "setMetadata:", v19);

          objc_msgSend(v8[7].__value_.__left_, "setMediaTimeScale:", v12);
          objc_msgSend(v8[7].__value_.__left_, "setExpectsMediaDataInRealTime:", self->m_realtime);
          objc_msgSend(v8[7].__value_.__left_, "addTrackAssociationWithTrackOfInput:type:", v11[2], v34);
          objc_msgSend(MEMORY[0x24BDB2410], "assetWriterInputMetadataAdaptorWithAssetWriterInput:", v8[7].__value_.__left_);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v8[8].__value_.__left_;
          v8[8].__value_.__left_ = (void *)v20;

          if (!-[AVAssetWriter canAddInput:](self->m_assetWriter, "canAddInput:", v8[7].__value_.__left_))
            break;
          -[AVAssetWriter addInput:](self->m_assetWriter, "addInput:", v8[7].__value_.__left_);
          WeakRetained = objc_loadWeakRetained(location);
          v23 = objc_opt_respondsToSelector();

          if ((v23 & 1) != 0)
          {
            v24 = objc_loadWeakRetained(location);
            v40 = v11[3];
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "streamWriter:stream:preparedTrackInputs:mediaType:", self, v7, v25, 2);

          }
          v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)v8[1].__value_.__left_;
          if (v26)
          {
            do
            {
              v27 = v26;
              v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)v26->__value_.__left_;
            }
            while (v26);
          }
          else
          {
            do
            {
              v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)v8[2].__value_.__left_;
              v28 = v27->__value_.__left_ == v8;
              v8 = v27;
            }
            while (!v28);
          }
          v8 = v27;
          if (v27 == &begin_node[8])
            goto LABEL_26;
        }
        objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a3, CFSTR("Unable to get metadata format"), 13);

        goto LABEL_29;
      }
LABEL_26:
      v29 = 1;
LABEL_30:

      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v39.__r_.__value_.__l.__data_);
      if (v29)
      {
        v30 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)begin_node[1].__value_.__left_;
        if (v30)
        {
          do
          {
            v31 = v30;
            v30 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)v30->__value_.__left_;
          }
          while (v30);
        }
        else
        {
          do
          {
            v31 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)begin_node[2].__value_.__left_;
            v28 = v31->__value_.__left_ == begin_node;
            begin_node = v31;
          }
          while (!v28);
        }
        begin_node = v31;
        if (v31 != p_pair1)
          continue;
      }
      return;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot setup metadata associated with %@: %@ stream doesn't exist"), v7, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a3, v10, 13);
LABEL_29:

    v29 = 0;
    goto LABEL_30;
  }
}

- (unint64_t)fifoBufferSizeForStream:(id)a3
{
  id v4;
  uint64_t **p_m_streamDataMap;
  unint64_t v6;
  void *__p[2];
  char v9;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  p_m_streamDataMap = (uint64_t **)&self->m_streamDataMap;
  {
  }
  else
  {
    v6 = 0;
  }
  if (v9 < 0)
    operator delete(__p[0]);

  return v6;
}

- (void)setFifoBufferCapacity:(unint64_t)a3
{
  -[MOVStreamWriter setDefaultWritingBufferCapacity:](self, "setDefaultWritingBufferCapacity:");
  -[MOVStreamWriter setDefaultAudioWritingBufferCapacity:](self, "setDefaultAudioWritingBufferCapacity:", a3);
  -[MOVStreamWriter setDefaultMetadataWritingBufferCapacity:](self, "setDefaultMetadataWritingBufferCapacity:", a3);
}

- (BOOL)setVideoTransformFromOrientation:(int)a3
{
  uint64_t v3;
  int v5;
  CGFloat v6;
  __int128 v7;
  CGAffineTransform v9;

  v3 = *(_QWORD *)&a3;
  v5 = -[MOVStreamWriterState canConfigure:](self->_state, "canConfigure:", self);
  if (v5)
  {
    +[MOVStreamIOUtility transformAngleFromVideoOrientation:](MOVStreamIOUtility, "transformAngleFromVideoOrientation:", v3);
    CGAffineTransformMakeRotation(&v9, v6);
    v7 = *(_OWORD *)&v9.c;
    *(_OWORD *)&self->m_videoTransform.a = *(_OWORD *)&v9.a;
    *(_OWORD *)&self->m_videoTransform.c = v7;
    *(_OWORD *)&self->m_videoTransform.tx = *(_OWORD *)&v9.tx;
  }
  return v5;
}

- (void)prepareToRecord
{
  -[MOVStreamWriter prepareToRecordWithMovieMetadata:](self, "prepareToRecordWithMovieMetadata:", 0);
}

- (id)startWritingThreadForNonMetadataOnlyThreadId:(unsigned __int8)a3
{
  unsigned int v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  _QWORD *v12;
  id v13;
  _QWORD v14[3];
  char v15;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = v3;
  v4 = objc_alloc(MEMORY[0x24BDD17F0]);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __64__MOVStreamWriter_startWritingThreadForNonMetadataOnlyThreadId___block_invoke;
  v11 = &unk_24CA44DC8;
  objc_copyWeak(&v13, &location);
  v12 = v14;
  v5 = (void *)objc_msgSend(v4, "initWithBlock:", &v8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MOVStreamWriterSamples.%u"), v3, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);
  objc_msgSend(v5, "setQualityOfService:", 33);
  objc_msgSend(v5, "start");

  objc_destroyWeak(&v13);
  _Block_object_dispose(v14, 8);
  objc_destroyWeak(&location);
  return v5;
}

void __64__MOVStreamWriter_startWritingThreadForNonMetadataOnlyThreadId___block_invoke(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD *v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  char v16;
  std::string *v17;
  id v18;
  int v19;
  NSObject *v20;
  opaqueCMSampleBuffer *v21;
  void *v22;
  NSObject *v23;
  Float64 Seconds;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  id v31;
  NSObject *v32;
  void *v33;
  BOOL v34;
  NSObject *v35;
  int v36;
  int v37;
  _QWORD *v38;
  _QWORD *v39;
  BOOL v40;
  char *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  dispatch_time_t v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  int v54;
  os_signpost_id_t spid;
  id v56;
  unint64_t v57;
  NSObject *v58;
  os_signpost_id_t v59;
  NSObject *log;
  NSObject *v61;
  void *context;
  unint64_t v63;
  os_signpost_id_t v64;
  uint64_t v65;
  _QWORD *v67;
  char v68;
  void *v69;
  char *WeakRetained;
  id v71;
  CMTime v72;
  CMTime time;
  std::string v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  Float64 v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_102;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "setThreadPriority:", 1.0) & 1) == 0)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v1, OS_LOG_TYPE_ERROR, "[WritingThread] Cannot set priority to 1.0.", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.movstreamwriter.writingthread.%u"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = os_log_create((const char *)objc_msgSend(v56, "UTF8String"), "PointsOfInterest");
  v3 = os_signpost_id_generate(v2);
  v58 = v2;
  v4 = os_signpost_id_generate(v2);
  v5 = WeakRetained;
  v64 = os_signpost_id_generate(*((os_log_t *)WeakRetained + 54));
  spid = v4;
  v57 = v4 - 1;
  v59 = v3;
  v63 = v3 - 1;
  v67 = WeakRetained + 168;
  while (2)
  {
    if (!objc_msgSend(v5, "canWriteData"))
      goto LABEL_98;
    v6 = v58;
    v7 = v6;
    log = v6;
    if (v57 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v8 = os_signpost_enabled(v6);
      v7 = log;
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, log, OS_SIGNPOST_INTERVAL_BEGIN, spid, "write thread", (const char *)&unk_2106EBECF, buf, 2u);
        v7 = log;
      }
    }

    do
    {
      v9 = log;
      v10 = v9;
      if (v63 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v59, "write fifo samples", (const char *)&unk_2106EBECF, buf, 2u);
      }
      v61 = v10;

      context = (void *)MEMORY[0x212BC9B10]();
      v11 = (_QWORD *)*((_QWORD *)WeakRetained + 20);
      if (v11 == v67)
      {
        v68 = 0;
        goto LABEL_81;
      }
      v68 = 0;
      v12 = 0;
      do
      {
        v13 = objc_msgSend(WeakRetained, "isAudioStream:", v11 + 7);
        v14 = v13;
        v15 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        if (v15 == 255)
        {
          if ((v13 & 1) == 0)
            goto LABEL_65;
        }
        else
        {
          if (*((unsigned __int8 *)v11 + 268) == v15)
            v16 = v13;
          else
            v16 = 1;
          if ((v16 & 1) != 0)
            goto LABEL_65;
        }
        objc_msgSend((id)v11[32], "setVisitCount:", objc_msgSend((id)v11[32], "visitCount") + 1);
        if (*((char *)v11 + 55) < 0)
          std::string::__init_copy_ctor_external(&v74, (const std::string::value_type *)v11[4], v11[5]);
        else
          v74 = *(std::string *)(v11 + 4);
        if ((v74.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v17 = &v74;
        else
          v17 = (std::string *)v74.__r_.__value_.__r.__words[0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v17);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)v11[14];
        objc_sync_enter(v18);
        v19 = objc_msgSend(WeakRetained, "getCountByPriorityForFifo:capacity:", objc_msgSend((id)v11[14], "count"), v11[15]);
        if (v19 >= 1)
        {
          v65 = v14;
          do
          {
            if (objc_msgSend((id)v11[14], "count"))
            {
              objc_msgSend((id)v11[32], "setAttemptCount:", objc_msgSend((id)v11[32], "attemptCount") + 1);
              ++v12;
              if (!objc_msgSend((id)v11[9], "isReadyForMoreMediaData")
                || !*((_BYTE *)v11 + 184) && !objc_msgSend((id)v11[10], "isReadyForMoreMediaData"))
              {
                if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                  break;
                +[MIOLog defaultLog](MIOLog, "defaultLog");
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  v76 = v69;
                  _os_log_impl(&dword_210675000, v20, OS_LOG_TYPE_DEBUG, "[WritingThread] Input for %{public}@ not ready.", buf, 0xCu);
                }
                v36 = 0;
                v37 = 1;
                goto LABEL_73;
              }
              if (!objc_msgSend(v18, "count"))
                goto LABEL_52;
              objc_msgSend(v18, "firstObject");
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = (opaqueCMSampleBuffer *)-[NSObject sampleBuffer](v20, "sampleBuffer");
              -[NSObject metadata](v20, "metadata");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
              {
                +[MIOLog defaultLog](MIOLog, "defaultLog");
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  CMSampleBufferGetPresentationTimeStamp(&time, v21);
                  Seconds = CMTimeGetSeconds(&time);
                  v25 = objc_msgSend(v18, "count");
                  v26 = v11[15];
                  *(_DWORD *)buf = 138544130;
                  v76 = v69;
                  v77 = 2048;
                  v78 = Seconds;
                  v79 = 2048;
                  v80 = v25;
                  v81 = 2048;
                  v82 = v26;
                  _os_log_impl(&dword_210675000, v23, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Consume (%{public}@) PTS: %f (%lu/%lu)", buf, 0x2Au);
                }

              }
              v27 = WeakRetained;
              if (!WeakRetained[98])
              {
                CMSampleBufferGetPresentationTimeStamp(&v72, v21);
                objc_msgSend(WeakRetained, "delegate");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = *((_QWORD *)WeakRetained + 1);
                v71 = 0;
                v30 = objc_msgSend(WeakRetained, "startSessionWithFallbackSampleTime:streamId:mediaType:writerDelegate:delegateCallbackQueue:error:", &v72, v69, v65, v28, v29, &v71);
                v31 = v71;

                if ((v30 & 1) == 0)
                {
                  v41 = WeakRetained;
                  objc_sync_enter(v41);
                  objc_msgSend(*((id *)WeakRetained + 45), "criticalErrorOccurred:context:", v31, v41);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "activateNewState:byEvent:", v42, CFSTR("startWritingThreadForNonMetadataOnlyThreadId"));

                  objc_sync_exit(v41);
                  v37 = 0;
                  v36 = 1;
LABEL_73:

                  goto LABEL_62;
                }

                v27 = WeakRetained;
              }
              if (objc_msgSend(v27, "canWriteData"))
              {
                objc_msgSend(WeakRetained, "writeSampleBuffer:andMetadata:forStreamId:signpost:", v21, v22, v69, v64);
                objc_msgSend((id)v11[32], "setWriteCount:", objc_msgSend((id)v11[32], "writeCount") + 1);
                v68 = 1;
              }
              else
              {
                +[MIOLog defaultLog](MIOLog, "defaultLog");
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(*((id *)WeakRetained + 45), "name");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v76 = v69;
                  v77 = 2114;
                  v78 = *(double *)&v33;
                  _os_log_impl(&dword_210675000, v32, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: [FIFO] CANNOT Write Item of stream '%{public}@' for state %{public}@ ⛔️⛔️⛔️", buf, 0x16u);

                }
              }
              objc_msgSend(v18, "removeObjectAtIndex:", 0);
              objc_msgSend((id)v11[32], "setFifoItemCount:", objc_msgSend(v18, "count"));
              CFRelease(v21);
              v34 = objc_msgSend(v18, "count") == 0;

              if (v34)
              {
LABEL_52:
                if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                {
                  +[MIOLog defaultLog](MIOLog, "defaultLog");
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v76 = v69;
                    _os_log_impl(&dword_210675000, v35, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Precheck All Fifo items written '%{public}@'", buf, 0xCu);
                  }

                }
                objc_msgSend(WeakRetained, "checkForFinishing");
                break;
              }
            }
            --v19;
          }
          while (v19);
        }
        v36 = 0;
        v37 = 1;
LABEL_62:
        objc_sync_exit(v18);

        if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v74.__r_.__value_.__l.__data_);
        if (!v37)
          goto LABEL_82;
LABEL_65:
        v38 = (_QWORD *)v11[1];
        if (v38)
        {
          do
          {
            v39 = v38;
            v38 = (_QWORD *)*v38;
          }
          while (v38);
        }
        else
        {
          do
          {
            v39 = (_QWORD *)v11[2];
            v40 = *v39 == (_QWORD)v11;
            v11 = v39;
          }
          while (!v40);
        }
        v11 = v39;
      }
      while (v39 != v67);
      v36 = 0;
      if ((v68 & 1) == 0 && v12)
      {
        if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v76) = v12;
            _os_log_impl(&dword_210675000, v43, OS_LOG_TYPE_DEBUG, "[WritingThread] nothing written (attempts: %d).", buf, 8u);
          }

        }
LABEL_81:
        v36 = 0;
      }
LABEL_82:
      objc_autoreleasePoolPop(context);
      if (v36)
        goto LABEL_101;
      v44 = v61;
      v45 = v44;
      if (v63 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v45, OS_SIGNPOST_INTERVAL_END, v59, "write fifo samples", (const char *)&unk_2106EBECF, buf, 2u);
      }

    }
    while ((v68 & 1) != 0);
    if (!objc_msgSend(WeakRetained, "finalConsume"))
    {
      v46 = *((_QWORD *)WeakRetained + 4);
      v47 = dispatch_time(0, 11100000);
      dispatch_semaphore_wait(v46, v47);
      v48 = v45;
      v49 = v48;
      if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v49, OS_SIGNPOST_INTERVAL_END, spid, "write thread", (const char *)&unk_2106EBECF, buf, 2u);
      }

      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "setWriteThreadCount:", objc_msgSend(WeakRetained, "writeThreadCount") + 1);
      continue;
    }
    break;
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v50, OS_LOG_TYPE_INFO, "[WritingThread] finalConsume", buf, 2u);
  }

  v51 = v45;
  v52 = v51;
  if (v57 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v51))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210675000, v52, OS_SIGNPOST_INTERVAL_END, spid, "write thread", (const char *)&unk_2106EBECF, buf, 2u);
  }

LABEL_98:
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    v54 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    LODWORD(v76) = v54;
    _os_log_impl(&dword_210675000, v53, OS_LOG_TYPE_INFO, "[WritingThread.%u] Exiting writing loop.", buf, 8u);
  }

LABEL_101:
LABEL_102:

}

- (id)startWritingThreadForMetadata
{
  id v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x24BDD17F0]);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __48__MOVStreamWriter_startWritingThreadForMetadata__block_invoke;
  v8 = &unk_24CA44D38;
  objc_copyWeak(&v9, &location);
  v3 = (void *)objc_msgSend(v2, "initWithBlock:", &v5);
  objc_msgSend(v3, "setName:", CFSTR("MOVStreamWriterMetadata"), v5, v6, v7, v8);
  objc_msgSend(v3, "setQualityOfService:", 33);
  objc_msgSend(v3, "start");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __48__MOVStreamWriter_startWritingThreadForMetadata__block_invoke(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  os_signpost_id_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD *v10;
  int v11;
  std::string *v12;
  void *v13;
  id v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  Float64 Seconds;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  char v26;
  id v27;
  NSObject *v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  int v32;
  int v33;
  _QWORD *v34;
  _QWORD *v35;
  BOOL v36;
  char *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v43;
  dispatch_time_t v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  os_signpost_id_t spid;
  unint64_t v52;
  NSObject *v53;
  os_signpost_id_t v54;
  NSObject *log;
  NSObject *v56;
  void *context;
  unint64_t v58;
  _QWORD *v59;
  char v60;
  char *WeakRetained;
  id v62;
  __int128 v63;
  uint64_t v64;
  CMTime time;
  std::string v66;
  _BYTE buf[32];
  __int128 v68;
  uint8_t v69[4];
  void *v70;
  __int16 v71;
  Float64 v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "setThreadPriority:", 1.0) & 1) == 0)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v1, OS_LOG_TYPE_ERROR, "[WritingThread] Cannot set priority to 1.0.", buf, 2u);
      }

    }
    v2 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.movstreamwriter.writingthread.metadata"), "UTF8String"), "PointsOfInterest");
    v3 = os_signpost_id_generate(v2);
    v53 = v2;
    spid = os_signpost_id_generate(v2);
    v52 = spid - 1;
    v54 = v3;
    v58 = v3 - 1;
    v4 = WeakRetained;
    v59 = WeakRetained + 216;
LABEL_7:
    if (objc_msgSend(v4, "canWriteData"))
    {
      v5 = v53;
      v6 = v5;
      log = v5;
      if (v52 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = os_signpost_enabled(v5);
        v6 = log;
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_210675000, log, OS_SIGNPOST_INTERVAL_BEGIN, spid, "write thread metadata", (const char *)&unk_2106EBECF, buf, 2u);
          v6 = log;
        }
      }

      while (1)
      {
        v8 = log;
        v9 = v8;
        if (v58 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_210675000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v54, "write fifo metadata", (const char *)&unk_2106EBECF, buf, 2u);
        }
        v56 = v9;

        context = (void *)MEMORY[0x212BC9B10]();
        v10 = (_QWORD *)*((_QWORD *)WeakRetained + 26);
        if (v10 == v59)
        {
          v60 = 0;
LABEL_71:
          v32 = 0;
        }
        else
        {
          v60 = 0;
          v11 = 0;
          while (1)
          {
            if (*((char *)v10 + 55) < 0)
              std::string::__init_copy_ctor_external(&v66, (const std::string::value_type *)v10[4], v10[5]);
            else
              v66 = *(std::string *)(v10 + 4);
            if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v12 = &v66;
            else
              v12 = (std::string *)v66.__r_.__value_.__r.__words[0];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v10[15], "setVisitCount:", objc_msgSend((id)v10[15], "visitCount") + 1);
            v14 = (id)v10[11];
            objc_sync_enter(v14);
            v15 = objc_msgSend(WeakRetained, "getCountByPriorityForFifo:capacity:", objc_msgSend((id)v10[11], "count"), v10[12]);
            if (v15 >= 1)
            {
              do
              {
                if (objc_msgSend(v14, "count"))
                {
                  objc_msgSend((id)v10[15], "setAttemptCount:", objc_msgSend((id)v10[15], "attemptCount") + 1);
                  v16 = objc_msgSend((id)v10[7], "isReadyForMoreMediaData");
                  ++v11;
                  if (!v16)
                  {
                    if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                      break;
                    +[MIOLog defaultLog](MIOLog, "defaultLog");
                    v17 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      *(_QWORD *)&buf[4] = v13;
                      _os_log_impl(&dword_210675000, v17, OS_LOG_TYPE_DEBUG, "[WritingThread] Input for %{public}@ not ready.", buf, 0xCu);
                    }
                    v32 = 0;
                    goto LABEL_69;
                  }
                  if (!objc_msgSend(v14, "count"))
                    goto LABEL_48;
                  objc_msgSend(v14, "firstObject");
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                  {
                    +[MIOLog defaultLog](MIOLog, "defaultLog");
                    v18 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                    {
                      if (v17)
                      {
                        -[NSObject timeRange](v17, "timeRange");
                      }
                      else
                      {
                        v68 = 0u;
                        memset(buf, 0, sizeof(buf));
                      }
                      time = *(CMTime *)buf;
                      Seconds = CMTimeGetSeconds(&time);
                      v20 = objc_msgSend(v14, "count");
                      v21 = v10[12];
                      *(_DWORD *)v69 = 138544130;
                      v70 = v13;
                      v71 = 2048;
                      v72 = Seconds;
                      v73 = 2048;
                      v74 = v20;
                      v75 = 2048;
                      v76 = v21;
                      _os_log_impl(&dword_210675000, v18, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Consume (%{public}@) PTS: %f (%lu/%lu)", v69, 0x2Au);
                    }

                  }
                  v22 = WeakRetained;
                  if (!WeakRetained[98])
                  {
                    if (v17)
                    {
                      v23 = WeakRetained;
                      -[NSObject timeRange](v17, "timeRange");
                    }
                    else
                    {
                      v68 = 0u;
                      memset(buf, 0, sizeof(buf));
                      v23 = WeakRetained;
                    }
                    v63 = *(_OWORD *)buf;
                    v64 = *(_QWORD *)&buf[16];
                    objc_msgSend(v23, "delegate");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = v23[1];
                    v62 = 0;
                    v26 = objc_msgSend(v23, "startSessionWithFallbackSampleTime:streamId:mediaType:writerDelegate:delegateCallbackQueue:error:", &v63, v13, 2, v24, v25, &v62);
                    v27 = v62;

                    if ((v26 & 1) == 0)
                    {
                      v37 = WeakRetained;
                      objc_sync_enter(v37);
                      objc_msgSend(*((id *)WeakRetained + 45), "criticalErrorOccurred:context:", v27, v37);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "activateNewState:byEvent:", v38, CFSTR("startWritingThreadForMetadata"));

                      objc_sync_exit(v37);
                      v32 = 1;
LABEL_69:

                      v33 = v16 ^ 1;
                      goto LABEL_58;
                    }

                    v22 = WeakRetained;
                  }
                  if (objc_msgSend(v22, "canWriteData"))
                  {
                    objc_msgSend(WeakRetained, "writeMetadata:forStreamId:", v17, v13);
                    objc_msgSend((id)v10[15], "setWriteCount:", objc_msgSend((id)v10[15], "writeCount") + 1);
                    v60 = 1;
                  }
                  else
                  {
                    +[MIOLog defaultLog](MIOLog, "defaultLog");
                    v28 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(*((id *)WeakRetained + 45), "name");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      *(_QWORD *)&buf[4] = v13;
                      *(_WORD *)&buf[12] = 2114;
                      *(_QWORD *)&buf[14] = v29;
                      _os_log_impl(&dword_210675000, v28, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: [FIFO] CANNOT Write Item of metadata stream '%{public}@' for state %{public}@ ⛔️⛔️⛔️", buf, 0x16u);

                    }
                  }
                  objc_msgSend(v14, "removeObjectAtIndex:", 0);
                  objc_msgSend((id)v10[15], "setFifoItemCount:", objc_msgSend(v14, "count"));
                  v30 = objc_msgSend(v14, "count") == 0;

                  if (v30)
                  {
LABEL_48:
                    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                    {
                      +[MIOLog defaultLog](MIOLog, "defaultLog");
                      v31 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138543362;
                        *(_QWORD *)&buf[4] = v13;
                        _os_log_impl(&dword_210675000, v31, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Precheck All Fifo items written '%{public}@'", buf, 0xCu);
                      }

                    }
                    objc_msgSend(WeakRetained, "checkForFinishing");
                    break;
                  }
                }
                --v15;
              }
              while (v15);
            }
            v32 = 0;
            v33 = 1;
LABEL_58:
            objc_sync_exit(v14);

            if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v66.__r_.__value_.__l.__data_);
            if (!v33)
              break;
            v34 = (_QWORD *)v10[1];
            if (v34)
            {
              do
              {
                v35 = v34;
                v34 = (_QWORD *)*v34;
              }
              while (v34);
            }
            else
            {
              do
              {
                v35 = (_QWORD *)v10[2];
                v36 = *v35 == (_QWORD)v10;
                v10 = v35;
              }
              while (!v36);
            }
            v10 = v35;
            if (v35 == v59)
            {
              v32 = 0;
              if ((v60 & 1) != 0 || !v11)
                break;
              if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
              {
                +[MIOLog defaultLog](MIOLog, "defaultLog");
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&buf[4] = v11;
                  _os_log_impl(&dword_210675000, v41, OS_LOG_TYPE_DEBUG, "[WritingThread] nothing written (attempts: %d).", buf, 8u);
                }

              }
              goto LABEL_71;
            }
          }
        }
        objc_autoreleasePoolPop(context);
        if (v32)
          break;
        v39 = v56;
        v40 = v39;
        if (v58 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_210675000, v40, OS_SIGNPOST_INTERVAL_END, v54, "write fifo metadata", (const char *)&unk_2106EBECF, buf, 2u);
        }

        if ((v60 & 1) == 0)
        {
          if (!objc_msgSend(WeakRetained, "finalConsume"))
          {
            v43 = *((_QWORD *)WeakRetained + 5);
            v44 = dispatch_time(0, 11100000);
            dispatch_semaphore_wait(v43, v44);
            v45 = v40;
            v46 = v45;
            if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_210675000, v46, OS_SIGNPOST_INTERVAL_END, spid, "write thread metadata", (const char *)&unk_2106EBECF, buf, 2u);
            }

            v4 = WeakRetained;
            objc_msgSend(WeakRetained, "setWriteThreadCount:", objc_msgSend(WeakRetained, "writeThreadCount") + 1);
            goto LABEL_7;
          }
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_210675000, v47, OS_LOG_TYPE_INFO, "[WritingThread] finalConsume", buf, 2u);
          }

          v48 = v40;
          v49 = v48;
          if (v52 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v48))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_210675000, v49, OS_SIGNPOST_INTERVAL_END, spid, "write thread metadata", (const char *)&unk_2106EBECF, buf, 2u);
          }

          goto LABEL_95;
        }
      }
    }
    else
    {
LABEL_95:
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v50, OS_LOG_TYPE_INFO, "[WritingThread Metadata] Exiting writing loop.", buf, 2u);
      }

    }
  }

}

- (void)informDelegateAboutError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *m_delegateCallbackQueue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[MOVStreamWriter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    m_delegateCallbackQueue = self->m_delegateCallbackQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__MOVStreamWriter_informDelegateAboutError___block_invoke;
    v8[3] = &unk_24CA44CE8;
    v8[4] = self;
    v9 = v4;
    dispatch_async(m_delegateCallbackQueue, v8);

  }
}

void __44__MOVStreamWriter_informDelegateAboutError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x212BC9B10]();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamWriterEncounteredAnError:", *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

- (void)informDelegateAboutIsReady:(BOOL)a3 forStream:(id)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *m_delegateCallbackQueue;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v6 = a4;
  -[MOVStreamWriter delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    m_delegateCallbackQueue = self->m_delegateCallbackQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__MOVStreamWriter_informDelegateAboutIsReady_forStream___block_invoke;
    block[3] = &unk_24CA44DF0;
    block[4] = self;
    v11 = v6;
    v12 = a3;
    dispatch_async(m_delegateCallbackQueue, block);

  }
}

void __56__MOVStreamWriter_informDelegateAboutIsReady_forStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x212BC9B10]();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamWriter:inputForStream:changedIsReadyStatusTo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  objc_autoreleasePoolPop(v2);
}

- (void)informDelegateAboutFinishingTimeout
{
  void *v3;
  char v4;
  NSObject *m_delegateCallbackQueue;
  _QWORD block[5];

  -[MOVStreamWriter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    m_delegateCallbackQueue = self->m_delegateCallbackQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__MOVStreamWriter_informDelegateAboutFinishingTimeout__block_invoke;
    block[3] = &unk_24CA44D60;
    block[4] = self;
    dispatch_async(m_delegateCallbackQueue, block);
  }
}

void __54__MOVStreamWriter_informDelegateAboutFinishingTimeout__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x212BC9B10]();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamWriterReachedFinishingTimeout:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)informDelegateAboutMediaWrittenForStream:(id)a3 mediaType:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *m_delegateCallbackQueue;
  _QWORD block[5];
  id v11;
  int64_t v12;

  v6 = a3;
  -[MOVStreamWriter delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    m_delegateCallbackQueue = self->m_delegateCallbackQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__MOVStreamWriter_informDelegateAboutMediaWrittenForStream_mediaType___block_invoke;
    block[3] = &unk_24CA44E18;
    block[4] = self;
    v11 = v6;
    v12 = a4;
    dispatch_async(m_delegateCallbackQueue, block);

  }
}

void __70__MOVStreamWriter_informDelegateAboutMediaWrittenForStream_mediaType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x212BC9B10]();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamWriter:mediaWrittenForStream:mediaType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_autoreleasePoolPop(v2);
}

- (BOOL)legacyKeysMode
{
  return self->legacyKeysMode;
}

- (void)setLegacyKeysMode:(BOOL)a3
{
  self->legacyKeysMode = a3;
}

- (NSArray)movMetadataItems
{
  return (NSArray *)objc_getProperty(self, a2, 472, 1);
}

- (void)setMovMetadataItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_movieFragmentInterval, 24, 1, 0);
  return result;
}

- (void)setMovieFragmentInterval:(id *)a3
{
  objc_copyStruct(&self->_movieFragmentInterval, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sessionStartTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_sessionStartTime, 24, 1, 0);
  return result;
}

- (void)setSessionStartTime:(id *)a3
{
  objc_copyStruct(&self->_sessionStartTime, a3, 24, 1, 0);
}

- (BOOL)inProcessRecording
{
  return self->_inProcessRecording;
}

- (void)setInProcessRecording:(BOOL)a3
{
  self->_inProcessRecording = a3;
}

- (int)baseMediaTimeScale
{
  return self->_baseMediaTimeScale;
}

- (void)setBaseMediaTimeScale:(int)a3
{
  self->_baseMediaTimeScale = a3;
}

- (int)bufferCacheMode
{
  return self->_bufferCacheMode;
}

- (void)setBufferCacheMode:(int)a3
{
  self->_bufferCacheMode = a3;
}

- (NSString)timeRangeMetadataKeyHint
{
  return self->_timeRangeMetadataKeyHint;
}

- (void)setTimeRangeMetadataKeyHint:(id)a3
{
  objc_storeStrong((id *)&self->_timeRangeMetadataKeyHint, a3);
}

- (BOOL)preserveSessionStartTime
{
  return self->_preserveSessionStartTime;
}

- (void)setPreserveSessionStartTime:(BOOL)a3
{
  self->_preserveSessionStartTime = a3;
}

- (MOVStreamCustomEncoderConfigDelegate)customEncoderConfigDelegate
{
  return (MOVStreamCustomEncoderConfigDelegate *)objc_loadWeakRetained((id *)&self->_customEncoderConfigDelegate);
}

- (void)setCustomEncoderConfigDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_customEncoderConfigDelegate, a3);
}

- (MOVStreamWriterDelegate)delegate
{
  return (MOVStreamWriterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MOVStreamWriterState)state
{
  return (MOVStreamWriterState *)objc_getProperty(self, a2, 360, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (BOOL)finalConsume
{
  return self->_finalConsume;
}

- (void)setFinalConsume:(BOOL)a3
{
  self->_finalConsume = a3;
}

- (BOOL)finishingMode
{
  return self->_finishingMode;
}

- (void)setFinishingMode:(BOOL)a3
{
  self->_finishingMode = a3;
}

- (BOOL)canWriteData
{
  return self->_canWriteData;
}

- (void)setCanWriteData:(BOOL)a3
{
  self->_canWriteData = a3;
}

- (unint64_t)writeThreadCount
{
  return self->_writeThreadCount;
}

- (void)setWriteThreadCount:(unint64_t)a3
{
  self->_writeThreadCount = a3;
}

- (void).cxx_destruct
{
  vector<std::string, std::allocator<std::string>> *p_m_orderedMetadataStreamNames;

  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_customEncoderConfigDelegate);
  objc_storeStrong((id *)&self->_timeRangeMetadataKeyHint, 0);
  objc_storeStrong((id *)&self->movMetadataItems, 0);
  objc_storeStrong((id *)&self->_movieMetadataUtility, 0);
  objc_storeStrong((id *)&self->_perfLogAVF, 0);
  objc_storeStrong((id *)&self->_writeThreadAudio, 0);
  objc_storeStrong((id *)&self->_writeThreadMetadata, 0);
  objc_storeStrong((id *)&self->_writingThreads, 0);
  objc_storeStrong((id *)&self->_writeThread, 0);
  objc_storeStrong((id *)&self->_criticalError, 0);
  objc_storeStrong((id *)&self->_state, 0);
  std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::destroy((uint64_t)&self->m_lastPtsForAttachmentsStream, (char *)self->m_lastPtsForAttachmentsStream.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::destroy((uint64_t)&self->m_lastPtsForMetadataStream, (char *)self->m_lastPtsForMetadataStream.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::destroy((uint64_t)&self->m_lastPtsForStream, (char *)self->m_lastPtsForStream.__tree_.__pair1_.__value_.__left_);
  p_m_orderedMetadataStreamNames = &self->m_orderedMetadataStreamNames;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_m_orderedMetadataStreamNames);
  p_m_orderedMetadataStreamNames = &self->m_orderedStreamNames;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_m_orderedMetadataStreamNames);
  objc_storeStrong((id *)&self->m_assetWriter, 0);
  objc_storeStrong((id *)&self->m_writeURL, 0);
  objc_storeStrong(&self->_timeoutBlock, 0);
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_writingMetadataSema, 0);
  objc_storeStrong((id *)&self->_writingSema, 0);
  objc_storeStrong((id *)&self->m_processingQueue, 0);
  objc_storeStrong((id *)&self->m_writingQueue, 0);
  objc_storeStrong((id *)&self->m_delegateCallbackQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 20) = (char *)self + 168;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 26) = (char *)self + 216;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 32) = (char *)self + 264;
  *((_QWORD *)self + 33) = 0;
  *((_QWORD *)self + 36) = 0;
  *((_QWORD *)self + 37) = 0;
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = (char *)self + 288;
  *((_QWORD *)self + 38) = (char *)self + 312;
  *((_QWORD *)self + 39) = 0;
  *((_QWORD *)self + 42) = 0;
  *((_QWORD *)self + 43) = 0;
  *((_QWORD *)self + 40) = 0;
  *((_QWORD *)self + 41) = (char *)self + 336;
  return self;
}

+ (id)getMOVStreamIOMetadataItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKey:", CFSTR("3.29.2"), CFSTR("version"));
  +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("default_options"));

  +[MOVStreamIOUtility getJsonFriendlyCopy:](MOVStreamIOUtility, "getJsonFriendlyCopy:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v5, 100, 0, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v7)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v9;
      _os_log_impl(&dword_210675000, v8, OS_LOG_TYPE_ERROR, "Unable to serialize MOVStream State metatdata as JSON: %{public}@", buf, 0xCu);

    }
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIdentifier:", CFSTR("mdta/com.apple.framework.state.MOVStreamIO"));
    objc_msgSend(v10, "setDataType:", *MEMORY[0x24BDC0C08]);
    objc_msgSend(v10, "setExtraAttributes:", 0);
    objc_msgSend(v10, "setValue:", v6);
  }

  return v10;
}

+ (id)getTimeRangeMetadataKeyHintMetadataItem:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  +[MOVStreamIOUtility plistSerializedObject:error:](MOVStreamIOUtility, "plistSerializedObject:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", CFSTR("mdta/com.apple.framework.mio.timeRangeMetadataKeyHint"));
    objc_msgSend(v5, "setDataType:", *MEMORY[0x24BDC0C08]);
    objc_msgSend(v5, "setValue:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)fifoDropsEnabled:(StreamRecordingData *)a3
{
  return a3->var6 == 0;
}

- (id)getAudioMetadataForBuffer:(opaqueCMSampleBuffer *)a3
{
  void *v4;
  const __CFAllocator *v5;
  CFDictionaryRef v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  CFDictionaryRef v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  CMTime v19;
  CMTime start;
  CMTimeRange v21;
  id v22;
  CMTime time;
  CMTime v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_attachments"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C08]);
  objc_msgSend(v4, "setExtraAttributes:", 0);
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, 1u);
  if (v6)
  {
    +[MOVStreamIOUtility getPlistFriendlyCopyOf:](MOVStreamIOUtility, "getPlistFriendlyCopyOf:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  memset(&v24, 0, sizeof(v24));
  CMSampleBufferGetPresentationTimeStamp(&v24, a3);
  objc_msgSend(v8, "objectForKey:", CFSTR("OriginalTimestampWhenWrittenToFile"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    time = v24;
    v11 = CMTimeCopyAsDictionary(&time, v5);
    objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("OriginalTimestampWhenWrittenToFile"));

  }
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;
  if (v13)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_ERROR, "Unable to serialize audio metatdata as PLIST: %{public}@", buf, 0xCu);

    }
    v16 = 0;
  }
  else
  {
    objc_msgSend(v4, "setValue:", v12);
    v17 = objc_alloc(MEMORY[0x24BDB26C0]);
    v25 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    start = v24;
    v19 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
    CMTimeRangeMake(&v21, &start, &v19);
    v16 = (void *)objc_msgSend(v17, "initWithItems:timeRange:", v14, &v21);
  }

  return v16;
}

- (BOOL)isReadyForMoreDataForStreamId:(id)a3 fromMap:(void *)a4
{
  id v5;
  const void **v6;
  uint64_t v7;
  char v8;
  void *__p[2];
  char v11;

  v5 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v6 = (const void **)*((_QWORD *)a4 + 1);
  if (!v6)
    goto LABEL_9;
  while (std::less<std::string>::operator()[abi:ne180100]((uint64_t)a4 + 16, (const void **)__p, v6 + 4))
  {
LABEL_5:
    v6 = (const void **)*v6;
    if (!v6)
      goto LABEL_9;
  }
  if (std::less<std::string>::operator()[abi:ne180100]((uint64_t)a4 + 16, v6 + 4, (const void **)__p))
  {
    ++v6;
    goto LABEL_5;
  }
  if (objc_msgSend(*(id *)(v7 + 16), "isReadyForMoreMediaData"))
  {
    v8 = objc_msgSend(*(id *)(v7 + 24), "isReadyForMoreMediaData");
    goto LABEL_10;
  }
LABEL_9:
  v8 = 0;
LABEL_10:
  if (v11 < 0)
    operator delete(__p[0]);

  return v8;
}

- (id)getMetadataGroupForBuffer:(__CVBuffer *)a3 stream:(id)a4 presentationTime:(id *)a5 serializationMode:(int)a6
{
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  CFDictionaryRef v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  const char *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  CFDictionaryRef v28;
  CMTime duration;
  CMTime start;
  CMTimeRange v31;
  id v32;
  id v33;
  CMTime time;
  void *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MOVStreamWriter legacyKeysMode](self, "legacyKeysMode"))
  {
    +[MIOVersion versionZero](MIOVersion, "versionZero");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_attachments"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIdentifier:", v12);

  }
  else
  {
    objc_msgSend(v10, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_attachments"));
  }
  objc_msgSend(v10, "setDataType:", *MEMORY[0x24BDC0C08]);
  objc_msgSend(v10, "setExtraAttributes:", 0);
  v13 = +[MIOPixelBufferUtility isPixelBufferRawBayer:](MIOPixelBufferUtility, "isPixelBufferRawBayer:", a3);
  v14 = +[MIOPixelBufferUtility isPixelBufferCompandedRawBayer:](MIOPixelBufferUtility, "isPixelBufferCompandedRawBayer:", a3);
  v28 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
  if (a6)
    +[MOVStreamIOUtility getPlistFriendlyCopyOf:](MOVStreamIOUtility, "getPlistFriendlyCopyOf:", v28);
  else
    +[MOVStreamIOUtility getJsonFriendlyCopy:](MOVStreamIOUtility, "getJsonFriendlyCopy:", v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("OriginalTimestampWhenWrittenToFile"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    time = (CMTime)*a5;
    v17 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x24BDBD240]);
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("OriginalTimestampWhenWrittenToFile"));

  }
  if (!a6)
  {
    v32 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v15, 0, &v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v32;
    if (v23)
    {
      v20 = v23;
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v20, "localizedDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v24;
        _os_log_impl(&dword_210675000, v21, OS_LOG_TYPE_ERROR, "Unable to serialize depth metatdata as JSON: %{public}@", buf, 0xCu);

      }
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (v13 || v14)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", CVPixelBufferGetPixelFormatType(a3));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v18, CFSTR("RawBayerFormat"));

  }
  v33 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v15, 200, 0, &v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v33;
  if ((objc_msgSend(MEMORY[0x24BDD1770], "propertyList:isValidForFormat:", v19, 200) & 1) != 0)
  {
    if (v20 || !v19)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v22 = "Error: Cannot serialize metadata to plist";
LABEL_22:
        _os_log_impl(&dword_210675000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
LABEL_24:
    objc_msgSend(v10, "setValue:", v19);
    v26 = objc_alloc(MEMORY[0x24BDB26C0]);
    v35 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    start = (CMTime)*a5;
    duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
    CMTimeRangeMake(&v31, &start, &duration);
    v25 = (void *)objc_msgSend(v26, "initWithItems:timeRange:", v20, &v31);
    goto LABEL_25;
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v22 = "Error: The metadata dictionary is not valid for XML v1.0 plist Format";
    goto LABEL_22;
  }
LABEL_23:

  v25 = 0;
LABEL_25:

  return v25;
}

- (BOOL)marksOutputTracksAsEnabledForStream:()basic_string<char fromMap:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  uint64_t **v3;
  uint64_t **v4;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *var0;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  unsigned int v12;
  _QWORD *v13;
  _QWORD **v14;
  _QWORD *v15;
  _QWORD **v16;
  unsigned int v17;
  _BYTE v19[8];
  _QWORD *v20[2];
  _OWORD v21[2];
  uint64_t v22;

  v4 = v3;
  var0 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
                         + 40));
  objc_msgSend(v7, "objectForKey:", CFSTR("MarksOutputTrackAsEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "BOOLValue");
  }
  else if (v4[2] == (uint64_t *)1)
  {
    v10 = 1;
  }
  else
  {
    qmemcpy(v21, "610L010L3.315.114ggr4ggb4rbg4brg", sizeof(v21));
    std::set<unsigned int>::set[abi:ne180100]((uint64_t)v19, (unsigned int *)v21, 8);
    if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", var0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MOVStreamWriter getPixelFormatForStream:fromMap:](self, "getPixelFormatForStream:fromMap:", v11, v4);
    v13 = v20[0];
    if (!v20[0])
      goto LABEL_17;
    v14 = v20;
    do
    {
      v15 = v13;
      v16 = v14;
      v17 = *((_DWORD *)v13 + 7);
      if (v17 >= v12)
        v14 = (_QWORD **)v13;
      else
        ++v13;
      v13 = (_QWORD *)*v13;
    }
    while (v13);
    if (v14 == v20)
      goto LABEL_17;
    if (v17 < v12)
      v15 = v16;
    if (v12 < *((_DWORD *)v15 + 7))
LABEL_17:
      v14 = v20;
    v10 = v14 == v20;

    std::__tree<unsigned int>::destroy((uint64_t)v19, v20[0]);
  }

  return v10;
}

- (int)attachmentSerializationModeForStream:()basic_string<char withDefaultMode:()std:(std::allocator<char>> *)a3 :char_traits<char> fromMap:
{
  int v3;
  uint64_t **v4;
  int v5;
  void *v6;
  void *v7;

  v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v5 = objc_msgSend(v6, "intValue");

  return v5;
}

- (id)customTrackMetadataForStream:(id)a3 fromMap:(void *)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *__p[2];
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v17 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v17, "UTF8String"));
  if (objc_msgSend(*(id *)(v5 + 72), "count") || objc_msgSend(*(id *)(v5 + 80), "count"))
  {
    v6 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = *(id *)(v5 + 72);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
      v9 = *MEMORY[0x24BDC0C38];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
          objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("mdta/custom."), v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setIdentifier:", v13);
          objc_msgSend(v12, "setDataType:", v9);
          objc_msgSend(v12, "setExtraAttributes:", 0);
          objc_msgSend(*(id *)(v5 + 72), "objectForKey:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setValue:", v14);

          objc_msgSend(v6, "addObject:", v12);
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v7);
    }

    if (objc_msgSend(*(id *)(v5 + 80), "count"))
      objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(v5 + 80));
    v15 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v15 = 0;
  }
  if (v24 < 0)
    operator delete(__p[0]);

  return v15;
}

- (id)customMetadataTrackMetadataForStream:(id)a3 fromMap:(void *)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *__p[2];
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v17 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v17, "UTF8String"));
  if (objc_msgSend(*(id *)(v5 + 48), "count"))
  {
    v6 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = *(id *)(v5 + 48);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
      v9 = *MEMORY[0x24BDC0C38];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
          objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("mdta/custom."), v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setIdentifier:", v13);
          objc_msgSend(v12, "setDataType:", v9);
          objc_msgSend(v12, "setExtraAttributes:", 0);
          objc_msgSend(*(id *)(v5 + 48), "objectForKey:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setValue:", v14);

          objc_msgSend(v6, "addObject:", v12);
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v7);
    }

    v15 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    v15 = 0;
  }
  if (v24 < 0)
    operator delete(__p[0]);

  return v15;
}

- (id)getTrackMetadataForAttachmentsSerializationMode:(id)a3 fromMap:(void *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  std::string __p;
  std::string v13;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_attachments_serialization_mode"));
  objc_msgSend(v7, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v7, "setExtraAttributes:", 0);
  v8 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&v13, (char *)objc_msgSend(v8, "UTF8String"));
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  else
    __p = v13;
  v9 = -[MOVStreamWriter attachmentSerializationModeForStream:withDefaultMode:fromMap:](self, "attachmentSerializationModeForStream:withDefaultMode:fromMap:", &__p, 1, a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:", v10);

  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);

  return v7;
}

- (id)getLegacyTrackMetadataForAttachmentsSerializationMode:(id)a3 fromMap:(void *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  std::string __p;
  std::string v15;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIOVersion versionZero](MIOVersion, "versionZero");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_attachments_serialization_mode"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v9);

  objc_msgSend(v7, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v7, "setExtraAttributes:", 0);
  v10 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&v15, (char *)objc_msgSend(v10, "UTF8String"));
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
  else
    __p = v15;
  v11 = -[MOVStreamWriter attachmentSerializationModeForStream:withDefaultMode:fromMap:](self, "attachmentSerializationModeForStream:withDefaultMode:fromMap:", &__p, 1, a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:", v12);

  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);

  return v7;
}

- (id)getTrackMetadataForRawBayerRearrangeType:(id)a3 fromMap:(void *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *__p[2];
  char v11;

  v5 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (void *)v6;
  else
    v7 = &unk_24CA5BC58;
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", CFSTR("mdta/com.apple.stream_raw_bayer_rearrange_type"));
  objc_msgSend(v8, "setDataType:", *MEMORY[0x24BDC0C30]);
  objc_msgSend(v8, "setExtraAttributes:", 0);
  objc_msgSend(v8, "setValue:", v7);

  if (v11 < 0)
    operator delete(__p[0]);

  return v8;
}

- (id)getTrackMetadataForTimeRangeMetadata:(id)a3 fromMap:(void *)a4
{
  id v5;
  void *v6;
  void *__p[2];
  char v9;

  v5 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 < 0)
    operator delete(__p[0]);

  return v6;
}

- (id)getTrackMetadataForStream:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.track_kind"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v4, "setExtraAttributes:", 0);
  objc_msgSend(v4, "setValue:", v3);

  return v4;
}

- (id)getLegacyTrackMetadataForStream:(id)a3
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((v4 & 1) == 0
  {
    +[MIOVersion versionZero](MIOVersion, "versionZero");
    -[MOVStreamWriter(TrackMetadata) getLegacyTrackMetadataForStream:]::legacyVersion = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)-[MOVStreamWriter(TrackMetadata) getLegacyTrackMetadataForStream:]::legacyVersion, "versionedKey:modifier:", CFSTR("mdta/com.apple.track_kind"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  objc_msgSend(v5, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v5, "setExtraAttributes:", 0);
  objc_msgSend(v5, "setValue:", v3);

  return v5;
}

- (id)getTrackInputPixelFormatMetadataForStream:(id)a3 fromMap:(void *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *__p[2];
  char v12;

  v5 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v7 = objc_msgSend(*(id *)(v6 + 88), "inputPixelFormatFromStreamData:", v6);
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_format"));
  objc_msgSend(v8, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v8, "setExtraAttributes:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:", v9);

  if (v12 < 0)
    operator delete(__p[0]);

  return v8;
}

- (id)getLegacyTrackInputPixelFormatMetadataForStream:(id)a3 fromMap:(void *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *__p[2];
  char v14;

  v5 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v7 = objc_msgSend(*(id *)(v6 + 88), "inputPixelFormatFromStreamData:", v6);
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIOVersion versionZero](MIOVersion, "versionZero");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_format"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v10);

  objc_msgSend(v8, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v8, "setExtraAttributes:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:", v11);

  if (v14 < 0)
    operator delete(__p[0]);

  return v8;
}

- (id)getLegacyTrackEncodedPixelFormatMetadataForStream:(id)a3 fromMap:(void *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *__p[2];
  char v14;

  v5 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v7 = objc_msgSend(*(id *)(v6 + 88), "encodedPixelFormatFromStreamData:", v6);
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIOVersion versionZero](MIOVersion, "versionZero");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_encoded_sample_format"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v10);

  objc_msgSend(v8, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v8, "setExtraAttributes:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:", v11);

  if (v14 < 0)
    operator delete(__p[0]);

  return v8;
}

- (id)getTrackEncodedPixelFormatMetadataForStream:(id)a3 fromMap:(void *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *__p[2];
  char v12;

  v5 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v7 = objc_msgSend(*(id *)(v6 + 88), "encodedPixelFormatFromStreamData:", v6);
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", CFSTR("mdta/com.apple.stream_encoded_sample_format"));
  objc_msgSend(v8, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v8, "setExtraAttributes:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:", v9);

  if (v12 < 0)
    operator delete(__p[0]);

  return v8;
}

- (id)createRelatedToStreamMetadata:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.stream_related_to_stream"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v4, "setExtraAttributes:", 0);
  objc_msgSend(v4, "setValue:", v3);

  return v4;
}

- (id)createRelationSpecifierMetadata:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("mdta/com.apple.stream_relation_specifier"));
  objc_msgSend(v4, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v4, "setExtraAttributes:", 0);
  objc_msgSend(v4, "setValue:", v3);

  return v4;
}

- (id)getTrackMetadataForTrackTypeInfo:(id)a3 fromMap:(void *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *__p[2];
  char v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", CFSTR("mdta/com.apple.stream_type_info"));
  objc_msgSend(v6, "setDataType:", *MEMORY[0x24BDC0C38]);
  objc_msgSend(v6, "setExtraAttributes:", 0);
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "setValue:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:", v9);

  }
  if (v12 < 0)
    operator delete(__p[0]);

  return v6;
}

- (id)getTrackMetadataForExactBytesPerRow:(id)a3 fromMap:(void *)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *__p[2];
  char v17;

  v7 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  v9 = *(id *)(v8 + 40);
  objc_msgSend(v9, "objectForKey:", CFSTR("PixelBufferExactBytesPerRow"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v13 = 0;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_exact_bytes_per_row"));
  objc_msgSend(v11, "setExtraAttributes:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = +[MIOPixelBufferUtility numberOfPlanesForPixelFormatType:](MIOPixelBufferUtility, "numberOfPlanesForPixelFormatType:", CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)v8));
    if (v12 < 1)
    {
      objc_msgSend(v11, "setDataType:", *MEMORY[0x24BDC0C20]);
      objc_msgSend(v11, "setValue:", v10);
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    do
    {
      objc_msgSend(v13, "addObject:", v10);
      --v12;
    }
    while (v12);
    +[MOVStreamIOUtility plistSerializedObject:error:](MOVStreamIOUtility, "plistSerializedObject:error:", v13, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v11, "setDataType:", *MEMORY[0x24BDC0C08]);
      objc_msgSend(v11, "setValue:", v14);
      objc_msgSend(v11, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_exact_bytes_per_row_multiplanar"));

LABEL_12:
LABEL_16:
      v13 = v11;
      goto LABEL_19;
    }

LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[MOVStreamIOUtility plistSerializedObject:error:](MOVStreamIOUtility, "plistSerializedObject:error:", v10, a5);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v11, "setDataType:", *MEMORY[0x24BDC0C08]);
      objc_msgSend(v11, "setValue:", v13);
      objc_msgSend(v11, "setIdentifier:", CFSTR("mdta/com.apple.stream_sample_exact_bytes_per_row_multiplanar"));
      goto LABEL_12;
    }
  }
  else
  {
    if (!a5)
      goto LABEL_18;
    objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", CFSTR("Invalid value type for PixelBufferExactBytesPerRow."), 10);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_19:

LABEL_20:
  if (v17 < 0)
    operator delete(__p[0]);

  return v13;
}

- (opaqueCMFormatDescription)createMetadataFormatDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFArray *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  opaqueCMFormatDescription *v16;
  uint8_t v18[8];
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  _QWORD v20[2];
  _QWORD v21[2];
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  formatDescriptionOut = 0;
  if (-[MOVStreamWriter legacyKeysMode](self, "legacyKeysMode"))
  {
    +[MIOVersion versionZero](MIOVersion, "versionZero");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "versionedKey:modifier:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *MEMORY[0x24BDC0C50];
    v25[0] = *MEMORY[0x24BDC0C60];
    v7 = v25[0];
    v25[1] = v8;
    v9 = *MEMORY[0x24BDC0C08];
    v26[0] = v6;
    v26[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v10;
    v23[0] = v7;
    v23[1] = v8;
    v24[0] = v4;
    v24[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
    v12 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = *MEMORY[0x24BDC0C50];
    v20[0] = *MEMORY[0x24BDC0C60];
    v20[1] = v13;
    v14 = *MEMORY[0x24BDC0C08];
    v21[0] = v4;
    v21[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v12 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  }

  if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x6D656278u, v12, &formatDescriptionOut))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_210675000, v15, OS_LOG_TYPE_ERROR, "Can't create metadata format description...", v18, 2u);
    }

    v16 = 0;
    formatDescriptionOut = 0;
  }
  else
  {
    v16 = formatDescriptionOut;
  }

  return v16;
}

- (BOOL)isCustomTrackMetadataCompatibleObject:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (unsigned)getPixelFormatForStream:(id)a3 fromMap:(void *)a4
{
  id v5;
  uint64_t v6;
  unsigned int v7;
  void *__p[2];
  char v10;

  v5 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v7 = objc_msgSend((id)objc_opt_class(), "getPixelFormatFromStreamData:", v6);
  if (v10 < 0)
    operator delete(__p[0]);

  return v7;
}

+ (unsigned)getPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  id v4;
  void *v5;
  void *v6;
  FourCharCode MediaSubType;

  v4 = a3->var5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PixelFormat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PixelFormat"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MediaSubType = objc_msgSend(v6, "intValue");

  }
  else
  {
    MediaSubType = CMFormatDescriptionGetMediaSubType(a3->var0);
  }

  return MediaSubType;
}

@end
