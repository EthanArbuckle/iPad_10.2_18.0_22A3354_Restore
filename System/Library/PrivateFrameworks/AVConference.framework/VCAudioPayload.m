@implementation VCAudioPayload

- (BOOL)isDTXEmptyPacket:(unsigned int)a3
{
  return ((VCPayloadUtils_supportsInternalDTXForPayload(-[VCAudioPayloadConfig payload](self->_config, "payload")) & 1) != 0
       || -[VCAudioPayloadConfig payload](self->_config, "payload") == 13)
      && -[VCAudioPayloadConfig internalBundleFactor](self->_config, "internalBundleFactor") + 1 >= a3;
}

- (VCAudioPayload)initWithConfig:(id)a3
{
  VCAudioPayload *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)VCAudioPayload;
    v5 = -[VCAudioPayload init](&v7, sel_init);
    if (v5)
    {
      v5->_config = (VCAudioPayloadConfig *)a3;
      v5->_bitrate = objc_msgSend(a3, "bitrate");
      v5->_bandwidth = VCPayloadUtils_DefaultAudioCodecBandwidthCodecForSampleRate(objc_msgSend(a3, "codecSampleRate"));
      v5->_ramStadSRCEnabled = 0;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioPayload initWithConfig:].cold.1();
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  SoundDec_Destroy((uint64_t)self->_encoder);

  v3.receiver = self;
  v3.super_class = (Class)VCAudioPayload;
  -[VCAudioPayload dealloc](&v3, sel_dealloc);
}

