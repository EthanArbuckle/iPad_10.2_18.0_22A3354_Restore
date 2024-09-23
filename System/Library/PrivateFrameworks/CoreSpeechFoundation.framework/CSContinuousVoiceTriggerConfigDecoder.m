@implementation CSContinuousVoiceTriggerConfigDecoder

+ (id)decodeConfigFrom:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CSContinuousVoiceTriggerConfig *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  CSContinuousVoiceTriggerConfig *v30;

  v3 = a3;
  objc_msgSend(v3, "resourcePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    v5 = CFSTR("config_marsh.txt");
  else
    v5 = CFSTR("config.txt");
  objc_msgSend(v3, "getStringForKey:category:default:", CFSTR("configFileNDAPI"), CFSTR("continuousVoiceTrigger"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNumberForKey:category:default:", CFSTR("threshold"), CFSTR("continuousVoiceTrigger"), &unk_1E68A1AD8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v3, "getNumberForKey:category:default:", CFSTR("twoShotThreshold"), CFSTR("continuousVoiceTrigger"), &unk_1E68A1AE8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  objc_msgSend(v3, "getNumberForKey:category:default:", CFSTR("twoShotDecisionWaitTime"), CFSTR("continuousVoiceTrigger"), &unk_1E68A1AF8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  objc_msgSend(v3, "getStringForKey:category:default:", CFSTR("voiceTriggerPhraseIds"), CFSTR("continuousVoiceTrigger"), CFSTR("0"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getStringForKey:category:default:", CFSTR("silencePhraseIds"), CFSTR("continuousVoiceTrigger"), CFSTR("1"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(","));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueForKeyPath:", CFSTR("self.integerValue"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 && objc_msgSend(v19, "count"))
  {
    if (+[CSUtils supportMph](CSUtils, "supportMph"))
    {
      v20 = v19;
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(v19, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "arrayWithObject:", v22);
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(","));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "valueForKeyPath:", CFSTR("self.integerValue"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [CSContinuousVoiceTriggerConfig alloc];
  objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = v9;
  LODWORD(v28) = v12;
  LODWORD(v29) = v15;
  v30 = -[CSContinuousVoiceTriggerConfig initWithConfigPathNDAPI:threshold:twoShotThreshold:twoShotDecisionWaitTime:voiceTriggerPhIds:silencePhIds:](v25, "initWithConfigPathNDAPI:threshold:twoShotThreshold:twoShotDecisionWaitTime:voiceTriggerPhIds:silencePhIds:", v26, v20, v24, v27, v28, v29);

  return v30;
}

@end
