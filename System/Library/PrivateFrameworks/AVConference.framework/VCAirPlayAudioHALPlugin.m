@implementation VCAirPlayAudioHALPlugin

+ (__CFDictionary)createConduitCreationOptionsWithDeviceInfo:(id)a3 inOptions:(__CFDictionary *)a4
{
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *Mutable;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  const void *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  const __CFString *v28;
  const __CFString *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  _BYTE v34[24];
  __int128 v35;
  id v36;
  _BYTE v37[32];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if (a3)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (Mutable)
        goto LABEL_7;
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:].cold.1();
        }
        return 0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v29 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v29 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v33 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v34 = 136316162;
          *(_QWORD *)&v34[4] = v33;
          *(_WORD *)&v34[12] = 2080;
          *(_QWORD *)&v34[14] = "+[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]";
          *(_WORD *)&v34[22] = 1024;
          LODWORD(v35) = 59;
          WORD2(v35) = 2112;
          *(_QWORD *)((char *)&v35 + 6) = v29;
          HIWORD(v35) = 2048;
          v36 = a1;
          v32 = " [%s] %s:%d %@(%p) Could not create mutable dictionary";
          goto LABEL_58;
        }
      }
    }
    else
    {
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          return 0;
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return 0;
        *(_DWORD *)v34 = 136315650;
        *(_QWORD *)&v34[4] = v20;
        *(_WORD *)&v34[12] = 2080;
        *(_QWORD *)&v34[14] = "+[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]";
        *(_WORD *)&v34[22] = 1024;
        LODWORD(v35) = 61;
        v22 = " [%s] %s:%d No options to configure";
        v23 = v21;
        v24 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v19 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
        else
          v19 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          return 0;
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return 0;
        *(_DWORD *)v34 = 136316162;
        *(_QWORD *)&v34[4] = v25;
        *(_WORD *)&v34[12] = 2080;
        *(_QWORD *)&v34[14] = "+[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]";
        *(_WORD *)&v34[22] = 1024;
        LODWORD(v35) = 61;
        WORD2(v35) = 2112;
        *(_QWORD *)((char *)&v35 + 6) = v19;
        HIWORD(v35) = 2048;
        v36 = a1;
        v22 = " [%s] %s:%d %@(%p) No options to configure";
        v23 = v26;
        v24 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, v34, v24);
    }
    return 0;
  }
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, a4);
  if (!MutableCopy)
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:].cold.2();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v28 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v34 = 136316162;
        *(_QWORD *)&v34[4] = v30;
        *(_WORD *)&v34[12] = 2080;
        *(_QWORD *)&v34[14] = "+[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]";
        *(_WORD *)&v34[22] = 1024;
        LODWORD(v35) = 56;
        WORD2(v35) = 2112;
        *(_QWORD *)((char *)&v35 + 6) = v28;
        HIWORD(v35) = 2048;
        v36 = a1;
        v32 = " [%s] %s:%d %@(%p) Could not create mutable dictionary copy";
LABEL_58:
        _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, v32, v34, 0x30u);
        return 0;
      }
    }
    return 0;
  }
  Mutable = MutableCopy;
  if (!a3)
    return Mutable;
LABEL_7:
  if ((id)objc_opt_class() != a1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_18;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    *(_DWORD *)v34 = 136317186;
    *(_QWORD *)&v34[4] = v14;
    *(_WORD *)&v34[12] = 2080;
    *(_QWORD *)&v34[14] = "+[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]";
    *(_WORD *)&v34[22] = 1024;
    LODWORD(v35) = 64;
    WORD2(v35) = 2112;
    *(_QWORD *)((char *)&v35 + 6) = v8;
    HIWORD(v35) = 2048;
    v36 = a1;
    *(_WORD *)v37 = 2048;
    *(_QWORD *)&v37[2] = a3;
    *(_WORD *)&v37[10] = 2112;
    *(_QWORD *)&v37[12] = objc_msgSend(a3, "deviceName");
    *(_WORD *)&v37[20] = 2112;
    *(_QWORD *)&v37[22] = objc_msgSend(a3, "deviceUID");
    *(_WORD *)&v37[30] = 2112;
    v38 = objc_msgSend(a3, "modelUID");
    v11 = " [%s] %s:%d %@(%p) remoteDeviceInfo=%p deviceName=%@ deviceUID=%@ modelUID=%@";
    v12 = v15;
    v13 = 88;
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 136316674;
      *(_QWORD *)&v34[4] = v9;
      *(_WORD *)&v34[12] = 2080;
      *(_QWORD *)&v34[14] = "+[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]";
      *(_WORD *)&v34[22] = 1024;
      LODWORD(v35) = 64;
      WORD2(v35) = 2048;
      *(_QWORD *)((char *)&v35 + 6) = a3;
      HIWORD(v35) = 2112;
      v36 = (id)objc_msgSend(a3, "deviceName");
      *(_WORD *)v37 = 2112;
      *(_QWORD *)&v37[2] = objc_msgSend(a3, "deviceUID");
      *(_WORD *)&v37[10] = 2112;
      *(_QWORD *)&v37[12] = objc_msgSend(a3, "modelUID");
      v11 = " [%s] %s:%d remoteDeviceInfo=%p deviceName=%@ deviceUID=%@ modelUID=%@";
      v12 = v10;
      v13 = 68;
LABEL_17:
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v34, v13);
    }
  }
LABEL_18:
  v16 = objc_msgSend(a3, "deviceName", *(_OWORD *)v34, *(_QWORD *)&v34[16], v35, v36, *(_OWORD *)v37, *(_OWORD *)&v37[16], v38, v39);
  v17 = (const void *)*MEMORY[0x1E0CA4AF8];
  if (v16)
    v18 = (const __CFString *)objc_msgSend(a3, "deviceName");
  else
    v18 = CFSTR("Airplay Audio HAL Device");
  CFDictionarySetValue(Mutable, v17, v18);
  if (objc_msgSend(a3, "deviceUID"))
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA4B00], (const void *)objc_msgSend(a3, "deviceUID"));
  if (objc_msgSend(a3, "modelUID"))
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA4B08], (const void *)objc_msgSend(a3, "modelUID"));
  return Mutable;
}

