@implementation VCMediaNegotiationBlobV2StreamGroupStream

- (VCMediaNegotiationBlobV2StreamGroupStream)initWithStreamConfig:(id)a3 payloadConfigs:(id)a4 streamGroupID:(unsigned int)a5 defaultConfig:(id)a6
{
  VCMediaNegotiationBlobV2StreamGroupStream *v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = -[VCMediaNegotiationBlobV2StreamGroupStream init](self, "init", a3, a4, *(_QWORD *)&a5);
  if (v9)
  {
    -[VCMediaNegotiationBlobV2StreamGroupStream setStreamIndex:](v9, "setStreamIndex:", objc_msgSend(a6, "streamIndex"));
    if (!-[VCMediaNegotiationBlobV2StreamGroupStream initSSRC:](v9, "initSSRC:", a3))
    {
LABEL_43:

      return 0;
    }
    v10 = objc_msgSend(a3, "maxNetworkBitrate");
    if (v10 != objc_msgSend(a6, "maxNetworkBitrate"))
      -[VCMediaNegotiationBlobV2StreamGroupStream setMaxNetworkBitrateV2:](v9, "setMaxNetworkBitrateV2:", objc_msgSend(a3, "maxNetworkBitrate"));
    if (objc_msgSend(a3, "repairedStreamID"))
    {
      v11 = objc_msgSend(a3, "repairedMaxNetworkBitrate");
      if (v11 != objc_msgSend(a6, "repairedMaxNetworkBitrate"))
        -[VCMediaNegotiationBlobV2StreamGroupStream setRepairedMaxNetworkBitrateV2:](v9, "setRepairedMaxNetworkBitrateV2:", objc_msgSend(a3, "repairedMaxNetworkBitrate"));
    }
    if (objc_msgSend(a3, "repairedStreamID")
      && !objc_msgSend(a6, "repairedMaxNetworkBitrate"))
    {
      -[VCMediaNegotiationBlobV2StreamGroupStream setRepairedMaxNetworkBitrate:](v9, "setRepairedMaxNetworkBitrate:", objc_msgSend(a3, "repairedMaxNetworkBitrate"));
    }
    if (!objc_msgSend(a3, "repairedStreamID")
      && objc_msgSend(a6, "repairedMaxNetworkBitrate"))
    {
      -[VCMediaNegotiationBlobV2StreamGroupStream setRepairedMaxNetworkBitrate:](v9, "setRepairedMaxNetworkBitrate:", 0);
    }
    v12 = objc_msgSend(a3, "audioChannelCount");
    if (v12 != objc_msgSend(a6, "audioChannelCount"))
      -[VCMediaNegotiationBlobV2StreamGroupStream setAudioChannelCount:](v9, "setAudioChannelCount:", objc_msgSend(a3, "audioChannelCount"));
    v13 = +[VCMediaNegotiationBlobV2StreamGroupStream metadataWithStreamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "metadataWithStreamConfig:", a3);
    if ((_DWORD)v13 != +[VCMediaNegotiationBlobV2StreamGroupStream metadataWithStreamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "metadataWithStreamConfig:", a6))-[VCMediaNegotiationBlobV2StreamGroupStream setMetadata:](v9, "setMetadata:", v13);
    if (objc_msgSend((id)objc_msgSend(a3, "codecs", 0), "count"))
    {
      if (!+[VCMediaNegotiationBlobV2StreamGroupStream payloadSpecWithStreamConfig:payloadConfigs:payloadSpecs:](VCMediaNegotiationBlobV2StreamGroupStream, "payloadSpecWithStreamConfig:payloadConfigs:payloadSpecs:", a3, a4, &v17))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:defaultConfig:].cold.5();
        }
        goto LABEL_43;
      }
      if (!+[VCMediaNegotiationBlobV2StreamGroupStream payloadSpecWithStreamConfig:payloadConfigs:payloadSpecs:](VCMediaNegotiationBlobV2StreamGroupStream, "payloadSpecWithStreamConfig:payloadConfigs:payloadSpecs:", a6, 0, &v16))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:defaultConfig:].cold.4();
        }
        goto LABEL_43;
      }
    }
    else
    {
      if (!+[VCMediaNegotiationBlobV2StreamGroupStream payloadsWithStreamConfig:payloadBitmap:](VCMediaNegotiationBlobV2StreamGroupStream, "payloadsWithStreamConfig:payloadBitmap:", a3, &v17))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:defaultConfig:].cold.3();
        }
        goto LABEL_43;
      }
      if (!+[VCMediaNegotiationBlobV2StreamGroupStream payloadsWithStreamConfig:payloadBitmap:](VCMediaNegotiationBlobV2StreamGroupStream, "payloadsWithStreamConfig:payloadBitmap:", a6, &v16))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:defaultConfig:].cold.2();
        }
        goto LABEL_43;
      }
    }
    if (v17 != v16)
      -[VCMediaNegotiationBlobV2StreamGroupStream setPayloadSpecOrPayloads:](v9, "setPayloadSpecOrPayloads:");
    v14 = objc_msgSend(a3, "coordinateSystem");
    if (v14 != objc_msgSend(a6, "coordinateSystem")
      && !-[VCMediaNegotiationBlobV2StreamGroupStream setNegotiatedCoordinateSystemFromCoordinateSystem:](v9, "setNegotiatedCoordinateSystemFromCoordinateSystem:", objc_msgSend(a3, "coordinateSystem")))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:defaultConfig:].cold.1();
      }
      goto LABEL_43;
    }
  }
  return v9;
}

- (VCMediaNegotiationBlobV2StreamGroupStream)initWithStreamConfig:(id)a3 payloadConfigs:(id)a4 streamGroupID:(unsigned int)a5
{
  uint64_t v6;
  id v9;
  id v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  id v18;
  void *v19;
  uint64_t v21;
  NSObject *v22;
  unsigned __int8 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:].cold.1();
    }
    goto LABEL_48;
  }
  v6 = *(_QWORD *)&a5;
  if (objc_msgSend((id)objc_msgSend(a3, "codecs"), "count") && objc_msgSend((id)objc_msgSend(a3, "payloads"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316674;
        v25 = v21;
        v26 = 2080;
        v27 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:]";
        v28 = 1024;
        v29 = 387;
        v30 = 2080;
        v31 = FourccToCStr(v6);
        v32 = 1024;
        v33 = objc_msgSend(a3, "qualityIndex");
        v34 = 2112;
        v35 = objc_msgSend(a3, "payloads");
        v36 = 2112;
        v37 = objc_msgSend(a3, "codecs");
        _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d groupID='%s' qualityIndex=%u Unable to encode both payload and payload specs. payloads=%@ codecs=%@", buf, 0x40u);
      }
    }
    goto LABEL_48;
  }
  v23 = -1;
  if (+[VCMediaNegotiationBlobV2StreamGroupStream streamIndex:forStreamGroupID:qualityIndex:isFallbackStream:](VCMediaNegotiationBlobV2StreamGroupStream, "streamIndex:forStreamGroupID:qualityIndex:isFallbackStream:", &v23, v6, objc_msgSend(a3, "qualityIndex"), +[VCMediaNegotiationBlobV2StreamGroupStream isFallbackStreamWithStreamGroupID:streamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "isFallbackStreamWithStreamGroupID:streamConfig:", v6, a3)))
  {
    v9 = +[VCMediaNegotiationBlobV2StreamGroupStream defaultsForStreamGroupID:streamIndex:](VCMediaNegotiationBlobV2StreamGroupStream, "defaultsForStreamGroupID:streamIndex:", v6, v23);
    if (v9)
    {
      v10 = v9;
      self = -[VCMediaNegotiationBlobV2StreamGroupStream initWithStreamConfig:payloadConfigs:streamGroupID:defaultConfig:](self, "initWithStreamConfig:payloadConfigs:streamGroupID:defaultConfig:", a3, a4, v6, v9);
      goto LABEL_30;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:].cold.2();
    }
LABEL_48:

    return 0;
  }
  v11 = +[VCMediaNegotiationBlobV2StreamGroupStream metadataWithStreamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "metadataWithStreamConfig:", a3);
  if (-[VCMediaNegotiationBlobV2StreamGroupStream metadata](self, "metadata") != (_DWORD)v11)
    -[VCMediaNegotiationBlobV2StreamGroupStream setMetadata:](self, "setMetadata:", v11);
  *(_DWORD *)buf = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "codecs"), "count"))
  {
    if (!+[VCMediaNegotiationBlobV2StreamGroupStream payloadSpecWithStreamConfig:payloadConfigs:payloadSpecs:](VCMediaNegotiationBlobV2StreamGroupStream, "payloadSpecWithStreamConfig:payloadConfigs:payloadSpecs:", a3, a4, buf))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:].cold.5();
      }
      goto LABEL_48;
    }
  }
  else if (!+[VCMediaNegotiationBlobV2StreamGroupStream payloadsWithStreamConfig:payloadBitmap:](VCMediaNegotiationBlobV2StreamGroupStream, "payloadsWithStreamConfig:payloadBitmap:", a3, buf))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:].cold.4();
    }
    goto LABEL_48;
  }
  v12 = -[VCMediaNegotiationBlobV2StreamGroupStream payloadSpecOrPayloads](self, "payloadSpecOrPayloads");
  if (v12 != *(_DWORD *)buf)
    -[VCMediaNegotiationBlobV2StreamGroupStream setPayloadSpecOrPayloads:](self, "setPayloadSpecOrPayloads:");
  v13 = -[VCMediaNegotiationBlobV2StreamGroupStream qualityIndex](self, "qualityIndex");
  if (v13 != objc_msgSend(a3, "qualityIndex"))
    -[VCMediaNegotiationBlobV2StreamGroupStream setQualityIndex:](self, "setQualityIndex:", objc_msgSend(a3, "qualityIndex"));
  if (!-[VCMediaNegotiationBlobV2StreamGroupStream initSSRC:](self, "initSSRC:", a3))
    goto LABEL_48;
  v14 = -[VCMediaNegotiationBlobV2StreamGroupStream maxNetworkBitrateV2](self, "maxNetworkBitrateV2");
  if (v14 != objc_msgSend(a3, "maxNetworkBitrate"))
    -[VCMediaNegotiationBlobV2StreamGroupStream setMaxNetworkBitrateV2:](self, "setMaxNetworkBitrateV2:", objc_msgSend(a3, "maxNetworkBitrate"));
  if (objc_msgSend(a3, "repairedStreamID"))
  {
    v15 = -[VCMediaNegotiationBlobV2StreamGroupStream repairedMaxNetworkBitrateV2](self, "repairedMaxNetworkBitrateV2");
    if (v15 != objc_msgSend(a3, "repairedMaxNetworkBitrate"))
      -[VCMediaNegotiationBlobV2StreamGroupStream setRepairedMaxNetworkBitrateV2:](self, "setRepairedMaxNetworkBitrateV2:", objc_msgSend(a3, "repairedMaxNetworkBitrate"));
  }
  v16 = -[VCMediaNegotiationBlobV2StreamGroupStream audioChannelCount](self, "audioChannelCount");
  if (v16 != objc_msgSend(a3, "audioChannelCount"))
    -[VCMediaNegotiationBlobV2StreamGroupStream setAudioChannelCount:](self, "setAudioChannelCount:", objc_msgSend(a3, "audioChannelCount"));
  v17 = -[VCMediaNegotiationBlobV2StreamGroupStream coordinateSystem](self, "coordinateSystem");
  if (v17 != objc_msgSend(a3, "coordinateSystem")
    && !-[VCMediaNegotiationBlobV2StreamGroupStream setNegotiatedCoordinateSystemFromCoordinateSystem:](self, "setNegotiatedCoordinateSystemFromCoordinateSystem:", objc_msgSend(a3, "coordinateSystem")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:].cold.3();
    }
    goto LABEL_48;
  }
  v10 = 0;
LABEL_30:
  v18 = -[VCMediaNegotiationBlobV2StreamGroupStream compressWithConfig:](self, "compressWithConfig:", v10);
  if (v18)
  {
    v19 = v18;

    return (VCMediaNegotiationBlobV2StreamGroupStream *)v19;
  }
  return self;
}

