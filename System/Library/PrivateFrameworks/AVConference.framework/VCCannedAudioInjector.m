@implementation VCCannedAudioInjector

- (VCCannedAudioInjector)initWithConfig:(id)a3
{
  char *v4;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  CFTypeRef v17;
  int v18;
  int v19;
  const __CFString *v20;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  NSObject *v29;
  objc_super v30;
  uint8_t buf[40];
  char *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)VCCannedAudioInjector;
  v4 = -[VCObject init](&v30, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    if ((char *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v7;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 119;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = a3;
          v9 = " [%s] %s:%d Loading canned audio: config=%@";
          v10 = v8;
          v11 = 38;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 119;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v6;
          *(_WORD *)&buf[38] = 2048;
          v32 = v4;
          v33 = 2112;
          v34 = a3;
          v9 = " [%s] %s:%d %@(%p) Loading canned audio: config=%@";
          v10 = v13;
          v11 = 58;
          goto LABEL_12;
        }
      }
    }
    if ((objc_msgSend(a3, "isValid") & 1) != 0)
    {
      *((_DWORD *)v4 + 46) = 0;
      v4[188] = objc_msgSend(a3, "fromBeginning");
      *((_QWORD *)v4 + 22) = (id)objc_msgSend(a3, "path");
      if (a3)
        objc_msgSend(a3, "audioFormat");
      else
        memset(buf, 0, sizeof(buf));
      v14 = *(_OWORD *)buf;
      v15 = *(_OWORD *)&buf[16];
      *((_QWORD *)v4 + 35) = *(_QWORD *)&buf[32];
      *(_OWORD *)(v4 + 248) = v14;
      *(_OWORD *)(v4 + 264) = v15;
      *((_DWORD *)v4 + 98) = objc_msgSend(a3, "loopCount");
      objc_msgSend(a3, "loopLength");
      *((_QWORD *)v4 + 51) = v16;
      *((_DWORD *)v4 + 48) = 0;
      v4[416] = objc_msgSend(a3, "forceVoiceActive");
      v17 = (CFTypeRef)objc_msgSend(a3, "reportingAgent");
      if (v17)
        v17 = CFRetain(v17);
      *((_QWORD *)v4 + 1) = v17;
      pthread_cond_init((pthread_cond_t *)(v4 + 200), 0);
      objc_msgSend(v4, "reportInjectorInitWithPath:", objc_msgSend(a3, "path"));
      if (objc_msgSend(a3, "sineWaveFrequencyHz"))
      {
        v18 = objc_msgSend(v4, "setupSineInjectionWithConfig:", a3);
        if (v18 < 0)
        {
          v19 = v18;
          if ((char *)objc_opt_class() == v4)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCCannedAudioInjector initWithConfig:].cold.1();
            }
            goto LABEL_43;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v20 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
          else
            v20 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3
            || (v28 = VRTraceErrorLogLevelToCSTR(),
                v29 = *MEMORY[0x1E0CF2758],
                !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
          {
LABEL_43:

            v4 = 0;
            goto LABEL_25;
          }
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = v28;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 140;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v20;
          *(_WORD *)&buf[38] = 2048;
          v32 = v4;
          v33 = 1024;
          LODWORD(v34) = v19;
          v25 = " [%s] %s:%d %@(%p) Failed to setup the injector. result=%x";
          v26 = v29;
          v27 = 54;
LABEL_45:
          _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
          goto LABEL_43;
        }
      }
      else
      {
        objc_msgSend(v4, "setupAssetInjectionWithConfig:", a3);
      }
LABEL_25:
      objc_msgSend(v5, "drain");
      return (VCCannedAudioInjector *)v4;
    }
    if ((char *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector initWithConfig:].cold.2();
      }
      goto LABEL_43;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_43;
    v23 = VRTraceErrorLogLevelToCSTR();
    v24 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector initWithConfig:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 121;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v22;
    *(_WORD *)&buf[38] = 2048;
    v32 = v4;
    v25 = " [%s] %s:%d %@(%p) Config is invalid";
    v26 = v24;
    v27 = 48;
    goto LABEL_45;
  }
  return (VCCannedAudioInjector *)v4;
}

- (void)reportInjectorInitWithPath:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  void *v11;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = v5;
  if (a3)
  {
    v7 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
    v8 = +[VCFileUtil sizeOfFile:](VCFileUtil, "sizeOfFile:", v7);
    +[VCFileUtil contentLengthOfFile:](VCFileUtil, "contentLengthOfFile:", v7);
    v10 = v9;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8), CFSTR("CAIFS"));
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 * 1000.0);
  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E9EF65C0, CFSTR("CAIFS"));
    v11 = &unk_1E9EFB0F8;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("CAIFL"));
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCCannedAudioInjector *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v4;
        v14 = 2080;
        v15 = "-[VCCannedAudioInjector dealloc]";
        v16 = 1024;
        v17 = 170;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCCannedAudioInjector dealloc]";
        v16 = 1024;
        v17 = 170;
        v18 = 2112;
        v19 = v3;
        v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  pthread_cond_destroy(&self->_samplesConditional);

  VCAudioBufferList_Destroy((uint64_t *)&self->_sampleBuffer);
  v11.receiver = self;
  v11.super_class = (Class)VCCannedAudioInjector;
  -[VCObject dealloc](&v11, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  NSString *cannedMoviePath;
  _BOOL8 fromBeginning;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)VCCannedAudioInjector;
  v4 = -[VCCannedAudioInjector description](&v11, sel_description);
  cannedMoviePath = self->_cannedMoviePath;
  fromBeginning = self->_fromBeginning;
  -[VCCannedAVSync base](self->_avSync, "base");
  v8 = v7;
  -[VCCannedAVSync modulo](self->_avSync, "modulo");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ path=%@, fromBeginning=%d, base=%0.2f, modulo=%0.2f"), v4, cannedMoviePath, fromBeginning, v8, v9);
}

- (BOOL)setupAssetInjectionWithConfig:(id)a3
{
  int v5;
  int *p_assetType;
  double v7;
  double v8;
  double v9;
  int v10;
  int v11;
  VCCannedAudioInjector *v12;
  const __CFString *v13;
  const __CFString *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  const __CFString *v32;
  int v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  VCCannedAudioInjector *v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = +[CannedVideoCapture cannedVideoTypeForPath:](CannedVideoCapture, "cannedVideoTypeForPath:", objc_msgSend(a3, "path"));
  p_assetType = &self->_assetType;
  self->_assetType = v5;
  if ((v5 - 1) >= 2)
  {
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      v15 = -2142699519;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector setupAssetInjectionWithConfig:].cold.4();
      }
      return v15 != 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    v15 = -2142699519;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v15 != 0;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v15 != 0;
    v24 = *p_assetType;
    v40 = 136316418;
    v41 = v22;
    v42 = 2080;
    v43 = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
    v44 = 1024;
    v45 = 189;
    v46 = 2112;
    v47 = v14;
    v48 = 2048;
    v49 = self;
    v50 = 1024;
    v51 = v24;
    v25 = " [%s] %s:%d %@(%p) Invalid asset type. assetType=%d";
LABEL_21:
    v26 = v23;
    v27 = 54;
LABEL_22:
    _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v40, v27);
    return v15 != 0;
  }
  if (!+[VCCannedAudioInjector isAudioAvailable:fileName:](VCCannedAudioInjector, "isAudioAvailable:fileName:", objc_msgSend(a3, "path"), objc_msgSend(a3, "fileName")))
  {
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      v15 = -2142699519;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector setupAssetInjectionWithConfig:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v32 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v32 = &stru_1E9E58EE0;
      v15 = -2142699519;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v36 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v40 = 136316162;
          v41 = v36;
          v42 = 2080;
          v43 = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
          v44 = 1024;
          v45 = 192;
          v46 = 2112;
          v47 = v32;
          v48 = 2048;
          v49 = self;
          v25 = " [%s] %s:%d %@(%p) Audio file not found";
          v26 = v37;
          v27 = 48;
          goto LABEL_22;
        }
      }
    }
    return v15 != 0;
  }
  objc_msgSend(a3, "startHostTime");
  v8 = v7;
  objc_msgSend(a3, "loopLength");
  v10 = -[VCCannedAudioInjector setupAVSyncWithStartHostTime:loopLength:](self, "setupAVSyncWithStartHostTime:loopLength:", v8, v9);
  if (v10 < 0)
  {
    v33 = v10;
    v15 = -2142699519;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector setupAssetInjectionWithConfig:].cold.1();
      }
      return v15 != 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v34 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v34 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v15 != 0;
    v38 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v15 != 0;
    v40 = 136316418;
    v41 = v38;
    v42 = 2080;
    v43 = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
    v44 = 1024;
    v45 = 195;
    v46 = 2112;
    v47 = v34;
    v48 = 2048;
    v49 = self;
    v50 = 1024;
    v51 = v33;
    v25 = " [%s] %s:%d %@(%p) Failed to setup the AV sync. result=%x";
    goto LABEL_21;
  }
  v11 = -[VCCannedAudioInjector loadAudioSamples](self, "loadAudioSamples");
  v12 = (VCCannedAudioInjector *)objc_opt_class();
  if ((v11 & 0x80000000) == 0)
  {
    if (v12 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_28;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      v18 = *p_assetType;
      v40 = 136315906;
      v41 = v16;
      v42 = 2080;
      v43 = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
      v44 = 1024;
      v45 = 199;
      v46 = 1024;
      LODWORD(v47) = v18;
      v19 = " [%s] %s:%d Canned audio injector loaded successfully. assetType=%d";
      v20 = v17;
      v21 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_28;
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      v30 = *p_assetType;
      v40 = 136316418;
      v41 = v28;
      v42 = 2080;
      v43 = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
      v44 = 1024;
      v45 = 199;
      v46 = 2112;
      v47 = v13;
      v48 = 2048;
      v49 = self;
      v50 = 1024;
      v51 = v30;
      v19 = " [%s] %s:%d %@(%p) Canned audio injector loaded successfully. assetType=%d";
      v20 = v29;
      v21 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v40, v21);
LABEL_28:
    v15 = v11;
    return v15 != 0;
  }
  v15 = -2142699519;
  if (v12 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedAudioInjector setupAssetInjectionWithConfig:].cold.2();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v35 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v35 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v39 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v40 = 136316418;
        v41 = v39;
        v42 = 2080;
        v43 = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
        v44 = 1024;
        v45 = 198;
        v46 = 2112;
        v47 = v35;
        v48 = 2048;
        v49 = self;
        v50 = 1024;
        v51 = v11;
        v25 = " [%s] %s:%d %@(%p) Failed to load the audio samples. result=%x";
        goto LABEL_21;
      }
    }
  }
  return v15 != 0;
}

