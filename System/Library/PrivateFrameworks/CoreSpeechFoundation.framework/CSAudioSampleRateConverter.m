@implementation CSAudioSampleRateConverter

- (CSAudioSampleRateConverter)initWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4
{
  char *v6;
  CSAudioSampleRateConverter *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v15[2];
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CSAudioSampleRateConverter;
  v6 = -[CSAudioSampleRateConverter init](&v19, sel_init);
  v7 = (CSAudioSampleRateConverter *)v6;
  if (v6)
  {
    v8 = *(_OWORD *)&a3->mSampleRate;
    v9 = *(_OWORD *)&a3->mBytesPerPacket;
    *((_QWORD *)v6 + 7) = *(_QWORD *)&a3->mBitsPerChannel;
    *(_OWORD *)(v6 + 40) = v9;
    *(_OWORD *)(v6 + 24) = v8;
    v10 = *(_OWORD *)&a4->mSampleRate;
    v11 = *(_OWORD *)&a4->mBytesPerPacket;
    *((_QWORD *)v6 + 12) = *(_QWORD *)&a4->mBitsPerChannel;
    *((_OWORD *)v6 + 4) = v10;
    *((_OWORD *)v6 + 5) = v11;
    v12 = *(_OWORD *)&a3->mBytesPerPacket;
    v17[0] = *(_OWORD *)&a3->mSampleRate;
    v17[1] = v12;
    v18 = *(_QWORD *)&a3->mBitsPerChannel;
    v13 = *(_OWORD *)&a4->mBytesPerPacket;
    v15[0] = *(_OWORD *)&a4->mSampleRate;
    v15[1] = v13;
    v16 = *(_QWORD *)&a4->mBitsPerChannel;
    *((_QWORD *)v6 + 1) = objc_msgSend(v6, "_createSampleRateConverterWithInASBD:outASBD:", v17, v15);
  }
  return v7;
}

- (void)dealloc
{
  OpaqueAudioConverter *sampleRateConverter;
  objc_super v4;

  sampleRateConverter = self->_sampleRateConverter;
  if (sampleRateConverter)
  {
    AudioConverterDispose(sampleRateConverter);
    self->_sampleRateConverter = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAudioSampleRateConverter;
  -[CSAudioSampleRateConverter dealloc](&v4, sel_dealloc);
}

- (OpaqueAudioConverter)_createSampleRateConverterWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4
{
  OSStatus v7;
  OSStatus v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  float v15;
  int inPropertyData;
  AudioConverterRef outAudioConverter;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  OSStatus v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  outAudioConverter = 0;
  v7 = AudioConverterNew(a3, a4, &outAudioConverter);
  if (!v7)
  {
    inPropertyData = 127;
    if (AudioConverterSetProperty(outAudioConverter, 0x73726371u, 4u, &inPropertyData))
    {
      AudioConverterDispose(outAudioConverter);
      v13 = CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        return 0;
      *(_DWORD *)buf = 136315138;
      v19 = "-[CSAudioSampleRateConverter _createSampleRateConverterWithInASBD:outASBD:]";
      v10 = "%s Cannot set Quality property to audioConverter";
    }
    else
    {
      inPropertyData = 1852797549;
      if (!AudioConverterSetProperty(outAudioConverter, 0x73726361u, 4u, &inPropertyData))
      {
        v15 = a4->mSampleRate / a3->mSampleRate;
        self->_outBufferScaleFactor = v15;
        return outAudioConverter;
      }
      AudioConverterDispose(outAudioConverter);
      v13 = CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        return 0;
      *(_DWORD *)buf = 136315138;
      v19 = "-[CSAudioSampleRateConverter _createSampleRateConverterWithInASBD:outASBD:]";
      v10 = "%s Cannot set Complexity property to audioConverter";
    }
    v11 = v13;
    v12 = 12;
    goto LABEL_11;
  }
  v8 = v7;
  v9 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[CSAudioSampleRateConverter _createSampleRateConverterWithInASBD:outASBD:]";
    v20 = 1026;
    v21 = v8;
    v10 = "%s Cannot create SampleRateConverter using AudioConverterNew : %{public}d";
    v11 = v9;
    v12 = 18;
LABEL_11:
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
  }
  return 0;
}

