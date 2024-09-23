@implementation CSAudioConverter

- (CSAudioConverter)initWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4
{
  CSAudioConverter *v6;
  __int128 v7;
  __int128 v8;
  OSStatus v9;
  OSStatus v10;
  NSObject *v11;
  const char *v12;
  OSStatus v13;
  AudioConverterRef v14;
  CSAudioConverter *v15;
  uint64_t v16;
  NSMutableData *bufferedLPCM;
  AudioStreamBasicDescription v19;
  AudioStreamBasicDescription inSourceFormat;
  objc_super v21;
  OSStatus inPropertyData;
  AudioConverterRef outAudioConverter;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  OSStatus v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)CSAudioConverter;
  v6 = -[CSAudioConverter init](&v21, sel_init);
  if (!v6)
  {
LABEL_12:
    v15 = v6;
    goto LABEL_13;
  }
  v7 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_OWORD *)&inSourceFormat.mSampleRate = *(_OWORD *)&a3->mSampleRate;
  *(_OWORD *)&inSourceFormat.mBytesPerPacket = v7;
  *(_QWORD *)&inSourceFormat.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  v8 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)&v19.mSampleRate = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&v19.mBytesPerPacket = v8;
  *(_QWORD *)&v19.mBitsPerChannel = *(_QWORD *)&a4->mBitsPerChannel;
  outAudioConverter = 0;
  v9 = AudioConverterNew(&inSourceFormat, &v19, &outAudioConverter);
  if (v9)
  {
    v10 = v9;
    v11 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "CreateAudioConverter";
      v26 = 1026;
      v27 = v10;
      v12 = "%s Cannot create AudioConverter using AudioConverterNew : %{public}u";
LABEL_8:
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  inPropertyData = objc_msgSend(MEMORY[0x1E0D19090], "audioConverterBitrate");
  v13 = AudioConverterSetProperty(outAudioConverter, 0x62726174u, 4u, &inPropertyData);
  v14 = outAudioConverter;
  if (!v13)
  {
    v6->_opusConverter = outAudioConverter;
    if (!v14)
    {
      v15 = 0;
      goto LABEL_13;
    }
    -[CSAudioConverter _configureAudioConverter:](v6, "_configureAudioConverter:");
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v16 = objc_claimAutoreleasedReturnValue();
    bufferedLPCM = v6->_bufferedLPCM;
    v6->_bufferedLPCM = (NSMutableData *)v16;

    goto LABEL_12;
  }
  AudioConverterDispose(outAudioConverter);
  v11 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "CreateAudioConverter";
    v26 = 1026;
    v27 = inPropertyData;
    v12 = "%s Cannot set encoder bit rate : %{public}u";
    goto LABEL_8;
  }
LABEL_9:
  v15 = 0;
  v6->_opusConverter = 0;
LABEL_13:

  return v15;
}

