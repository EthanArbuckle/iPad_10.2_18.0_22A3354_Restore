@implementation VCMediaNegotiatorStreamGroupU1Configuration

- (VCMediaNegotiatorStreamGroupU1Configuration)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorStreamGroupU1Configuration;
  return -[VCMediaNegotiatorStreamGroupU1Configuration init](&v3, sel_init);
}

- (VCMediaNegotiatorStreamGroupU1Configuration)initWithSSRC:(unsigned int)a3
{
  VCMediaNegotiatorStreamGroupU1Configuration *result;

  result = -[VCMediaNegotiatorStreamGroupU1Configuration init](self, "init");
  if (result)
    result->_ssrc = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorStreamGroupU1Configuration;
  -[VCMediaNegotiatorStreamGroupU1Configuration dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  NSSet *v5;
  int v6;
  NSOrderedSet *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  NSDictionary *v11;
  NSDictionary *v12;

  if (!a3)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || objc_msgSend(a3, "supportedDirection") != self->_supportedDirection
    || objc_msgSend(a3, "ssrc") != self->_ssrc
    || self->_allowAudioRecording != objc_msgSend(a3, "allowAudioRecording")
    || objc_msgSend(a3, "screenPixelCount") != self->_screenPixelCount)
  {
    goto LABEL_26;
  }
  v5 = (NSSet *)objc_msgSend(a3, "audioPayloads");
  if (v5 == self->_audioPayloads || (v6 = -[NSSet isEqual:](v5, "isEqual:")) != 0)
  {
    v7 = (NSOrderedSet *)objc_msgSend(a3, "supportedCipherSuites");
    if (v7 == self->_supportedCipherSuites || (v6 = -[NSOrderedSet isEqual:](v7, "isEqual:")) != 0)
    {
      v8 = (NSArray *)objc_msgSend(a3, "payloadPreference");
      if (v8 == self->_payloadPreference || (v6 = -[NSArray isEqual:](v8, "isEqual:")) != 0)
      {
        v9 = (NSArray *)objc_msgSend(a3, "videoPayloads");
        if (v9 == self->_videoPayloads || (v6 = -[NSArray isEqual:](v9, "isEqual:")) != 0)
        {
          v10 = (NSArray *)objc_msgSend(a3, "videoParameterSet");
          if (v10 == self->_videoParameterSet || (v6 = -[NSArray isEqual:](v10, "isEqual:")) != 0)
          {
            v11 = (NSDictionary *)objc_msgSend(a3, "videoFeatureStrings");
            if (v11 == self->_videoFeatureStrings || (v6 = -[NSDictionary isEqual:](v11, "isEqual:")) != 0)
            {
              v12 = (NSDictionary *)objc_msgSend(a3, "videoFeatureStringsFixedPosition");
              if (v12 == self->_videoFeatureStringsFixedPosition
                || (v6 = -[NSDictionary isEqual:](v12, "isEqual:")) != 0)
              {
                if (objc_msgSend(a3, "videoRuleCollections"))
                {
                  if ((objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "isEqual:", self->_videoRuleCollections) & 1) != 0)
                  {
LABEL_23:
                    LOBYTE(v6) = 1;
                    return v6;
                  }
                }
                else if (!self->_videoRuleCollections)
                {
                  goto LABEL_23;
                }
LABEL_26:
                LOBYTE(v6) = 0;
              }
            }
          }
        }
      }
    }
  }
  return v6;
}

- (void)updateWithAudioConfiguration:(id)a3 mediaType:(unsigned __int8)a4
{
  int v4;
  void *v7;
  void *v8;

  v4 = a4;
  self->_allowAudioRecording = objc_msgSend(a3, "allowAudioRecording");

  self->_audioPayloads = (NSSet *)(id)objc_msgSend(a3, "audioPayloads");
  v7 = &unk_1E9EFA040;
  if (v4 != 4)
    v7 = 0;
  if (v4 == 1)
    v8 = &unk_1E9EFA028;
  else
    v8 = v7;

  self->_payloadPreference = (NSArray *)v8;
}

+ (void)updateCameraU1Config:(id)a3 cameraConfiguration:(id)a4
{
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  int v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a4, "videoRuleCollections");
  objc_msgSend(a3, "setVideoRuleCollections:", v6);
  objc_msgSend(a3, "setVideoFeatureStrings:", objc_msgSend(a4, "videoFeatureStrings"));
  objc_msgSend(a3, "setVideoFeatureStringsFixedPosition:", objc_msgSend(a4, "videoFeatureStringsFixedPosition"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v28 = v7;
      v29 = 2080;
      v30 = "+[VCMediaNegotiatorStreamGroupU1Configuration updateCameraU1Config:cameraConfiguration:]";
      v31 = 1024;
      v32 = 147;
      v33 = 2112;
      v34 = objc_msgSend(a4, "videoFeatureStrings");
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d u1Config.videoFeatureStrings=%@", buf, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(a4, "videoFeatureStringsFixedPosition");
      *(_DWORD *)buf = 136315906;
      v28 = v9;
      v29 = 2080;
      v30 = "+[VCMediaNegotiatorStreamGroupU1Configuration updateCameraU1Config:cameraConfiguration:]";
      v31 = 1024;
      v32 = 148;
      v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d u1Config.videoFeatureStringsFixedPosition=%@", buf, 0x26u);
    }
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration updateCameraU1Config:cameraConfiguration:].cold.1();
    }
    goto LABEL_26;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration updateCameraU1Config:cameraConfiguration:].cold.2();
    }
