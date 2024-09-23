@implementation VCVideoStream

- (void)overrideConfigWithDefaults:(id)a3
{
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v4 = -[VCDefaults forceVideoStreamResolution](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoStreamResolution");
  if (v4 <= 0xD)
    objc_msgSend(a3, "setVideoResolution:", v4);
  v5 = -[VCDefaults forceVideoStreamTxMaxBitrate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoStreamTxMaxBitrate");
  if (v5 >= 1)
    objc_msgSend(a3, "setTxMaxBitrate:", v5);
  v6 = -[VCDefaults forceVideoStreamTxMinBitrate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoStreamTxMinBitrate");
  if (v6 >= 1)
    objc_msgSend(a3, "setTxMinBitrate:", v6);
  v7 = -[VCDefaults forceVideoStreamFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoStreamFramerate");
  if (v7 >= 1)
    objc_msgSend(a3, "setFramerate:", v7);
  v8 = -[VCDefaults forceVideoStreamKeyFrameInterval](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoStreamKeyFrameInterval");
  if (v8 >= 1)
    objc_msgSend(a3, "setKeyFrameInterval:", v8);
  v9 = -[VCDefaults forceVideoStreamRxMaxBitrate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoStreamRxMaxBitrate");
  if (v9 >= 1)
    objc_msgSend(a3, "setRxMaxBitrate:", v9);
  v10 = -[VCDefaults forceVideoStreamRxMinBitrate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoStreamRxMinBitrate");
  if (v10 >= 1)
    objc_msgSend(a3, "setRxMinBitrate:", v10);
}

- (id)newVideoTransmitterConfigWithVideoStreamConfig:(id)a3
{
  VCVideoTransmitterConfig *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *transportArray;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  VCVideoStream *v41;
  const __CFString *v42;
  void *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  int v53;
  const char *v54;
  const char *v55;
  NSObject *v56;
  uint32_t v57;
  uint64_t v58;
  NSObject *v59;
  int v60;
  const char *v61;
  uint64_t v62;
  id v64;
  _QWORD v65[5];
  _QWORD v66[5];
  _QWORD v67[5];
  _QWORD v68[5];
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  VCVideoStream *v78;
  __int16 v79;
  const char *v80;
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[3];
  _QWORD v84[3];
  _BYTE v85[128];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(VCVideoTransmitterConfig);
  if (-[VCMediaStreamMultiwayConfig hasQualityIndex](-[VCMediaStreamConfig multiwayConfig](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "multiwayConfig"), "hasQualityIndex"))
  {
    -[VCVideoTransmitterConfig setQualityIndex:](v5, "setQualityIndex:", -[VCMediaStreamMultiwayConfig qualityIndex](-[VCMediaStreamConfig multiwayConfig](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "multiwayConfig"), "qualityIndex"));
  }
  -[VCVideoTransmitterConfig setVideoResolution:](v5, "setVideoResolution:", objc_msgSend(a3, "videoResolution"));
  -[VCVideoTransmitterConfig setVideoSource:](v5, "setVideoSource:", 3);
  -[VCVideoTransmitterConfig setFramerate:](v5, "setFramerate:", objc_msgSend(a3, "framerate"));
  -[VCVideoTransmitterConfig setCodecType:](v5, "setCodecType:", objc_msgSend(a3, "primaryTxCodecType"));
  -[VCVideoTransmitterConfig setTxMaxBitrate:](v5, "setTxMaxBitrate:", objc_msgSend(a3, "txMaxBitrate"));
  -[VCVideoTransmitterConfig setTxMinBitrate:](v5, "setTxMinBitrate:", objc_msgSend(a3, "txMinBitrate"));
  -[VCVideoTransmitterConfig setKeyFrameInterval:](v5, "setKeyFrameInterval:", objc_msgSend(a3, "keyFrameInterval"));
  -[VCVideoTransmitterConfig setEnableCVO:](v5, "setEnableCVO:", objc_msgSend(a3, "enableCVO"));
  -[VCVideoTransmitterConfig setCvoExtensionID:](v5, "setCvoExtensionID:", objc_msgSend(a3, "cvoExtensionID"));
  -[VCVideoTransmitterConfig setRecommendedMTU:](v5, "setRecommendedMTU:", objc_msgSend(a3, "recommendedMTU"));
  -[VCVideoTransmitterConfig setReportingAgent:](v5, "setReportingAgent:", -[VCObject reportingAgent](self, "reportingAgent"));
  -[VCVideoTransmitterConfig setReportingParentID:](v5, "setReportingParentID:", self->_reportingModuleID);
  -[VCVideoTransmitterConfig setStatisticsCollector:](v5, "setStatisticsCollector:", -[VCVideoStream getTransmitStatsCollectorWithStreamConfig:](self, "getTransmitStatsCollectorWithStreamConfig:", a3));
  -[VCVideoTransmitterConfig setVideoPayload:](v5, "setVideoPayload:", +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(a3, "primaryTxCodecType")));
  -[VCVideoTransmitterConfig setEncodingMode:](v5, "setEncodingMode:", objc_msgSend(a3, "encodingMode"));
  -[VCVideoTransmitterConfig setEncoderUsage:](v5, "setEncoderUsage:", objc_msgSend(a3, "encoderUsage"));
  -[VCVideoTransmitterConfig setVideoPriorityPointer:](v5, "setVideoPriorityPointer:", objc_msgSend(a3, "videoPriorityPointer"));
  -[VCVideoTransmitterConfig setTilesPerFrame:](v5, "setTilesPerFrame:", objc_msgSend(a3, "tilesPerFrame"));
  -[VCVideoTransmitterConfig setPixelFormat:](v5, "setPixelFormat:", objc_msgSend(a3, "pixelFormat"));
  -[VCVideoTransmitterConfig setRemoteIDSParticipantID:](v5, "setRemoteIDSParticipantID:", objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "remoteIDSParticipantID"));
  -[VCVideoTransmitterConfig setMediaController:](v5, "setMediaController:", -[VCVideoStream getTransmitMediaControllerWithStreamConfig:](self, "getTransmitMediaControllerWithStreamConfig:", a3));
  -[VCVideoTransmitterConfig setMediaControlInfoGenerator:](v5, "setMediaControlInfoGenerator:", -[VCMediaStream mediaControlInfoGenerator](self, "mediaControlInfoGenerator"));
  -[VCVideoTransmitterConfig setRtpTimestampRate:](v5, "setRtpTimestampRate:", self->_rtpTimestampRate);
  -[VCVideoTransmitterConfig setProfileLevel:](v5, "setProfileLevel:", objc_msgSend(a3, "profileLevel"));
  -[VCVideoTransmitterConfig setParameterSets:](v5, "setParameterSets:", objc_msgSend(a3, "parameterSets"));
  -[VCVideoTransmitterConfig setTemporalScalingEnabled:](v5, "setTemporalScalingEnabled:", objc_msgSend(a3, "temporalScalingEnabled"));
  -[VCVideoTransmitterConfig setMaxEncoderPixels:](v5, "setMaxEncoderPixels:", objc_msgSend(a3, "maxEncoderPixels"));
  -[VCVideoTransmitterConfig setRtxEnabled:](v5, "setRtxEnabled:", objc_msgSend(a3, "isUplinkRetransmissionEnabled"));
  -[VCVideoTransmitterConfig setMinKeyFrameGenerationIntervalInSeconds:](v5, "setMinKeyFrameGenerationIntervalInSeconds:", 0.25);
  -[VCVideoStream setupVideoTransmitterConfigColorInfo:](self, "setupVideoTransmitterConfigColorInfo:", v5);
  if (self->super._isRTTBasedFIRThrottlingEnabled)
  {
    objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-video-transmitter-minimum-key-frame-generation-interval-for-facetime"), CFSTR("minimumKeyFrameGenerationIntervalFaceTime"), &unk_1E9EFB1F8, 1), "doubleValue");
    -[VCVideoTransmitterConfig setMinKeyFrameGenerationIntervalInSeconds:](v5, "setMinKeyFrameGenerationIntervalInSeconds:");
  }
  if (objc_msgSend(a3, "videoResolution") == 27)
  {
    -[VCVideoTransmitterConfig setCustomWidth:](v5, "setCustomWidth:", objc_msgSend(a3, "customWidth"));
    -[VCVideoTransmitterConfig setCustomHeight:](v5, "setCustomHeight:", objc_msgSend(a3, "customHeight"));
  }
  if (objc_msgSend(a3, "temporalScalingEnabled"))
  {
    -[VCVideoTransmitterConfig setTxMaxBitrate:](v5, "setTxMaxBitrate:", objc_msgSend((id)objc_msgSend((id)-[NSMutableArray lastObject](self->super._transportArray, "lastObject"), "streamConfig"), "txMaxBitrate"));
    -[VCVideoTransmitterConfig setTxMinBitrate:](v5, "setTxMinBitrate:", objc_msgSend((id)objc_msgSend((id)-[NSMutableArray firstObject](self->super._transportArray, "firstObject"), "streamConfig"), "txMinBitrate"));
    -[VCVideoTransmitterConfig setMaxSupportedTemporalLayers:](v5, "setMaxSupportedTemporalLayers:", +[VCHardwareSettings maxVCPSupportedTemporalLayers](VCHardwareSettings, "maxVCPSupportedTemporalLayers"));
  }
  v64 = a3;
  if (-[NSMutableArray count](self->super._transportArray, "count") == 1
    && objc_msgSend(a3, "temporalScalingEnabled")
    && objc_msgSend((id)objc_msgSend(a3, "txBitrateTiers"), "count"))
  {
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v6 = (void *)objc_msgSend(a3, "txBitrateTiers");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v91, v90, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v92 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
          v12 = objc_msgSend((id)-[NSMutableArray firstObject](self->super._transportArray, "firstObject"), "rtpHandle");
          v13 = -[VCVideoTransmitterConfig streamConfigs](v5, "streamConfigs");
          *(_QWORD *)(v13 + 32 * -[VCVideoTransmitterConfig streamCount](v5, "streamCount")) = v12;
          LODWORD(v11) = objc_msgSend(v11, "unsignedIntValue");
          v14 = -[VCVideoTransmitterConfig streamConfigs](v5, "streamConfigs");
          *(_DWORD *)(v14 + 32 * -[VCVideoTransmitterConfig streamCount](v5, "streamCount") + 16) = (_DWORD)v11;
          LOWORD(v11) = objc_msgSend((id)-[NSMutableArray firstObject](self->super._transportArray, "firstObject"), "idsStreamId");
          v15 = -[VCVideoTransmitterConfig streamConfigs](v5, "streamConfigs");
          *(_WORD *)(v15 + 32 * -[VCVideoTransmitterConfig streamCount](v5, "streamCount") + 8) = (_WORD)v11;
          v16 = objc_msgSend((id)-[NSMutableArray firstObject](self->super._transportArray, "firstObject"), "transmitterSframeCryptor");
          v17 = -[VCVideoTransmitterConfig streamConfigs](v5, "streamConfigs");
          *(_QWORD *)(v17 + 32 * -[VCVideoTransmitterConfig streamCount](v5, "streamCount") + 24) = v16;
          -[VCVideoTransmitterConfig setStreamCount:](v5, "setStreamCount:", -[VCVideoTransmitterConfig streamCount](v5, "streamCount") + 1);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v91, v90, 16);
      }
      while (v8);
    }
  }
  else
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    transportArray = self->super._transportArray;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v86, v85, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v87;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v87 != v21)
            objc_enumerationMutation(transportArray);
          v23 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
          v24 = (void *)objc_msgSend(v23, "streamConfig");
          v25 = objc_msgSend(v23, "rtpHandle");
          v26 = -[VCVideoTransmitterConfig streamConfigs](v5, "streamConfigs");
          *(_QWORD *)(v26 + 32 * -[VCVideoTransmitterConfig streamCount](v5, "streamCount")) = v25;
          LODWORD(v24) = objc_msgSend(v24, "txMaxBitrate");
          v27 = -[VCVideoTransmitterConfig streamConfigs](v5, "streamConfigs");
          *(_DWORD *)(v27 + 32 * -[VCVideoTransmitterConfig streamCount](v5, "streamCount") + 16) = (_DWORD)v24;
          LOWORD(v24) = objc_msgSend(v23, "idsStreamId");
          v28 = -[VCVideoTransmitterConfig streamConfigs](v5, "streamConfigs");
          *(_WORD *)(v28 + 32 * -[VCVideoTransmitterConfig streamCount](v5, "streamCount") + 8) = (_WORD)v24;
          v29 = objc_msgSend(v23, "transmitterSframeCryptor");
          v30 = -[VCVideoTransmitterConfig streamConfigs](v5, "streamConfigs");
          *(_QWORD *)(v30 + 32 * -[VCVideoTransmitterConfig streamCount](v5, "streamCount") + 24) = v29;
          -[VCVideoTransmitterConfig setStreamCount:](v5, "setStreamCount:", -[VCVideoTransmitterConfig streamCount](v5, "streamCount") + 1);
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v86, v85, 16);
      }
      while (v20);
    }
  }
  switch(objc_msgSend(v64, "type"))
  {
    case 1:
    case 6:
      goto LABEL_49;
    case 2:
      -[VCVideoTransmitterConfig setIsIPv6:](v5, "setIsIPv6:", -[VCVideoStream isTransportIPv6](self, "isTransportIPv6"));
      -[VCVideoTransmitterConfig setMode:](v5, "setMode:", 5);
      -[VCVideoTransmitterConfig setEncoderUsage:](v5, "setEncoderUsage:", 1);
      -[VCVideoTransmitterConfig setMinKeyFrameGenerationIntervalInSeconds:](v5, "setMinKeyFrameGenerationIntervalInSeconds:", 0.01);
      -[VCVideoTransmitterConfig setUseRateControl:](v5, "setUseRateControl:", 1);
      -[VCVideoTransmitterConfig setReinitEncoderOnFrameSizeChangeEnabled:](v5, "setReinitEncoderOnFrameSizeChangeEnabled:", 1);
      -[VCVideoTransmitterConfig setCaptureSource:](v5, "setCaptureSource:", 2);
      v31 = (void *)objc_msgSend(v64, "txCodecFeatureListStrings");
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke;
      v68[3] = &unk_1E9E57D50;
      v68[4] = v5;
      objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v68);
      if (objc_msgSend(v64, "hdrMode") == 1)
      {
        v32 = *MEMORY[0x1E0CA8D80];
        v33 = *MEMORY[0x1E0CED238];
        v83[0] = *MEMORY[0x1E0CECF48];
        v83[1] = v33;
        v34 = *MEMORY[0x1E0CA8EC8];
        v84[0] = v32;
        v84[1] = v34;
        v83[2] = *MEMORY[0x1E0CED290];
        v84[2] = *MEMORY[0x1E0CA8F00];
        v35 = (void *)MEMORY[0x1E0C99D80];
        v36 = v84;
        v37 = v83;
        v38 = 3;
      }
      else
      {
        if (objc_msgSend(v64, "hdrMode") != 2)
          return v5;
        v48 = *MEMORY[0x1E0CA8EC8];
        v49 = *MEMORY[0x1E0CED290];
        v81[0] = *MEMORY[0x1E0CED238];
        v81[1] = v49;
        v50 = *MEMORY[0x1E0CA8EF8];
        v82[0] = v48;
        v82[1] = v50;
        v35 = (void *)MEMORY[0x1E0C99D80];
        v36 = v82;
        v37 = v81;
        v38 = 2;
      }
      -[VCVideoTransmitterConfig setColorInfo:](v5, "setColorInfo:", objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", v36, v37, v38));
      return v5;
    case 3:
      if (objc_msgSend((id)objc_msgSend(v64, "multiwayConfig"), "isOneToOne"))
        v39 = 1;
      else
        v39 = 2;
      -[VCVideoTransmitterConfig setMode:](v5, "setMode:", v39);
      if (!-[VCVideoTransmitterConfig encoderUsage](v5, "encoderUsage"))
        -[VCVideoTransmitterConfig setEncoderUsage:](v5, "setEncoderUsage:", 2);
      if (-[VCVideoTransmitterConfig mode](v5, "mode") == 2)
        -[VCVideoTransmitterConfig setMinKeyFrameGenerationIntervalInSeconds:](v5, "setMinKeyFrameGenerationIntervalInSeconds:", 1.0);
      -[VCVideoTransmitterConfig setIsFecGeneratorEnabled:](v5, "setIsFecGeneratorEnabled:", objc_msgSend(v64, "fecGeneratorEnabled"));
      -[VCVideoTransmitterConfig setFecHeaderV1Enabled:](v5, "setFecHeaderV1Enabled:", objc_msgSend(v64, "fecHeaderVersion") == 1);
      -[VCVideoTransmitterConfig setUseRateControl:](v5, "setUseRateControl:", objc_msgSend((id)objc_msgSend(v64, "multiwayConfig"), "isOneToOne"));
      v40 = objc_msgSend((id)objc_msgSend(v64, "multiwayConfig"), "isOneToOne");
      v41 = self;
      if (v40)
        v41 = (VCVideoStream *)objc_msgSend(v64, "rateControlConfig");
      -[VCVideoTransmitterConfig setMediaControlInfoGenerator:](v5, "setMediaControlInfoGenerator:", -[VCMediaStream mediaControlInfoGenerator](v41, "mediaControlInfoGenerator"));
      -[VCVideoTransmitterConfig setUseInBandFec:](v5, "setUseInBandFec:", objc_msgSend(v64, "useInBandFEC"));
      -[VCVideoTransmitterConfig setSetupBWEstimationOptionWithFeatureString:](v5, "setSetupBWEstimationOptionWithFeatureString:", 0);
      if (HIDWORD(self->_colorInfo))
        -[VCVideoTransmitterConfig setRecommendedMTU:](v5, "setRecommendedMTU:");
      if (!-[VCVideoStream isScreenConfig:](self, "isScreenConfig:", v64))
      {
        -[VCVideoTransmitterConfig setPixelFormat:](v5, "setPixelFormat:", VCVideoUtil_DefaultCameraCapturePixelFormat());
        goto LABEL_76;
      }
      if ((VCVideoStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v51 = VRTraceErrorLogLevelToCSTR();
          v52 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v53 = objc_msgSend((id)objc_msgSend(v64, "multiwayConfig"), "isOneToOne");
            v54 = "No";
            v70 = v51;
            *(_DWORD *)buf = 136315906;
            v72 = "-[VCVideoStream newVideoTransmitterConfigWithVideoStreamConfig:]";
            v71 = 2080;
            if (v53)
              v54 = "Yes";
            v73 = 1024;
            v74 = 386;
            v75 = 2080;
            v76 = (void *)v54;
            v55 = "VCVideoStream [%s] %s:%d Configured for Screen Sharing (isOneToOne=%s)";
            v56 = v52;
            v57 = 38;
            goto LABEL_71;
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v42 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v42 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v58 = VRTraceErrorLogLevelToCSTR();
          v59 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v60 = objc_msgSend((id)objc_msgSend(v64, "multiwayConfig"), "isOneToOne");
            *(_DWORD *)buf = 136316418;
            v61 = "No";
            v70 = v58;
            v72 = "-[VCVideoStream newVideoTransmitterConfigWithVideoStreamConfig:]";
            v71 = 2080;
            v73 = 1024;
            if (v60)
              v61 = "Yes";
            v74 = 386;
            v75 = 2112;
            v76 = (void *)v42;
            v77 = 2048;
            v78 = self;
            v79 = 2080;
            v80 = v61;
            v55 = "VCVideoStream [%s] %s:%d %@(%p) Configured for Screen Sharing (isOneToOne=%s)";
            v56 = v59;
            v57 = 58;
LABEL_71:
            _os_log_impl(&dword_1D8A54000, v56, OS_LOG_TYPE_DEFAULT, v55, buf, v57);
          }
        }
      }
      -[VCVideoTransmitterConfig setCaptureSource:](v5, "setCaptureSource:", objc_msgSend(v64, "captureSource"));
      -[VCVideoTransmitterConfig setEncoderUsage:](v5, "setEncoderUsage:", 5);
      -[VCVideoTransmitterConfig setSetupBWEstimationOptionWithFeatureString:](v5, "setSetupBWEstimationOptionWithFeatureString:", 0);
      -[VCVideoTransmitterConfig setReinitEncoderOnFrameSizeChangeEnabled:](v5, "setReinitEncoderOnFrameSizeChangeEnabled:", 0);
      if ((+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 8
         || !+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass"))
        && objc_msgSend(v64, "captureSource") == 1)
      {
        -[VCVideoTransmitterConfig setReinitEncoderOnFrameSizeChangeEnabled:](v5, "setReinitEncoderOnFrameSizeChangeEnabled:", 1);
      }
LABEL_76:
      if (objc_msgSend(v64, "rtcpPSFB_LTRAckEnabled"))
        v62 = 2;
      else
        v62 = 1;
      -[VCVideoTransmitterConfig setLtrAckFeedbackType:](v5, "setLtrAckFeedbackType:", v62);
      v43 = (void *)objc_msgSend(v64, "txCodecFeatureListStrings");
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke_12;
      v65[3] = &unk_1E9E57D50;
      v65[4] = v5;
      v44 = v65;
LABEL_80:
      objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v44);
      return v5;
    case 4:
      -[VCVideoTransmitterConfig setEncoderBitrateAveragingInterval:](v5, "setEncoderBitrateAveragingInterval:", 150);
LABEL_49:
      -[VCVideoTransmitterConfig setIsIPv6:](v5, "setIsIPv6:", -[VCVideoStream isTransportIPv6](self, "isTransportIPv6"));
      -[VCVideoTransmitterConfig setMode:](v5, "setMode:", 3);
      -[VCVideoTransmitterConfig setEncoderUsage:](v5, "setEncoderUsage:", 1);
      -[VCVideoTransmitterConfig setMinKeyFrameGenerationIntervalInSeconds:](v5, "setMinKeyFrameGenerationIntervalInSeconds:", 0.01);
      -[VCVideoTransmitterConfig setUseRateControl:](v5, "setUseRateControl:", 1);
      v43 = (void *)objc_msgSend(v64, "txCodecFeatureListStrings");
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke_2;
      v67[3] = &unk_1E9E57D50;
      v67[4] = v5;
      v44 = v67;
      goto LABEL_80;
    case 5:
      -[VCVideoTransmitterConfig setMode:](v5, "setMode:", 5);
      if (objc_msgSend(v64, "tilesPerFrame") == 1)
        v45 = 5;
      else
        v45 = 1;
      -[VCVideoTransmitterConfig setEncoderUsage:](v5, "setEncoderUsage:", v45);
      v46 = objc_msgSend(v64, "tilesPerFrame");
      v47 = 0.01;
      if (v46 == 1)
        v47 = 1.0;
      -[VCVideoTransmitterConfig setMinKeyFrameGenerationIntervalInSeconds:](v5, "setMinKeyFrameGenerationIntervalInSeconds:", v47);
      -[VCVideoTransmitterConfig setIsFecGeneratorEnabled:](v5, "setIsFecGeneratorEnabled:", 0);
      -[VCVideoTransmitterConfig setFecHeaderV1Enabled:](v5, "setFecHeaderV1Enabled:", 0);
      -[VCVideoTransmitterConfig setFecEnabled:](v5, "setFecEnabled:", objc_msgSend(v64, "fecEnabled"));
      -[VCVideoTransmitterConfig setRtxEnabled:](v5, "setRtxEnabled:", objc_msgSend(v64, "rtxEnabled"));
      -[VCVideoTransmitterConfig setAccessNetworkType:](v5, "setAccessNetworkType:", objc_msgSend(v64, "accessNetworkType"));
      -[VCVideoTransmitterConfig setUseRateControl:](v5, "setUseRateControl:", 1);
      -[VCVideoTransmitterConfig setMediaControlInfoGenerator:](v5, "setMediaControlInfoGenerator:", -[VCMediaStream mediaControlInfoGenerator](self, "mediaControlInfoGenerator"));
      -[VCVideoTransmitterConfig setUseInBandFec:](v5, "setUseInBandFec:", objc_msgSend(v64, "useInBandFEC"));
      -[VCVideoTransmitterConfig setCaptureSource:](v5, "setCaptureSource:", objc_msgSend(v64, "captureSource"));
      v43 = (void *)objc_msgSend(v64, "txCodecFeatureListStrings");
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke_3;
      v66[3] = &unk_1E9E57D50;
      v66[4] = v5;
      v44 = v66;
      goto LABEL_80;
    default:
      -[VCVideoTransmitterConfig setMode:](v5, "setMode:", 6);
      if (!-[VCVideoTransmitterConfig encoderUsage](v5, "encoderUsage"))
        -[VCVideoTransmitterConfig setEncoderUsage:](v5, "setEncoderUsage:", 2);
      -[VCVideoTransmitterConfig setPixelFormat:](v5, "setPixelFormat:", 875704438);
      return v5;
  }
}

uint64_t __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCustomFeatureListString:payload:", a3, +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(a2, "unsignedIntValue")));
}

uint64_t __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCustomFeatureListString:payload:", a3, +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(a2, "unsignedIntValue")));
}

uint64_t __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCustomFeatureListString:payload:", a3, +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(a2, "unsignedIntValue")));
}

uint64_t __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCustomFeatureListString:payload:", a3, +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(a2, "unsignedIntValue")));
}

- (void)initVideoTransmitter
{
  VCMediaStreamConfig *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  int *v8;
  __objc2_class *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t initialTargetBitrate;
  VCMediaStreamMultiwayConfig *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  _BYTE v30[24];
  __int128 v31;
  VCVideoStream *v32;
  __int128 v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v30 = 136315906;
      *(_QWORD *)&v30[4] = v4;
      *(_WORD *)&v30[12] = 2080;
      *(_QWORD *)&v30[14] = "-[VCVideoStream initVideoTransmitter]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 422;
      WORD2(v31) = 2048;
      *(_QWORD *)((char *)&v31 + 6) = self;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]", v30, 0x26u);
    }
  }
  v6 = -[VCVideoStream newVideoTransmitterConfigWithVideoStreamConfig:](self, "newVideoTransmitterConfigWithVideoStreamConfig:", v3);
  v7 = -[VCMediaStreamConfig type](v3, "type");
  v8 = &OBJC_IVAR___AVCPreviewCALayerHost__preview;
  if (v7 <= 6)
  {
    if (((1 << v7) & 0x76) != 0)
    {
      v9 = VCVideoTransmitterDefault;
LABEL_7:
      self->_videoTransmitter = (VCVideoTransmitterBase *)objc_msgSend([v9 alloc], "initWithConfig:", v6);
      goto LABEL_8;
    }
    if (!v7)
    {
      v9 = VCVideoStreamTransmitter;
      goto LABEL_7;
    }
    self->_videoTransmitter = (VCVideoTransmitterBase *)-[VCVideoTransmitterDefault initWithConfig:]([VCVideoTransmitterDefault alloc], "initWithConfig:", v6);
    v22 = -[VCMediaStreamConfig multiwayConfig](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "multiwayConfig");
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v23 = (void *)-[VCMediaStreamMultiwayConfig subStreamConfigs](v22, "subStreamConfigs");
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v29 = objc_msgSend(v28, "keyFrameInterval");
          if (v29 == objc_msgSend(v28, "framerate"))
            -[VCVideoTransmitterBase setKeyFrameOnlyStreamID:](self->_videoTransmitter, "setKeyFrameOnlyStreamID:", objc_msgSend(v28, "idsStreamID"));
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
      }
      while (v25);
    }
    -[VCObject reportingAgent](self, "reportingAgent");
    -[VCVideoTransmitterBase encodingWidth](self->_videoTransmitter, "encodingWidth");
    -[VCVideoTransmitterBase encodingHeight](self->_videoTransmitter, "encodingHeight");
    -[VCVideoTransmitterBase targetFramerate](self->_videoTransmitter, "targetFramerate");
    reportingVideoProp();
    v8 = &OBJC_IVAR___AVCPreviewCALayerHost__preview;
  }
LABEL_8:
  if ((VCVideoStream *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_19;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v19 = *(uint64_t *)((char *)&self->super.super.super.isa + v8[566]);
    *(_DWORD *)v30 = 136316418;
    *(_QWORD *)&v30[4] = v17;
    *(_WORD *)&v30[12] = 2080;
    *(_QWORD *)&v30[14] = "-[VCVideoStream initVideoTransmitter]";
    *(_WORD *)&v30[22] = 1024;
    LODWORD(v31) = 448;
    WORD2(v31) = 2112;
    *(_QWORD *)((char *)&v31 + 6) = v10;
    HIWORD(v31) = 2048;
    v32 = self;
    LOWORD(v33) = 2048;
    *(_QWORD *)((char *)&v33 + 2) = v19;
    v14 = "VCVideoStream [%s] %s:%d %@(%p) videoTransmitter=%p";
    v15 = v18;
    v16 = 58;
    goto LABEL_18;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(uint64_t *)((char *)&self->super.super.super.isa + v8[566]);
      *(_DWORD *)v30 = 136315906;
      *(_QWORD *)&v30[4] = v11;
      *(_WORD *)&v30[12] = 2080;
      *(_QWORD *)&v30[14] = "-[VCVideoStream initVideoTransmitter]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 448;
      WORD2(v31) = 2048;
      *(_QWORD *)((char *)&v31 + 6) = v13;
      v14 = "VCVideoStream [%s] %s:%d videoTransmitter=%p";
      v15 = v12;
      v16 = 38;
LABEL_18:
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, v30, v16);
    }
  }
LABEL_19:

  -[VCVideoCaptureConverter setDestinationFramerate:](self->_captureConverter, "setDestinationFramerate:", -[VCMediaStreamConfig framerate](v3, "framerate"));
  -[VCVideoCaptureConverter setSourceFramerate:](self->_captureConverter, "setSourceFramerate:", objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "getCaptureFrameRateForSource:", self->_captureSource));
  v20 = v8[566];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v20), "setIsServerBasedBandwidthProbingEnabled:", self->_isServerBasedBandwidthProbingEnabled);
  initialTargetBitrate = self->_initialTargetBitrate;
  if (!(_DWORD)initialTargetBitrate)
    initialTargetBitrate = -[VCMediaStreamConfig txMinBitrate](v3, "txMinBitrate");
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v20), "setTargetBitrate:", initialTargetBitrate, *(_OWORD *)v30, *(_QWORD *)&v30[16], v31, v32, v33);
}

- (void)destroyVideoTransmitter
{
  uint64_t v3;
  NSObject *v4;
  VCVideoTransmitterBase *videoTransmitter;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  VCVideoStream *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCVideoStream destroyVideoTransmitter]";
      v10 = 1024;
      v11 = 462;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]", (uint8_t *)&v6, 0x26u);
    }
  }
  videoTransmitter = self->_videoTransmitter;
  if (videoTransmitter)
  {
    self->_initialTargetBitrate = -[VCVideoTransmitterBase targetBitrate](videoTransmitter, "targetBitrate");
    videoTransmitter = self->_videoTransmitter;
  }
  -[VCVideoTransmitterBase stopVideo](videoTransmitter, "stopVideo");

  self->_videoTransmitter = 0;
}