- (void)dealloc
{
  OpaqueAudioConverter *opusConverter;
  objc_super v4;

  opusConverter = self->_opusConverter;
  if (opusConverter)
  {
    AudioConverterDispose(opusConverter);
    self->_opusConverter = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAudioConverter;
  -[CSAudioConverter dealloc](&v4, sel_dealloc);
}

- (void)addSamples:(id)a3 timestamp:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5
{
  void *v8;
  id v9;

  v9 = a3;
  v8 = v9;
  if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
  {
    objc_msgSend(MEMORY[0x1E0D19100], "convertToShortLPCMBufFromFloatLPCMBuf:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NSMutableData appendData:](self->_bufferedLPCM, "appendData:", v8);
  -[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:](self, "_convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:", self->_bufferedLPCM, 0, a4, a5);
  self->_lastTimestamp = a4;
  self->_lastArrivalTimestampToAudioRecorder = a5;

}

- (void)flush
{
  -[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:](self, "_convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:", self->_bufferedLPCM, 1, self->_lastTimestamp, self->_lastArrivalTimestampToAudioRecorder);
}

- (void)_convertBufferedLPCM:(id)a3 allowPartial:(BOOL)a4 timestamp:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6
{
  void *v6;
  __int128 v7;
  os_log_t *v8;
  CSAudioConverter *v9;
  uint64_t v10;
  uint64_t v11;
  UInt32 convertAudioCapacity;
  uint64_t v13;
  AudioStreamPacketDescription *v14;
  OpaqueAudioConverter *opusConverter;
  id v16;
  OSStatus v17;
  int v18;
  UInt32 v19;
  NSObject *v20;
  unint64_t v21;
  unsigned int *p_mDataByteSize;
  NSObject *v23;
  void *v24;
  double outPacketSizeInSec;
  unsigned int v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id *p_delegate;
  id WeakRetained;
  BOOL v32;
  id v33;
  float v34;
  double v35;
  int v36;
  UInt32 v37;
  unint64_t v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  SEL v42;
  _BOOL4 v43;
  id v44;
  CSAudioConverter *v45;
  _QWORD inInputDataProcUserData[4];
  id v47;
  CSAudioConverter *v48;
  uint64_t *v49;
  SEL v50;
  BOOL v51;
  UInt32 ioOutputDataPacketSize;
  AudioBufferList outOutputData;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  int v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  UInt32 v63;
  __int16 v64;
  double v65;
  __int16 v66;
  unsigned int v67;
  uint64_t v68;

  v39 = a6;
  v38 = a5;
  v43 = a4;
  v42 = a2;
  v45 = self;
  v68 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "length"))
  {
    *(_QWORD *)&v7 = 136315138;
    v40 = v7;
    v8 = (os_log_t *)MEMORY[0x1E0D18F60];
    *(_QWORD *)&v7 = 136316162;
    v41 = v7;
    while (1)
    {
      memset(&outOutputData, 0, sizeof(outOutputData));
      v9 = v45;
      v10 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
      outOutputData.mBuffers[0].mData = (char *)&v38 - ((v11 + 15) & 0x1FFFFFFF0);
      convertAudioCapacity = v9->_convertAudioCapacity;
      ioOutputDataPacketSize = v9->_convertPacketCount;
      outOutputData.mNumberBuffers = 1;
      outOutputData.mBuffers[0].mNumberChannels = 1;
      outOutputData.mBuffers[0].mDataByteSize = convertAudioCapacity;
      MEMORY[0x1E0C80A78](v10);
      v14 = (AudioStreamPacketDescription *)(&v38 - 2 * v13);
      opusConverter = v9->_opusConverter;
      inInputDataProcUserData[0] = MEMORY[0x1E0C809B0];
      inInputDataProcUserData[1] = 3221225472;
      inInputDataProcUserData[2] = __96__CSAudioConverter__convertBufferedLPCM_allowPartial_timestamp_arrivalTimestampToAudioRecorder___block_invoke;
      inInputDataProcUserData[3] = &unk_1E7C28E48;
      v16 = v44;
      v48 = v9;
      v49 = &v54;
      v50 = v42;
      v47 = v16;
      v51 = v43;
      v17 = AudioConverterFillComplexBuffer(opusConverter, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke_25988, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, v14);
      v18 = v17;
      v19 = ioOutputDataPacketSize;
      if (v17 | ioOutputDataPacketSize)
      {
        if (v17 != 1836086393 && v17)
          goto LABEL_18;
      }
      else
      {
        v20 = *MEMORY[0x1E0D18F38];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEBUG))
          goto LABEL_20;
        *(_DWORD *)buf = v40;
        v59 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
        _os_log_debug_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEBUG, "%s Override result as 'mpty'", buf, 0xCu);
        v18 = 1836086393;
        v19 = ioOutputDataPacketSize;
      }
      if (v19)
      {
        v21 = 0;
        p_mDataByteSize = &v14->mDataByteSize;
        do
        {
          v23 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
          {
            outPacketSizeInSec = v45->_outPacketSizeInSec;
            v26 = *p_mDataByteSize;
            *(_DWORD *)buf = v41;
            v59 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
            v60 = 1026;
            v61 = v21 + 1;
            v62 = 1026;
            v63 = v19;
            v64 = 2050;
            v65 = outPacketSizeInSec;
            v66 = 1024;
            v67 = v26;
            _os_log_debug_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEBUG, "%s [%{public}02u of %{public}02u %{public}fs] Opus packet with %u bytes", buf, 0x28u);
          }
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (char *)outOutputData.mBuffers[0].mData + *(_QWORD *)(p_mDataByteSize - 3), *p_mDataByteSize, v38, v39);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v24);

          ++v21;
          v19 = ioOutputDataPacketSize;
          p_mDataByteSize += 4;
        }
        while (v21 < ioOutputDataPacketSize);
      }
      if (v18)
        break;

    }
    if (v18 == 1836086393)
      goto LABEL_20;
