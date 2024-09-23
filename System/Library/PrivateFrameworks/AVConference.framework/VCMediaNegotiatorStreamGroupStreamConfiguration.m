@implementation VCMediaNegotiatorStreamGroupStreamConfiguration

- (VCMediaNegotiatorStreamGroupStreamConfiguration)init
{
  VCMediaNegotiatorStreamGroupStreamConfiguration *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaNegotiatorStreamGroupStreamConfiguration;
  v2 = -[VCMediaNegotiatorStreamGroupStreamConfiguration init](&v4, sel_init);
  if (v2)
  {
    v2->_payloads = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_codecs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_coordinateSystem = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorStreamGroupStreamConfiguration;
  -[VCMediaNegotiatorStreamGroupStreamConfiguration dealloc](&v3, sel_dealloc);
}

- (void)addPayload:(int)a3
{
  -[NSMutableSet addObject:](self->_payloads, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (void)resetPayloads
{
  -[NSMutableSet removeAllObjects](self->_payloads, "removeAllObjects");
}

- (void)addCodec:(unsigned int)a3
{
  -[NSMutableArray addObject:](self->_codecs, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (void)removeCodec:(unsigned int)a3
{
  -[NSMutableArray removeObject:](self->_codecs, "removeObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (void)resetCodecs
{
  -[NSMutableArray removeAllObjects](self->_codecs, "removeAllObjects");
}

- (BOOL)areCodecsEqualTo:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3550], "setWithArray:", self->_codecs);
  return objc_msgSend(v4, "isEqualToSet:", objc_msgSend(MEMORY[0x1E0CB3550], "setWithArray:", a3));
}

- (BOOL)applyCipherSuiteOnMediaStreamConfig:(id)a3 codecConfigs:(id)a4
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;

  if (-[NSMutableArray count](self->_codecs, "count"))
  {
    v7 = (void *)objc_msgSend(a4, "objectAtIndex:", (int)objc_msgSend((id)-[NSMutableArray firstObject](self->_codecs, "firstObject"), "intValue"));
    switch(objc_msgSend(v7, "cipherSuite"))
    {
      case 0u:
        if (!-[VCDefaults forceDisableMediaEncryption](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableMediaEncryption"))goto LABEL_6;
        objc_msgSend(a3, "setSRTPCipherSuite:", 0);
        objc_msgSend(a3, "setSRTCPCipherSuite:", 0);
        v8 = a3;
        v9 = 0;
LABEL_12:
        objc_msgSend(v8, "setSframeCipherSuite:", v9);
        return 1;
      case 1u:
        v12 = 1;
        objc_msgSend(a3, "setSframeCipherSuite:", 1);
        return v12;
      case 2u:
        v8 = a3;
        v9 = 2;
        goto LABEL_12;
      case 3u:
        break;
      default:
LABEL_6:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiatorStreamGroupStreamConfiguration applyCipherSuiteOnMediaStreamConfig:codecConfigs:].cold.1(v10, v7, v11);
        }
        return 0;
    }
  }
  objc_msgSend(a3, "setSRTPCipherSuite:", 3);
  objc_msgSend(a3, "setSRTCPCipherSuite:", 3);
  return 1;
}

- (BOOL)isEqualPayloads:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "count");
  if (v5 == -[NSMutableSet count](self->_payloads, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(a3);
        v10 = -[NSMutableSet containsObject:](self->_payloads, "containsObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        if (!v10)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
          LOBYTE(v10) = 1;
          if (v7)
            goto LABEL_4;
          return v10;
        }
      }
    }
    else
    {
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  double v5;
  double v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(a3, "streamIndex") == self->_streamIndex
    && objc_msgSend(a3, "ssrc") == self->_ssrc
    && objc_msgSend(a3, "streamID") == self->_streamID
    && objc_msgSend(a3, "metadata") == self->_metadata
    && objc_msgSend(a3, "qualityIndex") == self->_qualityIndex
    && objc_msgSend(a3, "maxNetworkBitrate") == self->_maxNetworkBitrate
    && objc_msgSend(a3, "maxMediaBitrate") == self->_maxMediaBitrate
    && objc_msgSend(a3, "maxPacketsPerSecond") == self->_maxPacketsPerSecond
    && objc_msgSend(a3, "repairedStreamID") == self->_repairedStreamID
    && objc_msgSend(a3, "repairedMaxNetworkBitrate") == self->_repairedMaxNetworkBitrate
    && (objc_msgSend(a3, "resolution"), v5 == self->_resolution.width)
    && (objc_msgSend(a3, "resolution"), v6 == self->_resolution.height)
    && objc_msgSend(a3, "framerate") == self->_framerate
    && objc_msgSend(a3, "keyFrameInterval") == self->_keyFrameInterval
    && objc_msgSend(a3, "rtpTimestampRate") == self->_rtpTimestampRate
    && objc_msgSend(a3, "parentStreamID") == self->_parentStreamID
    && objc_msgSend(a3, "audioChannelCount") == self->_audioChannelCount
    && objc_msgSend(a3, "coordinateSystem") == self->_coordinateSystem
    && objc_msgSend(a3, "v2StreamID") == self->_v2StreamID
    && -[VCMediaNegotiatorStreamGroupStreamConfiguration areCodecsEqualTo:](self, "areCodecsEqualTo:", objc_msgSend(a3, "codecs")))
  {
    return -[VCMediaNegotiatorStreamGroupStreamConfiguration isEqualPayloads:](self, "isEqualPayloads:", objc_msgSend(a3, "payloads"));
  }
  else
  {
    return 0;
  }
}

+ (id)configWithQualityIndex:(unsigned int)a3 nwBitrate:(unsigned int)a4 mediaBitrate:(unsigned int)a5 maxPacketsPerSecond:(unsigned int)a6 repairedNwBitrate:(unsigned int)a7 keyFrameInterval:(unsigned int)a8 framerate:(unsigned int)a9 rtpSampleRate:(unsigned int)a10 isTemporal:(BOOL)a11 isSubStream:(BOOL)a12 metadata:(unsigned int)a13 payloads:(id)a14 codecs:(id)a15 width:(unsigned int)a16 height:(unsigned int)a17 audioChannelCount:(unsigned int)a18 streamIndex:(unsigned __int8)a19 coordinateSystem:(unsigned int)a20
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  VCMediaNegotiatorStreamGroupStreamConfiguration *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v20 = *(_QWORD *)&a7;
  v21 = *(_QWORD *)&a6;
  v22 = *(_QWORD *)&a5;
  v23 = *(_QWORD *)&a4;
  v24 = *(_QWORD *)&a3;
  v48 = *MEMORY[0x1E0C80C00];
  v25 = objc_alloc_init(VCMediaNegotiatorStreamGroupStreamConfiguration);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setStreamIndex:](v25, "setStreamIndex:", a19);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setQualityIndex:](v25, "setQualityIndex:", v24);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setMaxNetworkBitrate:](v25, "setMaxNetworkBitrate:", v23);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setMaxMediaBitrate:](v25, "setMaxMediaBitrate:", v22);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setMaxPacketsPerSecond:](v25, "setMaxPacketsPerSecond:", v21);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setRepairedMaxNetworkBitrate:](v25, "setRepairedMaxNetworkBitrate:", v20);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setKeyFrameInterval:](v25, "setKeyFrameInterval:", a8);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setFramerate:](v25, "setFramerate:", a9);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setRtpTimestampRate:](v25, "setRtpTimestampRate:", a10);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setIsTemporalStream:](v25, "setIsTemporalStream:", a11);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setIsSubStream:](v25, "setIsSubStream:", a12);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setMetadata:](v25, "setMetadata:", a13);
  LODWORD(v26) = a16;
  LODWORD(v27) = a17;
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setResolution:](v25, "setResolution:", (double)v26, (double)v27);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setAudioChannelCount:](v25, "setAudioChannelCount:", a18);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setCoordinateSystem:](v25, "setCoordinateSystem:", a20);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v28 = objc_msgSend(a14, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(a14);
        -[VCMediaNegotiatorStreamGroupStreamConfiguration addPayload:](v25, "addPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "unsignedIntValue"));
      }
      v29 = objc_msgSend(a14, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
    }
    while (v29);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v32 = objc_msgSend(a15, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(a15);
        -[VCMediaNegotiatorStreamGroupStreamConfiguration addCodec:](v25, "addCodec:", objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "unsignedIntValue"));
      }
      v33 = objc_msgSend(a15, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    }
    while (v33);
  }
  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  NSMutableSet *payloads;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *codecs;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setSsrc:", self->_ssrc);
    objc_msgSend(v5, "setStreamID:", self->_streamID);
    objc_msgSend(v5, "setIsTemporalStream:", self->_isTemporalStream);
    objc_msgSend(v5, "setIsSubStream:", self->_isSubStream);
    objc_msgSend(v5, "setQualityIndex:", self->_qualityIndex);
    objc_msgSend(v5, "setMaxNetworkBitrate:", self->_maxNetworkBitrate);
    objc_msgSend(v5, "setMaxMediaBitrate:", self->_maxMediaBitrate);
    objc_msgSend(v5, "setMaxPacketsPerSecond:", self->_maxPacketsPerSecond);
    objc_msgSend(v5, "setRepairedStreamID:", self->_repairedStreamID);
    objc_msgSend(v5, "setRepairedMaxNetworkBitrate:", self->_repairedMaxNetworkBitrate);
    objc_msgSend(v5, "setResolution:", self->_resolution.width, self->_resolution.height);
    objc_msgSend(v5, "setFramerate:", self->_framerate);
    objc_msgSend(v5, "setKeyFrameInterval:", self->_keyFrameInterval);
    objc_msgSend(v5, "setRtpTimestampRate:", self->_rtpTimestampRate);
    objc_msgSend(v5, "setParentStreamID:", self->_parentStreamID);
    objc_msgSend(v5, "setAudioChannelCount:", self->_audioChannelCount);
    objc_msgSend(v5, "setCoordinateSystem:", self->_coordinateSystem);
    objc_msgSend(v5, "setV2StreamID:", self->_v2StreamID);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    payloads = self->_payloads;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(payloads);
          objc_msgSend(v5, "addPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "unsignedIntValue"));
        }
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      }
      while (v8);
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    codecs = self->_codecs;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](codecs, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(codecs);
          objc_msgSend(v5, "addCodec:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "unsignedIntValue"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](codecs, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      }
      while (v13);
    }
  }
  return v5;
}