- (BOOL)createEncoderWithInputFormat:(const tagVCAudioFrameFormat *)a3
{
  uint64_t *p_encoder;
  __int128 v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  double v11;
  float v12;
  __int128 v13;
  SoundDec_t *encoder;
  unsigned int bitrate;
  int v16;
  unsigned int v17;
  uint64_t bandwidth;
  int v19[2];
  _OWORD v20[2];
  _BYTE v21[48];
  unint64_t v22;
  _BYTE v23[40];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_encoder = (uint64_t *)&self->_encoder;
  if (self->_encoder)
    return 1;
  *(_QWORD *)v23 = -1;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v23[8] = v7;
  *(_OWORD *)&v23[24] = v7;
  v8 = -[VCAudioPayloadConfig payload](self->_config, "payload");
  LODWORD(v9) = a3->samplesPerFrame;
  v10 = +[VCPayloadUtils codecSamplesPerFrameForPayload:blockSize:sampleRate:](VCPayloadUtils, "codecSamplesPerFrameForPayload:blockSize:sampleRate:", v8, a3->format.mSampleRate, (double)v9 / a3->format.mSampleRate);
  +[VCPayloadUtils blockSizeForPayload:sampleRate:](VCPayloadUtils, "blockSizeForPayload:sampleRate:", -[VCAudioPayloadConfig payload](self->_config, "payload"), -[VCAudioPayloadConfig codecSampleRate](self->_config, "codecSampleRate"));
  v12 = v11;
  SoundDec_FormatASBD(-[VCAudioPayloadConfig format](self->_config, "format"), (uint64_t)v23, v10, a3->format.mChannelsPerFrame, -[VCAudioPayloadConfig flags](self->_config, "flags"), v12);
  *(_OWORD *)v21 = xmmword_1D910FD68;
  memset(&v21[16], 170, 32);
  v13 = *(_OWORD *)&a3->format.mBytesPerPacket;
  v20[0] = *(_OWORD *)&a3->format.mSampleRate;
  v20[1] = v13;
  *(_OWORD *)&v21[8] = *(_OWORD *)v23;
  *(_QWORD *)v21 = *(_QWORD *)&a3->format.mBitsPerChannel;
  *(_OWORD *)&v21[24] = *(_OWORD *)&v23[16];
  *(_QWORD *)&v21[40] = *(_QWORD *)&v23[32];
  v22 = 0xAAAAAAAAAAAAAA00;
  BYTE1(v22) = self->_ramStadSRCEnabled;
  if ((SoundDec_Create(p_encoder, (uint64_t)v20) & 0x80000000) == 0)
  {
    SoundDec_SetEnablePacketSizeLimitForVBR((uint64_t)self->_encoder, +[VCPayloadUtils shouldEnablePacketSizeLimitForAudioFormat:](VCPayloadUtils, "shouldEnablePacketSizeLimitForAudioFormat:", v20));
    if (+[VCPayloadUtils canSetBitrateForPayload:](VCPayloadUtils, "canSetBitrateForPayload:", -[VCAudioPayloadConfig payload](self->_config, "payload")))
    {
      if (+[VCPayloadUtils isEVSPayload:](VCPayloadUtils, "isEVSPayload:", -[VCAudioPayloadConfig payload](self->_config, "payload")))
      {
        encoder = self->_encoder;
        bitrate = self->_bitrate;
        v16 = 0;
      }
      else
      {
        if (!+[VCPayloadUtils isOpus4Channel48KhzPayload:outFormat:](VCPayloadUtils, "isOpus4Channel48KhzPayload:outFormat:", -[VCAudioPayloadConfig payload](self->_config, "payload"), v23)&& !+[VCPayloadUtils isFormatAACELDNonSBR48KHzStereo:](VCPayloadUtils, "isFormatAACELDNonSBR48KHzStereo:", v23))
        {
          SoundDec_SetBitrate((uint64_t)self->_encoder, self->_bitrate);
          goto LABEL_15;
        }
        encoder = self->_encoder;
        bitrate = self->_bitrate;
        v16 = 1;
      }
      SoundDec_SetCodecInitialBitrate((uint64_t)encoder, bitrate, v16);
    }
LABEL_15:
    SoundDec_SetDTX((uint64_t)self->_encoder, -[VCAudioPayloadConfig isDTXEnabled](self->_config, "isDTXEnabled"));
    SoundDec_EnableShortRED((uint64_t)self->_encoder, self->_shortREDEnabled, self->_shortREDBytesPerFrame, self->_shortREDBitrate);
    if (+[VCPayloadUtils isEVSPayload:](VCPayloadUtils, "isEVSPayload:", -[VCAudioPayloadConfig payload](self->_config, "payload")))
    {
      SoundDec_SetEVSSIDPeriod((uint64_t)self->_encoder, -[VCAudioPayloadConfig evsSIDPeriod](self->_config, "evsSIDPeriod"));
      SoundDec_SetEVSCodecCMRMode((uint64_t)self->_encoder, -[VCAudioPayloadConfig evsCMRMode](self->_config, "evsCMRMode"));
      v17 = -[VCAudioPayloadConfig evsChannelAwareOffset](self->_config, "evsChannelAwareOffset");
      if (v17 <= 7 && ((1 << v17) & 0xAC) != 0)
      {
        v19[0] = -[VCAudioPayloadConfig evsChannelAwareOffset](self->_config, "evsChannelAwareOffset");
        v19[1] = -[VCAudioPayloadConfig evsChannelAwareIndicator](self->_config, "evsChannelAwareIndicator");
        SoundDec_SetEVSChannelAwareOffset((uint64_t)self->_encoder, v19);
      }
      SoundDec_SetEVSFormatHandling((uint64_t)self->_encoder, -[VCAudioPayloadConfig evsHeaderFullOnly](self->_config, "evsHeaderFullOnly"));
      bandwidth = self->_bandwidth;
      if (-[NSArray count](-[VCAudioPayloadConfig supportedBandwidths](self->_config, "supportedBandwidths"), "count"))
        bandwidth = objc_msgSend((id)-[NSArray valueForKeyPath:](-[VCAudioPayloadConfig supportedBandwidths](self->_config, "supportedBandwidths"), "valueForKeyPath:", CFSTR("@max.self")), "intValue");
      if ((SoundDec_SetEVSAudioCodecBandwidth(*p_encoder, +[VCPayloadUtils audioCodecBandwidthForVCAudioCodecBandwidth:](VCPayloadUtils, "audioCodecBandwidthForVCAudioCodecBandwidth:", bandwidth)) & 0x80000000) == 0)self->_bandwidth = bandwidth;
    }
    SoundDec_SetAMRPayloadFormat((uint64_t)self->_encoder, -[VCAudioPayloadConfig payloadOctetAligned](self->_config, "payloadOctetAligned"));
    if (-[VCAudioPayloadConfig isOpusInBandFecEnabled](self->_config, "isOpusInBandFecEnabled"))
    {
      SoundDec_SetOpusInBandFecEnabled((uint64_t)self->_encoder, -[VCAudioPayloadConfig isOpusInBandFecEnabled](self->_config, "isOpusInBandFecEnabled"));
      SoundDec_SetPacketLossPercentage((uint64_t)self->_encoder, 5);
    }
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioPayload createEncoderWithInputFormat:].cold.1();
  }
  return 0;
}

