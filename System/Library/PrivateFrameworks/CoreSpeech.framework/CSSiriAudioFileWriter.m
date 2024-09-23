@implementation CSSiriAudioFileWriter

- (CSSiriAudioFileWriter)initWithType:(int64_t)a3 pathGenerator:(id)a4 priority:(unsigned int)a5
{
  return (CSSiriAudioFileWriter *)-[CSSiriAudioFileWriter _initWithType:pathGenerator:xorFileHandle:priority:](self, "_initWithType:pathGenerator:xorFileHandle:priority:", a3, a4, 0, *(_QWORD *)&a5);
}

- (CSSiriAudioFileWriter)initWithType:(int64_t)a3 fileHandle:(id)a4 priority:(unsigned int)a5
{
  return (CSSiriAudioFileWriter *)-[CSSiriAudioFileWriter _initWithType:pathGenerator:xorFileHandle:priority:](self, "_initWithType:pathGenerator:xorFileHandle:priority:", a3, 0, a4, *(_QWORD *)&a5);
}

- (id)_initWithType:(int64_t)a3 pathGenerator:(id)a4 xorFileHandle:(id)a5 priority:(unsigned int)a6
{
  id v11;
  id v12;
  CSSiriAudioFileWriter *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  NSObject *v17;
  void *v19;
  _QWORD block[4];
  CSSiriAudioFileWriter *v21;
  id v22;
  id v23;
  int64_t v24;
  objc_super v25;

  v11 = a4;
  v12 = a5;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSSiriAudioFileWriter.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != AFAudioFileTypeNone"));

  }
  v25.receiver = self;
  v25.super_class = (Class)CSSiriAudioFileWriter;
  v13 = -[CSSiriAudioFileWriter init](&v25, sel_init);
  if (v13)
  {
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a6, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("CSSiriAudioFileWriterQueue", v14);

    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    v17 = v13->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__CSSiriAudioFileWriter__initWithType_pathGenerator_xorFileHandle_priority___block_invoke;
    block[3] = &unk_1E7C258C8;
    v21 = v13;
    v24 = a3;
    v22 = v12;
    v23 = v11;
    dispatch_async(v17, block);

  }
  return v13;
}

- (CSSiriAudioFileWriter)init
{

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[CSSiriAudioFileWriter _close](self, "_close");
  v3.receiver = self;
  v3.super_class = (Class)CSSiriAudioFileWriter;
  -[CSSiriAudioFileWriter dealloc](&v3, sel_dealloc);
}

- (void)_close
{
  OpaqueExtAudioFile *audioFile;
  OSStatus v4;
  OSStatus v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  OSStatus v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  audioFile = self->_audioFile;
  if (audioFile)
  {
    v4 = ExtAudioFileDispose(audioFile);
    if (v4)
    {
      v5 = v4;
      v6 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        v7 = 136315394;
        v8 = "-[CSSiriAudioFileWriter _close]";
        v9 = 1026;
        v10 = v5;
        _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Failure disposing audio file %{public}d", (uint8_t *)&v7, 0x12u);
      }
    }
    self->_audioFile = 0;
  }
}

- (void)_delete
{
  void *v3;
  NSURL *url;
  char v5;
  id v6;
  NSObject *v7;
  NSURL *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_url)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    v9 = 0;
    v5 = objc_msgSend(v3, "removeItemAtURL:error:", url, &v9);
    v6 = v9;

    if ((v5 & 1) == 0)
    {
      v7 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[CSSiriAudioFileWriter _delete]";
        v12 = 2114;
        v13 = v6;
        _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Error removing item at URL %{public}@", buf, 0x16u);
      }
    }
    v8 = self->_url;
    self->_url = 0;

  }
}

- (void)configureWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3
{
  __int128 v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD block[6];
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)&a3->mBytesPerPacket;
  v12 = *(_OWORD *)&a3->mSampleRate;
  v13 = v5;
  v14 = *(_QWORD *)&a3->mBitsPerChannel;
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[CSSiriAudioFileWriter configureWithAudioStreamBasicDescription:]";
    v17 = 1040;
    v18 = 4;
    v19 = 2080;
    v20 = (char *)&v12 + 8;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s Configuring with asbd %.4s", buf, 0x1Cu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CSSiriAudioFileWriter_configureWithAudioStreamBasicDescription___block_invoke;
  block[3] = &unk_1E7C24858;
  block[4] = self;
  block[5] = a2;
  v9 = v12;
  v10 = v13;
  v11 = v14;
  dispatch_async(queue, block);
}

- (void)appendAudioData:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CSSiriAudioFileWriter_appendAudioData___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)flushWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CSSiriAudioFileWriter_flushWithCompletion___block_invoke;
  v7[3] = &unk_1E7C29150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CSSiriAudioFileWriter_cancel__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __31__CSSiriAudioFileWriter_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_close");
  return objc_msgSend(*(id *)(a1 + 32), "_delete");
}