LABEL_26:
    v14 = 0;
    goto LABEL_19;
  }
  v14 = v13;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = (void *)objc_msgSend(v6, "supportedPayloads");
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "unsignedIntValue");
        if ((_DWORD)v20 != 126)
        {
          v21 = v20;
          objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20));
          objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", VCVideoParamaterSets_DefaultSupportedSets(v21)));
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    }
    while (v17);
  }
  objc_msgSend(a3, "setVideoPayloads:", v12);
  objc_msgSend(a3, "setVideoParameterSet:", v14);
LABEL_19:

}

+ (BOOL)updateVideoPayloadsAndParametersForU1Config:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  BOOL v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration updateVideoPayloadsAndParametersForU1Config:].cold.1();
    }
    goto LABEL_18;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration updateVideoPayloadsAndParametersForU1Config:].cold.2();
    }
LABEL_18:
    v6 = 0;
    v13 = 0;
    goto LABEL_11;
  }
  v6 = v5;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "supportedPayloads");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "unsignedIntValue");
        objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12));
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", VCVideoParamaterSets_DefaultSupportedSets(v12)));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v9);
  }
  objc_msgSend(a3, "setVideoPayloads:", v4);
  objc_msgSend(a3, "setVideoParameterSet:", v6);
  v13 = 1;
LABEL_11:

  return v13;
}

+ (void)updateScreenU1Config:(id)a3 screenConfiguration:(id)a4
{
  id v7;
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
  objc_msgSend(a3, "setScreenPixelCount:", 5603328);
  v7 = +[VCVideoRuleCollections newU1VideoRuleCollections](VCVideoRuleCollectionsScreen, "newU1VideoRuleCollections");
  if (v7)
  {
    objc_msgSend(a3, "setVideoRuleCollections:", v7);
    objc_msgSend(a3, "setVideoFeatureStrings:", objc_msgSend(a4, "videoFeatureStrings"));
    if (objc_msgSend(a3, "videoFeatureStrings"))
    {
      objc_msgSend(a3, "setVideoFeatureStringsFixedPosition:", objc_msgSend(a4, "videoFeatureStringsFixedPosition"));
      if (objc_msgSend(a3, "videoFeatureStringsFixedPosition"))
      {
        if ((objc_msgSend(a1, "updateVideoPayloadsAndParametersForU1Config:", a3) & 1) == 0
          && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCMediaNegotiatorStreamGroupU1Configuration updateScreenU1Config:screenConfiguration:].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCMediaNegotiatorStreamGroupU1Configuration updateScreenU1Config:screenConfiguration:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration updateScreenU1Config:screenConfiguration:].cold.1();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = v8;
      v12 = 2080;
      v13 = "+[VCMediaNegotiatorStreamGroupU1Configuration updateScreenU1Config:screenConfiguration:]";
      v14 = 1024;
      v15 = 193;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating screen settings, as the local device does not support screen", (uint8_t *)&v10, 0x1Cu);
    }
  }

}

+ (void)updateFaceTextureU1Config:(id)a3 faceTextureConfiguration:(id)a4
{
  uint64_t v7;
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
  v7 = objc_msgSend(a4, "videoRuleCollections");
  if (v7)
  {
    objc_msgSend(a3, "setVideoRuleCollections:", v7);
    objc_msgSend(a3, "setVideoFeatureStringsFixedPosition:", objc_msgSend(a4, "videoFeatureStringsFixedPosition"));
    if (objc_msgSend(a3, "videoFeatureStringsFixedPosition"))
    {
      if ((objc_msgSend(a1, "updateVideoPayloadsAndParametersForU1Config:", a3) & 1) == 0
        && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCMediaNegotiatorStreamGroupU1Configuration updateFaceTextureU1Config:faceTextureConfiguration:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration updateFaceTextureU1Config:faceTextureConfiguration:].cold.1();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = v8;
      v12 = 2080;
      v13 = "+[VCMediaNegotiatorStreamGroupU1Configuration updateFaceTextureU1Config:faceTextureConfiguration:]";
      v14 = 1024;
      v15 = 212;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating face texture settings, as the local device does not support face texture", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

+ (void)updateBodyDataU1Config:(id)a3 bodyDataConfiguration:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a4, "videoRuleCollections");
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v23 = v15;
        v24 = 2080;
        v25 = "+[VCMediaNegotiatorStreamGroupU1Configuration updateBodyDataU1Config:bodyDataConfiguration:]";
        v26 = 1024;
        v27 = 229;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating body data settings, as the local device does not support body data", buf, 0x1Cu);
      }
    }
    goto LABEL_18;
  }
  v6 = (void *)v5;
  objc_msgSend(a3, "setVideoRuleCollections:", v5);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration updateBodyDataU1Config:bodyDataConfiguration:].cold.1();
    }