- (int)encodeAudio:(opaqueVCAudioBufferList *)a3 numInputSamples:(int)a4 outputBytes:(void *)a5 numOutputBytes:(int)a6 shortREDBytes:(unsigned int *)a7
{
  uint64_t AudioBufferList;
  int v13;
  BOOL v14;
  uint64_t mDataByteSize;
  _BOOL4 v16;
  int IsShortREDEnabled;
  int ShortREDBytesPerFrame;
  int result;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  _BOOL4 v30;
  _BOOL4 shouldReset;
  size_t v32;
  AudioStreamPacketDescription v33;
  int v34;
  uint8_t v35[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  int v48;
  __int16 v49;
  UInt32 v50;
  __int16 v51;
  uint8_t *v52;
  uint8_t buf[48];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v34 = a6;
  v33.mStartOffset = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v33.mVariableFramesInPacket = 2863311530;
  AudioBufferList = VCAudioBufferList_GetAudioBufferList((uint64_t)a3);
  SoundDec_Encode((uint64_t)self->_encoder, AudioBufferList, a4, a5, a6, (UInt32 *)&v34, &v33, self->_shouldReset);
  if (v13 < 0)
  {
    v20 = v13;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v54 = 0u;
    memset(buf, 0, sizeof(buf));
    v21 = -[VCAudioPayloadConfig payload](self->_config, "payload", 256, v33.mStartOffset, *(_QWORD *)&v33.mVariableFramesInPacket);
    if (v21 == 99)
      v22 = 8;
    else
      v22 = 7;
    VCAudioPayloadConfig_GetDescription((size_t)self->_config, (char *)buf, &v32);
    if (v22 > (int)VRTraceGetErrorLogLevelForModule())
      return 0;
    v23 = VRTraceErrorLogLevelToCSTR();
    if (v21 == 99)
    {
      v24 = *MEMORY[0x1E0CF2758];
      v25 = *MEMORY[0x1E0CF2758];
      if (!*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          shouldReset = self->_shouldReset;
          *(_DWORD *)v35 = 136317186;
          v36 = v23;
          v37 = 2080;
          v38 = "-[VCAudioPayload encodeAudio:numInputSamples:outputBytes:numOutputBytes:shortREDBytes:]";
          v39 = 1024;
          v40 = 152;
          v41 = 2080;
          v42 = "-[VCAudioPayload encodeAudio:numInputSamples:outputBytes:numOutputBytes:shortREDBytes:]";
          v43 = 1024;
          v44 = v20;
          v45 = 1024;
          v46 = shouldReset;
          v47 = 1024;
          v48 = a4;
          v49 = 1024;
          v50 = v34;
          v51 = 2080;
          v52 = buf;
          _os_log_debug_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %s: SoundDec_Encode failed result=%x. reset=%d inSamples=%d outBytes=%d payloadDescription=%s", v35, 0x48u);
        }
        return 0;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
    }
    else
    {
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:
        v30 = self->_shouldReset;
        *(_DWORD *)v35 = 136317186;
        v36 = v23;
        v37 = 2080;
        v38 = "-[VCAudioPayload encodeAudio:numInputSamples:outputBytes:numOutputBytes:shortREDBytes:]";
        v39 = 1024;
        v40 = 152;
        v41 = 2080;
        v42 = "-[VCAudioPayload encodeAudio:numInputSamples:outputBytes:numOutputBytes:shortREDBytes:]";
        v43 = 1024;
        v44 = v20;
        v45 = 1024;
        v46 = v30;
        v47 = 1024;
        v48 = a4;
        v49 = 1024;
        v50 = v34;
        v51 = 2080;
        v52 = buf;
        _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: SoundDec_Encode failed result=%x. reset=%d inSamples=%d outBytes=%d payloadDescription=%s", v35, 0x48u);
      }
    }
    return 0;
  }
  self->_shouldReset = 0;
  if (v33.mDataByteSize)
    v14 = v34 == 0;
  else
    v14 = 1;
  if (v14)
    mDataByteSize = v34;
  else
    mDataByteSize = v33.mDataByteSize;
  v16 = -[VCAudioPayload isDTXEmptyPacket:](self, "isDTXEmptyPacket:", mDataByteSize);
  v35[0] = 0;
  IsShortREDEnabled = SoundDec_IsShortREDEnabled((uint64_t)self->_encoder, v35);
  if (v16 || IsShortREDEnabled < 0 || !v35[0])
    goto LABEL_13;
  ShortREDBytesPerFrame = SoundDec_GetShortREDBytesPerFrame((uint64_t)self->_encoder, a7);
  if (ShortREDBytesPerFrame < 0)
  {
    v26 = ShortREDBytesPerFrame;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      v29 = -[VCAudioPayloadConfig payload](self->_config, "payload");
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioPayload encodeAudio:numInputSamples:outputBytes:numOutputBytes:shortREDBytes:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 176;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v29;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v26;
      *(_WORD *)&buf[40] = 1024;
      *(_DWORD *)&buf[42] = mDataByteSize;
      _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, " [%s] %s:%d Short RED is enabled for payload=%d, but SoundDec_GetShortREDBytesPerFrame returned result=%x and bytesActuallyEncoded=%d", buf, 0x2Eu);
    }
    return 0;
  }
  LODWORD(mDataByteSize) = mDataByteSize - *a7;
