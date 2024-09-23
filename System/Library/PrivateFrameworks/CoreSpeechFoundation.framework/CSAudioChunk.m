@implementation CSAudioChunk

- (CSAudioChunk)initWithData:(id)a3 numChannels:(unint64_t)a4 numSamples:(unint64_t)a5 sampleByteDepth:(unint64_t)a6 startSampleCount:(unint64_t)a7 hostTime:(unint64_t)a8 arrivalHostTimeToAudioRecorder:(unint64_t)a9 wasBuffered:(BOOL)a10 remoteVAD:(id)a11
{
  id v17;
  id v18;
  CSAudioChunk *v19;
  CSAudioChunk *v20;
  unint64_t v21;
  objc_super v24;

  v17 = a3;
  v18 = a11;
  v24.receiver = self;
  v24.super_class = (Class)CSAudioChunk;
  v19 = -[CSAudioChunk init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    v21 = a9;
    objc_storeStrong((id *)&v19->_data, a3);
    v20->_numChannels = a4;
    v20->_numSamples = a5;
    v20->_sampleByteDepth = a6;
    v20->_startSampleCount = a7;
    v20->_hostTime = a8;
    objc_storeStrong((id *)&v20->_remoteVAD, a11);
    v20->_wasBuffered = a10;
    if (!a9)
      v21 = mach_absolute_time();
    v20->_arrivalHostTimeToAudioRecorder = v21;
  }

  return v20;
}

- (CSAudioChunk)initWithData:(id)a3 numChannels:(unint64_t)a4 numSamples:(unint64_t)a5 sampleByteDepth:(unint64_t)a6 startSampleCount:(unint64_t)a7 hostTime:(unint64_t)a8 remoteVAD:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[CSAudioChunk initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:](self, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:", a3, a4, a5, a6, a7, a8, 0, v10, a9);
}

- (CSAudioChunk)initWithXPCObject:(id)a3
{
  id v4;
  CSAudioChunk *v5;
  const void *data;
  const void *v7;
  id v8;
  uint64_t v9;
  NSData *v10;
  const void *v11;
  const void *v12;
  id v13;
  uint64_t v14;
  NSData *remoteVAD;
  size_t v17;
  size_t length;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSAudioChunk;
  v5 = -[CSAudioChunk init](&v19, sel_init);
  if (v5)
  {
    v5->_numChannels = xpc_dictionary_get_uint64(v4, "numChannels");
    v5->_numSamples = xpc_dictionary_get_uint64(v4, "numSamples");
    v5->_sampleByteDepth = xpc_dictionary_get_uint64(v4, "sampleByteDepth");
    v5->_startSampleCount = xpc_dictionary_get_uint64(v4, "startSampleCount");
    v5->_hostTime = xpc_dictionary_get_uint64(v4, "hostTime");
    v5->_arrivalHostTimeToAudioRecorder = xpc_dictionary_get_uint64(v4, "arrivalHostTimeToAudioRecorder");
    v5->_wasBuffered = xpc_dictionary_get_BOOL(v4, "wasBufferedAudio");
    length = 0;
    data = xpc_dictionary_get_data(v4, "data", &length);
    if (data && length)
    {
      v7 = data;
      v8 = objc_alloc(MEMORY[0x1E0C99D50]);
      v9 = objc_msgSend(v8, "initWithBytes:length:", v7, length);
      v10 = v5->_data;
      v5->_data = (NSData *)v9;

    }
    v17 = 0;
    v11 = xpc_dictionary_get_data(v4, "remoteVAD", &v17);
    if (v11 && v17)
    {
      v12 = v11;
      v13 = objc_alloc(MEMORY[0x1E0C99D50]);
      v14 = objc_msgSend(v13, "initWithBytes:length:", v12, v17);
      remoteVAD = v5->_remoteVAD;
      v5->_remoteVAD = (NSData *)v14;

    }
  }

  return v5;
}