- (int)loadAudioSamples
{
  int assetType;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
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
  const __CFString *v22;
  __int16 v23;
  VCCannedAudioInjector *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  assetType = self->_assetType;
  if (assetType == 2)
    return -[VCCannedAudioInjector loadEncodedAudioSamples](self, "loadEncodedAudioSamples");
  if (assetType == 1)
    return -[VCCannedAudioInjector loadRawAudioSamples](self, "loadRawAudioSamples");
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return -2142699505;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return -2142699505;
    v8 = self->_assetType;
    v15 = 136315906;
    v16 = v6;
    v17 = 2080;
    v18 = "-[VCCannedAudioInjector loadAudioSamples]";
    v19 = 1024;
    v20 = 214;
    v21 = 1024;
    LODWORD(v22) = v8;
    v9 = " [%s] %s:%d Unknown _assetType=%d";
    v10 = v7;
    v11 = 34;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return -2142699505;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return -2142699505;
    v14 = self->_assetType;
    v15 = 136316418;
    v16 = v12;
    v17 = 2080;
    v18 = "-[VCCannedAudioInjector loadAudioSamples]";
    v19 = 1024;
    v20 = 214;
    v21 = 2112;
    v22 = v5;
    v23 = 2048;
    v24 = self;
    v25 = 1024;
    v26 = v14;
    v9 = " [%s] %s:%d %@(%p) Unknown _assetType=%d";
    v10 = v13;
    v11 = 54;
  }
  _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
  return -2142699505;
}

- (int)setupAVSyncWithStartHostTime:(double)a3 loopLength:(double)a4
{
  VCCannedAVSync *v6;
  VCCannedAVSync *avSync;
  double v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int samplesInLoop;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  VCCannedAudioInjector *v28;
  __int16 v29;
  _BYTE v30[18];
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0.0)
  {
    avSync = objc_alloc_init(VCCannedAVSync);
    self->_avSync = avSync;
    if (a4 > 0.0)
    {
      -[VCCannedAVSync setModulo:](avSync, "setModulo:", a4);
      avSync = self->_avSync;
    }
    -[VCCannedAVSync setBase:](avSync, "setBase:", a3);
    v6 = self->_avSync;
  }
  else
  {
    self->_isSharedAVSync = 1;
    v6 = (VCCannedAVSync *)+[VCCannedAVSync sharedCannedAVSync](VCCannedAVSync, "sharedCannedAVSync");
    self->_avSync = v6;
  }
  -[VCCannedAVSync modulo](v6, "modulo");
  self->_samplesInLoop = vcvtad_u64_f64(v9 * self->_outputFormat.mSampleRate);
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_17;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    samplesInLoop = self->_samplesInLoop;
    v21 = 136316418;
    v22 = v11;
    v23 = 2080;
    v24 = "-[VCCannedAudioInjector setupAVSyncWithStartHostTime:loopLength:]";
    v25 = 1024;
    v26 = 238;
    v27 = 2112;
    v28 = self;
    v29 = 1024;
    *(_DWORD *)v30 = samplesInLoop;
    *(_WORD *)&v30[4] = 2048;
    *(double *)&v30[6] = a4;
    v14 = " [%s] %s:%d injector=%@, _samplesInLoop=%d, loopLength=%f";
    v15 = v12;
    v16 = 54;
    goto LABEL_16;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v10 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_samplesInLoop;
      v21 = 136316930;
      v22 = v17;
      v23 = 2080;
      v24 = "-[VCCannedAudioInjector setupAVSyncWithStartHostTime:loopLength:]";
      v25 = 1024;
      v26 = 238;
      v27 = 2112;
      v28 = (VCCannedAudioInjector *)v10;
      v29 = 2048;
      *(_QWORD *)v30 = self;
      *(_WORD *)&v30[8] = 2112;
      *(_QWORD *)&v30[10] = self;
      v31 = 1024;
      v32 = v19;
      v33 = 2048;
      v34 = a4;
      v14 = " [%s] %s:%d %@(%p) injector=%@, _samplesInLoop=%d, loopLength=%f";
      v15 = v18;
      v16 = 74;
LABEL_16:
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v21, v16);
    }
  }
LABEL_17:
  if (self->_avSync)
    return 0;
  else
    return -2142699517;
}

+ (BOOL)isAudioAvailable:(id)a3 fileName:(id)a4
{
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  timespec v13;
  int v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  stat v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = +[CannedVideoCapture cannedVideoTypeForPath:](CannedVideoCapture, "cannedVideoTypeForPath:");
  if (v6 == 1)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), a3, a4);
    v13.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v13.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v21.st_blksize = v13;
    *(timespec *)v21.st_qspare = v13;
    v21.st_birthtimespec = v13;
    *(timespec *)&v21.st_size = v13;
    v21.st_mtimespec = v13;
    v21.st_ctimespec = v13;
    *(timespec *)&v21.st_uid = v13;
    v21.st_atimespec = v13;
    *(timespec *)&v21.st_dev = v13;
    v14 = stat((const char *)objc_msgSend(v12, "UTF8String"), &v21);

    if (!v14 && (v21.st_mode & 0xF000) == 0x8000)
      goto LABEL_9;
LABEL_14:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v15)
        return v15;
      +[VCCannedAudioInjector isAudioAvailable:fileName:].cold.1();
    }
    LOBYTE(v15) = 0;
    return v15;
  }
  if (v6 != 2)
    goto LABEL_14;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  v8 = objc_alloc(MEMORY[0x1E0C8B3C0]);
  v19 = *MEMORY[0x1E0C8AD90];
  v20 = MEMORY[0x1E0C9AAB0];
  v9 = (void *)objc_msgSend(v8, "initWithURL:options:", v7, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCCannedAudioInjector isAudioAvailable:fileName:].cold.2(v16, v7, v17);
    }
    goto LABEL_14;
  }
  v10 = v9;
  v11 = (void *)objc_msgSend(v9, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  if (!v11 || !objc_msgSend(v11, "count"))
  {

    goto LABEL_14;
  }

LABEL_9:
  LOBYTE(v15) = 1;
  return v15;
}

- (void)completeSetupWithSampleBuffer:(opaqueVCAudioBufferList *)a3
{
  os_unfair_lock_s *p_samplesMutex;
  opaqueVCAudioBufferList *v6;

  p_samplesMutex = &self->_samplesMutex;
  os_unfair_lock_lock(&self->_samplesMutex);
  v6 = *a3;
  self->_sampleBuffer = *a3;
  self->_audioSampleCount = VCAudioBufferList_GetSampleCount((uint64_t)v6);
  os_unfair_lock_unlock(p_samplesMutex);
  *a3 = 0;
  -[VCCannedAudioInjector setIsReadyToInject:](self, "setIsReadyToInject:", 1);
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
}

- (void)setAudioConverterProcAudioBufferList:(const AudioBufferList *)a3 blockBuffer:(OpaqueCMBlockBuffer *)a4
{
  __int128 v4;
  OpaqueCMBlockBuffer *blockBuffer;

  v4 = *(_OWORD *)&a3->mNumberBuffers;
  self->_audioConverterProc.audioBufferList.mBuffers[0].mData = a3->mBuffers[0].mData;
  *(_OWORD *)&self->_audioConverterProc.audioBufferList.mNumberBuffers = v4;
  blockBuffer = self->_audioConverterProc.blockBuffer;
  self->_audioConverterProc.blockBuffer = a4;
  if (a4)
    CFRetain(a4);
  if (blockBuffer)
    CFRelease(blockBuffer);
}

- (void)cleanupAudioConverterProc
{
  tagVCCannedAudioInjectorConverterProc *p_audioConverterProc;
  OpaqueCMBlockBuffer *blockBuffer;
  OpaqueCMBlockBuffer *previousBlockBuffer;

  p_audioConverterProc = &self->_audioConverterProc;
  blockBuffer = self->_audioConverterProc.blockBuffer;
  if (blockBuffer)
  {
    CFRelease(blockBuffer);
    p_audioConverterProc->blockBuffer = 0;
  }
  previousBlockBuffer = p_audioConverterProc->previousBlockBuffer;
  if (previousBlockBuffer)
  {
    CFRelease(previousBlockBuffer);
    p_audioConverterProc->previousBlockBuffer = 0;
  }
  p_audioConverterProc->audioBufferList.mBuffers[0].mData = 0;
  p_audioConverterProc->audioBufferList.mBuffers[0].mDataByteSize = 0;
}

