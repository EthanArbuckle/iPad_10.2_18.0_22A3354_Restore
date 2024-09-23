@implementation VCMediaControlInfoFaceTimeAudio

- (VCMediaControlInfoFaceTimeAudio)init
{
  VCMediaControlInfoFaceTimeAudio *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaControlInfoFaceTimeAudio;
  result = -[VCMediaControlInfo init](&v3, sel_init);
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoFaceTimeAudio_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoFaceTimeAudio_SerializeBuffer;
  }
  return result;
}

- (VCMediaControlInfoFaceTimeAudio)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6
{
  VCMediaControlInfoFaceTimeAudio *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaControlInfoFaceTimeAudio;
  result = -[VCMediaControlInfo initWithBuffer:length:optionalControlInfo:version:](&v7, sel_initWithBuffer_length_optionalControlInfo_version_, a3, a4, a5, a6);
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoFaceTimeAudio_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoFaceTimeAudio_SerializeBuffer;
  }
  return result;
}

- (unint64_t)feedbackSize
{
  unint64_t v2;

  if (self->super._version != 2)
    return 6;
  v2 = 10;
  if ((self->super._bitmap & 4) == 0)
    v2 = 6;
  if ((self->super._bitmap & 8) != 0)
    return v2 + 4;
  else
    return v2;
}

- (id)description
{
  void *v3;
  unsigned __int16 bitmap;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_version = %u, _bitmap 0x%x. :"), self->super._version, self->super._bitmap));
  bitmap = self->super._bitmap;
  if ((bitmap & 1) != 0)
  {
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Feedback parameters: \n")));
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %25s = %10d\n"), "timeStamp", self->_controlFeedbackParameter.timeStamp));
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %25s = %10d\n"), "receiveQueueTarget", self->_controlFeedbackParameter.receiveQueueTarget));
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %25s = %10d\n"), "audioReceviedPkts", self->_controlFeedbackParameter.audioReceviedPkts));
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %25s = %10d\n"), "audioBurstLoss", self->_controlFeedbackParameter.audioBurstLoss));
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %25s = %10d\n"), "totalReceviedKBytes", self->_controlFeedbackParameter.totalReceivedKBytes));
    bitmap = self->super._bitmap;
    if ((bitmap & 4) != 0)
    {
      objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %25s = %10d\n"), "videoReceviedPkts", self->_controlFeedbackParameter.videoReceviedPkts));
      objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %25s = %10d\n"), "videoBurstLoss", self->_controlFeedbackParameter.videoBurstLoss));
      objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %25s = %10d\n"), "bandwithEstimation", self->_controlFeedbackParameter.bandwithEstimation));
      bitmap = self->super._bitmap;
    }
  }
  if ((bitmap & 0x80) != 0)
  {
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Media Queue parameters: \n")));
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %25s = %10d\n"), "owrd", self->_controlFeedbackParameter.owrd));
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %25s = %10d\n"), "queuingDelay", self->_controlFeedbackParameter.queuingDelay));
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %25s = %10d\n"), "sendTimestamp", self->_controlFeedbackParameter.sendTimestamp));
    bitmap = self->super._bitmap;
  }
  if ((bitmap & 2) != 0)
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %25s = 0x%8x\n"), "connectionStatsBuffer", self->_controlFeedbackParameter.connectionStatsBuffer));
  return v3;
}