- (OS_xpc_object)xpcObject
{
  xpc_object_t v3;
  NSData *data;
  NSData *remoteVAD;
  uint64_t i;
  xpc_object_t values[7];
  char *keys[8];

  keys[7] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "numChannels";
  keys[1] = "numSamples";
  keys[2] = "sampleByteDepth";
  keys[3] = "startSampleCount";
  keys[4] = "hostTime";
  keys[5] = "arrivalHostTimeToAudioRecorder";
  keys[6] = "wasBufferedAudio";
  values[0] = xpc_uint64_create(self->_numChannels);
  values[1] = xpc_uint64_create(self->_numSamples);
  values[2] = xpc_uint64_create(self->_sampleByteDepth);
  values[3] = xpc_uint64_create(self->_startSampleCount);
  values[4] = xpc_uint64_create(self->_hostTime);
  values[5] = xpc_uint64_create(self->_arrivalHostTimeToAudioRecorder);
  values[6] = xpc_BOOL_create(self->_wasBuffered);
  v3 = xpc_dictionary_create((const char *const *)keys, values, 7uLL);
  data = self->_data;
  if (data && -[NSData length](data, "length"))
    xpc_dictionary_set_data(v3, "data", -[NSData bytes](self->_data, "bytes"), -[NSData length](self->_data, "length"));
  remoteVAD = self->_remoteVAD;
  if (remoteVAD && -[NSData length](remoteVAD, "length"))
    xpc_dictionary_set_data(v3, "remoteVAD", -[NSData bytes](self->_remoteVAD, "bytes"), -[NSData length](self->_remoteVAD, "length"));
  for (i = 6; i != -1; --i)

  return (OS_xpc_object *)v3;
}

- (id)chunkForChannel:(unint64_t)a3
{
  unint64_t numChannels;
  CSAudioChunk *v6;
  void *v7;
  unint64_t numSamples;
  unint64_t sampleByteDepth;
  unint64_t startSampleCount;
  unint64_t hostTime;
  BOOL wasBuffered;
  unint64_t arrivalHostTimeToAudioRecorder;
  void *v14;
  CSAudioChunk *v15;
  NSObject *v16;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  numChannels = self->_numChannels;
  if (numChannels <= a3)
  {
    v16 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "-[CSAudioChunk chunkForChannel:]";
      v21 = 1024;
      v22 = a3;
      v23 = 1024;
      v24 = numChannels;
      _os_log_error_impl(&dword_1B502E000, v16, OS_LOG_TYPE_ERROR, "%s channelId %d out of bound %d", buf, 0x18u);
    }
    v15 = 0;
  }
  else
  {
    v6 = [CSAudioChunk alloc];
    -[CSAudioChunk dataForChannel:](self, "dataForChannel:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    numSamples = self->_numSamples;
    sampleByteDepth = self->_sampleByteDepth;
    startSampleCount = self->_startSampleCount;
    hostTime = self->_hostTime;
    wasBuffered = self->_wasBuffered;
    arrivalHostTimeToAudioRecorder = self->_arrivalHostTimeToAudioRecorder;
    v14 = (void *)-[NSData copy](self->_remoteVAD, "copy");
    LOBYTE(v18) = wasBuffered;
    v15 = -[CSAudioChunk initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:](v6, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:", v7, 1, numSamples, sampleByteDepth, startSampleCount, hostTime, arrivalHostTimeToAudioRecorder, v18, v14);

  }
  return v15;
}

- (id)dataForChannel:(unint64_t)a3
{
  unint64_t sampleByteDepth;
  unint64_t numSamples;
  CSAudioChunk *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  _QWORD *v15;
  _QWORD v16[5];
  CSAudioChunk *v17;

  if (!a3 && self->_numChannels == 1)
    return self->_data;
  numSamples = self->_numSamples;
  sampleByteDepth = self->_sampleByteDepth;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__4772;
  v16[4] = __Block_byref_object_dispose__4773;
  v7 = self;
  v17 = v7;
  v8 = objc_alloc(MEMORY[0x1E0C99D50]);
  v9 = -[NSData bytes](v7->_data, "bytes");
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __31__CSAudioChunk_dataForChannel___block_invoke;
  v14 = &unk_1E687EE28;
  v15 = v16;
  v10 = (void *)objc_msgSend(v8, "initWithBytesNoCopy:length:deallocator:", v9 + numSamples * sampleByteDepth * a3);
  _Block_object_dispose(v16, 8);

  return v10;
}

- (id)dataWithRemoteVADWithScaleFactor:(float)a3 numAudioSamplesPerRemoteVAD:(unint64_t)a4
{
  id v7;
  _BYTE *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  int v14;
  unint64_t numSamples;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", (self->_numSamples + self->_numSamples * self->_numChannels) * self->_sampleByteDepth);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  memcpy((void *)objc_msgSend(v7, "bytes"), -[NSData bytes](self->_data, "bytes"), self->_numSamples * self->_sampleByteDepth * self->_numChannels);
  v8 = -[NSData bytes](self->_remoteVAD, "bytes");
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v9, "bytes");
  if (self->_numSamples)
  {
    v11 = v10;
    v12 = 0;
    do
    {
      if (v12 / a4 >= -[NSData length](self->_remoteVAD, "length"))
      {
        LOWORD(v14) = 0;
      }
      else
      {
        LOBYTE(v13) = v8[v12 / a4];
        v14 = (int)(float)((float)v13 * a3);
      }
      numSamples = self->_numSamples;
      *(_WORD *)(v11 + 2 * (v12 + self->_numChannels * numSamples)) = v14;
      ++v12;
    }
    while (v12 < numSamples);
  }
  return v9;
}