+ (id)newFeatureListStringsWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_msgSend((id)objc_msgSend(a3, "rxCodecFeatureListStrings"), "objectForKeyedSubscript:", &unk_1E9EF6A70);
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, &unk_1E9EF6A88);
  v6 = objc_msgSend((id)objc_msgSend(a3, "rxCodecFeatureListStrings"), "objectForKeyedSubscript:", &unk_1E9EF6AA0);
  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, &unk_1E9EF6AB8);
  return v4;
}

- (void)setVideoExpected:(BOOL)a3
{
  -[VCVideoReceiverBase setVideoExpected:](self->_videoReceiver, "setVideoExpected:", a3);
}

- (id)newScreenCaptureConfigForVideoConfig:(id)a3
{
  id v5;
  int64_t type;
  _BOOL8 v8;
  int64_t v9;
  _BOOL8 v11;
  void *v12;
  int64_t v13;
  _BOOL8 v14;
  void *remoteScreenAttributesDidChange;
  int64_t v16;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self, CFSTR("Client"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_captureSourceID), CFSTR("CaptureSourceID"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_customWidth), CFSTR("VideoWidth"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_customHeight), CFSTR("VideoHeight"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "framerate")), CFSTR("FrameRate"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->super._clientPID), CFSTR("ClientPid"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCVideoStream pickScreenDisplayMode](self, "pickScreenDisplayMode")), CFSTR("ScreenCaptureConfigurationDisplayMode"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "shouldSendBlackFramesOnClearScreen")), CFSTR("ShouldSendBlackFramesOnClearScreen"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E9EF6AD0, CFSTR("ResolutionScaling"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_screenDisplayID), CFSTR("ScreenDisplayID"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat")), CFSTR("PixelFormat"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "hdrMode")), CFSTR("HDRMode"));
  type = self->_type;
  v8 = type == 2 || type == 5;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8), CFSTR("EnableIdleFrameAdjustments"));
  v9 = self->_type;
  v11 = v9 == 1 || v9 == 6;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11), CFSTR("ScreenWatcherExempt"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("ShouldAllowReconfigureForLocalDisplay"));
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = self->_type;
  v14 = 1;
  if (v13 != 1 && v13 != 6)
    v14 = v13 == 5 && (unint64_t)objc_msgSend(a3, "tilesPerFrame", 1) > 1;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v12, "numberWithInt:", v14), CFSTR("ShouldOptimizeForLowLatency"));
  if (objc_msgSend(a3, "remoteDeviceName"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "remoteDeviceName"), CFSTR("RemoteDeviceName"));
  remoteScreenAttributesDidChange = self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange;
  if (remoteScreenAttributesDidChange)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", remoteScreenAttributesDidChange, CFSTR("ColorInfo"));
  v16 = self->_type;
  if (v16 == 2)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E9EF6AE8, CFSTR("BiomeEventType"));
    v16 = self->_type;
  }
  if (v16 == 6)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E9EF6B00, CFSTR("CaptureThermalLevelModerate"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E9EF6B18, CFSTR("CaptureThermalLevelHeavy"));
  }
  return v5;
}

- (int)pickScreenDisplayMode
{
  int64_t type;

  type = self->_type;
  if (type == 6)
    return 1;
  if (type != 2)
    return 0;
  if (self->super._clientPID)
    return 1;
  return 2;
}

- (BOOL)isScreenConfig:(id)a3
{
  unint64_t v4;
  BOOL result;

  v4 = objc_msgSend(a3, "type");
  result = 0;
  if (v4 <= 6)
  {
    if (((1 << v4) & 0x66) != 0)
      return 1;
    if (v4 == 3)
    {
      if (objc_msgSend(a3, "captureSource") != 2)
        return objc_msgSend(a3, "captureSource") == 1;
      return 1;
    }
  }
  return result;
}

- (void)setupMultiwayVideoReceiverTemporalScalingConfig:(tagVCVideoReceiverStreamConfig *)a3 forTransportStream:(id)a4
{
  void *v7;
  unsigned __int16 temporalScalingBaseLayerStreamID;

  v7 = (void *)objc_msgSend((id)objc_msgSend(a4, "streamConfig"), "multiwayConfig");
  if (objc_msgSend(v7, "isTemporalStream"))
  {
    if (objc_msgSend(v7, "parentStreamID"))
    {
      temporalScalingBaseLayerStreamID = self->_temporalScalingBaseLayerStreamID;
    }
    else
    {
      temporalScalingBaseLayerStreamID = objc_msgSend(a4, "idsStreamId");
      self->_temporalScalingBaseLayerStreamID = temporalScalingBaseLayerStreamID;
    }
    a3->streamInfo.baseStreamID = temporalScalingBaseLayerStreamID;
    a3->isTemporalScalingEnabled = 1;
  }
  else
  {
    a3->streamInfo.baseStreamID = objc_msgSend(a4, "idsStreamId");
    a3->isTemporalScalingEnabled = 0;
    self->_temporalScalingBaseLayerStreamID = 0;
  }
}

- (void)setupMultiwayVideoReceiverStreamSwitchInfo:(tagVCVideoReceiverStreamConfig *)a3 forTransportStream:(id)a4
{
  void *v7;
  signed int v8;
  uint64_t v9;
  unsigned __int16 *v10;

  v7 = (void *)objc_msgSend((id)objc_msgSend(a4, "streamConfig"), "multiwayConfig");
  a3->streamInfo.streamID = objc_msgSend(a4, "idsStreamId");
  -[VCVideoStream setupMultiwayVideoReceiverTemporalScalingConfig:forTransportStream:](self, "setupMultiwayVideoReceiverTemporalScalingConfig:forTransportStream:", a3, a4);
  a3->streamInfo.repairStreamID = objc_msgSend(v7, "repairedStreamID");
  v8 = objc_msgSend((id)objc_msgSend(v7, "subStreamConfigs"), "count");
  a3->streamInfo.subStreamCount = v8;
  if (v8 >= 1)
  {
    v9 = 0;
    do
    {
      v10 = &a3->streamInfo.streamID + v9;
      v10[6] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "subStreamConfigs"), "objectAtIndexedSubscript:", v9), "idsStreamID");
      v10[15] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "subStreamConfigs"), "objectAtIndexedSubscript:", v9++), "repairedStreamID");
    }
    while (v9 < (int)a3->streamInfo.subStreamCount);
  }
}

- (void)setupMultiwayVideoReceiverConfig:(tagVCVideoReceiverConfig *)a3 forTransportStream:(id)a4
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int streamCount;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (void *)objc_msgSend(a4, "streamConfig");
  v8 = (void *)objc_msgSend(v7, "multiwayConfig");
  *(_QWORD *)&v22 = objc_msgSend(a4, "rtpHandle");
  *(_QWORD *)&v23 = objc_msgSend(v7, "keyFrameInterval") == 0;
  WORD1(v23) = objc_msgSend(v7, "framerate");
  *((_QWORD *)&v23 + 1) = objc_msgSend(a4, "receiverSframeCryptor");
  *(_QWORD *)&v24 = -[VCMediaStream mediaControlInfoGenerator](self, "mediaControlInfoGenerator");
  *((_QWORD *)&v24 + 1) = objc_msgSend((id)objc_msgSend(v7, "rateControlConfig"), "statisticsCollector");
  LODWORD(v25) = 1;
  BYTE5(v25) = objc_msgSend(v7, "isRTCPForLossFeedbackEnabled");
  BYTE6(v25) = objc_msgSend(v7, "rtcpPSFB_LTRAckEnabled");
  if (objc_msgSend(v7, "rtcpPSFB_LTRAckEnabled"))
    v9 = 2;
  else
    v9 = 1;
  DWORD2(v25) = v9;
  BYTE12(v25) = objc_msgSend(v7, "shouldEnableMLEnhance");
  if (v8)
  {
    BYTE5(v23) = objc_msgSend(v8, "isOneToOne");
    BYTE4(v25) = objc_msgSend(v8, "isOneToOne");
    BYTE13(v25) = objc_msgSend(v8, "isOneToOne");
    if (objc_msgSend(v8, "isOneToOne"))
    {
      *(_QWORD *)&v24 = objc_msgSend((id)objc_msgSend(v7, "rateControlConfig"), "mediaControlInfoGenerator");
      LODWORD(v25) = 0;
    }
    if (a3->streamSwitchEnabled)
      -[VCVideoStream setupMultiwayVideoReceiverStreamSwitchInfo:forTransportStream:](self, "setupMultiwayVideoReceiverStreamSwitchInfo:forTransportStream:", &v19, a4);
    v10 = (void *)objc_msgSend(a4, "streamConfig");
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v10, "rxCodecFeatureListStrings"), "count"));
    v12 = (void *)objc_msgSend(v10, "rxCodecFeatureListStrings");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__VCVideoStream_setupMultiwayVideoReceiverConfig_forTransportStream___block_invoke;
    v18[3] = &unk_1E9E57D50;
    v18[4] = v11;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v18);
    *((_QWORD *)&v22 + 1) = v11;
  }
  streamCount = a3->streamCount;
  v14 = (char *)a3 + 112 * a3->streamCount;
  v15 = v21;
  *(_OWORD *)(v14 + 56) = v22;
  v16 = v24;
  *(_OWORD *)(v14 + 72) = v23;
  *(_OWORD *)(v14 + 88) = v16;
  *(_OWORD *)(v14 + 104) = v25;
  v17 = v20;
  *(_OWORD *)(v14 + 8) = v19;
  *(_OWORD *)(v14 + 24) = v17;
  a3->streamCount = streamCount + 1;
  *(_OWORD *)(v14 + 40) = v15;
}

uint64_t __69__VCVideoStream_setupMultiwayVideoReceiverConfig_forTransportStream___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;

  v5 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(a2, "unsignedIntValue"));
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5));
}

- (void)addReceiverStreamConfigsToReceiverConfig:(tagVCVideoReceiverConfig *)a3 streamConfig:(id)a4
{
  id v7;
  NSMutableArray *transportArray;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  char v14;
  CFTypeRef v15;
  unsigned int v16;
  char *v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = +[VCVideoStream newFeatureListStringsWithConfiguration:](VCVideoStream, "newFeatureListStringsWithConfiguration:", a4);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  transportArray = self->super._transportArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(transportArray);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "rtpHandle");
        v14 = objc_msgSend(a4, "ltrpEnabled");
        if (v7)
          v15 = CFRetain(v7);
        else
          v15 = 0;
        v16 = a3->streamCount++;
        v17 = (char *)a3 + 112 * v16;
        *(_OWORD *)(v17 + 8) = 0u;
        *(_OWORD *)(v17 + 24) = 0u;
        *(_OWORD *)(v17 + 40) = 0u;
        *((_QWORD *)v17 + 7) = v13;
        *((_QWORD *)v17 + 8) = v15;
        *(_OWORD *)(v17 + 72) = 0u;
        *(_OWORD *)(v17 + 88) = 0u;
        *(_QWORD *)(v17 + 102) = 0;
        v17[110] = v14;
        v17[111] = 0;
        *((_QWORD *)v17 + 14) = 1;
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v10);
  }

}

- (void)cleaunpReceiverConfig:(tagVCVideoReceiverConfig *)a3
{
  unint64_t streamCount;
  unint64_t v5;
  uint64_t v6;
  const void *v7;

  streamCount = a3->streamCount;
  if ((_DWORD)streamCount)
  {
    v5 = 0;
    v6 = 64;
    do
    {
      v7 = *(const void **)((char *)&a3->streamCount + v6);
      if (v7)
      {
        CFRelease(v7);
        *(_QWORD *)((char *)&a3->streamCount + v6) = 0;
        streamCount = a3->streamCount;
      }
      ++v5;
      v6 += 112;
    }
    while (v5 < streamCount);
  }
}

- (tagVCVideoStreamReceiverConfig)videoStreamReceiverConfigWithDumpID:(SEL)a3 reportingAgent:(unsigned int)a4
{
  tagVCVideoStreamReceiverConfig *result;
  void *v10;
  int reportingModuleID;

  retstr->var10 = 0;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  retstr->var2 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var0 = -[VCMediaStreamTransport rtpHandle](-[VCMediaStream defaultTransport](self, "defaultTransport"), "rtpHandle");
  retstr->var1 = self;
  result = (tagVCVideoStreamReceiverConfig *)-[VCVideoStream videoReceiverDelegateFunctions](self, "videoReceiverDelegateFunctions");
  retstr->var2.didReceiveSampleBuffer = result;
  retstr->var2.didReceiveRemoteFrame = v10;
  retstr->var3 = a5;
  reportingModuleID = self->_reportingModuleID;
  retstr->var4 = a4;
  retstr->var5 = reportingModuleID;
  retstr->var6 = self->_statisticsCollector;
  retstr->var7 = self->super._transportSetupInfo.setupType == 5;
  retstr->var8 = self;
  retstr->var9 = VCMediaStream_RTCPPacketsCallback;
  retstr->var10 = self->super._rateAdaptation;
  return result;
}

- (tagVCVideoReceiverConfig)videoReceiverConfigWithVideoStreamConfig:(SEL)a3
{
  int v7;
  unsigned int rtpTimestampRate;
  BOOL *p_isLateFrameRecoveryEnabled;
  int v10;
  __int128 v11;
  double v12;
  _BOOL4 v13;
  _BOOL4 BoolValueForKey;
  int v15;
  char v16;
  _BOOL4 v17;
  double v18;
  int v19;
  NSMutableArray *transportArray;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  int v30;
  BOOL v32;
  BOOL v34;
  const __CFString *v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  const char *v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  uint64_t v43;
  NSObject *v44;
  int v45;
  const char *v46;
  double v47;
  tagVCVideoReceiverConfig *result;
  BOOL *v49;
  BOOL v50;
  id v51;
  _BYTE buf[48];
  _QWORD v53[2];
  _BYTE v54[128];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  bzero(retstr, 0x568uLL);
  retstr->streamToken = self->super._streamToken;
  if (objc_msgSend(a4, "syncSource"))
  {
    v7 = objc_msgSend((id)objc_msgSend(a4, "syncSource"), "getSyncSourceSampleRate");
    rtpTimestampRate = self->_rtpTimestampRate;
  }
  else
  {
    rtpTimestampRate = self->_rtpTimestampRate;
    v7 = rtpTimestampRate;
  }
  retstr->audioTSRate = v7;
  retstr->videoTSRate = rtpTimestampRate;
  retstr->enableVPBLogging = -[VCDefaults enableVPBLogging](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableVPBLogging");
  *(_QWORD *)&retstr->dumpID = 0;
  retstr->enableBitstreamCapture = -[VCDefaults enableBitstreamCapture](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableBitstreamCapture");
  retstr->enableRxDecodeYUVDump = 0;
  retstr->enableRecvBitstreamDump = -[VCDefaults enableRecvBitstreamDump](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableRecvBitstreamDump");
  retstr->decoderNumOfTiles = objc_msgSend(a4, "tilesPerFrame");
  retstr->reportingParentID = self->_reportingModuleID;
  retstr->mediaControlInfoGenerator = -[VCMediaStream mediaControlInfoGenerator](self, "mediaControlInfoGenerator");
  retstr->useRTCPForFIR = 1;
  retstr->isLTRPEnabled = objc_msgSend(a4, "ltrpEnabled");
  retstr->isVariableSliceModeEnabled = objc_msgSend(a4, "isVariableSliceModeEnabled");
  retstr->cvoExtensionID = objc_msgSend(a4, "cvoExtensionID");
  retstr->videoJBEnabled = objc_msgSend(a4, "useVideoJitterForVideoPlayout");
  retstr->jbTargetEstimatorSynchronizer = (tagVCJBTargetEstimatorSynchronizer *)objc_msgSend(a4, "jbTargetEstimatorSynchronizer");
  if (-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"))
    retstr->wrmInfo = -[VCNetworkFeedbackController wrmInfo](-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"), "wrmInfo");
  retstr->participantId = (__CFString *)objc_msgSend((id)objc_msgSend(a4, "multiwayConfig"), "participantId");
  retstr->sessionId = (__CFString *)objc_msgSend((id)objc_msgSend(a4, "multiwayConfig"), "sessionId");
  retstr->streamGroupID = objc_msgSend((id)objc_msgSend(a4, "multiwayConfig"), "streamGroupID");
  retstr->isReferenceFrameEnabled = 1;
  retstr->enableDeferredAssembly = objc_msgSend(a4, "deferredAssemblyEnabled");
  retstr->deferredAssemblyOffset = 0.0;
  retstr->externalPresentationClockType = 1;
  if (objc_msgSend(a4, "isServerPacketRetransmissionEnabled"))
  {
    retstr->isServerPacketRetransmissionEnabled = 1;
    p_isLateFrameRecoveryEnabled = &retstr->isLateFrameRecoveryEnabled;
    retstr->isLateFrameRecoveryEnabled = 1;
  }
  else
  {
    v10 = objc_msgSend(a4, "rtxEnabled");
    retstr->isServerPacketRetransmissionEnabled = v10;
    p_isLateFrameRecoveryEnabled = &retstr->isLateFrameRecoveryEnabled;
    retstr->isLateFrameRecoveryEnabled = 1;
    if (!v10)
      goto LABEL_10;
  }
  -[VCVideoStream readServerPacketRetransmissionsForVideoStoreBagConfig:](self, "readServerPacketRetransmissionsForVideoStoreBagConfig:", a4);
  v11 = *(_OWORD *)&buf[16];
  *(_OWORD *)&retstr->nackGeneratorStoreBagsConfig.nackGeneratorStorebagConfigVersion = *(_OWORD *)buf;
  *(_OWORD *)retstr->nackGeneratorStoreBagsConfig.nackThrottlingFactorBuckets = v11;
  *(_OWORD *)retstr->nackGeneratorStoreBagsConfig.nackThrottlingPlrBuckets = *(_OWORD *)&buf[32];
  *(_QWORD *)&retstr->nackGeneratorStoreBagsConfig.nackGenerationMaxPLR = v53[0];
LABEL_10:
  objc_msgSend(a4, "minPlaybackInterval");
  retstr->minPlaybackInterval = v12;
  retstr->maxDisplayRefreshRate = -[VCHardwareSettingsEmbedded maxDisplayRefreshRate](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxDisplayRefreshRate");
  v13 = objc_msgSend(a4, "direction") == 2 || objc_msgSend(a4, "direction") == 3;
  BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("videoJBUseErasureSensitiveMode"), objc_msgSend(a4, "jitterBufferMode") == 0);
  switch(objc_msgSend(a4, "type"))
  {
    case 0:
      retstr->triggerSoundAlarmOnRTPReceive = 1;
      goto LABEL_90;
    case 1:
    case 6:
      -[VCVideoStream addReceiverStreamConfigsToReceiverConfig:streamConfig:](self, "addReceiverStreamConfigsToReceiverConfig:streamConfig:", retstr, a4);
      retstr->mode = 2;
      retstr->isVCRCStatsOnlyVideoBased = 1;
      retstr->rateAdaptation = self->super._rateAdaptation;
      *(_WORD *)&retstr->isAsyncDecodingEnabled = 257;
      retstr->useDisplayLink = v13;
      retstr->useInternalClockForPresentation = v13;
      retstr->externalPresentationClockType = !v13;
      retstr->enableJitterBufferInReceiver = 1;
      retstr->enableJitterBufferInPlayer = objc_msgSend(a4, "hdrMode") != 0;
      retstr->enableImmediateDecode = objc_msgSend(a4, "hdrMode") == 0;
      retstr->enableQueueAlarmForDisplay = objc_msgSend(a4, "hdrMode") != 0;
      v15 = !BoolValueForKey && objc_msgSend(a4, "hdrMode") == 0;
      retstr->jitterBufferMode = v15;
      retstr->isScreenSharing = 1;
      goto LABEL_90;
    case 2:
      -[VCVideoStream addReceiverStreamConfigsToReceiverConfig:streamConfig:](self, "addReceiverStreamConfigsToReceiverConfig:streamConfig:", retstr, a4);
      retstr->mode = 3;
      retstr->isVCRCStatsOnlyVideoBased = 1;
      retstr->rateAdaptation = self->super._rateAdaptation;
      *(_WORD *)&retstr->isAsyncDecodingEnabled = 257;
      retstr->useDisplayLink = v13;
      retstr->useInternalClockForPresentation = v13;
      retstr->externalPresentationClockType = !v13;
      *(_WORD *)&retstr->enableJitterBufferInReceiver = 257;
      retstr->enableImmediateDecode = 0;
      retstr->enableQueueAlarmForDisplay = 1;
      retstr->jitterBufferMode = !BoolValueForKey;
      retstr->isScreenSharing = 1;
      goto LABEL_90;
    case 3:
      if (self->super._operatingMode == 6)
        v16 = objc_msgSend((id)objc_msgSend(a4, "multiwayConfig"), "isOneToOne") ^ 1;
      else
        v16 = 0;
      retstr->streamSwitchEnabled = v16;
      v51 = a4;
      v50 = v13;
      v17 = !self->super._isWRMinitialized && objc_msgSend(a4, "direction") == 2;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      transportArray = self->super._transportArray;
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v55, v54, 16, p_isLateFrameRecoveryEnabled);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v56 != v23)
              objc_enumerationMutation(transportArray);
            v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            -[VCVideoStream setupMultiwayVideoReceiverConfig:forTransportStream:](self, "setupMultiwayVideoReceiverConfig:forTransportStream:", retstr, v25);
            if (v17)
            {
              if (-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"))
              {
                -[VCMediaStream initializeWRMUsingRtpHandle:](self, "initializeWRMUsingRtpHandle:", objc_msgSend(v25, "rtpHandle"));
                self->super._isWRMinitialized = 1;
              }
              else if (!-[VCMediaStream networkFeedbackController](self, "networkFeedbackController")
                     && (int)VRTraceGetErrorLogLevelForModule() >= 5)
              {
                v26 = VRTraceErrorLogLevelToCSTR();
                v27 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  *(_QWORD *)&buf[4] = v26;
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "-[VCVideoStream videoReceiverConfigWithVideoStreamConfig:]";
                  *(_WORD *)&buf[22] = 1024;
                  *(_DWORD *)&buf[24] = 827;
                  _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d NetworkFeedbackController is nil in VideoStream", buf, 0x1Cu);
                }
              }
            }
          }
          v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
        }
        while (v22);
      }
      if (objc_msgSend(v51, "direction") == 1)
      {
        v28 = 0;
      }
      else
      {
        v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v51, "rxPayloadMap"), "allKeys"), "firstObject"), "intValue");
        v28 = -[VCVideoStream useUEPForVideoConfig:](self, "useUEPForVideoConfig:", v29);
        v30 = v29 & 0xFFFFFFFE;
        v32 = (_DWORD)v29 == 110 || v30 == 124;
        retstr->enableFrameDiscontinuityStatus = v32;
        v34 = retstr->isLateFrameRecoveryEnabled && (_DWORD)v29 != 110 && v30 != 124;
        *v49 = v34;
      }
      retstr->mode = objc_msgSend((id)objc_msgSend(v51, "multiwayConfig"), "isOneToOne") ^ 1;
      retstr->useRTCPForFIR = objc_msgSend(v51, "rtcpPSFB_FIREnabled");
      retstr->sendRTCP_PSFB_FIR = objc_msgSend(v51, "rtcpPSFB_FIREnabled");
      retstr->isVCRCStatsOnlyVideoBased = 0;
      *(_WORD *)&retstr->isAsyncDecodingEnabled = 0;
      retstr->decoderNumOfTiles = objc_msgSend(v51, "tilesPerFrame");
      retstr->enableUEP = v28;
      retstr->reportingParentID = self->_reportingModuleID;
      retstr->shouldEnableFaceZoom = self->_shouldEnableFaceZoom;
      retstr->idsParticipantID = objc_msgSend((id)objc_msgSend(v51, "multiwayConfig"), "remoteIDSParticipantID");
      retstr->triggerSoundAlarmOnRTPReceive = 1;
      retstr->fecHeaderV1Enabled = objc_msgSend(v51, "fecHeaderVersion") == 1;
      retstr->isReferenceFrameEnabled = 0;
      retstr->enableJitterBufferInReceiver = VCDefaults_GetBoolValueForKey(CFSTR("enableVideoJitterBufferInReceiver"), 1);
      retstr->forceZeroRegionOfInterestOrigin = objc_msgSend(v51, "forceZeroRegionOfInterestOrigin");
      if (!-[VCVideoStream isScreenConfig:](self, "isScreenConfig:", v51)
        && !objc_msgSend(v51, "useVideoJitterForVideoPlayout"))
      {
        goto LABEL_87;
      }
      if ((VCVideoStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v36 = VRTraceErrorLogLevelToCSTR();
          v37 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v38 = objc_msgSend((id)objc_msgSend(v51, "multiwayConfig"), "isOneToOne");
            v39 = "No";
            *(_QWORD *)&buf[4] = v36;
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[14] = "-[VCVideoStream videoReceiverConfigWithVideoStreamConfig:]";
            *(_WORD *)&buf[12] = 2080;
            if (v38)
              v39 = "Yes";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 856;
            *(_WORD *)&buf[28] = 2080;
            *(_QWORD *)&buf[30] = v39;
            v40 = "VCVideoStream [%s] %s:%d Configured for Screen Sharing (isOneToOne=%s)";
            v41 = v37;
            v42 = 38;
            goto LABEL_83;
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v35 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v35 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v43 = VRTraceErrorLogLevelToCSTR();
          v44 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v45 = objc_msgSend((id)objc_msgSend(v51, "multiwayConfig"), "isOneToOne");
            *(_DWORD *)buf = 136316418;
            v46 = "No";
            *(_QWORD *)&buf[4] = v43;
            *(_QWORD *)&buf[14] = "-[VCVideoStream videoReceiverConfigWithVideoStreamConfig:]";
            *(_WORD *)&buf[12] = 2080;
            *(_WORD *)&buf[22] = 1024;
            if (v45)
              v46 = "Yes";
            *(_DWORD *)&buf[24] = 856;
            *(_WORD *)&buf[28] = 2112;
            *(_QWORD *)&buf[30] = v35;
            *(_WORD *)&buf[38] = 2048;
            *(_QWORD *)&buf[40] = self;
            LOWORD(v53[0]) = 2080;
            *(_QWORD *)((char *)v53 + 2) = v46;
            v40 = "VCVideoStream [%s] %s:%d %@(%p) Configured for Screen Sharing (isOneToOne=%s)";
            v41 = v44;
            v42 = 58;
LABEL_83:
            _os_log_impl(&dword_1D8A54000, v41, OS_LOG_TYPE_DEFAULT, v40, buf, v42);
          }
        }
      }
      retstr->isAsyncDecodingEnabled = 1;
      retstr->useDisplayLink = v50;
      retstr->jitterBufferMode = 2;
      retstr->enableJitterBufferInReceiver = 1;
      retstr->enableImmediateDecode = 0;
      retstr->enableQueueAlarmForDisplay = v50;
      retstr->isScreenSharing = 1;
      objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-video-receiver-deferred-assembly-offset"), CFSTR("videoReceiverDeferredAssemblyOffset"), &unk_1E9EFB208, 1), "doubleValue");
      retstr->deferredAssemblyOffset = v47;
      if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8
        && objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-video-player-enable-loose-sync-for-facetime"), CFSTR("looseAVSyncEnabled"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v51, "looseAVSyncEnabled")), 0), "BOOLValue"))
      {
        retstr->enableAVLooseSync = 1;
        retstr->enableJitterBufferInPlayer = 1;
        retstr->useInternalClockForPresentation = 1;
        retstr->externalPresentationClockType = 0;
        retstr->triggerSoundAlarmOnRTPReceive = 0;
        retstr->enableHighWatermarkQueueDiscard = 1;
      }
LABEL_87:
      if (objc_msgSend((id)objc_msgSend(v51, "multiwayConfig"), "isOneToOne")
        && -[VCMediaStream networkFeedbackController](self, "networkFeedbackController"))
      {
        retstr->wrmInfo = -[VCNetworkFeedbackController wrmInfo](-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"), "wrmInfo");
      }
LABEL_90:
      result = (tagVCVideoReceiverConfig *)VCDefaults_GetBoolValueForKey(CFSTR("forceVideoStreamLowLatency"), 0);
      if ((_DWORD)result)
      {
        *(_WORD *)&retstr->enableJitterBufferInPlayer = 256;
        retstr->enableQueueAlarmForDisplay = 0;
      }
      return result;
    case 4:
      -[VCVideoStream addReceiverStreamConfigsToReceiverConfig:streamConfig:](self, "addReceiverStreamConfigsToReceiverConfig:streamConfig:", retstr, a4);
      retstr->mode = 3;
      retstr->isVCRCStatsOnlyVideoBased = 1;
      retstr->rateAdaptation = self->super._rateAdaptation;
      *(_WORD *)&retstr->isAsyncDecodingEnabled = 257;
      if (objc_msgSend(a4, "syncSource"))
      {
        retstr->externalPresentationClockType = 2;
      }
      else
      {
        retstr->useDisplayLink = v13;
        retstr->useInternalClockForPresentation = v13;
        retstr->externalPresentationClockType = !v13;
        *(_WORD *)&retstr->enableJitterBufferInReceiver = 257;
        retstr->enableImmediateDecode = 0;
        retstr->enableQueueAlarmForDisplay = 1;
        retstr->jitterBufferMode = !BoolValueForKey;
      }
      goto LABEL_90;
    case 5:
      -[VCVideoStream addReceiverStreamConfigsToReceiverConfig:streamConfig:](self, "addReceiverStreamConfigsToReceiverConfig:streamConfig:", retstr, a4);
      retstr->mode = 3;
      retstr->streamSwitchEnabled = 0;
      retstr->isVCRCStatsOnlyVideoBased = 1;
      retstr->rateAdaptation = self->super._rateAdaptation;
      *(_WORD *)&retstr->isAsyncDecodingEnabled = 257;
      retstr->decoderNumOfTiles = objc_msgSend(a4, "tilesPerFrame");
      retstr->triggerSoundAlarmOnRTPReceive = 0;
      retstr->fecHeaderV1Enabled = 0;
      retstr->isReferenceFrameEnabled = 0;
      retstr->forceZeroRegionOfInterestOrigin = objc_msgSend(a4, "forceZeroRegionOfInterestOrigin");
      retstr->enableJitterBufferInReceiver = 1;
      retstr->isScreenSharing = 1;
      if (objc_msgSend(a4, "syncSource"))
      {
        retstr->externalPresentationClockType = 2;
      }
      else
      {
        retstr->useDisplayLink = v13;
        retstr->jitterBufferMode = 2;
        retstr->enableImmediateDecode = 0;
        retstr->enableQueueAlarmForDisplay = v13;
      }
      retstr->enableDeferredAssembly = 1;
      objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-video-receiver-deferred-assembly-offset"), CFSTR("videoReceiverDeferredAssemblyOffset"), &unk_1E9EFB208, 1), "doubleValue");
      retstr->deferredAssemblyOffset = v18;
      v19 = objc_msgSend(a4, "direction") != 1
         && -[VCVideoStream useUEPForVideoConfig:](self, "useUEPForVideoConfig:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "rxPayloadMap"), "allKeys"), "firstObject"), "intValue"));
      retstr->enableUEP = v19;
      goto LABEL_90;
    default:
      goto LABEL_90;
  }
}