+ (tagVCAudioHALPluginConfiguration)convertASBDToInterleavedFormat:(SEL)a3
{
  __int128 v6;
  __int128 v7;
  AudioFormatFlags mFormatFlags;
  UInt32 mChannelsPerFrame;
  UInt32 v10;
  const __CFString *v11;
  tagVCAudioHALPluginConfiguration *result;
  uint64_t v13;
  NSObject *v14;
  float mSampleRate;
  AudioFormatID mFormatID;
  UInt32 mBytesPerPacket;
  UInt32 mFramesPerPacket;
  UInt32 mBytesPerFrame;
  UInt32 mBitsPerChannel;
  UInt32 mReserved;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  float v27;
  AudioFormatID v28;
  UInt32 v29;
  UInt32 v30;
  UInt32 v31;
  UInt32 v32;
  UInt32 v33;
  const __CFString *v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  double v44;
  __int16 v45;
  _BYTE v46[10];
  double v47;
  _BYTE v48[6];
  _BYTE v49[6];
  _BYTE v50[6];
  _BYTE v51[6];
  _BYTE v52[6];
  __int16 v53;
  UInt32 v54;
  __int16 v55;
  UInt32 v56;
  __int16 v57;
  UInt32 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  retstr->remoteDeviceInfo = 0;
  *(_OWORD *)&retstr->sinkFormat.format.mBitsPerChannel = 0u;
  *(_OWORD *)&retstr->sinkContext = 0u;
  *(_OWORD *)&retstr->sinkFormat.format.mSampleRate = 0u;
  *(_OWORD *)&retstr->sinkFormat.format.mBytesPerPacket = 0u;
  if (a4)
  {
    v6 = *(_OWORD *)&a4->sinkFormat.format.mBytesPerPacket;
    *(_OWORD *)&retstr->sinkFormat.format.mSampleRate = *(_OWORD *)&a4->sinkFormat.format.mSampleRate;
    *(_OWORD *)&retstr->sinkFormat.format.mBytesPerPacket = v6;
    v7 = *(_OWORD *)&a4->sinkContext;
    *(_OWORD *)&retstr->sinkFormat.format.mBitsPerChannel = *(_OWORD *)&a4->sinkFormat.format.mBitsPerChannel;
    *(_OWORD *)&retstr->sinkContext = v7;
    retstr->remoteDeviceInfo = a4->remoteDeviceInfo;
    mFormatFlags = retstr->sinkFormat.format.mFormatFlags;
    mChannelsPerFrame = retstr->sinkFormat.format.mChannelsPerFrame;
    if ((mFormatFlags & 0x20) != 0 && mChannelsPerFrame == 2)
    {
      mFormatFlags &= ~0x20u;
      v10 = 2 * retstr->sinkFormat.format.mBytesPerPacket;
      retstr->sinkFormat.format.mFormatFlags = mFormatFlags;
      retstr->sinkFormat.format.mBytesPerPacket = v10;
      retstr->sinkFormat.format.mBytesPerFrame *= 2;
    }
    if ((id)objc_opt_class() == a2)
    {
      result = (tagVCAudioHALPluginConfiguration *)VRTraceGetErrorLogLevelForModule();
      if ((int)result >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        result = (tagVCAudioHALPluginConfiguration *)os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)result)
        {
          mSampleRate = retstr->sinkFormat.format.mSampleRate;
          mFormatID = retstr->sinkFormat.format.mFormatID;
          mBytesPerPacket = retstr->sinkFormat.format.mBytesPerPacket;
          mFramesPerPacket = retstr->sinkFormat.format.mFramesPerPacket;
          mBytesPerFrame = retstr->sinkFormat.format.mBytesPerFrame;
          mBitsPerChannel = retstr->sinkFormat.format.mBitsPerChannel;
          mReserved = retstr->sinkFormat.format.mReserved;
          v37 = 136317954;
          v38 = v13;
          v39 = 2080;
          v40 = "+[VCAirPlayAudioHALPlugin convertASBDToInterleavedFormat:]";
          v41 = 1024;
          v42 = 94;
          v43 = 2048;
          v44 = mSampleRate;
          v45 = 1024;
          *(_DWORD *)v46 = mFormatID;
          *(_WORD *)&v46[4] = 1024;
          *(_DWORD *)&v46[6] = mFormatFlags;
          LOWORD(v47) = 1024;
          *(_DWORD *)((char *)&v47 + 2) = mBytesPerPacket;
          HIWORD(v47) = 1024;
          *(_DWORD *)v48 = mFramesPerPacket;
          *(_WORD *)&v48[4] = 1024;
          *(_DWORD *)v49 = mBytesPerFrame;
          *(_WORD *)&v49[4] = 1024;
          *(_DWORD *)v50 = mChannelsPerFrame;
          *(_WORD *)&v50[4] = 1024;
          *(_DWORD *)v51 = mBitsPerChannel;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)v52 = mReserved;
          v22 = " [%s] %s:%d VCAirPlayAudioHALPlugin ASBD: mSampleRate=%.1f mFormatID=%d mFormatFlags=0x%x mBytesPerPacke"
                "t=%d mFramesPerPacket=%d mBytesPerFrame=%d mChannelsPerFrame=%d mBitsPerChannel=%d mReserved=0x%x";
          v23 = v14;
          v24 = 86;
LABEL_15:
          _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v37, v24);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)objc_msgSend(a2, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      result = (tagVCAudioHALPluginConfiguration *)VRTraceGetErrorLogLevelForModule();
      if ((int)result >= 7)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        result = (tagVCAudioHALPluginConfiguration *)os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)result)
        {
          v27 = retstr->sinkFormat.format.mSampleRate;
          v28 = retstr->sinkFormat.format.mFormatID;
          v29 = retstr->sinkFormat.format.mBytesPerPacket;
          v30 = retstr->sinkFormat.format.mFramesPerPacket;
          v31 = retstr->sinkFormat.format.mBytesPerFrame;
          v32 = retstr->sinkFormat.format.mBitsPerChannel;
          v33 = retstr->sinkFormat.format.mReserved;
          v37 = 136318466;
          v38 = v25;
          v39 = 2080;
          v40 = "+[VCAirPlayAudioHALPlugin convertASBDToInterleavedFormat:]";
          v41 = 1024;
          v42 = 94;
          v43 = 2112;
          v44 = *(double *)&v11;
          v45 = 2048;
          *(_QWORD *)v46 = a2;
          *(_WORD *)&v46[8] = 2048;
          v47 = v27;
          *(_WORD *)v48 = 1024;
          *(_DWORD *)&v48[2] = v28;
          *(_WORD *)v49 = 1024;
          *(_DWORD *)&v49[2] = mFormatFlags;
          *(_WORD *)v50 = 1024;
          *(_DWORD *)&v50[2] = v29;
          *(_WORD *)v51 = 1024;
          *(_DWORD *)&v51[2] = v30;
          *(_WORD *)v52 = 1024;
          *(_DWORD *)&v52[2] = v31;
          v53 = 1024;
          v54 = mChannelsPerFrame;
          v55 = 1024;
          v56 = v32;
          v57 = 1024;
          v58 = v33;
          v22 = " [%s] %s:%d %@(%p) VCAirPlayAudioHALPlugin ASBD: mSampleRate=%.1f mFormatID=%d mFormatFlags=0x%x mBytesP"
                "erPacket=%d mFramesPerPacket=%d mBytesPerFrame=%d mChannelsPerFrame=%d mBitsPerChannel=%d mReserved=0x%x";
          v23 = v26;
          v24 = 106;
          goto LABEL_15;
        }
      }
    }
  }
  else if ((id)objc_opt_class() == a2)
  {
    result = (tagVCAudioHALPluginConfiguration *)VRTraceGetErrorLogLevelForModule();
    if ((int)result >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = (tagVCAudioHALPluginConfiguration *)os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
        +[VCAirPlayAudioHALPlugin convertASBDToInterleavedFormat:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v34 = (const __CFString *)objc_msgSend(a2, "performSelector:", sel_logPrefix);
    else
      v34 = &stru_1E9E58EE0;
    result = (tagVCAudioHALPluginConfiguration *)VRTraceGetErrorLogLevelForModule();
    if ((int)result >= 3)
    {
      v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      result = (tagVCAudioHALPluginConfiguration *)os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        v37 = 136316162;
        v38 = v35;
        v39 = 2080;
        v40 = "+[VCAirPlayAudioHALPlugin convertASBDToInterleavedFormat:]";
        v41 = 1024;
        v42 = 84;
        v43 = 2112;
        v44 = *(double *)&v34;
        v45 = 2048;
        *(_QWORD *)v46 = a2;
        _os_log_error_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid config parameter", (uint8_t *)&v37, 0x30u);
      }
    }
  }
  return result;
}

