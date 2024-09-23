@implementation CSVoiceTriggerFirstPassConfigDecoder

+ (id)decodeConfigFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  CSVoiceTriggerFirstPassConfig *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CSVoiceTriggerFirstPassConfig *v29;
  int v31;
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "resourcePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getStringForKey:category:default:", CFSTR("configFileNDAPI"), CFSTR("voiceTriggerFirstPass"), CFSTR("config.txt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CSLogCategoryVT;
  if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 136315394;
    v32 = "+[CSVoiceTriggerFirstPassConfigDecoder decodeConfigFrom:]";
    v33 = 2112;
    v34 = v5;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Loading 1stPass-config=%@", (uint8_t *)&v31, 0x16u);
  }
  objc_msgSend(v3, "getNumberForKey:category:default:", CFSTR("threshold"), CFSTR("voiceTriggerFirstPass"), &unk_1E68A1B18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v3, "getNumberForKey:category:default:", CFSTR("delaySecondsForChannelSelection"), CFSTR("voiceTriggerFirstPass"), &unk_1E68A1B28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  objc_msgSend(v3, "getNumberForKey:category:default:", CFSTR("masterChannelScoreBoost"), CFSTR("voiceTriggerFirstPass"), &unk_1E68A1B28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  objc_msgSend(v3, "getNumberForKey:category:default:", CFSTR("processingChunkSeconds"), CFSTR("voiceTriggerFirstPass"), &unk_1E68A1B38);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;

  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    v19 = 15;
  else
    v19 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNumberForKey:category:default:", CFSTR("processingChannelsBitset"), CFSTR("voiceTriggerFirstPass"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedLongLongValue");

  v23 = [CSVoiceTriggerFirstPassConfig alloc];
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = v9;
  LODWORD(v26) = v12;
  LODWORD(v27) = v15;
  LODWORD(v28) = v18;
  v29 = -[CSVoiceTriggerFirstPassConfig initWithConfigPathNDAPI:threshold:delaySecondsForChannelSelection:masterChannelScoreBoost:processingChunkSeconds:processingChannelsBitset:](v23, "initWithConfigPathNDAPI:threshold:delaySecondsForChannelSelection:masterChannelScoreBoost:processingChunkSeconds:processingChannelsBitset:", v24, v22, v25, v26, v27, v28);

  return v29;
}

@end