+ (AudioStreamBasicDescription)internalAssetFormatWithFileFormat:(SEL)a3
{
  UInt32 mChannelsPerFrame;
  const __CFString *v8;
  AudioStreamBasicDescription *result;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  char *v30;
  char v31[16];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  char __str[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  mChannelsPerFrame = a4->mChannelsPerFrame;
  retstr->mSampleRate = a4->mSampleRate;
  *(_QWORD *)&retstr->mFormatID = 0xC6C70636DLL;
  retstr->mBytesPerPacket = 2 * mChannelsPerFrame;
  retstr->mFramesPerPacket = 1;
  retstr->mBytesPerFrame = 2 * mChannelsPerFrame;
  retstr->mChannelsPerFrame = mChannelsPerFrame;
  *(_QWORD *)&retstr->mBitsPerChannel = 16;
  v37 = 0u;
  v38 = 0u;
  *(_OWORD *)__str = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  *(_OWORD *)v31 = 0u;
  v32 = 0u;
  if ((id)objc_opt_class() == a2)
  {
    result = (AudioStreamBasicDescription *)VRTraceGetErrorLogLevelForModule();
    if ((int)result >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      result = (AudioStreamBasicDescription *)os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)result)
      {
        v17 = 136316162;
        v18 = v10;
        v19 = 2080;
        v20 = "+[VCCannedAudioInjector internalAssetFormatWithFileFormat:]";
        v21 = 1024;
        v22 = 331;
        v23 = 2080;
        v24 = FormatToCStr((uint64_t)a4, __str, 0x40uLL);
        v25 = 2080;
        v26 = FormatToCStr((uint64_t)retstr, v31, 0x40uLL);
        v12 = " [%s] %s:%d assetAudioFormat=%s, internalAssetFormat=%s";
        v13 = v11;
        v14 = 48;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)objc_msgSend(a2, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    result = (AudioStreamBasicDescription *)VRTraceGetErrorLogLevelForModule();
    if ((int)result >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      result = (AudioStreamBasicDescription *)os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)result)
      {
        v17 = 136316674;
        v18 = v15;
        v19 = 2080;
        v20 = "+[VCCannedAudioInjector internalAssetFormatWithFileFormat:]";
        v21 = 1024;
        v22 = 331;
        v23 = 2112;
        v24 = (char *)v8;
        v25 = 2048;
        v26 = a2;
        v27 = 2080;
        v28 = FormatToCStr((uint64_t)a4, __str, 0x40uLL);
        v29 = 2080;
        v30 = FormatToCStr((uint64_t)retstr, v31, 0x40uLL);
        v12 = " [%s] %s:%d %@(%p) assetAudioFormat=%s, internalAssetFormat=%s";
        v13 = v16;
        v14 = 68;
        goto LABEL_11;
      }
    }
  }
  return result;
}

+ (id)defaultReaderOutputSettings
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C898F0];
  v5[0] = *MEMORY[0x1E0C898E0];
  v5[1] = v2;
  v6[0] = &unk_1E9EF65D8;
  v6[1] = &unk_1E9EF65F0;
  v3 = *MEMORY[0x1E0C89900];
  v5[2] = *MEMORY[0x1E0C89910];
  v5[3] = v3;
  v6[2] = MEMORY[0x1E0C9AAA0];
  v6[3] = MEMORY[0x1E0C9AAA0];
  v5[4] = *MEMORY[0x1E0C89928];
  v6[4] = MEMORY[0x1E0C9AAA0];
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
}

+ (int)setupReader:(id)a3 forAsset:(id)a4 assetAudioFormat:(AudioStreamBasicDescription *)a5 trackOutput:(id *)a6
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  __int128 v22;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  uint64_t v38;
  NSObject *v39;
  uint32_t v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  NSObject *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  char *v57;
  os_log_t *v58;
  uint64_t v59;
  NSObject *v60;
  char *v61;
  os_log_t *v62;
  uint64_t v63;
  NSObject *v64;
  char *v65;
  os_log_t *v66;
  uint64_t v67;
  NSObject *v68;
  char *v69;
  os_log_t *v70;
  uint64_t v71;
  NSObject *v72;
  char *__lasts;
  char *__str;
  _BYTE buf[40];
  id v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  __int16 v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(a1, "defaultReaderOutputSettings");
  if (!v11)
  {
    if ((id)objc_opt_class() == a1)
    {
      v21 = -2142699517;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:].cold.1();
      }
      return v21;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    v21 = -2142699517;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v21;
    v48 = VRTraceErrorLogLevelToCSTR();
    v49 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v21;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v48;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 351;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v26;
    *(_WORD *)&buf[38] = 2048;
    v76 = a1;
    v31 = " [%s] %s:%d %@(%p) Failed to allocate read settings";
    v32 = v49;
    goto LABEL_52;
  }
  v12 = (void *)v11;
  v13 = (void *)objc_msgSend(a4, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  v14 = v13;
  if (!v13 || !objc_msgSend(v13, "count"))
  {
    if ((id)objc_opt_class() != a1)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      v21 = -2142699510;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return v21;
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return v21;
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 354;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v24;
      *(_WORD *)&buf[38] = 2048;
      v76 = a1;
      v77 = 2112;
      v78 = v14;
      v79 = 2112;
      v80 = a4;
      v31 = " [%s] %s:%d %@(%p) Failed to get audioTracks=%@ from asset=%@";
      v32 = v39;
      v40 = 68;
LABEL_53:
      _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, v31, buf, v40);
      return v21;
    }
    v21 = -2142699510;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v21;
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v21;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v29;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 354;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v14;
    *(_WORD *)&buf[38] = 2112;
    v76 = a4;
    v31 = " [%s] %s:%d Failed to get audioTracks=%@ from asset=%@";
    v32 = v30;