LABEL_18:
    v8 = 0;
    goto LABEL_11;
  }
  v8 = v7;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (void *)objc_msgSend(v6, "supportedPayloads");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "unsignedIntValue");
        objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14));
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v11);
  }
  objc_msgSend(a3, "setVideoPayloads:", v8);
LABEL_11:

}

- (id)initStreamGroupU1ConfigForGroupId:(unsigned int)a3 withLocalConfig:(id)a4
{
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  VCMediaNegotiatorStreamGroupU1Configuration *v9;
  VCMediaNegotiatorStreamGroupU1Configuration *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  NSObject *v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  uint64_t v28;

  v5 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v21 = v7;
      v22 = 2080;
      v23 = "-[VCMediaNegotiatorStreamGroupU1Configuration initStreamGroupU1ConfigForGroupId:withLocalConfig:]";
      v24 = 1024;
      v25 = 253;
      v26 = 2080;
      v27 = FourccToCStr(v5);
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Initialize stream group U1 config for groupID=%s", buf, 0x26u);
    }
  }
  if (!+[VCMediaNegotiatorStreamGroupU1Configuration ssrcForStreamGroup:localConfig:ssrc:](VCMediaNegotiatorStreamGroupU1Configuration, "ssrcForStreamGroup:localConfig:ssrc:", v5, a4, &v19))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = FourccToCStr(v5);
        *(_DWORD *)buf = 136315906;
        v21 = v14;
        v22 = 2080;
        v23 = "-[VCMediaNegotiatorStreamGroupU1Configuration initStreamGroupU1ConfigForGroupId:withLocalConfig:]";
        v24 = 1024;
        v25 = 256;
        v26 = 2080;
        v27 = v16;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d One to one config not supported for groupID=%s", buf, 0x26u);
      }
    }

    return 0;
  }
  v9 = -[VCMediaNegotiatorStreamGroupU1Configuration initWithSSRC:](self, "initWithSSRC:", v19);
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorStreamGroupU1Configuration initStreamGroupU1ConfigForGroupId:withLocalConfig:].cold.1(v17, v5, v18);
    }
    return 0;
  }
  v10 = v9;
  v11 = VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(v5);
  v12 = objc_msgSend(a4, "mediaConfigurationForMediaType:", v11);
  if ((int)v5 <= 1835623281)
  {
    switch((_DWORD)v5)
    {
      case 0x62646174:
        +[VCMediaNegotiatorStreamGroupU1Configuration updateBodyDataU1Config:bodyDataConfiguration:](VCMediaNegotiatorStreamGroupU1Configuration, "updateBodyDataU1Config:bodyDataConfiguration:", v10, v12);
        break;
      case 0x63616D65:
        +[VCMediaNegotiatorStreamGroupU1Configuration updateCameraU1Config:cameraConfiguration:](VCMediaNegotiatorStreamGroupU1Configuration, "updateCameraU1Config:cameraConfiguration:", v10, v12);
        break;
      case 0x66747874:
        +[VCMediaNegotiatorStreamGroupU1Configuration updateFaceTextureU1Config:faceTextureConfiguration:](VCMediaNegotiatorStreamGroupU1Configuration, "updateFaceTextureU1Config:faceTextureConfiguration:", v10, v12);
        break;
    }
    goto LABEL_18;
  }
  switch((_DWORD)v5)
  {
    case 0x73797361:
      goto LABEL_14;
    case 0x73637265:
      +[VCMediaNegotiatorStreamGroupU1Configuration updateScreenU1Config:screenConfiguration:](VCMediaNegotiatorStreamGroupU1Configuration, "updateScreenU1Config:screenConfiguration:", v10, v12);
      break;
    case 0x6D696372:
LABEL_14:
      -[VCMediaNegotiatorStreamGroupU1Configuration updateWithAudioConfiguration:mediaType:](v10, "updateWithAudioConfiguration:mediaType:", v12, v11);
      break;
  }
LABEL_18:
  v10->_supportedCipherSuites = (NSOrderedSet *)+[VCEncryptionRules supportedCipherSuitesForStreamGroupID:isOneToOne:](VCEncryptionRules, "supportedCipherSuitesForStreamGroupID:isOneToOne:", v5, 1);
  v10->_supportedDirection = 3;
  return v10;
}

+ (id)negotiatedAudioSettingsForGroupID:(unsigned int)a3 localU1Config:(id)a4 remoteU1Config:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a3;
  if (a3 == 1937339233)
  {
    v8 = +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:](VCMediaNegotiatorStreamGroupU1Configuration, "negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:", a4, a5);
  }
  else
  {
    if (a3 != 1835623282)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedMicrophoneSettingsBetweenLocalU1Config:remoteU1Config:](VCMediaNegotiatorStreamGroupU1Configuration, "negotiatedMicrophoneSettingsBetweenLocalU1Config:remoteU1Config:", a4, a5);
  }
  v9 = v8;
LABEL_7:
  objc_msgSend(v9, "setCipherSuite:", objc_msgSend(a1, "negotiateU1CipherSuiteForStreamGroupID:remoteSupportedCipherSuites:", v6, objc_msgSend(a5, "supportedCipherSuites")));
  return v9;
}

