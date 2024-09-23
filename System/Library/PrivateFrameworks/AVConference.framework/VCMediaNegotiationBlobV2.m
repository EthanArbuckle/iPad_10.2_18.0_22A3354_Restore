@implementation VCMediaNegotiationBlobV2

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlobV2 setGeneralInfo:](self, "setGeneralInfo:", 0);
  -[VCMediaNegotiationBlobV2 setBandwidthSettings:](self, "setBandwidthSettings:", 0);
  -[VCMediaNegotiationBlobV2 setCodecSupport:](self, "setCodecSupport:", 0);
  -[VCMediaNegotiationBlobV2 setMicrophoneU1:](self, "setMicrophoneU1:", 0);
  -[VCMediaNegotiationBlobV2 setCameraU1:](self, "setCameraU1:", 0);
  -[VCMediaNegotiationBlobV2 setMomentsSettings:](self, "setMomentsSettings:", 0);
  -[VCMediaNegotiationBlobV2 setStreamGroups:](self, "setStreamGroups:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2;
  -[VCMediaNegotiationBlobV2 dealloc](&v3, sel_dealloc);
}

- (BOOL)hasGeneralInfo
{
  return self->_generalInfo != 0;
}

- (BOOL)hasBandwidthSettings
{
  return self->_bandwidthSettings != 0;
}

- (BOOL)hasCodecSupport
{
  return self->_codecSupport != 0;
}

- (BOOL)hasMicrophoneU1
{
  return self->_microphoneU1 != 0;
}

- (BOOL)hasCameraU1
{
  return self->_cameraU1 != 0;
}

- (BOOL)hasMomentsSettings
{
  return self->_momentsSettings != 0;
}

- (void)clearStreamGroups
{
  -[NSMutableArray removeAllObjects](self->_streamGroups, "removeAllObjects");
}

- (void)addStreamGroups:(id)a3
{
  NSMutableArray *streamGroups;

  streamGroups = self->_streamGroups;
  if (!streamGroups)
  {
    streamGroups = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_streamGroups = streamGroups;
  }
  -[NSMutableArray addObject:](streamGroups, "addObject:", a3);
}

- (unint64_t)streamGroupsCount
{
  return -[NSMutableArray count](self->_streamGroups, "count");
}

- (id)streamGroupsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_streamGroups, "objectAtIndex:", a3);
}