- (BOOL)initSSRC:(id)a3
{
  unsigned int v5;
  unsigned __int16 v6;
  int v7;
  int v8;
  unsigned __int16 v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = -[VCMediaNegotiationBlobV2StreamGroupStream rtpSSRC](self, "rtpSSRC");
  if (v5 == objc_msgSend(a3, "ssrc"))
    goto LABEL_13;
  v6 = objc_msgSend(a3, "ssrc");
  if (objc_msgSend(a3, "streamID") != v6)
  {
    -[VCMediaNegotiationBlobV2StreamGroupStream setStreamID:](self, "setStreamID:", objc_msgSend(a3, "streamID"));
    v6 = objc_msgSend(a3, "streamID");
  }
  if (!objc_msgSend(a3, "v2StreamID"))
    goto LABEL_10;
  if (v6 >= 0xFF9Bu)
    v7 = -65435;
  else
    v7 = 100;
  v8 = v7 + v6;
  if (v8 == objc_msgSend(a3, "v2StreamID"))
  {
    -[VCMediaNegotiationBlobV2StreamGroupStream setPayloadsVersion:](self, "setPayloadsVersion:", 2);
LABEL_10:
    if (!objc_msgSend(a3, "repairedStreamID")
      || (v9 = v6 + 1, objc_msgSend(a3, "repairedStreamID") == (unsigned __int16)(v6 + 1)))
    {
      -[VCMediaNegotiationBlobV2StreamGroupStream setRtpSSRC:](self, "setRtpSSRC:", objc_msgSend(a3, "ssrc"));
LABEL_13:
      LOBYTE(v10) = 1;
      return v10;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v10)
        return v10;
      v16 = 136316162;
      v17 = v14;
      v18 = 2080;
      v19 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initSSRC:]";
      v20 = 1024;
      v21 = 463;
      v22 = 1024;
      v23 = objc_msgSend(a3, "repairedStreamID");
      v24 = 1024;
      v25 = v9;
      v13 = " [%s] %s:%d repairedStreamID=%u does not match lower 16 bits of SSRC + 1 (%u)";
LABEL_21:
      _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v16, 0x28u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v10)
      return v10;
    v16 = 136316162;
    v17 = v11;
    v18 = 2080;
    v19 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initSSRC:]";
    v20 = 1024;
    v21 = 457;
    v22 = 1024;
    v23 = objc_msgSend(a3, "v2StreamID");
    v24 = 1024;
    v25 = v8;
    v13 = " [%s] %s:%d v2StreamID=%u does not match lower 16 bits of SSRC + 100 (%u)";
    goto LABEL_21;
  }
LABEL_22:
  LOBYTE(v10) = 0;
  return v10;
}

- (id)streamConfigWithPayloadConfigs:(id)a3 payloadConfigSampleRates:(id)a4 streamGroupID:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  VCMediaNegotiatorStreamGroupStreamConfiguration *v15;
  char v16;
  unsigned __int16 v17;
  unsigned int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  VCMediaNegotiatorStreamGroupStreamConfiguration *v23;
  uint64_t v25;
  NSObject *v26;
  char *v27;
  char v28;
  unsigned int v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  char *v37;
  __int16 v38;
  unsigned int v39;
  uint64_t v40;

  v5 = *(_QWORD *)&a5;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a3, "count");
  if (v9 != objc_msgSend(a4, "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:].cold.6();
    }
    goto LABEL_46;
  }
  v10 = -[VCMediaNegotiationBlobV2StreamGroupStream actualStreamIndex](self, "actualStreamIndex");
  v29 = -[VCMediaNegotiationBlobV2StreamGroupStream qualityIndex](self, "qualityIndex");
  if (v10 == 255)
  {
    if ((*(_WORD *)&self->_has & 0x80) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:].cold.1(v11, v5, v12);
      }
LABEL_46:
      v15 = 0;
LABEL_47:
      v23 = 0;
      goto LABEL_36;
    }
  }
  else
  {
    v28 = 0;
    if (!+[VCMediaNegotiationBlobV2StreamGroupStream qualityIndex:isFallbackStream:forStreamGroupID:streamIndex:](VCMediaNegotiationBlobV2StreamGroupStream, "qualityIndex:isFallbackStream:forStreamGroupID:streamIndex:", &v29, &v28, v5, v10))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v27 = FourccToCStr(v5);
          *(_DWORD *)buf = 136316162;
          v31 = v25;
          v32 = 2080;
          v33 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRat"
                "es:streamGroupID:]";
          v34 = 1024;
          v35 = 486;
          v36 = 2080;
          v37 = v27;
          v38 = 1024;
          v39 = v10;
          _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to determine the quality index. streamGroupID=%s streamIndex=%d", buf, 0x2Cu);
        }
      }
      goto LABEL_46;
    }
    v13 = +[VCMediaNegotiationBlobV2StreamGroupStream defaultsForStreamGroupID:streamIndex:](VCMediaNegotiationBlobV2StreamGroupStream, "defaultsForStreamGroupID:streamIndex:", v5, v10);
    if (v13)
    {
      v14 = v13;
      v15 = (VCMediaNegotiatorStreamGroupStreamConfiguration *)v13;
      v16 = 0;
      goto LABEL_11;
    }
  }
  v15 = objc_alloc_init(VCMediaNegotiatorStreamGroupStreamConfiguration);
  v14 = 0;
  v16 = 1;
LABEL_11:
  if (!-[VCMediaNegotiationBlobV2StreamGroupStream readRequiredPacketPayloadWithStreamConfig:](self, "readRequiredPacketPayloadWithStreamConfig:", v15))
  {
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setStreamIndex:](v15, "setStreamIndex:", v10);
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setSsrc:](v15, "setSsrc:", -[VCMediaNegotiationBlobV2StreamGroupStream rtpSSRC](self, "rtpSSRC"));
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      v17 = -[VCMediaNegotiationBlobV2StreamGroupStream streamID](self, "streamID");
    else
      v17 = -[VCMediaNegotiationBlobV2StreamGroupStream rtpSSRC](self, "rtpSSRC");
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setStreamID:](v15, "setStreamID:", v17);
  }
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setQualityIndex:](v15, "setQualityIndex:", v29);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setRepairedMaxNetworkBitrate:](v15, "setRepairedMaxNetworkBitrate:", -[VCMediaNegotiationBlobV2StreamGroupStream actualMaxRepairedNetworkBitrateWithDefaultConfig:](self, "actualMaxRepairedNetworkBitrateWithDefaultConfig:", v14));
  if (-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsVersion](self, "payloadsVersion") == 2)
  {
    v18 = -[VCMediaNegotiatorStreamGroupStreamConfiguration streamID](v15, "streamID");
    if (v18 < 0xFF9B)
      v19 = 100;
    else
      v19 = 101;
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setV2StreamID:](v15, "setV2StreamID:", (unsigned __int16)(v19 + v18));
  }
  if (-[VCMediaNegotiatorStreamGroupStreamConfiguration repairedMaxNetworkBitrate](v15, "repairedMaxNetworkBitrate"))
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setRepairedStreamID:](v15, "setRepairedStreamID:", (unsigned __int16)(-[VCMediaNegotiatorStreamGroupStreamConfiguration streamID](v15, "streamID") + 1));
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setAudioChannelCount:](v15, "setAudioChannelCount:", -[VCMediaNegotiationBlobV2StreamGroupStream actualAudioChannelCountWithDefaultConfig:](self, "actualAudioChannelCountWithDefaultConfig:", v14));
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setMaxNetworkBitrate:](v15, "setMaxNetworkBitrate:", -[VCMediaNegotiationBlobV2StreamGroupStream actualMaxNetworkBitrateWithDefaultConfig:](self, "actualMaxNetworkBitrateWithDefaultConfig:", v14));
  v20 = -[VCMediaNegotiationBlobV2StreamGroupStream actualMetadataWithDefaultConfig:](self, "actualMetadataWithDefaultConfig:", v14);
  if (v20 >= 0x10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:].cold.2();
    }
    goto LABEL_47;
  }
  +[VCMediaNegotiationBlobV2StreamGroupStream updateStreamConfig:withMetadata:](VCMediaNegotiationBlobV2StreamGroupStream, "updateStreamConfig:withMetadata:", v15, v20);
  if ((v20 & 8) != 0)
  {
    if (!-[VCMediaNegotiationBlobV2StreamGroupStream updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:](self, "updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:", v15, v14, a3))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:].cold.5();
      }
      goto LABEL_47;
    }
    if (!objc_msgSend(a4, "count"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:].cold.4();
      }
      goto LABEL_47;
    }
    v22 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", objc_msgSend(-[NSArray firstObject](-[VCMediaNegotiatorStreamGroupStreamConfiguration codecs](v15, "codecs"), "firstObject"), "unsignedIntValue")), "unsignedIntValue");
    goto LABEL_32;
  }
  if (!-[VCMediaNegotiationBlobV2StreamGroupStream updatePayloadSpecsForConfig:defaultConfig:](self, "updatePayloadSpecsForConfig:defaultConfig:", v15, v14))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:].cold.3();
    }
    goto LABEL_47;
  }
  if ((v16 & 1) == 0)
  {
    v22 = objc_msgSend(v14, "rtpTimestampRate");
LABEL_32:
    v21 = v22;
    goto LABEL_33;
  }
  v21 = 24000;
LABEL_33:
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setRtpTimestampRate:](v15, "setRtpTimestampRate:", v21);
  if ((*(_WORD *)&self->_has & 2) != 0)
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setCoordinateSystem:](v15, "setCoordinateSystem:", -[VCMediaNegotiationBlobV2StreamGroupStream mediaStreamGroupCoordinateSystem](self, "mediaStreamGroupCoordinateSystem"));
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setSerializedSize:](v15, "setSerializedSize:", objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupStream data](self, "data"), "length"));
  v23 = v15;
  v15 = 0;
LABEL_36:

  return v23;
}

- (void)usePayloadSpecWithGroupID:(unsigned int)a3 qualityIndexForPayloadSpecIndex:(id)a4 defaultPayloadSpecsForQualityIndex:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
    v8 = +[VCMediaNegotiationBlobV2StreamGroupStream defaultsForStreamGroupID:streamIndex:](VCMediaNegotiationBlobV2StreamGroupStream, "defaultsForStreamGroupID:streamIndex:", *(_QWORD *)&a3, -[VCMediaNegotiationBlobV2StreamGroupStream streamIndex](self, "streamIndex"));
  else
    v8 = 0;
  v9 = -[VCMediaNegotiationBlobV2StreamGroupStream actualQualityIndexWithDefaultConfig:](self, "actualQualityIndexWithDefaultConfig:", v8);
  if ((-[VCMediaNegotiationBlobV2StreamGroupStream actualMetadataWithDefaultConfig:](self, "actualMetadataWithDefaultConfig:", v8) & 8) != 0)
  {
    if (!v8 || (*(_WORD *)&self->_has & 0x20) != 0)
    {
      v15 = -[VCMediaNegotiationBlobV2StreamGroupStream payloadSpecOrPayloads](self, "payloadSpecOrPayloads");
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        do
        {
          if (((1 << v17) & v16) != 0)
          {
            v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
            objc_msgSend(a4, "setObject:forKeyedSubscript:", v18, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17));
            v16 &= ~(1 << v17);
          }
          v17 = (v17 + 1);
        }
        while (v16);
      }
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = (void *)objc_msgSend(v8, "codecs");
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(a5, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9));
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
        }
        while (v12);
      }
    }
  }
}