- (tagVCNACKGeneratorStoreBagsConfig)readServerPacketRetransmissionsForVideoStoreBagConfig:(SEL)a3
{
  double v6;
  double v7;
  _BOOL8 v8;
  double v9;
  uint64_t v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t i;
  double v22;
  char *v23;
  double v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  double nackGenerationMaxPLR;
  double nackGenerationMaxRTT;
  tagVCNACKGeneratorStoreBagsConfig *result;
  int v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BYTE v39[20];
  __int16 v40;
  double v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&retstr->nackGenerationMaxPLR = 0;
  *(_OWORD *)retstr->nackThrottlingFactorBuckets = 0u;
  *(_OWORD *)retstr->nackThrottlingPlrBuckets = 0u;
  *(_OWORD *)&retstr->nackGeneratorStorebagConfigVersion = 0u;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-nack-generator-population-percentage-with-additional-delay-budget"), CFSTR("delayBudgetForServerPacketRetransmissionForVideo"), 0, 1), "doubleValue");
  v7 = v6;
  if (objc_msgSend(a4, "isServerPacketRetransmissionEnabled"))
    v8 = (double)arc4random() / 4294967300.0 < v7;
  else
    v8 = 0;
  retstr->isExtraDelayForPacketRetransmissionsEnabled = v8;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-nack-generator-storebag-config-version"), 0, &unk_1E9EF6B30, 1), "doubleValue");
  v10 = (int)v9;
  retstr->nackGeneratorStorebagConfigVersion = v10;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-nack-generator-seq-num-aging-time"), 0, &unk_1E9EFB218, 1), "doubleValue");
  v12 = v11;
  retstr->nackSeqNumAgingDuration = v12;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-nack-generator-nack-bit-rate-limiting-max-ratio"), 0, &unk_1E9EFB228, 1), "doubleValue");
  v14 = v13;
  retstr->nackThrottlingBitRateLimitingMaxRatio = v14;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-nack-generator-nack-generation-max-plr"), 0, &unk_1E9EFB218, 1), "doubleValue");
  *(float *)&v15 = v15;
  retstr->nackGenerationMaxPLR = *(float *)&v15;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-nack-generator-nack-generation-max-rtt"), 0, &unk_1E9EF6B48, 1), "doubleValue");
  *(float *)&v16 = v16;
  retstr->nackGenerationMaxRTT = *(float *)&v16;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", objc_msgSend(+[GKSConnectivitySettings getStorebagValueStorebagKey:defaultValue:](GKSConnectivitySettings, "getStorebagValueStorebagKey:defaultValue:", CFSTR("vc-nack-generator-nack-throttling-plr-buckets"), CFSTR("0.005, 0.01, 0.025, 1.0")), "componentsSeparatedByString:", CFSTR(",")));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", objc_msgSend(+[GKSConnectivitySettings getStorebagValueStorebagKey:defaultValue:](GKSConnectivitySettings, "getStorebagValueStorebagKey:defaultValue:", CFSTR("vc-nack-generator-nack-throttling-factor-buckets"), CFSTR("1.0, 0.8, 0.5, 0.3")), "componentsSeparatedByString:", CFSTR(",")));
  if (((unint64_t)objc_msgSend(v17, "count") > 4 || (unint64_t)objc_msgSend(v18, "count") > 4)
    && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v32 = 136316162;
      v33 = v19;
      v34 = 2080;
      v35 = "-[VCVideoStream readServerPacketRetransmissionsForVideoStoreBagConfig:]";
      v36 = 1024;
      v37 = 920;
      v38 = 2048;
      *(_QWORD *)v39 = objc_msgSend(v17, "count");
      *(_WORD *)&v39[8] = 2048;
      *(_QWORD *)&v39[10] = objc_msgSend(v18, "count");
      _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d Unexpected size for plrBuckets(size=%lu) or factorBuckets(size=%lu) storebag", (uint8_t *)&v32, 0x30u);
    }
  }
  for (i = 0; i != 4; ++i)
  {
    objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", i), "doubleValue");
    *(float *)&v22 = v22;
    v23 = (char *)retstr + 4 * i;
    *((_DWORD *)v23 + 4) = LODWORD(v22);
    objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", i), "doubleValue");
    *(float *)&v24 = v24;
    *((_DWORD *)v23 + 8) = LODWORD(v24);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
      v28 = objc_msgSend(v18, "componentsJoinedByString:", CFSTR(","));
      nackGenerationMaxPLR = retstr->nackGenerationMaxPLR;
      nackGenerationMaxRTT = retstr->nackGenerationMaxRTT;
      v32 = 136317698;
      v33 = v25;
      v34 = 2080;
      v35 = "-[VCVideoStream readServerPacketRetransmissionsForVideoStoreBagConfig:]";
      v36 = 1024;
      v37 = 926;
      v38 = 1024;
      *(_DWORD *)v39 = v10;
      *(_WORD *)&v39[4] = 2048;
      *(double *)&v39[6] = v12;
      *(_WORD *)&v39[14] = 1024;
      *(_DWORD *)&v39[16] = v8;
      v40 = 2048;
      v41 = v14;
      v42 = 2112;
      v43 = v27;
      v44 = 2112;
      v45 = v28;
      v46 = 2048;
      v47 = nackGenerationMaxPLR;
      v48 = 2048;
      v49 = nackGenerationMaxRTT;
      _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Loaded storebag values for VCNackGenerator: nackGeneratorStorebagConfigVersion=%u nackSeqNumAgingDuration=%f isExtraDelayForPacketRetransmissionsEnabled=%d nackThrottlingBitRateLimitingMaxRatio=%f nackThrottlingPlrBuckets[%@] nackThrottlingFactorBuckets[%@] nackGenerationMaxPLR=%f nackGenerationMaxRTT=%f", (uint8_t *)&v32, 0x64u);
    }
  }
  objc_msgSend(a4, "setNackGeneratorStorebagConfigVersion:", v10);
  objc_msgSend(a4, "setIsExtraDelayForPacketRetransmissionsEnabled:", v8);

  return result;
}

- (void)setupVideoReceiver:(id)a3 withTransmitterHandle:(tagHANDLE *)a4
{
  _BOOL8 v7;
  __int128 v8;
  uint64_t v9;
  opaqueRTCReporting *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  VCVideoReceiverDefault *v15;
  opaqueRTCReporting *v16;
  VCVideoReceiverBase *videoReceiver;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  VCVideoReceiverBase *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  VCVideoReceiverBase *v27;
  VCVideoReceiverDefault *v28;
  opaqueRTCReporting *v29;
  VCVideoReceiverBase *v30;
  NSNumber *targetStreamID;
  const __CFString *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  uint64_t v39;
  NSObject *v40;
  NSNumber *v41;
  uint64_t v42;
  NSObject *v43;
  VCVideoReceiverBase *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  unint64_t v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  VCVideoStream *v61;
  __int16 v62;
  VCVideoReceiverBase *v63;
  _QWORD __dst[174];

  __dst[173] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "direction") == 2 || objc_msgSend(a3, "direction") == 3;
  memcpy(__dst, &unk_1D910FDD8, 0x568uLL);
  if (self)
    -[VCVideoStream videoReceiverConfigWithVideoStreamConfig:](self, "videoReceiverConfigWithVideoStreamConfig:", a3);
  else
    bzero(__dst, 0x568uLL);
  v51 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v49 = v8;
  v50 = v8;
  v47 = v8;
  v48 = v8;
  v46 = v8;
  v9 = -[VCVideoStream dumpIDFromCallID](self, "dumpIDFromCallID");
  if (v7)
  {
    v10 = -[VCObject reportingAgent](self, "reportingAgent");
    if (self)
    {
LABEL_9:
      -[VCVideoStream videoStreamReceiverConfigWithDumpID:reportingAgent:](self, "videoStreamReceiverConfigWithDumpID:reportingAgent:", v9, v10);
      goto LABEL_12;
    }
  }
  else
  {
    v10 = 0;
    if (self)
      goto LABEL_9;
  }
  v51 = 0;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
LABEL_12:
  if (objc_msgSend(a3, "type") != 4)
  {
    if (objc_msgSend(a3, "overlayToken"))
      v11 = objc_msgSend(a3, "overlayToken");
    else
      v11 = __dst[128];
    __dst[168] = v11;
  }
  v12 = -[VCVideoStream videoReceiverDelegateFunctions](self, "videoReceiverDelegateFunctions", 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, v46, v47, v48, v49, v50, v51);
  v14 = objc_msgSend(a3, "type", v12, v13);
  if (v14 <= 6)
  {
    if (((1 << v14) & 0x76) != 0)
    {
      v15 = [VCVideoReceiverDefault alloc];
      if (v7)
        v16 = -[VCObject reportingAgent](self, "reportingAgent");
      else
        v16 = 0;
      videoReceiver = -[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:](v15, "initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:", __dst, self, &v45, v16, self->_statisticsCollector, a4);
      self->_videoReceiver = videoReceiver;
      goto LABEL_23;
    }
    if (!v14)
    {
      self->_videoReceiver = (VCVideoReceiverBase *)-[VCVideoStreamReceiver initWithConfig:]([VCVideoStreamReceiver alloc], "initWithConfig:", &v46);
      goto LABEL_24;
    }
    if (objc_msgSend(a3, "direction") != 1 || objc_msgSend(a3, "isRTCPEnabled"))
    {
      v28 = [VCVideoReceiverDefault alloc];
      if (v7)
        v29 = -[VCObject reportingAgent](self, "reportingAgent");
      else
        v29 = 0;
      v30 = -[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:](v28, "initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:", __dst, self, &v45, v29, objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "statisticsCollector"), a4);
      self->_videoReceiver = v30;
      targetStreamID = self->_targetStreamID;
      if (targetStreamID)
        -[VCVideoReceiverBase setTargetStreamID:](v30, "setTargetStreamID:", -[NSNumber unsignedShortValue](targetStreamID, "unsignedShortValue"));
      if ((VCVideoStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_59;
        v33 = VRTraceErrorLogLevelToCSTR();
        v34 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_59;
        v35 = *(void **)&self->_constantTransportOverhead;
        *(_DWORD *)buf = 136315906;
        v53 = v33;
        v54 = 2080;
        v55 = "-[VCVideoStream setupVideoReceiver:withTransmitterHandle:]";
        v56 = 1024;
        v57 = 969;
        v58 = 2048;
        v59 = v35;
        v36 = "VCVideoStream [%s] %s:%d externalOutputVideoLatency=%f";
        v37 = v34;
        v38 = 38;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v32 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v32 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_59;
        v42 = VRTraceErrorLogLevelToCSTR();
        v43 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_59;
        v44 = *(VCVideoReceiverBase **)&self->_constantTransportOverhead;
        *(_DWORD *)buf = 136316418;
        v53 = v42;
        v54 = 2080;
        v55 = "-[VCVideoStream setupVideoReceiver:withTransmitterHandle:]";
        v56 = 1024;
        v57 = 969;
        v58 = 2112;
        v59 = (void *)v32;
        v60 = 2048;
        v61 = self;
        v62 = 2048;
        v63 = v44;
        v36 = "VCVideoStream [%s] %s:%d %@(%p) externalOutputVideoLatency=%f";
        v37 = v43;
        v38 = 58;
      }
      _os_log_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
LABEL_59:
      videoReceiver = self->_videoReceiver;
LABEL_23:
      VCVideoReceiver_SetExternalOutputVideoLatency((uint64_t)videoReceiver);
      goto LABEL_24;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v41 = self->_targetStreamID;
        *(_DWORD *)buf = 136315906;
        v53 = v39;
        v54 = 2080;
        v55 = "-[VCVideoStream setupVideoReceiver:withTransmitterHandle:]";
        v56 = 1024;
        v57 = 972;
        v58 = 2112;
        v59 = v41;
        _os_log_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Skipping video receiver for target stream[%@]", buf, 0x26u);
      }
    }
  }
LABEL_24:
  -[VCVideoReceiverBase setVideoExpected:](self->_videoReceiver, "setVideoExpected:", v7);
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_videoReceiver;
        *(_DWORD *)buf = 136315906;
        v53 = v19;
        v54 = 2080;
        v55 = "-[VCVideoStream setupVideoReceiver:withTransmitterHandle:]";
        v56 = 1024;
        v57 = 980;
        v58 = 2048;
        v59 = v21;
        v22 = "VCVideoStream [%s] %s:%d videoReceiver=%p";
        v23 = v20;
        v24 = 38;
LABEL_34:
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_videoReceiver;
        *(_DWORD *)buf = 136316418;
        v53 = v25;
        v54 = 2080;
        v55 = "-[VCVideoStream setupVideoReceiver:withTransmitterHandle:]";
        v56 = 1024;
        v57 = 980;
        v58 = 2112;
        v59 = (void *)v18;
        v60 = 2048;
        v61 = self;
        v62 = 2048;
        v63 = v27;
        v22 = "VCVideoStream [%s] %s:%d %@(%p) videoReceiver=%p";
        v23 = v26;
        v24 = 58;
        goto LABEL_34;
      }
    }
  }
  self->_lastMediaPriority = 0;
  self->super._isServerPacketRetransmissionEnabled = BYTE4(__dst[157]);
  -[VCVideoStream cleaunpReceiverConfig:](self, "cleaunpReceiverConfig:", __dst);
}

- (BOOL)useUEPForVideoConfig:(int)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unsigned int v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x1E0C80C00];
  v4 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:", 2);
  v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  v7 = 0;
  if (v5)
    VideoUtil_ParseFeatureListString(objc_msgSend(v5, "UTF8String"), &v7, 0);

  return v7 != 0;
}

- (void)updateVideoReceiver:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  VCVideoReceiverBase *videoReceiver;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  VCVideoStream *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[VCVideoStream updateVideoReceiver:]";
      v15 = 1024;
      v16 = 998;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]", (uint8_t *)&v11, 0x26u);
    }
  }
  -[VCVideoReceiverBase setRemoteVideoOrientation:](self->_videoReceiver, "setRemoteVideoOrientation:", objc_msgSend(a3, "remoteVideoInitialOrientation"));
  -[VCVideoReceiverBase setEnableCVO:cvoExtensionID:](self->_videoReceiver, "setEnableCVO:cvoExtensionID:", objc_msgSend(a3, "enableCVO"), objc_msgSend(a3, "cvoExtensionID"));
  videoReceiver = self->_videoReceiver;
  v8 = objc_msgSend(a3, "isRateAdaptationEnabled");
  v9 = objc_msgSend(a3, "rxMaxBitrate");
  v10 = objc_msgSend(a3, "rxMinBitrate");
  objc_msgSend(a3, "rtcpSendInterval");
  -[VCVideoReceiverBase setEnableRateAdaptation:maxBitrate:minBitrate:adaptationInterval:](videoReceiver, "setEnableRateAdaptation:maxBitrate:minBitrate:adaptationInterval:", v8, v9, v10);
}

- (void)destroyVideoReceiver
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
  VCVideoStream *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoStream destroyVideoReceiver]";
      v9 = 1024;
      v10 = 1008;
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]", (uint8_t *)&v5, 0x26u);
    }
  }
  -[VCVideoReceiverBase stopVideo](self->_videoReceiver, "stopVideo");
  -[VCVideoReceiverBase setDelegate:](self->_videoReceiver, "setDelegate:", 0);

  self->_videoReceiver = 0;
}

- (void)destroyVideoModules
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
  VCVideoStream *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoStream destroyVideoModules]";
      v9 = 1024;
      v10 = 1016;
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]", (uint8_t *)&v5, 0x26u);
    }
  }
  -[VCVideoStream destroyVideoTransmitter](self, "destroyVideoTransmitter");
  -[VCVideoStream destroyVideoReceiver](self, "destroyVideoReceiver");
}

- (void)setupCompoundStreamIDsWithStreamIDs:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  void *v7;
  __CFString *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  char *v12;
  os_log_t *v13;
  uint64_t v14;
  NSObject *v15;
  char *v16;
  os_log_t *v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  NSNumber *sendingStreamID;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  NSNumber *v29;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  VCVideoStream *v41;
  __int16 v42;
  NSNumber *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = -[VCMediaStream compoundStreamIDs](self, "compoundStreamIDs");
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a3);
    objc_msgSend(v7, "minusSet:", objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6));
    self->_isCompoundStreamIDsIncreased = objc_msgSend(v7, "count") != 0;
  }
  -[VCMediaStream setCompoundStreamIDs:](self, "setCompoundStreamIDs:", a3);

  self->_sendingStreamID = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "copy");
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v9 = -[VCMediaStream compoundStreamIDs](self, "compoundStreamIDs")
         ? -[NSString UTF8String](-[NSArray description](-[VCMediaStream compoundStreamIDs](self, "compoundStreamIDs"), "description"), "UTF8String"): "<nil>";
      asprintf(&__str, "%s", v9);
      if (__str)
      {
        __lasts = 0;
        v16 = strtok_r(__str, "\n", &__lasts);
        v17 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v18 = VRTraceErrorLogLevelToCSTR();
            v19 = *v17;
            if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v33 = v18;
              v34 = 2080;
              v35 = "-[VCVideoStream setupCompoundStreamIDsWithStreamIDs:]";
              v36 = 1024;
              v37 = 1037;
              v38 = 2080;
              v39 = "compoundStreamIDs=";
              v40 = 2080;
              v41 = (VCVideoStream *)v16;
              _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v16 = strtok_r(0, "\n", &__lasts);
        }
        while (v16);
        goto LABEL_28;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (__CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v10 = (const char *)-[__CFString UTF8String](v8, "UTF8String");
      v11 = -[VCMediaStream compoundStreamIDs](self, "compoundStreamIDs")
          ? -[NSString UTF8String](-[NSArray description](-[VCMediaStream compoundStreamIDs](self, "compoundStreamIDs"), "description"), "UTF8String"): "<nil>";
      asprintf(&__str, "%s(%p) %s", v10, self, v11);
      if (__str)
      {
        __lasts = 0;
        v12 = strtok_r(__str, "\n", &__lasts);
        v13 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v14 = VRTraceErrorLogLevelToCSTR();
            v15 = *v13;
            if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v33 = v14;
              v34 = 2080;
              v35 = "-[VCVideoStream setupCompoundStreamIDsWithStreamIDs:]";
              v36 = 1024;
              v37 = 1037;
              v38 = 2080;
              v39 = "compoundStreamIDs=";
              v40 = 2080;
              v41 = (VCVideoStream *)v12;
              _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v12 = strtok_r(0, "\n", &__lasts);
        }
        while (v12);
LABEL_28:
        free(__str);
      }
    }
  }
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        sendingStreamID = self->_sendingStreamID;
        *(_DWORD *)buf = 136315906;
        v33 = v21;
        v34 = 2080;
        v35 = "-[VCVideoStream setupCompoundStreamIDsWithStreamIDs:]";
        v36 = 1024;
        v37 = 1038;
        v38 = 2112;
        v39 = (const char *)sendingStreamID;
        v24 = "VCVideoStream [%s] %s:%d sendingStreamID=%@";
        v25 = v22;
        v26 = 38;
LABEL_39:
        _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v29 = self->_sendingStreamID;
        *(_DWORD *)buf = 136316418;
        v33 = v27;
        v34 = 2080;
        v35 = "-[VCVideoStream setupCompoundStreamIDsWithStreamIDs:]";
        v36 = 1024;
        v37 = 1038;
        v38 = 2112;
        v39 = (const char *)v20;
        v40 = 2048;
        v41 = self;
        v42 = 2112;
        v43 = v29;
        v24 = "VCVideoStream [%s] %s:%d %@(%p) sendingStreamID=%@";
        v25 = v28;
        v26 = 58;
        goto LABEL_39;
      }
    }
  }
}

- (unsigned)dumpIDFromCallID
{
  uint64_t v3;
  NSString *callID;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!self->super._callID)
    return 0;
  v6[0] = 0;
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^\\d{1,10}$"), 0, v6), "numberOfMatchesInString:options:range:", self->super._callID, 0, 0, -[NSString length](self->super._callID, "length"));
  callID = self->super._callID;
  if (v3 == 1)
    return -[NSString integerValue](callID, "integerValue");
  else
    return -[NSString hash](callID, "hash");
}

- (void)enableRedundancyController:(id)a3
{
  AVCStatisticsCollector *statisticsCollector;
  VCRedundancyControllerVideo *v6;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  VCRedundancyControllerVideo *v10;
  uint64_t v11;
  NSObject *v12;
  VCRedundancyControllerVideo *redundancyController;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  VCRedundancyControllerVideo *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_redundancyController)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        redundancyController = self->_redundancyController;
        v14 = 136315906;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCVideoStream enableRedundancyController:]";
        v18 = 1024;
        v19 = 1052;
        v20 = 2048;
        v21 = redundancyController;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d _redundancyController[%p] is not NULL", (uint8_t *)&v14, 0x26u);
      }
    }
  }
  else if (objc_msgSend(a3, "type") == 5 && objc_msgSend(a3, "fecEnabled"))
  {
    statisticsCollector = self->_statisticsCollector;
    objc_msgSend(a3, "setRedundancyControllerMode:", 5);
    v6 = -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]([VCRedundancyControllerVideo alloc], "initWithDelegate:mode:parameters:", self, objc_msgSend(a3, "redundancyControllerMode"), statisticsCollector, 0xAAAA000000000064);
    self->_redundancyController = v6;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v6)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = self->_redundancyController;
          v14 = 136315906;
          v15 = v8;
          v16 = 2080;
          v17 = "-[VCVideoStream enableRedundancyController:]";
          v18 = 1024;
          v19 = 1065;
          v20 = 2112;
          v21 = v10;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Set up and using internal redundancy controller=%@", (uint8_t *)&v14, 0x26u);
        }
      }
      if (-[VCRedundancyControllerVideo statisticsCollector](self->_redundancyController, "statisticsCollector"))
        objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "setStatisticsCollector:", -[VCRedundancyControllerVideo statisticsCollector](self->_redundancyController, "statisticsCollector"));
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStream enableRedundancyController:].cold.1();
    }
  }
}

- (void)startRateAdaptationWithStreamConfig:(id)a3
{
  _BOOL4 v5;
  __int128 v6;
  VCConnection *connection;
  unint64_t type;
  __objc2_class **v9;
  const __CFString *v10;
  opaqueRTCReporting *v11;
  uint64_t v12;
  NSObject *v13;
  int64_t v14;
  int v15;
  int v16;
  int v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  int64_t v23;
  int v24;
  int v25;
  int v26;
  NSString *callID;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  VCVideoStream *v32;
  VCConnection *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BYTE v41[10];
  VCVideoStream *v42;
  _BYTE v43[6];
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setTxInitialBitrate:", self->_initialTargetBitrate);
  v5 = objc_msgSend(a3, "direction") == 2 || objc_msgSend(a3, "direction") == 3;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28 = v6;
  v29 = v6;
  v30 = v6;
  v31 = v6;
  callID = self->super._callID;
  LODWORD(v28) = 0;
  *((_QWORD *)&v28 + 1) = 0;
  LODWORD(v29) = 0;
  *((_QWORD *)&v29 + 1) = 0;
  v30 = 0uLL;
  *(_QWORD *)&v31 = -[VCMediaStreamTransport rtpHandle](-[VCMediaStream defaultTransport](self, "defaultTransport"), "rtpHandle");
  DWORD2(v31) = 0;
  BYTE12(v31) = 0;
  connection = self->super._connection;
  v32 = 0;
  v33 = connection;
  type = self->_type;
  if (type <= 6)
  {
    if (((1 << type) & 0x76) != 0)
    {
      LODWORD(v29) = 3;
      BYTE12(v31) = 1;
      v32 = self;
      *((_QWORD *)&v29 + 1) = 2;
      LODWORD(v30) = objc_msgSend(a3, "rxMaxBitrate");
      DWORD1(v30) = objc_msgSend(a3, "rxMinBitrate");
      DWORD2(v30) = objc_msgSend(a3, "txInitialBitrate");
      HIDWORD(v30) = objc_msgSend(a3, "accessNetworkType");
      *((_QWORD *)&v28 + 1) = -[VCObject reportingAgent](self, "reportingAgent");
      v9 = off_1E9E4D6A0;
LABEL_7:

      self->super._rateAdaptation = (VCMediaStreamRateAdaptation *)objc_msgSend(objc_alloc(*v9), "initWithMediaStreamRateAdaptationParam:", &callID);
      goto LABEL_8;
    }
    if (!type)
    {
      LODWORD(v29) = 2;
      if (v5)
        v11 = -[VCObject reportingAgent](self, "reportingAgent");
      else
        v11 = 0;
      *((_QWORD *)&v28 + 1) = v11;
      DWORD2(v31) = self->_reportingModuleID;
      LODWORD(v28) = -[VCVideoStream dumpIDFromCallID](self, "dumpIDFromCallID");
      v9 = off_1E9E4D698;
      goto LABEL_7;
    }
  }
LABEL_8:
  if (+[VCVideoStream shouldEnableRateControlForStreamType:](VCVideoStream, "shouldEnableRateControlForStreamType:", self->_type))
  {
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_23;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v14 = self->_type;
      v15 = objc_msgSend(a3, "txMaxBitrate");
      v16 = objc_msgSend(a3, "txMinBitrate");
      v17 = objc_msgSend(a3, "txInitialBitrate");
      *(_DWORD *)buf = 136316674;
      v35 = v12;
      v36 = 2080;
      v37 = "-[VCVideoStream startRateAdaptationWithStreamConfig:]";
      v38 = 1024;
      v39 = 1117;
      v40 = 1024;
      *(_DWORD *)v41 = v14;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = v15;
      LOWORD(v42) = 1024;
      *(_DWORD *)((char *)&v42 + 2) = v16;
      HIWORD(v42) = 1024;
      *(_DWORD *)v43 = v17;
      v18 = "VCVideoStream [%s] %s:%d Start VCRC in VideoStream with type=%d and maxBitrate=%d, minBitrate=%d, initialBitrate=%d";
      v19 = v13;
      v20 = 52;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_23;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v23 = self->_type;
      v24 = objc_msgSend(a3, "txMaxBitrate");
      v25 = objc_msgSend(a3, "txMinBitrate");
      v26 = objc_msgSend(a3, "txInitialBitrate");
      *(_DWORD *)buf = 136317186;
      v35 = v21;
      v36 = 2080;
      v37 = "-[VCVideoStream startRateAdaptationWithStreamConfig:]";
      v38 = 1024;
      v39 = 1117;
      v40 = 2112;
      *(_QWORD *)v41 = v10;
      *(_WORD *)&v41[8] = 2048;
      v42 = self;
      *(_WORD *)v43 = 1024;
      *(_DWORD *)&v43[2] = v23;
      v44 = 1024;
      v45 = v24;
      v46 = 1024;
      v47 = v25;
      v48 = 1024;
      v49 = v26;
      v18 = "VCVideoStream [%s] %s:%d %@(%p) Start VCRC in VideoStream with type=%d and maxBitrate=%d, minBitrate=%d, initialBitrate=%d";
      v19 = v22;
      v20 = 72;
    }
    _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
LABEL_23:
    -[VCMediaStreamRateAdaptation start](self->super._rateAdaptation, "start");

    self->_statisticsCollector = -[AVCRateController statisticsCollector](-[VCMediaStreamRateAdaptation vcrcRateController](self->super._rateAdaptation, "vcrcRateController"), "statisticsCollector");
  }
  -[VCVideoStream enableRedundancyController:](self, "enableRedundancyController:", a3);
}

- (void)stopRateAdaptation
{
  if (+[VCVideoStream shouldEnableRateControlForStreamType:](VCVideoStream, "shouldEnableRateControlForStreamType:", self->_type))
  {
    -[VCMediaStreamRateAdaptation stop](self->super._rateAdaptation, "stop");

    self->_statisticsCollector = 0;
  }

  self->super._rateAdaptation = 0;
}

- (tagVCVideoReceiverDelegateRealtimeInstanceVTable)videoReceiverDelegateFunctions
{
  void (*v2)(uint64_t, opaqueCMSampleBuffer *, int);
  BOOL (*v3)(uint64_t, __CVBuffer *, __int128 *, void *, uint64_t, int);
  tagVCVideoReceiverDelegateRealtimeInstanceVTable result;

  v2 = VCVideoStream_DidReceiveSampleBuffer;
  v3 = _VCVideoStream_DidReceiveRemoteFrame;
  result.didReceiveRemoteFrame = v3;
  result.didReceiveSampleBuffer = v2;
  return result;
}

- (void)handleNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  -[VCNWConnectionCongestionDetector processNWConnectionNotification:](-[AVCRateController nwConnectionCongestionDetector](-[VCMediaStreamRateAdaptation vcrcRateController](self->super._rateAdaptation, "vcrcRateController"), "nwConnectionCongestionDetector"), "processNWConnectionNotification:", a3);
}

- (void)handleNWConnectionPacketEvent:(packet_id *)a3 eventType:(int)a4
{
  -[VCNWConnectionCongestionDetector processNWConnectionPacketEvent:eventType:](-[AVCRateController nwConnectionCongestionDetector](-[VCMediaStreamRateAdaptation vcrcRateController](self->super._rateAdaptation, "vcrcRateController"), "nwConnectionCongestionDetector"), "processNWConnectionPacketEvent:eventType:", a3, *(_QWORD *)&a4);
}

- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3
{
  -[VCVideoTransmitterBase setMediaSuggestion:](self->_videoTransmitter, "setMediaSuggestion:", a3);
}

+ (BOOL)shouldUseRandomRTPTimestampWithType:(int64_t)a3
{
  if (!a3)
    return 1;
  if (a3 == 3)
    return VCDefaults_GetBoolValueForKey(CFSTR("simulateWebRTCOnlyClient"), 0);
  return 0;
}