LABEL_52:
    v40 = 48;
    goto LABEL_53;
  }
  v15 = objc_msgSend(v14, "objectAtIndex:", 0);
  if (v15)
  {
    v16 = (void *)v15;
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v15, v12);
    if (v17)
    {
      v18 = v17;
      objc_msgSend(v17, "setAlwaysCopiesSampleData:", 0);
      objc_msgSend(a3, "setPreparesMediaDataForRealTimeConsumption:", 1);
      objc_msgSend(a3, "addOutput:", v18);
      v19 = (void *)objc_msgSend(v16, "formatDescriptions");
      v20 = v19;
      if (v19 && objc_msgSend(v19, "count"))
      {
        +[VCCannedAudioInjector internalAssetFormatWithFileFormat:](VCCannedAudioInjector, "internalAssetFormatWithFileFormat:", CMAudioFormatDescriptionGetStreamBasicDescription((CMAudioFormatDescriptionRef)objc_msgSend(v20, "objectAtIndex:", 0)));
        v21 = 0;
        v22 = *(_OWORD *)&buf[16];
        *(_OWORD *)&a5->mSampleRate = *(_OWORD *)buf;
        *(_OWORD *)&a5->mBytesPerPacket = v22;
        *(_QWORD *)&a5->mBitsPerChannel = *(_QWORD *)&buf[32];
        *a6 = v18;
        return v21;
      }
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          return 0;
        v33 = VRTraceErrorLogLevelToCSTR();
        v34 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          return 0;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 368;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v20;
        *(_WORD *)&buf[38] = 2112;
        v76 = v16;
        v77 = 2112;
        v78 = a4;
        v35 = " [%s] %s:%d Failed to retrieve the formatDescriptions=%@ for track=%@ asset=%@";
        v36 = v34;
        v37 = 58;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v25 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
        else
          v25 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          return 0;
        v41 = VRTraceErrorLogLevelToCSTR();
        v42 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          return 0;
        *(_DWORD *)buf = 136316930;
        *(_QWORD *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 368;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v25;
        *(_WORD *)&buf[38] = 2048;
        v76 = a1;
        v77 = 2112;
        v78 = v20;
        v79 = 2112;
        v80 = v16;
        v81 = 2112;
        v82 = a4;
        v35 = " [%s] %s:%d %@(%p) Failed to retrieve the formatDescriptions=%@ for track=%@ asset=%@";
        v36 = v42;
        v37 = 78;
      }
      _os_log_error_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_ERROR, v35, buf, v37);
      return 0;
    }
    v21 = -2142699510;
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        __str = 0;
        v45 = (const char *)objc_msgSend((id)objc_msgSend(v16, "description"), "UTF8String");
        v46 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
        v47 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
        asprintf(&__str, "Instantiation of AVAssetReaderTrackOutput for track=%s with settings=%s failed for asset=%s", v45, v46, v47);
        if (__str)
        {
          __lasts = 0;
          v69 = strtok_r(__str, "\n", &__lasts);
          v70 = (os_log_t *)MEMORY[0x1E0CF2758];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v71 = VRTraceErrorLogLevelToCSTR();
              v72 = *v70;
              if (os_log_type_enabled(*v70, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)&buf[4] = v71;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 360;
                *(_WORD *)&buf[28] = 2080;
                *(_QWORD *)&buf[30] = "";
                *(_WORD *)&buf[38] = 2080;
                v76 = v69;
                _os_log_error_impl(&dword_1D8A54000, v72, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v69 = strtok_r(0, "\n", &__lasts);
          }
          while (v69);
          goto LABEL_93;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = (__CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v28 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        __str = 0;
        v53 = (const char *)-[__CFString UTF8String](v28, "UTF8String");
        v54 = (const char *)objc_msgSend((id)objc_msgSend(v16, "description"), "UTF8String");
        v55 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
        v56 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
        asprintf(&__str, "%s(%p) Instantiation of AVAssetReaderTrackOutput for track=%s with settings=%s failed for asset=%s", v53, a1, v54, v55, v56);
        if (__str)
        {
          __lasts = 0;
          v61 = strtok_r(__str, "\n", &__lasts);
          v62 = (os_log_t *)MEMORY[0x1E0CF2758];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v63 = VRTraceErrorLogLevelToCSTR();
              v64 = *v62;
              if (os_log_type_enabled(*v62, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)&buf[4] = v63;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 360;
                *(_WORD *)&buf[28] = 2080;
                *(_QWORD *)&buf[30] = "";
                *(_WORD *)&buf[38] = 2080;
                v76 = v61;
                _os_log_error_impl(&dword_1D8A54000, v64, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v61 = strtok_r(0, "\n", &__lasts);
          }
          while (v61);
LABEL_93:
          free(__str);
        }
      }
    }
  }
  else if ((id)objc_opt_class() == a1)
  {
    v21 = -2142699510;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      __str = 0;
      v43 = (const char *)objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String");
      v44 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "Failed to get audio track from tracks=%s asset=%s", v43, v44);
      if (__str)
      {
        __lasts = 0;
        v65 = strtok_r(__str, "\n", &__lasts);
        v66 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v67 = VRTraceErrorLogLevelToCSTR();
            v68 = *v66;
            if (os_log_type_enabled(*v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = v67;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 357;
              *(_WORD *)&buf[28] = 2080;
              *(_QWORD *)&buf[30] = "";
              *(_WORD *)&buf[38] = 2080;
              v76 = v65;
              _os_log_error_impl(&dword_1D8A54000, v68, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v65 = strtok_r(0, "\n", &__lasts);
        }
        while (v65);
        goto LABEL_93;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (__CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v27 = &stru_1E9E58EE0;
    v21 = -2142699510;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      __str = 0;
      v50 = (const char *)-[__CFString UTF8String](v27, "UTF8String");
      v51 = (const char *)objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String");
      v52 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) Failed to get audio track from tracks=%s asset=%s", v50, a1, v51, v52);
      if (__str)
      {
        __lasts = 0;
        v57 = strtok_r(__str, "\n", &__lasts);
        v58 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v59 = VRTraceErrorLogLevelToCSTR();
            v60 = *v58;
            if (os_log_type_enabled(*v58, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = v59;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 357;
              *(_WORD *)&buf[28] = 2080;
              *(_QWORD *)&buf[30] = "";
              *(_WORD *)&buf[38] = 2080;
              v76 = v57;
              _os_log_error_impl(&dword_1D8A54000, v60, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v57 = strtok_r(0, "\n", &__lasts);
        }
        while (v57);
        goto LABEL_93;
      }
    }
  }
  return v21;
}

- (int)setupAudioConverterWithAssetFormat:(const AudioStreamBasicDescription *)a3 audioConverter:(OpaqueAudioConverter *)a4
{
  AudioStreamBasicDescription *p_outputFormat;
  __int128 v8;
  OSStatus v9;
  UInt32 mChannelsPerFrame;
  AudioStreamBasicDescription *p_streamDesc;
  uint64_t v12;
  __int128 v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  char *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  char *v24;
  OSStatus v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  NSObject *v35;
  UInt32 v36;
  UInt32 v37;
  uint64_t v38;
  NSObject *v39;
  UInt32 v40;
  UInt32 v41;
  AudioStreamBasicDescription v42;
  char __str[16];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  int inPropertyData;
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  _BYTE v54[10];
  VCCannedAudioInjector *v55;
  __int16 v56;
  _BYTE v57[10];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  p_outputFormat = &self->_outputFormat;
  v8 = *(_OWORD *)&self->_outputFormat.mBytesPerPacket;
  *(_OWORD *)&v42.mSampleRate = *(_OWORD *)&self->_outputFormat.mSampleRate;
  *(_OWORD *)&v42.mBytesPerPacket = v8;
  *(_QWORD *)&v42.mBitsPerChannel = *(_QWORD *)&self->_outputFormat.mBitsPerChannel;
  v9 = AudioConverterNew(a3, &v42, a4);
  if (v9)
  {
    v26 = v9;
    v17 = -2142699505;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:].cold.1();
      }
      return v17;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v27 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v17;
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v17;
    inPropertyData = 136316418;
    v48 = v29;
    v49 = 2080;
    v50 = "-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]";
    v51 = 1024;
    v52 = 385;
    v53 = 2112;
    *(_QWORD *)v54 = v27;
    *(_WORD *)&v54[8] = 2048;
    v55 = self;
    v56 = 1024;
    *(_DWORD *)v57 = v26;
    v31 = " [%s] %s:%d %@(%p) Failed to create the audio converter! err=%d";
    v32 = v30;
    v33 = 54;
LABEL_38:
    _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&inPropertyData, v33);
    return v17;
  }
  mChannelsPerFrame = p_outputFormat->mChannelsPerFrame;
  if (mChannelsPerFrame == a3->mChannelsPerFrame)
    goto LABEL_5;
  if (mChannelsPerFrame != 1)
  {
    v17 = -2142699505;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return v17;
      v34 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return v17;
      v36 = a3->mChannelsPerFrame;
      v37 = p_outputFormat->mChannelsPerFrame;
      inPropertyData = 136316162;
      v48 = v34;
      v49 = 2080;
      v50 = "-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]";
      v51 = 1024;
      v52 = 389;
      v53 = 1024;
      *(_DWORD *)v54 = v36;
      *(_WORD *)&v54[4] = 1024;
      *(_DWORD *)&v54[6] = v37;
      v31 = " [%s] %s:%d Unable to map the asset channels=%d to output channels=%d!";
      v32 = v35;
      v33 = 40;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v28 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return v17;
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return v17;
      v40 = a3->mChannelsPerFrame;
      v41 = p_outputFormat->mChannelsPerFrame;
      inPropertyData = 136316674;
      v48 = v38;
      v49 = 2080;
      v50 = "-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]";
      v51 = 1024;
      v52 = 389;
      v53 = 2112;
      *(_QWORD *)v54 = v28;
      *(_WORD *)&v54[8] = 2048;
      v55 = self;
      v56 = 1024;
      *(_DWORD *)v57 = v40;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = v41;
      v31 = " [%s] %s:%d %@(%p) Unable to map the asset channels=%d to output channels=%d!";
      v32 = v39;
      v33 = 60;
    }
    goto LABEL_38;
  }
  inPropertyData = 1;
  AudioConverterSetProperty(*a4, 0x63686D70u, 4u, &inPropertyData);
LABEL_5:
  p_streamDesc = &self->_audioConverterProc.streamDesc;
  v12 = *(_QWORD *)&a3->mBitsPerChannel;
  v13 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_OWORD *)&self->_audioConverterProc.streamDesc.mSampleRate = *(_OWORD *)&a3->mSampleRate;
  *(_OWORD *)&self->_audioConverterProc.streamDesc.mBytesPerPacket = v13;
  *(_QWORD *)&self->_audioConverterProc.streamDesc.mBitsPerChannel = v12;
  *(_OWORD *)__str = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    v17 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v18 = FormatToCStr((uint64_t)p_streamDesc, __str, 0x40uLL);
      inPropertyData = 136315906;
      v48 = v15;
      v49 = 2080;
      v50 = "-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]";
      v51 = 1024;
      v52 = 395;
      v53 = 2080;
      *(_QWORD *)v54 = v18;
      v19 = " [%s] %s:%d streamDescription=%s";
      v20 = v16;
      v21 = 38;
LABEL_15:
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&inPropertyData, v21);
      return 0;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    v17 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v24 = FormatToCStr((uint64_t)&self->_audioConverterProc.streamDesc, __str, 0x40uLL);
      inPropertyData = 136316418;
      v48 = v22;
      v49 = 2080;
      v50 = "-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]";
      v51 = 1024;
      v52 = 395;
      v53 = 2112;
      *(_QWORD *)v54 = v14;
      *(_WORD *)&v54[8] = 2048;
      v55 = self;
      v56 = 2080;
      *(_QWORD *)v57 = v24;
      v19 = " [%s] %s:%d %@(%p) streamDescription=%s";
      v20 = v23;
      v21 = 58;
      goto LABEL_15;
    }
  }
  return v17;
}

- (int)processSampleBuffer:(opaqueCMSampleBuffer *)a3 audioConverter:(OpaqueAudioConverter *)a4 audioBuffer:(opaqueVCAudioBufferList *)a5
{
  OSStatus AudioBufferListWithRetainedBlockBuffer;
  OSStatus Property;
  OSStatus v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t AudioBufferList;
  void *v15;
  int SampleCount;
  unsigned int SampleCapacity;
  UInt32 v18;
  UInt32 mBytesPerPacket;
  int v20;
  uint64_t mNumberBuffers;
  uint64_t v22;
  void **p_mData;
  const __CFString *v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  OSStatus v32;
  const __CFString *v33;
  unsigned int v34;
  const __CFString *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  UInt32 ioOutputDataPacketSize;
  UInt32 ioPropertyDataSize;
  UInt32 outPropertyData;
  CMBlockBufferRef blockBufferOut;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  _BYTE v53[10];
  VCCannedAudioInjector *v54;
  __int16 v55;
  OSStatus v56;
  __int16 v57;
  int v58;
  __int16 v59;
  unsigned int v60;
  AudioBufferList outOutputData;
  AudioBufferList bufferListOut;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  blockBufferOut = 0;
  memset(&bufferListOut, 170, sizeof(bufferListOut));
  AudioBufferListWithRetainedBlockBuffer = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a3, 0, &bufferListOut, 0x18uLL, 0, 0, 1u, &blockBufferOut);
  if (AudioBufferListWithRetainedBlockBuffer)
  {
    v32 = AudioBufferListWithRetainedBlockBuffer;
    v25 = -2142699510;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:].cold.3();
      }
      goto LABEL_28;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v33 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v33 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_28;
    v38 = VRTraceErrorLogLevelToCSTR();
    v39 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)buf = 136316418;
    v47 = v38;
    v48 = 2080;
    v49 = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
    v50 = 1024;
    v51 = 407;
    v52 = 2112;
    *(_QWORD *)v53 = v33;
    *(_WORD *)&v53[8] = 2048;
    v54 = self;
    v55 = 1024;
    v56 = v32;
    v29 = " [%s] %s:%d %@(%p) CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer failed! err=%d";
    v30 = v39;
    v31 = 54;