+ (void)printWithLogFile:(void *)a3 prefix:(id)a4 streamConfig:(id)a5
{
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[%lu] %@"), objc_msgSend(a5, "serializedSize"), a4);
  objc_msgSend(v7, "appendFormat:", CFSTR("Stream: QualityIndex=%4d"), objc_msgSend(a5, "qualityIndex"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" SSRC=%08x StreamID=%5d NetworkBitrate=%6d"), objc_msgSend(a5, "ssrc"), objc_msgSend(a5, "streamID"), objc_msgSend(a5, "maxNetworkBitrate"));
  if (objc_msgSend(a5, "v2StreamID"))
    objc_msgSend(v7, "appendFormat:", CFSTR(" v2StreamID=%5d"), objc_msgSend(a5, "v2StreamID"));
  if (objc_msgSend(a5, "repairedStreamID"))
    objc_msgSend(v7, "appendFormat:", CFSTR(" Repair[ID=%5d NetworkBitrate=%6d]"), objc_msgSend(a5, "repairedStreamID"), objc_msgSend(a5, "repairedMaxNetworkBitrate"));
  +[VCMediaNegotiationBlobV2StreamGroupStream appendMetadata:toString:](VCMediaNegotiationBlobV2StreamGroupStream, "appendMetadata:toString:", +[VCMediaNegotiationBlobV2StreamGroupStream metadataWithStreamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "metadataWithStreamConfig:", a5), v7);
  if (objc_msgSend((id)objc_msgSend(a5, "codecs"), "count"))
    +[VCMediaNegotiationBlobV2StreamGroupStream appendPayloadsSpecsToString:streamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "appendPayloadsSpecsToString:streamConfig:", v7, a5);
  else
    +[VCMediaNegotiationBlobV2StreamGroupStream appendPayloadsToString:streamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "appendPayloadsToString:streamConfig:", v7, a5);
  objc_msgSend(v7, "appendFormat:", CFSTR(" RTPSampleRate=%d"), objc_msgSend(a5, "rtpTimestampRate"));
  if (objc_msgSend(a5, "audioChannelCount"))
    objc_msgSend(v7, "appendFormat:", CFSTR(" channels=%u"), objc_msgSend(a5, "audioChannelCount"));
  v8 = objc_msgSend(v7, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v9, v10, v11, v12, v13, v14, v8);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = v15;
      v19 = 2080;
      v20 = "+[VCMediaNegotiationBlobV2StreamGroupStream(Utils) printWithLogFile:prefix:streamConfig:]";
      v21 = 1024;
      v22 = 592;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

+ (BOOL)isDefaultPayloadConfigsWithStreamConfig:(id)a3 payloadConfigs:(id)a4 streamGroupID:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id obj;
  unsigned __int8 v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v5 = *(_QWORD *)&a5;
  v21 = *MEMORY[0x1E0C80C00];
  v15 = -1;
  LODWORD(v8) = +[VCMediaNegotiationBlobV2StreamGroupStream streamIndex:forStreamGroupID:qualityIndex:isFallbackStream:](VCMediaNegotiationBlobV2StreamGroupStream, "streamIndex:forStreamGroupID:qualityIndex:isFallbackStream:", &v15, *(_QWORD *)&a5, objc_msgSend(a3, "qualityIndex"), +[VCMediaNegotiationBlobV2StreamGroupStream isFallbackStreamWithStreamGroupID:streamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "isFallbackStreamWithStreamGroupID:streamConfig:", *(_QWORD *)&a5, a3));
  if ((_DWORD)v8)
  {
    v8 = +[VCMediaNegotiationBlobV2StreamGroupStream defaultsForStreamGroupID:streamIndex:](VCMediaNegotiationBlobV2StreamGroupStream, "defaultsForStreamGroupID:streamIndex:", v5, v15);
    if (v8)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      obj = (id)objc_msgSend(a3, "codecs");
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
LABEL_5:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(obj);
          LODWORD(v8) = +[VCMediaNegotiationBlobV2StreamGroupPayload isDefaultPayloadConfig:index:rtpSampleRate:streamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "isDefaultPayloadConfig:index:rtpSampleRate:streamGroupID:", objc_msgSend(a4, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "integerValue")), objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "integerValue"), objc_msgSend(a3, "rtpTimestampRate"), v5);
          if (!(_DWORD)v8)
            break;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
            LOBYTE(v8) = 1;
            if (v10)
              goto LABEL_5;
            return (char)v8;
          }
        }
      }
      else
      {
        LOBYTE(v8) = 1;
      }
    }
  }
  return (char)v8;
}

- (BOOL)usesPayloadConfigsWithGroupID:(unsigned int)a3
{
  id v4;

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
    v4 = +[VCMediaNegotiationBlobV2StreamGroupStream defaultsForStreamGroupID:streamIndex:](VCMediaNegotiationBlobV2StreamGroupStream, "defaultsForStreamGroupID:streamIndex:", *(_QWORD *)&a3, -[VCMediaNegotiationBlobV2StreamGroupStream streamIndex](self, "streamIndex"));
  else
    v4 = 0;
  return (-[VCMediaNegotiationBlobV2StreamGroupStream actualMetadataWithDefaultConfig:](self, "actualMetadataWithDefaultConfig:", v4) >> 3) & 1;
}

+ (BOOL)streamIndex:(char *)a3 forStreamGroupID:(unsigned int)a4 qualityIndex:(unsigned int)a5 isFallbackStream:(BOOL)a6
{
  _BOOL4 v9;
  char v12;
  int64_t v13;
  BOOL result;
  BOOL v16;
  int v17;
  BOOL v18;
  _BOOL4 v19;
  BOOL v20;
  int v21;
  BOOL v22;
  int v23;
  int v24;

  if (a4 == 1835623282 && a5 == 25 && !a6)
    goto LABEL_23;
  v9 = a6;
  if (a4 == 1835623282 && a5 == 200 && !a6)
    goto LABEL_11;
  v13 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
  if (a4 == 1835623282 && a5 == 240 && v13 == 8 && !v9)
    goto LABEL_19;
  if (a4 == 1667329381 && a5 == 35 && !v9)
    goto LABEL_23;
  if (a4 == 1667329381 && a5 == 62 && !v9)
    goto LABEL_11;
  if (a4 == 1667329381 && a5 == 125 && !v9)
    goto LABEL_19;
  if (a4 == 1667329381 && a5 == 250 && !v9)
  {
LABEL_35:
    v12 = 3;
    goto LABEL_24;
  }
  if (a4 == 1667329381 && a5 == 425 && !v9)
  {
LABEL_39:
    v12 = 4;
    goto LABEL_24;
  }
  if (a4 == 1667329381 && a5 == 1000 && !v9)
  {
LABEL_43:
    v12 = 5;
    goto LABEL_24;
  }
  if (a4 == 1667329381 && a5 == 1800 && !v9)
  {
LABEL_47:
    v12 = 6;
    goto LABEL_24;
  }
  if (a4 == 1937339233 && a5 == 101 && !v9)
    goto LABEL_23;
  if (a4 == 1937339233 && a5 == 332 && !v9)
    goto LABEL_11;
  if (a4 == 1935897189 && a5 == 100 && !v9)
    goto LABEL_23;
  v16 = a4 == 1935897189 && a5 == 120;
  v17 = !v16;
  if (v16 && !v9)
    goto LABEL_11;
  v18 = a4 == 1935897189 && a5 == 150;
  v19 = !v18;
  if (v18 && !v9)
  {
LABEL_19:
    v12 = 2;
    goto LABEL_24;
  }
  v20 = a4 == 1935897189 && a5 == 350;
  v21 = !v20;
  if (v20 && !v9)
    goto LABEL_35;
  v22 = a4 == 1935897189 && a5 == 390;
  v23 = !v22;
  if (v22 && !v9)
    goto LABEL_39;
  if (a4 == 1935897189 && a5 == 450 && !v9)
    goto LABEL_43;
  if (a4 == 1935897189 && a5 == 700 && !v9)
    goto LABEL_47;
  if (a4 == 1935897189 && a5 == 950 && !v9)
  {
    v12 = 7;
    goto LABEL_24;
  }
  v24 = !v9;
  if ((!v9 | v17) != 1)
  {
    v12 = 8;
    goto LABEL_24;
  }
  if ((v24 | v19) != 1)
  {
    v12 = 9;
    goto LABEL_24;
  }
  if ((v24 | v21) != 1)
  {
    v12 = 10;
    goto LABEL_24;
  }
  if ((v24 | v23) != 1)
  {
    v12 = 11;
    goto LABEL_24;
  }
  if (a4 == 1667329399 && a5 == 93 && !v9)
    goto LABEL_23;
  if (a4 == 1667329399 && a5 == 400 && !v9)
    goto LABEL_11;
  if (a4 == 1667329399 && a5 == 1250 && !v9)
    goto LABEL_19;
  if (a4 == 1835623287 && a5 == 27 && !v9)
    goto LABEL_23;
  if (a4 == 1835623287 && a5 == 162 && !v9)
    goto LABEL_11;
  if (a4 == 1667330164 && a5 == 15 && !v9 || a4 == 1718909044 && a5 == 96 && !v9)
    goto LABEL_23;
  if (a4 == 1718909044 && a5 == 135 && !v9)
  {
LABEL_11:
    v12 = 1;
LABEL_24:
    *a3 = v12;
    return 1;
  }
  if (a4 == 1718909044 && a5 == 275 && !v9)
    goto LABEL_19;
  if (a4 == 1650745716 && a5 == 98 && !v9)
    goto LABEL_11;
  if (a4 == 1650745716 && a5 == 140 && !v9)
    goto LABEL_19;
  if (a4 == 1936290409 && a5 == 30 && !v9)
    goto LABEL_23;
  if (a4 == 1936290409 && a5 == 210 && !v9)
    goto LABEL_11;
  if (a4 == 1717854580 && a5 == 99 && !v9)
  {
LABEL_23:
    v12 = 0;
    goto LABEL_24;
  }
  result = 0;
  if (a4 == 1717854580 && a5 == 145 && !v9)
    goto LABEL_11;
  return result;
}

+ (BOOL)qualityIndex:(unsigned int *)a3 isFallbackStream:(BOOL *)a4 forStreamGroupID:(unsigned int)a5 streamIndex:(unsigned __int8)a6
{
  int v9;
  BOOL v11;
  unsigned int v12;
  BOOL result;
  int64_t v14;

  if (a5 == 1835623282 && a6 == 0)
  {
    v11 = 0;
    v12 = 25;
    goto LABEL_9;
  }
  v9 = a6;
  if (a5 == 1835623282 && a6 == 1)
  {
    v11 = 0;
    v12 = 200;
LABEL_9:
    *a3 = v12;
    *a4 = v11;
    return 1;
  }
  v14 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
  if (a5 == 1835623282 && v9 == 2 && v14 == 8)
  {
    v11 = 0;
    v12 = 240;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && !v9)
  {
    v11 = 0;
    v12 = 35;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && v9 == 1)
  {
    v11 = 0;
    v12 = 62;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && v9 == 2)
  {
    v11 = 0;
    v12 = 125;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && v9 == 3)
  {
    v11 = 0;
    v12 = 250;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && v9 == 4)
  {
    v11 = 0;
    v12 = 425;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && v9 == 5)
  {
    v11 = 0;
    v12 = 1000;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && v9 == 6)
  {
    v11 = 0;
    v12 = 1800;
    goto LABEL_9;
  }
  if (a5 == 1937339233 && !v9)
  {
    v11 = 0;
    v12 = 101;
    goto LABEL_9;
  }
  if (a5 == 1937339233 && v9 == 1)
  {
    v11 = 0;
    v12 = 332;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && !v9)
  {
    v11 = 0;
    v12 = 100;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 1)
  {
    v11 = 0;
LABEL_48:
    v12 = 120;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 2)
  {
    v11 = 0;
LABEL_52:
    v12 = 150;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 3)
  {
    v11 = 0;
LABEL_56:
    v12 = 350;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 4)
  {
    v11 = 0;
LABEL_60:
    v12 = 390;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 5)
  {
    v11 = 0;
    v12 = 450;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 6)
  {
    v11 = 0;
    v12 = 700;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 7)
  {
    v11 = 0;
    v12 = 950;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 8)
  {
    v11 = 1;
    goto LABEL_48;
  }
  if (a5 == 1935897189 && v9 == 9)
  {
    v11 = 1;
    goto LABEL_52;
  }
  if (a5 == 1935897189 && v9 == 10)
  {
    v11 = 1;
    goto LABEL_56;
  }
  if (a5 == 1935897189 && v9 == 11)
  {
    v11 = 1;
    goto LABEL_60;
  }
  if (a5 == 1667329399 && !v9)
  {
    v11 = 0;
    v12 = 93;
    goto LABEL_9;
  }
  if (a5 == 1667329399 && v9 == 1)
  {
    v11 = 0;
    v12 = 400;
    goto LABEL_9;
  }
  if (a5 == 1667329399 && v9 == 2)
  {
    v11 = 0;
    v12 = 1250;
    goto LABEL_9;
  }
  if (a5 == 1835623287 && !v9)
  {
    v11 = 0;
    v12 = 27;
    goto LABEL_9;
  }
  if (a5 == 1835623287 && v9 == 1)
  {
    v11 = 0;
    v12 = 162;
    goto LABEL_9;
  }
  if (a5 == 1667330164 && !v9)
  {
    v11 = 0;
    v12 = 15;
    goto LABEL_9;
  }
  if (a5 == 1718909044 && !v9)
  {
    v11 = 0;
    v12 = 96;
    goto LABEL_9;
  }
  if (a5 == 1718909044 && v9 == 1)
  {
    v11 = 0;
    v12 = 135;
    goto LABEL_9;
  }
  if (a5 == 1718909044 && v9 == 2)
  {
    v11 = 0;
    v12 = 275;
    goto LABEL_9;
  }
  if (a5 == 1650745716 && v9 == 1)
  {
    v11 = 0;
    v12 = 98;
    goto LABEL_9;
  }
  if (a5 == 1650745716 && v9 == 2)
  {
    v11 = 0;
    v12 = 140;
    goto LABEL_9;
  }
  if (a5 == 1936290409 && !v9)
  {
    v11 = 0;
    v12 = 30;
    goto LABEL_9;
  }
  if (a5 == 1936290409 && v9 == 1)
  {
    v11 = 0;
    v12 = 210;
    goto LABEL_9;
  }
  if (a5 == 1717854580 && !v9)
  {
    v11 = 0;
    v12 = 99;
    goto LABEL_9;
  }
  if (a5 != 1717854580)
    return 0;
  result = 0;
  if (v9 == 1)
  {
    v11 = 0;
    v12 = 145;
    goto LABEL_9;
  }
  return result;
}

