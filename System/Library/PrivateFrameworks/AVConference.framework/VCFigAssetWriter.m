@implementation VCFigAssetWriter

- (VCFigAssetWriter)initWithOutputURL:(id)a3 transactionID:(id)a4 videoCodec:(unsigned int)a5 keyFrameIntervalDuration:(double)a6
{
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  CFMutableArrayRef Mutable;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  __int128 v27;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BYTE v36[18];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)VCFigAssetWriter;
  v10 = -[VCObject init](&v28, sel_init);
  if (!v10)
    return (VCFigAssetWriter *)v10;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:].cold.1();
    }
    goto LABEL_15;
  }
  *((_QWORD *)v10 + 26) = objc_msgSend(a3, "copy");
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:].cold.2();
    }
    goto LABEL_15;
  }
  *((_QWORD *)v10 + 25) = objc_msgSend(a4, "copy");
  v11 = MEMORY[0x1E0CA2E18];
  v27 = *MEMORY[0x1E0CA2E18];
  *((_OWORD *)v10 + 11) = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(v11 + 16);
  *((_QWORD *)v10 + 24) = v12;
  *((_DWORD *)v10 + 56) = 0;
  *((_DWORD *)v10 + 55) = 0;
  *((_DWORD *)v10 + 54) = 0;
  v13 = FigSandboxRegisterURLWithProcess();
  if (v13)
    v14 = 3;
  else
    v14 = 7;
  if (v14 <= (int)VRTraceGetErrorLogLevelForModule())
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    v21 = *MEMORY[0x1E0CF2758];
    if (v13)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)*((_QWORD *)v10 + 26);
        if (v25)
          v26 = (const char *)objc_msgSend((id)objc_msgSend(v25, "description"), "UTF8String");
        else
          v26 = "<nil>";
        *(_DWORD *)buf = 136316162;
        v30 = v19;
        v31 = 2080;
        v32 = "-[VCFigAssetWriter initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:]";
        v33 = 1024;
        v34 = 87;
        v35 = 1024;
        *(_DWORD *)v36 = v13;
        *(_WORD *)&v36[4] = 2080;
        *(_QWORD *)&v36[6] = v26;
        _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d FigSandboxRegisterURLWithProcess returned err=%d for outputURL=%s", buf, 0x2Cu);
      }
      goto LABEL_15;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)*((_QWORD *)v10 + 26);
      if (v23)
        v24 = (const char *)objc_msgSend((id)objc_msgSend(v23, "description"), "UTF8String");
      else
        v24 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v30 = v19;
      v31 = 2080;
      v32 = "-[VCFigAssetWriter initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:]";
      v33 = 1024;
      v34 = 87;
      v35 = 1024;
      *(_DWORD *)v36 = 0;
      *(_WORD *)&v36[4] = 2080;
      *(_QWORD *)&v36[6] = v24;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FigSandboxRegisterURLWithProcess returned err=%d for outputURL=%s", buf, 0x2Cu);
    }
  }
  else if (v13)
  {
LABEL_15:

    return 0;
  }
  v10[256] = 2;
  *((_DWORD *)v10 + 65) = 0;
  *((_DWORD *)v10 + 66) = 0;
  *((_DWORD *)v10 + 81) = 0;
  v10[257] = 0;
  *((_DWORD *)v10 + 80) = a5;
  *((double *)v10 + 41) = a6;
  *(_OWORD *)(v10 + 344) = v27;
  *((_QWORD *)v10 + 45) = v12;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  *((_QWORD *)v10 + 34) = Mutable;
  if (!Mutable)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:].cold.3();
    }
    goto LABEL_15;
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCFigAssetWriter-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v18 = FourccToCStr(*((_DWORD *)v10 + 80));
      *(_DWORD *)buf = 136316162;
      v30 = v16;
      v31 = 2080;
      v32 = "-[VCFigAssetWriter initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:]";
      v33 = 1024;
      v34 = 101;
      v35 = 2048;
      *(_QWORD *)v36 = v10;
      *(_WORD *)&v36[8] = 2080;
      *(_QWORD *)&v36[10] = v18;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCFigAssetWriter-init (%p) codec=%s", buf, 0x30u);
    }
  }
  return (VCFigAssetWriter *)v10;
}

- (void)setupWriterWithMode:(unsigned __int8)a3
{
  self->_writerMode = a3;
  -[VCFigAssetWriter _setupWriter](self, "_setupWriter");
}

- (int)_setupWriter
{
  id v3;
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  OpaqueFigAssetWriter **p_assetWriter;
  int v7;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  NSURL *outputURL;
  const char *v12;
  $95D729B680665BEAEFA1D6FCA8238556 *p_movieFragmentInterval;
  uint64_t v14;
  NSObject *v15;
  Float64 Seconds;
  CFDictionaryRef v17;
  OpaqueFigAssetWriter *v18;
  uint64_t (*v19)(OpaqueFigAssetWriter *, _QWORD, CFDictionaryRef);
  int v20;
  OpaqueFigAssetWriter *v21;
  uint64_t (*v22)(OpaqueFigAssetWriter *, _QWORD, _QWORD, int *);
  int v23;
  OpaqueFigAssetWriter *v24;
  uint64_t (*v25)(OpaqueFigAssetWriter *, _QWORD, _QWORD, int *);
  int v26;
  uint64_t v27;
  const __CFString *v28;
  OpaqueFigAssetWriter *v29;
  uint64_t (*v30)(OpaqueFigAssetWriter *, uint64_t, int *);
  int *p_metadataTrackID;
  int v32;
  OpaqueFigAssetWriter *v33;
  uint64_t v34;
  unsigned int (*v35)(OpaqueFigAssetWriter *, uint64_t, _QWORD, void *);
  OpaqueFigAssetWriter *v36;
  uint64_t v37;
  unsigned int (*v38)(OpaqueFigAssetWriter *, uint64_t, _QWORD, _QWORD);
  __CFArray *v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  NSObject *v43;
  int v44;
  int v45;
  uint64_t v46;
  NSObject *v47;
  NSURL *v48;
  const char *v49;
  int v50;
  uint64_t v51;
  NSURL *v52;
  const char *v53;
  int v54;
  uint64_t v55;
  NSURL *v56;
  const char *v57;
  const char *v58;
  CMTime buf;
  int v61;
  __int16 v62;
  _WORD v63[17];

  *(_QWORD *)&v63[13] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC3CF0], (const void *)*MEMORY[0x1E0C9AE50]);
  CFRunLoopGetCurrent();
  p_assetWriter = &self->_assetWriter;
  v7 = FigAssetWriterCreateWithURL();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v7)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter _setupWriter].cold.5();
    }
    goto LABEL_71;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      outputURL = self->_outputURL;
      if (outputURL)
        v12 = (const char *)objc_msgSend((id)-[NSURL description](outputURL, "description"), "UTF8String");
      else
        v12 = "<nil>";
      LODWORD(buf.value) = 136315906;
      *(CMTimeValue *)((char *)&buf.value + 4) = v9;
      LOWORD(buf.flags) = 2080;
      *(_QWORD *)((char *)&buf.flags + 2) = "-[VCFigAssetWriter _setupWriter]";
      HIWORD(buf.epoch) = 1024;
      v61 = 126;
      v62 = 2080;
      *(_QWORD *)v63 = v12;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d created FigAssetWriter for outputPath=%s", (uint8_t *)&buf, 0x26u);
    }
  }
  p_movieFragmentInterval = &self->_movieFragmentInterval;
  if ((self->_movieFragmentInterval.flags & 1) == 0)
    goto LABEL_16;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)&buf.value = *(_OWORD *)&p_movieFragmentInterval->value;
      buf.epoch = self->_movieFragmentInterval.epoch;
      Seconds = CMTimeGetSeconds(&buf);
      LODWORD(buf.value) = 136315906;
      *(CMTimeValue *)((char *)&buf.value + 4) = v14;
      LOWORD(buf.flags) = 2080;
      *(_QWORD *)((char *)&buf.flags + 2) = "-[VCFigAssetWriter _setupWriter]";
      HIWORD(buf.epoch) = 1024;
      v61 = 130;
      v62 = 2048;
      *(Float64 *)v63 = Seconds;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting movieFragmentInterval=%f", (uint8_t *)&buf, 0x26u);
    }
  }
  *(_OWORD *)&buf.value = *(_OWORD *)&p_movieFragmentInterval->value;
  buf.epoch = self->_movieFragmentInterval.epoch;
  v17 = CMTimeCopyAsDictionary(&buf, v4);
  v18 = *p_assetWriter;
  v19 = *(uint64_t (**)(OpaqueFigAssetWriter *, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 16)
                                                                                  + 56);
  if (v19)
  {
    v20 = v19(v18, *MEMORY[0x1E0CC4488], v17);
    if (!v17)
      goto LABEL_15;
    goto LABEL_14;
  }
  v20 = -12782;
  if (v17)
