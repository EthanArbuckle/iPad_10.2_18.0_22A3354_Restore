@implementation VCVideoRuleCollectionsCamera

- (BOOL)getBestFrameWidth:(int *)a3 frameHeight:(int *)a4 frameRate:(float *)a5
{
  double v9;
  double v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  int v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  int v22;
  int v23;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _WORD v38[11];

  *(_QWORD *)&v38[7] = *MEMORY[0x1E0C80C00];
  if (*a4)
  {
    v9 = (double)*a3 / (double)*a4;
  }
  else
  {
    -[VCVideoRuleCollectionsCamera preferredAspectRatio](self, "preferredAspectRatio");
    v9 = v10;
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
        v14 = *a3;
        v15 = *a4;
        v27 = 136316418;
        v28 = v11;
        v29 = 2080;
        v30 = "-[VCVideoRuleCollectionsCamera getBestFrameWidth:frameHeight:frameRate:]";
        v31 = 1024;
        v32 = 161;
        v33 = 1024;
        v34 = v14;
        v35 = 1024;
        v36 = v15;
        v37 = 2048;
        *(double *)v38 = v9;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d frameWidth=%d, frameHeight=%d, aspectRatio=%f", (uint8_t *)&v27, 0x32u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v25 = *a3;
      v26 = *a4;
      v27 = 136316418;
      v28 = v11;
      v29 = 2080;
      v30 = "-[VCVideoRuleCollectionsCamera getBestFrameWidth:frameHeight:frameRate:]";
      v31 = 1024;
      v32 = 161;
      v33 = 1024;
      v34 = v25;
      v35 = 1024;
      v36 = v26;
      v37 = 2048;
      *(double *)v38 = v9;
      _os_log_debug_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEBUG, " [%s] %s:%d frameWidth=%d, frameHeight=%d, aspectRatio=%f", (uint8_t *)&v27, 0x32u);
    }
  }
  v16 = -[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:](self, "bestVideoRuleForEncodingType:aspectRatio:", 1, v9);
  v17 = v16;
  if (v16)
  {
    if (a3)
      *a3 = objc_msgSend(v16, "iWidth");
    *a4 = objc_msgSend(v17, "iHeight");
    if (a5)
    {
      objc_msgSend(v17, "fRate");
      *(_DWORD *)a5 = v18;
      if (a3)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v21 = *a3;
            v22 = *a4;
            v23 = (int)*a5;
            v27 = 136316674;
            v28 = v19;
            v29 = 2080;
            v30 = "-[VCVideoRuleCollectionsCamera getBestFrameWidth:frameHeight:frameRate:]";
            v31 = 1024;
            v32 = 177;
            v33 = 1024;
            v34 = v21;
            v35 = 1024;
            v36 = v22;
            v37 = 1024;
            *(_DWORD *)v38 = v23;
            v38[2] = 2048;
            *(double *)&v38[3] = v9;
            _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %dx%d@%dfps, aspectRatio=%f", (uint8_t *)&v27, 0x38u);
          }
        }
      }
    }
  }
  return v17 != 0;
}

- (id)bestVideoRuleForEncodingType:(unsigned __int8)a3 aspectRatio:(double)a4
{
  uint64_t v5;
  id v7;
  id v8;
  void *v11;
  int v12;
  signed int v13;
  int v14;
  float v15;
  float v16;
  float v17;

  v5 = a3;
  v7 = -[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:payload:](self, "bestVideoRuleForEncodingType:aspectRatio:payload:", a3, 123);
  v8 = -[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:payload:](self, "bestVideoRuleForEncodingType:aspectRatio:payload:", v5, 100, a4);
  if (a4 != -1.0 && v7 == 0 && v8 == 0)
  {
    v7 = -[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:payload:](self, "bestVideoRuleForEncodingType:aspectRatio:payload:", v5, 123);
    v8 = -[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:payload:](self, "bestVideoRuleForEncodingType:aspectRatio:payload:", v5, 100, -1.0);
  }
  v11 = v8;
  if (!v8)
    return v7;
  v12 = objc_msgSend(v8, "iWidth");
  v13 = objc_msgSend(v11, "iHeight") * v12;
  v14 = objc_msgSend(v7, "iWidth");
  if (v13 < (int)(objc_msgSend(v7, "iHeight") * v14))
    return v7;
  objc_msgSend(v11, "fRate");
  v16 = v15;
  objc_msgSend(v7, "fRate");
  if (v16 < v17)
    return v7;
  return v11;
}