- (VCAirPlayAudioHALPlugin)initWithConfig:(tagVCAudioHALPluginConfiguration *)a3
{
  return -[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:](self, "initWithConfig:loadBinary:conduitCreateOptions:", a3, 1, 0);
}

- (VCAirPlayAudioHALPlugin)initWithConfig:(tagVCAudioHALPluginConfiguration *)a3 loadBinary:(BOOL)a4 conduitCreateOptions:(__CFDictionary *)a5
{
  _BOOL4 v6;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  VCAudioHALPluginMockAudioInject *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  _BYTE buf[64];
  uint64_t v27;
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)VCAirPlayAudioHALPlugin;
  v8 = -[VCAirPlayAudioHALPlugin init](&v25, sel_init);
  if (v8)
  {
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAirPlayAudioHALPlugin-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 110;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = v8;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = v6;
        *(_WORD *)&buf[44] = 2112;
        *(_QWORD *)&buf[46] = a5;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAirPlayAudioHALPlugin-init (%p) loadBinary=%d conduitCreateOptions=%@", buf, 0x36u);
      }
    }
    if (a3)
    {
      pthread_mutex_init((pthread_mutex_t *)(v8 + 168), 0);
      *((_QWORD *)v8 + 12) = +[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:](VCAirPlayAudioHALPlugin, "createConduitCreationOptionsWithDeviceInfo:inOptions:", a3->remoteDeviceInfo, a5);
      if (v6
        && !+[VCAirPlayAudioHALPlugin sharedAudioServerPluginDriver](VCAirPlayAudioHALPlugin, "sharedAudioServerPluginDriver"))
      {
        if ((char *)objc_opt_class() == v8)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:].cold.2();
          }
          goto LABEL_42;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v19 = (const __CFString *)objc_msgSend(v8, "performSelector:", sel_logPrefix);
        else
          v19 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 117;
            *(_WORD *)&buf[28] = 2112;
            *(_QWORD *)&buf[30] = v19;
            *(_WORD *)&buf[38] = 2048;
            *(_QWORD *)&buf[40] = v8;
            v22 = " [%s] %s:%d %@(%p) Could not create plugin driver";
            goto LABEL_41;
          }
        }
      }
      else
      {
        v11 = -[VCAudioHALPluginMockAudioInject initWithConfig:]([VCAudioHALPluginMockAudioInject alloc], "initWithConfig:", a3);
        *((_QWORD *)v8 + 1) = v11;
        if (v11)
        {
          +[VCAirPlayAudioHALPlugin convertASBDToInterleavedFormat:](VCAirPlayAudioHALPlugin, "convertASBDToInterleavedFormat:", a3);
          v12 = v27;
          v13 = *(_OWORD *)&buf[48];
          *((_OWORD *)v8 + 3) = *(_OWORD *)&buf[32];
          *((_OWORD *)v8 + 4) = v13;
          *((_QWORD *)v8 + 10) = v12;
          v14 = *(_OWORD *)&buf[16];
          *((_OWORD *)v8 + 1) = *(_OWORD *)buf;
          *((_OWORD *)v8 + 2) = v14;
          v15 = *((_OWORD *)v8 + 2);
          *(_OWORD *)(v8 + 104) = *((_OWORD *)v8 + 1);
          *(_OWORD *)(v8 + 120) = v15;
          *((_QWORD *)v8 + 17) = *((_QWORD *)v8 + 6);
          *((_DWORD *)v8 + 36) = *((_DWORD *)v8 + 14);
          *(_QWORD *)(v8 + 148) = _VCAirPlayAudioHALPlugin_handleAudioFrame;
          *(_QWORD *)(v8 + 156) = v8 + 16;
          return (VCAirPlayAudioHALPlugin *)v8;
        }
        if ((char *)objc_opt_class() == v8)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:].cold.3();
          }
          goto LABEL_42;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v18 = (const __CFString *)objc_msgSend(v8, "performSelector:", sel_logPrefix);
        else
          v18 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v23 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 120;
            *(_WORD *)&buf[28] = 2112;
            *(_QWORD *)&buf[30] = v18;
            *(_WORD *)&buf[38] = 2048;
            *(_QWORD *)&buf[40] = v8;
            v22 = " [%s] %s:%d %@(%p) could not allocate mock audio inject";
            goto LABEL_41;
          }
        }
      }
    }
    else
    {
      if ((char *)objc_opt_class() == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:].cold.1();
        }
        goto LABEL_42;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)objc_msgSend(v8, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 111;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v17;
          *(_WORD *)&buf[38] = 2048;
          *(_QWORD *)&buf[40] = v8;
          v22 = " [%s] %s:%d %@(%p) invalid config parameter";
LABEL_41:
          _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x30u);
        }
      }
    }