LABEL_14:
    CFRelease(v17);
LABEL_15:
  if (v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter _setupWriter].cold.4();
    }
    goto LABEL_71;
  }
LABEL_16:
  if (!VCMediaWriterUtil_IsMediaExpected(1, self->_writerMode))
    goto LABEL_20;
  v21 = *p_assetWriter;
  v22 = *(uint64_t (**)(OpaqueFigAssetWriter *, _QWORD, _QWORD, int *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 24);
  if (!v22)
  {
    v45 = -12782;
    goto LABEL_44;
  }
  v23 = v22(v21, *MEMORY[0x1E0CC3DE8], 0, &self->_localAudioTrackID);
  if (v23)
  {
    v45 = v23;
LABEL_44:
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_71;
    v46 = VRTraceErrorLogLevelToCSTR();
    v47 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_71;
    v48 = self->_outputURL;
    if (v48)
      v49 = (const char *)objc_msgSend((id)-[NSURL description](v48, "description"), "UTF8String");
    else
      v49 = "<nil>";
    LODWORD(buf.value) = 136316162;
    *(CMTimeValue *)((char *)&buf.value + 4) = v46;
    LOWORD(buf.flags) = 2080;
    *(_QWORD *)((char *)&buf.flags + 2) = "-[VCFigAssetWriter _setupWriter]";
    HIWORD(buf.epoch) = 1024;
    v61 = 139;
    v62 = 1024;
    *(_DWORD *)v63 = v45;
    v63[2] = 2080;
    *(_QWORD *)&v63[3] = v49;
    v58 = " [%s] %s:%d FigAssetWriterAddAudioTrackWithPresetCompression local audio error=%d outputURL=%s";
    goto LABEL_70;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("localAudioTrackID=%d"), self->_localAudioTrackID);
LABEL_20:
  if (!VCMediaWriterUtil_IsMediaExpected(2, self->_writerMode))
    goto LABEL_26;
  v24 = *p_assetWriter;
  v25 = *(uint64_t (**)(OpaqueFigAssetWriter *, _QWORD, _QWORD, int *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 24);
  if (!v25)
  {
    v50 = -12782;
    goto LABEL_49;
  }
  v26 = v25(v24, *MEMORY[0x1E0CC3DE8], 0, &self->_remoteAudioTrackID);
  if (v26)
  {
    v50 = v26;
LABEL_49:
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_71;
    v51 = VRTraceErrorLogLevelToCSTR();
    v47 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_71;
    v52 = self->_outputURL;
    if (v52)
      v53 = (const char *)objc_msgSend((id)-[NSURL description](v52, "description"), "UTF8String");
    else
      v53 = "<nil>";
    LODWORD(buf.value) = 136316162;
    *(CMTimeValue *)((char *)&buf.value + 4) = v51;
    LOWORD(buf.flags) = 2080;
    *(_QWORD *)((char *)&buf.flags + 2) = "-[VCFigAssetWriter _setupWriter]";
    HIWORD(buf.epoch) = 1024;
    v61 = 144;
    v62 = 1024;
    *(_DWORD *)v63 = v50;
    v63[2] = 2080;
    *(_QWORD *)&v63[3] = v53;
    v58 = " [%s] %s:%d FigAssetWriterAddAudioTrackWithPresetCompression remote audio error=%d outputURL=%s";
    goto LABEL_70;
  }
  v27 = objc_msgSend(v3, "length");
  v28 = CFSTR(", ");
  if (!v27)
    v28 = &stru_1E9E58EE0;
  objc_msgSend(v3, "appendFormat:", CFSTR("%@remoteAudioTrackID=%d"), v28, self->_remoteAudioTrackID);
LABEL_26:
  if (self->_writerMode - 1 > 1)
    goto LABEL_37;
  v29 = *p_assetWriter;
  v30 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 8);
  if (!v30)
  {
    v54 = -12782;
    goto LABEL_54;
  }
  p_metadataTrackID = &self->_metadataTrackID;
  v32 = v30(v29, 1835365473, &self->_metadataTrackID);
  if (v32)
  {
    v54 = v32;
LABEL_54:
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_71;
    v55 = VRTraceErrorLogLevelToCSTR();
    v47 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_71;
    v56 = self->_outputURL;
    if (v56)
      v57 = (const char *)objc_msgSend((id)-[NSURL description](v56, "description"), "UTF8String");
    else
      v57 = "<nil>";
    LODWORD(buf.value) = 136316162;
    *(CMTimeValue *)((char *)&buf.value + 4) = v55;
    LOWORD(buf.flags) = 2080;
    *(_QWORD *)((char *)&buf.flags + 2) = "-[VCFigAssetWriter _setupWriter]";
    HIWORD(buf.epoch) = 1024;
    v61 = 149;
    v62 = 1024;
    *(_DWORD *)v63 = v54;
    v63[2] = 2080;
    *(_QWORD *)&v63[3] = v57;
    v58 = " [%s] %s:%d FigAssetWriterAddNativeTrack metadata error=%d outputURL=%s";
LABEL_70:
    _os_log_error_impl(&dword_1D8A54000, v47, OS_LOG_TYPE_ERROR, v58, (uint8_t *)&buf, 0x2Cu);
LABEL_71:
    v44 = 4;
    goto LABEL_72;
  }
  v33 = *p_assetWriter;
  v34 = *p_metadataTrackID;
  v35 = *(unsigned int (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 64);
  if (!v35 || v35(v33, v34, *MEMORY[0x1E0CC45F0], &unk_1E9EF6FC8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter _setupWriter].cold.1();
    }
    goto LABEL_71;
  }
  v36 = *p_assetWriter;
  v37 = *p_metadataTrackID;
  v38 = *(unsigned int (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 64);
  if (!v38 || v38(v36, v37, *MEMORY[0x1E0CC45B0], *MEMORY[0x1E0C9AE40]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter _setupWriter].cold.2();
    }
    goto LABEL_71;
  }
  -[VCFigAssetWriter writeIdentifierMetadata:](self, "writeIdentifierMetadata:", self->_transactionID);
  v39 = CFArrayCreateMutable(v4, 0, MEMORY[0x1E0C9B378]);
  self->_earlyRemoteAudioBuffers = v39;
  if (!v39)
  {
    v44 = 3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter _setupWriter].cold.3();
    }
    goto LABEL_72;
  }
  v40 = objc_msgSend(v3, "length");
  v41 = CFSTR(", ");
  if (!v40)
    v41 = &stru_1E9E58EE0;
  objc_msgSend(v3, "appendFormat:", CFSTR("%@metadataTrackID=%d"), v41, *p_metadataTrackID);