LABEL_32:
    _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_28;
  }
  -[VCCannedAudioInjector setAudioConverterProcAudioBufferList:blockBuffer:](self, "setAudioConverterProcAudioBufferList:blockBuffer:", &bufferListOut, blockBufferOut);
  ioPropertyDataSize = 4;
  outPropertyData = bufferListOut.mBuffers[0].mDataByteSize;
  Property = AudioConverterGetProperty(a4, 0x636F6273u, &ioPropertyDataSize, &outPropertyData);
  if (Property)
  {
    v10 = Property;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v47 = v12;
          v48 = 2080;
          v49 = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
          v50 = 1024;
          v51 = 419;
          v52 = 2112;
          *(_QWORD *)v53 = v11;
          *(_WORD *)&v53[8] = 2048;
          v54 = self;
          v55 = 1024;
          v56 = v10;
          _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Fetching kAudioConverterPropertyCalculateOutputBufferSize failed with status=%d", buf, 0x36u);
        }
      }
    }
  }
  AudioBufferList = VCAudioBufferList_GetAudioBufferList((uint64_t)a5);
  v15 = *(void **)(AudioBufferList + 16);
  *(_OWORD *)&outOutputData.mNumberBuffers = *(_OWORD *)AudioBufferList;
  outOutputData.mBuffers[0].mData = v15;
  SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a5);
  SampleCapacity = VCAudioBufferList_GetSampleCapacity((uint64_t)a5);
  v18 = outPropertyData;
  mBytesPerPacket = self->_outputFormat.mBytesPerPacket;
  v20 = outPropertyData / mBytesPerPacket;
  ioOutputDataPacketSize = outPropertyData / mBytesPerPacket;
  if (outPropertyData / mBytesPerPacket + SampleCount > SampleCapacity)
  {
    v34 = SampleCapacity;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      v25 = -2142699517;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_28;
      v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_DWORD *)buf = 136316418;
      v47 = v36;
      v48 = 2080;
      v49 = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
      v50 = 1024;
      v51 = 427;
      v52 = 1024;
      *(_DWORD *)v53 = v34 - SampleCount;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)&v53[6] = v20;
      LOWORD(v54) = 1024;
      *(_DWORD *)((char *)&v54 + 2) = v34;
      v29 = " [%s] %s:%d Didn't preallocate enough memory for the asset! remainingSampleCapacity=%u, neededSamples=%u, totalCapacity=%u";
      v30 = v37;
      v31 = 46;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v35 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v35 = &stru_1E9E58EE0;
      v25 = -2142699517;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_28;
      v40 = VRTraceErrorLogLevelToCSTR();
      v41 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_DWORD *)buf = 136316930;
      v47 = v40;
      v48 = 2080;
      v49 = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
      v50 = 1024;
      v51 = 427;
      v52 = 2112;
      *(_QWORD *)v53 = v35;
      *(_WORD *)&v53[8] = 2048;
      v54 = self;
      v55 = 1024;
      v56 = v34 - SampleCount;
      v57 = 1024;
      v58 = v20;
      v59 = 1024;
      v60 = v34;
      v29 = " [%s] %s:%d %@(%p) Didn't preallocate enough memory for the asset! remainingSampleCapacity=%u, neededSamples"
            "=%u, totalCapacity=%u";
      v30 = v41;
      v31 = 66;
    }
    goto LABEL_32;
  }
  mNumberBuffers = outOutputData.mNumberBuffers;
  if (outOutputData.mNumberBuffers)
  {
    v22 = mBytesPerPacket * SampleCount;
    p_mData = &outOutputData.mBuffers[0].mData;
    do
    {
      *p_mData = (char *)*p_mData + v22;
      *((_DWORD *)p_mData - 1) = v18;
      p_mData += 2;
      --mNumberBuffers;
    }
    while (mNumberBuffers);
  }
  if (!AudioConverterFillComplexBuffer(a4, (AudioConverterComplexInputDataProc)_VCCannedAudioInjector_AudioConverterInput, &self->_audioConverterProc, &ioOutputDataPacketSize, &outOutputData, 0))
  {
    VCAudioBufferList_SetSampleCount((uint64_t)a5, ioOutputDataPacketSize + SampleCount);
    pthread_cond_signal(&self->_samplesConditional);
    v25 = 0;
    goto LABEL_28;
  }
  if ((VCCannedAudioInjector *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    v25 = -2142699510;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_28;
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)buf = 136316162;
    v47 = v26;
    v48 = 2080;
    v49 = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
    v50 = 1024;
    v51 = 438;
    v52 = 2112;
    *(_QWORD *)v53 = v24;
    *(_WORD *)&v53[8] = 2048;
    v54 = self;
    v29 = " [%s] %s:%d %@(%p) AudioConverterFillComplexBuffer failed!";
    v30 = v27;
    v31 = 48;
    goto LABEL_32;
  }
  v25 = -2142699510;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:].cold.1();
  }
LABEL_28:
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  return v25;
}

- (int)loadSamplesFromTrackOutput:(id)a3 audioConverter:(OpaqueAudioConverter *)a4 audioBuffer:(opaqueVCAudioBufferList *)a5
{
  uint64_t v9;
  const void *v10;
  int v11;

  v9 = objc_msgSend(a3, "copyNextSampleBuffer");
  if (v9)
  {
    v10 = (const void *)v9;
    do
    {
      v11 = -[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:](self, "processSampleBuffer:audioConverter:audioBuffer:", v10, a4, a5);
      CFRelease(v10);
      if (v11 < 0)
        break;
      v10 = (const void *)objc_msgSend(a3, "copyNextSampleBuffer");
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  -[VCCannedAudioInjector cleanupAudioConverterProc](self, "cleanupAudioConverterProc");
  return v11;
}

- (int)allocateSampleBufferWithTrackOutput:(id)a3 assetAudioFormat:(const AudioStreamBasicDescription *)a4 sampleBuffer:(opaqueVCAudioBufferList *)a5
{
  __int128 v7;
  void *v8;
  double Seconds;
  AudioStreamBasicDescription *p_outputFormat;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v20;
  _OWORD v22[2];
  _BYTE time[48];
  __int16 v24;
  int v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v22[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[1] = v7;
  v8 = (void *)objc_msgSend(a3, "track", v7, 0xAAAAAAAAAAAAAAAALL);
  if (v8)
    objc_msgSend(v8, "timeRange");
  else
    memset(v22, 0, sizeof(v22));
  *(_OWORD *)time = *(_OWORD *)((char *)v22 + 8);
  *(_QWORD *)&time[16] = *((_QWORD *)&v22[1] + 1);
  Seconds = CMTimeGetSeconds((CMTime *)time);
  p_outputFormat = &self->_outputFormat;
  v11 = ((Seconds + 1.0) * self->_outputFormat.mSampleRate);
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_15;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)time = 136316162;
    *(_QWORD *)&time[4] = v13;
    *(_WORD *)&time[12] = 2080;
    *(_QWORD *)&time[14] = "-[VCCannedAudioInjector allocateSampleBufferWithTrackOutput:assetAudioFormat:sampleBuffer:]";
    *(_WORD *)&time[22] = 1024;
    *(_DWORD *)&time[24] = 465;
    *(_WORD *)&time[28] = 1024;
    *(_DWORD *)&time[30] = v11;
    *(_WORD *)&time[34] = 2048;
    *(double *)&time[36] = Seconds;
    v15 = " [%s] %s:%d Estimated sampleCount=%u, assetTimeSeconds=%f";
    v16 = v14;
    v17 = 44;
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v12 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)time = 136316674;
      *(_QWORD *)&time[4] = v18;
      *(_WORD *)&time[12] = 2080;
      *(_QWORD *)&time[14] = "-[VCCannedAudioInjector allocateSampleBufferWithTrackOutput:assetAudioFormat:sampleBuffer:]";
      *(_WORD *)&time[22] = 1024;
      *(_DWORD *)&time[24] = 465;
      *(_WORD *)&time[28] = 2112;
      *(_QWORD *)&time[30] = v12;
      *(_WORD *)&time[38] = 2048;
      *(_QWORD *)&time[40] = self;
      v24 = 1024;
      v25 = v11;
      v26 = 2048;
      v27 = Seconds;
      v15 = " [%s] %s:%d %@(%p) Estimated sampleCount=%u, assetTimeSeconds=%f";
      v16 = v19;
      v17 = 64;
LABEL_14:
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, time, v17);
    }
  }
LABEL_15:
  v20 = *(_OWORD *)&p_outputFormat->mBytesPerPacket;
  *(_OWORD *)time = *(_OWORD *)&p_outputFormat->mSampleRate;
  *(_OWORD *)&time[16] = v20;
  *(_QWORD *)&time[32] = *(_QWORD *)&p_outputFormat->mBitsPerChannel;
  if (VCAudioBufferList_Allocate((__int128 *)time, v11, a5))
    return 0;
  else
    return -2142699517;
}