LABEL_18:
    v28 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
      v60 = 1026;
      v61 = v18;
      _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_DEFAULT, "%s AudioConverter is sad: 0x%{public}xd", buf, 0x12u);
    }
LABEL_20:

    objc_msgSend(v16, "replaceBytesInRange:withBytes:length:", 0, *((int *)v55 + 6), 0, 0);
    v29 = *v8;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v36 = *((_DWORD *)v55 + 6);
      v37 = objc_msgSend(v16, "length");
      *(_DWORD *)buf = 136315650;
      v59 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
      v60 = 1026;
      v61 = v36;
      v62 = 1026;
      v63 = v37;
      _os_log_debug_impl(&dword_1C2614000, v29, OS_LOG_TYPE_DEBUG, "%s %{public}d bytesConsumed from opus coverter, remains %{public}d bytes", buf, 0x18u);
    }

    *((_DWORD *)v55 + 6) = 0;
    if (objc_msgSend(v6, "count"))
    {
      p_delegate = (id *)&v45->_delegate;
      WeakRetained = objc_loadWeakRetained((id *)&v45->_delegate);
      v32 = WeakRetained == 0;

      if (!v32)
      {
        v33 = objc_loadWeakRetained(p_delegate);
        v34 = v45->_outPacketSizeInSec;
        *(float *)&v35 = v34 * (float)(unint64_t)objc_msgSend(v6, "count");
        objc_msgSend(v33, "audioConverterDidConvertPackets:packets:durationInSec:timestamp:arrivalTimestampToAudioRecorder:", v45, v6, v38, v39, v35);

      }
    }
  }
  else
  {
    v27 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v59 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
      _os_log_impl(&dword_1C2614000, v27, OS_LOG_TYPE_DEFAULT, "%s There is not audio buffer to convert. Skip this.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v54, 8);
}

- (void)reset
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSAudioConverter reset]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Resetting AudioConverter buffer", (uint8_t *)&v4, 0xCu);
  }
  -[NSMutableData setLength:](self->_bufferedLPCM, "setLength:", 0);
  AudioConverterReset(self->_opusConverter);
}