LABEL_37:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v42 = VRTraceErrorLogLevelToCSTR();
    v43 = *MEMORY[0x1E0CF2758];
    v44 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_72;
    LODWORD(buf.value) = 136315906;
    *(CMTimeValue *)((char *)&buf.value + 4) = v42;
    LOWORD(buf.flags) = 2080;
    *(_QWORD *)((char *)&buf.flags + 2) = "-[VCFigAssetWriter _setupWriter]";
    HIWORD(buf.epoch) = 1024;
    v61 = 161;
    v62 = 2112;
    *(_QWORD *)v63 = v3;
    _os_log_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", (uint8_t *)&buf, 0x26u);
  }
  v44 = 0;
LABEL_72:

  if (Mutable)
    CFRelease(Mutable);
  return v44;
}

- (void)dealloc
{
  __CFArray *earlyLocalAudioBuffers;
  __CFArray *earlyRemoteAudioBuffers;
  OpaqueVTPixelTransferSession *transferSession;
  OpaqueVTPixelTransferSession *v6;
  OpaqueVTCompressionSession *compressionSession;
  OpaqueVTCompressionSession *v8;
  __CVPixelBufferPool *bufferPool;
  uint64_t v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  VCFigAssetWriter *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[VCFigAssetWriter finishWritingWithHandler:](self, "finishWritingWithHandler:", 0);

  earlyLocalAudioBuffers = self->_earlyLocalAudioBuffers;
  if (earlyLocalAudioBuffers)
    CFRelease(earlyLocalAudioBuffers);
  earlyRemoteAudioBuffers = self->_earlyRemoteAudioBuffers;
  if (earlyRemoteAudioBuffers)
    CFRelease(earlyRemoteAudioBuffers);
  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    v6 = self->_transferSession;
    if (v6)
    {
      CFRelease(v6);
      self->_transferSession = 0;
    }
  }
  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    VTCompressionSessionInvalidate(compressionSession);
    v8 = self->_compressionSession;
    if (v8)
    {
      CFRelease(v8);
      self->_compressionSession = 0;
    }
  }
  bufferPool = self->_bufferPool;
  if (bufferPool)
  {
    CVPixelBufferPoolRelease(bufferPool);
    self->_bufferPool = 0;
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCFigAssetWriter-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v14 = v10;
      v15 = 2080;
      v16 = "-[VCFigAssetWriter dealloc]";
      v17 = 1024;
      v18 = 189;
      v19 = 2048;
      v20 = self;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCFigAssetWriter-dealloc (%p)", buf, 0x26u);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)VCFigAssetWriter;
  -[VCObject dealloc](&v12, sel_dealloc);
}

- (void)setupLivePhotoStillImageCameraStatusBit:(unsigned __int8)a3 resize:(BOOL)a4 imageSize:(CGSize)a5
{
  double height;
  double width;

  self->_stillImageCameraStatusBit = a3;
  self->_resize = a4;
  if (a4)
  {
    height = a5.height;
    width = a5.width;
    self->_transferSession = (OpaqueVTPixelTransferSession *)VCMediaRecorderUtil_AllocTransferSession();
    VCMediaRecorderUtil_SetupBufferPool(CFSTR("AVConference:FigAssetWriter"), &self->_bufferPool, width, height);
  }
}

- (void)finishWritingWithHandler:(id)a3
{
  OpaqueVTCompressionSession *compressionSession;
  OpaqueVTCompressionSession *v6;
  OpaqueFigAssetWriter *assetWriter;
  uint64_t v8;
  NSObject *v9;
  NSURL *outputURL;
  const char *v11;
  OpaqueFigAssetWriter *v12;
  uint64_t v13;
  uint64_t (*v14)(OpaqueFigAssetWriter *, uint64_t);
  int v15;
  OpaqueFigAssetWriter *v16;
  uint64_t (*v17)(OpaqueFigAssetWriter *);
  int v18;
  uint64_t FigBaseObject;
  uint64_t (*v20)(uint64_t);
  int v21;
  uint64_t v22;
  NSObject *v23;
  NSURL *v24;
  const char *v25;
  uint64_t v26;
  NSURL *v27;
  const char *v28;
  uint64_t v29;
  NSURL *v30;
  const char *v31;
  const char *v32;
  CMTime v33;
  int v34;
  __int16 v35;
  _WORD v36[17];

  *(_QWORD *)&v36[13] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    v33 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    VTCompressionSessionCompleteFrames(compressionSession, &v33);
    VTCompressionSessionInvalidate(self->_compressionSession);
    v6 = self->_compressionSession;
    if (v6)
    {
      CFRelease(v6);
      self->_compressionSession = 0;
    }
  }
  assetWriter = self->_assetWriter;
  if (!assetWriter)
    goto LABEL_19;
  self->_state = 2;
  -[VCFigAssetWriter setStillImageTimeInternal](self, "setStillImageTimeInternal");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      outputURL = self->_outputURL;
      if (outputURL)
        v11 = (const char *)objc_msgSend((id)-[NSURL description](outputURL, "description"), "UTF8String");
      else
        v11 = "<nil>";
      LODWORD(v33.value) = 136315906;
      *(CMTimeValue *)((char *)&v33.value + 4) = v8;
      LOWORD(v33.flags) = 2080;
      *(_QWORD *)((char *)&v33.flags + 2) = "-[VCFigAssetWriter finishWritingWithHandler:]";
      HIWORD(v33.epoch) = 1024;
      v34 = 216;
      v35 = 2080;
      *(_QWORD *)v36 = v11;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d finishWritingWithHandler for path=%s", (uint8_t *)&v33, 0x26u);
    }
  }
  v12 = self->_assetWriter;
  v13 = -[VCFigAssetWriter trackIDForWriterMode:](self, "trackIDForWriterMode:", self->_writerMode);
  v14 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 104);
  if (!v14)
  {
    v15 = -12782;
LABEL_25:
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_38;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    v24 = self->_outputURL;
    if (v24)
      v25 = (const char *)objc_msgSend((id)-[NSURL description](v24, "description"), "UTF8String");
    else
      v25 = "<nil>";
    LODWORD(v33.value) = 136316162;
    *(CMTimeValue *)((char *)&v33.value + 4) = v22;
    LOWORD(v33.flags) = 2080;
    *(_QWORD *)((char *)&v33.flags + 2) = "-[VCFigAssetWriter finishWritingWithHandler:]";
    HIWORD(v33.epoch) = 1024;
    v34 = 218;
    v35 = 1024;
    *(_DWORD *)v36 = v15;
    v36[2] = 2080;
    *(_QWORD *)&v36[3] = v25;
    v32 = " [%s] %s:%d FigAssetWriterMarkEndOfDataForTrack error=%d outputURL=%s";
LABEL_49:
    _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v33, 0x2Cu);
    goto LABEL_38;
  }
  v15 = v14(v12, v13);
  if (v15)
    goto LABEL_25;
  v16 = self->_assetWriter;
  v17 = *(uint64_t (**)(OpaqueFigAssetWriter *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 120);
  if (!v17)
  {
    v18 = -12782;
LABEL_30:
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_38;
    v26 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    v27 = self->_outputURL;
    if (v27)
      v28 = (const char *)objc_msgSend((id)-[NSURL description](v27, "description"), "UTF8String");
    else
      v28 = "<nil>";
    LODWORD(v33.value) = 136316162;
    *(CMTimeValue *)((char *)&v33.value + 4) = v26;
    LOWORD(v33.flags) = 2080;
    *(_QWORD *)((char *)&v33.flags + 2) = "-[VCFigAssetWriter finishWritingWithHandler:]";
    HIWORD(v33.epoch) = 1024;
    v34 = 220;
    v35 = 1024;
    *(_DWORD *)v36 = v18;
    v36[2] = 2080;
    *(_QWORD *)&v36[3] = v28;
    v32 = " [%s] %s:%d FigAssetWriterFinish error=%d outputURL=%s";
    goto LABEL_49;
  }
  v18 = v17(v16);
  if (v18)
    goto LABEL_30;
  FigBaseObject = FigAssetWriterGetFigBaseObject();
  if (FigBaseObject)
  {
    v20 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
    if (v20)
    {
      v21 = v20(FigBaseObject);
      if (!v21)
      {
        CFRelease(self->_assetWriter);
        self->_assetWriter = 0;
LABEL_19:
        if (a3)
          (*((void (**)(id, NSURL *, _QWORD))a3 + 2))(a3, self->_outputURL, 0);
        if (assetWriter)
          VCMediaRecorderUtil_PrintMediaURL((uint64_t)self->_outputURL, 7);
        objc_sync_exit(self);
        return;
      }
    }
    else
    {
      v21 = -12782;
    }
  }
  else
  {
    v21 = -12780;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v29 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v30 = self->_outputURL;
      if (v30)
        v31 = (const char *)objc_msgSend((id)-[NSURL description](v30, "description"), "UTF8String");
      else
        v31 = "<nil>";
      LODWORD(v33.value) = 136316162;
      *(CMTimeValue *)((char *)&v33.value + 4) = v29;
      LOWORD(v33.flags) = 2080;
      *(_QWORD *)((char *)&v33.flags + 2) = "-[VCFigAssetWriter finishWritingWithHandler:]";
      HIWORD(v33.epoch) = 1024;
      v34 = 222;
      v35 = 1024;
      *(_DWORD *)v36 = v21;
      v36[2] = 2080;
      *(_QWORD *)&v36[3] = v31;
      v32 = " [%s] %s:%d FigAssetWriterInvalidate error=%d outputURL=%s";
      goto LABEL_49;
    }
  }