LABEL_42:

    return 0;
  }
  return (VCAirPlayAudioHALPlugin *)v8;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  __CFDictionary *conduitCreateOptions;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  VCAirPlayAudioHALPlugin *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAirPlayAudioHALPlugin-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCAirPlayAudioHALPlugin dealloc]";
      v11 = 1024;
      v12 = 139;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAirPlayAudioHALPlugin-dealloc (%p)", buf, 0x26u);
    }
  }

  conduitCreateOptions = self->_conduitCreateOptions;
  if (conduitCreateOptions)
  {
    CFRelease(conduitCreateOptions);
    self->_conduitCreateOptions = 0;
  }
  pthread_mutex_destroy(&self->_stateLock);
  v6.receiver = self;
  v6.super_class = (Class)VCAirPlayAudioHALPlugin;
  -[VCAirPlayAudioHALPlugin dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  VCAirPlayAudioHALPlugin *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAirPlayAudioHALPlugin-invalidate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCAirPlayAudioHALPlugin invalidate]";
      v9 = 1024;
      v10 = 147;
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAirPlayAudioHALPlugin-invalidate (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (void)suspendAndReleaseConduitDeviceLocked
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAirPlayAudioHALPlugin suspendAndReleaseConduitDeviceLocked]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Suspend and invalidate conduit returned error=%i", v2, *(const char **)v3, (unint64_t)"-[VCAirPlayAudioHALPlugin suspendAndReleaseConduitDeviceLocked]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (BOOL)start
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  int v7;
  BOOL v8;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  VCAirPlayAudioHALPlugin *v35;
  __int16 v36;
  VCAirPlayAudioHALPlugin *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAirPlayAudioHALPlugin-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v28 = 136315906;
      v29 = v3;
      v30 = 2080;
      v31 = "-[VCAirPlayAudioHALPlugin start]";
      v32 = 1024;
      v33 = 164;
      v34 = 2048;
      v35 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAirPlayAudioHALPlugin-start (%p)", (uint8_t *)&v28, 0x26u);
    }
  }
  pthread_mutex_lock(&self->_stateLock);
  if (self->_resumed)
  {
    if ((VCAirPlayAudioHALPlugin *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAirPlayAudioHALPlugin start].cold.5();
      }
      goto LABEL_65;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCAirPlayAudioHALPlugin performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_65;
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_65;
    v28 = 136316162;
    v29 = v18;
    v30 = 2080;
    v31 = "-[VCAirPlayAudioHALPlugin start]";
    v32 = 1024;
    v33 = 169;
    v34 = 2112;
    v35 = (VCAirPlayAudioHALPlugin *)v10;
    v36 = 2048;
    v37 = self;
    v20 = " [%s] %s:%d %@(%p) Plugin already started";
    goto LABEL_47;
  }
  if (!self->_conduitDevice)
  {
    v5 = FigHALAudioConduitDeviceCreate();
    if (v5)
    {
      v16 = v5;
      if ((VCAirPlayAudioHALPlugin *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAirPlayAudioHALPlugin start].cold.4();
        }
        goto LABEL_65;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCAirPlayAudioHALPlugin performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v28 = 136316418;
          v29 = v27;
          v30 = 2080;
          v31 = "-[VCAirPlayAudioHALPlugin start]";
          v32 = 1024;
          v33 = 173;
          v34 = 2112;
          v35 = (VCAirPlayAudioHALPlugin *)v17;
          v36 = 2048;
          v37 = self;
          v38 = 1024;
          v39 = v16;
          v20 = " [%s] %s:%d %@(%p) Create conduit device returned error=%i";
          goto LABEL_63;
        }
      }
      goto LABEL_65;
    }
    if (!self->_conduitDevice)
    {
      if ((VCAirPlayAudioHALPlugin *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAirPlayAudioHALPlugin start].cold.1();
        }
        goto LABEL_65;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCAirPlayAudioHALPlugin performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_65;
      v21 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_65;
      v28 = 136316162;
      v29 = v21;
      v30 = 2080;
      v31 = "-[VCAirPlayAudioHALPlugin start]";
      v32 = 1024;
      v33 = 175;
      v34 = 2112;
      v35 = (VCAirPlayAudioHALPlugin *)v11;
      v36 = 2048;
      v37 = self;
      v20 = " [%s] %s:%d %@(%p) No conduit device";
LABEL_47:
      v22 = v19;
      v23 = 48;
LABEL_64:
      _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v28, v23);
      goto LABEL_65;
    }
  }
  v6 = FigHALAudioConduitDeviceSetClientReceiveAudioIODelegate();
  if (v6)
  {
    v12 = v6;
    if ((VCAirPlayAudioHALPlugin *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAirPlayAudioHALPlugin start].cold.3();
      }
      goto LABEL_65;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCAirPlayAudioHALPlugin performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v28 = 136316418;
        v29 = v24;
        v30 = 2080;
        v31 = "-[VCAirPlayAudioHALPlugin start]";
        v32 = 1024;
        v33 = 178;
        v34 = 2112;
        v35 = (VCAirPlayAudioHALPlugin *)v13;
        v36 = 2048;
        v37 = self;
        v38 = 1024;
        v39 = v12;
        v20 = " [%s] %s:%d %@(%p) Set audio delegate returned error=%i";
LABEL_63:
        v22 = v25;
        v23 = 54;
        goto LABEL_64;
      }
    }
  }
  else
  {
    v7 = FigHALAudioConduitDeviceResume();
    if (!v7)
    {
      -[VCAudioHALPluginMockAudioInject start](self->_mockAudioInject, "start");
      v8 = 1;
      self->_resumed = 1;
      goto LABEL_11;
    }
    v14 = v7;
    if ((VCAirPlayAudioHALPlugin *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAirPlayAudioHALPlugin start].cold.2();
      }
      goto LABEL_65;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCAirPlayAudioHALPlugin performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v28 = 136316418;
        v29 = v26;
        v30 = 2080;
        v31 = "-[VCAirPlayAudioHALPlugin start]";
        v32 = 1024;
        v33 = 181;
        v34 = 2112;
        v35 = (VCAirPlayAudioHALPlugin *)v15;
        v36 = 2048;
        v37 = self;
        v38 = 1024;
        v39 = v14;
        v20 = " [%s] %s:%d %@(%p) Resume conduit returned error=%i";
        goto LABEL_63;
      }
    }
  }
