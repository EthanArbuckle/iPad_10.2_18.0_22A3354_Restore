@implementation VCVideoRuleCollectionsFaceTexture

+ (void)addRulesForU1ToCollection:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  VCVideoRule *v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(&unk_1E9EFA1C0, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (!v4)
    return;
  v5 = v4;
  v6 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v18 != v6)
        objc_enumerationMutation(&unk_1E9EFA1C0);
      v8 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "intValue");
      v9 = [VCVideoRule alloc];
      LODWORD(v10) = 30.0;
      v11 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v9, "initWithFrameWidth:frameHeight:frameRate:payload:", 256, 768, v8, v10);
      if (!v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCVideoRuleCollectionsFaceTexture addRulesForU1ToCollection:].cold.1(v14, (uint64_t)a3, v15);
        }
        return;
      }
      v12 = (void *)v11;
      v13 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
      if ((_DWORD)v8 != 100)
      {
        objc_msgSend(a3, "addVideoRules:transportType:payload:encodingType:", v13, 1, v8, 1);
LABEL_13:
        objc_msgSend(a3, "addVideoRules:transportType:payload:encodingType:", v13, 1, v8, 2);
        goto LABEL_14;
      }
      if (+[VCHardwareSettings supportsHEVCEncoding](VCHardwareSettings, "supportsHEVCEncoding"))
        objc_msgSend(a3, "addVideoRules:transportType:payload:encodingType:", v13, 1, 100, 1);
      if (+[VCHardwareSettings supportsHEVCDecoding](VCHardwareSettings, "supportsHEVCDecoding"))
        goto LABEL_13;
LABEL_14:

    }
    v5 = objc_msgSend(&unk_1E9EFA1C0, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    if (v5)
      continue;
    break;
  }
}

+ (void)addRulesForU1ToCollection:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "+[VCVideoRuleCollectionsFaceTexture addRulesForU1ToCollection:]";
  v7 = 1024;
  v8 = 20;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate rule for instance=%@", (uint8_t *)&v3, 0x26u);
}

@end