LABEL_38:
  objc_sync_exit(self);
  if (a3)
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMovieWriter"), -1, 0));
}

- (int)trackIDForMediaType:(unsigned __int8)a3
{
  if ((a3 - 1) > 2)
    return 0;
  else
    return *(_DWORD *)((char *)&self->super.super.isa + *off_1E9E58698[(char)(a3 - 1)]);
}

- (int)trackIDForWriterMode:(unsigned __int8)a3
{
  int *v3;

  if (self->_writerMode - 3 >= 2)
    v3 = &OBJC_IVAR___VCFigAssetWriter__videoTrackID;
  else
    v3 = &OBJC_IVAR___VCFigAssetWriter__localAudioTrackID;
  return *(_DWORD *)((char *)&self->super.super.isa + *v3);
}

- (void)setEndRTPTimestampWithTimestamp:(unsigned int)a3
{
  self->_endRTPTimeStamp = a3;
  self->_isEndRTPTimestampSet = 1;
}

- (BOOL)shouldAppendSampleBuffer:(opaqueCMSampleBuffer *)a3 RTPtimeStamp:(unsigned int)a4 mediaType:(unsigned __int8)a5
{
  _BOOL4 IsMediaExpected;
  unsigned int state;
  double Seconds;
  double v11;
  unsigned int startRTPTimeStamp;
  _BOOL4 v13;
  CMTime v16;
  CMTime v17;
  CMTime time;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  IsMediaExpected = VCMediaWriterUtil_IsMediaExpected(a5, self->_writerMode);
  if (IsMediaExpected)
  {
    if (self->_writerMode - 2 > 2)
    {
      if ((self->_startTime.flags & 1) == 0)
      {
        time = (CMTime)self->_stillImageTime;
        Seconds = CMTimeGetSeconds(&time);
        CMSampleBufferGetPresentationTimeStamp(&v17, a3);
        if (Seconds - CMTimeGetSeconds(&v17) <= 1.0)
        {
LABEL_10:
          LOBYTE(IsMediaExpected) = 1;
          return IsMediaExpected;
        }
      }
      CMSampleBufferGetPresentationTimeStamp(&v16, a3);
      v11 = CMTimeGetSeconds(&v16);
      time = (CMTime)self->_startTime;
      LOBYTE(IsMediaExpected) = v11 - CMTimeGetSeconds(&time) < 3.0;
    }
    else
    {
      state = self->_state;
      if (state - 1 < 2)
      {
        if (self->_isEndRTPTimestampSet && self->_endRTPTimeStamp < a4)
        {
LABEL_20:
          LOBYTE(IsMediaExpected) = 0;
          return IsMediaExpected;
        }
        goto LABEL_10;
      }
      if (state)
        goto LABEL_20;
      startRTPTimeStamp = self->_startRTPTimeStamp;
      v13 = a4 - startRTPTimeStamp < 0x7FFFFFFF && a4 < startRTPTimeStamp;
      if (a4 <= startRTPTimeStamp && !v13)
        goto LABEL_20;
      LOBYTE(IsMediaExpected) = 1;
      self->_state = 1;
    }
  }
  return IsMediaExpected;
}

- (BOOL)shouldFinishWritingSampleBuffer:(opaqueCMSampleBuffer *)a3 RTPtimeStamp:(unsigned int)a4 mediaType:(unsigned __int8)a5
{
  _BOOL4 IsMediaExpected;
  unsigned int endRTPTimeStamp;
  BOOL v10;
  unsigned int v11;
  double Seconds;
  $95D729B680665BEAEFA1D6FCA8238556 startTime;
  CMTime time;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  IsMediaExpected = VCMediaWriterUtil_IsMediaExpected(a5, self->_writerMode);
  if (IsMediaExpected)
  {
    if (self->_writerMode - 2 > 2)
    {
      if (a3)
      {
        CMSampleBufferGetPresentationTimeStamp(&time, a3);
        Seconds = CMTimeGetSeconds(&time);
        startTime = self->_startTime;
        if (Seconds - CMTimeGetSeconds((CMTime *)&startTime) > 3.0)
        {
LABEL_14:
          LOBYTE(IsMediaExpected) = 1;
          return IsMediaExpected;
        }
      }
    }
    else if (self->_state == 1 && self->_isEndRTPTimestampSet)
    {
      endRTPTimeStamp = self->_endRTPTimeStamp;
      v10 = a4 >= endRTPTimeStamp;
      v11 = a4 - endRTPTimeStamp;
      if (v11 != 0 && v10)
        goto LABEL_14;
      if (!v10 && v11 < 0x7FFFFFFF)
        goto LABEL_14;
    }
    LOBYTE(IsMediaExpected) = 0;
  }
  return IsMediaExpected;
}