LABEL_13:
  if (v16)
    return 0;
  else
    return mDataByteSize;
}

- (void)resetEncoder
{
  self->_shouldReset = 1;
}

- (void)resetEncoderWithSampleBuffer:(char *)a3 numBytes:(int)a4
{
  if (-[VCAudioPayloadConfig payload](self->_config, "payload") == 13)
  {
    SoundDec_Reset((uint64_t)self->_encoder);
    SoundDec_SetDTXPrimerSamples((uint64_t)self->_encoder, a3, a4);
  }
  else if ((VCPayloadUtils_supportsInternalDTXForPayload(-[VCAudioPayloadConfig payload](self->_config, "payload")) & 1) == 0)
  {
    self->_shouldReset = 1;
  }
}

- (BOOL)setBitrate:(unsigned int)a3
{
  _BOOL4 v5;
  signed int v6;
  SoundDec_t *encoder;

  v5 = +[VCPayloadUtils canSetBitrateForPayload:](VCPayloadUtils, "canSetBitrateForPayload:", -[VCAudioPayloadConfig payload](self->_config, "payload"));
  if (v5)
  {
    if (-[VCAudioPayloadConfig forcingBitrate](self->_config, "forcingBitrate"))
      goto LABEL_8;
    v6 = -[VCDefaults forceAudioBitrate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioBitrate");
    if (v6 > 0)
      a3 = v6;
    encoder = self->_encoder;
    if (encoder && (SoundDec_SetBitrate((uint64_t)encoder, a3) & 0x80000000) != 0)
    {
LABEL_8:
      LOBYTE(v5) = 0;
    }
    else
    {
      self->_bitrate = a3;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)setEVSRFParams:(EVSRFParams *)a3
{
  SoundDec_t *encoder;

  encoder = self->_encoder;
  return encoder && (SoundDec_SetEVSChannelAwareOffset((uint64_t)encoder, (int *)a3) & 0x80000000) == 0;
}

- (BOOL)setBandwidth:(int)a3
{
  uint64_t v3;
  int64_t v5;
  int v6;
  _BOOL4 v7;

  v3 = *(_QWORD *)&a3;
  v5 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", -[VCAudioPayloadConfig payload](self->_config, "payload"));
  v6 = +[VCPayloadUtils audioCodecBandwidthForVCAudioCodecBandwidth:](VCPayloadUtils, "audioCodecBandwidthForVCAudioCodecBandwidth:", v3);
  v7 = +[VCPayloadUtils supportsCodecBandwidthUpdateForCodecType:](VCPayloadUtils, "supportsCodecBandwidthUpdateForCodecType:", v5);
  if (v7)
  {
    if (self->_bandwidth == (_DWORD)v3)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      self->_bandwidth = v3;
      LOBYTE(v7) = (int)SoundDec_SetEVSAudioCodecBandwidthUpdate((uint64_t)self->_encoder, v6) >= 0;
    }
  }
  return v7;
}

- (BOOL)setCodecModeRequest:(_VCAudioCodecModeChangeEvent *)a3
{
  int payload;
  int64_t v6;
  int64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  payload = a3->payload;
  if (payload != -[VCAudioPayloadConfig payload](self->_config, "payload"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      v11 = a3->payload;
      v12 = -[VCAudioPayloadConfig payload](self->_config, "payload");
      v14 = 136316162;
      v15 = v9;
      v16 = 2080;
      v17 = "-[VCAudioPayload setCodecModeRequest:]";
      v18 = 1024;
      v19 = 237;
      v20 = 1024;
      v21 = v11;
      v22 = 1024;
      v23 = v12;
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Payload=%d on codec mode change event does not match configuration with payload=%d", (uint8_t *)&v14, 0x28u);
    }
LABEL_8:
    LOBYTE(v8) = 0;
    return v8;
  }
  v6 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", -[VCAudioPayloadConfig payload](self->_config, "payload"));
  if (a3->codecRateMode == -1)
    goto LABEL_8;
  v7 = v6;
  v8 = +[VCPayloadUtils supportsCodecRateModesForCodecType:](VCPayloadUtils, "supportsCodecRateModesForCodecType:", v6);
  if (v8)
    LOBYTE(v8) = (int)SoundDec_SetCMR((uint64_t)self->_encoder, +[VCPayloadUtils bitrateForCodecType:mode:](VCPayloadUtils, "bitrateForCodecType:mode:", v7, a3->codecRateMode), +[VCPayloadUtils audioCodecBandwidthForVCAudioCodecBandwidth:](VCPayloadUtils, "audioCodecBandwidthForVCAudioCodecBandwidth:", a3->codecBandwidth)) >= 0;
  return v8;
}

- (void)setCurrentDTXEnable:(BOOL)a3
{
  SoundDec_t *encoder;
  int v4;

  encoder = self->_encoder;
  v4 = a3 && -[VCAudioPayloadConfig isDTXEnabled](self->_config, "isDTXEnabled");
  SoundDec_SetDTX((uint64_t)encoder, v4);
}

- (BOOL)getMagicCookie:(char *)a3 withLength:(unsigned int *)a4
{
  return (int)SoundDec_GetMagicCookie((uint64_t)self->_encoder, a3, a4) >= 0;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCAudioPayload;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ %@ config=%@ currentBitrate=%u }"), -[VCAudioPayload description](&v3, sel_description), self->_config, self->_bitrate);
}

- (void)setRamStadSRCEnabled:(BOOL)a3
{
  self->_ramStadSRCEnabled = a3;
}

- (void)setShortREDEnabled:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  unsigned int shortREDBitrate;
  double v7;
  unsigned int v8;
  SoundDec_t *encoder;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  -[VCAudioPayloadConfig payload](self->_config, "payload");
  if (VCPayloadUtils_SupportsShortREDForPayload())
  {
    v5 = VCPayloadUtils_ShortREDBitrateForPayload(-[VCAudioPayloadConfig payload](self->_config, "payload"), v3);
    self->_shortREDBitrate = v5;
    if (v3)
    {
      +[VCPayloadUtils blockSizeForPayload:sampleRate:](VCPayloadUtils, "blockSizeForPayload:sampleRate:", -[VCAudioPayloadConfig payload](self->_config, "payload"), -[VCAudioPayloadConfig codecSampleRate](self->_config, "codecSampleRate"));
      shortREDBitrate = self->_shortREDBitrate;
      *(float *)&v7 = v7;
      v8 = (float)((float)(*(float *)&v7 * (float)shortREDBitrate) * 0.125);
    }
    else
    {
      shortREDBitrate = v5;
      v8 = 0;
    }
    encoder = self->_encoder;
    if (encoder && (v10 = SoundDec_EnableShortRED((uint64_t)encoder, v3, v8, shortREDBitrate), v10 < 0))
    {
      v11 = v10;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v14 = -[VCAudioPayloadConfig payload](self->_config, "payload");
          v15 = 136316162;
          v16 = v12;
          v17 = 2080;
          v18 = "-[VCAudioPayload setShortREDEnabled:]";
          v19 = 1024;
          v20 = 287;
          v21 = 1024;
          v22 = v14;
          v23 = 1024;
          v24 = v11;
          _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to enable short RED for payload=%d. result=%x", (uint8_t *)&v15, 0x28u);
        }
      }
    }
    else
    {
      self->_shortREDBytesPerFrame = v8;
      self->_shortREDEnabled = v3;
    }
  }
}