- (unsigned)ssrc
{
  return self->_ssrc;
}

- (void)setSsrc:(unsigned int)a3
{
  self->_ssrc = a3;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (NSSet)payloads
{
  return &self->_payloads->super;
}

- (unsigned)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(unsigned int)a3
{
  self->_metadata = a3;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (void)setQualityIndex:(unsigned int)a3
{
  self->_qualityIndex = a3;
}

- (unsigned)maxNetworkBitrate
{
  return self->_maxNetworkBitrate;
}

- (void)setMaxNetworkBitrate:(unsigned int)a3
{
  self->_maxNetworkBitrate = a3;
}

- (unsigned)maxMediaBitrate
{
  return self->_maxMediaBitrate;
}

- (void)setMaxMediaBitrate:(unsigned int)a3
{
  self->_maxMediaBitrate = a3;
}

- (unsigned)maxPacketsPerSecond
{
  return self->_maxPacketsPerSecond;
}

- (void)setMaxPacketsPerSecond:(unsigned int)a3
{
  self->_maxPacketsPerSecond = a3;
}

- (unsigned)repairedStreamID
{
  return self->_repairedStreamID;
}

- (void)setRepairedStreamID:(unsigned __int16)a3
{
  self->_repairedStreamID = a3;
}

- (unsigned)repairedMaxNetworkBitrate
{
  return self->_repairedMaxNetworkBitrate;
}

- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3
{
  self->_repairedMaxNetworkBitrate = a3;
}

- (CGSize)resolution
{
  double width;
  double height;
  CGSize result;

  width = self->_resolution.width;
  height = self->_resolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setResolution:(CGSize)a3
{
  self->_resolution = a3;
}

- (unsigned)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(unsigned int)a3
{
  self->_framerate = a3;
}

- (unsigned)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unsigned int)a3
{
  self->_keyFrameInterval = a3;
}

- (unsigned)rtpTimestampRate
{
  return self->_rtpTimestampRate;
}

- (void)setRtpTimestampRate:(unsigned int)a3
{
  self->_rtpTimestampRate = a3;
}

- (NSArray)codecs
{
  return &self->_codecs->super;
}

- (unsigned)parentStreamID
{
  return self->_parentStreamID;
}

- (void)setParentStreamID:(unsigned __int16)a3
{
  self->_parentStreamID = a3;
}

- (BOOL)isTemporalStream
{
  return self->_isTemporalStream;
}

- (void)setIsTemporalStream:(BOOL)a3
{
  self->_isTemporalStream = a3;
}

- (BOOL)isSubStream
{
  return self->_isSubStream;
}

- (void)setIsSubStream:(BOOL)a3
{
  self->_isSubStream = a3;
}

- (unsigned)audioChannelCount
{
  return self->_audioChannelCount;
}

- (void)setAudioChannelCount:(unsigned int)a3
{
  self->_audioChannelCount = a3;
}

- (unint64_t)serializedSize
{
  return self->_serializedSize;
}

- (void)setSerializedSize:(unint64_t)a3
{
  self->_serializedSize = a3;
}

- (unsigned)coordinateSystem
{
  return self->_coordinateSystem;
}

- (void)setCoordinateSystem:(unsigned int)a3
{
  self->_coordinateSystem = a3;
}

- (unsigned)v2StreamID
{
  return self->_v2StreamID;
}

- (void)setV2StreamID:(unsigned __int16)a3
{
  self->_v2StreamID = a3;
}

- (unsigned)streamIndex
{
  return self->_streamIndex;
}

- (void)setStreamIndex:(unsigned __int8)a3
{
  self->_streamIndex = a3;
}

- (void)applyCipherSuiteOnMediaStreamConfig:(NSObject *)a3 codecConfigs:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCMediaNegotiatorStreamGroupStreamConfiguration applyCipherSuiteOnMediaStreamConfig:codecConfigs:]";
  v8 = 1024;
  v9 = 127;
  v10 = 2048;
  v11 = objc_msgSend(a2, "cipherSuite");
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to convert negotiatorStreamGroupConfig cipherSuite(%ld) to mediaStreamConfig cipherSuite", (uint8_t *)&v4, 0x26u);
}

@end