- (OpaqueVTCompressionSession)compressionSessionWithWidth:(unsigned int)a3 height:(unsigned int)a4
{
  unsigned int *p_codec;
  unsigned int v6;
  const __CFAllocator *v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  __CFArray *Mutable;
  CFNumberRef v15;
  CFNumberRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  CFNumberRef v19;
  CFNumberRef v20;
  __CFDictionary *v21;
  const void *v22;
  uint64_t v23;
  NSObject *v24;
  CMVideoCodecType *v26;
  CFNumberRef v27;
  __CFDictionary *theDict;
  CFNumberRef propertyValue;
  CFNumberRef value;
  int v31;
  unsigned int v32;
  unsigned int v33;
  double keyFrameIntervalDuration;
  int v35;
  int32_t v36;
  int32_t valuePtr;
  VTSessionRef session[2];

  session[1] = *(VTSessionRef *)MEMORY[0x1E0C80C00];
  session[0] = 0;
  v36 = a4;
  valuePtr = a3;
  v35 = VCVideoUtil_DefaultCameraCapturePixelFormat();
  keyFrameIntervalDuration = self->_keyFrameIntervalDuration;
  p_codec = &self->_codec;
  if (self->_codec == 1752589105)
    v6 = 3000000;
  else
    v6 = 4000000;
  v33 = v6;
  if (VCDefaults_GetManagedBoolValueForKey(CFSTR("enableLocalVideoRecording"), 0))
  {
    if (*p_codec == 1752589105)
      v6 = 12000000;
    else
      v6 = 20000000;
    v33 = v6;
  }
  v26 = p_codec;
  v31 = 1;
  v32 = v6 >> 3;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v8 = CFNumberCreate(v7, kCFNumberIntType, &valuePtr);
  v9 = CFNumberCreate(v7, kCFNumberIntType, &v36);
  v27 = CFNumberCreate(v7, kCFNumberIntType, &v35);
  v10 = CFNumberCreate(v7, kCFNumberFloat64Type, &keyFrameIntervalDuration);
  v11 = CFNumberCreate(v7, kCFNumberIntType, &v33);
  v12 = CFNumberCreate(v7, kCFNumberIntType, &v32);
  v13 = CFNumberCreate(v7, kCFNumberIntType, &v31);
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v15 = v12;
  v16 = v12;
  v17 = v13;
  CFArrayAppendValue(Mutable, v16);
  CFArrayAppendValue(Mutable, v13);
  propertyValue = v11;
  value = v8;
  if (v8)
  {
    v18 = v9;
    if (!v9)
    {
      v19 = v10;
      v20 = v27;
      v21 = theDict;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.2();
      }
      goto LABEL_41;
    }
    v19 = v10;
    v20 = v27;
    if (!v27)
    {
      v21 = theDict;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.3();
      }
      goto LABEL_41;
    }
    v21 = theDict;
    if (!v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.4();
      }
      goto LABEL_41;
    }
    if (!v11)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.5();
      }
      goto LABEL_41;
    }
    if (!v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.6();
      }
      goto LABEL_41;
    }
    if (!v17)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.7();
      }
      goto LABEL_41;
    }
    if (!Mutable)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.8();
      }
      goto LABEL_41;
    }
    CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E0CA90E0], value);
    CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E0CA8FD8], v18);
    CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E0CA9040], v27);
    if (VTCompressionSessionCreate(v7, valuePtr, v36, *v26, 0, theDict, 0, 0, 0, (VTCompressionSessionRef *)session))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.22();
      }
      goto LABEL_41;
    }
    v22 = (const void *)*MEMORY[0x1E0C9AE50];
    if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E0CED1A0], (CFTypeRef)*MEMORY[0x1E0C9AE50]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.21();
      }
      goto LABEL_41;
    }
    if (*v26 == 1752589105)
    {
      if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E0CED180], (CFTypeRef)*MEMORY[0x1E0CED9B0]))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.20();
        }
        goto LABEL_41;
      }
    }
    else
    {
      if (*v26 != 1635148593)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v23 = VRTraceErrorLogLevelToCSTR();
          v24 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.9(v23, (int *)v26, v24);
        }
        goto LABEL_41;
      }
      if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E0CED000], (CFTypeRef)*MEMORY[0x1E0CED678]))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.19();
        }
        goto LABEL_41;
      }
      if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E0CED180], (CFTypeRef)*MEMORY[0x1E0CED930]))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.18();
        }
LABEL_41:
        CFRelease(value);
        goto LABEL_42;
      }
    }
    if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E0CECEB0], (CFTypeRef)*MEMORY[0x1E0C9AE40]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.17();
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E0CECEC8], v22))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.16();
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E0CED0B0], v19))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.15();
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E0CECEF0], v11))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.14();
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E0CECF78], Mutable))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.13();
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E0CECF48], (CFTypeRef)*MEMORY[0x1E0CA8D88]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.12();
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E0CED238], (CFTypeRef)*MEMORY[0x1E0CA8EB0]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.11();
      }
    }
    else if (VTSessionSetProperty(session[0], (CFStringRef)*MEMORY[0x1E0CED290], (CFTypeRef)*MEMORY[0x1E0CA8F18]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.10();
      }
    }
    goto LABEL_41;
  }
  v19 = v10;
  v18 = v9;
  v20 = v27;
  v21 = theDict;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCFigAssetWriter compressionSessionWithWidth:height:].cold.1();
  }
LABEL_42:
  if (v18)
    CFRelease(v18);
  if (v20)
    CFRelease(v20);
  if (v19)
    CFRelease(v19);
  if (v21)
    CFRelease(v21);
  if (propertyValue)
    CFRelease(propertyValue);
  if (v15)
    CFRelease(v15);
  if (v17)
    CFRelease(v17);
  if (Mutable)
    CFRelease(Mutable);
  return (OpaqueVTCompressionSession *)session[0];
}

- (int)encodeAndAppendSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v6;
  OpaqueVTCompressionSession *compressionSession;
  OSStatus v8;
  int result;
  CMTime v10;
  CMTime presentationTimeStamp;
  _QWORD outputHandler[5];
  int v13;
  CMTime v14;
  CMTime v15;
  CMTime v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      -[VCFigAssetWriter encodeAndAppendSampleBuffer:].cold.1();
    }
    return 0;
  }
  if (!self->_compressionSession)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      -[VCFigAssetWriter encodeAndAppendSampleBuffer:].cold.2();
    }
    return 0;
  }
  if (!self->_assetWriter)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      -[VCFigAssetWriter encodeAndAppendSampleBuffer:].cold.3();
    }
    return 0;
  }
  if (!self->_videoTrackID)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      -[VCFigAssetWriter encodeAndAppendSampleBuffer:].cold.4();
    }
    return 0;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      -[VCFigAssetWriter encodeAndAppendSampleBuffer:].cold.5();
    }
    return 0;
  }
  v6 = ImageBuffer;
  memset(&v16, 170, sizeof(v16));
  CMSampleBufferGetPresentationTimeStamp(&v16, a3);
  memset(&v15, 170, sizeof(v15));
  CMSampleBufferGetDuration(&v15, a3);
  compressionSession = self->_compressionSession;
  outputHandler[0] = MEMORY[0x1E0C809B0];
  outputHandler[1] = 3221225472;
  outputHandler[2] = __48__VCFigAssetWriter_encodeAndAppendSampleBuffer___block_invoke;
  outputHandler[3] = &unk_1E9E58678;
  outputHandler[4] = self;
  v13 = 0;
  v14 = v16;
  presentationTimeStamp = v16;
  v10 = v15;
  v8 = VTCompressionSessionEncodeFrameWithOutputHandler(compressionSession, v6, &presentationTimeStamp, &v10, 0, 0, outputHandler);
  result = 0;
  if (v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter encodeAndAppendSampleBuffer:].cold.6();
    }
    return v8;
  }
  return result;
}

void __48__VCFigAssetWriter_encodeAndAppendSampleBuffer___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  NSObject *v11;
  int v12;
  Float64 Seconds;
  CMTime v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  Float64 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCFigAssetWriter_encodeAndAppendSampleBuffer___block_invoke_cold_1();
    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 168);
  v8 = *(unsigned int *)(v6 + 216);
  v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
  if ((!v9 || v9(v7, v8, a4)) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v12 = *(_DWORD *)(a1 + 40);
      v14 = *(CMTime *)(a1 + 44);
      Seconds = CMTimeGetSeconds(&v14);
      LODWORD(v14.value) = 136316162;
      *(CMTimeValue *)((char *)&v14.value + 4) = v10;
      LOWORD(v14.flags) = 2080;
      *(_QWORD *)((char *)&v14.flags + 2) = "-[VCFigAssetWriter encodeAndAppendSampleBuffer:]_block_invoke";
      HIWORD(v14.epoch) = 1024;
      v15 = 446;
      v16 = 1024;
      v17 = v12;
      v18 = 2048;
      v19 = Seconds;
      _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d FigAssetWriterAddSampleBuffer failed with err=%d timestamp=%f", (uint8_t *)&v14, 0x2Cu);
    }
  }
}