- (BOOL)isSIDFrame:(const char *)a3 encodedBytes:(int)a4
{
  VCAudioPayload *v4;
  __int128 v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  const char *outPropertyData;
  __int128 v22;
  __int128 v23;
  _OWORD v24[18];
  unint64_t v25;
  uint64_t v26;

  v4 = self;
  LOBYTE(self) = 0;
  v26 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    if (-[VCAudioPayloadConfig payload](v4->_config, "payload") == 97
      || -[VCAudioPayloadConfig payload](v4->_config, "payload") == 98)
    {
      LOBYTE(self) = a4 < 9;
      return (char)self;
    }
    *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24[16] = v7;
    v24[17] = v7;
    v24[14] = v7;
    v24[15] = v7;
    v25 = 0xAAAAAAAAAAAAAAAALL;
    v24[13] = v7;
    v24[12] = v7;
    v24[11] = v7;
    v24[10] = v7;
    v24[9] = v7;
    v24[8] = v7;
    v24[7] = v7;
    v24[6] = v7;
    v24[5] = v7;
    v24[4] = v7;
    v24[3] = v7;
    v24[2] = v7;
    v24[0] = v7;
    v24[1] = v7;
    v22 = v7;
    v23 = v7;
    outPropertyData = a3;
    LODWORD(v22) = a4;
    if ((SoundDec_GetSpeechCodecBundleData((uint64_t)v4->_encoder, (uint64_t *)&outPropertyData) & 0x80000000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        LODWORD(self) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!(_DWORD)self)
          return (char)self;
        -[VCAudioPayload isSIDFrame:encodedBytes:].cold.1();
      }
    }
    else
    {
      if (DWORD2(v23))
      {
        LOBYTE(self) = *((_BYTE *)v24 + 20 * (DWORD2(v23) - 1)) & 1;
        return (char)self;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        LODWORD(self) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!(_DWORD)self)
          return (char)self;
        v11 = 136316162;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCAudioPayload isSIDFrame:encodedBytes:]";
        v15 = 1024;
        v16 = 313;
        v17 = 2048;
        v18 = a3;
        v19 = 1024;
        v20 = a4;
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d No packets in the bundle data encodedOutput=%p encodedBytes=%u", (uint8_t *)&v11, 0x2Cu);
      }
    }
    LOBYTE(self) = 0;
  }
  return (char)self;
}

- (VCAudioPayloadConfig)config
{
  return self->_config;
}

- (unsigned)bitrate
{
  return self->_bitrate;
}

- (int)bandwidth
{
  return self->_bandwidth;
}

- (BOOL)shortREDEnabled
{
  return self->_shortREDEnabled;
}

- (unsigned)shortREDBitrate
{
  return self->_shortREDBitrate;
}

- (void)initWithConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Configuration is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createEncoderWithInputFormat:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d SoundDec_Create failed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isSIDFrame:encodedBytes:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCAudioPayload isSIDFrame:encodedBytes:]";
  v6 = 1024;
  v7 = 316;
  v8 = 1024;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d unable to read bundle data hResult=%d", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

@end