+ (id)negotiatedSystemAudioSettingsBetweenLocalU1Config:(id)a3 remoteU1Config:(id)a4
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  VCMediaNegotiatorResultsAudio *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = +[VCHardwareSettings supportsDedicatedSystemAudioStream](VCHardwareSettings, "supportsDedicatedSystemAudioStream");
  v7 = +[VCAudioRuleCollection getForcedPayload](VCAudioRuleCollection, "getForcedPayload");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = v8;
      v19 = 2080;
      v20 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:]";
      v21 = 1024;
      v22 = 303;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stream group found for system audio.", (uint8_t *)&v17, 0x1Cu);
    }
  }
  v10 = objc_alloc_init(VCMediaNegotiatorResultsAudio);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:].cold.1();
    }
    goto LABEL_31;
  }
  if (objc_msgSend(a4, "supportedDirection") == 2)
    a4 = 0;
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315650;
        v18 = v12;
        v19 = 2080;
        v20 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:]";
        v21 = 1024;
        v22 = 316;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stream group has no remote U1 config for system audio. Check for standalone system audio support.", (uint8_t *)&v17, 0x1Cu);
      }
    }
    if (v6)
    {
      v11 = 0;
      goto LABEL_14;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:].cold.2();
    }
LABEL_31:

    v10 = 0;
    return v10;
  }
  v11 = objc_msgSend(a4, "ssrc");
LABEL_14:
  -[VCMediaNegotiatorResultsAudio setRemoteSSRC:](v10, "setRemoteSSRC:", v11);
  -[VCMediaNegotiatorResultsAudio setAudioUnitModel:](v10, "setAudioUnitModel:", 65792);
  -[VCMediaNegotiatorResultsAudio setUseSBR:](v10, "setUseSBR:", 1);
  if (objc_msgSend(a3, "allowAudioRecording"))
    v14 = objc_msgSend(a4, "allowAudioRecording");
  else
    v14 = 0;
  -[VCMediaNegotiatorResultsAudio setAllowRecording:](v10, "setAllowRecording:", v14);
  -[VCMediaNegotiatorResultsAudio setAllowSwitching:](v10, "setAllowSwitching:", (_DWORD)v7 == 128);
  if ((_DWORD)v7 == 128)
  {
    +[VCMediaNegotiatorBase setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:](VCMediaNegotiatorBase, "setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:", objc_msgSend(a4, "audioPayloads"), v10, objc_msgSend(a3, "payloadPreference"));
    if (-[VCMediaNegotiatorResultsAudio primaryPayload](v10, "primaryPayload") == 128 && v6)
      +[VCMediaNegotiatorBase setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:](VCMediaNegotiatorBase, "setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E9EFA058), v10, &unk_1E9EFA070);
  }
  else
  {
    -[VCMediaNegotiatorResultsAudio setPrimaryPayload:](v10, "setPrimaryPayload:", v7);
  }
  return v10;
}

+ (int64_t)negotiateU1CipherSuiteForStreamGroupID:(unsigned int)a3 remoteSupportedCipherSuites:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  char *v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = +[VCEncryptionRules supportedCipherSuitesForStreamGroupID:isOneToOne:](VCEncryptionRules, "supportedCipherSuitesForStreamGroupID:isOneToOne:", *(_QWORD *)&a3, 1);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(a4, "containsObject:", v11))
        {
          v14 = objc_msgSend(v11, "integerValue");
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v18 = 136316418;
              v19 = v15;
              v20 = 2080;
              v21 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiateU1CipherSuiteForStreamGroupID:remoteSupportedCipherSuites:]";
              v22 = 1024;
              v23 = 352;
              v24 = 2080;
              v25 = (void *)VCMediaStreamConfig_CipherSuiteDescription(v14);
              v26 = 2048;
              v27 = v14;
              v28 = 2080;
              v29 = FourccToCStr(a3);
              _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiating cipherSuite=%s [%ld] for streamGroupID=%s", (uint8_t *)&v18, 0x3Au);
            }
          }
          return v14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
      if (v8)
        continue;
      break;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315906;
      v19 = v12;
      v20 = 2080;
      v21 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiateU1CipherSuiteForStreamGroupID:remoteSupportedCipherSuites:]";
      v22 = 1024;
      v23 = 356;
      v24 = 2080;
      v25 = FourccToCStr(a3);
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Falling back to VCMediaStreamCipherSuiteCipherAES128AuthNoneRCCM3 for streamGroupID=%s", (uint8_t *)&v18, 0x26u);
    }
  }
  return 3;
}

+ (id)negotiatedMicrophoneSettingsBetweenLocalU1Config:(id)a3 remoteU1Config:(id)a4
{
  uint64_t v6;
  VCMediaNegotiatorResultsAudio *v7;
  uint64_t v8;
  id v9;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = +[VCAudioRuleCollection getForcedPayload](VCAudioRuleCollection, "getForcedPayload");
  v7 = objc_alloc_init(VCMediaNegotiatorResultsAudio);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedMicrophoneSettingsBetweenLocalU1Config:remoteU1Config:].cold.1();
    }
    goto LABEL_17;
  }
  if (!a3 || !a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v13 = 136316162;
        v14 = v11;
        v15 = 2080;
        v16 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedMicrophoneSettingsBetweenLocalU1Config:remoteU1Config:]";
        v17 = 1024;
        v18 = 367;
        v19 = 1024;
        v20 = a3 == 0;
        v21 = 1024;
        v22 = a4 == 0;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to negotiate microphone settings as either local u1Config isNil=%{BOOL}d or remote u1Config isNil=%{BOOL}d", (uint8_t *)&v13, 0x28u);
      }
    }