- (void)collectEarlyAudioBuffer:(opaqueCMSampleBuffer *)a3 type:(unsigned __int8)a4
{
  __CFArray *earlyRemoteAudioBuffers;

  if (a4 == 2)
  {
    earlyRemoteAudioBuffers = self->_earlyRemoteAudioBuffers;
    if (earlyRemoteAudioBuffers)
      goto LABEL_8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter collectEarlyAudioBuffer:type:].cold.3();
    }
  }
  else
  {
    if (a4 == 1)
    {
      earlyRemoteAudioBuffers = self->_earlyLocalAudioBuffers;
      if (!earlyRemoteAudioBuffers)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCFigAssetWriter collectEarlyAudioBuffer:type:].cold.2();
        }
        return;
      }
LABEL_8:
      CFArrayAppendValue(earlyRemoteAudioBuffers, a3);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter collectEarlyAudioBuffer:type:].cold.1();
    }
  }
}

- (void)appendAudioBufferList:(__CFArray *)a3 type:(unsigned __int8)a4
{
  uint64_t v4;
  CFIndex v7;

  if (a3)
  {
    v4 = a4;
    if (CFArrayGetCount(a3) >= 1)
    {
      v7 = 0;
      do
        -[VCFigAssetWriter appendAudioSampleBuffer:mediaType:](self, "appendAudioSampleBuffer:mediaType:", CFArrayGetValueAtIndex(a3, v7++), v4);
      while (v7 < CFArrayGetCount(a3));
    }
    CFArrayRemoveAllValues(a3);
  }
}

- (void)appendEarlyAudioBuffers
{
  -[VCFigAssetWriter appendAudioBufferList:type:](self, "appendAudioBufferList:type:", self->_earlyLocalAudioBuffers, 1);
  -[VCFigAssetWriter appendAudioBufferList:type:](self, "appendAudioBufferList:type:", self->_earlyRemoteAudioBuffers, 2);
}

- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 cameraStatus:(unsigned __int8)a4 mediaType:(unsigned __int8)a5
{
  uint64_t v5;
  __CVBuffer *ImageBuffer;
  __CVBuffer *ResizeFrame;
  opaqueCMSampleBuffer *v10;
  int *p_videoTrackID;
  __CVBuffer *v12;
  size_t Width;
  __CVBuffer *v14;
  OpaqueVTCompressionSession *v15;
  OpaqueFigAssetWriter *assetWriter;
  unsigned int (*v17)(OpaqueFigAssetWriter *, uint64_t, int *);
  uint64_t v18;
  NSObject *v19;
  int v20;
  NSURL *outputURL;
  const char *v22;
  __int128 v23;
  const void *v24;
  OpaqueFigAssetWriter *v25;
  uint64_t v26;
  uint64_t (*v27)(OpaqueFigAssetWriter *, uint64_t, _QWORD, const void *);
  int v28;
  $95D729B680665BEAEFA1D6FCA8238556 *p_startTime;
  OpaqueFigAssetWriter *v30;
  uint64_t (*v31)(OpaqueFigAssetWriter *, _BYTE *);
  int v32;
  uint64_t v33;
  NSObject *v34;
  Float64 Seconds;
  NSURL *v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  Float64 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[48];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = a4;
    if (self->_writerMode != 1 || self->_stillImageCameraStatusBit == a4)
    {
      if (self->_resize)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(a3);
        memset(v44, 170, 24);
        CMSampleBufferGetPresentationTimeStamp((CMTime *)v44, a3);
        ResizeFrame = VCMediaRecorderUtil_CreateResizeFrame(ImageBuffer, self->_transferSession, self->_bufferPool);
        v41 = *(_OWORD *)v44;
        *(_QWORD *)&v42 = *(_QWORD *)&v44[16];
        v10 = createSampleBufferWithPixelBuffer(ResizeFrame, &v41);
      }
      else
      {
        v10 = (opaqueCMSampleBuffer *)FigSampleBufferRetain();
        ResizeFrame = 0;
      }
      objc_sync_enter(self);
      p_videoTrackID = &self->_videoTrackID;
      if (!self->_videoTrackID)
      {
        v12 = CMSampleBufferGetImageBuffer(v10);
        Width = CVPixelBufferGetWidth(v12);
        v14 = CMSampleBufferGetImageBuffer(v10);
        v15 = -[VCFigAssetWriter compressionSessionWithWidth:height:](self, "compressionSessionWithWidth:height:", Width, CVPixelBufferGetHeight(v14));
        self->_compressionSession = v15;
        if (!v15)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.2();
          }
          goto LABEL_42;
        }
        assetWriter = self->_assetWriter;
        v17 = *(unsigned int (**)(OpaqueFigAssetWriter *, uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 8);
        if (!v17 || v17(assetWriter, 1986618469, &self->_videoTrackID))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.3();
          }
          goto LABEL_42;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v20 = *p_videoTrackID;
            outputURL = self->_outputURL;
            if (outputURL)
              v22 = (const char *)objc_msgSend((id)-[NSURL description](outputURL, "description"), "UTF8String");
            else
              v22 = "<nil>";
            *(_DWORD *)v44 = 136316162;
            *(_QWORD *)&v44[4] = v18;
            *(_WORD *)&v44[12] = 2080;
            *(_QWORD *)&v44[14] = "-[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:]";
            *(_WORD *)&v44[22] = 1024;
            *(_DWORD *)&v44[24] = 511;
            *(_WORD *)&v44[28] = 1024;
            *(_DWORD *)&v44[30] = v20;
            *(_WORD *)&v44[34] = 2080;
            *(_QWORD *)&v44[36] = v22;
            _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Added native video trackID=%d for output path=%s", v44, 0x2Cu);
          }
        }
        *(_QWORD *)&v23 = -1;
        *((_QWORD *)&v23 + 1) = -1;
        *(_OWORD *)&v44[16] = v23;
        *(_OWORD *)&v44[32] = v23;
        *(_OWORD *)v44 = v23;
        videoOrientationInRadiansForCameraStatusBits(v5, v44);
        v41 = *(_OWORD *)v44;
        v42 = *(_OWORD *)&v44[16];
        v43 = *(_OWORD *)&v44[32];
        v24 = (const void *)FigCreate3x3MatrixArrayFromCGAffineTransform();
        if (!v24)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.4();
          }
          goto LABEL_42;
        }
        v25 = self->_assetWriter;
        v26 = *p_videoTrackID;
        v27 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                              + 64);
        v28 = v27 ? v27(v25, v26, *MEMORY[0x1E0CC4688], v24) : -12782;
        CFRelease(v24);
        if (v28)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.8();
          }
          goto LABEL_42;
        }
      }
      p_startTime = &self->_startTime;
      if ((self->_startTime.flags & 1) != 0)
        goto LABEL_39;
      CMSampleBufferGetPresentationTimeStamp((CMTime *)v44, v10);
      *(_OWORD *)&p_startTime->value = *(_OWORD *)v44;
      self->_startTime.epoch = *(_QWORD *)&v44[16];
      v30 = self->_assetWriter;
      v41 = *(_OWORD *)&p_startTime->value;
      *(_QWORD *)&v42 = self->_startTime.epoch;
      v31 = *(uint64_t (**)(OpaqueFigAssetWriter *, _BYTE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
      if (v31)
      {
        *(_OWORD *)v44 = v41;
        *(_QWORD *)&v44[16] = v42;
        v32 = v31(v30, v44);
        if (!v32)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v33 = VRTraceErrorLogLevelToCSTR();
            v34 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v41 = *(_OWORD *)&p_startTime->value;
              *(_QWORD *)&v42 = self->_startTime.epoch;
              Seconds = CMTimeGetSeconds((CMTime *)&v41);
              v36 = self->_outputURL;
              if (v36)
                v37 = (const char *)objc_msgSend((id)-[NSURL description](v36, "description"), "UTF8String");
              else
                v37 = "<nil>";
              *(_DWORD *)v44 = 136316162;
              *(_QWORD *)&v44[4] = v33;
              *(_WORD *)&v44[12] = 2080;
              *(_QWORD *)&v44[14] = "-[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:]";
              *(_WORD *)&v44[22] = 1024;
              *(_DWORD *)&v44[24] = 526;
              *(_WORD *)&v44[28] = 2048;
              *(Float64 *)&v44[30] = Seconds;
              *(_WORD *)&v44[38] = 2080;
              *(_QWORD *)&v44[40] = v37;
              _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FigAssetWriterBeginSession start time=%f path=%s", v44, 0x30u);
            }
          }
          -[VCFigAssetWriter appendEarlyAudioBuffers](self, "appendEarlyAudioBuffers");
LABEL_39:
          if (*p_videoTrackID)
          {
            if (self->_compressionSession)
            {
              if (-[VCFigAssetWriter encodeAndAppendSampleBuffer:](self, "encodeAndAppendSampleBuffer:", v10))
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.7();
                }
              }
            }
            else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.6();
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.5();
          }