- (void)parseMediaTracksForAsset:(id)a3
{
  uint64_t v5;
  BOOL v6;
  void *v7;
  int v8;
  int v9;
  uint64_t SampleCount;
  unsigned int SampleCapacity;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  BOOL v21;
  int v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  _BOOL4 v34;
  _BOOL4 v35;
  const __CFString *v36;
  const __CFString *v37;
  int v38;
  const __CFString *v39;
  int v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  uint32_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  AudioConverterRef inAudioConverter;
  uint64_t v65;
  _OWORD v66[2];
  uint64_t v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  _BYTE v75[10];
  _BYTE v76[10];
  _BYTE v77[10];
  __int16 v78;
  double v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v67 = 0;
  memset(v66, 0, sizeof(v66));
  inAudioConverter = 0;
  v65 = 0;
  v63 = 0;
  if (objc_msgSend(a3, "statusOfValueForKey:error:", CFSTR("tracks"), 0) != 2)
  {
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.8();
      }
      goto LABEL_26;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v36 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v36 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_26;
    v47 = VRTraceErrorLogLevelToCSTR();
    v48 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136316162;
    v69 = v47;
    v70 = 2080;
    v71 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
    v72 = 1024;
    v73 = 478;
    v74 = 2112;
    *(_QWORD *)v75 = v36;
    *(_WORD *)&v75[8] = 2048;
    *(_QWORD *)v76 = self;
    v49 = " [%s] %s:%d %@(%p) Audio Track failed to load";
    goto LABEL_118;
  }
  v62 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", a3, &v62);
  if (v5)
    v6 = v62 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v7 = (void *)v5;
    v8 = +[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:](VCCannedAudioInjector, "setupReader:forAsset:assetAudioFormat:trackOutput:", v5, a3, v66, &v65);
    if (v8 < 0)
    {
      v38 = v8;
      if ((VCCannedAudioInjector *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.3();
        }
        goto LABEL_26;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v39 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v39 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_26;
      v54 = VRTraceErrorLogLevelToCSTR();
      v55 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)buf = 136316418;
      v69 = v54;
      v70 = 2080;
      v71 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
      v72 = 1024;
      v73 = 486;
      v74 = 2112;
      *(_QWORD *)v75 = v39;
      *(_WORD *)&v75[8] = 2048;
      *(_QWORD *)v76 = self;
      *(_WORD *)&v76[8] = 1024;
      *(_DWORD *)v77 = v38;
      v49 = " [%s] %s:%d %@(%p) Failed to setup the reader. result=%x";
    }
    else
    {
      v9 = -[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:](self, "setupAudioConverterWithAssetFormat:audioConverter:", v66, &inAudioConverter);
      if ((v9 & 0x80000000) == 0)
      {
        if ((objc_msgSend(v7, "startReading") & 1) != 0)
        {
          if ((-[VCCannedAudioInjector allocateSampleBufferWithTrackOutput:assetAudioFormat:sampleBuffer:](self, "allocateSampleBufferWithTrackOutput:assetAudioFormat:sampleBuffer:", v65, v66, &v63) & 0x80000000) == 0)
          {
            -[VCCannedAudioInjector loadSamplesFromTrackOutput:audioConverter:audioBuffer:](self, "loadSamplesFromTrackOutput:audioConverter:audioBuffer:", v65, inAudioConverter, v63);
            SampleCount = VCAudioBufferList_GetSampleCount(v63);
            SampleCapacity = VCAudioBufferList_GetSampleCapacity(v63);
            if ((VCCannedAudioInjector *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v13 = VRTraceErrorLogLevelToCSTR();
                v14 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316418;
                  v69 = v13;
                  v70 = 2080;
                  v71 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
                  v72 = 1024;
                  v73 = 502;
                  v74 = 1024;
                  *(_DWORD *)v75 = SampleCount;
                  *(_WORD *)&v75[4] = 1024;
                  *(_DWORD *)&v75[6] = SampleCapacity;
                  *(_WORD *)v76 = 2048;
                  *(double *)&v76[2] = 1.0 - (double)SampleCount / (double)SampleCapacity;
                  v15 = " [%s] %s:%d Used sampleCount=%u, sampleCapacity=%u, overhead=%f";
                  v16 = v14;
                  v17 = 50;
LABEL_21:
                  _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
                }
              }
            }
            else
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v12 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
              else
                v12 = &stru_1E9E58EE0;
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v18 = VRTraceErrorLogLevelToCSTR();
                v19 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316930;
                  v69 = v18;
                  v70 = 2080;
                  v71 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
                  v72 = 1024;
                  v73 = 502;
                  v74 = 2112;
                  *(_QWORD *)v75 = v12;
                  *(_WORD *)&v75[8] = 2048;
                  *(_QWORD *)v76 = self;
                  *(_WORD *)&v76[8] = 1024;
                  *(_DWORD *)v77 = SampleCount;
                  *(_WORD *)&v77[4] = 1024;
                  *(_DWORD *)&v77[6] = SampleCapacity;
                  v78 = 2048;
                  v79 = 1.0 - (double)SampleCount / (double)SampleCapacity;
                  v15 = " [%s] %s:%d %@(%p) Used sampleCount=%u, sampleCapacity=%u, overhead=%f";
                  v16 = v19;
                  v17 = 70;
                  goto LABEL_21;
                }
              }
            }
            if ((_DWORD)SampleCount)
            {
              if (self->_loopLength == -1.0)
              {
                -[VCCannedAVSync clear](self->_avSync, "clear");
                -[VCCannedAVSync addStreamWithCount:rate:](self->_avSync, "addStreamWithCount:rate:", SampleCount, self->_outputFormat.mSampleRate);
                self->_samplesInLoop = SampleCount;
              }
              -[VCCannedAudioInjector completeSetupWithSampleBuffer:](self, "completeSetupWithSampleBuffer:", &v63);
            }
            else if ((VCCannedAudioInjector *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                v45 = VRTraceErrorLogLevelToCSTR();
                v46 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.6(v45, &v63, v46);
              }
            }
            else
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v44 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
              else
                v44 = &stru_1E9E58EE0;
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                v59 = VRTraceErrorLogLevelToCSTR();
                v60 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                {
                  v61 = VCAudioBufferList_GetSampleCapacity(v63);
                  *(_DWORD *)buf = 136316674;
                  v69 = v59;
                  v70 = 2080;
                  v71 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
                  v72 = 1024;
                  v73 = 503;
                  v74 = 2112;
                  *(_QWORD *)v75 = v44;
                  *(_WORD *)&v75[8] = 2048;
                  *(_QWORD *)v76 = self;
                  *(_WORD *)&v76[8] = 1024;
                  *(_DWORD *)v77 = 0;
                  *(_WORD *)&v77[4] = 1024;
                  *(_DWORD *)&v77[6] = v61;
                  v49 = " [%s] %s:%d %@(%p) Failed to read samples. sampleCount=%u capacity=%u";
                  v52 = v60;
                  v53 = 60;
                  goto LABEL_123;
                }
              }
            }
            goto LABEL_26;
          }
          if ((VCCannedAudioInjector *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.5();
            }
            goto LABEL_26;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v43 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v43 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_26;
          v58 = VRTraceErrorLogLevelToCSTR();
          v48 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_26;
          *(_DWORD *)buf = 136316162;
          v69 = v58;
          v70 = 2080;
          v71 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
          v72 = 1024;
          v73 = 496;
          v74 = 2112;
          *(_QWORD *)v75 = v43;
          *(_WORD *)&v75[8] = 2048;
          *(_QWORD *)v76 = self;
          v49 = " [%s] %s:%d %@(%p) Failed to allocate the audio buffer.";
        }
        else
        {
          if ((VCCannedAudioInjector *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.7();
            }
            goto LABEL_26;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v42 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v42 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_26;
          v57 = VRTraceErrorLogLevelToCSTR();
          v48 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_26;
          *(_DWORD *)buf = 136316162;
          v69 = v57;
          v70 = 2080;
          v71 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
          v72 = 1024;
          v73 = 493;
          v74 = 2112;
          *(_QWORD *)v75 = v42;
          *(_WORD *)&v75[8] = 2048;
          *(_QWORD *)v76 = self;
          v49 = " [%s] %s:%d %@(%p) assetReader (audio) couldn't start reading.";
        }
LABEL_118:
        v52 = v48;
        v53 = 48;
        goto LABEL_123;
      }
      v40 = v9;
      if ((VCCannedAudioInjector *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.4();
        }
        goto LABEL_26;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v41 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v41 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_26;
      v56 = VRTraceErrorLogLevelToCSTR();
      v55 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)buf = 136316418;
      v69 = v56;
      v70 = 2080;
      v71 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
      v72 = 1024;
      v73 = 489;
      v74 = 2112;
      *(_QWORD *)v75 = v41;
      *(_WORD *)&v75[8] = 2048;
      *(_QWORD *)v76 = self;
      *(_WORD *)&v76[8] = 1024;
      *(_DWORD *)v77 = v40;
      v49 = " [%s] %s:%d %@(%p) Failed to setup the audio converter. result=%x";
    }
    v52 = v55;
    v53 = 54;
    goto LABEL_123;
  }
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.2();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v37 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v37 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v50 = VRTraceErrorLogLevelToCSTR();
      v51 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v69 = v50;
        v70 = 2080;
        v71 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
        v72 = 1024;
        v73 = 483;
        v74 = 2112;
        *(_QWORD *)v75 = v37;
        *(_WORD *)&v75[8] = 2048;
        *(_QWORD *)v76 = self;
        *(_WORD *)&v76[8] = 2112;
        *(_QWORD *)v77 = v62;
        v49 = " [%s] %s:%d %@(%p) AVAssetReader initialization for audio failed, error=%@";
        v52 = v51;
        v53 = 58;