- (void)setupColorInfo:(id)a3
{
  const void *v5;
  const void *v6;
  const void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  CFMutableDictionaryRef Mutable;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  VCVideoStream *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "pixelFormat") == 2019963956)
  {
    if (+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("forceHDR10ColorInfo"), 0)|| objc_msgSend(a3, "type") == 2 && objc_msgSend(a3, "hdrMode") == 1)
    {
      v5 = (const void *)*MEMORY[0x1E0CA8D80];
      v6 = (const void *)*MEMORY[0x1E0CA8EC8];
      v7 = (const void *)*MEMORY[0x1E0CA8F00];
      if ((VCVideoStream *)objc_opt_class() != self)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_50;
        v18 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_50;
        v36 = 136316162;
        v37 = v18;
        v38 = 2080;
        v39 = "-[VCVideoStream setupColorInfo:]";
        v40 = 1024;
        v41 = 1187;
        v42 = 2112;
        v43 = v8;
        v44 = 2048;
        v45 = self;
        v13 = "VCVideoStream [%s] %s:%d %@(%p) ITU_R_2020 color settings used to configure capture and encoder (except when in Airplay)";
        goto LABEL_48;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v36 = 136315650;
          v37 = v17;
          v38 = 2080;
          v39 = "-[VCVideoStream setupColorInfo:]";
          v40 = 1024;
          v41 = 1187;
          v13 = "VCVideoStream [%s] %s:%d ITU_R_2020 color settings used to configure capture and encoder (except when in Airplay)";
          goto LABEL_43;
        }
      }
      goto LABEL_50;
    }
    v5 = (const void *)*MEMORY[0x1E0CA8D98];
    v6 = (const void *)*MEMORY[0x1E0CA8EC8];
    v7 = (const void *)*MEMORY[0x1E0CA8F18];
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v36 = 136315650;
          v37 = v20;
          v38 = 2080;
          v39 = "-[VCVideoStream setupColorInfo:]";
          v40 = 1024;
          v41 = 1192;
          v13 = "VCVideoStream [%s] %s:%d P3D65-PQ color settings used to configure capture and encoder";
          goto LABEL_43;
        }
      }
      goto LABEL_50;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_50;
    v23 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_50;
    v36 = 136316162;
    v37 = v23;
    v38 = 2080;
    v39 = "-[VCVideoStream setupColorInfo:]";
    v40 = 1024;
    v41 = 1192;
    v42 = 2112;
    v43 = v10;
    v44 = 2048;
    v45 = self;
    v13 = "VCVideoStream [%s] %s:%d %@(%p) P3D65-PQ color settings used to configure capture and encoder";
    goto LABEL_48;
  }
  if (objc_msgSend(a3, "type") == 1
    || objc_msgSend(a3, "type") == 6
    || objc_msgSend(a3, "type") == 5
    && !+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass"))
  {
    v5 = (const void *)*MEMORY[0x1E0CA8D98];
    v6 = (const void *)*MEMORY[0x1E0CA8EE0];
    v7 = (const void *)*MEMORY[0x1E0CA8F18];
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v36 = 136315650;
          v37 = v11;
          v38 = 2080;
          v39 = "-[VCVideoStream setupColorInfo:]";
          v40 = 1024;
          v41 = 1199;
          v13 = "VCVideoStream [%s] %s:%d P3D65-sRGB color settings used to configure capture and encoder";
LABEL_43:
          v21 = v12;
          v22 = 28;
LABEL_49:
          _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v36, v22);
        }
      }
LABEL_50:
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
      self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange = Mutable;
      if (Mutable)
      {
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CA8D68], v5);
        CFDictionaryAddValue((CFMutableDictionaryRef)self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange, (const void *)*MEMORY[0x1E0CA8E98], v6);
        CFDictionaryAddValue((CFMutableDictionaryRef)self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange, (const void *)*MEMORY[0x1E0CA8EE8], v7);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoStream setupColorInfo:].cold.1();
      }
      return;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_50;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_50;
    v36 = 136316162;
    v37 = v15;
    v38 = 2080;
    v39 = "-[VCVideoStream setupColorInfo:]";
    v40 = 1024;
    v41 = 1199;
    v42 = 2112;
    v43 = v9;
    v44 = 2048;
    v45 = self;
    v13 = "VCVideoStream [%s] %s:%d %@(%p) P3D65-sRGB color settings used to configure capture and encoder";
LABEL_48:
    v21 = v16;
    v22 = 48;
    goto LABEL_49;
  }
  if (objc_msgSend(a3, "type") == 4 && objc_msgSend(a3, "hdrMode") == 1)
  {
    v5 = (const void *)*MEMORY[0x1E0CA8D80];
    v6 = (const void *)*MEMORY[0x1E0CA8EA8];
    v7 = (const void *)*MEMORY[0x1E0CA8F00];
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v34 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v36 = 136315650;
          v37 = v34;
          v38 = 2080;
          v39 = "-[VCVideoStream setupColorInfo:]";
          v40 = 1024;
          v41 = 1208;
          v13 = "VCVideoStream [%s] %s:%d ITU_R_2100_HLG color settings used to configure encoder";
          goto LABEL_43;
        }
      }
      goto LABEL_50;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_50;
    v35 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_50;
    v36 = 136316162;
    v37 = v35;
    v38 = 2080;
    v39 = "-[VCVideoStream setupColorInfo:]";
    v40 = 1024;
    v41 = 1208;
    v42 = 2112;
    v43 = v14;
    v44 = 2048;
    v45 = self;
    v13 = "VCVideoStream [%s] %s:%d %@(%p) ITU_R_2100_HLG color settings used to configure encoder";
    goto LABEL_48;
  }
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return;
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    v27 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        return;
      v36 = 136315650;
      v37 = v25;
      v38 = 2080;
      v39 = "-[VCVideoStream setupColorInfo:]";
      v40 = 1024;
      v41 = 1210;
      v28 = "VCVideoStream [%s] %s:%d No color settings applied";
      v29 = v26;
      v30 = 28;
      goto LABEL_62;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[VCVideoStream setupColorInfo:].cold.2();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      v33 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          return;
        v36 = 136316162;
        v37 = v31;
        v38 = 2080;
        v39 = "-[VCVideoStream setupColorInfo:]";
        v40 = 1024;
        v41 = 1210;
        v42 = 2112;
        v43 = v19;
        v44 = 2048;
        v45 = self;
        v28 = "VCVideoStream [%s] %s:%d %@(%p) No color settings applied";
        v29 = v32;
        v30 = 48;
LABEL_62:
        _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v36, v30);
        return;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v36 = 136316162;
        v37 = v31;
        v38 = 2080;
        v39 = "-[VCVideoStream setupColorInfo:]";
        v40 = 1024;
        v41 = 1210;
        v42 = 2112;
        v43 = v19;
        v44 = 2048;
        v45 = self;
        _os_log_debug_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEBUG, "VCVideoStream [%s] %s:%d %@(%p) No color settings applied", (uint8_t *)&v36, 0x30u);
      }
    }
  }
}

- (void)setupVideoTransmitterConfigColorInfo:(id)a3
{
  const __CFDictionary *remoteScreenAttributesDidChange;
  const void *Value;
  const void *v7;
  const void *v8;
  BOOL v9;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  remoteScreenAttributesDidChange = (const __CFDictionary *)self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange;
  if (remoteScreenAttributesDidChange)
  {
    Value = CFDictionaryGetValue(remoteScreenAttributesDidChange, (const void *)*MEMORY[0x1E0CA8D68]);
    v7 = CFDictionaryGetValue((CFDictionaryRef)self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange, (const void *)*MEMORY[0x1E0CA8E98]);
    v8 = CFDictionaryGetValue((CFDictionaryRef)self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange, (const void *)*MEMORY[0x1E0CA8EE8]);
    if (Value)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (!v9 && v8 != 0)
    {
      v11 = *MEMORY[0x1E0CED238];
      v12[0] = *MEMORY[0x1E0CECF48];
      v12[1] = v11;
      v13[0] = Value;
      v13[1] = v7;
      v12[2] = *MEMORY[0x1E0CED290];
      v13[2] = v8;
      objc_msgSend(a3, "setColorInfo:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3));
    }
  }
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
  VCTerminateProcess((uint64_t)a3, a4, (uint64_t)a5);
}

- (void)updateShouldCacheRemoteVideoFrame
{
  unint64_t type;

  type = self->_type;
  if (type <= 6)
    self->_shouldCacheRemoteVideoFrame = 1uLL >> (8 * type);
}

- (BOOL)setRTPPayloads:(int *)a3 numPayloads:(int)a4 withError:(id *)a5
{
  size_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  _BOOL4 v12;
  uint64_t v14;
  _DWORD *v15;
  int v16;

  v7 = a4;
  v8 = malloc_type_calloc(a4, 4uLL, 0x100004052888210uLL);
  v9 = malloc_type_calloc(v7, 4uLL, 0x100004052888210uLL);
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (v12 && a4 >= 1)
  {
    v14 = a4;
    v15 = v9;
    do
    {
      v16 = *a3++;
      *v15++ = v16;
      --v14;
    }
    while (v14);
  }
  if (v8)
    free(v8);
  if (v10)
    free(v10);
  return v12;
}

- (double)lastReceivedRTPPacketTime
{
  double result;

  -[VCVideoReceiverBase lastReceivedVideoRTPPacketTime](self->_videoReceiver, "lastReceivedVideoRTPPacketTime");
  return result;
}

- (double)lastReceivedRTCPPacketTime
{
  double result;

  -[VCVideoReceiverBase lastReceivedVideoRTCPPacketTime](self->_videoReceiver, "lastReceivedVideoRTCPPacketTime");
  return result;
}

- (VCVideoStream)init
{
  VCVideoStream *v2;
  VCVideoStream *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCVideoStream;
  v2 = -[VCMediaStream init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_constantTransportOverhead = 0x7FF8000000000000;
    -[VCVideoStream setupVideoStream](v2, "setupVideoStream");
    v3->_externalOutputVideoLatency = micro();
  }
  return v3;
}

- (VCVideoStream)initWithTransportSessionID:(unsigned int)a3 idsParticipantID:(unint64_t)a4 ssrc:(unsigned int)a5 streamToken:(int64_t)a6
{
  VCVideoStream *v7;
  VCVideoStream *v8;
  uint64_t v9;
  NSObject *v10;
  VCImageQueue *remoteQueue;
  int64_t streamToken;
  unsigned int transportSessionID;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  VCVideoStream *v23;
  __int16 v24;
  VCImageQueue *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)VCVideoStream;
  v7 = -[VCMediaStream initWithTransportSessionID:localSSRC:streamToken:](&v15, sel_initWithTransportSessionID_localSSRC_streamToken_, *(_QWORD *)&a3, *(_QWORD *)&a5, a6);
  v8 = v7;
  if (v7)
  {
    *(_QWORD *)&v7->_constantTransportOverhead = 0x7FF8000000000000;
    v7->_captureConverter = -[VCVideoCaptureConverter initWithConvertedFrameHandler:context:]([VCVideoCaptureConverter alloc], "initWithConvertedFrameHandler:context:", VCVideoStream_ProcessConvertedFrame, v7);
    -[VCVideoStream setupVideoStream](v8, "setupVideoStream");
    v8->_externalOutputVideoLatency = micro();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        remoteQueue = v8->_remoteQueue;
        streamToken = v8->super._streamToken;
        transportSessionID = v8->super._transportSessionID;
        *(_DWORD *)buf = 136316930;
        v17 = v9;
        v18 = 2080;
        v19 = "-[VCVideoStream initWithTransportSessionID:idsParticipantID:ssrc:streamToken:]";
        v20 = 1024;
        v21 = 1325;
        v22 = 2048;
        v23 = v8;
        v24 = 2048;
        v25 = remoteQueue;
        v26 = 2048;
        v27 = a4;
        v28 = 1024;
        v29 = streamToken;
        v30 = 1024;
        v31 = transportSessionID;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] init queue=%p for idsParticipantID=%llu streamToken=%u transportSessionID=%d", buf, 0x46u);
      }
    }
  }
  return v8;
}

- (void)handleThermalPressureNotification:(id)a3
{
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCVideoStream *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("VCVideoCaptureServer_NotificationKeyThermalPressureLevel")), "intValue");
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v16 = v6;
        v17 = 2080;
        v18 = "-[VCVideoStream handleThermalPressureNotification:]";
        v19 = 1024;
        v20 = 1334;
        v21 = 1024;
        LODWORD(v22) = v4;
        v8 = "VCVideoStream [%s] %s:%d Received thermal notification at level=%d";
        v9 = v7;
        v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v16 = v11;
        v17 = 2080;
        v18 = "-[VCVideoStream handleThermalPressureNotification:]";
        v19 = 1024;
        v20 = 1334;
        v21 = 2112;
        v22 = v5;
        v23 = 2048;
        v24 = self;
        v25 = 1024;
        v26 = v4;
        v8 = "VCVideoStream [%s] %s:%d %@(%p) Received thermal notification at level=%d";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4, CFSTR("Thermal"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
}

- (void)setupThermalNotifications
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  _BYTE v11[24];
  __int128 v12;
  VCVideoStream *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136315650;
        *(_QWORD *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCVideoStream setupThermalNotifications]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 1346;
        v6 = "VCVideoStream [%s] %s:%d Setting up thermal notifications";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136316162;
        *(_QWORD *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCVideoStream setupThermalNotifications]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 1346;
        WORD2(v12) = 2112;
        *(_QWORD *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        v13 = self;
        v6 = "VCVideoStream [%s] %s:%d %@(%p) Setting up thermal notifications";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12, v13), "addObserver:selector:name:object:", self, sel_handleThermalPressureNotification_, CFSTR("VCVideoCaptureServer_NotificationNameThermalPressureLevel"), 0);
}

- (void)setupVideoStream
{
  NSObject *CustomRootQueue;
  uint64_t v4;
  NSObject *v5;
  int64_t streamToken;
  unsigned int transportSessionID;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  VCVideoStream *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unsigned int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  self->_isVideoCaptureRegistered = 0;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  self->_lastDecodedFrameQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoStream.lastDecodedFrameQueue", 0, CustomRootQueue);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->super._streamToken;
      transportSessionID = self->super._transportSessionID;
      v8 = 136316418;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCVideoStream setupVideoStream]";
      v12 = 1024;
      v13 = 1360;
      v14 = 2048;
      v15 = self;
      v16 = 1024;
      v17 = streamToken;
      v18 = 1024;
      v19 = transportSessionID;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] remoteVideo create queue for streamToken=%u transportSessionID=%d", (uint8_t *)&v8, 0x32u);
    }
  }
  self->_remoteQueue = (VCImageQueue *)objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "newQueueForStreamToken:videoMode:imageQueueProtected:", self->super._streamToken, 0, 1);
  self->_lastMediaPriority = 0;
  -[VCObject setReportingAgent:](self, "setReportingAgent:", 0);
  self->super._notificationHandler = _VCVideoStreamNWConnectionNotificationCallback;
  self->super._packetEventHandler = _VCVideoStreamNWConnectionPacketEventCallback;
  -[VCVideoStream configureMediaStallSettingsWithConfig:](self, "configureMediaStallSettingsWithConfig:", 0);
  FigCFWeakReferenceStore();
  VTP_SetCallback((uint64_t)_VCVideoStreamVTPNotificationCallback, (uint64_t)self->_weakStream);
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  int64_t streamToken;
  id v6;
  void *remoteScreenAttributesDidChange;
  int operatingMode;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  VCVideoStream *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->super._streamToken;
      *(_DWORD *)buf = 136316162;
      v11 = v3;
      v12 = 2080;
      v13 = "-[VCVideoStream dealloc]";
      v14 = 1024;
      v15 = 1374;
      v16 = 2048;
      v17 = self;
      v18 = 1024;
      v19 = streamToken;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] remoteVideo release queue for streamToken=%u", buf, 0x2Cu);
    }
  }
  objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "releaseQueueForStreamToken:", self->super._streamToken);
  if (self->_captureSourceID && -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"))
  {
    v6 = -[VCVideoStream newScreenCaptureConfigForVideoConfig:](self, "newScreenCaptureConfigForVideoConfig:", -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"));
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterCaptureConfig:forSource:", v6, -[VCMediaStreamConfig captureSource](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "captureSource"));

  }
  -[VCVideoStream deregisterCurrentStreamInputCaptureSource](self, "deregisterCurrentStreamInputCaptureSource");

  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 5, 0, 0);
  dispatch_release((dispatch_object_t)self->_lastDecodedFrameQueue);
  CVPixelBufferRelease(self->_cachedRemoteVideoFrame);

  remoteScreenAttributesDidChange = self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange;
  if (remoteScreenAttributesDidChange)
    CFRelease(remoteScreenAttributesDidChange);
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingCacheModuleSpecificInfo();
  operatingMode = self->super._operatingMode;
  if (operatingMode != 1 && operatingMode != 6)
    -[VCMediaStream deregisterAggregationHandlers](self, "deregisterAggregationHandlers");
  VTP_SetCallback(0, 0);
  FigCFWeakReferenceStore();
  v9.receiver = self;
  v9.super_class = (Class)VCVideoStream;
  -[VCMediaStream dealloc](&v9, sel_dealloc);
}

+ (id)supportedVideoPayloads
{
  return &unk_1E9EFAE20;
}

+ (id)capabilities
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v3 = (void *)MGCopyAnswer();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("w")), "intValue");
        v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("h")), "intValue");
        if (v9 != 320 || (v11 = &unk_1E9EF6B60, v10 != 240))
        {
          if (v9 != 640 || (v11 = &unk_1E9EF6B90, v10 != 480))
          {
            if (v9 != 1280 || (v11 = &unk_1E9EF6BA8, v10 != 720))
            {
              if (v9 != 1920)
                continue;
              v11 = &unk_1E9EF6BC0;
              if (v10 != 1080)
                continue;
            }
          }
        }
        objc_msgSend(v2, "addObject:", v11);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(v14, "addObject:", &unk_1E9EF6B60);
  objc_msgSend(v14, "addObject:", &unk_1E9EF6B78);
  objc_msgSend(v14, "addObject:", &unk_1E9EF6BD8);
  objc_msgSend(v14, "addObject:", &unk_1E9EF6B90);
  objc_msgSend(v14, "addObject:", &unk_1E9EF6BF0);
  objc_msgSend(v14, "addObject:", &unk_1E9EF6BA8);
  objc_msgSend(v14, "addObject:", &unk_1E9EF6C08);
  objc_msgSend(v14, "addObject:", &unk_1E9EF6BC0);
  v15[0] = CFSTR("avcKeySupportedVideoEncodingCodecs");
  v16[0] = +[VCVideoStream supportedVideoPayloads](VCVideoStream, "supportedVideoPayloads");
  v15[1] = CFSTR("avcKeySupportedVideoDecodingCodecs");
  v16[1] = +[VCVideoStream supportedVideoPayloads](VCVideoStream, "supportedVideoPayloads");
  v15[2] = CFSTR("avcKeySupportedVideoEncodingResolutions");
  v16[2] = objc_msgSend(v2, "array");
  v15[3] = CFSTR("avcKeySupportedVideoDecodingResolutions");
  v16[3] = objc_msgSend(v14, "array");
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);

  return v12;
}

- (void)updateVideoConfig:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *delegateNotificationQueue;
  _QWORD *v12;
  VCMediaStreamConfig *v13;
  int v14;
  char v15;
  VCVideoTransmitterBase *videoTransmitter;
  uint64_t v17;
  char IsOSFaultDisabled;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  _QWORD block[7];
  char v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[7];
  char v29;
  id v30;
  uint8_t buf[24];
  int v32;
  __int16 v33;
  VCVideoStream *v34;
  __int16 v35;
  VCVideoStream *v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  VCMediaStream_Lock((uint64_t)self);
  v30 = 0;
  if (-[VCMediaStream state](self, "state") == 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v7 = "<nil>";
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCVideoStream updateVideoConfig:]";
        *(_WORD *)&buf[22] = 1024;
        v32 = 1501;
        v33 = 2048;
        v34 = self;
        v35 = 2080;
        v36 = (VCVideoStream *)v7;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] videoConfigDict=%s", buf, 0x30u);
      }
    }
    v13 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
    v14 = -[VCMediaStreamConfig updateWithClientDictionary:](v13, "updateWithClientDictionary:", a3);
    v15 = v14;
    if (v14)
    {
      -[VCMediaStream stopRTCPSendHeartbeat](self, "stopRTCPSendHeartbeat");
      if (-[VCMediaStream isSendingMedia](self, "isSendingMedia"))
      {
        memset(buf, 170, sizeof(buf));
        videoTransmitter = self->_videoTransmitter;
        if (videoTransmitter)
        {
          -[VCVideoTransmitterBase lastFrameTime](videoTransmitter, "lastFrameTime");
          videoTransmitter = self->_videoTransmitter;
        }
        else
        {
          memset(buf, 0, sizeof(buf));
        }
        v21 = -[VCVideoTransmitterBase lastRTPTimestamp](videoTransmitter, "lastRTPTimestamp");
        -[VCVideoStream deregisterForVideoCapture](self, "deregisterForVideoCapture");
        -[VCVideoStream destroyVideoTransmitter](self, "destroyVideoTransmitter");
        -[VCVideoStream registerForVideoCapture](self, "registerForVideoCapture");
        -[VCVideoStream initVideoTransmitter](self, "initVideoTransmitter");
        v26 = *(_OWORD *)buf;
        v27 = *(_QWORD *)&buf[16];
        -[VCVideoTransmitterBase setLastFrameTime:](self->_videoTransmitter, "setLastFrameTime:", &v26);
        -[VCVideoTransmitterBase setLastRTPTimestamp:](self->_videoTransmitter, "setLastRTPTimestamp:", v21);
        -[VCVideoTransmitterBase startVideo](self->_videoTransmitter, "startVideo");
      }
      -[VCImageQueue setFrameRate:](self->_remoteQueue, "setFrameRate:", -[VCMediaStreamConfig framerate](v13, "framerate"));
      -[VCVideoStream updateVideoReceiver:](self, "updateVideoReceiver:", v13);
      -[VCMediaStream startRTCPSendHeartbeat](self, "startRTCPSendHeartbeat");
      _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 205, 0, 0);
    }
    else
    {
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v30, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStream.m", 1539), CFSTR("Invalid Parameter"), CFSTR("Called with an invalid parameter"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        v19 = *MEMORY[0x1E0CF2758];
        if ((IsOSFaultDisabled & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            if (v30)
              v20 = (const char *)objc_msgSend((id)objc_msgSend(v30, "description"), "UTF8String");
            else
              v20 = "<nil>";
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStream updateVideoConfig:]";
            *(_WORD *)&buf[22] = 1024;
            v32 = 1542;
            v33 = 2048;
            v34 = self;
            v35 = 2080;
            v36 = (VCVideoStream *)v20;
            _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d VCVideoStream[%p] error[%s]", buf, 0x30u);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          if (v30)
            v23 = (const char *)objc_msgSend((id)objc_msgSend(v30, "description"), "UTF8String");
          else
            v23 = "<nil>";
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCVideoStream updateVideoConfig:]";
          *(_WORD *)&buf[22] = 1024;
          v32 = 1542;
          v33 = 2048;
          v34 = self;
          v35 = 2080;
          v36 = (VCVideoStream *)v23;
          _os_log_fault_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_FAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] error[%s]", buf, 0x30u);
        }
      }
      a3 = 0;
    }
    delegateNotificationQueue = self->super._delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__VCVideoStream_updateVideoConfig___block_invoke_117;
    block[3] = &unk_1E9E53608;
    v25 = v15;
    block[4] = self;
    block[5] = v30;
    block[6] = a3;
    v12 = block;
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v30, 32016, 5, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStream.m", 1488), CFSTR("Bad API usage"), CFSTR("updateVideoConfig Called while video stream is not running"));
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoStream updateVideoConfig:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          if (v30)
            v22 = (const char *)objc_msgSend((id)objc_msgSend(v30, "description"), "UTF8String");
          else
            v22 = "<nil>";
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = v9;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCVideoStream updateVideoConfig:]";
          *(_WORD *)&buf[22] = 1024;
          v32 = 1491;
          v33 = 2112;
          v34 = (VCVideoStream *)v8;
          v35 = 2048;
          v36 = self;
          v37 = 2080;
          v38 = v22;
          _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) error[%s]", buf, 0x3Au);
        }
      }
    }
    delegateNotificationQueue = self->super._delegateNotificationQueue;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __35__VCVideoStream_updateVideoConfig___block_invoke;
    v28[3] = &unk_1E9E53608;
    v29 = 0;
    v28[4] = self;
    v28[5] = v30;
    v28[6] = 0;
    v12 = v28;
  }
  dispatch_async(delegateNotificationQueue, v12);
  VCMediaStream_Unlock((uint64_t)self);
}

uint64_t __35__VCVideoStream_updateVideoConfig___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStream:didUpdateVideoConfiguration:error:dictionary:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

uint64_t __35__VCVideoStream_updateVideoConfig___block_invoke_117(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStream:didUpdateVideoConfiguration:error:dictionary:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)requestLastDecodedFrame
{
  NSObject *lastDecodedFrameQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  lastDecodedFrameQueue = self->_lastDecodedFrameQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__VCVideoStream_requestLastDecodedFrame__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(lastDecodedFrameQueue, v3);
}

uint64_t __40__VCVideoStream_requestLastDecodedFrame__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendLastRemoteVideoFrame:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 832));
}

- (void)resetRemoteMediaStalled
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  _BYTE v11[24];
  __int128 v12;
  VCVideoStream *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)v11 = 136315650;
    *(_QWORD *)&v11[4] = v4;
    *(_WORD *)&v11[12] = 2080;
    *(_QWORD *)&v11[14] = "-[VCVideoStream resetRemoteMediaStalled]";
    *(_WORD *)&v11[22] = 1024;
    LODWORD(v12) = 1596;
    v6 = "VCVideoStream [%s] %s:%d ";
    v7 = v5;
    v8 = 28;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v3 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v11 = 136316162;
      *(_QWORD *)&v11[4] = v9;
      *(_WORD *)&v11[12] = 2080;
      *(_QWORD *)&v11[14] = "-[VCVideoStream resetRemoteMediaStalled]";
      *(_WORD *)&v11[22] = 1024;
      LODWORD(v12) = 1596;
      WORD2(v12) = 2112;
      *(_QWORD *)((char *)&v12 + 6) = v3;
      HIWORD(v12) = 2048;
      v13 = self;
      v6 = "VCVideoStream [%s] %s:%d %@(%p) ";
      v7 = v10;
      v8 = 48;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
    }
  }
LABEL_12:
  self->_isRemoteMediaStalled = 0;
  self->_lastMediaStallReportTime = 0.0;
  -[VCMediaStream delegate](self, "delegate", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12, v13);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VCMediaStreamDelegate vcMediaStream:remoteMediaStalled:duration:](-[VCMediaStream delegate](self, "delegate"), "vcMediaStream:remoteMediaStalled:duration:", self, 0, 0.0);
}

- (void)generateKeyFrameWithFIRType:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  VCVideoStream *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSNumber *sendingStreamID;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  NSNumber *v24;
  _BYTE v25[24];
  __int128 v26;
  NSArray *v27;
  _BYTE v28[24];
  uint64_t v29;

  v3 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = -[VCMediaStreamConfig keyFrameInterval](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "keyFrameInterval");
  v6 = (VCVideoStream *)objc_opt_class();
  if (!v5)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      sendingStreamID = self->_sendingStreamID;
      *(_DWORD *)v25 = 136316162;
      *(_QWORD *)&v25[4] = v16;
      *(_WORD *)&v25[12] = 2080;
      *(_QWORD *)&v25[14] = "-[VCVideoStream generateKeyFrameWithFIRType:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 1610;
      WORD2(v26) = 2112;
      *(_QWORD *)((char *)&v26 + 6) = sendingStreamID;
      HIWORD(v26) = 2112;
      v27 = -[VCMediaStream compoundStreamIDs](self, "compoundStreamIDs");
      v19 = "VCVideoStream [%s] %s:%d Sending stream ID is %@, compound stream ID is %@";
      v20 = v17;
      v21 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v24 = self->_sendingStreamID;
      *(_DWORD *)v25 = 136316674;
      *(_QWORD *)&v25[4] = v22;
      *(_WORD *)&v25[12] = 2080;
      *(_QWORD *)&v25[14] = "-[VCVideoStream generateKeyFrameWithFIRType:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 1610;
      WORD2(v26) = 2112;
      *(_QWORD *)((char *)&v26 + 6) = v8;
      HIWORD(v26) = 2048;
      v27 = (NSArray *)self;
      *(_WORD *)v28 = 2112;
      *(_QWORD *)&v28[2] = v24;
      *(_WORD *)&v28[10] = 2112;
      *(_QWORD *)&v28[12] = -[VCMediaStream compoundStreamIDs](self, "compoundStreamIDs");
      v19 = "VCVideoStream [%s] %s:%d %@(%p) Sending stream ID is %@, compound stream ID is %@";
      v20 = v23;
      v21 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, v25, v21);
LABEL_24:
    -[VCVideoTransmitterBase generateKeyFrameWithFIRType:](self->_videoTransmitter, "generateKeyFrameWithFIRType:", v3, *(_OWORD *)v25, *(_QWORD *)&v25[16], v26, v27, *(_OWORD *)v28, *(_QWORD *)&v28[16]);
    return;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v25 = 136315650;
        *(_QWORD *)&v25[4] = v9;
        *(_WORD *)&v25[12] = 2080;
        *(_QWORD *)&v25[14] = "-[VCVideoStream generateKeyFrameWithFIRType:]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 1607;
        v11 = "VCVideoStream [%s] %s:%d Returning, No need to request a key frame generation with periodic IDR";
        v12 = v10;
        v13 = 28;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v25, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v25 = 136316162;
        *(_QWORD *)&v25[4] = v14;
        *(_WORD *)&v25[12] = 2080;
        *(_QWORD *)&v25[14] = "-[VCVideoStream generateKeyFrameWithFIRType:]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 1607;
        WORD2(v26) = 2112;
        *(_QWORD *)((char *)&v26 + 6) = v7;
        HIWORD(v26) = 2048;
        v27 = (NSArray *)self;
        v11 = "VCVideoStream [%s] %s:%d %@(%p) Returning, No need to request a key frame generation with periodic IDR";
        v12 = v15;
        v13 = 48;
        goto LABEL_15;
      }
    }
  }
}

- (double)fecRatio
{
  return self->_fecRatio;
}

- (void)setFecRatio:(double)a3
{
  self->_fecRatio = a3;
  VCVideoTransmitter_SetFECRatio((uint64_t)self->_videoTransmitter);
}

- (void)setFECRedundancyVector:(id *)a3
{
  -[VCVideoTransmitterBase setFECRedundancyVector:](self->_videoTransmitter, "setFECRedundancyVector:", a3);
}

- (void)sendLastRemoteVideoFrame:(__CVBuffer *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *delegateNotificationQueue;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCVideoStream *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return;
  v4 = +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:](VideoUtil, "convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:", a3, 0, 0, 0, 1);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v4, CFSTR("vcMediaStreamLastDecodedFrame"), 0);
    if (v5)
    {
      v6 = (void *)v5;
      delegateNotificationQueue = self->super._delegateNotificationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__VCVideoStream_sendLastRemoteVideoFrame___block_invoke;
      block[3] = &unk_1E9E52238;
      block[4] = v6;
      block[5] = self;
      dispatch_async(delegateNotificationQueue, block);

      return;
    }
    if ((VCVideoStream *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v13 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)buf = 136316162;
      v16 = v13;
      v17 = 2080;
      v18 = "-[VCVideoStream sendLastRemoteVideoFrame:]";
      v19 = 1024;
      v20 = 1657;
      v21 = 2112;
      v22 = v9;
      v23 = 2048;
      v24 = self;
      v12 = "VCVideoStream [%s] %s:%d %@(%p) Failed to create last frame XPC args";
LABEL_26:
      _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x30u);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStream sendLastRemoteVideoFrame:].cold.2();
    }
  }
  else if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStream sendLastRemoteVideoFrame:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v16 = v10;
        v17 = 2080;
        v18 = "-[VCVideoStream sendLastRemoteVideoFrame:]";
        v19 = 1024;
        v20 = 1653;
        v21 = 2112;
        v22 = v8;
        v23 = 2048;
        v24 = self;
        v12 = "VCVideoStream [%s] %s:%d %@(%p) Failed to create frame data";
        goto LABEL_26;
      }
    }
  }
}