- (void)_configureAudioConverter:(OpaqueAudioConverter *)a3
{
  double v5;
  double v6;
  float v7;
  unsigned int v8;
  os_log_t *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  OSStatus Property;
  OSStatus v17;
  NSObject *v18;
  double mSampleRate;
  UInt32 mBytesPerPacket;
  UInt32 mFramesPerPacket;
  float v22;
  OSStatus v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  unsigned int v27;
  NSObject *v28;
  unsigned int convertPacketCount;
  OSStatus v30;
  NSObject *v31;
  NSObject *v32;
  unsigned int v33;
  unsigned int outPropertyData;
  UInt32 v35;
  UInt32 ioPropertyDataSize;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  double v42;
  __int16 v43;
  unsigned int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v8 = (v6 * v7);
  v9 = (os_log_t *)MEMORY[0x1E0D18F38];
  v10 = (void *)*MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x1E0D19090];
    v12 = v10;
    objc_msgSend(v11, "inputRecordingBufferDuration");
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    *(_DWORD *)buf = 136315906;
    v38 = "-[CSAudioConverter _configureAudioConverter:]";
    v39 = 2050;
    v40 = v14;
    v41 = 2050;
    v42 = v15;
    v43 = 1026;
    v44 = v8;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s createAudioConverter : initial frames per buffer = dur %{public}.2f * sr %{public}.2f = %{public}u", buf, 0x26u);

  }
  ioPropertyDataSize = 40;
  Property = AudioConverterGetProperty(a3, 0x61636F64u, &ioPropertyDataSize, &self->_opusOutASBD);
  if (Property)
  {
    v17 = Property;
    v18 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[CSAudioConverter _configureAudioConverter:]";
      v39 = 1026;
      LODWORD(v40) = v17;
      _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Failed to get audioConverter property (kAudioConverterCurrentOutputStreamDescription) : %{public}d", buf, 0x12u);
    }
  }
  mSampleRate = self->_opusOutASBD.mSampleRate;
  if (self->_opusOutASBD.mFormatID != 1936745848)
    self->_recordBasePacketsPerSecond = (mSampleRate / (double)v8);
  mBytesPerPacket = self->_opusOutASBD.mBytesPerPacket;
  mFramesPerPacket = self->_opusOutASBD.mFramesPerPacket;
  v22 = (double)mFramesPerPacket / mSampleRate;
  self->_outPacketSizeInSec = v22;
  outPropertyData = 2100;
  v35 = mBytesPerPacket;
  ioPropertyDataSize = 4;
  v23 = AudioConverterGetProperty(a3, 0x6D6F6273u, &ioPropertyDataSize, &outPropertyData);
  v24 = *v9;
  v25 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (!v25)
      goto LABEL_14;
    *(_DWORD *)buf = 136315394;
    v38 = "-[CSAudioConverter _configureAudioConverter:]";
    v39 = 1026;
    LODWORD(v40) = v23;
    v26 = "%s _configureAudioConverter: AudioConverterGetProperty(kAudioConverterPropertyMinimumOutputBufferSize) returne"
          "d status %{public}d";
  }
  else
  {
    if (!v25)
      goto LABEL_14;
    *(_DWORD *)buf = 136315394;
    v38 = "-[CSAudioConverter _configureAudioConverter:]";
    v39 = 1026;
    LODWORD(v40) = outPropertyData;
    v26 = "%s _configureAudioConverter: encoded audio needs minimum of %{public}u bytes per output buffer";
  }
  _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0x12u);
LABEL_14:
  if (v8 == v8 % mFramesPerPacket)
    v27 = 1;
  else
    v27 = v8 / mFramesPerPacket * mFramesPerPacket;
  self->_convertPacketCount = v27 / self->_opusOutASBD.mFramesPerPacket + 1;
  v28 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[CSAudioConverter _configureAudioConverter:]";
    v39 = 1026;
    LODWORD(v40) = v27;
    _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_DEFAULT, "%s _configureAudioConverter: final framesPerBuffer: %{public}u", buf, 0x12u);
    v28 = *v9;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    convertPacketCount = self->_convertPacketCount;
    *(_DWORD *)buf = 136315394;
    v38 = "-[CSAudioConverter _configureAudioConverter:]";
    v39 = 1026;
    LODWORD(v40) = convertPacketCount;
    _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_DEFAULT, "%s _configureAudioConverter: _convertPacketCount: %{public}u", buf, 0x12u);
  }
  ioPropertyDataSize = 4;
  v30 = AudioConverterGetProperty(a3, 0x786F7073u, &ioPropertyDataSize, &v35);
  v31 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[CSAudioConverter _configureAudioConverter:]";
    v39 = 1026;
    LODWORD(v40) = v30;
    _os_log_impl(&dword_1C2614000, v31, OS_LOG_TYPE_DEFAULT, "%s _configureAudioConverter: AudioConverterGetProperty(MaximumOutputPacketSize): returned status %{public}d", buf, 0x12u);
  }
  if (!v30)
  {
    v32 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[CSAudioConverter _configureAudioConverter:]";
      v39 = 1026;
      LODWORD(v40) = v35;
      _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s createAudioConverter: outputSizePerPacket: %{public}u", buf, 0x12u);
      v32 = *v9;
    }
    if (outPropertyData <= v35 * self->_convertPacketCount)
      v33 = v35 * self->_convertPacketCount;
    else
      v33 = outPropertyData;
    self->_convertAudioCapacity = v33;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[CSAudioConverter _configureAudioConverter:]";
      v39 = 1026;
      LODWORD(v40) = v33;
      _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s _configureAudioConverter: _convertAudioCapacity %{public}u bytes", buf, 0x12u);
    }
  }
}