- (BOOL)remoteVADAvailable
{
  return self->_remoteVAD != 0;
}

- (id)subChunkFrom:(unint64_t)a3 numSamples:(unint64_t)a4 forChannel:(unint64_t)a5
{
  unint64_t numChannels;
  unint64_t numSamples;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  unint64_t sampleByteDepth;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t startSampleCount;
  unint64_t hostTime;
  unint64_t v24;
  unint64_t v25;
  unint64_t arrivalHostTimeToAudioRecorder;
  unint64_t v27;
  unint64_t v28;
  CSAudioChunk *v29;
  CSAudioChunk *v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a3 && !a5 && self->_numSamples == a4 && self->_numChannels == 1)
    return self;
  numChannels = self->_numChannels;
  if (numChannels <= a5)
  {
    v15 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "-[CSAudioChunk subChunkFrom:numSamples:forChannel:]";
      v34 = 2050;
      v35 = a5;
      v36 = 2050;
      v37 = numChannels;
      v12 = "%s Cannot generate subChunk since channel(%{public}tu) is larger than number of channels(%{public}tu)";
      v13 = v15;
      v14 = 32;
      goto LABEL_15;
    }
    return 0;
  }
  numSamples = self->_numSamples;
  if (a4 + a3 > numSamples)
  {
    v11 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[CSAudioChunk subChunkFrom:numSamples:forChannel:]";
      v34 = 2050;
      v35 = a3;
      v36 = 2050;
      v37 = a4;
      v38 = 2050;
      v39 = numSamples;
      v12 = "%s Cannot generate subChunk if it reuqest more than it has : %{public}tu %{public}tu %{public}tu";
      v13 = v11;
      v14 = 42;
LABEL_15:
      _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      return 0;
    }
    return 0;
  }
  sampleByteDepth = self->_sampleByteDepth;
  v18 = sampleByteDepth * a4;
  v19 = sampleByteDepth * (a3 + numSamples * a5);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", sampleByteDepth * a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](self->_data, "subdataWithRange:", v19, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendData:", v21);

  startSampleCount = self->_startSampleCount;
  hostTime = self->_hostTime;
  v24 = startSampleCount + a3;
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  v25 = +[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v24, hostTime, startSampleCount);
  arrivalHostTimeToAudioRecorder = self->_arrivalHostTimeToAudioRecorder;
  v27 = self->_startSampleCount;
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  v28 = +[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v24, arrivalHostTimeToAudioRecorder, v27);
  v29 = [CSAudioChunk alloc];
  LOBYTE(v31) = self->_wasBuffered;
  v30 = -[CSAudioChunk initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:](v29, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:", v20, 1, a4, self->_sampleByteDepth, v24, v25, v28, v31, 0);

  return v30;
}