uint64_t __42__VCVideoStream_sendLastRemoteVideoFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidGetLastDecodedFrame", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)validateVideoStreamConfigurations:(id)a3
{
  void *v4;
  BOOL v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  if (!objc_msgSend(a3, "count"))
    return 0;
  v4 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  if ((unint64_t)objc_msgSend(a3, "count") >= 2
    && objc_msgSend(v4, "direction") != 2
    && !objc_msgSend(v4, "temporalScalingEnabled"))
  {
    return 0;
  }
  if ((unint64_t)objc_msgSend(a3, "count") < 2)
    return 1;
  v6 = 2;
  v7 = 1;
  do
  {
    v8 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "direction");
    v5 = v8 == objc_msgSend(v4, "direction");
    if (!v5)
      break;
    v7 = v6;
  }
  while (objc_msgSend(a3, "count") > (unint64_t)v6++);
  return v5;
}

- (void)cleanupBeforeReconfigure:(id)a3
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  BOOL v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VCVideoStream *v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->super._transportArray, "count"))
    v5 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->super._transportArray, "objectAtIndexedSubscript:", 0), "streamConfig"), "localSSRC");
  else
    v5 = 0;
  if (objc_msgSend(a3, "count"))
    v6 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "localSSRC");
  else
    v6 = 0;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(a3);
        v9 += objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "tilesPerFrame");
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    }
    while (v8);
    v12 = v9;
  }
  else
  {
    v12 = 0;
  }
  v13 = -[NSMutableArray count](self->super._transportArray, "count") == v12 && v6 == v5;
  if (!v13 && -[NSMutableArray count](self->super._transportArray, "count"))
  {
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoStream cleanupBeforeReconfigure:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v17 = 136316162;
          v18 = v15;
          v19 = 2080;
          v20 = "-[VCVideoStream cleanupBeforeReconfigure:]";
          v21 = 1024;
          v22 = 1703;
          v23 = 2112;
          v24 = v14;
          v25 = 2048;
          v26 = self;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) Reconfiguring VCVideoStream with a different number of transports.", (uint8_t *)&v17, 0x30u);
        }
      }
    }
    -[NSMutableArray removeAllObjects](self->super._transportArray, "removeAllObjects");
  }
}

- (void)setTargetStreamID:(id)a3
{
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  VCVideoStream *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!-[NSNumber isEqualToNumber:](self->_targetStreamID, "isEqualToNumber:")
    || objc_msgSend(a3, "unsignedIntValue") != self->_currentStreamID)
  {
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_17;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v23 = 136315906;
      v24 = v7;
      v25 = 2080;
      v26 = "-[VCVideoStream setTargetStreamID:]";
      v27 = 1024;
      v28 = 1714;
      v29 = 2112;
      v30 = a3;
      v9 = "VCVideoStream [%s] %s:%d Setting target stream id: %@";
      v10 = v8;
      v11 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_17;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v23 = 136316418;
      v24 = v12;
      v25 = 2080;
      v26 = "-[VCVideoStream setTargetStreamID:]";
      v27 = 1024;
      v28 = 1714;
      v29 = 2112;
      v30 = (id)v6;
      v31 = 2048;
      v32 = self;
      v33 = 2112;
      v34 = a3;
      v9 = "VCVideoStream [%s] %s:%d %@(%p) Setting target stream id: %@";
      v10 = v13;
      v11 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v23, v11);
LABEL_17:

    self->_targetStreamID = (NSNumber *)a3;
    -[VCVideoReceiverBase setTargetStreamID:](self->_videoReceiver, "setTargetStreamID:", objc_msgSend(a3, "unsignedShortValue"));
    return;
  }
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      v16 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 136315906;
          v24 = v14;
          v25 = 2080;
          v26 = "-[VCVideoStream setTargetStreamID:]";
          v27 = 1024;
          v28 = 1711;
          v29 = 2112;
          v30 = a3;
          v17 = "VCVideoStream [%s] %s:%d TargetStreamID didn't change %@";
          v18 = v15;
          v19 = 38;
LABEL_28:
          _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, v19);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoStream setTargetStreamID:].cold.1();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      v22 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 136316418;
          v24 = v20;
          v25 = 2080;
          v26 = "-[VCVideoStream setTargetStreamID:]";
          v27 = 1024;
          v28 = 1711;
          v29 = 2112;
          v30 = (id)v5;
          v31 = 2048;
          v32 = self;
          v33 = 2112;
          v34 = a3;
          v17 = "VCVideoStream [%s] %s:%d %@(%p) TargetStreamID didn't change %@";
          v18 = v21;
          v19 = 58;
          goto LABEL_28;
        }
      }
      else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = 136316418;
        v24 = v20;
        v25 = 2080;
        v26 = "-[VCVideoStream setTargetStreamID:]";
        v27 = 1024;
        v28 = 1711;
        v29 = 2112;
        v30 = (id)v5;
        v31 = 2048;
        v32 = self;
        v33 = 2112;
        v34 = a3;
        _os_log_debug_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEBUG, "VCVideoStream [%s] %s:%d %@(%p) TargetStreamID didn't change %@", (uint8_t *)&v23, 0x3Au);
      }
    }
  }
}

- (void)setShouldEnableFaceZoom:(BOOL)a3
{
  _BOOL8 v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _BYTE v13[24];
  __int128 v14;
  VCVideoStream *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_shouldEnableFaceZoom != a3)
  {
    v3 = a3;
    self->_shouldEnableFaceZoom = a3;
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)v13 = 136315906;
      *(_QWORD *)&v13[4] = v6;
      *(_WORD *)&v13[12] = 2080;
      *(_QWORD *)&v13[14] = "-[VCVideoStream setShouldEnableFaceZoom:]";
      *(_WORD *)&v13[22] = 1024;
      LODWORD(v14) = 1723;
      WORD2(v14) = 1024;
      *(_DWORD *)((char *)&v14 + 6) = v3;
      v8 = "VCVideoStream [%s] %s:%d Setting shouldEnableFaceZoom in receiver=%d";
      v9 = v7;
      v10 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)v13 = 136316418;
      *(_QWORD *)&v13[4] = v11;
      *(_WORD *)&v13[12] = 2080;
      *(_QWORD *)&v13[14] = "-[VCVideoStream setShouldEnableFaceZoom:]";
      *(_WORD *)&v13[22] = 1024;
      LODWORD(v14) = 1723;
      WORD2(v14) = 2112;
      *(_QWORD *)((char *)&v14 + 6) = v5;
      HIWORD(v14) = 2048;
      v15 = self;
      LOWORD(v16) = 1024;
      *(_DWORD *)((char *)&v16 + 2) = v3;
      v8 = "VCVideoStream [%s] %s:%d %@(%p) Setting shouldEnableFaceZoom in receiver=%d";
      v9 = v12;
      v10 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
LABEL_13:
    -[VCVideoReceiverBase setShouldEnableFaceZoom:](self->_videoReceiver, "setShouldEnableFaceZoom:", v3, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16, v17);
  }
}

- (void)setShouldEnableMLEnhance:(BOOL)a3 streamID:(unsigned __int16)a4
{
  -[VCVideoReceiverBase setShouldEnableMLEnhance:streamID:](self->_videoReceiver, "setShouldEnableMLEnhance:streamID:", a3, a4);
}

- (unsigned)lastDisplayedFrameRTPTimestamp
{
  uint64_t v3;
  NSObject *v4;
  VCVideoReceiverBase *videoReceiver;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  VCVideoStream *v14;
  __int16 v15;
  VCVideoReceiverBase *v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      videoReceiver = self->_videoReceiver;
      v7 = 136316418;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCVideoStream lastDisplayedFrameRTPTimestamp]";
      v11 = 1024;
      v12 = 1735;
      v13 = 2048;
      v14 = self;
      v15 = 2048;
      v16 = videoReceiver;
      v17 = 1024;
      v18 = -[VCVideoReceiverBase lastDisplayedFrameRTPTimestamp](videoReceiver, "lastDisplayedFrameRTPTimestamp");
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d From VCVideoStream[%p], _videoReceiver[%p], RTPTimestamp[%u]", (uint8_t *)&v7, 0x36u);
    }
  }
  return -[VCVideoReceiverBase lastDisplayedFrameRTPTimestamp](self->_videoReceiver, "lastDisplayedFrameRTPTimestamp");
}

+ (BOOL)isLowLatencyStreamType:(int64_t)a3
{
  return ((unint64_t)a3 < 7) & (0x76u >> a3);
}

- (BOOL)isLowLatencyStreamType
{
  return +[VCVideoStream isLowLatencyStreamType:](VCVideoStream, "isLowLatencyStreamType:", self->_type);
}

+ (BOOL)isFeatureListStringExpectedForStreamType:(int64_t)a3
{
  return ((unint64_t)a3 < 7) & (0x76u >> a3);
}

+ (BOOL)shouldEnableRateControlForStreamType:(int64_t)a3
{
  return ((unint64_t)a3 < 7) & (0x76u >> a3);
}

+ (BOOL)shouldRegisterReportingForStreamType:(int64_t)a3
{
  return ((unint64_t)a3 < 7) & (0x76u >> a3);
}

- (BOOL)validateStreamConfiguration:(id)a3 error:(id *)a4
{
  _BOOL4 v7;
  const __CFString *v8;
  uint64_t v9;
  char IsOSFaultDisabled;
  NSObject *v11;
  const char *v12;
  const char *v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCVideoStream *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!+[VCVideoStream isFeatureListStringExpectedForStreamType:](VCVideoStream, "isFeatureListStringExpectedForStreamType:", objc_msgSend(a3, "type"))|| objc_msgSend((id)objc_msgSend(a3, "rxCodecFeatureListStrings"), "count")&& objc_msgSend((id)objc_msgSend(a3, "txCodecFeatureListStrings"), "count"))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStream.m", 1817), CFSTR("Invalid configuration"), CFSTR("Feature string is nil"));
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v7)
            return v7;
          -[VCVideoStream validateStreamConfiguration:error:].cold.1();
        }
        else
        {
          v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
          if (!v7)
            return v7;
          -[VCVideoStream validateStreamConfiguration:error:].cold.2();
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        v11 = *MEMORY[0x1E0CF2758];
        if ((IsOSFaultDisabled & 1) != 0)
        {
          v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v7)
            return v7;
          if (*a4)
            v12 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          else
            v12 = "<nil>";
          *(_DWORD *)buf = 136316418;
          v16 = v9;
          v17 = 2080;
          v18 = "-[VCVideoStream validateStreamConfiguration:error:]";
          v19 = 1024;
          v20 = 1820;
          v21 = 2112;
          v22 = v8;
          v23 = 2048;
          v24 = self;
          v25 = 2080;
          v26 = v12;
          _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) error[%s]", buf, 0x3Au);
        }
        else
        {
          v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
          if (!v7)
            return v7;
          if (*a4)
            v13 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          else
            v13 = "<nil>";
          *(_DWORD *)buf = 136316418;
          v16 = v9;
          v17 = 2080;
          v18 = "-[VCVideoStream validateStreamConfiguration:error:]";
          v19 = 1024;
          v20 = 1820;
          v21 = 2112;
          v22 = v8;
          v23 = 2048;
          v24 = self;
          v25 = 2080;
          v26 = v13;
          _os_log_fault_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_FAULT, "VCVideoStream [%s] %s:%d %@(%p) error[%s]", buf, 0x3Au);
        }
      }
    }
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)setEncodingMode:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  VCVideoStream *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCVideoStream setEncodingMode:]";
      v13 = 1024;
      v14 = 1828;
      v15 = 2048;
      v16 = self;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]: encodingMode=%d", (uint8_t *)&v9, 0x2Cu);
    }
  }
  VCMediaStream_Lock((uint64_t)self);
  v7 = -[VCVideoTransmitterBase setEncodingMode:](self->_videoTransmitter, "setEncodingMode:", v3);
  VCMediaStream_Unlock((uint64_t)self);
  return v7;
}

- (BOOL)enableRateControlFeebackInConfig:(id)a3
{
  VCMediaStreamRateControlConfig *v4;
  VCMediaStreamRateControlConfig *v5;
  BOOL v6;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setRtcpEnabled:", 1);
  objc_msgSend(a3, "setRtcpReceiveCallbackEnabled:", 0);
  if (objc_msgSend(a3, "rateControlConfig"))
  {
    v4 = 0;
LABEL_5:
    v6 = 1;
    objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "setShouldCreateMediaControlInfoGenerator:", 1);
    objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "setMediaControlInfoVersion:", 2);
    objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "setMediaControlInfoGeneratorType:", 1);
    goto LABEL_6;
  }
  v5 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (v5)
  {
    v4 = v5;
    objc_msgSend(a3, "setRateControlConfig:", v5);
    goto LABEL_5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCVideoStream enableRateControlFeebackInConfig:]";
      v14 = 1024;
      v15 = 1845;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Could not allocate memory for creating VCMediaStreamRateControlConfig object", (uint8_t *)&v10, 0x1Cu);
    }
  }
  v4 = 0;
  v6 = 0;
LABEL_6:

  return v6;
}

- (void)setJitterBufferMode:(int)a3
{
  -[VCVideoReceiverBase setJitterBufferMode:](self->_videoReceiver, "setJitterBufferMode:", *(_QWORD *)&a3);
}

- (void)setDeferredAssemblyEnabled:(BOOL)a3
{
  -[VCVideoReceiverBase setDeferredAssemblyEnabled:](self->_videoReceiver, "setDeferredAssemblyEnabled:", a3);
}

- (void)setLooseAVSyncEnabled:(BOOL)a3
{
  -[VCVideoReceiverBase setLooseAVSyncEnabled:](self->_videoReceiver, "setLooseAVSyncEnabled:", a3);
}

- (void)setUplinkRetransmissionEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  VCMediaStream_Lock((uint64_t)self);
  if (self->super._isUplinkRetransmissionEnabled != v3)
  {
    -[VCMediaStreamConfig setIsUplinkRetransmissionEnabled:](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "setIsUplinkRetransmissionEnabled:", v3);
    self->super._isUplinkRetransmissionEnabled = v3;
    if (-[VCMediaStream state](self, "state") == 2)
      -[VCVideoTransmitterBase setRtxEnabled:](self->_videoTransmitter, "setRtxEnabled:", v3);
  }
  VCMediaStream_Unlock((uint64_t)self);
}

- (double)videoRxFrameRate
{
  double v3;
  double v4;

  VCMediaStream_Lock((uint64_t)self);
  v3 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VCVideoReceiverBase videoReceiverRxFrameRate](self->_videoReceiver, "videoReceiverRxFrameRate");
    v3 = v4;
  }
  VCMediaStream_Unlock((uint64_t)self);
  return v3;
}

- (id)supportedPayloads
{
  return +[VCVideoStream supportedVideoPayloads](VCVideoStream, "supportedVideoPayloads");
}

- (id)getTransmitMediaControllerWithStreamConfig:(id)a3
{
  if (objc_msgSend(a3, "type") == 3)
    return (id)objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "mediaController");
  else
    return 0;
}

- (id)getTransmitStatsCollectorWithStreamConfig:(id)a3
{
  unint64_t v5;

  v5 = objc_msgSend(a3, "type");
  if (v5 <= 6 && ((1 << v5) & 0x76) != 0)
    return self->_statisticsCollector;
  else
    return (id)objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "statisticsCollector");
}

- (id)getReceiveStatsCollectorWithStreamConfig:(id)a3
{
  unint64_t v5;
  id result;

  v5 = objc_msgSend(a3, "type");
  result = 0;
  if (v5 <= 6)
  {
    if (((1 << v5) & 0x76) != 0)
    {
      if (objc_msgSend(a3, "direction") == 2)
        return self->_statisticsCollector;
      else
        return 0;
    }
    else if (v5 == 3)
    {
      return (id)objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "statisticsCollector");
    }
  }
  return result;
}

- (void)deregisterCurrentStreamInputCaptureSource
{
  if (self->_captureSource == 6)
  {
    if (self->_streamInputCaptureSource)
    {
      objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "unregisterStreamInputCaptureSourceWithCaptureSourceID:", self->_streamInputCaptureSource);
      self->_streamInputCaptureSource = 0;
    }
  }
}

- (BOOL)configureStreamInputCaptureSourceWithStreamInputID:(int64_t)a3 frameRate:(unsigned int)a4
{
  uint64_t v4;
  int v7;

  v4 = *(_QWORD *)&a4;
  -[VCVideoStream deregisterCurrentStreamInputCaptureSource](self, "deregisterCurrentStreamInputCaptureSource");
  v7 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerStreamInputCaptureSourceWithID:frameRate:", a3, v4);
  self->_streamInputCaptureSource = v7;
  if (!v7 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStream configureStreamInputCaptureSourceWithStreamInputID:frameRate:].cold.1();
  }
  return v7 != 0;
}

- (unsigned)maxFramerateFromStreamConfigs:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[18];
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v38;
    *(_QWORD *)&v5 = 136316162;
    v22 = v5;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v10, "framerate", v22) > v7)
        {
          if ((VCVideoStream *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v18 = VRTraceErrorLogLevelToCSTR();
              v19 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v20 = objc_msgSend(v10, "framerate");
                *(_DWORD *)buf = v22;
                v25 = v18;
                v26 = 2080;
                v27 = "-[VCVideoStream maxFramerateFromStreamConfigs:]";
                v28 = 1024;
                v29 = 1978;
                v30 = 1024;
                *(_DWORD *)v31 = v7;
                *(_WORD *)&v31[4] = 2048;
                *(_QWORD *)&v31[6] = v20;
                v15 = v19;
                v16 = "VCVideoStream [%s] %s:%d Updating maxFramerate from old=%u to new=%lu";
                v17 = 44;
LABEL_16:
                _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
              }
            }
          }
          else
          {
            v11 = &stru_1E9E58EE0;
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v11 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v12 = VRTraceErrorLogLevelToCSTR();
              v13 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v14 = objc_msgSend(v10, "framerate");
                *(_DWORD *)buf = 136316674;
                v25 = v12;
                v26 = 2080;
                v27 = "-[VCVideoStream maxFramerateFromStreamConfigs:]";
                v28 = 1024;
                v29 = 1978;
                v30 = 2112;
                *(_QWORD *)v31 = v11;
                *(_WORD *)&v31[8] = 2048;
                *(_QWORD *)&v31[10] = self;
                v32 = 1024;
                v33 = v7;
                v34 = 2048;
                v35 = v14;
                v15 = v13;
                v16 = "VCVideoStream [%s] %s:%d %@(%p) Updating maxFramerate from old=%u to new=%lu";
                v17 = 64;
                goto LABEL_16;
              }
            }
          }
          v7 = objc_msgSend(v10, "framerate");
          continue;
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
      if (!v6)
        return v7;
    }
  }
  LODWORD(v7) = 0;
  return v7;
}

- (void)configureMediaStallSettingsWithConfig:(id)a3
{
  double v5;
  double v6;
  double v7;

  self->_sendContinuousStallMessages = objc_msgSend(a3, "type") == 3;
  if (a3)
  {
    objc_msgSend(a3, "mediaStallTimeout");
    objc_msgSend(a3, "mediaStallTimeout", 5.0);
    self->_mediaStallTimeout = VCDefaults_GetDoubleValueForKey(CFSTR("mediaStallTimeout"), v5);
    objc_msgSend(a3, "mediaStallReportRepeatInterval");
    objc_msgSend(a3, "mediaStallReportRepeatInterval");
    v7 = v6;
    self->_sendContinuousStallMessages = 1;
  }
  else
  {
    v7 = 5.0;
    self->_mediaStallTimeout = VCDefaults_GetDoubleValueForKey(CFSTR("mediaStallTimeout"), 5.0);
  }
  self->_mediaStallReportRepeatInterval = VCDefaults_GetDoubleValueForKey(CFSTR("mediaStallReportRepeatInterval"), v7);
}

- (BOOL)onConfigureStreamWithConfiguration:(id)a3 error:(id *)a4
{
  void *v7;
  int64_t *p_type;
  int64_t type;
  const __CFString *v10;
  _BOOL4 v11;
  uint64_t v12;
  char IsOSFaultDisabled;
  NSObject *v14;
  const char *v15;
  int64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  int v20;
  int ErrorLogLevelForModule;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  int v30;
  int v31;
  uint64_t localSSRC;
  id v33;
  _BOOL8 v34;
  id *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  NSObject *v40;
  const __CFString *v41;
  uint64_t v42;
  char v43;
  const char *v44;
  uint64_t v45;
  char v46;
  NSObject *v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  const char *v51;
  uint64_t v52;
  char v53;
  NSObject *v54;
  int64_t v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  int64_t v59;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id obj;
  int v66;
  uint64_t v67;
  _BOOL4 v68;
  id *v69;
  _VCMediaStreamTransportSetupInfo *p_transportSetupInfo;
  int v71;
  _BYTE v72[128];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  const __CFString *v84;
  __int16 v85;
  VCVideoStream *v86;
  __int16 v87;
  const char *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  if (!-[VCVideoStream validateVideoStreamConfigurations:](self, "validateVideoStreamConfigurations:"))
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStream.m", 2007), CFSTR("Invalid Parameter"), CFSTR("Called with an invalid parameter"));
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v11)
            return v11;
          -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.9();
        }
        else
        {
          v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
          if (!v11)
            return v11;
          -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.10();
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        v14 = *MEMORY[0x1E0CF2758];
        if ((IsOSFaultDisabled & 1) != 0)
        {
          v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v11)
            return v11;
          if (*a4)
            v15 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          else
            v15 = "<nil>";
          *(_DWORD *)buf = 136316418;
          v78 = v12;
          v79 = 2080;
          v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
          v81 = 1024;
          v82 = 2010;
          v83 = 2112;
          v84 = v10;
          v85 = 2048;
          v86 = self;
          v87 = 2080;
          v88 = v15;
          v48 = "VCVideoStream [%s] %s:%d %@(%p) error[%s]";
LABEL_154:
          v49 = v14;
          v50 = 58;
LABEL_155:
          _os_log_error_impl(&dword_1D8A54000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
        }
        else
        {
          v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
          if (!v11)
            return v11;
          if (*a4)
            v23 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          else
            v23 = "<nil>";
          *(_DWORD *)buf = 136316418;
          v78 = v12;
          v79 = 2080;
          v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
          v81 = 1024;
          v82 = 2010;
          v83 = 2112;
          v84 = v10;
          v85 = 2048;
          v86 = self;
          v87 = 2080;
          v88 = v23;
          v56 = "VCVideoStream [%s] %s:%d %@(%p) error[%s]";
LABEL_158:
          v57 = v14;
          v58 = 58;
LABEL_159:
          _os_log_fault_impl(&dword_1D8A54000, v57, OS_LOG_TYPE_FAULT, v56, buf, v58);
        }
      }
    }
    goto LABEL_160;
  }
  v7 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  -[VCVideoStream cleanupBeforeReconfigure:](self, "cleanupBeforeReconfigure:", a3);
  -[VCVideoStream overrideConfigWithDefaults:](self, "overrideConfigWithDefaults:", v7);
  p_type = &self->_type;
  self->_type = objc_msgSend(v7, "type");
  -[VCVideoStream updateShouldCacheRemoteVideoFrame](self, "updateShouldCacheRemoteVideoFrame");
  self->_captureSource = objc_msgSend(v7, "captureSource");
  LODWORD(self->_colorInfo) = objc_msgSend((id)objc_msgSend(v7, "multiwayConfig"), "qualityIndex");
  -[VCVideoStream configureMediaStallSettingsWithConfig:](self, "configureMediaStallSettingsWithConfig:", v7);
  type = self->_type;
  if (type == 6)
  {
LABEL_5:
    self->_screenDisplayID = objc_msgSend(v7, "screenDisplayID");
    goto LABEL_20;
  }
  if (type != 2)
  {
    if (type != 1)
      goto LABEL_20;
    goto LABEL_5;
  }
  self->_captureSource = 2;
LABEL_20:
  if (-[VCVideoStream isScreenConfig:](self, "isScreenConfig:", v7))
  {
    self->_customHeight = objc_msgSend(v7, "customHeight");
    self->_customWidth = objc_msgSend(v7, "customWidth");
  }
  -[VCVideoStream setupColorInfo:](self, "setupColorInfo:", v7);
  v16 = objc_msgSend(v7, "captureSourceID");
  self->_captureSourceID = v16;
  if (v16)
  {
    if (-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"))
    {
      v17 = -[VCVideoStream newScreenCaptureConfigForVideoConfig:](self, "newScreenCaptureConfigForVideoConfig:", -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"));
      objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterCaptureConfig:forSource:", v17, -[VCMediaStreamConfig captureSource](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "captureSource"));

    }
    v18 = -[VCVideoStream newScreenCaptureConfigForVideoConfig:](self, "newScreenCaptureConfigForVideoConfig:", v7);
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerCaptureConfig:forSource:", v18, objc_msgSend(v7, "captureSource"));

  }
  if (objc_msgSend(v7, "temporalScalingEnabled"))
    self->_isTemporalScalingEnabled = 1;
  if (objc_msgSend(v7, "isRedundancyControlEnabled") && objc_msgSend(v7, "type") == 3)
    -[VCVideoStream setupInternalRedundancyControllerWithStreamConfig:](self, "setupInternalRedundancyControllerWithStreamConfig:", v7);
  v19 = -[VCVideoStream maxFramerateFromStreamConfigs:](self, "maxFramerateFromStreamConfigs:", a3);
  if (self->_captureSource == 6
    && !-[VCVideoStream configureStreamInputCaptureSourceWithStreamInputID:frameRate:](self, "configureStreamInputCaptureSourceWithStreamInputID:frameRate:", objc_msgSend(v7, "streamInputID"), v19))
  {
    if (a4)
    {
      v22 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("Can not register capture source streamInput, streamInputID could be wrong"));
      LOBYTE(v11) = 0;
      *a4 = v22;
      return v11;
    }
LABEL_160:
    LOBYTE(v11) = 0;
    return v11;
  }
  v61 = v19;
  v68 = -[VCVideoStream isLowLatencyStreamType](self, "isLowLatencyStreamType");
  if (v68
    && self->super._transportSetupInfo.setupType == 1
    && (objc_msgSend(v7, "direction") == 2 || objc_msgSend(v7, "direction") == 3))
  {
    v71 = 1500000;
    v20 = setsockopt(self->super._transportSetupInfo.var0.socketInfo.rtpSocket, 0xFFFF, 4098, &v71, 4u);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v20)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.8();
      }
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v78 = v24;
        v79 = 2080;
        v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
        v81 = 1024;
        v82 = 2086;
        v83 = 1024;
        LODWORD(v84) = 1500000;
        _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Set socket receive buffer size=%d", buf, 0x22u);
      }
    }
  }
  self->super._operatingMode = -[VCVideoStream operatingModeForVideoStreamType:](self, "operatingModeForVideoStreamType:", *p_type);
  -[VCVideoStream setupThermalNotifications](self, "setupThermalNotifications");
  v69 = a4;
  if (*p_type)
  {
    if (objc_msgSend(v7, "rtpTimestampRate"))
      v26 = objc_msgSend(v7, "rtpTimestampRate");
    else
      v26 = 24000;
  }
  else
  {
    v26 = 90000;
  }
  self->_rtpTimestampRate = v26;
  p_transportSetupInfo = &self->super._transportSetupInfo;
  self->super._transportSetupInfo.sourceRate = v26;
  self->super._useRandomTS = +[VCVideoStream shouldUseRandomRTPTimestampWithType:](VCVideoStream, "shouldUseRandomRTPTimestampWithType:", *p_type);
  v67 = -[NSMutableArray count](self->super._transportArray, "count");
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = a3;
  v62 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v73, v72, 16);
  if (v62)
  {
    v27 = 0;
    v63 = *(_QWORD *)v74;
LABEL_58:
    v28 = 0;
    while (1)
    {
      if (*(_QWORD *)v74 != v63)
        objc_enumerationMutation(obj);
      v29 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v28);
      v66 = objc_msgSend(v29, "remoteSSRC");
      v30 = objc_msgSend(v29, "tilesPerFrame");
      v11 = -[VCVideoStream validateStreamConfiguration:error:](self, "validateStreamConfiguration:error:", v29, v69);
      if (!v11)
        break;
      v64 = v28;
      if (v30 >= 1)
      {
        v31 = 0;
        while (1)
        {
          localSSRC = self->super._localSSRC;
          if (v68)
          {
            localSSRC = (v31 + localSSRC);
            if (objc_msgSend(v29, "remoteSSRC"))
              objc_msgSend(v29, "setRemoteSSRC:", (v66 + v31));
          }
          else if (objc_msgSend(v29, "temporalScalingEnabled"))
          {
            localSSRC = objc_msgSend((id)objc_msgSend(v29, "multiwayConfig"), "ssrc");
          }
          if (v67)
          {
            v33 = (id)-[NSMutableArray objectAtIndexedSubscript:](self->super._transportArray, "objectAtIndexedSubscript:", v27++);
            if (!v33)
              goto LABEL_92;
          }
          else
          {
            v33 = -[VCMediaStream createTransportWithStreamConfig:ssrc:](self, "createTransportWithStreamConfig:ssrc:", v29, localSSRC);
            if (!v33)
            {
LABEL_92:
              if ((VCVideoStream *)objc_opt_class() == self)
              {
                v35 = v69;
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.3();
                }
              }
              else
              {
                v35 = v69;
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v36 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
                else
                  v36 = &stru_1E9E58EE0;
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  v39 = VRTraceErrorLogLevelToCSTR();
                  v40 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    v78 = v39;
                    v79 = 2080;
                    v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
                    v81 = 1024;
                    v82 = 2128;
                    v83 = 2112;
                    v84 = v36;
                    v85 = 2048;
                    v86 = self;
                    _os_log_error_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) Failed to create transport", buf, 0x30u);
                  }
                }
              }
              +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v35, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStream.m", 2132), CFSTR("Failed to create transport"), CFSTR("Create transport failed"));
              if ((VCVideoStream *)objc_opt_class() == self)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() < 2)
                  goto LABEL_160;
                VRTraceErrorLogLevelToCSTR();
                if ((VRTraceIsOSFaultDisabled() & 1) != 0)
                {
                  v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
                  if (!v11)
                    return v11;
                  -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.1();
                }
                else
                {
                  v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
                  if (!v11)
                    return v11;
                  -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.2();
                }
                goto LABEL_160;
              }
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v41 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
              else
                v41 = &stru_1E9E58EE0;
              if ((int)VRTraceGetErrorLogLevelForModule() < 2)
                goto LABEL_160;
              v42 = VRTraceErrorLogLevelToCSTR();
              v43 = VRTraceIsOSFaultDisabled();
              v14 = *MEMORY[0x1E0CF2758];
              if ((v43 & 1) != 0)
              {
                v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
                if (!v11)
                  return v11;
                if (*v35)
                  v44 = (const char *)objc_msgSend((id)objc_msgSend(*v35, "description"), "UTF8String");
                else
                  v44 = "<nil>";
                *(_DWORD *)buf = 136316418;
                v78 = v42;
                v79 = 2080;
                v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
                v81 = 1024;
                v82 = 2135;
                v83 = 2112;
                v84 = v41;
                v85 = 2048;
                v86 = self;
                v87 = 2080;
                v88 = v44;
                v48 = "VCVideoStream [%s] %s:%d %@(%p) error[%s]";
                goto LABEL_154;
              }
              v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
              if (!v11)
                return v11;
              if (*v35)
                v51 = (const char *)objc_msgSend((id)objc_msgSend(*v35, "description"), "UTF8String");
              else
                v51 = "<nil>";
              *(_DWORD *)buf = 136316418;
              v78 = v42;
              v79 = 2080;
              v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
              v81 = 1024;
              v82 = 2135;
              v83 = 2112;
              v84 = v41;
              v85 = 2048;
              v86 = self;
              v87 = 2080;
              v88 = v51;
              v56 = "VCVideoStream [%s] %s:%d %@(%p) error[%s]";
              goto LABEL_158;
            }
          }
          if (+[VCVideoStream shouldEnableRateControlForStreamType:](VCVideoStream, "shouldEnableRateControlForStreamType:", *p_type)&& !-[VCVideoStream enableRateControlFeebackInConfig:](self, "enableRateControlFeebackInConfig:", v29))
          {
            break;
          }
          if (!*p_type && p_transportSetupInfo->setupType == 5)
            self->super._transportSetupInfo.var0.ipInfo.srcIPPORT.szIfName[12] = 1;

          self->_statisticsCollector = (AVCStatisticsCollector *)-[VCVideoStream getReceiveStatsCollectorWithStreamConfig:](self, "getReceiveStatsCollectorWithStreamConfig:", v29);
          v34 = objc_msgSend(v29, "type") == 3 || objc_msgSend(v29, "type") == 5;
          if ((objc_msgSend(v33, "configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:", v29, p_transportSetupInfo, v34, objc_msgSend(v29, "type") == 3, self->_statisticsCollector, objc_msgSend((id)objc_msgSend(v29, "rateControlConfig"), "basebandCongestionDetector"), v69) & 1) == 0)
          {
            if ((VCVideoStream *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() < 2)
                goto LABEL_160;
              VRTraceErrorLogLevelToCSTR();
              if ((VRTraceIsOSFaultDisabled() & 1) != 0)
              {
                v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
                if (!v11)
                  return v11;
                -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.4();
              }
              else
              {
                v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
                if (!v11)
                  return v11;
                -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.5();
              }
              goto LABEL_160;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v37 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v37 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 2)
              goto LABEL_160;
            v45 = VRTraceErrorLogLevelToCSTR();
            v46 = VRTraceIsOSFaultDisabled();
            v47 = *MEMORY[0x1E0CF2758];
            if ((v46 & 1) != 0)
            {
              v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v11)
                return v11;
              *(_DWORD *)buf = 136316162;
              v78 = v45;
              v79 = 2080;
              v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
              v81 = 1024;
              v82 = 2162;
              v83 = 2112;
              v84 = v37;
              v85 = 2048;
              v86 = self;
              v48 = "VCVideoStream [%s] %s:%d %@(%p) Failed to configure transport";
              v49 = v47;
              v50 = 48;
              goto LABEL_155;
            }
            v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
            if (!v11)
              return v11;
            *(_DWORD *)buf = 136316162;
            v78 = v45;
            v79 = 2080;
            v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
            v81 = 1024;
            v82 = 2162;
            v83 = 2112;
            v84 = v37;
            v85 = 2048;
            v86 = self;
            v56 = "VCVideoStream [%s] %s:%d %@(%p) Failed to configure transport";
            v57 = v47;
            v58 = 48;
            goto LABEL_159;
          }
          RTPSetTimestampRateScale(objc_msgSend(v33, "rtpHandle"), 0);
          if (v30 == ++v31)
            goto LABEL_83;
        }
        if ((VCVideoStream *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 2)
            goto LABEL_160;
          VRTraceErrorLogLevelToCSTR();
          if ((VRTraceIsOSFaultDisabled() & 1) != 0)
          {
            v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v11)
              return v11;
            -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.6();
          }
          else
          {
            v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
            if (!v11)
              return v11;
            -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.7();
          }
          goto LABEL_160;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v38 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v38 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 2)
          goto LABEL_160;
        v52 = VRTraceErrorLogLevelToCSTR();
        v53 = VRTraceIsOSFaultDisabled();
        v54 = *MEMORY[0x1E0CF2758];
        if ((v53 & 1) != 0)
        {
          v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v11)
            return v11;
          v55 = *p_type;
          *(_DWORD *)buf = 136316418;
          v78 = v52;
          v79 = 2080;
          v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
          v81 = 1024;
          v82 = 2142;
          v83 = 2112;
          v84 = v38;
          v85 = 2048;
          v86 = self;
          v87 = 1024;
          LODWORD(v88) = v55;
          v48 = "VCVideoStream [%s] %s:%d %@(%p) Failed to update stream config for VCVideoStreamType=%d";
          v49 = v54;
          v50 = 54;
          goto LABEL_155;
        }
        v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
        if (!v11)
          return v11;
        v59 = *p_type;
        *(_DWORD *)buf = 136316418;
        v78 = v52;
        v79 = 2080;
        v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
        v81 = 1024;
        v82 = 2142;
        v83 = 2112;
        v84 = v38;
        v85 = 2048;
        v86 = self;
        v87 = 1024;
        LODWORD(v88) = v59;
        v56 = "VCVideoStream [%s] %s:%d %@(%p) Failed to update stream config for VCVideoStreamType=%d";
        v57 = v54;
        v58 = 54;
        goto LABEL_159;
      }