- (id)convertSampleRateOfBuffer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  UInt32 v9;
  OpaqueAudioConverter *sampleRateConverter;
  id v11;
  OSStatus v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD inInputDataProcUserData[4];
  id v20;
  CSAudioSampleRateConverter *v21;
  _QWORD *v22;
  UInt32 ioOutputDataPacketSize;
  AudioBufferList outOutputData;
  _QWORD v25[3];
  int v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_sampleRateConverter || !objc_msgSend(v4, "length"))
  {
    v8 = v5;
    goto LABEL_18;
  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", (unint64_t)(float)(self->_outBufferScaleFactor * (float)(unint64_t)objc_msgSend(v5, "length")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  while (1)
  {
    memset(&outOutputData.mNumberBuffers + 1, 0, 20);
    outOutputData.mNumberBuffers = 1;
    v8 = objc_retainAutorelease(v6);
    outOutputData.mBuffers[0].mData = (void *)objc_msgSend(v8, "mutableBytes");
    v9 = objc_msgSend(v8, "length");
    outOutputData.mBuffers[0].mNumberChannels = self->_outASBD.mChannelsPerFrame;
    outOutputData.mBuffers[0].mDataByteSize = v9;
    ioOutputDataPacketSize = 0;
    ioOutputDataPacketSize = objc_msgSend(v8, "length");
    sampleRateConverter = self->_sampleRateConverter;
    inInputDataProcUserData[0] = MEMORY[0x1E0C809B0];
    inInputDataProcUserData[1] = 3221225472;
    inInputDataProcUserData[2] = __56__CSAudioSampleRateConverter_convertSampleRateOfBuffer___block_invoke;
    inInputDataProcUserData[3] = &unk_1E687E378;
    v11 = v5;
    v21 = self;
    v22 = v25;
    v20 = v11;
    v12 = AudioConverterFillComplexBuffer(sampleRateConverter, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
    v13 = v12;
    v7 += self->_outASBD.mBytesPerFrame * ioOutputDataPacketSize;
    if (v12 | ioOutputDataPacketSize)
    {
      if (v12 != 1836086393 && v12)
        goto LABEL_14;
    }
    else
    {
      v14 = CSLogCategoryAudio;
      v13 = 1836086393;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[CSAudioSampleRateConverter convertSampleRateOfBuffer:]";
        _os_log_debug_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEBUG, "%s Override result as 'mpty'", buf, 0xCu);
      }
    }
    v15 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEBUG))
      break;
    if (v13)
      goto LABEL_13;
LABEL_11:

  }
  v16 = self->_outASBD.mBytesPerFrame * ioOutputDataPacketSize;
  *(_DWORD *)buf = 136315394;
  v28 = "-[CSAudioSampleRateConverter convertSampleRateOfBuffer:]";
  v29 = 2048;
  v30 = v16;
  _os_log_debug_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEBUG, "%s Audio resampling done : %lu", buf, 0x16u);
  if (!v13)
    goto LABEL_11;
LABEL_13:
  if (v13 == 1836086393)
    goto LABEL_16;
LABEL_14:
  v17 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[CSAudioSampleRateConverter convertSampleRateOfBuffer:]";
    v29 = 1026;
    LODWORD(v30) = v13;
    _os_log_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEFAULT, "%s AudioConverter is sad: 0x%{public}xd", buf, 0x12u);
  }
LABEL_16:

  objc_msgSend(v8, "setLength:", v7);
  _Block_object_dispose(v25, 8);
LABEL_18:

  return v8;
}

uint64_t __56__CSAudioSampleRateConverter_convertSampleRateOfBuffer___block_invoke(uint64_t a1, int *a2, uint64_t a3)
{
  int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v6 = objc_msgSend(*(id *)(a1 + 32), "length");
  v7 = *(_QWORD *)(a1 + 40);
  v8 = v6 - *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v9 = *(_DWORD *)(v7 + 48);
  *(_DWORD *)(a3 + 8) = *(_DWORD *)(v7 + 92);
  if (v9 <= v8)
  {
    v11 = v8 / v9;
    if (v8 / v9 >= *a2)
    {
      v14 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
      result = 0;
      *(_QWORD *)(a3 + 16) = v14 + *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v13 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 48) * *a2;
    }
    else
    {
      *a2 = v11;
      v12 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
      result = 0;
      *(_QWORD *)(a3 + 16) = v12 + *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v13 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 48) * v11;
    }
    *(_DWORD *)(a3 + 12) = v13;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v13;
  }
  else
  {
    *a2 = 0;
    *(_QWORD *)(a3 + 16) = 0;
    result = 1836086393;
    *(_DWORD *)(a3 + 12) = 0;
  }
  return result;
}

+ (id)upsampler
{
  CSAudioSampleRateConverter *v2;
  uint64_t v4;
  _BYTE v5[40];

  v2 = [CSAudioSampleRateConverter alloc];
  +[CSFAudioStreamBasicDescriptionFactory lpcmNarrowBandASBD](CSFAudioStreamBasicDescriptionFactory, "lpcmNarrowBandASBD");
  +[CSFAudioStreamBasicDescriptionFactory lpcmASBD](CSFAudioStreamBasicDescriptionFactory, "lpcmASBD");
  return -[CSAudioSampleRateConverter initWithInASBD:outASBD:](v2, "initWithInASBD:outASBD:", v5, &v4);
}

+ (id)downsampler
{
  CSAudioSampleRateConverter *v2;
  uint64_t v4;
  _BYTE v5[40];

  v2 = [CSAudioSampleRateConverter alloc];
  +[CSFAudioStreamBasicDescriptionFactory lpcmASBD](CSFAudioStreamBasicDescriptionFactory, "lpcmASBD");
  +[CSFAudioStreamBasicDescriptionFactory lpcmNarrowBandASBD](CSFAudioStreamBasicDescriptionFactory, "lpcmNarrowBandASBD");
  return -[CSAudioSampleRateConverter initWithInASBD:outASBD:](v2, "initWithInASBD:outASBD:", v5, &v4);
}

@end