- (id)subChunkFrom:(unint64_t)a3 numSamples:(unint64_t)a4
{
  unint64_t numSamples;
  CSAudioChunk *v8;
  NSObject *v9;
  unint64_t numChannels;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t sampleByteDepth;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t startSampleCount;
  unint64_t hostTime;
  unint64_t v21;
  unint64_t v22;
  unint64_t arrivalHostTimeToAudioRecorder;
  unint64_t v24;
  unint64_t v25;
  CSAudioChunk *v26;
  CSAudioChunk *v27;
  uint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  numSamples = self->_numSamples;
  if (!a3 && numSamples == a4)
  {
    v8 = self;
    return v8;
  }
  if (a4 + a3 <= numSamples)
  {
    numChannels = self->_numChannels;
    if (numChannels == 1)
    {
      -[CSAudioChunk subChunkFrom:numSamples:forChannel:](self, "subChunkFrom:numSamples:forChannel:", a3, a4, 0);
      v8 = (CSAudioChunk *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
    v12 = self->_sampleByteDepth * a4;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v12 * numChannels);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_numChannels)
    {
      v14 = 0;
      sampleByteDepth = self->_sampleByteDepth;
      v16 = sampleByteDepth * a3;
      v17 = self->_numSamples * sampleByteDepth;
      do
      {
        -[NSData subdataWithRange:](self->_data, "subdataWithRange:", v16, v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendData:", v18);

        ++v14;
        v16 += v17;
      }
      while (v14 < self->_numChannels);
    }
    startSampleCount = self->_startSampleCount;
    hostTime = self->_hostTime;
    v21 = startSampleCount + a3;
    +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
    v22 = +[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v21, hostTime, startSampleCount);
    arrivalHostTimeToAudioRecorder = self->_arrivalHostTimeToAudioRecorder;
    v24 = self->_startSampleCount;
    +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
    v25 = +[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v21, arrivalHostTimeToAudioRecorder, v24);
    v26 = [CSAudioChunk alloc];
    LOBYTE(v28) = self->_wasBuffered;
    v27 = -[CSAudioChunk initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:](v26, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:", v13, self->_numChannels, a4, self->_sampleByteDepth, v21, v22, v25, v28, 0);

    return v27;
  }
  else
  {
    v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "-[CSAudioChunk subChunkFrom:numSamples:]";
      v31 = 2050;
      v32 = a3;
      v33 = 2050;
      v34 = a4;
      v35 = 2050;
      v36 = numSamples;
      _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s Cannot generate subChunk if it reuqest more than it has : %{public}tu %{public}tu %{public}tu", buf, 0x2Au);
    }
    return 0;
  }
}

- (unint64_t)copySubAudioChunkFrom:(unint64_t)a3 numSamples:(unint64_t)a4 to:(void *)a5 dstBufferSize:(unint64_t)a6
{
  unint64_t v6;
  int v7;
  NSObject *v8;
  unint64_t v9;
  char *v13;
  char *v14;
  unint64_t v15;
  unint64_t sampleByteDepth;
  unint64_t v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = self->_sampleByteDepth * a4 * self->_numChannels;
  if (v6 <= a6)
  {
    v9 = a4;
    v13 = -[NSData bytes](self->_data, "bytes");
    if (self->_numChannels)
    {
      v14 = v13;
      v15 = 0;
      sampleByteDepth = self->_sampleByteDepth;
      v17 = sampleByteDepth * a3;
      do
      {
        memcpy(a5, &v14[v17], sampleByteDepth * v9);
        sampleByteDepth = self->_sampleByteDepth;
        v14 += sampleByteDepth * self->_numSamples;
        a5 = (char *)a5 + sampleByteDepth * v9;
        ++v15;
      }
      while (v15 < self->_numChannels);
    }
  }
  else
  {
    v7 = a6;
    v8 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315650;
      v20 = "-[CSAudioChunk copySubAudioChunkFrom:numSamples:to:dstBufferSize:]";
      v21 = 1024;
      v22 = v7;
      v23 = 1024;
      v24 = v6;
      _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s Unable to write subChunk into dstBufferSize(%d) : required buffer size (%d)", (uint8_t *)&v19, 0x18u);
    }
    return 0;
  }
  return v9;
}