- (CSAudioConverterDelegate)delegate
{
  return (CSAudioConverterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bufferedLPCM, 0);
}

uint64_t __96__CSAudioConverter__convertBufferedLPCM_allowPartial_timestamp_arrivalTimestampToAudioRecorder___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8;
  unsigned int v9;
  NSObject *v10;
  unsigned int v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(*(id *)(a1 + 32), "length") - *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v9 = v8 >> 1;
  v10 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEBUG))
  {
    v17 = *a2;
    v20 = 136315650;
    v21 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]_block_invoke";
    v22 = 1026;
    v23 = v17;
    v24 = 1026;
    v25 = v8 >> 1;
    _os_log_debug_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEBUG, "%s Got asked for %{public}u packets, have %{public}u", (uint8_t *)&v20, 0x18u);
  }
  if (*(_DWORD *)a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("CSAudioConverter.m"), 127, CFSTR("Too many buffers"));

    if (!a4)
      goto LABEL_5;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("CSAudioConverter.m"), 128, CFSTR("Cannot produce ASPD for PCM"));

    goto LABEL_5;
  }
  if (a4)
    goto LABEL_14;
LABEL_5:
  *(_DWORD *)(a3 + 8) = 1;
  if (v8 >= 2 && ((v11 = *a2, *(_BYTE *)(a1 + 64)) || v9 >= v11))
  {
    if (v9 >= v11)
    {
      v16 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "mutableBytes");
      result = 0;
      *(_QWORD *)(a3 + 16) = v16 + *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      LODWORD(v16) = *a2;
      *(_DWORD *)(a3 + 12) = 2 * *a2;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(_DWORD *)(v14 + 24) + 2 * v16;
    }
    else
    {
      *a2 = v9;
      v13 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "mutableBytes");
      result = 0;
      *(_QWORD *)(a3 + 16) = v13 + *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)(a3 + 12) = v8 & 0xFFFFFFFE;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(_DWORD *)(v14 + 24) + (v8 & 0xFFFFFFFE);
    }
    *(_DWORD *)(v14 + 24) = v15;
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

+ (id)opusConverter
{
  CSAudioConverter *v2;
  uint64_t v4;
  _BYTE v5[40];

  v2 = [CSAudioConverter alloc];
  objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16ASBD");
  objc_msgSend(MEMORY[0x1E0D190F8], "opusASBD");
  return -[CSAudioConverter initWithInASBD:outASBD:](v2, "initWithInASBD:outASBD:", v5, &v4);
}

+ (id)narrowBandOpusConverter
{
  CSAudioConverter *v2;
  uint64_t v4;
  _BYTE v5[40];

  v2 = [CSAudioConverter alloc];
  objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16NarrowBandASBD");
  objc_msgSend(MEMORY[0x1E0D190F8], "opusNarrowBandASBD");
  return -[CSAudioConverter initWithInASBD:outASBD:](v2, "initWithInASBD:outASBD:", v5, &v4);
}

+ (id)speexConverter
{
  CSAudioConverter *v2;
  uint64_t v4;
  _BYTE v5[40];

  v2 = [CSAudioConverter alloc];
  objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16ASBD");
  objc_msgSend(MEMORY[0x1E0D190F8], "speexASBD");
  return -[CSAudioConverter initWithInASBD:outASBD:](v2, "initWithInASBD:outASBD:", v5, &v4);
}

@end