LABEL_17:

    v7 = 0;
    return v7;
  }
  -[VCMediaNegotiatorResultsAudio setRemoteSSRC:](v7, "setRemoteSSRC:", objc_msgSend(a4, "ssrc"));
  -[VCMediaNegotiatorResultsAudio setAudioUnitModel:](v7, "setAudioUnitModel:", 65792);
  -[VCMediaNegotiatorResultsAudio setUseSBR:](v7, "setUseSBR:", 1);
  if (objc_msgSend(a3, "allowAudioRecording"))
    v8 = objc_msgSend(a4, "allowAudioRecording");
  else
    v8 = 0;
  -[VCMediaNegotiatorResultsAudio setAllowRecording:](v7, "setAllowRecording:", v8);
  -[VCMediaNegotiatorResultsAudio setAllowSwitching:](v7, "setAllowSwitching:", (_DWORD)v6 == 128);
  if ((_DWORD)v6 == 128)
  {
    v9 = +[VCMediaNegotiatorBase newNegotiatedAudioPayloadsWithLocalPayloads:remotePayloads:](VCMediaNegotiatorBase, "newNegotiatedAudioPayloadsWithLocalPayloads:remotePayloads:", objc_msgSend(a3, "audioPayloads"), objc_msgSend(a4, "audioPayloads"));
    +[VCMediaNegotiatorBase setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:](VCMediaNegotiatorBase, "setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:", v9, v7, objc_msgSend(a3, "payloadPreference"));

  }
  else
  {
    -[VCMediaNegotiatorResultsAudio setPrimaryPayload:](v7, "setPrimaryPayload:", v6);
  }
  return v7;
}

+ (id)negotiatedVideoSettingsForGroupID:(unsigned int)a3 localU1Config:(id)a4 remoteU1Config:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a3;
  if (a3 == 1935897189)
    v8 = +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:](VCMediaNegotiatorStreamGroupU1Configuration, "negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:", a4, a5);
  else
    v8 = +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedVideoSettingsBetweenLocalU1Config:remoteU1Config:streamGroupID:](VCMediaNegotiatorStreamGroupU1Configuration, "negotiatedVideoSettingsBetweenLocalU1Config:remoteU1Config:streamGroupID:", a4, a5, *(_QWORD *)&a3);
  v9 = v8;
  objc_msgSend(v8, "setCipherSuite:", objc_msgSend(a1, "negotiateU1CipherSuiteForStreamGroupID:remoteSupportedCipherSuites:", v6, objc_msgSend(a5, "supportedCipherSuites")));
  return v9;
}

+ (id)negotiatedVideoSettingsBetweenLocalU1Config:(id)a3 remoteU1Config:(id)a4 streamGroupID:(unsigned int)a5
{
  VCMediaNegotiatorResultsVideo *v8;
  VCMediaNegotiatorResultsVideo *v9;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(VCMediaNegotiatorResultsVideo);
  v9 = v8;
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedVideoSettingsBetweenLocalU1Config:remoteU1Config:streamGroupID:].cold.1(v11, a5, v12);
    }
    goto LABEL_6;
  }
  -[VCMediaNegotiatorResultsVideo setIsSupported:](v8, "setIsSupported:", 0);
  if (!a3 || !a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v15 = FourccToCStr(a5);
        v16 = CFSTR("NO");
        v20 = 136316418;
        v21 = v13;
        v23 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedVideoSettingsBetweenLocalU1Config:remoteU1Config:streamGroupID:]";
        v24 = 1024;
        v25 = 411;
        if (a3)
          v17 = CFSTR("NO");
        else
          v17 = CFSTR("YES");
        v22 = 2080;
        if (!a4)
          v16 = CFSTR("YES");
        v26 = 2080;
        v27 = v15;
        v28 = 2112;
        v29 = v17;
        v30 = 2112;
        v31 = v16;
        _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to negotiate streamGroupID=%s settings as either local u1Config isNil=%@ or remote u1Config isNil=%@", (uint8_t *)&v20, 0x3Au);
      }
    }
    goto LABEL_6;
  }
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315906;
        v21 = v18;
        v22 = 2080;
        v23 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedVideoSettingsBetweenLocalU1Config:remoteU1Config:streamGroupID:]";
        v24 = 1024;
        v25 = 412;
        v26 = 2080;
        v27 = FourccToCStr(a5);
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating video settings, as the local device does not support streamGroupID=%s", (uint8_t *)&v20, 0x26u);
      }
    }
    goto LABEL_6;
  }
  if (!+[VCMediaNegotiatorStreamGroupU1Configuration updateCommonNegotiatedVideoSettings:localU1Config:remoteU1Config:](VCMediaNegotiatorStreamGroupU1Configuration, "updateCommonNegotiatedVideoSettings:localU1Config:remoteU1Config:", v9, a3, a4))
  {
LABEL_6:

    v9 = 0;
  }
  return v9;
}