LABEL_65:
  if (!self->_resumed)
    -[VCAirPlayAudioHALPlugin suspendAndReleaseConduitDeviceLocked](self, "suspendAndReleaseConduitDeviceLocked");
  v8 = 0;
LABEL_11:
  pthread_mutex_unlock(&self->_stateLock);
  return v8;
}

- (BOOL)stop
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 resumed;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  VCAirPlayAudioHALPlugin *v17;
  __int16 v18;
  VCAirPlayAudioHALPlugin *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAirPlayAudioHALPlugin-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = v3;
      v12 = 2080;
      v13 = "-[VCAirPlayAudioHALPlugin stop]";
      v14 = 1024;
      v15 = 199;
      v16 = 2048;
      v17 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAirPlayAudioHALPlugin-stop (%p)", (uint8_t *)&v10, 0x26u);
    }
  }
  pthread_mutex_lock(&self->_stateLock);
  resumed = self->_resumed;
  if (self->_resumed)
  {
    -[VCAudioHALPluginMockAudioInject stop](self->_mockAudioInject, "stop");
    -[VCAirPlayAudioHALPlugin suspendAndReleaseConduitDeviceLocked](self, "suspendAndReleaseConduitDeviceLocked");
  }
  else if ((VCAirPlayAudioHALPlugin *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAirPlayAudioHALPlugin stop].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCAirPlayAudioHALPlugin performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v10 = 136316162;
        v11 = v8;
        v12 = 2080;
        v13 = "-[VCAirPlayAudioHALPlugin stop]";
        v14 = 1024;
        v15 = 203;
        v16 = 2112;
        v17 = (VCAirPlayAudioHALPlugin *)v7;
        v18 = 2048;
        v19 = self;
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Pluging is not started", (uint8_t *)&v10, 0x30u);
      }
    }
  }
  pthread_mutex_unlock(&self->_stateLock);
  return resumed;
}

+ (void)registerAudioServerPluginDriver:(AudioServerPlugInDriverInterface *)a3 onQueue:(id)a4
{
  id v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  dispatch_time_t v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  _QWORD block[13];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = (id)objc_opt_class();
    if (a4)
    {
      if (v7 == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v38 = v9;
            v39 = 2080;
            v40 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
            v41 = 1024;
            v42 = 222;
            v11 = " [%s] %s:%d Registering remote audio server plugin driver";
            v12 = v10;
            v13 = 28;
LABEL_13:
            _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v38 = v14;
            v39 = 2080;
            v40 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
            v41 = 1024;
            v42 = 222;
            v43 = 2112;
            v44 = v8;
            v45 = 2048;
            v46 = a1;
            v11 = " [%s] %s:%d %@(%p) Registering remote audio server plugin driver";
            v12 = v15;
            v13 = 48;
            goto LABEL_13;
          }
        }
      }
      v16 = MEMORY[0x1E0C809B0];
      block[6] = MEMORY[0x1E0C809B0];
      block[7] = 3221225472;
      block[8] = __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke;
      block[9] = &unk_1E9E53820;
      block[10] = a1;
      block[11] = a4;
      block[12] = a3;
      v17 = AudioServerPlugInRegisterRemote();
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v38 = v19;
            v39 = 2080;
            v40 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
            v41 = 1024;
            v42 = 229;
            v43 = 1024;
            LODWORD(v44) = v17;
            v21 = " [%s] %s:%d Plugin register remote returned=%i";
            v22 = v20;
            v23 = 34;
LABEL_24:
            _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v18 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
        else
          v18 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v38 = v24;
            v39 = 2080;
            v40 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
            v41 = 1024;
            v42 = 229;
            v43 = 2112;
            v44 = v18;
            v45 = 2048;
            v46 = a1;
            v47 = 1024;
            v48 = v17;
            v21 = " [%s] %s:%d %@(%p) Plugin register remote returned=%i";
            v22 = v25;
            v23 = 54;
            goto LABEL_24;
          }
        }
      }
      if (v17)
      {
        if ((id)objc_opt_class() == a1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              +[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:].cold.3();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v26 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
          else
            v26 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v27 = VRTraceErrorLogLevelToCSTR();
            v28 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316674;
              v38 = v27;
              v39 = 2080;
              v40 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
              v41 = 1024;
              v42 = 232;
              v43 = 2112;
              v44 = v26;
              v45 = 2048;
              v46 = a1;
              v47 = 1024;
              v48 = 5;
              v49 = 1024;
              v50 = v17;
              _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Re-register remote delay=%d sec because register returned error=%i", buf, 0x3Cu);
            }
          }
        }
        v29 = dispatch_time(0, 5000000000);
        block[0] = v16;
        block[1] = 3221225472;
        block[2] = __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke_11;
        block[3] = &unk_1E9E52960;
        block[4] = a4;
        block[5] = a3;
        dispatch_after(v29, (dispatch_queue_t)a4, block);
      }
      return;
    }
    if (v7 != a1)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v31 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v31 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v35 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)buf = 136316162;
      v38 = v35;
      v39 = 2080;
      v40 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
      v41 = 1024;
      v42 = 220;
      v43 = 2112;
      v44 = v31;
      v45 = 2048;
      v46 = a1;
      v34 = " [%s] %s:%d %@(%p) Invalid queue parameter";
      goto LABEL_58;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:].cold.2();
    }
  }
  else
  {
    if ((id)objc_opt_class() != a1)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v30 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)buf = 136316162;
      v38 = v32;
      v39 = 2080;
      v40 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
      v41 = 1024;
      v42 = 219;
      v43 = 2112;
      v44 = v30;
      v45 = 2048;
      v46 = a1;
      v34 = " [%s] %s:%d %@(%p) Invalid plugin driver parameter";