- (int)handleOptionalControlInfo:(id *)a3
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  $2404FDACF9B5ADB893EBED180D52131B *v35;
  __int16 v36;
  VCMediaControlInfoFaceTimeAudio *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 1;
  v5 = -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:](self, "setInfo:size:type:", a3, 8, 10);
  if (v5 < 0)
  {
    v14 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v14;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v14;
    v28 = 136316418;
    v29 = v16;
    v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    v32 = 1024;
    v33 = 785;
    v34 = 2048;
    v35 = a3;
    v36 = 2048;
    v37 = self;
    v38 = 1024;
    v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeArrivalTime, for optionalControlInfo=%p"
          " in control info=%p for audio. error=%x";
LABEL_44:
    _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v28, 0x36u);
    return v14;
  }
  v6 = -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:](self, "setInfo:size:type:", &a3->var1, 4, 16);
  if (v6 < 0)
  {
    v14 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v14;
    v19 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v14;
    v28 = 136316418;
    v29 = v19;
    v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    v32 = 1024;
    v33 = 788;
    v34 = 2048;
    v35 = a3;
    v36 = 2048;
    v37 = self;
    v38 = 1024;
    v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypePacketSize, for optionalControlInfo=%p "
          "in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  v7 = -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:](self, "setInfo:size:type:", &a3->var6, 4, 17);
  if (v7 < 0)
  {
    v14 = v7;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v14;
    v20 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v14;
    v28 = 136316418;
    v29 = v20;
    v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    v32 = 1024;
    v33 = 791;
    v34 = 2048;
    v35 = a3;
    v36 = 2048;
    v37 = self;
    v38 = 1024;
    v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeMediaTimestamp, for optionalControlInfo"
          "=%p in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  v8 = -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:](self, "setInfo:size:type:", &a3->var3, 4, 12);
  if (v8 < 0)
  {
    v14 = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v14;
    v21 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v14;
    v28 = 136316418;
    v29 = v21;
    v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    v32 = 1024;
    v33 = 794;
    v34 = 2048;
    v35 = a3;
    v36 = 2048;
    v37 = self;
    v38 = 1024;
    v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeTotalReceivedKBytes, for optionalContro"
          "lInfo=%p in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  v9 = -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:](self, "setInfo:size:type:", &a3->var2, 4, 11);
  if (v9 < 0)
  {
    v14 = v9;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v14;
    v22 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v14;
    v28 = 136316418;
    v29 = v22;
    v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    v32 = 1024;
    v33 = 797;
    v34 = 2048;
    v35 = a3;
    v36 = 2048;
    v37 = self;
    v38 = 1024;
    v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeTotalReceivedPackets, for optionalContr"
          "olInfo=%p in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  v10 = -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:](self, "setInfo:size:type:", &a3->var7, 2, 13);
  if (v10 < 0)
  {
    v14 = v10;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v14;
    v23 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v14;
    v28 = 136316418;
    v29 = v23;
    v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    v32 = 1024;
    v33 = 800;
    v34 = 2048;
    v35 = a3;
    v36 = 2048;
    v37 = self;
    v38 = 1024;
    v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeSequenceNumber, for optionalControlInfo"
          "=%p in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  v11 = -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:](self, "setInfo:size:type:", &a3->var8, 1, 14);
  if (v11 < 0)
  {
    v14 = v11;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v14;
    v24 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v14;
    v28 = 136316418;
    v29 = v24;
    v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    v32 = 1024;
    v33 = 803;
    v34 = 2048;
    v35 = a3;
    v36 = 2048;
    v37 = self;
    v38 = 1024;
    v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeIsDuplicatePacket, for optionalControlI"
          "nfo=%p in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  v12 = -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:](self, "setInfo:size:type:", &a3->var9, 1, 15);
  if (v12 < 0)
  {
    v14 = v12;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v14;
    v25 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v14;
    v28 = 136316418;
    v29 = v25;
    v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    v32 = 1024;
    v33 = 806;
    v34 = 2048;
    v35 = a3;
    v36 = 2048;
    v37 = self;
    v38 = 1024;
    v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeIsReceivedOnPrimary, for optionalContro"
          "lInfo=%p in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  v13 = -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:](self, "setInfo:size:type:", &a3->var10, 1, 18);
  if (v13 < 0)
  {
    v14 = v13;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v14;
    v26 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v14;
    v28 = 136316418;
    v29 = v26;
    v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    v32 = 1024;
    v33 = 809;
    v34 = 2048;
    v35 = a3;
    v36 = 2048;
    v37 = self;
    v38 = 1024;
    v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeECNByte, for optionalControlInfo=%p in "
          "control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  v14 = -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:](self, "setInfo:size:type:", &a3->var11, 1, 21);
  if (v14 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v27 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v28 = 136316418;
      v29 = v27;
      v30 = 2080;
      v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
      v32 = 1024;
      v33 = 812;
      v34 = 2048;
      v35 = a3;
      v36 = 2048;
      v37 = self;
      v38 = 1024;
      v39 = v14;
      v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeFeedbackReceivedOnRelay, for optional"
            "ControlInfo=%p in control info=%p for audio. error=%x";
      goto LABEL_44;
    }
  }
  return v14;
}

- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5
{
  int v7;
  int v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  unsigned __int8 version;
  int v17;
  BOOL v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v17 = 0;
  version = self->super._version;
  v7 = VCMediaControlInfoUnserializeWithData((uint64_t)&self->_controlFeedbackParameter, (unsigned __int16 *)a3, a4, &version);
  v8 = v7;
  if ((_BYTE)v17)
    self->super._bitmap |= 1u;
  v9 = BYTE1(v17);
  if (BYTE1(v17))
    self->super._bitmap |= 4u;
  if (BYTE2(v17))
    self->super._bitmap |= 0x80u;
  if (HIBYTE(v17))
    self->super._bitmap |= 2u;
  v10 = v18;
  if (v18)
    self->super._bitmap |= 8u;
  self->_videoEnabled = v9;
  self->_ecnEnabled = v10;
  if (v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:].cold.3();
    }
  }
  else
  {
    v8 = -[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:](self, "handleOptionalControlInfo:", a5);
    if (v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:].cold.2();
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v13 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = -[VCMediaControlInfoFaceTimeAudio description](self, "description");
          *(_DWORD *)buf = 136315906;
          v20 = v11;
          v21 = 2080;
          v22 = "-[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:]";
          v23 = 1024;
          v24 = 836;
          v25 = 2112;
          v26 = v14;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:].cold.1(v11, self);
      }
    }
  }
  return v8;
}

- (int)getInfoUnserialized:(id *)a3 type:(unsigned int)a4
{
  int v4;
  unsigned __int16 bitmap;

  v4 = -2144403455;
  if (a3)
  {
    if (a4 == 1)
    {
      if ((self->super._bitmap & 0x80) != 0)
      {
        v4 = 0;
        a3->var10 = self->_controlFeedbackParameter.owrd;
        a3->var8 = self->_controlFeedbackParameter.queuingDelay;
        a3->var9 = self->_controlFeedbackParameter.sendTimestamp;
        return v4;
      }
      return 0;
    }
    if (!a4)
    {
      bitmap = self->super._bitmap;
      if ((bitmap & 1) != 0)
      {
        *(_QWORD *)&a3->var0 = *(_QWORD *)&self->_controlFeedbackParameter.timeStamp;
        *(_DWORD *)&a3->var4 = *(_DWORD *)&self->_controlFeedbackParameter.audioBurstLoss;
        *(_QWORD *)&a3->var6 = *(_QWORD *)&self->_controlFeedbackParameter.totalReceivedKBytes;
        bitmap = self->super._bitmap;
      }
      if ((bitmap & 8) != 0)
      {
        v4 = 0;
        *(_DWORD *)&a3->var12 = *(_DWORD *)&self->_controlFeedbackParameter.ecnECT1Count;
        return v4;
      }
      return 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaControlInfoFaceTimeAudio getInfoUnserialized:type:].cold.1();
    }
  }
  return v4;
}