LABEL_83:
      ++v28;
      if (v64 + 1 == v62)
      {
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v72, 16);
        if (v62)
          goto LABEL_58;
        goto LABEL_85;
      }
    }
  }
  else
  {
LABEL_85:
    -[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:](self, "registerMediaControlInfoGeneratorWithConfigs:", obj);
    -[VCVideoStream overrideConfigWithDefaults:](self, "overrideConfigWithDefaults:", -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"));
    if (self->_baseQualityIndex && self->super._operatingMode == 6)
      -[VCMediaStream updateTransportsWithConstantConnectionOverhead:](self, "updateTransportsWithConstantConnectionOverhead:");
    -[VCImageQueue setImageQueueProtected:](self->_remoteQueue, "setImageQueueProtected:", objc_msgSend(v7, "isVideoProtected"));
    -[VCImageQueue setFrameRate:](self->_remoteQueue, "setFrameRate:", v61);
    if ((unint64_t)*p_type <= 6 && ((1 << *p_type) & 0x66) != 0)
      -[VCImageQueue setLowLatencyEnabled:](self->_remoteQueue, "setLowLatencyEnabled:", 1);
    -[VCImageQueue setLowLatencyEnabled:](self->_remoteQueue, "setLowLatencyEnabled:", VCDefaults_GetBoolValueForKey(CFSTR("forceVideoStreamLowLatency"), -[VCImageQueue isLowLatencyEnabled](self->_remoteQueue, "isLowLatencyEnabled")));
    LOBYTE(v11) = 1;
  }
  return v11;
}

- (int)operatingModeForVideoStreamType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 5;
  else
    return dword_1D9110340[a3 - 1];
}

- (void)deregisterForVideoCapture
{
  int64_t captureSourceID;
  id v4;

  if (self->_captureSource == 6)
  {
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "unregisterVideoSink:withCaptureSource:", self, self->_streamInputCaptureSource);
  }
  else
  {
    captureSourceID = self->_captureSourceID;
    v4 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton");
    if (captureSourceID)
      objc_msgSend(v4, "deregisterCaptureClientForScreenShare:", self);
    else
      objc_msgSend(v4, "deregisterForVideoFramesFromSource:withClient:", self->_captureSource, self);
  }
  -[VCMomentsCollectorDelegate cleanUpActiveRequests](-[VCMediaStream momentsCollectorDelegate](self, "momentsCollectorDelegate"), "cleanUpActiveRequests");
  atomic_store(0, (unsigned __int8 *)&self->_isVideoCaptureRegistered);
}

- (void)reportFailedToRegisterVideoFramesFromSource:(int)a3 width:(int)a4 height:(int)a5 frameRate:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  v11[4] = *MEMORY[0x1E0C80C00];
  -[VCObject reportingAgent](self, "reportingAgent");
  v10[0] = CFSTR("SymptomReporterOptionalKeyCaptureSource");
  v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v10[1] = CFSTR("SymptomReporterOptionalKeyCaptureWidth");
  v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v10[2] = CFSTR("SymptomReporterOptionalKeyCaptureHeight");
  v11[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v10[3] = CFSTR("SymptomReporterOptionalKeyCaptureFrameRate");
  v11[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  reportingSymptom();
}

- (BOOL)registerForCameraCaptureWithConfig:(id)a3
{
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  VCVideoRule *v21;
  double v22;
  char v23;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[10];
  VCVideoStream *v33;
  _BYTE v34[6];
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", objc_msgSend(a3, "videoResolution"));
  v6 = v5;
  v8 = v7;
  +[VideoUtil getBestCaptureSizeForEncodingSize:](VideoUtil, "getBestCaptureSizeForEncodingSize:");
  v10 = v9;
  v12 = v11;
  if ((VCVideoStream *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v25 = 136317186;
    v26 = v19;
    v27 = 2080;
    v28 = "-[VCVideoStream registerForCameraCaptureWithConfig:]";
    v29 = 1024;
    v30 = 2242;
    v31 = 2112;
    *(_QWORD *)v32 = v13;
    *(_WORD *)&v32[8] = 2048;
    v33 = self;
    *(_WORD *)v34 = 1024;
    *(_DWORD *)&v34[2] = v10;
    v35 = 1024;
    v36 = v12;
    v37 = 1024;
    v38 = v6;
    v39 = 1024;
    v40 = v8;
    v16 = "VCVideoStream [%s] %s:%d %@(%p) capture=%dx%d, encode=%dx%d";
    v17 = v20;
    v18 = 72;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136316674;
      v26 = v14;
      v27 = 2080;
      v28 = "-[VCVideoStream registerForCameraCaptureWithConfig:]";
      v29 = 1024;
      v30 = 2242;
      v31 = 1024;
      *(_DWORD *)v32 = v10;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v12;
      LOWORD(v33) = 1024;
      *(_DWORD *)((char *)&v33 + 2) = v6;
      HIWORD(v33) = 1024;
      *(_DWORD *)v34 = v8;
      v16 = "VCVideoStream [%s] %s:%d capture=%dx%d, encode=%dx%d";
      v17 = v15;
      v18 = 52;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v25, v18);
    }
  }
LABEL_12:

  v21 = [VCVideoRule alloc];
  *(float *)&v22 = (float)(unint64_t)objc_msgSend(a3, "framerate");
  self->_videoRule = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:](v21, "initWithFrameWidth:frameHeight:frameRate:", v6, v8, v22);
  v23 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerForVideoFramesFromSource:withClient:width:height:frameRate:", self->_captureSource, self, v10, v12, objc_msgSend(a3, "framerate"));
  if ((v23 & 1) == 0)
    -[VCVideoStream reportFailedToRegisterVideoFramesFromSource:width:height:frameRate:](self, "reportFailedToRegisterVideoFramesFromSource:width:height:frameRate:", self->_captureSource, v10, v12, objc_msgSend(a3, "framerate"));
  return v23;
}

- (BOOL)registerForVideoCapture
{
  VCMediaStreamConfig *v3;
  unint64_t type;
  BOOL result;
  id v6;
  char v7;
  int captureSource;

  v3 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  type = self->_type;
  result = 1;
  if (type <= 6)
  {
    if (((1 << type) & 0x66) != 0)
    {
      if (self->_captureSourceID)
      {
        objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerCaptureClientForScreenShare:", self);
      }
      else
      {
        v6 = -[VCVideoStream newScreenCaptureConfigForVideoConfig:](self, "newScreenCaptureConfigForVideoConfig:", v3);
        v7 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerForVideoFramesFromSource:sourceConfig:", self->_captureSource, v6);

        if ((v7 & 1) == 0)
        {
          -[VCVideoStream reportFailedToRegisterVideoFramesFromSource:width:height:frameRate:](self, "reportFailedToRegisterVideoFramesFromSource:width:height:frameRate:", self->_captureSource, self->_customWidth, self->_customHeight, -[VCMediaStreamConfig framerate](v3, "framerate"));
          result = 0;
          goto LABEL_13;
        }
      }
LABEL_12:
      result = 1;
      goto LABEL_13;
    }
    if (type)
    {
      if (type != 4)
        goto LABEL_13;
      captureSource = self->_captureSource;
      if (captureSource == 6)
      {
        objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerVideoSink:withCaptureSource:", self, self->_streamInputCaptureSource);
        goto LABEL_12;
      }
      if (captureSource != 3)
        goto LABEL_13;
    }
    result = -[VCVideoStream registerForCameraCaptureWithConfig:](self, "registerForCameraCaptureWithConfig:", v3);
  }
LABEL_13:
  atomic_store(result, (unsigned __int8 *)&self->_isVideoCaptureRegistered);
  return result;
}

- (void)collectImageQueuePerformanceMetrics:(__CFDictionary *)a3
{
  int Int32IfPresent;
  CFAllocatorRef *v6;
  int v7;
  CFNumberRef v8;
  int v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  const void *Value;
  uint64_t v15;
  NSObject *v16;
  VCImageQueue *remoteQueue;
  CFTypeRef cf;
  int v19;
  int v20;
  CFDictionaryRef theDict;
  int valuePtr;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  VCImageQueue *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  theDict = 0;
  -[VCImageQueue createAndCopyPerformanceDictionary:](self->_remoteQueue, "createAndCopyPerformanceDictionary:", &theDict);
  v20 = 0;
  Int32IfPresent = FigCFDictionaryGetInt32IfPresent();
  v6 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (Int32IfPresent)
  {
    v7 = v20 - self->_lastDisplayedFromImageQueueCount;
    valuePtr = v7;
    v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VIQDCnt"), v8);
    CFRelease(v8);
    self->_lastDisplayedFromImageQueueCount = v20;
  }
  else
  {
    v7 = 0;
  }
  v19 = 0;
  if (FigCFDictionaryGetInt32IfPresent())
  {
    v9 = v19 - self->_lastDroppedFromImageQueueCount;
    valuePtr = v9;
    v10 = CFNumberCreate(*v6, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VIQLCnt"), v10);
    CFRelease(v10);
    self->_lastDroppedFromImageQueueCount = v19;
  }
  else
  {
    v9 = 0;
  }
  cf = 0;
  -[VCImageQueue createAndCopyLatencyStatsDictionary:](self->_remoteQueue, "createAndCopyLatencyStatsDictionary:", &cf);
  if (cf)
  {
    if (FigCFDictionaryGetDoubleIfPresent())
    {
      valuePtr = (int)(0.0 * 1000.0);
      v11 = CFNumberCreate(*v6, kCFNumberIntType, &valuePtr);
      CFDictionaryAddValue(a3, CFSTR("VIQMinHEL"), v11);
      CFRelease(v11);
    }
    if (FigCFDictionaryGetDoubleIfPresent())
    {
      valuePtr = (int)(0.0 * 1000.0);
      v12 = CFNumberCreate(*v6, kCFNumberIntType, &valuePtr);
      CFDictionaryAddValue(a3, CFSTR("VIQMaxHEL"), v12);
      CFRelease(v12);
    }
    if (FigCFDictionaryGetDoubleIfPresent())
    {
      valuePtr = (int)(0.0 * 1000.0);
      v13 = CFNumberCreate(*v6, kCFNumberIntType, &valuePtr);
      CFDictionaryAddValue(a3, CFSTR("VIQAHEL"), v13);
      CFRelease(v13);
    }
    FigCFDictionaryGetIntIfPresent();
    if (cf)
      CFRelease(cf);
  }
  Value = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0CC6358]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      remoteQueue = self->_remoteQueue;
      valuePtr = 136317698;
      v23 = v15;
      v24 = 2080;
      v25 = "-[VCVideoStream collectImageQueuePerformanceMetrics:]";
      v26 = 1024;
      v27 = 2356;
      v28 = 2048;
      v29 = remoteQueue;
      v30 = 1024;
      v31 = v7;
      v32 = 1024;
      v33 = v9;
      v34 = 2048;
      v35 = 0;
      v36 = 2048;
      v37 = 0;
      v38 = 2048;
      v39 = 0;
      v40 = 1024;
      v41 = 0;
      v42 = 2112;
      v43 = Value;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCImageQueue[%p] Displayed=%d, Dropped=%d, MinPresentationLatency=%f, MaxPresentationLatency=%f, AvgPresentationLatency=%f, LatencySampleCount=%d, DisplayedCountHistogram:%@", (uint8_t *)&valuePtr, 0x60u);
    }
  }
  if (theDict)
    CFRelease(theDict);
}

- (void)setupReportingAgent
{
  uint64_t ReportingClientType;
  const void *Agent;
  int operatingMode;

  if (!-[VCObject reportingAgent](self, "reportingAgent"))
  {
    self->super._isReportingAgentOwner = 1;
    ReportingClientType = _VCVideoStream_GetReportingClientType(self);
    -[VCVideoStream getReportingServiceName](self, "getReportingServiceName");
    -[VCMediaStream applyClientSessionID:clientUserInfo:](self, "applyClientSessionID:clientUserInfo:", ReportingClientType, objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
    -[VCVideoStream getReportingClientName](self, "getReportingClientName");
    Agent = (const void *)reportingCreateAgent();
    -[VCObject setReportingAgent:](self, "setReportingAgent:", Agent);
    if (Agent)
      CFRelease(Agent);
    -[VCObject reportingAgent](self, "reportingAgent");
    self->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    -[VCObject reportingAgent](self, "reportingAgent");
    -[VCVideoStream getReportingClientName](self, "getReportingClientName");
    -[VCVideoStream getClientSpecificUserInfo](self, "getClientSpecificUserInfo");
    reportingSetUserInfo();
  }
  if (+[VCVideoStream shouldRegisterReportingForStreamType:](VCVideoStream, "shouldRegisterReportingForStreamType:", self->_type))
  {
    -[VCObject reportingAgent](self, "reportingAgent");
    reportingRegisterPeriodicTaskWeak();
  }
  operatingMode = self->super._operatingMode;
  if (operatingMode != 1 && operatingMode != 6)
    -[VCMediaStream registerAggregationHandlers](self, "registerAggregationHandlers");
}

void __36__VCVideoStream_setupReportingAgent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "strong");
    v3 = objc_opt_class();
    if (v3 == objc_msgSend(*(id *)(a1 + 32), "strong"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __36__VCVideoStream_setupReportingAgent__block_invoke_cold_1();
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "strong");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v7 = objc_msgSend(*(id *)(a1 + 32), "strong");
          v8 = 136316162;
          v9 = v5;
          v10 = 2080;
          v11 = "-[VCVideoStream setupReportingAgent]_block_invoke";
          v12 = 1024;
          v13 = 2384;
          v14 = 2112;
          v15 = v4;
          v16 = 2048;
          v17 = v7;
          _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) RTCReporting: can't configure the reporting agent.", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
}

uint64_t __36__VCVideoStream_setupReportingAgent__block_invoke_166(uint64_t a1, void *a2, uint64_t a3)
{
  VCMediaStream_Lock((uint64_t)a2);
  if (objc_msgSend(a2, "state") == 2)
    objc_msgSend(a2, "gatherRealtimeStats:", a3);
  return VCMediaStream_Unlock((uint64_t)a2);
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  uint64_t v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;

  if (a3)
  {
    -[VCObject reportingAgent](self, "reportingAgent");
    v5 = selectDestinationForRTMetrics();
    -[VCVideoStream collectImageQueuePerformanceMetrics:](self, "collectImageQueuePerformanceMetrics:", v5);
    -[VCMediaStream collectChannelSequenceMetrics:](self, "collectChannelSequenceMetrics:", v5);
    v6 = (const __CFDictionary *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyReportingStatsForCaptureSource:", self->_streamInputCaptureSource);
    if (v6)
    {
      v7 = v6;
      VCUtil_AppendFromDictionary(a3, v6);
      CFRelease(v7);
    }
  }
}

- (unsigned)networkMTU
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
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->super._transportSetupInfo.setupType == 5)
    return -[VCTransportSession networkMTU](self->super._transportSession, "networkMTU");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoStream networkMTU]";
      v9 = 1024;
      v10 = 2429;
      v11 = 1024;
      v12 = 1280;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Cannot determine MTU. Returning minMTU=%d as a fallback", (uint8_t *)&v5, 0x22u);
    }
  }
  return 1280;
}

- (BOOL)isTransportIPv6
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->super._transportSetupInfo.setupType == 5)
    return -[VCTransportSession isIPv6](self->super._transportSession, "isIPv6");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoStream isTransportIPv6]";
      v9 = 1024;
      v10 = 2437;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Cannot determine isIPv6. Returning YES as a fallback", (uint8_t *)&v5, 0x1Cu);
    }
  }
  return 1;
}

- (void)setupInternalRedundancyControllerWithStreamConfig:(id)a3
{
  VCRedundancyControllerVideo *redundancyController;
  VCRedundancyControllerVideo *v6;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  VCRedundancyControllerVideo *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  VCRedundancyControllerVideo *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  redundancyController = self->_redundancyController;
  if (redundancyController)
    goto LABEL_7;
  v6 = -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]([VCRedundancyControllerVideo alloc], "initWithDelegate:mode:parameters:", self, objc_msgSend(a3, "redundancyControllerMode"), 0, objc_msgSend(a3, "maxRedundancyPercentage") | (unint64_t)(objc_msgSend(a3, "redundancyControllerFECVersion") << 40) | 0xAAAA000100000000);
  self->_redundancyController = v6;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_redundancyController;
        v11 = 136315906;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCVideoStream setupInternalRedundancyControllerWithStreamConfig:]";
        v15 = 1024;
        v16 = 2456;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Set up and using internal redundancy controller=%@", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStream setupInternalRedundancyControllerWithStreamConfig:].cold.1();
  }
  redundancyController = self->_redundancyController;
  if (redundancyController)
LABEL_7:
    objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "setStatisticsCollector:", -[VCRedundancyControllerVideo statisticsCollector](redundancyController, "statisticsCollector"));
}

- (void)onStartWithCompletionHandler:(id)a3
{
  VCMediaStreamConfig *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  VCMediaStreamConfig *v13;
  const __CFAllocator *v14;
  __CFDictionary *Mutable;
  CFNumberRef v16;
  CFNumberRef v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  VCVideoStream *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  self->_lastDecodedVideoFrameTime = 0.0;
  _VCVideoStream_CacheRemoteVideoFrame((uint64_t)self, 0);
  -[VCVideoStream destroyVideoModules](self, "destroyVideoModules");
  if (self->super._operatingMode == 6)
  {
    if ((self->_reportingModuleID + 1) <= 1)
    {
      -[VCObject reportingAgent](self, "reportingAgent");
      self->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
      -[VCObject reportingAgent](self, "reportingAgent");
      -[VCVideoStream getReportingServiceName](self, "getReportingServiceName");
      -[VCVideoStream getClientSpecificUserInfo](self, "getClientSpecificUserInfo");
      reportingCacheModuleSpecificInfo();
    }
  }
  else
  {
    -[VCVideoStream setupReportingAgent](self, "setupReportingAgent");
  }
  self->_reportingDefaultRealtimePeriod = reportingDefaultRealtimePeriod();
  v5 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  if (-[VCVideoStream isLowLatencyStreamType](self, "isLowLatencyStreamType"))
    -[VCMediaStreamConfig setRecommendedMTU:](v5, "setRecommendedMTU:", -[VCVideoStream networkMTU](self, "networkMTU"));
  v6 = -[VCMediaStreamConfig recommendedMTU](v5, "recommendedMTU");
  if (v6 >= 0x5AA)
    v7 = 1450;
  else
    v7 = v6;
  -[VCMediaStreamConfig setRecommendedMTU:](v5, "setRecommendedMTU:", v7);
  -[VCVideoStream startRateAdaptationWithStreamConfig:](self, "startRateAdaptationWithStreamConfig:", v5);
  if (!-[VCMediaStream isSendingMedia](self, "isSendingMedia"))
    goto LABEL_14;
  -[VCVideoStream initVideoTransmitter](self, "initVideoTransmitter");
  if (!-[VCMediaStreamConfig resetSendRTPTimestampOnStop](v5, "resetSendRTPTimestampOnStop"))
  {
    v18 = *(_OWORD *)(&self->_isTemporalScalingEnabled + 2);
    v19 = *(_QWORD *)&self->_lastSentFrameHostTimeBeforeStop.flags;
    -[VCVideoTransmitterBase setLastFrameTime:](self->_videoTransmitter, "setLastFrameTime:", &v18);
    -[VCVideoTransmitterBase setLastRTPTimestamp:](self->_videoTransmitter, "setLastRTPTimestamp:", HIDWORD(self->_lastSentFrameHostTimeBeforeStop.epoch));
  }
  -[VCVideoTransmitterBase startVideo](self->_videoTransmitter, "startVideo");
  if (!-[VCVideoStream registerForVideoCapture](self, "registerForVideoCapture"))
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v20, 32016, 109, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStream.m", 2510), CFSTR("Screen capture failed"), CFSTR("Screen capture is busy or not permitted"));
    v8 = 0;
  }
  else
  {
LABEL_14:
    v8 = 1;
  }
  if (self->_type)
    v9 = -[VCVideoTransmitterBase videoTransmitterHandle](self->_videoTransmitter, "videoTransmitterHandle");
  else
    v9 = 0xFFFFFFFFLL;
  -[VCVideoStream setupVideoReceiver:withTransmitterHandle:](self, "setupVideoReceiver:withTransmitterHandle:", v5, v9);
  -[VCVideoStream updateVideoReceiver:](self, "updateVideoReceiver:", v5);
  if (-[VCMediaStreamConfig syncSource](v5, "syncSource"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = -[VCMediaStreamConfig syncSource](v5, "syncSource");
        *(_DWORD *)buf = 136316162;
        v22 = v10;
        v23 = 2080;
        v24 = "-[VCVideoStream onStartWithCompletionHandler:]";
        v25 = 1024;
        v26 = 2525;
        v27 = 2048;
        v28 = self;
        v29 = 2048;
        v30 = v12;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]: Starting synchronization using syncSource=%p", buf, 0x30u);
      }
    }
    -[VCVideoStream startSynchronization:](self, "startSynchronization:", -[VCMediaStreamConfig syncSource](v5, "syncSource"));
  }
  -[VCVideoReceiverBase startVideo](self->_videoReceiver, "startVideo");
  if (-[VCVideoStream isScreenConfig:](self, "isScreenConfig:", v5))
    -[VCImageQueue stop](self->_remoteQueue, "stop");
  -[VCImageQueue start](self->_remoteQueue, "start");
  if (self->super._operatingMode != 6)
  {
    -[VCObject reportingAgent](self, "reportingAgent");
    reportingStartTimer();
  }
  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 201, 0, 0);
  v13 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  if (-[VCMediaStreamConfig type](v13, "type") == 5
    && ((-[VCMediaStreamConfig fecEnabled](v13, "fecEnabled") & 1) != 0
     || -[VCMediaStreamConfig rtxEnabled](v13, "rtxEnabled")))
  {
    v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (-[VCMediaStreamConfig fecEnabled](v13, "fecEnabled"))
    {
      *(_DWORD *)buf = -[VCMediaStreamConfig fecEnabled](v13, "fecEnabled");
      v16 = CFNumberCreate(v14, kCFNumberIntType, buf);
      CFDictionaryAddValue(Mutable, CFSTR("FecRDKScreenSharing"), v16);
      CFRelease(v16);
    }
    if (-[VCMediaStreamConfig rtxEnabled](v13, "rtxEnabled"))
    {
      *(_DWORD *)buf = -[VCMediaStreamConfig rtxEnabled](v13, "rtxEnabled");
      v17 = CFNumberCreate(v14, kCFNumberIntType, buf);
      CFDictionaryAddValue(Mutable, CFSTR("RtxRDKScreenSharing"), v17);
      CFRelease(v17);
    }
    reportingFeatureConfigEvent();
    CFRelease(Mutable);
  }
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v8, v20);
}