LABEL_123:
        _os_log_error_impl(&dword_1D8A54000, v52, OS_LOG_TYPE_ERROR, v49, buf, v53);
      }
    }
  }
LABEL_26:
  v20 = -[VCCannedAudioInjector isReadyToInject](self, "isReadyToInject");
  v21 = v20;
  if (v20)
    v22 = 7;
  else
    v22 = 3;
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if (v22 > (int)VRTraceGetErrorLogLevelForModule())
      goto LABEL_46;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    v26 = *MEMORY[0x1E0CF2758];
    if (v21)
    {
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        goto LABEL_46;
      v27 = -[VCCannedAudioInjector isReadyToInject](self, "isReadyToInject");
      *(_DWORD *)buf = 136315906;
      v69 = v24;
      v70 = 2080;
      v71 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
      v72 = 1024;
      v73 = 514;
      v74 = 1024;
      *(_DWORD *)v75 = v27;
      v28 = " [%s] %s:%d isReadyToInject=%{BOOL}d";
      v29 = v25;
      v30 = 34;
LABEL_41:
      _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
      goto LABEL_46;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.1(v24, self, v25);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if (v22 <= (int)VRTraceGetErrorLogLevelForModule())
    {
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      v33 = *MEMORY[0x1E0CF2758];
      if (v21)
      {
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          goto LABEL_46;
        v34 = -[VCCannedAudioInjector isReadyToInject](self, "isReadyToInject");
        *(_DWORD *)buf = 136316418;
        v69 = v31;
        v70 = 2080;
        v71 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
        v72 = 1024;
        v73 = 514;
        v74 = 2112;
        *(_QWORD *)v75 = v23;
        *(_WORD *)&v75[8] = 2048;
        *(_QWORD *)v76 = self;
        *(_WORD *)&v76[8] = 1024;
        *(_DWORD *)v77 = v34;
        v28 = " [%s] %s:%d %@(%p) isReadyToInject=%{BOOL}d";
        v29 = v32;
        v30 = 54;
        goto LABEL_41;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v35 = -[VCCannedAudioInjector isReadyToInject](self, "isReadyToInject");
        *(_DWORD *)buf = 136316418;
        v69 = v31;
        v70 = 2080;
        v71 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
        v72 = 1024;
        v73 = 514;
        v74 = 2112;
        *(_QWORD *)v75 = v23;
        *(_WORD *)&v75[8] = 2048;
        *(_QWORD *)v76 = self;
        *(_WORD *)&v76[8] = 1024;
        *(_DWORD *)v77 = v35;
        _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) isReadyToInject=%{BOOL}d", buf, 0x36u);
      }
    }
  }
LABEL_46:
  if (inAudioConverter)
    AudioConverterDispose(inAudioConverter);
  if (v63)
    VCAudioBufferList_Destroy(&v63);
}

- (int)loadEncodedAudioSamples
{
  NSString **p_cannedMoviePath;
  uint64_t v4;
  id v5;
  id v6;
  int v7;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  NSString *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCCannedAudioInjector *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  p_cannedMoviePath = &self->_cannedMoviePath;
  v4 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_cannedMoviePath);
  v5 = objc_alloc(MEMORY[0x1E0C8B3C0]);
  v26 = *MEMORY[0x1E0C8AD90];
  v27[0] = MEMORY[0x1E0C9AAB0];
  v6 = (id)objc_msgSend(v5, "initWithURL:options:", v4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1));
  if (v6)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__VCCannedAudioInjector_loadEncodedAudioSamples__block_invoke;
    v13[3] = &unk_1E9E52238;
    v13[4] = self;
    v13[5] = v6;
    objc_msgSend(v6, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E9EFA3B8, v13);
    return 0;
  }
  else
  {
    v7 = -2142699469;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector loadEncodedAudioSamples].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v12 = *p_cannedMoviePath;
          *(_DWORD *)buf = 136316418;
          v15 = v10;
          v16 = 2080;
          v17 = "-[VCCannedAudioInjector loadEncodedAudioSamples]";
          v18 = 1024;
          v19 = 527;
          v20 = 2112;
          v21 = v9;
          v22 = 2048;
          v23 = self;
          v24 = 2112;
          v25 = v12;
          _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Initialization of (audio) AVURLAsset for cannedMoviePath=%@ failed", buf, 0x3Au);
        }
      }
    }
  }
  return v7;
}

uint64_t __48__VCCannedAudioInjector_loadEncodedAudioSamples__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_msgSend(*(id *)(a1 + 32), "parseMediaTracksForAsset:", *(_QWORD *)(a1 + 40));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_DWORD *)(v5 + 168);
      v7 = *(_QWORD *)(v5 + 408);
      v8 = *(_DWORD *)(v5 + 400);
      v10 = 136316674;
      v11 = v3;
      v12 = 2080;
      v13 = "-[VCCannedAudioInjector loadEncodedAudioSamples]_block_invoke";
      v14 = 1024;
      v15 = 532;
      v16 = 2112;
      v17 = v5;
      v18 = 1024;
      v19 = v6;
      v20 = 2048;
      v21 = v7;
      v22 = 1024;
      v23 = v8;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d injector=%@, _audioSampleCount=%d, _loopLength=%f, _samplesInLoop=%d", (uint8_t *)&v10, 0x3Cu);
    }
  }
  return objc_msgSend(v2, "drain");
}

+ (id)defaultAudioFileNameWithFormat:(const AudioStreamBasicDescription *)a3
{
  if ((a3->mFormatFlags & 1) == 0)
    return CFSTR("1x22050.raw");
  if (a3->mSampleRate == 22050.0)
    return CFSTR("1x22050-flt.raw");
  if (a3->mSampleRate == 24000.0)
    return CFSTR("1x24000-flt.raw");
  return 0;
}

- (int)loadRawAudioSamples
{
  AudioStreamBasicDescription *p_outputFormat;
  id v4;
  void *v5;
  VCCannedAudioInjector *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t mBytesPerFrame;
  __int128 v19;
  uint64_t AudioBufferList;
  unint64_t v21;
  int v22;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  _BYTE buf[40];
  VCCannedAudioInjector *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  p_outputFormat = &self->_outputFormat;
  v4 = +[VCCannedAudioInjector defaultAudioFileNameWithFormat:](VCCannedAudioInjector, "defaultAudioFileNameWithFormat:", &self->_outputFormat);
  if (!v4)
  {
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      v22 = -2142699510;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCCannedAudioInjector loadRawAudioSamples].cold.1();
LABEL_48:
          v16 = 0;
          v5 = 0;
          v22 = -2142699510;
          goto LABEL_17;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      v22 = -2142699510;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v28;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector loadRawAudioSamples]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 565;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v24;
          *(_WORD *)&buf[38] = 2048;
          v38 = self;
          _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to retrieve audio file name", buf, 0x30u);
          goto LABEL_48;
        }
      }
    }
LABEL_53:
    v16 = 0;
    v5 = 0;
    goto LABEL_17;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), self->_cannedMoviePath, v4);
  v6 = (VCCannedAudioInjector *)objc_opt_class();
  if (!v5)
  {
    if (v6 == self)
    {
      v22 = -2142699517;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector loadRawAudioSamples].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v25 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v25 = &stru_1E9E58EE0;
      v22 = -2142699517;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector loadRawAudioSamples]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 568;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v25;
          *(_WORD *)&buf[38] = 2048;
          v38 = self;
          _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the asset path", buf, 0x30u);
        }
      }
    }
    goto LABEL_53;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector loadRawAudioSamples]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 571;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v5;
        v10 = " [%s] %s:%d reading sample data from assetPath=%@";
        v11 = v9;
        v12 = 38;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector loadRawAudioSamples]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 571;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v7;
        *(_WORD *)&buf[38] = 2048;
        v38 = self;
        v39 = 2112;
        v40 = v5;
        v10 = " [%s] %s:%d %@(%p) reading sample data from assetPath=%@";
        v11 = v14;
        v12 = 58;
        goto LABEL_13;
      }
    }
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithContentsOfFile:", v5);
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(v15, "length");
    mBytesPerFrame = self->_outputFormat.mBytesPerFrame;
    v19 = *(_OWORD *)&self->_outputFormat.mBytesPerPacket;
    *(_OWORD *)buf = *(_OWORD *)&p_outputFormat->mSampleRate;
    *(_OWORD *)&buf[16] = v19;
    *(_QWORD *)&buf[32] = *(_QWORD *)&self->_outputFormat.mBitsPerChannel;
    if ((VCAudioBufferList_Allocate((__int128 *)buf, v17 / mBytesPerFrame, &v36) & 1) != 0)
    {
      AudioBufferList = VCAudioBufferList_GetAudioBufferList(v36);
      v21 = objc_msgSend(v16, "length") / (unint64_t)self->_outputFormat.mBytesPerFrame;
      objc_msgSend(v16, "getBytes:length:", *(_QWORD *)(AudioBufferList + 16), objc_msgSend(v16, "length"));
      *(_DWORD *)(AudioBufferList + 12) = objc_msgSend(v16, "length");
      VCAudioBufferList_SetSampleCount(v36, v21);
      -[VCCannedAVSync addStreamWithCount:rate:](self->_avSync, "addStreamWithCount:rate:", v21, p_outputFormat->mSampleRate);
      -[VCCannedAudioInjector completeSetupWithSampleBuffer:](self, "completeSetupWithSampleBuffer:", &v36);
      v22 = 0;
    }
    else
    {
      v22 = -2142699517;
      if ((VCCannedAudioInjector *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCannedAudioInjector loadRawAudioSamples].cold.4();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v27 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v27 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v34 = VRTraceErrorLogLevelToCSTR();
          v35 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v34;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector loadRawAudioSamples]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 576;
            *(_WORD *)&buf[28] = 2112;
            *(_QWORD *)&buf[30] = v27;
            *(_WORD *)&buf[38] = 2048;
            v38 = self;
            _os_log_error_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the sampleBuffer", buf, 0x30u);
          }
        }
      }
    }
  }
  else
  {
    v22 = -2142699517;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector loadRawAudioSamples].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v26 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v26 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector loadRawAudioSamples]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 573;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v26;
          *(_WORD *)&buf[38] = 2048;
          v38 = self;
          _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to load the asset data", buf, 0x30u);
        }
      }
    }
    v16 = 0;
  }