LABEL_58:
      _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x30u);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:].cold.1();
    }
  }
}

void __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  uint64_t v6;
  _QWORD v7[4];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136316418;
        v9 = v3;
        v10 = 2080;
        v11 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]_block_invoke";
        v12 = 1024;
        v13 = 224;
        v14 = 2112;
        v15 = v2;
        v16 = 2048;
        v17 = v6;
        v18 = 1024;
        v19 = 5;
        _os_log_error_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Re-register remote delay=%d sec because plugin was interrupted", buf, 0x36u);
      }
    }
  }
  v5 = dispatch_time(0, 5000000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke_9;
  v7[3] = &unk_1E9E52960;
  dispatch_after(v5, *(dispatch_queue_t *)(a1 + 40), v7);
}

uint64_t __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke_9(uint64_t a1)
{
  return +[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:](VCAirPlayAudioHALPlugin, "registerAudioServerPluginDriver:onQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke_11(uint64_t a1)
{
  return +[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:](VCAirPlayAudioHALPlugin, "registerAudioServerPluginDriver:onQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (AudioServerPlugInDriverInterface)createInterface
{
  const __CFURL *v3;
  const __CFURL *v4;
  CFPlugInRef v5;
  __CFBundle *v6;
  const __CFUUID *v7;
  const __CFArray *FactoriesForPlugInTypeInPlugIn;
  const __CFArray *v9;
  const __CFUUID *ValueAtIndex;
  const __CFUUID *v11;
  const __CFUUID *v12;
  void *v13;
  void *v14;
  uint64_t (*v15)(void *, _QWORD, _QWORD, AudioServerPlugInDriverInterface ***);
  const __CFUUID *v16;
  CFUUIDBytes v17;
  int v18;
  AudioServerPlugInDriverInterface **v19;
  id v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  __CFBundle *v29;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  int v37;
  const __CFString *v38;
  const __CFString *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  NSObject *v54;
  uint32_t v55;
  uint64_t v56;
  NSObject *v57;
  AudioServerPlugInDriverInterface **v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  int v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v58 = 0;
  v3 = CFURLCreateWithFileSystemPath(0, CFSTR("/System/Library/Audio/Plug-Ins/AVC/AVCHalogen.driver"), kCFURLPOSIXPathStyle, 1u);
  if (v3)
  {
    v4 = v3;
    v5 = CFPlugInCreate(0, v3);
    if (!v5)
    {
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCAirPlayAudioHALPlugin createInterface].cold.2();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v32 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
        else
          v32 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v42 = VRTraceErrorLogLevelToCSTR();
          v43 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v60 = v42;
            v61 = 2080;
            v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
            v63 = 1024;
            v64 = 251;
            v65 = 2112;
            v66 = v32;
            v67 = 2048;
            v68 = a1;
            _os_log_error_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create plugin", buf, 0x30u);
          }
        }
      }
      v29 = v4;
      goto LABEL_23;
    }
    v6 = v5;
    v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
    FactoriesForPlugInTypeInPlugIn = CFPlugInFindFactoriesForPlugInTypeInPlugIn(v7, v6);
    if (!FactoriesForPlugInTypeInPlugIn)
    {
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCAirPlayAudioHALPlugin createInterface].cold.3();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v33 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
        else
          v33 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v44 = VRTraceErrorLogLevelToCSTR();
          v45 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v60 = v44;
            v61 = 2080;
            v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
            v63 = 1024;
            v64 = 254;
            v65 = 2112;
            v66 = v33;
            v67 = 2048;
            v68 = a1;
            _os_log_error_impl(&dword_1D8A54000, v45, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create factory object for plugins", buf, 0x30u);
          }
        }
      }
      v9 = v4;
      goto LABEL_22;
    }
    v9 = FactoriesForPlugInTypeInPlugIn;
    if (CFArrayGetCount(FactoriesForPlugInTypeInPlugIn) <= 0)
    {
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCAirPlayAudioHALPlugin createInterface].cold.4();
        }
        goto LABEL_21;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v34 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v34 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_21;
      v46 = VRTraceErrorLogLevelToCSTR();
      v47 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      *(_DWORD *)buf = 136316162;
      v60 = v46;
      v61 = 2080;
      v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
      v63 = 1024;
      v64 = 255;
      v65 = 2112;
      v66 = v34;
      v67 = 2048;
      v68 = a1;
      v48 = " [%s] %s:%d %@(%p) There are no factories for AudioServerPlugInType";
    }
    else
    {
      ValueAtIndex = (const __CFUUID *)CFArrayGetValueAtIndex(v9, 0);
      if (ValueAtIndex)
      {
        v11 = ValueAtIndex;
        v12 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
        v13 = CFPlugInInstanceCreate(0, v11, v12);
        if (v13)
        {
          v14 = v13;
          v15 = *(uint64_t (**)(void *, _QWORD, _QWORD, AudioServerPlugInDriverInterface ***))(*(_QWORD *)v13 + 8);
          v16 = CFUUIDGetConstantUUIDWithBytes(0, 0xEEu, 0xA5u, 0x77u, 0x3Du, 0xCCu, 0x43u, 0x49u, 0xF1u, 0x8Eu, 0, 0x8Fu, 0x96u, 0xE7u, 0xD2u, 0x3Bu, 0x17u);
          v17 = CFUUIDGetUUIDBytes(v16);
          v18 = v15(v14, *(_QWORD *)&v17.byte0, *(_QWORD *)&v17.byte8, &v58);
          if (v18)
          {
            v37 = v18;
            if ((id)objc_opt_class() == a1)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  +[VCAirPlayAudioHALPlugin createInterface].cold.8();
              }
              goto LABEL_20;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v38 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
            else
              v38 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 3)
              goto LABEL_20;
            v51 = VRTraceErrorLogLevelToCSTR();
            v52 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              goto LABEL_20;
            *(_DWORD *)buf = 136316418;
            v60 = v51;
            v61 = 2080;
            v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
            v63 = 1024;
            v64 = 262;
            v65 = 2112;
            v66 = v38;
            v67 = 2048;
            v68 = a1;
            v69 = 1024;
            v70 = v37;
            v53 = " [%s] %s:%d %@(%p) Query interface returned error=%i";
            v54 = v52;
            v55 = 54;
          }
          else
          {
            v19 = v58;
            v20 = (id)objc_opt_class();
            if (v19)
            {
              if (v20 == a1)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                  goto LABEL_20;
                v22 = VRTraceErrorLogLevelToCSTR();
                v23 = *MEMORY[0x1E0CF2758];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  goto LABEL_20;
                *(_DWORD *)buf = 136315650;
                v60 = v22;
                v61 = 2080;
                v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
                v63 = 1024;
                v64 = 264;
                v24 = " [%s] %s:%d Plugin loaded!";
                v25 = v23;
                v26 = 28;
              }
              else
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v21 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
                else
                  v21 = &stru_1E9E58EE0;
                if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                  goto LABEL_20;
                v27 = VRTraceErrorLogLevelToCSTR();
                v28 = *MEMORY[0x1E0CF2758];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  goto LABEL_20;
                *(_DWORD *)buf = 136316162;
                v60 = v27;
                v61 = 2080;
                v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
                v63 = 1024;
                v64 = 264;
                v65 = 2112;
                v66 = v21;
                v67 = 2048;
                v68 = a1;
                v24 = " [%s] %s:%d %@(%p) Plugin loaded!";
                v25 = v28;
                v26 = 48;
              }
              _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
LABEL_20:
              (*(void (**)(void *))(*(_QWORD *)v14 + 24))(v14);
              goto LABEL_21;
            }
            if (v20 == a1)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  +[VCAirPlayAudioHALPlugin createInterface].cold.7();
              }
              goto LABEL_20;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v39 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
            else
              v39 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 3)
              goto LABEL_20;
            v56 = VRTraceErrorLogLevelToCSTR();
            v57 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              goto LABEL_20;
            *(_DWORD *)buf = 136316162;
            v60 = v56;
            v61 = 2080;
            v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
            v63 = 1024;
            v64 = 263;
            v65 = 2112;
            v66 = v39;
            v67 = 2048;
            v68 = a1;
            v53 = " [%s] %s:%d %@(%p) Query interface returned nil interface";
            v54 = v57;
            v55 = 48;
          }
          _os_log_error_impl(&dword_1D8A54000, v54, OS_LOG_TYPE_ERROR, v53, buf, v55);
          goto LABEL_20;
        }
        if ((id)objc_opt_class() == a1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              +[VCAirPlayAudioHALPlugin createInterface].cold.6();
          }
          goto LABEL_21;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v36 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
        else
          v36 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v50 = VRTraceErrorLogLevelToCSTR();
          v47 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v60 = v50;
            v61 = 2080;
            v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
            v63 = 1024;
            v64 = 259;
            v65 = 2112;
            v66 = v36;
            v67 = 2048;
            v68 = a1;
            v48 = " [%s] %s:%d %@(%p) Could not create interface";
            goto LABEL_99;
          }
        }