LABEL_42:
          objc_sync_exit(self);
          if (ResizeFrame)
            CVPixelBufferRelease(ResizeFrame);
          goto LABEL_44;
        }
      }
      else
      {
        v32 = -12782;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v38 = VRTraceErrorLogLevelToCSTR();
        v39 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v41 = *(_OWORD *)&p_startTime->value;
          *(_QWORD *)&v42 = self->_startTime.epoch;
          v40 = CMTimeGetSeconds((CMTime *)&v41);
          *(_DWORD *)v44 = 136316162;
          *(_QWORD *)&v44[4] = v38;
          *(_WORD *)&v44[12] = 2080;
          *(_QWORD *)&v44[14] = "-[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:]";
          *(_WORD *)&v44[22] = 1024;
          *(_DWORD *)&v44[24] = 525;
          *(_WORD *)&v44[28] = 1024;
          *(_DWORD *)&v44[30] = v32;
          *(_WORD *)&v44[34] = 2048;
          *(Float64 *)&v44[36] = v40;
          _os_log_error_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_ERROR, " [%s] %s:%d FigAssetWriterBeginSession failed with err=%d start time=%f", v44, 0x2Cu);
        }
      }
      goto LABEL_42;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.9();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCFigAssetWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.1();
  }
LABEL_44:
  FigSampleBufferRelease();
}

- (void)appendAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 mediaType:(unsigned __int8)a4
{
  uint64_t v4;
  $95D729B680665BEAEFA1D6FCA8238556 *p_startTime;
  __int128 v8;
  CMTimeEpoch epoch;
  OpaqueFigAssetWriter *assetWriter;
  uint64_t (*v11)(OpaqueFigAssetWriter *, CMTime *);
  int v12;
  uint64_t v13;
  NSObject *v14;
  Float64 v15;
  NSURL *outputURL;
  const char *v17;
  uint64_t v18;
  OpaqueFigAssetWriter *v19;
  uint64_t (*v20)(OpaqueFigAssetWriter *, uint64_t, opaqueCMSampleBuffer *);
  int v21;
  uint64_t v22;
  NSObject *v23;
  Float64 v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  NSObject *v29;
  Float64 Seconds;
  uint64_t v31;
  NSObject *v32;
  CMTime v33;
  CMTime time;
  CMTime v35;
  CMTime time1;
  int v37;
  __int16 v38;
  _BYTE v39[20];
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!self->_assetWriter)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter appendAudioSampleBuffer:mediaType:].cold.1();
    }
    goto LABEL_25;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCFigAssetWriter appendAudioSampleBuffer:mediaType:].cold.2();
    }
    goto LABEL_25;
  }
  memset(&v35, 170, sizeof(v35));
  CMSampleBufferGetPresentationTimeStamp(&v35, a3);
  p_startTime = &self->_startTime;
  if ((self->_startTime.flags & 1) != 0)
    goto LABEL_12;
  if (!VCMediaWriterUtil_IsAudioOnly(self->_writerMode))
  {
    -[VCFigAssetWriter collectEarlyAudioBuffer:type:](self, "collectEarlyAudioBuffer:type:", a3, v4);
    goto LABEL_12;
  }
  v8 = *(_OWORD *)&v35.value;
  *(_OWORD *)&p_startTime->value = *(_OWORD *)&v35.value;
  epoch = v35.epoch;
  self->_startTime.epoch = v35.epoch;
  assetWriter = self->_assetWriter;
  *(_OWORD *)&time.value = v8;
  time.epoch = epoch;
  v11 = *(uint64_t (**)(OpaqueFigAssetWriter *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
  if (!v11)
  {
    v12 = -12782;
    goto LABEL_23;
  }
  time1 = time;
  v12 = v11(assetWriter, &time1);
  if (v12)
  {
LABEL_23:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_OWORD *)&time.value = *(_OWORD *)&p_startTime->value;
        time.epoch = self->_startTime.epoch;
        Seconds = CMTimeGetSeconds(&time);
        LODWORD(time1.value) = 136316162;
        *(CMTimeValue *)((char *)&time1.value + 4) = v28;
        LOWORD(time1.flags) = 2080;
        *(_QWORD *)((char *)&time1.flags + 2) = "-[VCFigAssetWriter appendAudioSampleBuffer:mediaType:]";
        HIWORD(time1.epoch) = 1024;
        v37 = 553;
        v38 = 1024;
        *(_DWORD *)v39 = v12;
        *(_WORD *)&v39[4] = 2048;
        *(Float64 *)&v39[6] = Seconds;
        v25 = " [%s] %s:%d FigAssetWriterBeginSession failed with err=%d start time=%f";
        v26 = v29;
        v27 = 44;
        goto LABEL_29;
      }
    }
    goto LABEL_25;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)&time.value = *(_OWORD *)&p_startTime->value;
      time.epoch = self->_startTime.epoch;
      v15 = CMTimeGetSeconds(&time);
      outputURL = self->_outputURL;
      if (outputURL)
        v17 = (const char *)objc_msgSend((id)-[NSURL description](outputURL, "description"), "UTF8String");
      else
        v17 = "<nil>";
      LODWORD(time1.value) = 136316162;
      *(CMTimeValue *)((char *)&time1.value + 4) = v13;
      LOWORD(time1.flags) = 2080;
      *(_QWORD *)((char *)&time1.flags + 2) = "-[VCFigAssetWriter appendAudioSampleBuffer:mediaType:]";
      HIWORD(time1.epoch) = 1024;
      v37 = 554;
      v38 = 2048;
      *(Float64 *)v39 = v15;
      *(_WORD *)&v39[8] = 2080;
      *(_QWORD *)&v39[10] = v17;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FigAssetWriterBeginSession start time=%f path=%s", (uint8_t *)&time1, 0x30u);
    }
  }
LABEL_12:
  if ((self->_startTime.flags & 1) != 0)
  {
    *(_OWORD *)&time1.value = *(_OWORD *)&p_startTime->value;
    time1.epoch = self->_startTime.epoch;
    time = v35;
    if (CMTimeCompare(&time1, &time) <= 0)
    {
      v18 = -[VCFigAssetWriter trackIDForMediaType:](self, "trackIDForMediaType:", v4);
      if ((_DWORD)v18)
      {
        v19 = self->_assetWriter;
        v20 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                + 80);
        if (v20)
        {
          v21 = v20(v19, v18, a3);
          if (!v21)
            goto LABEL_25;
        }
        else
        {
          v21 = -12782;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            CMSampleBufferGetPresentationTimeStamp(&v33, a3);
            v24 = CMTimeGetSeconds(&v33);
            LODWORD(time1.value) = 136316418;
            *(CMTimeValue *)((char *)&time1.value + 4) = v22;
            LOWORD(time1.flags) = 2080;
            *(_QWORD *)((char *)&time1.flags + 2) = "-[VCFigAssetWriter appendAudioSampleBuffer:mediaType:]";
            HIWORD(time1.epoch) = 1024;
            v37 = 566;
            v38 = 1024;
            *(_DWORD *)v39 = v21;
            *(_WORD *)&v39[4] = 2048;
            *(Float64 *)&v39[6] = v24;
            *(_WORD *)&v39[14] = 1024;
            *(_DWORD *)&v39[16] = v4;
            v25 = " [%s] %s:%d FigAssetWriterAddSampleBuffer failed with err=%d timestamp=%f type=%d";
            v26 = v23;
            v27 = 50;
LABEL_29:
            _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&time1, v27);
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter appendAudioSampleBuffer:mediaType:].cold.3(v31, v4, v32);
      }
    }
  }