+ (id)defaultsForStreamGroupID:(unsigned int)a3 streamIndex:(unsigned __int8)a4
{
  int v4;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 v8;
  uint64_t v9;
  id result;
  uint64_t v11;
  unsigned __int16 v12;
  int64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  if ((int)a3 <= 1718909043)
  {
    if ((int)a3 <= 1667329398)
    {
      if (a3 != 1650745716)
      {
        if (a3 == 1667329381)
        {
          switch(a4)
          {
            case 0u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 0;
              LODWORD(v20) = 0;
              v18 = &unk_1E9EF9C38;
              v19 = 0x6000000060;
              LOWORD(v17) = 0;
              v16 = 0x5DC00000000FLL;
              v6 = 35;
              v7 = 35100;
              v9 = 20000;
              goto LABEL_52;
            case 1u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 1;
              LODWORD(v20) = 0;
              LOWORD(v17) = 0;
              result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 62, 63900, 50000, 15, 130000, 0, 0x5DC00000000FLL, v17, 0, &unk_1E9EF9C50, 0xC0000000C0, v20, v21);
              goto LABEL_90;
            case 2u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 2;
              LODWORD(v20) = 0;
              LOWORD(v17) = 0;
              result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 125, 114000, 100000, 15, 230000, 0, 0x5DC00000000FLL, v17, 0, &unk_1E9EF9C68, 0xF0000000F0, v20, v21);
              goto LABEL_90;
            case 3u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 3;
              LODWORD(v20) = 0;
              LOWORD(v17) = 0;
              result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 250, 225400, 200000, 30, 460500, 0, 0x5DC00000001ELL, v17, 0, &unk_1E9EF9C80, 0x14000000140, v20, v21);
              goto LABEL_90;
            case 4u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 4;
              LODWORD(v20) = 0;
              LOWORD(v17) = 0;
              result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 425, 451000, 400000, 30, 961000, 0, 0x5DC00000001ELL, v17, 0, &unk_1E9EF9C98, 0x1E0000001E0, v20, v21);
              goto LABEL_90;
            case 5u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 5;
              LODWORD(v20) = 0;
              LOWORD(v17) = 0;
              result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 1000, 902000, 800000, 30, 1370000, 0, 0x5DC00000001ELL, v17, 0, &unk_1E9EF9CB0, 0x2D0000002D0, v20, v21);
              goto LABEL_90;
            case 6u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 6;
              LODWORD(v20) = 0;
              LOWORD(v17) = 0;
              result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 1800, 1780000, 1600000, 30, 2710000, 0, 0x5DC00000001ELL, v17, 0, &unk_1E9EF9CC8, 0x44000000440, v20, v21);
              goto LABEL_90;
            default:
              goto LABEL_91;
          }
        }
        goto LABEL_91;
      }
      if (a4 != 2)
      {
        if (a4 != 1)
          goto LABEL_91;
        v9 = 70000;
        v7 = 80560;
        LODWORD(v21) = 0;
        BYTE4(v20) = 1;
        LODWORD(v20) = 0;
        v18 = &unk_1E9EF9F08;
        v19 = 0;
        LOWORD(v17) = 1;
        v16 = 0x5DC000000000;
        v6 = 98;
LABEL_52:
        v11 = 15;
        goto LABEL_89;
      }
      v7 = 130640;
      LODWORD(v21) = 0;
      BYTE4(v20) = 2;
      LODWORD(v20) = 0;
      v18 = &unk_1E9EF9F20;
      v19 = 0;
      LOWORD(v17) = 1;
      v16 = 0x5DC000000000;
      v6 = 140;
      v12 = -21072;
    }
    else
    {
      if (a3 == 1667329399)
      {
        if (a4 == 2)
        {
          v7 = 882600;
          LODWORD(v21) = 3;
          BYTE4(v20) = 2;
          LODWORD(v20) = 0;
          v19 = 0x2D0000002D0;
          v18 = &unk_1E9EF9E60;
          LOWORD(v17) = 0;
          v16 = 0x15F900000001ELL;
          v6 = 1250;
          v9 = 800000;
        }
        else
        {
          if (a4 != 1)
          {
            if (a4)
              goto LABEL_91;
            LODWORD(v21) = 3;
            BYTE4(v20) = 0;
            LODWORD(v20) = 0;
            v18 = &unk_1E9EF9E30;
            v19 = 0xC0000000C0;
            LOWORD(v17) = 0;
            v16 = 0x15F900000000FLL;
            v6 = 93;
            v7 = 63300;
LABEL_37:
            v9 = 50000;
            goto LABEL_52;
          }
          LODWORD(v21) = 3;
          BYTE4(v20) = 1;
          LODWORD(v20) = 0;
          v19 = 0x14000000140;
          v18 = &unk_1E9EF9E48;
          LOWORD(v17) = 0;
          v16 = 0x15F900000001ELL;
          v6 = 400;
          v7 = 220640;
          v9 = 200000;
        }
LABEL_86:
        v11 = 30;
        goto LABEL_89;
      }
      if (a3 == 1667330164)
      {
        if (a4 != 2)
        {
          if (a4 != 1)
          {
            if (a4)
              goto LABEL_91;
            LODWORD(v21) = 0;
            BYTE4(v20) = 0;
            LODWORD(v20) = 0;
            LOWORD(v17) = 0;
            +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 15, 5000, 5000, 2, 0, 0, 0x5DC000000000, v17, 0, &unk_1E9EF9EA8, 0, v20, v21);
LABEL_42:
            LODWORD(v21) = 0;
            BYTE4(v20) = v4;
            LODWORD(v20) = 0;
            LOWORD(v17) = 0;
            result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 96, 172772, 149252, 30, 344104, 0, 0x5DC00000001ELL, v17, 0, &unk_1E9EF9EC0, 0x30000000100, v20, v21);
            goto LABEL_90;
          }
LABEL_54:
          LODWORD(v21) = 0;
          BYTE4(v20) = a4;
          LODWORD(v20) = 0;
          LOWORD(v17) = 0;
          result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 135, 261812, 239252, 30, 522664, 0, 0x5DC00000001ELL, v17, 0, &unk_1E9EF9ED8, 0x30000000100, v20, v21);
          goto LABEL_90;
        }