LABEL_21:
        CFRelease(v4);
LABEL_22:
        CFRelease(v9);
        v29 = v6;
LABEL_23:
        CFRelease(v29);
        return v58;
      }
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCAirPlayAudioHALPlugin createInterface].cold.5();
        }
        goto LABEL_21;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v35 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v35 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_21;
      v49 = VRTraceErrorLogLevelToCSTR();
      v47 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      *(_DWORD *)buf = 136316162;
      v60 = v49;
      v61 = 2080;
      v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
      v63 = 1024;
      v64 = 257;
      v65 = 2112;
      v66 = v35;
      v67 = 2048;
      v68 = a1;
      v48 = " [%s] %s:%d %@(%p) Could not access first listed factory";
    }
LABEL_99:
    _os_log_error_impl(&dword_1D8A54000, v47, OS_LOG_TYPE_ERROR, v48, buf, 0x30u);
    goto LABEL_21;
  }
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCAirPlayAudioHALPlugin createInterface].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v31 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v31 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v40 = VRTraceErrorLogLevelToCSTR();
      v41 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v60 = v40;
        v61 = 2080;
        v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
        v63 = 1024;
        v64 = 248;
        v65 = 2112;
        v66 = v31;
        v67 = 2048;
        v68 = a1;
        _os_log_error_impl(&dword_1D8A54000, v41, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create URL with path to plugin", buf, 0x30u);
      }
    }
  }
  return v58;
}

+ (AudioServerPlugInDriverInterface)sharedAudioServerPluginDriver
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = a1;
  if (sharedAudioServerPluginDriver_onceToken != -1)
    dispatch_once(&sharedAudioServerPluginDriver_onceToken, v3);
  return (AudioServerPlugInDriverInterface **)sharedAudioServerPluginDriver__pluginInterface;
}

void __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  sharedAudioServerPluginDriver__pluginReqisterQueue = (uint64_t)dispatch_queue_create("com.apple.VideoConference.pluginRegisterQueue", 0);
  if (sharedAudioServerPluginDriver__pluginReqisterQueue)
  {
    sharedAudioServerPluginDriver__pluginInterface = +[VCAirPlayAudioHALPlugin createInterface](VCAirPlayAudioHALPlugin, "createInterface");
    if (sharedAudioServerPluginDriver__pluginInterface)
    {
      dispatch_sync((dispatch_queue_t)sharedAudioServerPluginDriver__pluginReqisterQueue, &__block_literal_global_33);
      goto LABEL_4;
    }
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke_cold_2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v19 = 136316162;
          v20 = v17;
          v21 = 2080;
          v22 = "+[VCAirPlayAudioHALPlugin sharedAudioServerPluginDriver]_block_invoke";
          v23 = 1024;
          v24 = 286;
          v25 = 2112;
          v26 = (uint64_t)v12;
          v27 = 2048;
          v28 = v18;
          v16 = " [%s] %s:%d %@(%p) Create interface returned nil interface";
          goto LABEL_39;
        }
      }
    }
  }
  else if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v19 = 136316162;
        v20 = v13;
        v21 = 2080;
        v22 = "+[VCAirPlayAudioHALPlugin sharedAudioServerPluginDriver]_block_invoke";
        v23 = 1024;
        v24 = 283;
        v25 = 2112;
        v26 = (uint64_t)v11;
        v27 = 2048;
        v28 = v15;
        v16 = " [%s] %s:%d %@(%p) Could not create dispatch queue";