+ (Class)streamGroupsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2 description](&v3, sel_description), -[VCMediaNegotiationBlobV2 dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  VCMediaNegotiationBlobV2GeneralInfo *generalInfo;
  VCMediaNegotiationBlobV2BandwidthSettings *bandwidthSettings;
  VCMediaNegotiationBlobV2CodecFeatures *codecSupport;
  VCMediaNegotiationBlobV2MicrophoneSettingsU1 *microphoneU1;
  VCMediaNegotiationBlobV2CameraSettingsU1 *cameraU1;
  VCMediaNegotiationBlobV2MomentsSettings *momentsSettings;
  void *v10;
  NSMutableArray *streamGroups;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  generalInfo = self->_generalInfo;
  if (generalInfo)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2GeneralInfo dictionaryRepresentation](generalInfo, "dictionaryRepresentation"), CFSTR("generalInfo"));
  bandwidthSettings = self->_bandwidthSettings;
  if (bandwidthSettings)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2BandwidthSettings dictionaryRepresentation](bandwidthSettings, "dictionaryRepresentation"), CFSTR("bandwidthSettings"));
  codecSupport = self->_codecSupport;
  if (codecSupport)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2CodecFeatures dictionaryRepresentation](codecSupport, "dictionaryRepresentation"), CFSTR("codecSupport"));
  microphoneU1 = self->_microphoneU1;
  if (microphoneU1)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 dictionaryRepresentation](microphoneU1, "dictionaryRepresentation"), CFSTR("microphoneU1"));
  cameraU1 = self->_cameraU1;
  if (cameraU1)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2CameraSettingsU1 dictionaryRepresentation](cameraU1, "dictionaryRepresentation"), CFSTR("cameraU1"));
  momentsSettings = self->_momentsSettings;
  if (momentsSettings)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2MomentsSettings dictionaryRepresentation](momentsSettings, "dictionaryRepresentation"), CFSTR("momentsSettings"));
  if (-[NSMutableArray count](self->_streamGroups, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_streamGroups, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    streamGroups = self->_streamGroups;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamGroups, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(streamGroups);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamGroups, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("streamGroups"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2ReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *streamGroups;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_generalInfo)
    PBDataWriterWriteSubmessage();
  if (self->_bandwidthSettings)
    PBDataWriterWriteSubmessage();
  if (self->_codecSupport)
    PBDataWriterWriteSubmessage();
  if (self->_microphoneU1)
    PBDataWriterWriteSubmessage();
  if (self->_cameraU1)
    PBDataWriterWriteSubmessage();
  if (self->_momentsSettings)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  streamGroups = self->_streamGroups;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamGroups, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(streamGroups);
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamGroups, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if (self->_generalInfo)
    objc_msgSend(a3, "setGeneralInfo:");
  if (self->_bandwidthSettings)
    objc_msgSend(a3, "setBandwidthSettings:");
  if (self->_codecSupport)
    objc_msgSend(a3, "setCodecSupport:");
  if (self->_microphoneU1)
    objc_msgSend(a3, "setMicrophoneU1:");
  if (self->_cameraU1)
    objc_msgSend(a3, "setCameraU1:");
  if (self->_momentsSettings)
    objc_msgSend(a3, "setMomentsSettings:");
  if (-[VCMediaNegotiationBlobV2 streamGroupsCount](self, "streamGroupsCount"))
  {
    objc_msgSend(a3, "clearStreamGroups");
    v5 = -[VCMediaNegotiationBlobV2 streamGroupsCount](self, "streamGroupsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addStreamGroups:", -[VCMediaNegotiationBlobV2 streamGroupsAtIndex:](self, "streamGroupsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *streamGroups;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[4] = -[VCMediaNegotiationBlobV2GeneralInfo copyWithZone:](self->_generalInfo, "copyWithZone:", a3);
  v5[1] = -[VCMediaNegotiationBlobV2BandwidthSettings copyWithZone:](self->_bandwidthSettings, "copyWithZone:", a3);

  v5[3] = -[VCMediaNegotiationBlobV2CodecFeatures copyWithZone:](self->_codecSupport, "copyWithZone:", a3);
  v5[5] = -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 copyWithZone:](self->_microphoneU1, "copyWithZone:", a3);

  v5[2] = -[VCMediaNegotiationBlobV2CameraSettingsU1 copyWithZone:](self->_cameraU1, "copyWithZone:", a3);
  v5[6] = -[VCMediaNegotiationBlobV2MomentsSettings copyWithZone:](self->_momentsSettings, "copyWithZone:", a3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  streamGroups = self->_streamGroups;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamGroups, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(streamGroups);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addStreamGroups:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamGroups, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  VCMediaNegotiationBlobV2GeneralInfo *generalInfo;
  VCMediaNegotiationBlobV2BandwidthSettings *bandwidthSettings;
  VCMediaNegotiationBlobV2CodecFeatures *codecSupport;
  VCMediaNegotiationBlobV2MicrophoneSettingsU1 *microphoneU1;
  VCMediaNegotiationBlobV2CameraSettingsU1 *cameraU1;
  VCMediaNegotiationBlobV2MomentsSettings *momentsSettings;
  NSMutableArray *streamGroups;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    generalInfo = self->_generalInfo;
    if (!((unint64_t)generalInfo | *((_QWORD *)a3 + 4))
      || (v5 = -[VCMediaNegotiationBlobV2GeneralInfo isEqual:](generalInfo, "isEqual:")) != 0)
    {
      bandwidthSettings = self->_bandwidthSettings;
      if (!((unint64_t)bandwidthSettings | *((_QWORD *)a3 + 1))
        || (v5 = -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) isEqual:](bandwidthSettings, "isEqual:")) != 0)
      {
        codecSupport = self->_codecSupport;
        if (!((unint64_t)codecSupport | *((_QWORD *)a3 + 3))
          || (v5 = -[VCMediaNegotiationBlobV2CodecFeatures isEqual:](codecSupport, "isEqual:")) != 0)
        {
          microphoneU1 = self->_microphoneU1;
          if (!((unint64_t)microphoneU1 | *((_QWORD *)a3 + 5))
            || (v5 = -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 isEqual:](microphoneU1, "isEqual:")) != 0)
          {
            cameraU1 = self->_cameraU1;
            if (!((unint64_t)cameraU1 | *((_QWORD *)a3 + 2))
              || (v5 = -[VCMediaNegotiationBlobV2CameraSettingsU1 isEqual:](cameraU1, "isEqual:")) != 0)
            {
              momentsSettings = self->_momentsSettings;
              if (!((unint64_t)momentsSettings | *((_QWORD *)a3 + 6))
                || (v5 = -[VCMediaNegotiationBlobV2MomentsSettings isEqual:](momentsSettings, "isEqual:")) != 0)
              {
                streamGroups = self->_streamGroups;
                if ((unint64_t)streamGroups | *((_QWORD *)a3 + 7))
                  LOBYTE(v5) = -[NSMutableArray isEqual:](streamGroups, "isEqual:");
                else
                  LOBYTE(v5) = 1;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[VCMediaNegotiationBlobV2GeneralInfo hash](self->_generalInfo, "hash");
  v4 = -[VCMediaNegotiationBlobV2BandwidthSettings hash](self->_bandwidthSettings, "hash") ^ v3;
  v5 = -[VCMediaNegotiationBlobV2CodecFeatures hash](self->_codecSupport, "hash");
  v6 = v4 ^ v5 ^ -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 hash](self->_microphoneU1, "hash");
  v7 = -[VCMediaNegotiationBlobV2CameraSettingsU1 hash](self->_cameraU1, "hash");
  v8 = v7 ^ -[VCMediaNegotiationBlobV2MomentsSettings hash](self->_momentsSettings, "hash");
  return v6 ^ v8 ^ -[NSMutableArray hash](self->_streamGroups, "hash");
}

- (void)mergeFrom:(id)a3
{
  VCMediaNegotiationBlobV2GeneralInfo *generalInfo;
  uint64_t v6;
  VCMediaNegotiationBlobV2BandwidthSettings *bandwidthSettings;
  uint64_t v8;
  VCMediaNegotiationBlobV2CodecFeatures *codecSupport;
  uint64_t v10;
  VCMediaNegotiationBlobV2MicrophoneSettingsU1 *microphoneU1;
  uint64_t v12;
  VCMediaNegotiationBlobV2CameraSettingsU1 *cameraU1;
  uint64_t v14;
  VCMediaNegotiationBlobV2MomentsSettings *momentsSettings;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  generalInfo = self->_generalInfo;
  v6 = *((_QWORD *)a3 + 4);
  if (generalInfo)
  {
    if (v6)
      -[VCMediaNegotiationBlobV2GeneralInfo mergeFrom:](generalInfo, "mergeFrom:");
  }
  else if (v6)
  {
    -[VCMediaNegotiationBlobV2 setGeneralInfo:](self, "setGeneralInfo:");
  }
  bandwidthSettings = self->_bandwidthSettings;
  v8 = *((_QWORD *)a3 + 1);
  if (bandwidthSettings)
  {
    if (v8)
      -[VCMediaNegotiationBlobV2BandwidthSettings mergeFrom:](bandwidthSettings, "mergeFrom:");
  }
  else if (v8)
  {
    -[VCMediaNegotiationBlobV2 setBandwidthSettings:](self, "setBandwidthSettings:");
  }
  codecSupport = self->_codecSupport;
  v10 = *((_QWORD *)a3 + 3);
  if (codecSupport)
  {
    if (v10)
      -[VCMediaNegotiationBlobV2CodecFeatures mergeFrom:](codecSupport, "mergeFrom:");
  }
  else if (v10)
  {
    -[VCMediaNegotiationBlobV2 setCodecSupport:](self, "setCodecSupport:");
  }
  microphoneU1 = self->_microphoneU1;
  v12 = *((_QWORD *)a3 + 5);
  if (microphoneU1)
  {
    if (v12)
      -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 mergeFrom:](microphoneU1, "mergeFrom:");
  }
  else if (v12)
  {
    -[VCMediaNegotiationBlobV2 setMicrophoneU1:](self, "setMicrophoneU1:");
  }
  cameraU1 = self->_cameraU1;
  v14 = *((_QWORD *)a3 + 2);
  if (cameraU1)
  {
    if (v14)
      -[VCMediaNegotiationBlobV2CameraSettingsU1 mergeFrom:](cameraU1, "mergeFrom:");
  }
  else if (v14)
  {
    -[VCMediaNegotiationBlobV2 setCameraU1:](self, "setCameraU1:");
  }
  momentsSettings = self->_momentsSettings;
  v16 = *((_QWORD *)a3 + 6);
  if (momentsSettings)
  {
    if (v16)
      -[VCMediaNegotiationBlobV2MomentsSettings mergeFrom:](momentsSettings, "mergeFrom:");
  }
  else if (v16)
  {
    -[VCMediaNegotiationBlobV2 setMomentsSettings:](self, "setMomentsSettings:");
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = (void *)*((_QWORD *)a3 + 7);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        -[VCMediaNegotiationBlobV2 addStreamGroups:](self, "addStreamGroups:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    }
    while (v19);
  }
}

- (VCMediaNegotiationBlobV2GeneralInfo)generalInfo
{
  return self->_generalInfo;
}

- (void)setGeneralInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (VCMediaNegotiationBlobV2BandwidthSettings)bandwidthSettings
{
  return self->_bandwidthSettings;
}

- (void)setBandwidthSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (VCMediaNegotiationBlobV2CodecFeatures)codecSupport
{
  return self->_codecSupport;
}

- (void)setCodecSupport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (VCMediaNegotiationBlobV2MicrophoneSettingsU1)microphoneU1
{
  return self->_microphoneU1;
}

- (void)setMicrophoneU1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (VCMediaNegotiationBlobV2CameraSettingsU1)cameraU1
{
  return self->_cameraU1;
}

- (void)setCameraU1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (VCMediaNegotiationBlobV2MomentsSettings)momentsSettings
{
  return self->_momentsSettings;
}

- (void)setMomentsSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)streamGroups
{
  return self->_streamGroups;
}

- (void)setStreamGroups:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)printWithTitle:(id)a3 logFile:(void *)a4
{
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  VCMediaNegotiationBlobV2CameraSettingsU1 *cameraU1;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (size=%lu):"), a3, objc_msgSend((id)-[VCMediaNegotiationBlobV2 data](self, "data"), "length"));
  v7 = objc_msgSend(v6, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a4, "Media Blob (v2) - %s\n", v8, v9, v10, v11, v12, v13, v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v29 = v14;
      v30 = 2080;
      v31 = "-[VCMediaNegotiationBlobV2(Utils) printWithTitle:logFile:]";
      v32 = 1024;
      v33 = 20;
      v34 = 2080;
      v35 = objc_msgSend(v6, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob (v2) - %s", buf, 0x26u);
    }
  }
  v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s  "), "Media Blob (v2) - ");
  if (-[VCMediaNegotiationBlobV2 hasGeneralInfo](self, "hasGeneralInfo"))
    -[VCMediaNegotiationBlobV2GeneralInfo printWithLogFile:prefix:](self->_generalInfo, "printWithLogFile:prefix:", a4, v16);
  if (-[VCMediaNegotiationBlobV2 hasBandwidthSettings](self, "hasBandwidthSettings"))
    -[VCMediaNegotiationBlobV2BandwidthSettings printWithLogFile:prefix:](self->_bandwidthSettings, "printWithLogFile:prefix:", a4, v16);
  if (-[VCMediaNegotiationBlobV2 hasCodecSupport](self, "hasCodecSupport"))
    -[VCMediaNegotiationBlobV2CodecFeatures printWithLogFile:prefix:](self->_codecSupport, "printWithLogFile:prefix:", a4, v16);
  if (-[VCMediaNegotiationBlobV2 hasMicrophoneU1](self, "hasMicrophoneU1"))
    -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 printWithLogFile:prefix:](self->_microphoneU1, "printWithLogFile:prefix:", a4, v16);
  if (-[VCMediaNegotiationBlobV2 hasCameraU1](self, "hasCameraU1"))
  {
    cameraU1 = self->_cameraU1;
    -[VCMediaNegotiationBlobV2GeneralInfo screenResolution](self->_generalInfo, "screenResolution");
    -[VCMediaNegotiationBlobV2CameraSettingsU1 printWithLogFile:prefix:screenSize:](cameraU1, "printWithLogFile:prefix:screenSize:", a4, v16);
  }
  if (-[VCMediaNegotiationBlobV2 hasMomentsSettings](self, "hasMomentsSettings"))
    -[VCMediaNegotiationBlobV2MomentsSettings printWithLogFile:prefix:](self->_momentsSettings, "printWithLogFile:prefix:", a4, v16);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = -[VCMediaNegotiationBlobV2 streamGroups](self, "streamGroups");
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v22++), "printWithLogFile:prefix:", a4, v16);
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    }
    while (v20);
  }
}

@end