LABEL_53:
        LODWORD(v21) = 0;
        BYTE4(v20) = a4;
        LODWORD(v20) = 0;
        LOWORD(v17) = 0;
        result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 275, 502452, 459252, 30, 864558, 0, 0x5DC00000001ELL, v17, 0, &unk_1E9EF9EF0, 0x30000000100, v20, v21);
        goto LABEL_90;
      }
      if (a3 != 1717854580)
        goto LABEL_91;
      if (a4 != 1)
      {
        if (a4)
          goto LABEL_91;
        LODWORD(v21) = 0;
        BYTE4(v20) = 0;
        LODWORD(v20) = 0;
        v18 = &unk_1E9EF9F68;
        v19 = 0;
        LOWORD(v17) = 1;
        v16 = 0x5DC000000000;
        v6 = 99;
        v7 = 59720;
        goto LABEL_37;
      }
      LODWORD(v21) = 0;
      BYTE4(v20) = 1;
      LODWORD(v20) = 0;
      v18 = &unk_1E9EF9F80;
      v19 = 0;
      LOWORD(v17) = 1;
      v16 = 0x5DC000000000;
      v6 = 145;
      v7 = 118960;
      v12 = -31072;
    }
    v9 = v12 | 0x10000u;
    goto LABEL_86;
  }
  if ((int)a3 <= 1935897188)
  {
    if (a3 != 1718909044)
    {
      if (a3 == 1835623282)
      {
        if (a4 != 1)
        {
          if (!a4)
          {
            LODWORD(v21) = 0;
            BYTE4(v20) = 0;
            LODWORD(v20) = 1;
            LOWORD(v17) = 0;
            result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 25, 28933, 13200, 16, 0, 0, 0x5DC000000000, v17, 0, &unk_1E9EF9BF0, 0, v20, v21);
            goto LABEL_90;
          }
          v13 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
          if (v4 == 2 && v13 == 8)
          {
            LODWORD(v21) = 0;
            BYTE4(v20) = 2;
            LODWORD(v20) = 1;
            LOWORD(v17) = 0;
            result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 240, 156800, 64000, 100, 0, 0, 0x5DC000000000, v17, 0, &unk_1E9EF9C20, 0, v20, v21);
            goto LABEL_90;
          }
          goto LABEL_91;
        }
        LODWORD(v21) = 0;
        BYTE4(v20) = 1;
        LODWORD(v20) = 1;
        v18 = &unk_1E9EF9C08;
        v19 = 0;
        LOWORD(v17) = 0;
        v16 = 0x5DC000000000;
        v6 = 200;
      }
      else
      {
        if (a3 != 1835623287)
          goto LABEL_91;
        if (a4 != 1)
        {
          if (!a4)
          {
            LODWORD(v21) = 0;
            BYTE4(v20) = 0;
            LODWORD(v20) = 1;
            v18 = &unk_1E9EF9E78;
            v19 = 0;
            LOWORD(v17) = 0;
            v16 = 0xBB8000000000;
            v6 = 27;
LABEL_48:
            v7 = 27066;
            v9 = 13200;
            v11 = 17;
LABEL_89:
            result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", v6, v7, v9, v11, 0, 0, v16, v17, 0, v18, v19, v20, v21);
LABEL_90:
            if (result)
              return result;
            goto LABEL_91;
          }
          goto LABEL_91;
        }
        LODWORD(v21) = 0;
        BYTE4(v20) = 1;
        LODWORD(v20) = 1;
        v18 = &unk_1E9EF9E90;
        v19 = 0;
        LOWORD(v17) = 0;
        v16 = 0xBB8000000000;
        v6 = 162;
      }
      goto LABEL_63;
    }
    if (a4 != 2)
    {
      if (a4 != 1)
      {
        if (a4)
          goto LABEL_91;
        goto LABEL_42;
      }
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  if (a3 == 1935897189)
  {
    switch(a4)
    {
      case 0u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 0;
        LODWORD(v20) = 0;
        LOWORD(v17) = 0;
        result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 100, 366666, 333333, 10, 0, 0, 0xBB800000000ALL, v17, 0, &unk_1E9EF9D10, 0x41A00000672, v20, v21);
        goto LABEL_90;
      case 1u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 1;
        LODWORD(v20) = 0;
        v19 = 0x41A00000672;
        v18 = &unk_1E9EF9D28;
        LOWORD(v17) = 1;
        v16 = 0xBB800000003CLL;
        v6 = 120;
        v7 = 550000;
        v9 = 500000;
        break;
      case 2u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 2;
        LODWORD(v20) = 0;
        v19 = 0x41A00000672;
        v18 = &unk_1E9EF9D40;
        LOWORD(v17) = 1;
        v16 = 0xBB800000003CLL;
        v6 = 150;
        v7 = 880000;
        v9 = 800000;
        break;
      case 3u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 3;
        LODWORD(v20) = 0;
        v19 = 0x41A00000672;
        v18 = &unk_1E9EF9D58;
        LOWORD(v17) = 1;
        v16 = 0xBB800000003CLL;
        v6 = 350;
        v7 = 1430000;
        v9 = 1300000;
        break;
      case 4u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 4;
        LODWORD(v20) = 0;
        v19 = 0x41A00000672;
        v18 = &unk_1E9EF9D70;
        LOWORD(v17) = 1;
        v16 = 0xBB800000003CLL;
        v6 = 390;
        v7 = 2310000;
        v9 = 2100000;
        break;
      case 5u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 5;
        LODWORD(v20) = 0;
        v19 = 0x41A00000672;
        v18 = &unk_1E9EF9D88;
        LOWORD(v17) = 1;
        v16 = 0xBB800000003CLL;
        v6 = 450;
        v7 = 3520000;
        v9 = 3200000;
        break;
      case 6u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 6;
        LODWORD(v20) = 0;
        v19 = 0x41A00000672;
        v18 = &unk_1E9EF9DA0;
        LOWORD(v17) = 1;
        v16 = 0xBB800000003CLL;
        v6 = 700;
        v7 = 4620000;
        v9 = 4200000;
        break;
      case 7u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 7;
        LODWORD(v20) = 0;
        v19 = 0x41A00000672;
        v18 = &unk_1E9EF9DB8;
        LOWORD(v17) = 1;
        v16 = 0xBB800000003CLL;
        v6 = 950;
        v7 = 5500000;
        v9 = 5000000;
        break;
      case 8u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 8;
        LODWORD(v20) = 0;
        LOWORD(v17) = 0;
        result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 120, 1100000, 1000000, 5, 0, 0, 0xBB8000000005, v17, 0, &unk_1E9EF9DD0, 0x41A00000672, v20, v21);
        goto LABEL_90;
      case 9u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 9;
        LODWORD(v20) = 0;
        v19 = 0x41A00000672;
        v18 = &unk_1E9EF9DE8;
        LOWORD(v17) = 0;
        v16 = 0xBB800000000FLL;
        v6 = 150;
        v7 = 2200000;
        v9 = 2000000;
        goto LABEL_52;
      case 0xAu:
        LODWORD(v21) = 1;
        BYTE4(v20) = 10;
        LODWORD(v20) = 0;
        v19 = 0x41A00000672;
        v18 = &unk_1E9EF9E00;
        LOWORD(v17) = 0;
        v16 = 0xBB800000001ELL;
        v6 = 350;
        v7 = 3300000;
        v9 = 3000000;
        goto LABEL_86;
      case 0xBu:
        LODWORD(v21) = 1;
        BYTE4(v20) = 11;
        LODWORD(v20) = 0;
        v19 = 0x41A00000672;
        v18 = &unk_1E9EF9E18;
        LOWORD(v17) = 0;
        v16 = 0xBB800000003CLL;
        v6 = 390;
        v7 = 4400000;
        v9 = 4000000;
        break;
      default:
        goto LABEL_91;
    }
    v11 = 60;
    goto LABEL_89;
  }
  if (a3 != 1936290409)
  {
    if (a3 != 1937339233)
      goto LABEL_91;
    if (a4 == 1)
    {
      v7 = 157600;
      LODWORD(v21) = 0;
      BYTE4(v20) = 1;
      LODWORD(v20) = 2;
      v18 = &unk_1E9EF9CF8;
      v19 = 0;
      LOWORD(v17) = 0;
      v16 = 0xBB8000000000;
      v6 = 332;
      v9 = 128000;
LABEL_65:
      v11 = 25;
      goto LABEL_89;
    }
    if (a4)
      goto LABEL_91;
    LODWORD(v21) = 0;
    BYTE4(v20) = 0;
    LODWORD(v20) = 2;
    v18 = &unk_1E9EF9CE0;
    v19 = 0;
    LOWORD(v17) = 0;
    v16 = 0xBB8000000000;
    v6 = 101;
    v8 = 14064;
LABEL_64:
    v7 = v8 | 0x10000u;
    v9 = 48000;
    goto LABEL_65;
  }
  if (a4 == 1)
  {
    LODWORD(v21) = 0;
    BYTE4(v20) = 1;
    LODWORD(v20) = 1;
    v18 = &unk_1E9EF9F50;
    v19 = 0;
    LOWORD(v17) = 0;
    v16 = 0xBB8000000000;
    v6 = 332;
LABEL_63:
    v8 = 5664;
    goto LABEL_64;
  }
  if (!a4)
  {
    LODWORD(v21) = 0;
    BYTE4(v20) = 0;
    LODWORD(v20) = 1;
    v18 = &unk_1E9EF9F38;
    v19 = 0;
    LOWORD(v17) = 0;
    v16 = 0xBB8000000000;
    v6 = 101;
    goto LABEL_48;
  }
LABEL_91:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v23 = v14;
      v24 = 2080;
      v25 = "+[VCMediaNegotiationBlobV2StreamGroupStream(Utils) defaultsForStreamGroupID:streamIndex:]";
      v26 = 1024;
      v27 = 869;
      v28 = 2080;
      v29 = FourccToCStr(a3);
      v30 = 1024;
      v31 = v4;
      _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate config for known stream type. streamGroupID=%s streamIndex=%d!", buf, 0x2Cu);
    }
  }
  return 0;
}

+ (BOOL)isFallbackStreamWithStreamGroupID:(unsigned int)a3 streamConfig:(id)a4
{
  if (a3 != 1935897189)
    return 0;
  if ((objc_msgSend(a4, "isTemporalStream") & 1) != 0)
    return 0;
  return objc_msgSend(a4, "qualityIndex") > 0x77;
}

+ (unsigned)metadataWithStreamConfig:(id)a3
{
  int v4;
  int v5;
  int v6;

  if (objc_msgSend(a3, "isTemporalStream"))
    v4 = 2;
  else
    v4 = 0;
  v5 = v4 | objc_msgSend(a3, "isSubStream");
  v6 = v5 | (4 * (objc_msgSend(a3, "keyFrameInterval") == 0));
  return v6 | (8 * (objc_msgSend((id)objc_msgSend(a3, "codecs"), "count") != 0));
}

+ (void)updateStreamConfig:(id)a3 withMetadata:(unsigned int)a4
{
  objc_msgSend(a3, "setIsSubStream:", a4 & 1);
  objc_msgSend(a3, "setIsTemporalStream:", (a4 >> 1) & 1);
  objc_msgSend(a3, "setKeyFrameInterval:", ((a4 >> 2) & 1) == 0);
}

+ (unsigned)payloadFlagWithPayload:(int)a3
{
  unsigned int result;

  if (a3 > 118)
  {
    switch(a3)
    {
      case 'w':
        result = 8;
        break;
      case '{':
        result = 1;
        break;
      case '|':
        result = 512;
        break;
      case '}':
        result = 1024;
        break;
      default:
LABEL_17:
        result = 0;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        return 2;
      case 'e':
        return 64;
      case 'f':
      case 'g':
      case 'i':
      case 'j':
      case 'k':
      case 'm':
        goto LABEL_17;
      case 'h':
        return 16;
      case 'l':
        return 32;
      case 'n':
        return 4;
      default:
        if (a3 == 13)
        {
          result = 256;
        }
        else
        {
          if (a3 != 20)
            goto LABEL_17;
          result = 128;
        }
        break;
    }
  }
  return result;
}

+ (BOOL)payloadsWithStreamConfig:(id)a3 payloadBitmap:(unsigned int *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  _BOOL4 v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (void *)objc_msgSend(a3, "payloads");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v16;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = +[VCMediaNegotiationBlobV2StreamGroupStream payloadFlagWithPayload:](VCMediaNegotiationBlobV2StreamGroupStream, "payloadFlagWithPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "unsignedIntValue"));
        if (!v11)
          break;
        v8 |= v11;
        if (v7 == ++v10)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_12;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_17;
      VRTraceErrorLogLevelToCSTR();
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v12)
      {
        +[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsWithStreamConfig:payloadBitmap:].cold.2();
        goto LABEL_17;
      }
    }
    else
    {
      v8 = 0;
LABEL_12:
      *a4 = v8;
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v12)
        return v12;
      +[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsWithStreamConfig:payloadBitmap:].cold.1();
    }
LABEL_17:
    LOBYTE(v12) = 0;
  }
  return v12;
}

+ (BOOL)payloadSpecWithStreamConfig:(id)a3 payloadConfigs:(id)a4 payloadSpecs:(unsigned int *)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = (void *)objc_msgSend(a3, "codecs");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v30;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v11)
        objc_enumerationMutation(v7);
      v13 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v12), "unsignedIntValue");
      if (a4)
      {
        if (objc_msgSend(a4, "count") <= (unint64_t)v13)
          break;
      }
      v10 |= 1 << v13;
      if (v9 == ++v12)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      v18 = 136316162;
      v19 = v15;
      v20 = 2080;
      v21 = "+[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadSpecWithStreamConfig:payloadConfigs:payloadSpecs:]";
      v22 = 1024;
      v23 = 937;
      v24 = 1024;
      v25 = v13;
      v26 = 2048;
      v27 = objc_msgSend(a4, "count");
      _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid index=%u in payload configs (%lul)", (uint8_t *)&v18, 0x2Cu);
    }
    LOBYTE(v14) = 0;
  }
  else
  {
    v10 = 0;
LABEL_12:
    *a5 = v10;
    LOBYTE(v14) = 1;
  }
  return v14;
}

+ (int)payloadsWithPayloadBit:(int)a3
{
  int result;

  if (a3 > 63)
  {
    if (a3 <= 255)
    {
      if (a3 == 64)
        return 101;
      if (a3 == 128)
        return 20;
    }
    else
    {
      switch(a3)
      {
        case 256:
          return 13;
        case 512:
          return 124;
        case 1024:
          return 125;
      }
    }
LABEL_15:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsWithPayloadBit:].cold.1();
    }
    return 128;
  }
  else
  {
    switch(a3)
    {
      case 1:
        return 123;
      case 2:
        return 100;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_15;
      case 4:
        return 110;
      case 8:
        return 119;
      default:
        if (a3 == 16)
        {
          result = 104;
        }
        else
        {
          if (a3 != 32)
            goto LABEL_15;
          result = 108;
        }
        break;
    }
  }
  return result;
}

- (unsigned)actualStreamIndex
{
  unsigned __int8 v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)&v4[3] = 0;
  *(_DWORD *)v4 = 0;
  if (-[NSData length](self->_requiredPackedPayload, "length") < 7)
  {
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      return self->_streamIndex;
    else
      return 255;
  }
  else
  {
    -[NSData getBytes:length:](self->_requiredPackedPayload, "getBytes:length:", v4, 7);
    return v4[0];
  }
}

- (unsigned)actualMaxNetworkBitrateWithDefaultConfig:(id)a3
{
  int *v6;
  void *v7;
  int v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v6 = &OBJC_IVAR___VCMediaNegotiationBlobV2StreamGroupStream__maxNetworkBitrateV2;
    return *(_DWORD *)((char *)&self->super.super.isa + *v6);
  }
  v9 = 0;
  v8 = 0;
  if (-[VCMediaNegotiationBlobV2StreamGroupStream readOptionalPacketPayload:](self, "readOptionalPacketPayload:", &v8))
    return HIWORD(v8);
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v6 = &OBJC_IVAR___VCMediaNegotiationBlobV2StreamGroupStream__maxNetworkBitrate;
    return *(_DWORD *)((char *)&self->super.super.isa + *v6);
  }
  if (a3)
    v7 = a3;
  else
    v7 = self;
  return objc_msgSend(v7, "maxNetworkBitrate");
}