LABEL_39:
        _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v19, 0x30u);
      }
    }
  }
LABEL_4:
  if (!sharedAudioServerPluginDriver__pluginInterface && sharedAudioServerPluginDriver__pluginReqisterQueue)
    dispatch_release((dispatch_object_t)sharedAudioServerPluginDriver__pluginReqisterQueue);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136315906;
        v20 = v3;
        v21 = 2080;
        v22 = "+[VCAirPlayAudioHALPlugin sharedAudioServerPluginDriver]_block_invoke_2";
        v23 = 1024;
        v24 = 295;
        v25 = 2048;
        v26 = sharedAudioServerPluginDriver__pluginInterface;
        v5 = " [%s] %s:%d Shared AirPlay Audio HAL plugin interface=%p";
        v6 = v4;
        v7 = 38;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v19, v7);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v19 = 136316418;
        v20 = v8;
        v21 = 2080;
        v22 = "+[VCAirPlayAudioHALPlugin sharedAudioServerPluginDriver]_block_invoke";
        v23 = 1024;
        v24 = 295;
        v25 = 2112;
        v26 = (uint64_t)v2;
        v27 = 2048;
        v28 = v10;
        v29 = 2048;
        v30 = sharedAudioServerPluginDriver__pluginInterface;
        v5 = " [%s] %s:%d %@(%p) Shared AirPlay Audio HAL plugin interface=%p";
        v6 = v9;
        v7 = 58;
        goto LABEL_17;
      }
    }
  }
}

uint64_t __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke_15()
{
  return +[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:](VCAirPlayAudioHALPlugin, "registerAudioServerPluginDriver:onQueue:", sharedAudioServerPluginDriver__pluginInterface, sharedAudioServerPluginDriver__pluginReqisterQueue);
}

+ (id)sharedAirPlayAudioHALPluginNullDevice
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("startAirPlayAudioHALPluginNullDevice"), 0))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__VCAirPlayAudioHALPlugin_sharedAirPlayAudioHALPluginNullDevice__block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = a1;
    if (sharedAirPlayAudioHALPluginNullDevice_onceToken != -1)
      dispatch_once(&sharedAirPlayAudioHALPluginNullDevice_onceToken, block);
    if (!sharedAirPlayAudioHALPluginNullDevice__sharedAirPlayHALPlugin)
    {
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCAirPlayAudioHALPlugin sharedAirPlayAudioHALPluginNullDevice].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v4 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
        else
          v4 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v5 = VRTraceErrorLogLevelToCSTR();
          v6 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v9 = v5;
            v10 = 2080;
            v11 = "+[VCAirPlayAudioHALPlugin sharedAirPlayAudioHALPluginNullDevice]";
            v12 = 1024;
            v13 = 311;
            v14 = 2112;
            v15 = v4;
            v16 = 2048;
            v17 = a1;
            _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Shared AirPlay Audio HAL plugin object does not exist", buf, 0x30u);
          }
        }
      }
    }
  }
  return (id)sharedAirPlayAudioHALPluginNullDevice__sharedAirPlayHALPlugin;
}

void __64__VCAirPlayAudioHALPlugin_sharedAirPlayAudioHALPluginNullDevice__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  sharedAirPlayAudioHALPluginNullDevice__sharedAirPlayHALPlugin = -[VCAirPlayAudioHALPlugin initWithConfig:]([VCAirPlayAudioHALPlugin alloc], "initWithConfig:", &v11);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v17 = v3;
        v18 = 2080;
        v19 = "+[VCAirPlayAudioHALPlugin sharedAirPlayAudioHALPluginNullDevice]_block_invoke";
        v20 = 1024;
        v21 = 308;
        v22 = 2048;
        v23 = sharedAirPlayAudioHALPluginNullDevice__sharedAirPlayHALPlugin;
        v5 = " [%s] %s:%d Created shared AirPlay Audio HAL plugin object=%p";
        v6 = v4;
        v7 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix, v11, v12, v13, v14, v15);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136316418;
        v17 = v8;
        v18 = 2080;
        v19 = "+[VCAirPlayAudioHALPlugin sharedAirPlayAudioHALPluginNullDevice]_block_invoke";
        v20 = 1024;
        v21 = 308;
        v22 = 2112;
        v23 = (uint64_t)v2;
        v24 = 2048;
        v25 = v10;
        v26 = 2048;
        v27 = sharedAirPlayAudioHALPluginNullDevice__sharedAirPlayHALPlugin;
        v5 = " [%s] %s:%d %@(%p) Created shared AirPlay Audio HAL plugin object=%p";
        v6 = v9;
        v7 = 58;
        goto LABEL_11;
      }
    }
  }
}

+ (void)createConduitCreationOptionsWithDeviceInfo:inOptions:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create mutable dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)createConduitCreationOptionsWithDeviceInfo:inOptions:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create mutable dictionary copy", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)convertASBDToInterleavedFormat:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid config parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:loadBinary:conduitCreateOptions:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d invalid config parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:loadBinary:conduitCreateOptions:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create plugin driver", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:loadBinary:conduitCreateOptions:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate mock audio inject", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)start
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Plugin already started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stop
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Pluging is not started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)registerAudioServerPluginDriver:onQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid plugin driver parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)registerAudioServerPluginDriver:onQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid queue parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)registerAudioServerPluginDriver:onQueue:.cold.3()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
  OUTLINED_FUNCTION_4();
  v5 = 232;
  v6 = v0;
  v7 = 5;
  v8 = v0;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Re-register remote delay=%d sec because register returned error=%i", v3, 0x28u);
  OUTLINED_FUNCTION_3();
}

void __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke_cold_1()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]_block_invoke";
  OUTLINED_FUNCTION_4();
  v4 = 224;
  v5 = v0;
  v6 = 5;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Re-register remote delay=%d sec because plugin was interrupted", v2, 0x22u);
  OUTLINED_FUNCTION_3();
}

+ (void)createInterface
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCAirPlayAudioHALPlugin createInterface]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Query interface returned error=%i", v2, *(const char **)v3, (unint64_t)"+[VCAirPlayAudioHALPlugin createInterface]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

void __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create dispatch queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Create interface returned nil interface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)sharedAirPlayAudioHALPluginNullDevice
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Shared AirPlay Audio HAL plugin object does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