+ (id)negotiatedScreenSettingsBetweenLocalU1Config:(id)a3 remoteU1Config:(id)a4
{
  VCMediaNegotiatorResultsVideo *v6;
  VCMediaNegotiatorResultsVideo *v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(VCMediaNegotiatorResultsVideo);
  v7 = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:].cold.1();
    }
    goto LABEL_10;
  }
  -[VCMediaNegotiatorResultsVideo setIsSupported:](v6, "setIsSupported:", 0);
  if (!a3 || !a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v15 = CFSTR("NO");
        v19 = 136316162;
        v20 = v13;
        v21 = 2080;
        v22 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:]";
        if (a3)
          v16 = CFSTR("NO");
        else
          v16 = CFSTR("YES");
        v23 = 1024;
        v24 = 429;
        if (!a4)
          v15 = CFSTR("YES");
        v25 = 2112;
        v26 = v16;
        v27 = 2112;
        v28 = v15;
        _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to negotiate screen settings as either local u1Config isNil=%@ or remote u1Config isNil=%@", (uint8_t *)&v19, 0x30u);
      }
    }
    goto LABEL_10;
  }
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136315650;
        v20 = v17;
        v21 = 2080;
        v22 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:]";
        v23 = 1024;
        v24 = 430;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating screen settings, as the local device does not support screen", (uint8_t *)&v19, 0x1Cu);
      }
    }
    goto LABEL_10;
  }
  +[VideoUtil computeResolutionForMainDisplayWithMaxScreenPixelCount:](VideoUtil, "computeResolutionForMainDisplayWithMaxScreenPixelCount:", objc_msgSend(a4, "screenPixelCount"));
  if ((int)v8)
    v10 = (int)v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:].cold.2();
    }
    goto LABEL_10;
  }
  v11 = v9;
  -[VCMediaNegotiatorResultsVideo setCustomVideoWidth:](v7, "setCustomVideoWidth:", v8);
  -[VCMediaNegotiatorResultsVideo setCustomVideoHeight:](v7, "setCustomVideoHeight:", v11);
  -[VCMediaNegotiatorResultsVideo setIsRTCPFBEnabled:](v7, "setIsRTCPFBEnabled:", 0);
  -[VCMediaNegotiatorResultsVideo addPixelFormatSet:](v7, "addPixelFormatSet:", &unk_1E9EF4D18);
  if (!+[VCMediaNegotiatorStreamGroupU1Configuration updateCommonNegotiatedVideoSettings:localU1Config:remoteU1Config:](VCMediaNegotiatorStreamGroupU1Configuration, "updateCommonNegotiatedVideoSettings:localU1Config:remoteU1Config:", v7, a3, a4))
  {
LABEL_10:

    v7 = 0;
  }
  return v7;
}

+ (void)negotiateFeatureStrings:(id)a3 localU1Config:(id)a4 remoteU1Config:(id)a5
{
  id v6;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v6 = a4;
  v61 = *MEMORY[0x1E0C80C00];
  if (!_os_feature_enabled_impl()
    || !objc_msgSend(v6, "videoFeatureStringsFixedPosition")
    || !objc_msgSend(a5, "videoFeatureStringsFixedPosition"))
  {
    objc_msgSend(a3, "setFeatureStrings:", objc_msgSend(a5, "videoFeatureStrings"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      v22 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      *(_DWORD *)buf = 136316418;
      v38 = v23;
      v39 = 2080;
      v40 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiateFeatureStrings:localU1Config:remoteU1Config:]";
      v41 = 1024;
      v42 = 478;
      v43 = 1024;
      v44 = _os_feature_enabled_impl();
      v45 = 2112;
      v46 = objc_msgSend(v6, "videoFeatureStringsFixedPosition");
      v6 = a4;
      v47 = 2112;
      v48 = objc_msgSend(a5, "videoFeatureStringsFixedPosition");
      _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [FLS] Fallback to legacy. feature flag VideoCodecFeatureBitfield=%d, localFLSFixedPosition=%@, remoteFLSFixedPosition=%@", buf, 0x36u);
    }
    v22 = 0;
    goto LABEL_30;
  }
  v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = (id)objc_msgSend(v6, "videoFeatureStringsFixedPosition");
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
  if (v35)
  {
    v8 = *(_QWORD *)v58;
    v30 = *(_QWORD *)v58;
    v31 = a5;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v58 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        v11 = objc_msgSend((id)objc_msgSend(v6, "videoFeatureStringsFixedPosition"), "objectForKey:", v10);
        v36 = v10;
        v12 = objc_msgSend((id)objc_msgSend(a5, "videoFeatureStringsFixedPosition"), "objectForKey:", v10);
        if (v11)
          v13 = v12 == 0;
        else
          v13 = 1;
        if (!v13)
        {
          v14 = v12;
          v15 = (id)VCPCreateNegotiatedFLS();
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v16 = objc_msgSend(&unk_1E9EFA088, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v53;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v53 != v18)
                  objc_enumerationMutation(&unk_1E9EFA088);
                v20 = +[VCVideoFeatureListStringHelper extractKeyAndValueStringFromFeatureString:prefix:](VCVideoFeatureListStringHelper, "extractKeyAndValueStringFromFeatureString:prefix:", v14, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
                if (v20)
                {
                  v21 = (void *)objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("%@;"), v20);

                  v15 = v21;
                }
              }
              v17 = objc_msgSend(&unk_1E9EFA088, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
            }
            while (v17);
          }
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v15, v36);

          v8 = v30;
          a5 = v31;
          v6 = a4;
        }
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
    }
    while (v35);
  }
  objc_msgSend(a3, "setFeatureStrings:", v32);
  v22 = 1;