LABEL_17:
  if (v36)
    VCAudioBufferList_Destroy(&v36);

  return v22;
}

- (int)setupSineInjectionWithConfig:(id)a3
{
  AudioStreamBasicDescription *p_outputFormat;
  double mSampleRate;
  double v7;
  double v8;
  double v9;
  int v10;
  uint64_t v11;
  __int128 v12;
  _DWORD *AudioBufferList;
  double *SampleFormat;
  unsigned int Timestamp;
  double v16;
  double v17;
  unsigned int v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t *v22;
  uint64_t v23;
  unsigned int v24;
  double v25;
  float v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  NSObject *v37;
  const __CFString *v39;
  const __CFString *v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  _BYTE buf[40];
  VCCannedAudioInjector *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  p_outputFormat = &self->_outputFormat;
  mSampleRate = self->_outputFormat.mSampleRate;
  objc_msgSend(a3, "startHostTime");
  v8 = v7;
  objc_msgSend(a3, "loopLength");
  v10 = -[VCCannedAudioInjector setupAVSyncWithStartHostTime:loopLength:](self, "setupAVSyncWithStartHostTime:loopLength:", v8, v9);
  if (v10 < 0)
  {
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector setupSineInjectionWithConfig:].cold.1();
      }
      goto LABEL_20;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v39 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v39 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_20;
    v41 = VRTraceErrorLogLevelToCSTR();
    v42 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = v41;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector setupSineInjectionWithConfig:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 603;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v39;
    *(_WORD *)&buf[38] = 2048;
    v50 = self;
    v51 = 1024;
    v52 = v10;
    v43 = " [%s] %s:%d %@(%p) Failed to setup the AV sync. result=%x";
    v44 = v42;
    v45 = 54;
LABEL_41:
    _os_log_error_impl(&dword_1D8A54000, v44, OS_LOG_TYPE_ERROR, v43, buf, v45);
    goto LABEL_20;
  }
  v11 = mSampleRate;
  v12 = *(_OWORD *)&p_outputFormat->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&p_outputFormat->mSampleRate;
  *(_OWORD *)&buf[16] = v12;
  *(_QWORD *)&buf[32] = *(_QWORD *)&p_outputFormat->mBitsPerChannel;
  if ((VCAudioBufferList_Allocate((__int128 *)buf, mSampleRate, &v48) & 1) == 0)
  {
    v10 = -2142699517;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCannedAudioInjector setupSineInjectionWithConfig:].cold.2();
      }
      goto LABEL_20;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v40 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v40 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_20;
    v46 = VRTraceErrorLogLevelToCSTR();
    v47 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v46;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector setupSineInjectionWithConfig:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 606;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v40;
    *(_WORD *)&buf[38] = 2048;
    v50 = self;
    v43 = " [%s] %s:%d %@(%p) Failed to allocate the audio buffer.";
    v44 = v47;
    v45 = 48;
    goto LABEL_41;
  }
  AudioBufferList = (_DWORD *)VCAudioBufferList_GetAudioBufferList(v48);
  SampleFormat = (double *)VCAudioBufferList_GetSampleFormat(v48);
  Timestamp = VCAudioBufferList_GetTimestamp(v48);
  objc_msgSend(a3, "sineWaveAmplitude");
  v17 = v16;
  v18 = objc_msgSend(a3, "sineWaveFrequencyHz");
  if ((_DWORD)v11)
  {
    v19 = 0;
    v20 = (double)v18;
    v21 = *SampleFormat;
    v24 = *AudioBufferList;
    v22 = (uint64_t *)(AudioBufferList + 4);
    v23 = v24;
    do
    {
      v25 = sin((float)((float)Timestamp + (float)v19) * 6.28318531 * v20 / v21);
      if ((_DWORD)v23)
      {
        v26 = v17 * v25;
        v27 = v23;
        v28 = v22;
        do
        {
          v29 = *v28;
          v28 += 2;
          *(float *)(v29 + 4 * v19) = v26;
          --v27;
        }
        while (v27);
      }
      ++v19;
    }
    while (v19 != v11);
  }
  VCAudioBufferList_SetSampleCount(v48, mSampleRate);
  -[VCCannedAudioInjector completeSetupWithSampleBuffer:](self, "completeSetupWithSampleBuffer:", &v48);
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector setupSineInjectionWithConfig:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 622;
        v33 = " [%s] %s:%d Successfully setup sine injection.";
        v34 = v32;
        v35 = 28;
LABEL_19:
        _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v30 = (const __CFString *)-[VCCannedAudioInjector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v30 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCCannedAudioInjector setupSineInjectionWithConfig:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 622;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v30;
        *(_WORD *)&buf[38] = 2048;
        v50 = self;
        v33 = " [%s] %s:%d %@(%p) Successfully setup sine injection.";
        v34 = v37;
        v35 = 48;
        goto LABEL_19;
      }
    }
  }
LABEL_20:
  VCAudioBufferList_Destroy(&v48);
  return v10;
}

- (unsigned)samplesInLoop
{
  return self->_samplesInLoop;
}

- (BOOL)isReadyToInject
{
  return self->_isReadyToInject;
}

- (void)setIsReadyToInject:(BOOL)a3
{
  self->_isReadyToInject = a3;
}

- (void)initWithConfig:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCannedAudioInjector initWithConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the injector. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector initWithConfig:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Config is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAssetInjectionWithConfig:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the AV sync. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector setupAssetInjectionWithConfig:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupAssetInjectionWithConfig:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to load the audio samples. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector setupAssetInjectionWithConfig:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupAssetInjectionWithConfig:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Audio file not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAssetInjectionWithConfig:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid asset type. assetType=%d", v2, v3, v4, 189);
  OUTLINED_FUNCTION_3();
}

+ (void)isAudioAvailable:fileName:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d audio is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)isAudioAvailable:(NSObject *)a3 fileName:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[24];
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "absoluteString"))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "absoluteString"), "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  v9 = 263;
  v10 = v5;
  v11 = v6;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v7, " [%s] %s:%d Initialization of (audio) AVURLAsset for %s failed", v8);
}

+ (void)setupReader:forAsset:assetAudioFormat:trackOutput:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate read settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioConverterWithAssetFormat:audioConverter:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the audio converter! err=%d", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)processSampleBuffer:audioConverter:audioBuffer:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AudioConverterFillComplexBuffer failed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processSampleBuffer:audioConverter:audioBuffer:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Fetching kAudioConverterPropertyCalculateOutputBufferSize failed with status=%d", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)processSampleBuffer:audioConverter:audioBuffer:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer failed! err=%d", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)parseMediaTracksForAsset:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v4;
  int v5;
  uint8_t v6[14];
  const char *v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "isReadyToInject");
  OUTLINED_FUNCTION_12_0();
  v7 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
  OUTLINED_FUNCTION_4();
  v8 = 514;
  v9 = v4;
  v10 = v5;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d isReadyToInject=%{BOOL}d", v6, 0x22u);
  OUTLINED_FUNCTION_3_0();
}

- (void)parseMediaTracksForAsset:.cold.2()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d AVAssetReader initialization for audio failed, error=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)parseMediaTracksForAsset:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the reader. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector parseMediaTracksForAsset:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)parseMediaTracksForAsset:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the audio converter. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector parseMediaTracksForAsset:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)parseMediaTracksForAsset:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the audio buffer.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)parseMediaTracksForAsset:(NSObject *)a3 .cold.6(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  __int16 v4;
  int v5;
  uint8_t v6[14];
  const char *v7;
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  VCAudioBufferList_GetSampleCapacity(*a2);
  OUTLINED_FUNCTION_12_0();
  v7 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
  OUTLINED_FUNCTION_4();
  v8 = 503;
  v9 = v4;
  v10 = 0;
  v11 = v4;
  v12 = v5;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to read samples. sampleCount=%u capacity=%u", v6, 0x28u);
  OUTLINED_FUNCTION_3_0();
}

- (void)parseMediaTracksForAsset:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d assetReader (audio) couldn't start reading.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)parseMediaTracksForAsset:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Audio Track failed to load", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)loadEncodedAudioSamples
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Initialization of (audio) AVURLAsset for cannedMoviePath=%@ failed", v1);
  OUTLINED_FUNCTION_3();
}

- (void)loadRawAudioSamples
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the sampleBuffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupSineInjectionWithConfig:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCannedAudioInjector setupSineInjectionWithConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the AV sync. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector setupSineInjectionWithConfig:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupSineInjectionWithConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the audio buffer.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