- (unsigned)actualMaxRepairedNetworkBitrateWithDefaultConfig:(id)a3
{
  int *v4;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v4 = &OBJC_IVAR___VCMediaNegotiationBlobV2StreamGroupStream__repairedMaxNetworkBitrateV2;
    return *(_DWORD *)((char *)&self->super.super.isa + *v4);
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v4 = &OBJC_IVAR___VCMediaNegotiationBlobV2StreamGroupStream__repairedMaxNetworkBitrate;
    return *(_DWORD *)((char *)&self->super.super.isa + *v4);
  }
  if (a3)
    self = (VCMediaNegotiationBlobV2StreamGroupStream *)a3;
  return -[VCMediaNegotiationBlobV2StreamGroupStream repairedMaxNetworkBitrate](self, "repairedMaxNetworkBitrate");
}

- (unsigned)actualAudioChannelCountWithDefaultConfig:(id)a3
{
  void *v6;
  int v7;
  unsigned __int8 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v7 = 0;
  if (-[VCMediaNegotiationBlobV2StreamGroupStream readOptionalPacketPayload:](self, "readOptionalPacketPayload:", &v7))
    return v8;
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_audioChannelCount;
  if (a3)
    v6 = a3;
  else
    v6 = self;
  return objc_msgSend(v6, "audioChannelCount");
}

- (unsigned)actualMetadataWithDefaultConfig:(id)a3
{
  int v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = 0;
  if (-[VCMediaNegotiationBlobV2StreamGroupStream readOptionalPacketPayload:](self, "readOptionalPacketPayload:", &v6))
    return (unsigned __int16)v6;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_metadata;
  if (a3)
    return +[VCMediaNegotiationBlobV2StreamGroupStream metadataWithStreamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "metadataWithStreamConfig:", a3);
  return -[VCMediaNegotiationBlobV2StreamGroupStream metadata](self, "metadata");
}

- (unsigned)actualQualityIndexWithDefaultConfig:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_qualityIndex;
  if (a3)
    self = (VCMediaNegotiationBlobV2StreamGroupStream *)a3;
  return -[VCMediaNegotiationBlobV2StreamGroupStream qualityIndex](self, "qualityIndex");
}

- (BOOL)updatePayloadSpecsForConfig:(id)a3 defaultConfig:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "resetCodecs");
  if (a4 && (*(_WORD *)&self->_has & 0x20) == 0)
  {
    if (a3 != a4)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = (void *)objc_msgSend(a4, "payloads");
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(a3, "addPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "unsignedIntValue"));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
        }
        while (v9);
      }
    }
LABEL_22:
    LOBYTE(v16) = 1;
    return v16;
  }
  v12 = -[VCMediaNegotiationBlobV2StreamGroupStream payloadSpecOrPayloads](self, "payloadSpecOrPayloads");
  objc_msgSend(a3, "resetPayloads");
  if ((v12 & 0x7FF) != 0)
  {
    v13 = 1;
    do
    {
      if ((v12 & v13) != 0)
      {
        objc_msgSend(a3, "addPayload:", +[VCMediaNegotiationBlobV2StreamGroupStream payloadsWithPayloadBit:](VCMediaNegotiationBlobV2StreamGroupStream, "payloadsWithPayloadBit:", v13));
        v12 &= ~(_DWORD)v13;
      }
      v13 = (2 * v13);
    }
    while ((v12 & 0x7FF) != 0);
  }
  if (!v12)
    goto LABEL_22;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_21;
  v14 = VRTraceErrorLogLevelToCSTR();
  v15 = *MEMORY[0x1E0CF2758];
  v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v16)
  {
    -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:].cold.1(v14, self, v15);
LABEL_21:
    LOBYTE(v16) = 0;
  }
  return v16;
}

- (BOOL)updatePayloadSpecsForConfig:(id)a3 defaultConfig:(id)a4 payloadConfigs:(id)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "resetPayloads");
  if (!a4 || (*(_WORD *)&self->_has & 0x20) != 0)
  {
    v16 = -[VCMediaNegotiationBlobV2StreamGroupStream payloadSpecOrPayloads](self, "payloadSpecOrPayloads");
    objc_msgSend(a3, "resetCodecs");
    if (objc_msgSend(a5, "count"))
    {
      v17 = 0;
      do
      {
        if ((v16 & (1 << v17)) != 0)
        {
          objc_msgSend(a3, "addCodec:", v17);
          v16 &= ~(1 << v17);
        }
        v17 = (v17 + 1);
      }
      while (objc_msgSend(a5, "count") > v17);
    }
    if (v16)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v15)
          return v15;
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:].cold.1(v18, self, v19);
      }
LABEL_38:
      LOBYTE(v15) = 0;
      return v15;
    }
    goto LABEL_34;
  }
  if (a3 != a4)
  {
    v35 = 0uLL;
    v36 = 0uLL;
    v33 = 0uLL;
    v34 = 0uLL;
    v9 = (void *)objc_msgSend(a4, "codecs");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v34;
LABEL_6:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v13), "unsignedIntValue");
        if (objc_msgSend(a5, "count") <= (unint64_t)v14)
          break;
        objc_msgSend(a3, "addCodec:", v14);
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
          LOBYTE(v15) = 1;
          if (v11)
            goto LABEL_6;
          return v15;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_38;
      VRTraceErrorLogLevelToCSTR();
      v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v15)
      {
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:].cold.3();
        goto LABEL_38;
      }
      return v15;
    }
LABEL_34:
    LOBYTE(v15) = 1;
    return v15;
  }
  v30 = 0uLL;
  v31 = 0uLL;
  v28 = 0uLL;
  v29 = 0uLL;
  v20 = (void *)objc_msgSend(a4, "codecs");
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  if (!v21)
    goto LABEL_34;
  v22 = v21;
  v23 = *(_QWORD *)v29;
LABEL_27:
  v24 = 0;
  while (1)
  {
    if (*(_QWORD *)v29 != v23)
      objc_enumerationMutation(v20);
    v25 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v24), "unsignedIntValue");
    if (objc_msgSend(a5, "count") <= (unint64_t)v25)
      break;
    if (v22 == ++v24)
    {
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
      LOBYTE(v15) = 1;
      if (v22)
        goto LABEL_27;
      return v15;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_38;
  VRTraceErrorLogLevelToCSTR();
  v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v15)
  {
    -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:].cold.2();
    goto LABEL_38;
  }
  return v15;
}

+ (void)appendMetadata:(unsigned int)a3 toString:(id)a4
{
  const __CFString *v6;
  uint64_t v7;
  const __CFString *v8;

  objc_msgSend(a4, "appendFormat:", CFSTR(" metadata=["));
  if ((a3 & 0xF) != 0)
  {
    v6 = CFSTR("%@");
    v7 = 1;
    do
    {
      if ((v7 & a3) != 0)
      {
        v8 = CFSTR("SubStream");
        switch((int)v7)
        {
          case 1:
            break;
          case 2:
            v8 = CFSTR("TemporalStream");
            break;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_8;
          case 4:
            v8 = CFSTR("onDemand");
            break;
          case 8:
            v8 = CFSTR("UsePayloadSpec");
            break;
          default:
            if ((_DWORD)v7 == 15)
              v8 = CFSTR("SupportedMask");
            else
LABEL_8:
              v8 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
            break;
        }
        objc_msgSend(a4, "appendFormat:", v6, v8);
        v6 = CFSTR(",%@");
      }
      a3 &= ~(_DWORD)v7;
      v7 = (2 * v7);
    }
    while ((a3 & 0xF) != 0);
  }
  objc_msgSend(a4, "appendString:", CFSTR("]"));
}

+ (void)appendPayloadsToString:(id)a3 streamConfig:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "appendFormat:", CFSTR(" payloads=["));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_msgSend(a4, "payloads");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = CFSTR("%@");
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = +[VCMediaNegotiationBlobV2StreamGroupStream payloadFlagWithPayload:](VCMediaNegotiationBlobV2StreamGroupStream, "payloadFlagWithPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "unsignedIntValue"));
        if ((int)v12 <= 31)
        {
          v13 = CFSTR("Invalid");
          switch((int)v12)
          {
            case 0:
              break;
            case 1:
              v13 = CFSTR("H264");
              break;
            case 2:
              v13 = CFSTR("HEVC");
              break;
            case 3:
            case 5:
            case 6:
            case 7:
              goto LABEL_26;
            case 4:
              v13 = CFSTR("Data");
              break;
            case 8:
              v13 = CFSTR("OPUS");
              break;
            default:
              if ((_DWORD)v12 != 16)
                goto LABEL_26;
              v13 = CFSTR("AACELD_24000");
              break;
          }
        }
        else if ((int)v12 <= 255)
        {
          switch((_DWORD)v12)
          {
            case 0x20:
              v13 = CFSTR("EVS_32000");
              break;
            case 0x40:
              v13 = CFSTR("AACELD_48000");
              break;
            case 0x80:
              v13 = CFSTR("RED");
              break;
            default:
              goto LABEL_26;
          }
        }
        else if ((int)v12 > 1023)
        {
          if ((_DWORD)v12 != 1024)
          {
            if ((_DWORD)v12 == 2047)
            {
              v13 = CFSTR("SupportedMask");
              goto LABEL_31;
            }
            goto LABEL_26;
          }
          v13 = CFSTR("MMJI");
        }
        else
        {
          if ((_DWORD)v12 != 256)
          {
            if ((_DWORD)v12 == 512)
            {
              v13 = CFSTR("MOCAP");
              goto LABEL_31;
            }
LABEL_26:
            v13 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
            goto LABEL_31;
          }
          v13 = CFSTR("CN");
        }
LABEL_31:
        objc_msgSend(a3, "appendFormat:", v9, v13);
        ++v11;
        v9 = CFSTR(",%@");
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      v9 = CFSTR(",%@");
    }
    while (v8);
  }
  objc_msgSend(a3, "appendString:", CFSTR("]"));
}

+ (void)appendPayloadsSpecsToString:(id)a3 streamConfig:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "appendFormat:", CFSTR(" payloadSpecs=["));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_msgSend(a4, "codecs");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    v10 = &stru_1E9E58EE0;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a3, "appendFormat:", CFSTR("%@%@"), v10, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
        v10 = CFSTR(",");
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      v10 = CFSTR(",");
    }
    while (v8);
  }
  objc_msgSend(a3, "appendString:", CFSTR("]"));
}

- (id)dataRequiredPacketPayload
{
  __int16 has;
  unsigned int streamIndex;
  unsigned int rtpSSRC;
  unsigned int streamID;
  char v7;
  unsigned int v8;
  __int16 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
    streamIndex = self->_streamIndex;
  else
    LOBYTE(streamIndex) = -1;
  v7 = streamIndex;
  rtpSSRC = self->_rtpSSRC;
  v8 = bswap32(rtpSSRC);
  if ((has & 0x800) != 0)
    streamID = self->_streamID;
  else
    streamID = (unsigned __int16)rtpSSRC;
  v9 = bswap32(streamID) >> 16;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v7, 7);
}

- (BOOL)readRequiredPacketPayloadWithStreamConfig:(id)a3
{
  NSUInteger v5;
  unsigned __int8 v7[8];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)&v7[3] = 0;
  *(_DWORD *)v7 = 0;
  v5 = -[NSData length](self->_requiredPackedPayload, "length");
  if (v5 >= 7)
  {
    -[NSData getBytes:length:](self->_requiredPackedPayload, "getBytes:length:", v7, 7);
    objc_msgSend(a3, "setSsrc:", bswap32(*(unsigned int *)&v7[1]));
    objc_msgSend(a3, "setStreamID:", bswap32(*(unsigned __int16 *)&v7[5]) >> 16);
    objc_msgSend(a3, "setStreamIndex:", v7[0]);
  }
  return v5 > 6;
}