LABEL_25:
  objc_sync_exit(self);
}

- (void)writeIdentifierMetadata:(id)a3
{
  uint64_t MetaDataArrayWithIndentifier;
  OpaqueFigAssetWriter *assetWriter;
  unsigned int (*v6)(OpaqueFigAssetWriter *, _QWORD, uint64_t);
  uint64_t v7;
  NSObject *v8;
  NSURL *outputURL;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  NSURL *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    MetaDataArrayWithIndentifier = VCMediaWriterUtil_GetMetaDataArrayWithIndentifier((uint64_t)a3);
    assetWriter = self->_assetWriter;
    v6 = *(unsigned int (**)(OpaqueFigAssetWriter *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 56);
    if (!v6 || v6(assetWriter, *MEMORY[0x1E0CC4470], MetaDataArrayWithIndentifier))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCFigAssetWriter writeIdentifierMetadata:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        outputURL = self->_outputURL;
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCFigAssetWriter writeIdentifierMetadata:]";
        v14 = 1024;
        v15 = 579;
        v16 = 2112;
        v17 = MetaDataArrayWithIndentifier;
        v18 = 2112;
        v19 = outputURL;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Wrote metadata for FigAssetWriter %@ with URL %@", (uint8_t *)&v10, 0x30u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCFigAssetWriter writeIdentifierMetadata:].cold.1();
  }
}

- (void)setStillImageTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_stillImageTime;
  int64_t var3;
  uint64_t v5;
  NSObject *v6;
  Float64 Seconds;
  $95D729B680665BEAEFA1D6FCA8238556 v8;
  int v9;
  __int16 v10;
  Float64 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_stillImageTime = &self->_stillImageTime;
  var3 = a3->var3;
  *(_OWORD *)&self->_stillImageTime.value = *(_OWORD *)&a3->var0;
  self->_stillImageTime.epoch = var3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *p_stillImageTime;
      Seconds = CMTimeGetSeconds((CMTime *)&v8);
      LODWORD(v8.value) = 136315906;
      *(int64_t *)((char *)&v8.value + 4) = v5;
      LOWORD(v8.flags) = 2080;
      *(_QWORD *)((char *)&v8.flags + 2) = "-[VCFigAssetWriter setStillImageTime:]";
      HIWORD(v8.epoch) = 1024;
      v9 = 586;
      v10 = 2048;
      v11 = Seconds;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _stillImageTime=%f", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setStillImageTimeInternal
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d FigAssetWriterMarkEndOfDataForTrack failed with error=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (unsigned)startRTPTimeStamp
{
  return self->_startRTPTimeStamp;
}

- (void)setStartRTPTimeStamp:(unsigned int)a3
{
  self->_startRTPTimeStamp = a3;
}

- (unsigned)endRTPTimeStamp
{
  return self->_endRTPTimeStamp;
}

- (void)setEndRTPTimeStamp:(unsigned int)a3
{
  self->_endRTPTimeStamp = a3;
}

- (unsigned)writerMode
{
  return self->_writerMode;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 344);
  return self;
}

- (void)setMovieFragmentInterval:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_movieFragmentInterval.value = *(_OWORD *)&a3->var0;
  self->_movieFragmentInterval.epoch = var3;
}

- (VCSandboxedURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void)initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d no url", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d no transaction id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOutputURL:transactionID:videoCodec:keyFrameIntervalDuration:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create early local audio buffer array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_setupWriter
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d FigAssetWriterCreateWithURL failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create pixel width for compression session dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create pixel height for compression session dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create pixel format for compression session dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create key frame interval duration for compression session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create bitrate for compression session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create bytes for compression session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create bytes limit duration for compression", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create bytes limit array for compression", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:(NSObject *)a3 height:.cold.9(uint64_t a1, int *a2, NSObject *a3)
{
  char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = FourccToCStr(*a2);
  v6 = 136315906;
  v7 = a1;
  v8 = 2080;
  v9 = "-[VCFigAssetWriter compressionSessionWithWidth:height:]";
  v10 = 1024;
  v11 = 392;
  v12 = 2080;
  v13 = v5;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot set VTSessionSetProperty kVTCompressionPropertyKey_ProfileLevel for unsupported codec=%s", (uint8_t *)&v6, 0x26u);
}

- (void)compressionSessionWithWidth:height:.cold.10()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_YCbCrMatrix failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.11()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_TransferFunction failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.12()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_ColorPrimaries failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.13()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_DataRateLimits failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.14()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_AverageBitRate failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.15()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.16()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_AllowTemporalCompression failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.17()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_AllowFrameReordering failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.18()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_ProfileLevel failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.19()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_H264EntropyMode failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.20()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_ProfileLevel failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.21()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTSessionSetProperty kVTCompressionPropertyKey_RealTime failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)compressionSessionWithWidth:height:.cold.22()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTCompressionSessionCreate failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)encodeAndAppendSampleBuffer:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot encode and append NULL sampleBuffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)encodeAndAppendSampleBuffer:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot encode. VTCompressionSession is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)encodeAndAppendSampleBuffer:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot append. Asset Writer is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)encodeAndAppendSampleBuffer:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot append to invalid video track ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)encodeAndAppendSampleBuffer:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d FigAssetWriter cannot append NULL image buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)encodeAndAppendSampleBuffer:.cold.6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTCompressionSessionEncodeFrame failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __48__VCFigAssetWriter_encodeAndAppendSampleBuffer___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTCompressionSessionEncodeFrame handler status=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)collectEarlyAudioBuffer:type:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Attempting to append early audio buffer with type=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)collectEarlyAudioBuffer:type:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d NULL early local audio buffer array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)collectEarlyAudioBuffer:type:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d NULL early remote audio buffer array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d appendVideoSampleBuffer failed. null sample buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTCompressionSession not created", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d FigAssetWriterAddNativeTrack failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not create 3x3 matrix array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d video track ID was invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTCompressionSession not ready", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.7()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to encode and append sample buffer with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.8()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d FigAssetWriterSetFormatWriterTrackProperty kFigFormatWriterTrackProperty_TrackMatrix failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.9()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d appendVideoSampleBuffer failed. cameraStatusBit does not match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendAudioSampleBuffer:mediaType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d fail to append audio sample buffer. asset writer is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendAudioSampleBuffer:mediaType:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d fail to append audio sample buffer. sample buffer is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendAudioSampleBuffer:(NSObject *)a3 mediaType:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCFigAssetWriter appendAudioSampleBuffer:mediaType:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, a2, a3, " [%s] %s:%d invalid track id for type=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCFigAssetWriter appendAudioSampleBuffer:mediaType:]" >> 16, 564);
  OUTLINED_FUNCTION_3();
}

- (void)writeIdentifierMetadata:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d invalid identifer for FigAssetWriter metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)writeIdentifierMetadata:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d FigAssetWriterSetProperty metadata failed with err=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