LABEL_30:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(a3, "featureStrings");
      if (v22)
      {
        v28 = objc_msgSend(v6, "videoFeatureStringsFixedPosition");
        v29 = objc_msgSend(a5, "videoFeatureStringsFixedPosition");
      }
      else
      {
        v28 = objc_msgSend(v6, "videoFeatureStrings");
        v29 = objc_msgSend(a5, "videoFeatureStrings");
      }
      *(_DWORD *)buf = 136316674;
      v38 = v25;
      v39 = 2080;
      v40 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiateFeatureStrings:localU1Config:remoteU1Config:]";
      v41 = 1024;
      v42 = 482;
      v43 = 1024;
      v44 = v22;
      v45 = 2112;
      v46 = v27;
      v47 = 2112;
      v48 = v28;
      v49 = 2112;
      v50 = v29;
      _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [FLS] useFLSFixedPosition=%d. negotiatedSettings.videoFeatureStrings=%@. Local=%@, Remote=%@", buf, 0x40u);
    }
  }
}

+ (BOOL)updateCommonNegotiatedVideoSettings:(id)a3 localU1Config:(id)a4 remoteU1Config:(id)a5
{
  unsigned __int8 v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  id obj;
  _QWORD v20[6];
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "negotiateFeatureStrings:localU1Config:remoteU1Config:");
  objc_msgSend(a3, "setRemoteSSRC:", objc_msgSend(a5, "ssrc"));
  v7 = 1;
  objc_msgSend(a3, "setTilesPerFrame:", 1);
  objc_msgSend(a3, "setLtrpEnabled:", 1);
  v8 = (void *)objc_msgSend(a5, "videoParameterSet");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __112__VCMediaNegotiatorStreamGroupU1Configuration_updateCommonNegotiatedVideoSettings_localU1Config_remoteU1Config___block_invoke;
  v20[3] = &unk_1E9E54C48;
  v20[4] = a5;
  v20[5] = a3;
  v9 = a3;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v20);
  v10 = a5;
  obj = (id)objc_msgSend(a5, "payloadPreference");
  while (2)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v21, 16, obj);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(obj);
        v15 = v7;
        if (+[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCollection:remoteVideoRuleCollection:](VCMediaNegotiatorBase, "selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCollection:remoteVideoRuleCollection:", 1, objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v14), "unsignedIntValue"), v7, v9, objc_msgSend(a4, "videoRuleCollections"), objc_msgSend(v10, "videoRuleCollections")))
        {
          break;
        }
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
          if (v12)
            goto LABEL_4;
          goto LABEL_13;
        }
      }
      ++v7;
      if (v15 < 2)
        continue;
      v16 = 1;
      objc_msgSend(v9, "setIsSupported:", 1);
    }
    else
    {
LABEL_13:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCMediaNegotiatorStreamGroupU1Configuration updateCommonNegotiatedVideoSettings:localU1Config:remoteU1Config:].cold.1();
      }
      return 0;
    }
    return v16;
  }
}

uint64_t __112__VCMediaNegotiatorStreamGroupU1Configuration_updateCommonNegotiatedVideoSettings_localU1Config_remoteU1Config___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 40), "addParameterSet:payload:", a2, objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "videoPayloads"), "objectAtIndex:", a3), "unsignedIntValue"));
}

+ (BOOL)ssrcForStreamGroup:(unsigned int)a3 localConfig:(id)a4 ssrc:(unsigned int *)a5
{
  BOOL result;
  int v6;

  result = 0;
  if ((int)a3 > 1835623281)
  {
    if (a3 != 1835623282 && a3 != 1937339233)
    {
      v6 = 1935897189;
LABEL_8:
      if (a3 != v6)
        return result;
    }
  }
  else if (a3 != 1650745716 && a3 != 1667329381)
  {
    v6 = 1718909044;
    goto LABEL_8;
  }
  *a5 = objc_msgSend((id)objc_msgSend(a4, "mediaConfigurationForMediaType:", VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(a3)), "ssrc");
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setSupportedDirection:", self->_supportedDirection);
    objc_msgSend(v5, "setSsrc:", self->_ssrc);
    objc_msgSend(v5, "setAllowAudioRecording:", self->_allowAudioRecording);
    objc_msgSend(v5, "setScreenPixelCount:", self->_screenPixelCount);
    objc_msgSend(v5, "setSupportedCipherSuites:", self->_supportedCipherSuites);
    objc_msgSend(v5, "setAudioPayloads:", self->_audioPayloads);
    objc_msgSend(v5, "setPayloadPreference:", self->_payloadPreference);
    objc_msgSend(v5, "setVideoPayloads:", self->_videoPayloads);
    objc_msgSend(v5, "setVideoParameterSet:", self->_videoParameterSet);
    objc_msgSend(v5, "setVideoFeatureStrings:", self->_videoFeatureStrings);
    objc_msgSend(v5, "setVideoFeatureStringsFixedPosition:", self->_videoFeatureStringsFixedPosition);
    objc_msgSend(v5, "setVideoRuleCollections:", self->_videoRuleCollections);
  }
  return v5;
}