- (id)optionalPackedPayloaWithDefaultConfig:(id)a3
{
  unsigned int metadata;
  __int16 has;
  unsigned int maxNetworkBitrate;
  unsigned int v8;
  unsigned int audioChannelCount;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _WORD v18[2];
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unsigned int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3)
    metadata = +[VCMediaNegotiationBlobV2StreamGroupStream metadataWithStreamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "metadataWithStreamConfig:", a3);
  else
    metadata = 0;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    metadata = self->_metadata;
  if (metadata >= 0x10000)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315906;
    v21 = v11;
    v22 = 2080;
    v23 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) optionalPackedPayloaWithDefaultConfig:]";
    v24 = 1024;
    v25 = 1169;
    v26 = 1024;
    v27 = metadata;
    v13 = " [%s] %s:%d The metadata field doesn't fit in a uint16. metadata=%x";
LABEL_23:
    v15 = v12;
    goto LABEL_27;
  }
  v18[0] = bswap32(metadata) >> 16;
  if ((has & 4) != 0)
    maxNetworkBitrate = self->_maxNetworkBitrate;
  else
    maxNetworkBitrate = objc_msgSend(a3, "maxNetworkBitrate");
  v8 = maxNetworkBitrate / 0x3E8;
  if (maxNetworkBitrate >> 19 >= 0x7D)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v14 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315906;
    v21 = v14;
    v22 = 2080;
    v23 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) optionalPackedPayloaWithDefaultConfig:]";
    v24 = 1024;
    v25 = 1174;
    v26 = 1024;
    v27 = v8;
    v13 = " [%s] %s:%d The maxNetworkBitrate field doesn't fit in a uint16. maxNetworkBitrate=%x";
    goto LABEL_23;
  }
  v18[1] = bswap32(v8) >> 16;
  if ((*(_WORD *)&self->_has & 1) != 0)
    audioChannelCount = self->_audioChannelCount;
  else
    audioChannelCount = objc_msgSend(a3, "audioChannelCount");
  if (audioChannelCount >= 0x100)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315906;
    v21 = v16;
    v22 = 2080;
    v23 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) optionalPackedPayloaWithDefaultConfig:]";
    v24 = 1024;
    v25 = 1178;
    v26 = 1024;
    v27 = audioChannelCount;
    v13 = " [%s] %s:%d The audioChannelCount field doesn't fit in a uint8. audioChannelCount=%x";
    v15 = v17;
LABEL_27:
    _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v13, buf, 0x22u);
    return 0;
  }
  v19 = audioChannelCount;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v18, 5);
}

- (BOOL)readOptionalPacketPayload:(tagStreamGroupStreamOptionalPackedPayload *)a3
{
  if (!a3)
    return 0;
  if (-[NSData length](self->_optionalPackedPayload, "length") < 5)
    return 0;
  -[NSData getBytes:length:](self->_optionalPackedPayload, "getBytes:length:", a3, 5);
  a3->var0 = bswap32(a3->var0) >> 16;
  a3->var1 = 1000 * (bswap32(a3->var1) >> 16);
  return 1;
}

- (id)requiredPayloadCompressWithConfig:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[VCMediaNegotiationBlobV2StreamGroupStream dataRequiredPacketPayload](self, "dataRequiredPacketPayload", a3);
  v5 = objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupStream data](self, "data"), "length");
  if (!v4)
    return 0;
  v6 = v5;
  v7 = (id)-[VCMediaNegotiationBlobV2StreamGroupStream copy](self, "copy");
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v10;
        v14 = 2080;
        v15 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) requiredPayloadCompressWithConfig:]";
        v16 = 1024;
        v17 = 1208;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to copy the stream config for required fields compression", (uint8_t *)&v12, 0x1Cu);
      }
    }
    return 0;
  }
  v8 = v7;
  objc_msgSend(v7, "setRequiredPackedPayload:", v4);
  objc_msgSend(v8, "setHasStreamIndex:", 0);
  objc_msgSend(v8, "setHasRtpSSRC:", 0);
  objc_msgSend(v8, "setHasStreamID:", 0);
  if (v6 <= objc_msgSend((id)objc_msgSend(v8, "data"), "length"))
    return 0;
  else
    return v8;
}

- (id)optionalPayloadCompressWithConfig:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[VCMediaNegotiationBlobV2StreamGroupStream optionalPackedPayloaWithDefaultConfig:](self, "optionalPackedPayloaWithDefaultConfig:", a3);
  v5 = objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupStream data](self, "data"), "length");
  if (!v4)
    return 0;
  v6 = v5;
  v7 = (id)-[VCMediaNegotiationBlobV2StreamGroupStream copy](self, "copy");
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v10;
        v14 = 2080;
        v15 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) optionalPayloadCompressWithConfig:]";
        v16 = 1024;
        v17 = 1230;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to copy the stream config for optional fields compression", (uint8_t *)&v12, 0x1Cu);
      }
    }
    return 0;
  }
  v8 = v7;
  objc_msgSend(v7, "setOptionalPackedPayload:", v4);
  objc_msgSend(v8, "setHasMetadata:", 0);
  objc_msgSend(v8, "setHasMaxNetworkBitrate:", 0);
  objc_msgSend(v8, "setHasAudioChannelCount:", 0);
  if (v6 <= objc_msgSend((id)objc_msgSend(v8, "data"), "length"))
    return 0;
  else
    return v8;
}

- (id)compressWithConfig:(id)a3
{
  VCMediaNegotiationBlobV2StreamGroupStream *v5;
  VCMediaNegotiationBlobV2StreamGroupStream *v6;
  id result;

  v5 = -[VCMediaNegotiationBlobV2StreamGroupStream requiredPayloadCompressWithConfig:](self, "requiredPayloadCompressWithConfig:");
  v6 = v5;
  if (!v5)
    v5 = self;
  result = -[VCMediaNegotiationBlobV2StreamGroupStream optionalPayloadCompressWithConfig:](v5, "optionalPayloadCompressWithConfig:", a3);
  if (!result)
    return v6;
  return result;
}

- (unsigned)mediaStreamGroupCoordinateSystem
{
  if (-[VCMediaNegotiationBlobV2StreamGroupStream coordinateSystem](self, "coordinateSystem") <= 3
    && -[VCMediaNegotiationBlobV2StreamGroupStream coordinateSystem](self, "coordinateSystem"))
  {
    return -[VCMediaNegotiationBlobV2StreamGroupStream coordinateSystem](self, "coordinateSystem");
  }
  else
  {
    return 0;
  }
}

- (BOOL)setNegotiatedCoordinateSystemFromCoordinateSystem:(unsigned int)a3
{
  if (a3 <= 3)
    -[VCMediaNegotiationBlobV2StreamGroupStream setCoordinateSystem:](self, "setCoordinateSystem:", *(_QWORD *)&a3);
  return a3 < 4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlobV2StreamGroupStream setRequiredPackedPayload:](self, "setRequiredPackedPayload:", 0);
  -[VCMediaNegotiationBlobV2StreamGroupStream setOptionalPackedPayload:](self, "setOptionalPackedPayload:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroupStream;
  -[VCMediaNegotiationBlobV2StreamGroupStream dealloc](&v3, sel_dealloc);
}

- (void)setMetadata:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_metadata = a3;
}

- (void)setHasMetadata:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMetadata
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPayloadSpecOrPayloads:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_payloadSpecOrPayloads = a3;
}

- (void)setHasPayloadSpecOrPayloads:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPayloadSpecOrPayloads
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setQualityIndex:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_qualityIndex = a3;
}

- (void)setHasQualityIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasQualityIndex
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRtpSSRC:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_rtpSSRC = a3;
}

- (void)setHasRtpSSRC:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRtpSSRC
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setStreamID:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_streamID = a3;
}

- (void)setHasStreamID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasStreamID
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setMaxNetworkBitrate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_maxNetworkBitrate = a3;
}

- (void)setHasMaxNetworkBitrate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMaxNetworkBitrate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_repairedMaxNetworkBitrate = a3;
}

- (void)setHasRepairedMaxNetworkBitrate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRepairedMaxNetworkBitrate
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (unsigned)audioChannelCount
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_audioChannelCount;
  else
    return 1;
}

- (void)setAudioChannelCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_audioChannelCount = a3;
}

- (void)setHasAudioChannelCount:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAudioChannelCount
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setStreamIndex:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_streamIndex = a3;
}

- (void)setHasStreamIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasStreamIndex
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasRequiredPackedPayload
{
  return self->_requiredPackedPayload != 0;
}

- (BOOL)hasOptionalPackedPayload
{
  return self->_optionalPackedPayload != 0;
}

- (void)setCoordinateSystem:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_coordinateSystem = a3;
}

- (void)setHasCoordinateSystem:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCoordinateSystem
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPayloadsVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_payloadsVersion = a3;
}

- (void)setHasPayloadsVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPayloadsVersion
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMaxNetworkBitrateV2:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_maxNetworkBitrateV2 = a3;
}

- (void)setHasMaxNetworkBitrateV2:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMaxNetworkBitrateV2
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRepairedMaxNetworkBitrateV2:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_repairedMaxNetworkBitrateV2 = a3;
}

- (void)setHasRepairedMaxNetworkBitrateV2:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRepairedMaxNetworkBitrateV2
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroupStream;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2StreamGroupStream description](&v3, sel_description), -[VCMediaNegotiationBlobV2StreamGroupStream dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  NSData *requiredPackedPayload;
  NSData *optionalPackedPayload;
  __int16 v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_metadata), CFSTR("metadata"));
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_payloadSpecOrPayloads), CFSTR("payloadSpecOrPayloads"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_qualityIndex), CFSTR("qualityIndex"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rtpSSRC), CFSTR("rtpSSRC"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_streamID), CFSTR("streamID"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxNetworkBitrate), CFSTR("maxNetworkBitrate"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_repairedMaxNetworkBitrate), CFSTR("repairedMaxNetworkBitrate"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_audioChannelCount), CFSTR("audioChannelCount"));
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
LABEL_10:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_streamIndex), CFSTR("streamIndex"));
LABEL_11:
  requiredPackedPayload = self->_requiredPackedPayload;
  if (requiredPackedPayload)
    objc_msgSend(v3, "setObject:forKey:", requiredPackedPayload, CFSTR("requiredPackedPayload"));
  optionalPackedPayload = self->_optionalPackedPayload;
  if (optionalPackedPayload)
    objc_msgSend(v3, "setObject:forKey:", optionalPackedPayload, CFSTR("optionalPackedPayload"));
  v7 = (__int16)self->_has;
  if ((v7 & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_coordinateSystem), CFSTR("coordinateSystem"));
    v7 = (__int16)self->_has;
    if ((v7 & 0x40) == 0)
    {
LABEL_17:
      if ((v7 & 8) == 0)
        goto LABEL_18;
LABEL_32:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxNetworkBitrateV2), CFSTR("maxNetworkBitrateV2"));
      if ((*(_WORD *)&self->_has & 0x200) == 0)
        return v3;
      goto LABEL_19;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_payloadsVersion), CFSTR("payloadsVersion"));
  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
    goto LABEL_32;
LABEL_18:
  if ((v7 & 0x200) != 0)
LABEL_19:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_repairedMaxNetworkBitrateV2), CFSTR("repairedMaxNetworkBitrateV2"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2StreamGroupStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:
  if (self->_requiredPackedPayload)
    PBDataWriterWriteDataField();
  if (self->_optionalPackedPayload)
    PBDataWriterWriteDataField();
  v5 = (__int16)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (__int16)self->_has;
    if ((v5 & 0x40) == 0)
    {
LABEL_17:
      if ((v5 & 8) == 0)
        goto LABEL_18;
      goto LABEL_31;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 8) == 0)
  {
LABEL_18:
    if ((v5 & 0x200) == 0)
      return;
LABEL_32:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    goto LABEL_32;
}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v6;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_metadata;
    *((_WORD *)a3 + 42) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_payloadSpecOrPayloads;
  *((_WORD *)a3 + 42) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 12) = self->_qualityIndex;
  *((_WORD *)a3 + 42) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 18) = self->_rtpSSRC;
  *((_WORD *)a3 + 42) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 19) = self->_streamID;
  *((_WORD *)a3 + 42) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 4) = self->_maxNetworkBitrate;
  *((_WORD *)a3 + 42) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 13) = self->_repairedMaxNetworkBitrate;
  *((_WORD *)a3 + 42) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_28:
  *((_DWORD *)a3 + 2) = self->_audioChannelCount;
  *((_WORD *)a3 + 42) |= 1u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_10:
    *((_DWORD *)a3 + 20) = self->_streamIndex;
    *((_WORD *)a3 + 42) |= 0x1000u;
  }