- (void)onStopWithCompletionHandler:(id)a3
{
  VCMediaStreamConfig *v5;
  uint64_t v6;
  NSObject *v7;
  int operatingMode;
  VCVideoTransmitterBase *videoTransmitter;
  _BYTE v11[24];
  int v12;
  __int16 v13;
  VCVideoStream *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  if (-[VCMediaStreamConfig syncSource](v5, "syncSource"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136316162;
        *(_QWORD *)&v11[4] = v6;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCVideoStream onStopWithCompletionHandler:]";
        *(_WORD *)&v11[22] = 1024;
        v12 = 2552;
        v13 = 2048;
        v14 = self;
        v15 = 2048;
        v16 = -[VCMediaStreamConfig syncSource](v5, "syncSource");
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]: Stopping synchronization using syncSource=%p", v11, 0x30u);
      }
    }
    -[VCVideoStream stopSynchronization](self, "stopSynchronization");
  }
  if (-[VCMediaStream shouldStopReportingTimer](self, "shouldStopReportingTimer"))
  {
    -[VCObject reportingAgent](self, "reportingAgent");
    reportingStopTimer();
  }
  if (+[VCVideoStream shouldRegisterReportingForStreamType:](VCVideoStream, "shouldRegisterReportingForStreamType:", self->_type))
  {
    -[VCObject reportingAgent](self, "reportingAgent");
    reportingUnregisterPeriodicTask();
  }
  operatingMode = self->super._operatingMode;
  if (operatingMode != 1 && operatingMode != 6)
    -[VCMediaStream deregisterAggregationHandlers](self, "deregisterAggregationHandlers");
  _VCVideoStream_ReportingAlgosVideoStreamEvent(self);
  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 202, 0, 0);
  if ((-[VCMediaStreamConfig resetSendRTPTimestampOnStop](v5, "resetSendRTPTimestampOnStop") & 1) == 0)
  {
    videoTransmitter = self->_videoTransmitter;
    if (videoTransmitter)
      -[VCVideoTransmitterBase lastFrameTime](videoTransmitter, "lastFrameTime");
    else
      memset(v11, 0, sizeof(v11));
    *(_OWORD *)(&self->_isTemporalScalingEnabled + 2) = *(_OWORD *)v11;
    *(_QWORD *)&self->_lastSentFrameHostTimeBeforeStop.flags = *(_QWORD *)&v11[16];
    HIDWORD(self->_lastSentFrameHostTimeBeforeStop.epoch) = -[VCVideoTransmitterBase lastRTPTimestamp](self->_videoTransmitter, "lastRTPTimestamp", *(_OWORD *)v11, *(_QWORD *)&v11[16]);
  }
  VCMediaStream_Unlock((uint64_t)self);
  -[VCVideoStream destroyVideoModules](self, "destroyVideoModules");
  _VCVideoStream_CacheRemoteVideoFrame((uint64_t)self, 0);
  -[VCVideoStream resetRemoteMediaStalled](self, "resetRemoteMediaStalled");
  VCMediaStream_Lock((uint64_t)self);
  if (-[VCMediaStream isSendingMedia](self, "isSendingMedia")
    && (self->_type != 3
     || -[VCVideoStream isScreenConfig:](self, "isScreenConfig:", -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"))))
  {
    -[VCVideoStream deregisterForVideoCapture](self, "deregisterForVideoCapture");
  }
  -[VCImageQueue pause](self->_remoteQueue, "pause");
  -[VCVideoStream stopRateAdaptation](self, "stopRateAdaptation");
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)onPauseWithCompletionHandler:(id)a3
{
  VCMediaStreamConfig *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  VCVideoStream *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_type == 2)
  {
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "setPauseCapture:", 1);
  }
  else
  {
    v5 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
    if (-[VCMediaStreamConfig syncSource](v5, "syncSource"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136316162;
          v9 = v6;
          v10 = 2080;
          v11 = "-[VCVideoStream onPauseWithCompletionHandler:]";
          v12 = 1024;
          v13 = 2610;
          v14 = 2048;
          v15 = self;
          v16 = 2048;
          v17 = -[VCMediaStreamConfig syncSource](v5, "syncSource");
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]: Stopping synchronization using syncSource=%p", (uint8_t *)&v8, 0x30u);
        }
      }
      -[VCVideoStream stopSynchronization](self, "stopSynchronization");
    }
    -[VCVideoTransmitterBase stopVideo](self->_videoTransmitter, "stopVideo");
    -[VCImageQueue pause](self->_remoteQueue, "pause");
    if (-[VCImageQueue usingRemoteQueue](self->_remoteQueue, "usingRemoteQueue"))
      objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteVideoDidPause:streamToken:", 1, -[VCImageQueue streamToken](self->_remoteQueue, "streamToken"));
  }
  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 3, 0, 0);
  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 203, 0, 0);
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)onResumeWithCompletionHandler:(id)a3
{
  VCMediaStreamConfig *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  VCVideoStream *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_lastDecodedVideoFrameTime = 0.0;
  if (self->_type == 2)
  {
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "setPauseCapture:", 0);
  }
  else
  {
    v5 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
    if (-[VCMediaStreamConfig syncSource](v5, "syncSource"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136316162;
          v9 = v6;
          v10 = 2080;
          v11 = "-[VCVideoStream onResumeWithCompletionHandler:]";
          v12 = 1024;
          v13 = 2639;
          v14 = 2048;
          v15 = self;
          v16 = 2048;
          v17 = -[VCMediaStreamConfig syncSource](v5, "syncSource");
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]: Starting synchronization using syncSource=%p", (uint8_t *)&v8, 0x30u);
        }
      }
      -[VCVideoStream startSynchronization:](self, "startSynchronization:", -[VCMediaStreamConfig syncSource](v5, "syncSource"));
    }
    -[VCVideoTransmitterBase startVideo](self->_videoTransmitter, "startVideo");
    -[VCImageQueue start](self->_remoteQueue, "start");
    if (-[VCImageQueue usingRemoteQueue](self->_remoteQueue, "usingRemoteQueue"))
      objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteVideoDidPause:streamToken:", 0, -[VCImageQueue streamToken](self->_remoteQueue, "streamToken"));
    _VCVideoStream_ReportingAlgosVideoStreamEvent(self);
    _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 204, 0, 0);
  }
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)onRTPTimeout
{
  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 213, 0, 0);
}

- (void)onRTCPTimeout
{
  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 214, 0, 0);
}

- (void)onSendRTCPPacket
{
  VCMediaStreamTransport *v3;
  uint64_t v4;
  _OWORD v5[10];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = -[VCMediaStream defaultTransport](self, "defaultTransport");
  v4 = -[VCMediaStreamTransport streamDirection](v3, "streamDirection");
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 1 && -[VCMediaStreamTransport isRTCPEnabled](v3, "isRTCPEnabled"))
  {
    v6 = 0;
    memset(v5, 0, sizeof(v5));
    -[VCMediaStream sendControlPacketWithParameters:](self, "sendControlPacketWithParameters:", v5);
  }
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    -[VCVideoReceiverBase rtcpSendIntervalElapsed](self->_videoReceiver, "rtcpSendIntervalElapsed");
}

- (double)rtcpHeartbeatLeeway
{
  return 0.001;
}

- (unsigned)getMaxTemporalBitrateForStreamIDs:(id)a3
{
  NSMutableArray *transportArray;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  VCVideoStream *v31;
  __int16 v32;
  unsigned int v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  transportArray = self->super._transportArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(transportArray);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "idsStreamId");
        if (objc_msgSend((id)objc_msgSend(a3, "firstObject"), "unsignedIntegerValue") == v12)
          v8 = objc_msgSend((id)objc_msgSend(v11, "streamConfig"), "txMaxBitrate");
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315906;
        v23 = v14;
        v24 = 2080;
        v25 = "-[VCVideoStream getMaxTemporalBitrateForStreamIDs:]";
        v26 = 1024;
        v27 = 2697;
        v28 = 1024;
        LODWORD(v29) = v8;
        v16 = "VCVideoStream [%s] %s:%d Max temporal bitrate=%d";
        v17 = v15;
        v18 = 34;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, v18);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136316418;
        v23 = v19;
        v24 = 2080;
        v25 = "-[VCVideoStream getMaxTemporalBitrateForStreamIDs:]";
        v26 = 1024;
        v27 = 2697;
        v28 = 2112;
        v29 = v13;
        v30 = 2048;
        v31 = self;
        v32 = 1024;
        v33 = v8;
        v16 = "VCVideoStream [%s] %s:%d %@(%p) Max temporal bitrate=%d";
        v17 = v20;
        v18 = 54;
        goto LABEL_22;
      }
    }
  }
  return v8;
}

- (void)setTransmitterStreamIDs:(id)a3 repairStreamIDs:(id)a4
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  NSMutableArray *transportArray;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  uint64_t v17;
  char v18;
  unsigned __int8 v19;
  VCVideoStream *v20;
  char *v21;
  unsigned __int16 v22;
  const __CFString *v23;
  unsigned __int16 v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  NSObject *v28;
  unsigned __int16 v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  char *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  os_log_t v37;
  char *v38;
  char *v39;
  VCVideoStream *v40;
  VCMediaStreamConfig *v41;
  int v42;
  os_log_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  _WORD v49[10];
  int v50;
  __int16 v51;
  int v52;
  _BYTE v53[128];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_msgSend(a3, "count");
  v9 = (2 * v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = (char *)&v34 - v9;
  if (v8)
    memset((char *)&v34 - v9, 170, 2 * v8);
  v38 = v10;
  v40 = self;
  v41 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  if (-[VCMediaStreamConfig temporalScalingEnabled](v41, "temporalScalingEnabled"))
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    transportArray = v40->super._transportArray;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v55 != v14)
            objc_enumerationMutation(transportArray);
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "idsStreamId")));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
      }
      while (v13);
    }
  }
  if ((int)objc_msgSend(a3, "count") >= 1)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v39 = sel_logPrefix;
    *(_QWORD *)&v16 = 136316162;
    v34 = v16;
    *(_QWORD *)&v16 = 136316674;
    v35 = v16;
    v20 = v40;
    v21 = v38;
    while (1)
    {
      v22 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v17, (_QWORD)v34, *((_QWORD *)&v34 + 1)), "unsignedIntegerValue");
      if (!-[VCMediaStreamConfig temporalScalingEnabled](v41, "temporalScalingEnabled")
        || !objc_msgSend(v7, "containsObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", v17)))
      {
        goto LABEL_28;
      }
      if ((v18 & 1) == 0)
        break;
      v18 = 1;
LABEL_29:
      if (++v17 >= (int)objc_msgSend(a3, "count"))
        goto LABEL_32;
    }
    if ((VCVideoStream *)objc_opt_class() == v20)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_27;
      v37 = (os_log_t)VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      v29 = objc_msgSend((id)objc_msgSend(v7, "firstObject"), "unsignedIntegerValue");
      v42 = v34;
      v43 = v37;
      v44 = 2080;
      v45 = "-[VCVideoStream setTransmitterStreamIDs:repairStreamIDs:]";
      v46 = 1024;
      v47 = 2721;
      v48 = 1024;
      *(_DWORD *)v49 = v22;
      v21 = v38;
      v49[2] = 1024;
      *(_DWORD *)&v49[3] = v29;
      v25 = v28;
      v26 = "VCVideoStream [%s] %s:%d Replacing temporal streamID=%d->%d";
      v27 = 40;
    }
    else
    {
      v23 = &stru_1E9E58EE0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = (const __CFString *)-[VCVideoStream performSelector:](v20, "performSelector:", v39);
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_27;
      v36 = VRTraceErrorLogLevelToCSTR();
      v37 = (os_log_t)*MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      v24 = objc_msgSend((id)objc_msgSend(v7, "firstObject"), "unsignedIntegerValue");
      v42 = v35;
      v43 = (os_log_t)v36;
      v44 = 2080;
      v45 = "-[VCVideoStream setTransmitterStreamIDs:repairStreamIDs:]";
      v46 = 1024;
      v47 = 2721;
      v48 = 2112;
      *(_QWORD *)v49 = v23;
      v49[4] = 2048;
      *(_QWORD *)&v49[5] = v20;
      v49[9] = 1024;
      v50 = v22;
      v25 = v37;
      v21 = v38;
      v51 = 1024;
      v52 = v24;
      v26 = "VCVideoStream [%s] %s:%d %@(%p) Replacing temporal streamID=%d->%d";
      v27 = 60;
    }
    _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v42, v27);
LABEL_27:
    v22 = objc_msgSend((id)objc_msgSend(v7, "firstObject"), "unsignedIntegerValue");
    v18 = 1;
LABEL_28:
    *(_WORD *)&v21[2 * v19++] = v22;
    goto LABEL_29;
  }
  v19 = 0;
  v21 = v38;
LABEL_32:
  v30 = objc_msgSend(a4, "count");
  v31 = v30;
  v32 = (char *)&v34 - ((2 * v30 + 15) & 0x3F0);
  if (v30)
    memset((char *)&v34 - ((2 * v30 + 15) & 0x3F0), 170, 2 * v30);
  if ((int)objc_msgSend(a4, "count") >= 1)
  {
    v33 = 0;
    do
    {
      *(_WORD *)&v32[2 * v33] = objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v33), "unsignedIntegerValue");
      ++v33;
    }
    while (v33 < (int)objc_msgSend(a4, "count"));
  }
  -[VCVideoTransmitterBase setStreamIDs:numOfStreamIDs:repairedStreamIDs:numOfRepairedStreamIDs:](v40->_videoTransmitter, "setStreamIDs:numOfStreamIDs:repairedStreamIDs:numOfRepairedStreamIDs:", v21, v19, v32, v31);

}

- (void)setStreamIDs:(id)a3 repairStreamIDs:(id)a4
{
  __CFString *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  char *v11;
  os_log_t *v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  os_log_t *v16;
  uint64_t v17;
  NSObject *v18;
  __CFString *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  char *v23;
  os_log_t *v24;
  uint64_t v25;
  NSObject *v26;
  char *v27;
  os_log_t *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  id v32;
  NSMutableArray *transportArray;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  VCMediaStreamConfig *v45;
  char *__lasts;
  char *__str;
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  char *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v45 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  v44 = a4;
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v8 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s", v8);
      if (__str)
      {
        v42 = a3;
        __lasts = 0;
        v15 = strtok_r(__str, "\n", &__lasts);
        v16 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v17 = VRTraceErrorLogLevelToCSTR();
            v18 = *v16;
            if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v54 = v17;
              v55 = 2080;
              v56 = "-[VCVideoStream setStreamIDs:repairStreamIDs:]";
              v57 = 1024;
              v58 = 2741;
              v59 = 2080;
              v60 = "streamIDs=";
              v61 = 2080;
              v62 = v15;
              _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v15 = strtok_r(0, "\n", &__lasts);
        }
        while (v15);
        goto LABEL_26;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (__CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v9 = (const char *)-[__CFString UTF8String](v7, "UTF8String");
      v10 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) %s", v9, self, v10);
      if (__str)
      {
        v42 = a3;
        __lasts = 0;
        v11 = strtok_r(__str, "\n", &__lasts);
        v12 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *v12;
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v54 = v13;
              v55 = 2080;
              v56 = "-[VCVideoStream setStreamIDs:repairStreamIDs:]";
              v57 = 1024;
              v58 = 2741;
              v59 = 2080;
              v60 = "streamIDs=";
              v61 = 2080;
              v62 = v11;
              _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v11 = strtok_r(0, "\n", &__lasts);
        }
        while (v11);
LABEL_26:
        free(__str);
        a3 = v42;
      }
    }
  }
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v43 = a3;
      if (a4)
        v20 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      else
        v20 = "<nil>";
      asprintf(&__str, "%s", v20);
      if (!__str)
        goto LABEL_53;
      __lasts = 0;
      v27 = strtok_r(__str, "\n", &__lasts);
      v28 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v29 = VRTraceErrorLogLevelToCSTR();
          v30 = *v28;
          if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v54 = v29;
            v55 = 2080;
            v56 = "-[VCVideoStream setStreamIDs:repairStreamIDs:]";
            v57 = 1024;
            v58 = 2742;
            v59 = 2080;
            v60 = "repairStreamIDs=";
            v61 = 2080;
            v62 = v27;
            _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v27 = strtok_r(0, "\n", &__lasts);
      }
      while (v27);
      goto LABEL_52;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (__CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v21 = (const char *)-[__CFString UTF8String](v19, "UTF8String");
      v43 = a3;
      if (a4)
        v22 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      else
        v22 = "<nil>";
      asprintf(&__str, "%s(%p) %s", v21, self, v22);
      if (!__str)
        goto LABEL_53;
      __lasts = 0;
      v23 = strtok_r(__str, "\n", &__lasts);
      v24 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v25 = VRTraceErrorLogLevelToCSTR();
          v26 = *v24;
          if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v54 = v25;
            v55 = 2080;
            v56 = "-[VCVideoStream setStreamIDs:repairStreamIDs:]";
            v57 = 1024;
            v58 = 2742;
            v59 = 2080;
            v60 = "repairStreamIDs=";
            v61 = 2080;
            v62 = v23;
            _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v23 = strtok_r(0, "\n", &__lasts);
      }
      while (v23);
LABEL_52:
      free(__str);
LABEL_53:
      a3 = v43;
    }
  }
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = a3;
  objc_msgSend(v31, "addObjectsFromArray:", a3);
  objc_msgSend(v31, "addObjectsFromArray:", a4);
  if (-[VCMediaStreamConfig temporalScalingEnabled](v45, "temporalScalingEnabled"))
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    transportArray = self->super._transportArray;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v50 != v36)
            objc_enumerationMutation(transportArray);
          v38 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if ((objc_msgSend(v31, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v38, "idsStreamId"))) & 1) == 0)objc_msgSend(v31, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v38, "idsStreamId")));
        }
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
      }
      while (v35);
    }
  }
  -[VCVideoStream setupCompoundStreamIDsWithStreamIDs:](self, "setupCompoundStreamIDsWithStreamIDs:", v31);

  if (-[VCMediaStreamConfig temporalScalingEnabled](v45, "temporalScalingEnabled"))
  {
    v39 = -[VCVideoStream getMaxTemporalBitrateForStreamIDs:](self, "getMaxTemporalBitrateForStreamIDs:", v32);
    v40 = -[VCVideoTransmitterBase targetBitrate](self->_videoTransmitter, "targetBitrate");
    if (v39 >= v40)
      v41 = v40;
    else
      v41 = v39;
    -[VCVideoTransmitterBase setTargetBitrate:](self->_videoTransmitter, "setTargetBitrate:", v41);
  }
  -[VCVideoStream setTransmitterStreamIDs:repairStreamIDs:](self, "setTransmitterStreamIDs:repairStreamIDs:", v32, v44);
}

- (void)setPeerSubscribedStreamIDs:(id)a3
{
  VCMediaStreamConfig *v5;
  NSMutableArray *transportArray;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int j;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  uint64_t v35;
  NSObject *v36;
  VCVideoStream *v37;
  id *v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  v37 = self;
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[VCMediaStreamConfig temporalScalingEnabled](v5, "temporalScalingEnabled")
    && (v57 = 0u,
        v58 = 0u,
        v55 = 0u,
        v56 = 0u,
        transportArray = self->super._transportArray,
        (v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v55, v54, 16)) != 0))
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(transportArray);
        v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (objc_msgSend(a3, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v13, "idsStreamId", v37))))
        {
          v14 = (void *)objc_msgSend(v13, "streamConfig");
          objc_msgSend(v39, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "txMaxBitrate")));
          v10 = objc_msgSend(v14, "txMaxBitrate");
          v9 = objc_msgSend((id)objc_msgSend(v14, "multiwayConfig"), "qualityIndex");
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  for (j = objc_msgSend(v39, "count", v37); j < (int)objc_msgSend(v38[68], "count"); ++j)
    objc_msgSend(v39, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10));
  v16 = objc_msgSend(v39, "count");
  if (v16 != objc_msgSend(v38[68], "count"))
  {
    if ((id *)objc_opt_class() == v38)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_msgSend(v39, "count");
          v21 = objc_msgSend(v38[68], "count");
          *(_DWORD *)buf = 136316162;
          v41 = v18;
          v42 = 2080;
          v43 = "-[VCVideoStream setPeerSubscribedStreamIDs:]";
          v44 = 1024;
          v45 = 2794;
          v46 = 2048;
          v47 = v20;
          v48 = 2048;
          v49 = v21;
          v22 = "VCVideoStream [%s] %s:%d Bitrate array size (%lu) does not match transport array size (%lu)";
          v23 = v19;
          v24 = 48;
LABEL_26:
          _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)objc_msgSend(v38, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v27 = objc_msgSend(v39, "count");
          v28 = objc_msgSend(v38[68], "count");
          *(_DWORD *)buf = 136316674;
          v41 = v25;
          v42 = 2080;
          v43 = "-[VCVideoStream setPeerSubscribedStreamIDs:]";
          v44 = 1024;
          v45 = 2794;
          v46 = 2112;
          v47 = (uint64_t)v17;
          v48 = 2048;
          v49 = (uint64_t)v38;
          v50 = 2048;
          v51 = v27;
          v52 = 2048;
          v53 = v28;
          v22 = "VCVideoStream [%s] %s:%d %@(%p) Bitrate array size (%lu) does not match transport array size (%lu)";
          v23 = v26;
          v24 = 68;
          goto LABEL_26;
        }
      }
    }
  }
  objc_msgSend(v38[106], "setTemporalBitrateArray:", v39);
  objc_msgSend(v38[106], "setHighestActiveQualityIndex:", v9);
  if ((id *)objc_opt_class() == v38)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_38;
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_38;
    *(_DWORD *)buf = 136315906;
    v41 = v30;
    v42 = 2080;
    v43 = "-[VCVideoStream setPeerSubscribedStreamIDs:]";
    v44 = 1024;
    v45 = 2800;
    v46 = 2112;
    v47 = (uint64_t)v39;
    v32 = "VCVideoStream [%s] %s:%d Setting temporal stream bitrate array to %@";
    v33 = v31;
    v34 = 38;
    goto LABEL_37;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v29 = (const __CFString *)objc_msgSend(v38, "performSelector:", sel_logPrefix);
  else
    v29 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v35 = VRTraceErrorLogLevelToCSTR();
    v36 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v41 = v35;
      v42 = 2080;
      v43 = "-[VCVideoStream setPeerSubscribedStreamIDs:]";
      v44 = 1024;
      v45 = 2800;
      v46 = 2112;
      v47 = (uint64_t)v29;
      v48 = 2048;
      v49 = (uint64_t)v38;
      v50 = 2112;
      v51 = (uint64_t)v39;
      v32 = "VCVideoStream [%s] %s:%d %@(%p) Setting temporal stream bitrate array to %@";
      v33 = v36;
      v34 = 58;
LABEL_37:
      _os_log_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
    }
  }
LABEL_38:
  if (v39)
    CFRelease(v39);
}

- (double)lastSentAudioHostTime
{
  double result;

  -[VCVideoTransmitterBase lastSentAudioHostTime](self->_videoTransmitter, "lastSentAudioHostTime");
  return result;
}

- (unsigned)lastSentAudioSampleTime
{
  return -[VCVideoTransmitterBase lastSentAudioSampleTime](self->_videoTransmitter, "lastSentAudioSampleTime");
}

- (void)setLastSentAudioHostTime:(double)a3
{
  -[VCVideoTransmitterBase setLastSentAudioHostTime:](self->_videoTransmitter, "setLastSentAudioHostTime:", a3);
}

- (void)setLastSentAudioSampleTime:(unsigned int)a3
{
  -[VCVideoTransmitterBase setLastSentAudioSampleTime:](self->_videoTransmitter, "setLastSentAudioSampleTime:", *(_QWORD *)&a3);
}

- (void)setIsServerBasedBandwidthProbingEnabled:(BOOL)a3
{
  self->_isServerBasedBandwidthProbingEnabled = a3;
  -[VCVideoTransmitterBase setIsServerBasedBandwidthProbingEnabled:](self->_videoTransmitter, "setIsServerBasedBandwidthProbingEnabled:");
}

- (void)setIsEndToEndBasedBandwidthProbingEnabled:(BOOL)a3
{
  self->_isEndToEndBasedBandwidthProbingEnabled = a3;
  -[VCVideoTransmitterBase setIsEndToEndBasedBandwidthProbingEnabled:](self->_videoTransmitter, "setIsEndToEndBasedBandwidthProbingEnabled:");
}

- (void)setTargetEncoderBitrate:(unsigned int)a3
{
  -[VCVideoTransmitterBase setTargetBitrate:](self->_videoTransmitter, "setTargetBitrate:", *(_QWORD *)&a3);
}

- (unsigned)targetEncoderBitrate
{
  return -[VCVideoTransmitterBase targetBitrate](self->_videoTransmitter, "targetBitrate");
}

- (void)setTargetBitrateChangeCounter:(unsigned int)a3
{
  -[VCVideoTransmitterBase setTargetBitrateChangeCounter:](self->_videoTransmitter, "setTargetBitrateChangeCounter:", *(_QWORD *)&a3);
}

- (unsigned)targetBitrateChangeCounter
{
  return -[VCVideoTransmitterBase targetBitrateChangeCounter](self->_videoTransmitter, "targetBitrateChangeCounter");
}

- (void)handleVTPSendFailedWithData:(void *)a3
{
  if (a3)
  {
    -[VCVideoStream handleNWConnectionPacketEvent:eventType:](self, "handleNWConnectionPacketEvent:eventType:", a3, 2);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStream handleVTPSendFailedWithData:].cold.1();
  }
}

- (void)setVideoStreamDelegate:(id)a3 delegateFunctions:(const tagVCVideoStreamDelegateRealtimeInstanceVTable *)a4
{
  void *remoteScreenAttributesDidChange;
  NSObject *delegateNotificationQueue;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    remoteScreenAttributesDidChange = a4->remoteScreenAttributesDidChange;
    delegateNotificationQueue = self->super._delegateNotificationQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__VCVideoStream_setVideoStreamDelegate_delegateFunctions___block_invoke;
    v6[3] = &unk_1E9E53820;
    v6[4] = self;
    v6[5] = a3;
    v6[6] = remoteScreenAttributesDidChange;
    dispatch_async(delegateNotificationQueue, v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStream setVideoStreamDelegate:delegateFunctions:].cold.1();
  }
}

_QWORD *__58__VCVideoStream_setVideoStreamDelegate_delegateFunctions___block_invoke(_QWORD *result)
{
  *(_QWORD *)(result[4] + 1112) = result[5];
  *(_QWORD *)(result[4] + 1120) = result[6];
  return result;
}

- (void)setDidReceiveFirstFrame:(BOOL)a3
{
  VCMediaStream_Lock((uint64_t)self);
  if (!a3)
    objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "resetDidReceiveFirstFrameForStreamToken:", self->super._streamToken);
  self->_didReceiveFirstFrame = a3;
  VCMediaStream_Unlock((uint64_t)self);
}

- (BOOL)didReceiveFirstFrame
{
  BOOL didReceiveFirstFrame;

  VCMediaStream_Lock((uint64_t)self);
  didReceiveFirstFrame = self->_didReceiveFirstFrame;
  VCMediaStream_Unlock((uint64_t)self);
  return didReceiveFirstFrame;
}

- (int)remoteCameraReportingClientType
{
  if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", *MEMORY[0x1E0CF2A18]))
    return 16;
  else
    return 10;
}

- (int)screenSharingReportingClientType
{
  if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", CFSTR("CoreDeviceScreenSharing")))
    return 13;
  if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", CFSTR("RemoteDesktopScreenSharing"))
    || -[NSString isEqualToString:](self->super._clientName, "isEqualToString:", *MEMORY[0x1E0CF29D0]))
  {
    return 15;
  }
  if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", CFSTR("NearbyScreenSharing")))
    return 19;
  return -1;
}

- (__CFString)getReportingServiceName
{
  if (-[VCMediaStreamConfig type](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "type"))
    return CFSTR("Video");
  else
    return (__CFString *)*MEMORY[0x1E0CF2A00];
}

- (__CFString)getReportingClientName
{
  __CFString *v3;
  __CFString **v4;
  __CFString **v5;
  NSString *clientName;
  __CFString **v8;

  v3 = &stru_1E9E58EE0;
  switch(-[VCMediaStreamConfig type](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "type"))
  {
    case 0:
      v4 = (__CFString **)MEMORY[0x1E0CF29F8];
      return *v4;
    case 1:
      v4 = (__CFString **)MEMORY[0x1E0CF2A40];
      return *v4;
    case 2:
      v4 = (__CFString **)MEMORY[0x1E0CF29B8];
      return *v4;
    case 3:
      v4 = (__CFString **)MEMORY[0x1E0CF2A08];
      return *v4;
    case 4:
      v5 = (__CFString **)MEMORY[0x1E0CF2A18];
      if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", *MEMORY[0x1E0CF2A18]))
        return *v5;
      v4 = (__CFString **)MEMORY[0x1E0CF2A20];
      return *v4;
    case 5:
      if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", CFSTR("CoreDeviceScreenSharing")))
      {
        v4 = (__CFString **)MEMORY[0x1E0CF29D8];
        return *v4;
      }
      if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", CFSTR("RemoteDesktopScreenSharing")))
      {
        v4 = (__CFString **)MEMORY[0x1E0CF2A28];
        return *v4;
      }
      clientName = self->super._clientName;
      v8 = (__CFString **)MEMORY[0x1E0CF29D0];
      if (-[NSString isEqualToString:](clientName, "isEqualToString:", *MEMORY[0x1E0CF29D0]))
        return *v8;
      return v3;
    case 6:
      v4 = (__CFString **)MEMORY[0x1E0CF2A10];
      return *v4;
    default:
      return v3;
  }
}

- (int)reportVideoStreamType
{
  VCMediaStreamConfig *v2;
  unint64_t v3;

  v2 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  v3 = -[VCMediaStreamConfig type](v2, "type");
  if (v3 > 6)
    return -1;
  if (((1 << v3) & 0x66) != 0)
    return 1;
  if (((1 << v3) & 0x11) != 0)
    return 0;
  if (-[VCMediaStreamConfig captureSource](v2, "captureSource") == 2)
    return 1;
  return -[VCMediaStreamConfig captureSource](v2, "captureSource") == 1;
}

- (BOOL)isClientSpecificUserInfoSupported:(int)a3
{
  return (a3 < 0x14) & (0x9A740u >> a3);
}

- (__CFDictionary)getClientSpecificUserInfo
{
  uint64_t ReportingClientType;
  uint64_t v4;
  VCMediaStreamConfig *v5;
  id v6;
  NSMutableArray *transportArray;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSString *callID;
  unsigned int v21;
  _QWORD v22[6];
  _QWORD v23[6];
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  ReportingClientType = _VCVideoStream_GetReportingClientType(self);
  if (!-[VCVideoStream isClientSpecificUserInfoSupported:](self, "isClientSpecificUserInfoSupported:", ReportingClientType))return 0;
  v4 = -[VCVideoStream reportVideoStreamType](self, "reportVideoStreamType");
  v5 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  if ((_DWORD)ReportingClientType == 6)
  {
    v21 = v4;
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    transportArray = self->super._transportArray;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(transportArray);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v14 = -[VCMediaStreamConfig temporalScalingEnabled](v5, "temporalScalingEnabled");
          if ((v14 & v10 & 1) != 0)
          {
            v10 = 1;
          }
          else
          {
            v15 = v14;
            if (objc_msgSend(v13, "idsStreamId"))
              v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v13, "idsStreamId"));
            else
              v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCMediaStreamMultiwayConfig streamGroupID](-[VCMediaStreamConfig multiwayConfig](v5, "multiwayConfig"), "streamGroupID"));
            v10 |= v15;
            objc_msgSend(v6, "addObject:", v16);
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
      }
      while (v9);
    }
    -[VCMediaStreamMultiwayConfig streamGroupID](-[VCMediaStreamConfig multiwayConfig](v5, "multiwayConfig"), "streamGroupID");
    v17 = reportingStreamGroupFromStreamGroupID();
    v22[0] = CFSTR("VCMediaStreamType");
    v23[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
    v22[1] = CFSTR("VCSUUID");
    v23[1] = -[VCMediaStreamMultiwayConfig sessionId](-[VCMediaStreamConfig multiwayConfig](v5, "multiwayConfig"), "sessionId");
    v22[2] = CFSTR("VCSPUUID");
    v23[2] = -[VCMediaStreamMultiwayConfig participantId](-[VCMediaStreamConfig multiwayConfig](v5, "multiwayConfig"), "participantId");
    v22[3] = CFSTR("VCVSStreamIDs");
    v23[3] = objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v22[4] = CFSTR("VCMSDirection");
    v23[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStreamConfig direction](v5, "direction"));
    v22[5] = CFSTR("VCMSStreamGroup");
    v23[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17);
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);

  }
  else
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4), CFSTR("VCMediaStreamType"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->super._streamToken), CFSTR("VCVSStreamToken"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStreamConfig direction](v5, "direction")), CFSTR("VCMSDirection"));
    callID = self->super._callID;
    if (callID)
      objc_msgSend(v18, "setObject:forKeyedSubscript:", callID, CFSTR("CallID"));
    -[VCMediaStream applyClientSessionID:clientUserInfo:](self, "applyClientSessionID:clientUserInfo:", _VCVideoStream_GetReportingClientType(self), v18);
  }
  return (__CFDictionary *)v18;
}