- (unsigned)supportedDirection
{
  return self->_supportedDirection;
}

- (void)setSupportedDirection:(unsigned __int8)a3
{
  self->_supportedDirection = a3;
}

- (unsigned)ssrc
{
  return self->_ssrc;
}

- (void)setSsrc:(unsigned int)a3
{
  self->_ssrc = a3;
}

- (BOOL)allowAudioRecording
{
  return self->_allowAudioRecording;
}

- (void)setAllowAudioRecording:(BOOL)a3
{
  self->_allowAudioRecording = a3;
}

- (NSSet)audioPayloads
{
  return self->_audioPayloads;
}

- (void)setAudioPayloads:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSOrderedSet)supportedCipherSuites
{
  return self->_supportedCipherSuites;
}

- (void)setSupportedCipherSuites:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSArray)payloadPreference
{
  return self->_payloadPreference;
}

- (void)setPayloadPreference:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSArray)videoPayloads
{
  return self->_videoPayloads;
}

- (void)setVideoPayloads:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSArray)videoParameterSet
{
  return self->_videoParameterSet;
}

- (void)setVideoParameterSet:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (VCVideoRuleCollections)videoRuleCollections
{
  return self->_videoRuleCollections;
}

- (void)setVideoRuleCollections:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSDictionary)videoFeatureStrings
{
  return self->_videoFeatureStrings;
}

- (void)setVideoFeatureStrings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSDictionary)videoFeatureStringsFixedPosition
{
  return self->_videoFeatureStringsFixedPosition;
}

- (void)setVideoFeatureStringsFixedPosition:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (unsigned)screenPixelCount
{
  return self->_screenPixelCount;
}

- (void)setScreenPixelCount:(unsigned int)a3
{
  self->_screenPixelCount = a3;
}

+ (void)updateCameraU1Config:cameraConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoPayloads array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateCameraU1Config:cameraConfiguration:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoParameterSet array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateVideoPayloadsAndParametersForU1Config:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoPayloads array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateVideoPayloadsAndParametersForU1Config:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoParameterSet array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateScreenU1Config:screenConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Screen features not successfully generated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateScreenU1Config:screenConfiguration:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Screen features with fixed position not successfully generated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateScreenU1Config:screenConfiguration:.cold.3()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Failed to update video payloads and parameters for u1Config=%@", v1);
  OUTLINED_FUNCTION_3();
}

+ (void)updateFaceTextureU1Config:faceTextureConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Face texture features with fixed position not successfully generated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateFaceTextureU1Config:faceTextureConfiguration:.cold.2()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Failed to update video payloads and parameters for u1Config=%@", v1);
  OUTLINED_FUNCTION_3();
}

+ (void)updateBodyDataU1Config:bodyDataConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoPayloads array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initStreamGroupU1ConfigForGroupId:(NSObject *)a3 withLocalConfig:.cold.1(uint64_t a1, int a2, NSObject *a3)
{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[14];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;

  OUTLINED_FUNCTION_8_11(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  v8 = "-[VCMediaNegotiatorStreamGroupU1Configuration initStreamGroupU1ConfigForGroupId:withLocalConfig:]";
  v9 = 1024;
  v10 = 259;
  v11 = v4;
  v12 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, " [%s] %s:%d Failed to init U1 config for groupID=%s", v7);
  OUTLINED_FUNCTION_3_0();
}

+ (void)negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize negotiated audio settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream group has no U1 settings for system audio and does not support standalone system audio", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)negotiatedMicrophoneSettingsBetweenLocalU1Config:remoteU1Config:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize negotiated audio settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)negotiatedVideoSettingsBetweenLocalU1Config:(uint64_t)a1 remoteU1Config:(int)a2 streamGroupID:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[14];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;

  OUTLINED_FUNCTION_8_11(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  v8 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedVideoSettingsBetweenLocalU1Config:remoteU1Config:streamGroupID:]";
  v9 = 1024;
  v10 = 409;
  v11 = v4;
  v12 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, " [%s] %s:%d Failed to initialize negotiated video settings streamGroupID=%s", v7);
  OUTLINED_FUNCTION_3_0();
}

+ (void)negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize negotiated screen settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Screen U1 settings failed to calculate resolution", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateCommonNegotiatedVideoSettings:localU1Config:remoteU1Config:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v4 = 507;
  v5 = v0;
  v6 = 1;
  v7 = v0;
  v8 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to find video rule for transportType=%d encodingType=%d", v3, 0x28u);
  OUTLINED_FUNCTION_3();
}

@end