- (id)bestVideoRuleForEncodingType:(unsigned __int8)a3 aspectRatio:(double)a4 payload:(int)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  int v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = (void *)objc_msgSend(-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](self, "getVideoRulesForTransport:payload:encodingType:", 1, *(_QWORD *)&a5, a3), "reverseObjectEnumerator");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
      if (a4 == -1.0
        || vabdd_f64((double)(int)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v11), "iWidth")/ (double)(int)objc_msgSend(v12, "iHeight"), a4) < 0.00000011920929)
      {
        break;
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_16;
      }
    }
    if (!v12)
      goto LABEL_16;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      v15 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 136316418;
          v20 = v13;
          v21 = 2080;
          v22 = "-[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:payload:]";
          v23 = 1024;
          v24 = 122;
          v25 = 2080;
          v26 = COERCE_DOUBLE(objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String"));
          v27 = 2048;
          v28 = a4;
          v29 = 1024;
          v30 = a5;
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Best video settings %s for aspect ratio=%g payload=%d", (uint8_t *)&v19, 0x36u);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v19 = 136316418;
        v20 = v13;
        v21 = 2080;
        v22 = "-[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:payload:]";
        v23 = 1024;
        v24 = 122;
        v25 = 2080;
        v26 = COERCE_DOUBLE(objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String"));
        v27 = 2048;
        v28 = a4;
        v29 = 1024;
        v30 = a5;
        _os_log_debug_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Best video settings %s for aspect ratio=%g payload=%d", (uint8_t *)&v19, 0x36u);
      }
    }
  }
  else
  {
LABEL_16:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136316162;
        v20 = v16;
        v21 = 2080;
        v22 = "-[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:payload:]";
        v23 = 1024;
        v24 = 120;
        v25 = 2048;
        v26 = a4;
        v27 = 1024;
        LODWORD(v28) = a5;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d not able to find for aspect ratio=%g payload=%d", (uint8_t *)&v19, 0x2Cu);
      }
    }
    return 0;
  }
  return v12;
}

+ (id)sharedInstance
{
  return +[VCVideoRuleCollectionsCameraEmbedded sharedInstance](VCVideoRuleCollectionsCameraEmbedded, "sharedInstance");
}

- (double)preferredAspectRatio
{
  return -1.0;
}

- (BOOL)setupH264CellularRules
{
  void *v3;
  uint64_t v4;
  void *v5;
  VCVideoRule *v6;
  double v7;
  uint64_t v8;
  void *v9;
  VCVideoRule *v10;
  double v11;
  uint64_t v12;
  void *v13;
  VCVideoRule *v14;
  double v15;
  VCVideoRule *v16;
  VCVideoRule *v17;
  double v18;
  uint64_t v19;
  void *v20;
  VCVideoRule *v21;
  double v22;
  uint64_t v23;
  void *v24;
  BOOL v25;

  if (!-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 126)
    && !-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 123))
  {
    return 1;
  }
  v3 = (void *)objc_opt_new();
  if (v3)
  {
    v4 = objc_opt_new();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [VCVideoRule alloc];
      LODWORD(v7) = 15.0;
      v8 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v6, "initWithFrameWidth:frameHeight:frameRate:payload:", 320, 240, 126, v7);
      if (v8)
      {
        v9 = (void *)v8;
        v10 = [VCVideoRule alloc];
        LODWORD(v11) = 15.0;
        v12 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v10, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 368, 126, v11);
        if (v12)
        {
          v13 = (void *)v12;
          v14 = [VCVideoRule alloc];
          LODWORD(v15) = 15.0;
          v16 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v14, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 272, 126, v15);
          v17 = [VCVideoRule alloc];
          LODWORD(v18) = 15.0;
          v19 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v17, "initWithFrameWidth:frameHeight:frameRate:payload:", 1024, 576, 126, v18);
          if (v19)
          {
            v20 = (void *)v19;
            v21 = [VCVideoRule alloc];
            LODWORD(v22) = 15.0;
            v23 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v21, "initWithFrameWidth:frameHeight:frameRate:payload:", 896, 672, 126, v22);
            if (v23)
            {
              v24 = (void *)v23;
              objc_msgSend(v3, "addObject:", v9);
              objc_msgSend(v3, "addObject:", v13);
              objc_msgSend(v3, "addObject:", v16);
              objc_msgSend(v3, "addObject:", v20);
              objc_msgSend(v3, "addObject:", v24);
              objc_msgSend(v5, "addObject:", v9);
              objc_msgSend(v5, "addObject:", v13);
              objc_msgSend(v5, "addObject:", v16);
              objc_msgSend(v5, "addObject:", v20);
              if (-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 126))
              {
                -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v3, 2, 126, 1);
                -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v5, 2, 126, 2);
              }
              v25 = 1;
              if (-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 123))
              {
                -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v3, 2, 123, 1);
                -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v5, 2, 123, 2);
              }
            }
            else
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCVideoRuleCollectionsCamera setupH264CellularRules].cold.6();
              }
              v24 = 0;
              v25 = 0;
            }
          }
          else
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCVideoRuleCollectionsCamera setupH264CellularRules].cold.5();
            }
            v24 = 0;
            v25 = 0;
            v20 = 0;
          }
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCVideoRuleCollectionsCamera setupH264CellularRules].cold.4();
          }
          v24 = 0;
          v25 = 0;
          v20 = 0;
          v16 = 0;
          v13 = 0;
        }
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCVideoRuleCollectionsCamera setupH264CellularRules].cold.3();
        }
        v24 = 0;
        v25 = 0;
        v20 = 0;
        v16 = 0;
        v13 = 0;
        v9 = 0;
      }
      goto LABEL_13;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCamera setupH264CellularRules].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoRuleCollectionsCamera setupH264CellularRules].cold.1();
  }
  v24 = 0;
  v25 = 0;
  v20 = 0;
  v16 = 0;
  v13 = 0;
  v9 = 0;
  v5 = 0;
LABEL_13:

  return v25;
}

- (BOOL)isHiDefCapable
{
  return *(&self->super._encodingType + 1) || *(&self->super._encodingType + 2) != 0;
}

- (BOOL)useSoftFramerateSwitching
{
  return 0;
}

- (_VCBitrateConfiguration)bitrateConfiguration
{
  return 0;
}

- (void)setupH264CellularRules
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate 896x672 rule for H264 cellular", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