- (id)remoteVADSubChunkFrom:(unint64_t)a3 numSamples:(unint64_t)a4 numAudioSamplesPerRemoteVAD:(unint64_t)a5
{
  unint64_t v9;
  id v10;
  _BYTE *v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;

  if (self->_remoteVAD)
  {
    v9 = a4 / a5;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", a4 / a5);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (_BYTE *)objc_msgSend(v10, "bytes");
    v12 = -[NSData bytes](self->_remoteVAD, "bytes");
    if (a5 <= a4)
    {
      v13 = v12;
      v14 = 0;
      if (v9 <= 1)
        v9 = 1;
      v15 = a3 / a5;
      do
      {
        if (v15 + v14 >= -[NSData length](self->_remoteVAD, "length"))
          v16 = 0;
        else
          v16 = v13[v15 + v14];
        *v11++ = v16;
        ++v14;
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)gainCompensatedChunk
{
  void *v3;
  CSAudioChunk *v4;
  CSAudioChunk *v5;
  uint64_t v7;

  v3 = (void *)-[NSData mutableCopy](self->_data, "mutableCopy");
  if (+[CSConfig inputRecordingIsFloat](CSConfig, "inputRecordingIsFloat"))
    +[CSFLPCMTypeConverter apply12dBGainToFloatBuffer:](CSFLPCMTypeConverter, "apply12dBGainToFloatBuffer:", v3);
  else
    +[CSFLPCMTypeConverter apply12dBGainToShortBuffer:](CSFLPCMTypeConverter, "apply12dBGainToShortBuffer:", v3);
  v4 = [CSAudioChunk alloc];
  LOBYTE(v7) = self->_wasBuffered;
  v5 = -[CSAudioChunk initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:](v4, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:", v3, self->_numChannels, self->_numSamples, self->_sampleByteDepth, self->_startSampleCount, self->_hostTime, self->_arrivalHostTimeToAudioRecorder, v7, self->_remoteVAD);

  return v5;
}

- (void)skipSamplesAtStartSuchThatNumSamplesReceivedSoFar:(unint64_t)a3 reachesACountOf:(unint64_t)a4 completionHandler:(id)a5
{
  unint64_t v6;
  void (**v7)(_QWORD);
  unint64_t v8;
  void (*v9)(void);
  id v10;

  v6 = a4 - a3;
  if (a4 <= a3)
  {
    v9 = (void (*)(void))*((_QWORD *)a5 + 2);
    v10 = a5;
    v9();
  }
  else
  {
    v7 = (void (**)(_QWORD))a5;
    v8 = -[CSAudioChunk numSamples](self, "numSamples");
    if (v6 >= v8)
      v6 = v8;
    -[CSAudioChunk subChunkFrom:numSamples:](self, "subChunkFrom:numSamples:", v6, -[CSAudioChunk numSamples](self, "numSamples") - v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7);

  }
}

- (void)splitAudioChunkSuchThatNumSamplesReceivedSoFar:(unint64_t)a3 reachesACountOf:(unint64_t)a4 completionHandler:(id)a5
{
  void (**v8)(id, CSAudioChunk *, _QWORD, uint64_t);
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  CSAudioChunk *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, CSAudioChunk *, _QWORD, uint64_t))a5;
  if ((uint64_t)(a4 - a3) <= 0)
  {
    v11 = CSLogCategorySpkrId;
    if (os_log_type_enabled((os_log_t)CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = "-[CSAudioChunk splitAudioChunkSuchThatNumSamplesReceivedSoFar:reachesACountOf:completionHandler:]";
      v16 = 2048;
      v17 = a3;
      v18 = 2048;
      v19 = a4;
      _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s Processing ended at: numSamplesProcessed=%lu, totalSampleCountToReach=%lu", (uint8_t *)&v14, 0x20u);
    }
    v8[2](v8, self, 0, 1);
  }
  else
  {
    v9 = -[CSAudioChunk numSamples](self, "numSamples");
    if (v9 >= a4 - a3)
      v10 = a4 - a3;
    else
      v10 = v9;
    if (v10 == -[CSAudioChunk numSamples](self, "numSamples"))
    {
      v8[2](v8, self, 0, 0);
    }
    else
    {
      -[CSAudioChunk subChunkFrom:numSamples:](self, "subChunkFrom:numSamples:", 0, v10);
      v12 = (CSAudioChunk *)objc_claimAutoreleasedReturnValue();
      -[CSAudioChunk subChunkFrom:numSamples:](self, "subChunkFrom:numSamples:", v10, -[CSAudioChunk numSamples](self, "numSamples") - v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, CSAudioChunk *, void *, uint64_t))v8)[2](v8, v12, v13, 0);

    }
  }

}

- (CSAudioChunk)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  CSAudioChunk *v30;
  uint64_t v32;
  void *v33;

  v3 = a3;
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "numChannels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "numSamples");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sampleByteDepth");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "startSampleCount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedLongLongValue");

  v22 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hostTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "unsignedLongLongValue");

  v26 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "arrivalHostTimeToAudioRecorder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v28, "unsignedLongLongValue");
  LOBYTE(v32) = 0;
  v30 = -[CSAudioChunk initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:](self, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:", v33, v9, v13, v17, v21, v25, v29, v32, 0);

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSData *data;
  void *v18;
  id v19;

  v4 = (objc_class *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  v19 = (id)objc_msgSend([v4 alloc], "initWithUnsignedInteger:", self->_numChannels);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", self->_numSamples);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", self->_sampleByteDepth);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", self->_startSampleCount);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", self->_hostTime);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", self->_arrivalHostTimeToAudioRecorder);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "numChannels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v19, v11);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "numSamples");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, v12);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sampleByteDepth");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, v13);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "startSampleCount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, v14);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hostTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, v15);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "arrivalHostTimeToAudioRecorder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, v16);

  data = self->_data;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", data, v18);

}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)numChannels
{
  return self->_numChannels;
}

- (unint64_t)numSamples
{
  return self->_numSamples;
}

- (unint64_t)sampleByteDepth
{
  return self->_sampleByteDepth;
}

- (unint64_t)startSampleCount
{
  return self->_startSampleCount;
}

- (unint64_t)hostTime
{
  return self->_hostTime;
}

- (unint64_t)arrivalHostTimeToAudioRecorder
{
  return self->_arrivalHostTimeToAudioRecorder;
}

- (BOOL)wasBuffered
{
  return self->_wasBuffered;
}

- (NSData)remoteVAD
{
  return self->_remoteVAD;
}

- (void)setRemoteVAD:(id)a3
{
  objc_storeStrong((id *)&self->_remoteVAD, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteVAD, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

void __31__CSAudioChunk_dataForChannel___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