LABEL_11:
  if (self->_requiredPackedPayload)
    objc_msgSend(a3, "setRequiredPackedPayload:");
  if (self->_optionalPackedPayload)
    objc_msgSend(a3, "setOptionalPackedPayload:");
  v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_coordinateSystem;
    *((_WORD *)a3 + 42) |= 2u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_17:
      if ((v6 & 8) == 0)
        goto LABEL_18;
      goto LABEL_32;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)a3 + 11) = self->_payloadsVersion;
  *((_WORD *)a3 + 42) |= 0x40u;
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_18:
    if ((v6 & 0x200) == 0)
      return;
    goto LABEL_19;
  }
LABEL_32:
  *((_DWORD *)a3 + 5) = self->_maxNetworkBitrateV2;
  *((_WORD *)a3 + 42) |= 8u;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    return;
LABEL_19:
  *((_DWORD *)a3 + 14) = self->_repairedMaxNetworkBitrateV2;
  *((_WORD *)a3 + 42) |= 0x200u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  __int16 v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_metadata;
    *(_WORD *)(v5 + 84) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_payloadSpecOrPayloads;
  *(_WORD *)(v5 + 84) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 48) = self->_qualityIndex;
  *(_WORD *)(v5 + 84) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 72) = self->_rtpSSRC;
  *(_WORD *)(v5 + 84) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 76) = self->_streamID;
  *(_WORD *)(v5 + 84) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 16) = self->_maxNetworkBitrate;
  *(_WORD *)(v5 + 84) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 52) = self->_repairedMaxNetworkBitrate;
  *(_WORD *)(v5 + 84) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_24:
  *(_DWORD *)(v5 + 8) = self->_audioChannelCount;
  *(_WORD *)(v5 + 84) |= 1u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 80) = self->_streamIndex;
    *(_WORD *)(v5 + 84) |= 0x1000u;
  }
LABEL_11:

  *(_QWORD *)(v6 + 64) = -[NSData copyWithZone:](self->_requiredPackedPayload, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 32) = -[NSData copyWithZone:](self->_optionalPackedPayload, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 2) != 0)
  {
    *(_DWORD *)(v6 + 12) = self->_coordinateSystem;
    *(_WORD *)(v6 + 84) |= 2u;
    v8 = (__int16)self->_has;
    if ((v8 & 0x40) == 0)
    {
LABEL_13:
      if ((v8 & 8) == 0)
        goto LABEL_14;
LABEL_28:
      *(_DWORD *)(v6 + 20) = self->_maxNetworkBitrateV2;
      *(_WORD *)(v6 + 84) |= 8u;
      if ((*(_WORD *)&self->_has & 0x200) == 0)
        return (id)v6;
      goto LABEL_15;
    }
  }
  else if ((v8 & 0x40) == 0)
  {
    goto LABEL_13;
  }
  *(_DWORD *)(v6 + 44) = self->_payloadsVersion;
  *(_WORD *)(v6 + 84) |= 0x40u;
  v8 = (__int16)self->_has;
  if ((v8 & 8) != 0)
    goto LABEL_28;
LABEL_14:
  if ((v8 & 0x200) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 56) = self->_repairedMaxNetworkBitrateV2;
    *(_WORD *)(v6 + 84) |= 0x200u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSData *requiredPackedPayload;
  NSData *optionalPackedPayload;
  __int16 v10;
  __int16 v11;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 42);
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_metadata != *((_DWORD *)a3 + 6))
        goto LABEL_70;
    }
    else if ((v7 & 0x10) != 0)
    {
LABEL_70:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_payloadSpecOrPayloads != *((_DWORD *)a3 + 10))
        goto LABEL_70;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_70;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_qualityIndex != *((_DWORD *)a3 + 12))
        goto LABEL_70;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_70;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x400) == 0 || self->_rtpSSRC != *((_DWORD *)a3 + 18))
        goto LABEL_70;
    }
    else if ((*((_WORD *)a3 + 42) & 0x400) != 0)
    {
      goto LABEL_70;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x800) == 0 || self->_streamID != *((_DWORD *)a3 + 19))
        goto LABEL_70;
    }
    else if ((*((_WORD *)a3 + 42) & 0x800) != 0)
    {
      goto LABEL_70;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_maxNetworkBitrate != *((_DWORD *)a3 + 4))
        goto LABEL_70;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_70;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x100) == 0 || self->_repairedMaxNetworkBitrate != *((_DWORD *)a3 + 13))
        goto LABEL_70;
    }
    else if ((*((_WORD *)a3 + 42) & 0x100) != 0)
    {
      goto LABEL_70;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_audioChannelCount != *((_DWORD *)a3 + 2))
        goto LABEL_70;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_70;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x1000) == 0 || self->_streamIndex != *((_DWORD *)a3 + 20))
        goto LABEL_70;
    }
    else if ((*((_WORD *)a3 + 42) & 0x1000) != 0)
    {
      goto LABEL_70;
    }
    requiredPackedPayload = self->_requiredPackedPayload;
    if (!((unint64_t)requiredPackedPayload | *((_QWORD *)a3 + 8))
      || (v5 = -[NSData isEqual:](requiredPackedPayload, "isEqual:")) != 0)
    {
      optionalPackedPayload = self->_optionalPackedPayload;
      if (!((unint64_t)optionalPackedPayload | *((_QWORD *)a3 + 4))
        || (v5 = -[NSData isEqual:](optionalPackedPayload, "isEqual:")) != 0)
      {
        v10 = (__int16)self->_has;
        v11 = *((_WORD *)a3 + 42);
        if ((v10 & 2) != 0)
        {
          if ((v11 & 2) == 0 || self->_coordinateSystem != *((_DWORD *)a3 + 3))
            goto LABEL_70;
        }
        else if ((v11 & 2) != 0)
        {
          goto LABEL_70;
        }
        if ((v10 & 0x40) != 0)
        {
          if ((v11 & 0x40) == 0 || self->_payloadsVersion != *((_DWORD *)a3 + 11))
            goto LABEL_70;
        }
        else if ((v11 & 0x40) != 0)
        {
          goto LABEL_70;
        }
        if ((v10 & 8) != 0)
        {
          if ((v11 & 8) == 0 || self->_maxNetworkBitrateV2 != *((_DWORD *)a3 + 5))
            goto LABEL_70;
        }
        else if ((v11 & 8) != 0)
        {
          goto LABEL_70;
        }
        LOBYTE(v5) = (v11 & 0x200) == 0;
        if ((*(_WORD *)&self->_has & 0x200) != 0)
        {
          if ((*((_WORD *)a3 + 42) & 0x200) == 0 || self->_repairedMaxNetworkBitrateV2 != *((_DWORD *)a3 + 14))
            goto LABEL_70;
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v20 = 2654435761 * self->_metadata;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      v19 = 2654435761 * self->_payloadSpecOrPayloads;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v20 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_3;
  }
  v19 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v18 = 2654435761 * self->_qualityIndex;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v18 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_rtpSSRC;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    v5 = 2654435761 * self->_streamID;
    if ((has & 4) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    v6 = 2654435761 * self->_maxNetworkBitrate;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    v7 = 2654435761 * self->_repairedMaxNetworkBitrate;
    if ((has & 1) != 0)
      goto LABEL_9;
LABEL_18:
    v8 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_17:
  v7 = 0;
  if ((has & 1) == 0)
    goto LABEL_18;
LABEL_9:
  v8 = 2654435761 * self->_audioChannelCount;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_10:
    v9 = 2654435761 * self->_streamIndex;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
LABEL_20:
  v10 = -[NSData hash](self->_requiredPackedPayload, "hash");
  v11 = -[NSData hash](self->_optionalPackedPayload, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 2) != 0)
  {
    v13 = 2654435761 * self->_coordinateSystem;
    if ((v12 & 0x40) != 0)
    {
LABEL_22:
      v14 = 2654435761 * self->_payloadsVersion;
      if ((v12 & 8) != 0)
        goto LABEL_23;
LABEL_27:
      v15 = 0;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_24;
LABEL_28:
      v16 = 0;
      return v19 ^ v20 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    v13 = 0;
    if ((v12 & 0x40) != 0)
      goto LABEL_22;
  }
  v14 = 0;
  if ((v12 & 8) == 0)
    goto LABEL_27;
LABEL_23:
  v15 = 2654435761 * self->_maxNetworkBitrateV2;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_28;
LABEL_24:
  v16 = 2654435761 * self->_repairedMaxNetworkBitrateV2;
  return v19 ^ v20 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  __int16 v6;

  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x10) != 0)
  {
    self->_metadata = *((_DWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 0x10u;
    v5 = *((_WORD *)a3 + 42);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_payloadSpecOrPayloads = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  self->_qualityIndex = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x400) == 0)
  {
LABEL_5:
    if ((v5 & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  self->_rtpSSRC = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x800) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  self->_streamID = *((_DWORD *)a3 + 19);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  self->_maxNetworkBitrate = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  self->_repairedMaxNetworkBitrate = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_28:
  self->_audioChannelCount = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)a3 + 42) & 0x1000) != 0)
  {
LABEL_10:
    self->_streamIndex = *((_DWORD *)a3 + 20);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_11:
  if (*((_QWORD *)a3 + 8))
    -[VCMediaNegotiationBlobV2StreamGroupStream setRequiredPackedPayload:](self, "setRequiredPackedPayload:");
  if (*((_QWORD *)a3 + 4))
    -[VCMediaNegotiationBlobV2StreamGroupStream setOptionalPackedPayload:](self, "setOptionalPackedPayload:");
  v6 = *((_WORD *)a3 + 42);
  if ((v6 & 2) != 0)
  {
    self->_coordinateSystem = *((_DWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 2u;
    v6 = *((_WORD *)a3 + 42);
    if ((v6 & 0x40) == 0)
    {
LABEL_17:
      if ((v6 & 8) == 0)
        goto LABEL_18;
      goto LABEL_32;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  self->_payloadsVersion = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  v6 = *((_WORD *)a3 + 42);
  if ((v6 & 8) == 0)
  {
LABEL_18:
    if ((v6 & 0x200) == 0)
      return;
    goto LABEL_19;
  }
LABEL_32:
  self->_maxNetworkBitrateV2 = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 42) & 0x200) == 0)
    return;
LABEL_19:
  self->_repairedMaxNetworkBitrateV2 = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x200u;
}

- (unsigned)metadata
{
  return self->_metadata;
}

- (unsigned)payloadSpecOrPayloads
{
  return self->_payloadSpecOrPayloads;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (unsigned)rtpSSRC
{
  return self->_rtpSSRC;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (unsigned)maxNetworkBitrate
{
  return self->_maxNetworkBitrate;
}

- (unsigned)repairedMaxNetworkBitrate
{
  return self->_repairedMaxNetworkBitrate;
}

- (unsigned)streamIndex
{
  return self->_streamIndex;
}

- (NSData)requiredPackedPayload
{
  return self->_requiredPackedPayload;
}

- (void)setRequiredPackedPayload:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSData)optionalPackedPayload
{
  return self->_optionalPackedPayload;
}

- (void)setOptionalPackedPayload:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)coordinateSystem
{
  return self->_coordinateSystem;
}

- (unsigned)payloadsVersion
{
  return self->_payloadsVersion;
}

- (unsigned)maxNetworkBitrateV2
{
  return self->_maxNetworkBitrateV2;
}

- (unsigned)repairedMaxNetworkBitrateV2
{
  return self->_repairedMaxNetworkBitrateV2;
}

@end