void __45__CSSiriAudioFileWriter_flushWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  int *v17;
  char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[3];
  if (v3)
  {
    if (v2[11])
    {
LABEL_5:
      v9 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v3, "path");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = open((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 0);

    if ((v5 & 0x80000000) == 0)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v5, 1);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 88);
      *(_QWORD *)(v7 + 88) = v6;

      goto LABEL_5;
    }
    v14 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v16 = v14;
      v17 = __error();
      v18 = strerror(*v17);
      v19 = 136315394;
      v20 = "-[CSSiriAudioFileWriter flushWithCompletion:]_block_invoke";
      v21 = 2082;
      v22 = v18;
      _os_log_error_impl(&dword_1C2614000, v16, OS_LOG_TYPE_ERROR, "%s Failed opening fd for flushed audio file %{public}s", (uint8_t *)&v19, 0x16u);

    }
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v9 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
  }
  else
  {
    v10 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v19 = 136315138;
      v20 = "-[CSSiriAudioFileWriter flushWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s No file url on flush", (uint8_t *)&v19, 0xCu);
      v2 = *(_QWORD **)(a1 + 32);
    }
    v11 = v2[12];
    if (v11)
    {
      v23 = *MEMORY[0x1E0CB3388];
      v24[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("CSSiriAudioFileWriterErrorDomain"), 1, v12);

  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "_close");
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v13 + 16))(v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v9);

}

void __41__CSSiriAudioFileWriter_appendAudioData___block_invoke(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  uint64_t v4;
  unsigned int v5;
  UInt32 v6;
  OSStatus v7;
  OSStatus v8;
  NSObject *v9;
  const char *v10;
  AudioBufferList *p_ioData;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  OSStatus v18;
  AudioBufferList ioData;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "length");
    *(_QWORD *)&ioData.mNumberBuffers = 1;
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = *(_DWORD *)(v4 + 72);
    ioData.mBuffers[0].mNumberChannels = *(_DWORD *)(v4 + 76);
    v6 = v2 / v5;
    ioData.mBuffers[0].mDataByteSize = objc_msgSend(v3, "length");
    ioData.mBuffers[0].mData = (void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
    v7 = ExtAudioFileWrite(*(ExtAudioFileRef *)(*(_QWORD *)(a1 + 32) + 40), v6, &ioData);
    if (v7)
    {
      v8 = v7;
      v9 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        v15 = 136315394;
        v16 = "-[CSSiriAudioFileWriter appendAudioData:]_block_invoke";
        v17 = 1026;
        v18 = v8;
        v10 = "%s Failed writing audio file %{public}d";
        p_ioData = (AudioBufferList *)&v15;
        v12 = v9;
        v13 = 18;
LABEL_8:
        _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, v10, (uint8_t *)p_ioData, v13);
      }
    }
  }
  else
  {
    v14 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      ioData.mNumberBuffers = 136315138;
      *(_QWORD *)(&ioData.mNumberBuffers + 1) = "-[CSSiriAudioFileWriter appendAudioData:]_block_invoke";
      v10 = "%s No audio file to append data";
      p_ioData = &ioData;
      v12 = v14;
      v13 = 12;
      goto LABEL_8;
    }
  }
}

uint64_t __66__CSSiriAudioFileWriter_configureWithAudioStreamBasicDescription___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  void *v6;
  os_log_t *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UInt32 v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  AudioFileTypeID v17;
  UInt32 v18;
  OSStatus v19;
  OSStatus v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;
  int v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  AudioStreamBasicDescription v32;
  OSStatus Property;
  UInt32 ioPropertyDataSize;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  _BYTE v38[14];
  __int16 v39;
  int v40;
  __int16 v41;
  OSStatus *p_Property;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("CSSiriAudioFileWriter.m"), 213, CFSTR("AudioFile Already configured"));

    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = *(_OWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 64);
  *(_QWORD *)(v2 + 80) = *(_QWORD *)(a1 + 80);
  *(_OWORD *)(v2 + 48) = v3;
  *(_OWORD *)(v2 + 64) = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v5)
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
  else
    objc_msgSend((id)objc_opt_class(), "_generateTemporaryFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v6);

  v7 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v8 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    *(_DWORD *)buf = 136315394;
    v36 = "-[CSSiriAudioFileWriter configureWithAudioStreamBasicDescription:]_block_invoke";
    v37 = 2112;
    *(_QWORD *)v38 = v9;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s Creating audio file at URL %@", buf, 0x16u);
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 16);
  memset(&v32.mFormatID, 0, 32);
  v12 = *(_DWORD *)(v10 + 76);
  v32.mChannelsPerFrame = v12;
  if (!v12)
  {
    v13 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "_AudioStreamBasicDescriptionForAFAudioFileType";
      v37 = 2048;
      *(_QWORD *)v38 = 0;
      _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s inASBD->mChannelsPerFrame = %lu", buf, 0x16u);
    }
    v12 = 1;
    v32.mChannelsPerFrame = 1;
  }
  v32.mSampleRate = *(Float64 *)(v10 + 48);
  switch(v11)
  {
    case 3:
      v32.mSampleRate = 24000.0;
      v32.mFormatID = 1869641075;
      v32.mFramesPerPacket = 480;
      v32.mChannelsPerFrame = 1;
      break;
    case 2:
      *(_QWORD *)&v32.mFormatID = 0xC6C70636DLL;
      v32.mBitsPerChannel = 16;
      v32.mFramesPerPacket = 1;
      v32.mBytesPerFrame = 2 * v12;
      v32.mBytesPerPacket = 2 * v12;
      break;
    case 1:
      v32.mSampleRate = 0.0;
      v32.mFormatID = 1935764850;
      break;
    default:
      goto LABEL_21;
  }
  ioPropertyDataSize = 40;
  Property = AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &v32);
  if (Property)
  {
    v14 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v36 = "_AudioStreamBasicDescriptionForAFAudioFileType";
      v37 = 1042;
      *(_DWORD *)v38 = 4;
      *(_WORD *)&v38[4] = 2082;
      *(_QWORD *)&v38[6] = &v32.mFormatID;
      v39 = 1042;
      v40 = 4;
      v41 = 2082;
      p_Property = &Property;
      _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s Error getting format info for type %{public}.4s %{public}.4s", buf, 0x2Cu);
    }
  }