- (int)setInfo:(void *)a3 size:(unint64_t)a4 type:(unsigned int)a5
{
  int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  if (a5 >= 0x16)
  {
    v5 = -2144403455;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:].cold.1();
    }
  }
  else
  {
    switch(a5)
    {
      case 0u:
      case 1u:
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
      case 9u:
      case 0x13u:
      case 0x14u:
        v5 = -2144403455;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:].cold.2();
        }
        return v5;
      case 2u:
        v5 = 0;
        self->super._bitmap |= 2u;
        self->_controlFeedbackParameter.connectionStatsBuffer = *(_DWORD *)a3;
        return v5;
      case 0xAu:
        v5 = 0;
        self->super._bitmap |= 0x40u;
        self->_controlInfoArrivalTime = *(double *)a3;
        return v5;
      case 0xBu:
        v5 = 0;
        self->super._bitmap |= 0x20u;
        v6 = *(_DWORD *)a3;
        v7 = 68;
        goto LABEL_16;
      case 0xCu:
        v5 = 0;
        self->super._bitmap |= 0x10u;
        v6 = *(_DWORD *)a3;
        v7 = 64;
        goto LABEL_16;
      case 0xDu:
        v5 = 0;
        self->super._bitmap |= 0x400u;
        self->_controlInfoSequenceNumber = *(_WORD *)a3;
        return v5;
      case 0xEu:
        v5 = 0;
        self->super._bitmap |= 0x800u;
        v8 = *(_BYTE *)a3;
        v9 = 132;
        goto LABEL_19;
      case 0xFu:
        v5 = 0;
        self->super._bitmap |= 0x1000u;
        v8 = *(_BYTE *)a3;
        v9 = 133;
        goto LABEL_19;
      case 0x10u:
        v5 = 0;
        self->super._bitmap |= 0x200u;
        v6 = *(_DWORD *)a3;
        v7 = 72;
        goto LABEL_16;
      case 0x11u:
        v5 = 0;
        self->super._bitmap |= 0x100u;
        v6 = *(_DWORD *)a3;
        v7 = 76;