- (BOOL)startSynchronization:(id)a3
{
  return -[VCVideoReceiverBase startSynchronization:](self->_videoReceiver, "startSynchronization:", a3);
}

- (void)stopSynchronization
{
  -[VCVideoReceiverBase stopSynchronization](self->_videoReceiver, "stopSynchronization");
}

- (VCVideoReceiverFeedbackDelegate)getVideoReceiverFeedbackDelegate
{
  return (VCVideoReceiverFeedbackDelegate *)self->_videoTransmitter;
}

- (void)setVideoReceiverFeedbackDelegate:(id)a3
{
  -[VCVideoReceiverBase setFeedbackDelegate:](self->_videoReceiver, "setFeedbackDelegate:", a3);
}

uint64_t __VCVideoStream_DidReceiveSampleBuffer_block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_OWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 56);
    return objc_msgSend(v3, "vcMediaStream:didReceiveFirstFrameWithTime:", v4, &v5);
  }
  return result;
}

- (void)vcVideoReceiver:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 firType:(int)a5
{
  int v6;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *delegateNotificationQueue;
  _QWORD v17[5];
  int v18;
  __int16 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[10];
  VCVideoStream *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v6 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v21 = v9;
        v22 = 2080;
        v23 = "-[VCVideoStream vcVideoReceiver:requestKeyFrameGenerationWithStreamID:firType:]";
        v24 = 1024;
        v25 = 3439;
        v26 = 1024;
        *(_DWORD *)v27 = v6;
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)&v27[6] = a5;
        v11 = "VCVideoStream [%s] %s:%d Requesting streamID:%hu to generate a key frame for FIRType:%d";
        v12 = v10;
        v13 = 40;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v21 = v14;
        v22 = 2080;
        v23 = "-[VCVideoStream vcVideoReceiver:requestKeyFrameGenerationWithStreamID:firType:]";
        v24 = 1024;
        v25 = 3439;
        v26 = 2112;
        *(_QWORD *)v27 = v8;
        *(_WORD *)&v27[8] = 2048;
        v28 = self;
        v29 = 1024;
        v30 = v6;
        v31 = 1024;
        v32 = a5;
        v11 = "VCVideoStream [%s] %s:%d %@(%p) Requesting streamID:%hu to generate a key frame for FIRType:%d";
        v12 = v15;
        v13 = 60;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->super._delegateNotificationQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__VCVideoStream_vcVideoReceiver_requestKeyFrameGenerationWithStreamID_firType___block_invoke;
  v17[3] = &unk_1E9E55EF8;
  v17[4] = self;
  v19 = v6;
  v18 = a5;
  dispatch_async(delegateNotificationQueue, v17);
}

uint64_t __79__VCVideoStream_vcVideoReceiver_requestKeyFrameGenerationWithStreamID_firType___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStream:requestKeyFrameGenerationWithStreamID:firType:", *(_QWORD *)(a1 + 32), *(unsigned __int16 *)(a1 + 44), *(unsigned int *)(a1 + 40));
}

- (void)vcVideoReceiverRequestKeyFrame:(id)a3 rtcpPSFBType:(unsigned int)a4
{
  VCVideoStream *v6;
  int v7;
  VCMediaStreamConfig *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  VCVideoStream *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  VCMediaStream_Lock((uint64_t)self);
  if (a4 == 1)
  {
    v6 = self;
    v7 = 224;
    goto LABEL_5;
  }
  if (a4 == 4)
  {
    v6 = self;
    v7 = 222;
LABEL_5:
    _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)v6, v7, 0, 0);
    goto LABEL_6;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v22 = 136316162;
      v23 = v20;
      v24 = 2080;
      v25 = "-[VCVideoStream vcVideoReceiverRequestKeyFrame:rtcpPSFBType:]";
      v26 = 1024;
      v27 = 3456;
      v28 = 2048;
      v29 = self;
      v30 = 1024;
      LODWORD(v31) = a4;
      _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d VCVideoStream[%p] requesting Key frame for unknown RTCP FB:%d", (uint8_t *)&v22, 0x2Cu);
    }
  }
LABEL_6:
  if (self->_videoTransmitter)
  {
    v8 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
    -[VCVideoReceiverBase roundTripTime](self->_videoReceiver, "roundTripTime");
    v10 = v9;
    v11 = micro();
    -[VCVideoTransmitterBase lastKeyFrameSentTime](self->_videoTransmitter, "lastKeyFrameSentTime");
    v13 = v11 - v12;
    v14 = (double)(unint64_t)-[VCMediaStreamConfig keyFrameInterval](v8, "keyFrameInterval") - v13;
    v15 = -[VCMediaStreamConfig framerate](v8, "framerate");
    if (v13 <= v10 + v10 || v14 <= 2.0 / (double)v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v22 = 136316674;
          v23 = v18;
          v24 = 2080;
          v25 = "-[VCVideoStream vcVideoReceiverRequestKeyFrame:rtcpPSFBType:]";
          v26 = 1024;
          v27 = 3475;
          v28 = 2048;
          v29 = self;
          v30 = 2048;
          v31 = v10;
          v32 = 2048;
          v33 = v13;
          v34 = 2048;
          v35 = v14;
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] Ignoring request to generate key frame. RTT:%.3f timeDelta:%.3f timeToNextKeyFrame:%.3f", (uint8_t *)&v22, 0x44u);
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v22 = 136316674;
          v23 = v16;
          v24 = 2080;
          v25 = "-[VCVideoStream vcVideoReceiverRequestKeyFrame:rtcpPSFBType:]";
          v26 = 1024;
          v27 = 3472;
          v28 = 2048;
          v29 = self;
          v30 = 2048;
          v31 = v10;
          v32 = 2048;
          v33 = v13;
          v34 = 2048;
          v35 = v14;
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] Requesting to generate key frame. RTT:%.3f timeDelta:%.3f timeToNextKeyFrame:%.3f", (uint8_t *)&v22, 0x44u);
        }
      }
      -[VCVideoTransmitterBase generateKeyFrameWithFIRType:](self->_videoTransmitter, "generateKeyFrameWithFIRType:", 0);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStream vcVideoReceiverRequestKeyFrame:rtcpPSFBType:].cold.1();
  }
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)vcVideoReceiver:(id)a3 downlinkQualityDidChange:(id)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  VCMediaStream_Lock((uint64_t)self);
  delegateNotificationQueue = self->super._delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__VCVideoStream_vcVideoReceiver_downlinkQualityDidChange___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a4;
  dispatch_async(delegateNotificationQueue, block);
  VCMediaStream_Unlock((uint64_t)self);
}

uint64_t __58__VCVideoStream_vcVideoReceiver_downlinkQualityDidChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStream:downlinkQualityDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (unsigned)vcVideoReceiver:(id)a3 receivedTMMBR:(unsigned int)a4
{
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *delegateNotificationQueue;
  _QWORD block[6];
  __CFString *v12;
  _QWORD v13[2];

  v4 = *(_QWORD *)&a4;
  v13[1] = *MEMORY[0x1E0C80C00];
  VCMediaStream_Lock((uint64_t)self);
  v6 = -[VCVideoTransmitterBase setTemporaryMaximumBitrate:](self->_videoTransmitter, "setTemporaryMaximumBitrate:", v4);
  v7 = v6;
  if (self->_uplinkOperatingBitrate != v6)
  {
    self->_uplinkOperatingBitrate = v6;
    _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 225, 0, 0);
    v12 = CFSTR("vcKeyVideoStreamUplinkOperatingBitrate");
    v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_uplinkOperatingBitrate);
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    delegateNotificationQueue = self->super._delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__VCVideoStream_vcVideoReceiver_receivedTMMBR___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = v8;
    dispatch_async(delegateNotificationQueue, block);
  }
  VCMediaStream_Unlock((uint64_t)self);
  return v7;
}

uint64_t __47__VCVideoStream_vcVideoReceiver_receivedTMMBR___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStream:uplinkQualityDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)vcVideoReceiver:(id)a3 didSwitchFromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5
{
  uint64_t v5;
  NSObject *delegateNotificationQueue;
  _QWORD block[5];
  unsigned __int16 v9;
  unsigned __int16 v10;
  uint64_t v11;

  v5 = a5;
  v11 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->super._delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VCVideoStream_vcVideoReceiver_didSwitchFromStreamID_toStreamID___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v9 = a4;
  v10 = a5;
  dispatch_async(delegateNotificationQueue, block);
  self->_currentStreamID = v5;
  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 230, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v5));
}

uint64_t __66__VCVideoStream_vcVideoReceiver_didSwitchFromStreamID_toStreamID___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStream:didSwitchFromStreamID:toStreamID:", *(_QWORD *)(a1 + 32), *(unsigned __int16 *)(a1 + 40), *(unsigned __int16 *)(a1 + 42));
  return result;
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = *a4;
  VCVideoStream_OnVideoFrame((uint64_t)self, (uint64_t)a3, (uint64_t)&v6, (uint64_t)a5);
  return 1;
}

- (void)sourceFrameRateDidChange:(unsigned int)a3
{
  -[VCVideoCaptureConverter sourceFrameRateDidChange:](self->_captureConverter, "sourceFrameRateDidChange:", *(_QWORD *)&a3);
}

- (id)copyOnVideoFrameBlock
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__VCVideoStream_copyOnVideoFrameBlock__block_invoke;
  v3[3] = &unk_1E9E56490;
  v3[4] = self;
  return _Block_copy(v3);
}

uint64_t __38__VCVideoStream_copyOnVideoFrameBlock__block_invoke(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *a3;
  v7 = *((_QWORD *)a3 + 2);
  VCVideoStream_OnVideoFrame(v4, a2, (uint64_t)&v6, a4);
  return 1;
}

- (void)avConferencePreviewError:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  VCVideoStream *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStream avConferencePreviewError:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v8 = 136316418;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VCVideoStream avConferencePreviewError:]";
        v12 = 1024;
        v13 = 3548;
        v14 = 2112;
        v15 = v5;
        v16 = 2048;
        v17 = self;
        v18 = 2080;
        v19 = objc_msgSend(a3, "UTF8String");
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) received an error=%s", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (void)avConferenceScreenCaptureError:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  VCVideoStream *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStream avConferenceScreenCaptureError:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v8 = 136316418;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VCVideoStream avConferenceScreenCaptureError:]";
        v12 = 1024;
        v13 = 3552;
        v14 = 2112;
        v15 = v5;
        v16 = 2048;
        v17 = self;
        v18 = 2080;
        v19 = objc_msgSend(a3, "UTF8String");
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) received a capture error=%s", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (id)clientCaptureRule
{
  return self->_videoRule;
}

- (void)thermalLevelDidChange:(int)a3
{
  uint64_t v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCVideoStream *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v3 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (-[VCMediaStreamMultiwayConfig isOneToOne](-[VCMediaStreamConfig multiwayConfig](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "multiwayConfig"), "isOneToOne"))
  {
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v13 = 136315906;
      v14 = v6;
      v15 = 2080;
      v16 = "-[VCVideoStream thermalLevelDidChange:]";
      v17 = 1024;
      v18 = 3562;
      v19 = 1024;
      LODWORD(v20) = v3;
      v8 = "VCVideoStream [%s] %s:%d thermalLevelDidChange thermalLevel=%u";
      v9 = v7;
      v10 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v13 = 136316418;
      v14 = v11;
      v15 = 2080;
      v16 = "-[VCVideoStream thermalLevelDidChange:]";
      v17 = 1024;
      v18 = 3562;
      v19 = 2112;
      v20 = v5;
      v21 = 2048;
      v22 = self;
      v23 = 1024;
      v24 = v3;
      v8 = "VCVideoStream [%s] %s:%d %@(%p) thermalLevelDidChange thermalLevel=%u";
      v9 = v12;
      v10 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
LABEL_13:
    VCMediaStream_Lock((uint64_t)self);
    -[VCVideoTransmitterBase handleThermalLevelChange:](self->_videoTransmitter, "handleThermalLevelChange:", v3);
    VCMediaStream_Unlock((uint64_t)self);
  }
}

- (void)cameraAvailabilityDidChange:(BOOL)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoStream cameraAvailabilityDidChange:]";
      v9 = 1024;
      v10 = 3570;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Handling of camera availability did change not implemented yet", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)collectRxChannelMetrics:(id *)a3 interval:(float)a4
{
  -[VCVideoReceiverBase collectChannelMetrics:interval:](self->_videoReceiver, "collectChannelMetrics:interval:", a3);
}

- (void)collectRxChannelMetrics:(id *)a3
{
  double v3;

  *(float *)&v3 = (float)self->_reportingDefaultRealtimePeriod;
  -[VCVideoReceiverBase collectChannelMetrics:interval:](self->_videoReceiver, "collectChannelMetrics:interval:", a3, v3);
}

- (void)collectTxChannelMetrics:(id *)a3
{
  double v3;

  *(float *)&v3 = (float)self->_reportingDefaultRealtimePeriod;
  -[VCVideoTransmitterBase collectChannelMetrics:interval:](self->_videoTransmitter, "collectChannelMetrics:interval:", a3, v3);
}

- (void)handleActiveConnectionChange:(id)a3
{
  VCMediaStream_Lock((uint64_t)self);
  HIDWORD(self->_colorInfo) = objc_msgSend(a3, "maxConnectionMTU");
  self->_baseQualityIndex = VCConnection_PerPacketConnectionOverhead((uint64_t)a3);
  if (self->super._operatingMode == 6)
    -[VCMediaStream updateTransportsWithConstantConnectionOverhead:](self, "updateTransportsWithConstantConnectionOverhead:");
  -[VCVideoTransmitterBase handleActiveConnectionChange:](self->_videoTransmitter, "handleActiveConnectionChange:", a3);
  -[VCObject reportingAgent](self, "reportingAgent");
  -[VCVideoTransmitterBase encodingWidth](self->_videoTransmitter, "encodingWidth");
  -[VCVideoTransmitterBase encodingHeight](self->_videoTransmitter, "encodingHeight");
  -[VCVideoTransmitterBase targetFramerate](self->_videoTransmitter, "targetFramerate");
  reportingVideoProp();
  -[VCVideoReceiverBase handleActiveConnectionChange:](self->_videoReceiver, "handleActiveConnectionChange:", a3);
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)rateAdaptation:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  AVCRateController *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  AVCRateController *v18;
  VCRateSharingGroup *rateSharingGroup;
  _BYTE v20[24];
  __int128 v21;
  _BYTE v22[24];
  uint64_t v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x1E0C80C00];
  if (!+[VCVideoStream shouldEnableRateControlForStreamType:](VCVideoStream, "shouldEnableRateControlForStreamType:", self->_type)|| self->super._rateAdaptation != a3)
  {
    return;
  }
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_14;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v12 = -[VCMediaStreamRateAdaptation vcrcRateController](self->super._rateAdaptation, "vcrcRateController");
    *(_DWORD *)v20 = 136316418;
    *(_QWORD *)&v20[4] = v10;
    *(_WORD *)&v20[12] = 2080;
    *(_QWORD *)&v20[14] = "-[VCVideoStream rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
    *(_WORD *)&v20[22] = 1024;
    LODWORD(v21) = 3623;
    WORD2(v21) = 2048;
    *(_QWORD *)((char *)&v21 + 6) = v12;
    HIWORD(v21) = 1024;
    *(_DWORD *)v22 = v6;
    *(_WORD *)&v22[4] = 1024;
    *(_DWORD *)&v22[6] = v5;
    v13 = "VCVideoStream [%s] %s:%d vcrcRateController=%p gives targetBitrate=%d, rateChangeCounter=%d";
    v14 = v11;
    v15 = 50;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_14;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v18 = -[VCMediaStreamRateAdaptation vcrcRateController](self->super._rateAdaptation, "vcrcRateController");
    *(_DWORD *)v20 = 136316930;
    *(_QWORD *)&v20[4] = v16;
    *(_WORD *)&v20[12] = 2080;
    *(_QWORD *)&v20[14] = "-[VCVideoStream rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
    *(_WORD *)&v20[22] = 1024;
    LODWORD(v21) = 3623;
    WORD2(v21) = 2112;
    *(_QWORD *)((char *)&v21 + 6) = v9;
    HIWORD(v21) = 2048;
    *(_QWORD *)v22 = self;
    *(_WORD *)&v22[8] = 2048;
    *(_QWORD *)&v22[10] = v18;
    *(_WORD *)&v22[18] = 1024;
    *(_DWORD *)&v22[20] = v6;
    LOWORD(v23) = 1024;
    *(_DWORD *)((char *)&v23 + 2) = v5;
    v13 = "VCVideoStream [%s] %s:%d %@(%p) vcrcRateController=%p gives targetBitrate=%d, rateChangeCounter=%d";
    v14 = v17;
    v15 = 70;
  }
  _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, v20, v15);
LABEL_14:
  -[VCVideoTransmitterBase setTargetBitrateChangeCounter:](self->_videoTransmitter, "setTargetBitrateChangeCounter:", v5, *(_OWORD *)v20, *(_QWORD *)&v20[16], v21, *(_QWORD *)v22, *(_OWORD *)&v22[8], v23);
  -[VCVideoTransmitterBase setTargetBitrate:](self->_videoTransmitter, "setTargetBitrate:", v6);
  if (!self->_initialTargetBitrate)
    self->_initialTargetBitrate = v6;
  if (self->_type == 5)
  {
    rateSharingGroup = self->super._rateSharingGroup;
    if (rateSharingGroup)
      -[VCRateSharingGroup setTargetBitrate:fromRateSharingClient:](rateSharingGroup, "setTargetBitrate:fromRateSharingClient:", v6, objc_msgSend(a3, "vcrcRateController"));
  }
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  if (self->_redundancyController == a3)
    -[VCVideoStream setFecRatio:](self, "setFecRatio:", VCRedundancyControllerVideo_ConvertRedundancyPercentageToRatio(a4));
}

- (void)redundancyController:(id)a3 redundancyVectorDidChange:(id *)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int var0;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  VCVideoStream *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_redundancyController != a3)
    return;
  -[VCVideoStream setFECRedundancyVector:](self, "setFECRedundancyVector:", a4);
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    var0 = a4->var0;
    v17 = 136316162;
    v18 = v8;
    v19 = 2080;
    v20 = "-[VCVideoStream redundancyController:redundancyVectorDidChange:]";
    v21 = 1024;
    v22 = 3654;
    v23 = 2112;
    v24 = a3;
    v25 = 1024;
    LODWORD(v26) = var0;
    v11 = "VCVideoStream [%s] %s:%d VCVideoStream received redundancyController update redundancyControler=%@ redundancyArrayCount=%u";
    v12 = v9;
    v13 = 44;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v7 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v16 = a4->var0;
      v17 = 136316674;
      v18 = v14;
      v19 = 2080;
      v20 = "-[VCVideoStream redundancyController:redundancyVectorDidChange:]";
      v21 = 1024;
      v22 = 3654;
      v23 = 2112;
      v24 = (id)v7;
      v25 = 2048;
      v26 = self;
      v27 = 2112;
      v28 = a3;
      v29 = 1024;
      v30 = v16;
      v11 = "VCVideoStream [%s] %s:%d %@(%p) VCVideoStream received redundancyController update redundancyControler=%@ re"
            "dundancyArrayCount=%u";
      v12 = v15;
      v13 = 64;
      goto LABEL_13;
    }
  }
}

- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5
{
  -[VCVideoTransmitterBase updateWindowState:isLocal:windowRect:](self->_videoTransmitter, "updateWindowState:isLocal:windowRect:", *(_QWORD *)&a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3
{
  unint64_t type;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  double lastDecodedVideoFrameTime;
  uint64_t v11;
  NSObject *v12;
  double v13;
  VCMediaStreamConfig *v14;
  double v15;
  double lastStatisticsCollectorVideoStallTotalUpdateTime;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  double v32;
  __int16 v33;
  VCVideoStream *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (VCMediaStream_State((uint64_t)self) != 2)
    return;
  type = self->_type;
  if (type <= 6)
  {
    if (type == 3)
    {
      -[VCVideoReceiverBase updateSourcePlayoutTime:](self->_videoReceiver, "updateSourcePlayoutTime:", a3);
    }
    else if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoStream updateSourcePlayoutTime:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v25 = 136316162;
          v26 = v7;
          v27 = 2080;
          v28 = "-[VCVideoStream updateSourcePlayoutTime:]";
          v29 = 1024;
          v30 = 3679;
          v31 = 2112;
          v32 = *(double *)&v6;
          v33 = 2048;
          v34 = self;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) This should not be called for IP camera or display", (uint8_t *)&v25, 0x30u);
        }
      }
    }
  }
  v9 = micro();
  lastDecodedVideoFrameTime = self->_lastDecodedVideoFrameTime;
  if (lastDecodedVideoFrameTime == 0.0)
  {
    self->_lastDecodedVideoFrameTime = v9;
    lastDecodedVideoFrameTime = v9;
  }
  if (v9 - lastDecodedVideoFrameTime <= self->_mediaStallTimeout)
  {
    if (self->_isRemoteMediaStalled)
    {
      self->_isRemoteMediaStalled = 0;
      self->_lastMediaStallReportTime = 0.0;
      -[VCMediaStreamDelegate vcMediaStream:remoteMediaStalled:duration:](self->super._delegate, "vcMediaStream:remoteMediaStalled:duration:", self, 0, 0.0);
    }
    goto LABEL_30;
  }
  if (!self->_isRemoteMediaStalled)
  {
    if (!self->_sendContinuousStallMessages)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (self->_sendContinuousStallMessages)
  {
LABEL_24:
    if (v9 - self->_lastMediaStallReportTime <= self->_mediaStallReportRepeatInterval)
    {
LABEL_29:
      self->_isRemoteMediaStalled = 1;
      goto LABEL_30;
    }
LABEL_25:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_lastDecodedVideoFrameTime;
        v25 = 136316162;
        v26 = v11;
        v27 = 2080;
        v28 = "-[VCVideoStream updateSourcePlayoutTime:]";
        v29 = 1024;
        v30 = 3694;
        v31 = 2048;
        v32 = v13;
        v33 = 2048;
        v34 = *(VCVideoStream **)&v9;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d remote media stall lastDecodedVideoFrameTime=%f currentTime=%f", (uint8_t *)&v25, 0x30u);
      }
    }
    self->_lastMediaStallReportTime = v9;
    -[VCMediaStreamDelegate vcMediaStream:remoteMediaStalled:duration:](self->super._delegate, "vcMediaStream:remoteMediaStalled:duration:", self, 1, v9 - self->_lastDecodedVideoFrameTime);
    goto LABEL_29;
  }
LABEL_30:
  v14 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  if (VCVideoStreamConfig_StreamType((uint64_t)v14) == 3 && VCMediaStreamConfig_Direction((uint64_t)v14) == 2)
  {
    v15 = v9 - self->_lastDecodedVideoFrameTime;
    lastStatisticsCollectorVideoStallTotalUpdateTime = self->_lastStatisticsCollectorVideoStallTotalUpdateTime;
    if (v15 >= 1.0)
    {
      if (v9 - lastStatisticsCollectorVideoStallTotalUpdateTime >= 1.0)
      {
        v21 = VCMediaStreamConfig_MultiwayConfig((uint64_t)v14);
        v22 = VCMediaStreamMultiwayConfig_RemoteIDSParticipantID(v21);
        _VCMediaStream_SubmitStatisticsCollectorVideoStallUpdate((uint64_t)self, v22, v9, v15);
        self->_lastStatisticsCollectorVideoStallTotalUpdateTime = v9;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v23 = VRTraceErrorLogLevelToCSTR();
          v24 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v25 = 136315906;
            v26 = v23;
            v27 = 2080;
            v28 = "VCVideoStream_SubmitStatisticsCollectorVideoStallUpdate";
            v29 = 1024;
            v30 = 1571;
            v31 = 2048;
            v32 = v15;
            _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VideoStallTimeTotal=%.2f", (uint8_t *)&v25, 0x26u);
          }
        }
      }
    }
    else if (lastStatisticsCollectorVideoStallTotalUpdateTime > 0.0)
    {
      v17 = VCMediaStreamConfig_MultiwayConfig((uint64_t)v14);
      v18 = VCMediaStreamMultiwayConfig_RemoteIDSParticipantID(v17);
      _VCMediaStream_SubmitStatisticsCollectorVideoStallUpdate((uint64_t)self, v18, v9, v15);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v25 = 136315906;
          v26 = v19;
          v27 = 2080;
          v28 = "VCVideoStream_SubmitStatisticsCollectorVideoStallUpdate";
          v29 = 1024;
          v30 = 1576;
          v31 = 2048;
          v32 = v15;
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VideoStallTimeTotal=%.2f", (uint8_t *)&v25, 0x26u);
        }
      }
      self->_lastStatisticsCollectorVideoStallTotalUpdateTime = 0.0;
    }
  }
  VCMediaStream_CheckForDecryptionTimeout((uint64_t)self);
}

- (void)reportStreamPerfTimings
{
  NSObject *delegateNotificationQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->super._delegateNotificationQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__VCVideoStream_reportStreamPerfTimings__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(delegateNotificationQueue, v3);
}

void __40__VCVideoStream_reportStreamPerfTimings__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  __n128 v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[1168])
  {
    objc_msgSend(v2, "reportingAgent");
    VCReporting_GetDynamicReportingModuleID();
    v7 = CFSTR("VCMSStreamToken");
    v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 616));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v3 = *(_QWORD **)(a1 + 32);
    v4 = (void *)v3[93];
    v5 = objc_msgSend(v3, "reportingAgent");
    VCPerfTimingUtilsReport(v4, v5, v6);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1168) = 1;
  }
}

- (NSNumber)targetStreamID
{
  return self->_targetStreamID;
}

- (BOOL)isServerBasedBandwidthProbingEnabled
{
  return self->_isServerBasedBandwidthProbingEnabled;
}

- (BOOL)isEndToEndBasedBandwidthProbingEnabled
{
  return self->_isEndToEndBasedBandwidthProbingEnabled;
}

- (NSNumber)sendingStreamID
{
  return self->_sendingStreamID;
}

- (BOOL)isCompoundStreamIDsIncreased
{
  return self->_isCompoundStreamIDsIncreased;
}

- (BOOL)shouldEnableFaceZoom
{
  return self->_shouldEnableFaceZoom;
}

- (unsigned)screenDisplayID
{
  return self->_screenDisplayID;
}

- (void)setScreenDisplayID:(unsigned int)a3
{
  self->_screenDisplayID = a3;
}

- (unsigned)customWidth
{
  return self->_customWidth;
}

- (void)setCustomWidth:(unsigned int)a3
{
  self->_customWidth = a3;
}

- (unsigned)customHeight
{
  return self->_customHeight;
}

- (void)setCustomHeight:(unsigned int)a3
{
  self->_customHeight = a3;
}

- (VCVideoReceiverBase)videoReceiver
{
  return self->_videoReceiver;
}

- (VCVideoTransmitterBase)videoTransmitter
{
  return self->_videoTransmitter;
}

- (BOOL)isTemporalScalingEnabled
{
  return self->_isTemporalScalingEnabled;
}

void ___VCVideoStream_CacheRemoteVideoFrame_block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(a1 + 32) + 832));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 832) = *(_QWORD *)(a1 + 40);
}

uint64_t ___VCVideoStream_DidReceiveRemoteFrame_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(result + 32);
  v2 = *(uint64_t (**)(_QWORD, _QWORD))(v1 + 1120);
  if (v2)
    return v2(*(_QWORD *)(v1 + 1112), *(_QWORD *)(result + 40));
  return result;
}

uint64_t ___VCVideoStream_DidReceiveRemoteFrame_block_invoke_717(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStream:priorityDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  return result;
}

uint64_t ___VCVideoStream_DidReceiveRemoteFrame_block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_OWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 56);
    return objc_msgSend(v3, "vcMediaStream:didReceiveFirstFrameWithTime:", v4, &v5);
  }
  return result;
}

- (void)enableRedundancyController:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoStream [%s] %s:%d Failed to create video redundancy controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupColorInfo:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoStream [%s] %s:%d Memory allocation for colorInfo dictionary failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupColorInfo:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v2 = 1210;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, "VCVideoStream [%s] %s:%d No color settings applied", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)updateVideoConfig:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)sendLastRemoteVideoFrame:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoStream [%s] %s:%d Failed to create frame data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendLastRemoteVideoFrame:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoStream [%s] %s:%d Failed to create last frame XPC args", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)cleanupBeforeReconfigure:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoStream [%s] %s:%d Reconfiguring VCVideoStream with a different number of transports.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setTargetStreamID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCVideoStream setTargetStreamID:]";
  OUTLINED_FUNCTION_4();
  v4 = 1711;
  v5 = 2112;
  v6 = v0;
  _os_log_debug_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_DEBUG, "VCVideoStream [%s] %s:%d TargetStreamID didn't change %@", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)validateStreamConfiguration:error:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)validateStreamConfiguration:error:.cold.2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)configureStreamInputCaptureSourceWithStreamInputID:frameRate:.cold.1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCVideoStream configureStreamInputCaptureSourceWithStreamInputID:frameRate:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "VCVideoStream [%s] %s:%d Can not find streamInput for streamInputID=%ld", v1);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoStream [%s] %s:%d Failed to create transport", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoStream [%s] %s:%d Failed to configure transport", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.5()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17_4();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, "VCVideoStream [%s] %s:%d Failed to configure transport", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.6()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_16_8();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, (uint64_t)v0, "VCVideoStream [%s] %s:%d Failed to update stream config for VCVideoStreamType=%d", v1);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.7()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_16_8();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, "VCVideoStream [%s] %s:%d Failed to update stream config for VCVideoStreamType=%d", v1, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.8()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
  OUTLINED_FUNCTION_4();
  v5 = 2084;
  v6 = v0;
  v7 = 1500000;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v1, v2, "VCVideoStream [%s] %s:%d Error setting socket receive buffer size=%d", v3);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.9()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.10()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

void __36__VCVideoStream_setupReportingAgent__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoStream [%s] %s:%d RTCReporting: can't configure the reporting agent.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupInternalRedundancyControllerWithStreamConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoStream [%s] %s:%d Failed to create video redundancy controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleVTPSendFailedWithData:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoStream [%s] %s:%d VTP send failed with no data!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoStreamDelegate:delegateFunctions:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoStream [%s] %s:%d videoStreamDelegateFunctions is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)vcVideoReceiverRequestKeyFrame:rtcpPSFBType:.cold.1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCVideoStream vcVideoReceiverRequestKeyFrame:rtcpPSFBType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "VCVideoStream [%s] %s:%d VCVideoStream[%p] Unable to request key frame", v1);
  OUTLINED_FUNCTION_3();
}

- (void)avConferencePreviewError:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_12_4(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, "VCVideoStream [%s] %s:%d received an error=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)avConferenceScreenCaptureError:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_12_4(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, "VCVideoStream [%s] %s:%d received a capture error=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)updateSourcePlayoutTime:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoStream [%s] %s:%d This should not be called for IP camera or display", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