LABEL_21:
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(v15 + 16);
  if ((unint64_t)(v16 - 1) > 2)
    v17 = 0;
  else
    v17 = dword_1C276CAAC[v16 - 1];
  if (v16 == 3)
    v18 = 3;
  else
    v18 = 1;
  v19 = ExtAudioFileCreateWithURL(*(CFURLRef *)(v15 + 24), v17, &v32, 0, v18, (ExtAudioFileRef *)(v15 + 40));
  if (v19)
  {
    v20 = v19;
    v21 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 136315650;
      v36 = "-[CSSiriAudioFileWriter configureWithAudioStreamBasicDescription:]_block_invoke";
      v37 = 2114;
      *(_QWORD *)v38 = v30;
      *(_WORD *)&v38[8] = 1026;
      *(_DWORD *)&v38[10] = v20;
      _os_log_error_impl(&dword_1C2614000, v21, OS_LOG_TYPE_ERROR, "%s Failed creating audio file at url %{public}@ %{public}d", buf, 0x1Cu);
    }
    v22 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v22 + 96) && *(_QWORD *)(v22 + 88))
    {
      v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v24 = objc_msgSend(v23, "initWithDomain:code:userInfo:", CFSTR("CSSiriAudioFileWriterExtAudioFileErrorDomain"), v20, 0, *(_QWORD *)&v32.mSampleRate, *(_OWORD *)&v32.mFormatID, *(_OWORD *)&v32.mBytesPerFrame);
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(void **)(v25 + 96);
      *(_QWORD *)(v25 + 96) = v24;

    }
  }
  else
  {
    result = ExtAudioFileSetProperty(*(ExtAudioFileRef *)(*(_QWORD *)(a1 + 32) + 40), 0x63666D74u, 0x28u, (const void *)(*(_QWORD *)(a1 + 32) + 48));
    if (!(_DWORD)result)
      return result;
    v28 = result;
    v29 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CSSiriAudioFileWriter configureWithAudioStreamBasicDescription:]_block_invoke";
      v37 = 1026;
      *(_DWORD *)v38 = v28;
      _os_log_error_impl(&dword_1C2614000, v29, OS_LOG_TYPE_ERROR, "%s Error setting input format %{public}d", buf, 0x12u);
    }
  }
  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 40))
  {
    objc_msgSend((id)result, "_close");
    return objc_msgSend(*(id *)(a1 + 32), "_delete");
  }
  return result;
}

void __76__CSSiriAudioFileWriter__initWithType_pathGenerator_xorFileHandle_priority___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  _BYTE v19[1024];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 56);
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    if (fcntl(objc_msgSend(v3, "fileDescriptor"), 50, v19) == -1)
    {
      v9 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[CSSiriAudioFileWriter _initWithType:pathGenerator:xorFileHandle:priority:]_block_invoke";
        _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Error getting file path from provided file handle; will create our own path and handle",
          buf,
          0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 32);
      *(_QWORD *)(v5 + 32) = v4;

      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      (*(void (**)(_QWORD))(v7 + 16))(*(_QWORD *)(a1 + 48));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v1, "copy");
    }
    else
    {
      v8 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v8);
    if (v7)
    {

    }
  }
  if ((AFIsInternalInstall() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "shouldLogForQA") & 1) != 0)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);

      if (v12)
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        goto LABEL_17;
      }
    }
    else
    {

    }
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (!v10)
    goto LABEL_19;
LABEL_17:
  v15 = CFSTR("path");
  v16 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logEventWithType:context:", 238, v13);

}

+ (id)_generateTemporaryFileURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_savedAudioFilesDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("SavedAudioFile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