LABEL_16:
        *(_DWORD *)((char *)&self->super.super.isa + v7) = v6;
        return v5;
      case 0x12u:
        v5 = 0;
        self->super._bitmap |= 0x2000u;
        v8 = *(_BYTE *)a3;
        v9 = 135;
        goto LABEL_19;
      case 0x15u:
        v5 = 0;
        self->super._bitmap |= 0x15u;
        v8 = *(_BYTE *)a3;
        v9 = 136;
LABEL_19:
        *((_BYTE *)&self->super.super.isa + v9) = v8;
        break;
      default:
        v5 = 0;
        break;
    }
  }
  return v5;
}

- (BOOL)hasInfoType:(unsigned int)a3
{
  return a3 <= 0x12 && ((0x7FC07u >> a3) & 1) != 0 && (unsigned __int16)(self->super._bitmap & word_1D9110BCC[a3]) != 0;
}

- (int)setInfoUnserialized:(id *)a3 type:(unsigned int)a4
{
  int v4;
  unsigned __int16 bitmap;
  __int16 v6;

  v4 = -2144403455;
  if (a3)
  {
    if (a4 == 1)
    {
      v4 = 0;
      self->super._bitmap |= 0x80u;
      self->_controlFeedbackParameter.owrd = a3->var10;
      self->_controlFeedbackParameter.queuingDelay = a3->var8;
      self->_controlFeedbackParameter.sendTimestamp = a3->var9;
    }
    else if (a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaControlInfoFaceTimeAudio setInfoUnserialized:type:].cold.1();
      }
    }
    else
    {
      bitmap = self->super._bitmap;
      v6 = bitmap | 1;
      self->super._bitmap = bitmap | 1;
      if (self->_videoEnabled)
      {
        v6 = bitmap | 5;
        self->super._bitmap = bitmap | 5;
      }
      if (self->_ecnEnabled)
      {
        self->super._bitmap = v6 | 8;
        *(_DWORD *)&self->_controlFeedbackParameter.ecnECT1Count = *(_DWORD *)&a3->var12;
      }
      v4 = 0;
      *(_QWORD *)&self->_controlFeedbackParameter.timeStamp = *(_QWORD *)&a3->var0;
      *(_DWORD *)&self->_controlFeedbackParameter.audioBurstLoss = *(_DWORD *)&a3->var4;
      *(_QWORD *)&self->_controlFeedbackParameter.totalReceivedKBytes = *(_QWORD *)&a3->var6;
    }
  }
  return v4;
}

- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6
{
  int result;
  unsigned int connectionStatsBuffer;
  int ErrorLogLevelForModule;
  _BOOL4 v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = -2144403442;
  if (!a3)
    return -2144403455;
  switch(a6)
  {
    case 2u:
      if ((self->super._bitmap & 2) == 0)
        goto LABEL_40;
      if (a4 >= 4)
      {
        connectionStatsBuffer = self->_controlFeedbackParameter.connectionStatsBuffer;
        goto LABEL_37;
      }
      break;
    case 0xAu:
      if ((self->super._bitmap & 0x40) == 0)
        goto LABEL_40;
      if (a4 >= 8)
      {
        *(double *)a3 = self->_controlInfoArrivalTime;
        if (!a5)
          goto LABEL_46;
        result = 0;
        v11 = 8;
        goto LABEL_45;
      }
      break;
    case 0xBu:
      if ((self->super._bitmap & 0x20) == 0)
        goto LABEL_40;
      if (a4 >= 4)
      {
        v12 = 68;
        goto LABEL_36;
      }
      break;
    case 0xCu:
      if ((self->super._bitmap & 0x10) == 0)
        goto LABEL_40;
      if (a4 >= 4)
      {
        v12 = 64;
        goto LABEL_36;
      }
      break;
    case 0xDu:
      if ((self->super._bitmap & 0x400) == 0)
        goto LABEL_40;
      if (a4 >= 2)
      {
        *(_WORD *)a3 = self->_controlInfoSequenceNumber;
        if (!a5)
          goto LABEL_46;
        result = 0;
        v11 = 2;
        goto LABEL_45;
      }
      break;
    case 0xEu:
      if ((self->super._bitmap & 0x800) == 0)
        goto LABEL_40;
      if (a4)
      {
        v13 = 132;
        goto LABEL_43;
      }
      break;
    case 0xFu:
      if ((self->super._bitmap & 0x1000) == 0)
        goto LABEL_40;
      if (a4)
      {
        v13 = 133;
        goto LABEL_43;
      }
      break;
    case 0x10u:
      if ((self->super._bitmap & 0x200) == 0)
        goto LABEL_40;
      if (a4 >= 4)
      {
        v12 = 72;
        goto LABEL_36;
      }
      break;
    case 0x11u:
      if ((self->super._bitmap & 0x100) == 0)
        goto LABEL_40;
      if (a4 >= 4)
      {
        v12 = 76;
LABEL_36:
        connectionStatsBuffer = *(_DWORD *)((char *)&self->super.super.isa + v12);
LABEL_37:
        *(_DWORD *)a3 = connectionStatsBuffer;
        if (a5)
        {
          result = 0;
          v11 = 4;
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      break;
    case 0x12u:
      if ((self->super._bitmap & 0x2000) != 0)
      {
        if (a4)
        {
          v13 = 135;
LABEL_43:
          *(_BYTE *)a3 = *((_BYTE *)&self->super.super.isa + v13);
          if (a5)
          {
            result = 0;
            v11 = 1;
LABEL_45:
            *a5 = v11;
          }
          else
          {
LABEL_46:
            result = 0;
          }
        }
      }
      else
      {
LABEL_40:
        result = -2144403434;
      }
      break;
    default:
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      result = -2144403455;
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        result = -2144403455;
        if (v10)
        {
          -[VCMediaControlInfoFaceTimeAudio getInfo:bufferLength:infoSize:type:].cold.1();
          return -2144403455;
        }
      }
      break;
  }
  return result;
}

- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5
{
  return VCMediaControlInfoFaceTimeAudio_SerializeBuffer((uint64_t)self, a3, a4, (uint64_t *)a5);
}

- (BOOL)videoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)ecnEnabled
{
  return self->_ecnEnabled;
}

- (void)setEcnEnabled:(BOOL)a3
{
  self->_ecnEnabled = a3;
}

- (void)configureWithBuffer:(uint64_t)a1 length:(void *)a2 optionalControlInfo:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10_1(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v2, v3, " [%s] %s:%d %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_19();
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Handle optional control info failed with error %08X for FaceTime audio", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaControlInfoUnserializeWithData failed with error %08X for FaceTime audio", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)getInfoUnserialized:type:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio getInfoUnserialized:type:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Does not support type %d", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio getInfoUnserialized:type:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setInfo:size:type:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio setInfo:size:type:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Value passed is invalid type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio setInfo:size:type:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setInfo:size:type:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio setInfo:size:type:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Does not support type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio setInfo:size:type:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setInfoUnserialized:type:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio setInfoUnserialized:type:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Does not support type %d", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio setInfoUnserialized:type:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)getInfo:bufferLength:infoSize:type:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio getInfo:bufferLength:infoSize:type:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Does not support type %d", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio getInfo:bufferLength:infoSize:type:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

@end
