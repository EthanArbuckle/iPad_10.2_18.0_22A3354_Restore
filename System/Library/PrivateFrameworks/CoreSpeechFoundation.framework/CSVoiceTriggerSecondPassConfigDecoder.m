@implementation CSVoiceTriggerSecondPassConfigDecoder

+ (id)categoryForFirstPass:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id result;

  result = CFSTR("voiceTriggerSecondPassAP");
  switch(a3)
  {
    case 1uLL:
      return result;
    case 2uLL:
      result = CFSTR("voiceTriggerSecondPassAOP");
      break;
    case 3uLL:
    case 6uLL:
      result = CFSTR("voiceTriggerSecondPassHearst");
      break;
    case 4uLL:
      result = CFSTR("voiceTriggerSecondPassJarvis");
      break;
    case 5uLL:
      if (+[CSUtils supportCompactPlus](CSUtils, "supportCompactPlus", v3, v4))
        result = CFSTR("voiceTriggerSecondPassPlus");
      else
        result = CFSTR("voiceTriggerSecondPass");
      break;
    case 7uLL:
      result = CFSTR("voiceTriggerSecondPassRemora");
      break;
    case 8uLL:
      result = CFSTR("voiceTriggerSecondPassDuringRingtone");
      break;
    case 9uLL:
      result = CFSTR("voiceTriggerSecondPassDuringConnectedCall");
      break;
    case 0xAuLL:
      result = CFSTR("voiceTriggerSecondPassEnrollment");
      break;
    default:
      result = CFSTR("voiceTriggerSecondPass");
      break;
  }
  return result;
}

+ (id)decodeConfigFrom:(id)a3 forFirstPassSource:(unint64_t)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  CSVoiceTriggerSecondPassConfig *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  CSVoiceTriggerSecondPassConfig *v25;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "categoryForFirstPass:", a4);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsCategory:", v7) & 1) == 0)
  {

    v8 = CSLogCategoryVT;
    v7 = CFSTR("voiceTriggerSecondPass");
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "+[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:forFirstPassSource:]";
      v31 = 2114;
      v32 = CFSTR("voiceTriggerSecondPass");
      _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s CategoryKey %{public}@ not found, falling back to default", buf, 0x16u);
    }
  }
  v9 = [CSVoiceTriggerSecondPassConfig alloc];
  objc_msgSend(a1, "decodePreTriggerAudioTime:fromCategory:", v6, v7);
  v11 = v10;
  objc_msgSend(a1, "decodePrependingAudioTime:fromCategory:", v6, v7);
  v13 = v12;
  objc_msgSend(a1, "decodeTrailingAudioTime:fromCategory:", v6, v7);
  v15 = v14;
  objc_msgSend(v6, "resourcePath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeConfigFileNDAPI:fromCategory:", v6, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v27) = objc_msgSend(a1, "decodeUseRecognizerCombination:fromCategory:", v6, v7);
  objc_msgSend(a1, "decodeConfigFileRecognizer:fromCategory:", v6, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(a1, "decodeUseKeywordSpotting:fromCategory:", v6, v7);
  +[CSVoiceTriggerPhraseConfigDecoder decodeConfigFrom:category:](CSVoiceTriggerPhraseConfigDecoder, "decodeConfigFrom:category:", v6, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeWearerDetectionConfig:fromCategory:", v6, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeQuasarCheckerResultCutOffCount:fromCategory:", v6, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = objc_msgSend(a1, "decodeuseTimeBasedTriggerLength:fromCategory:", v6, v7);
  LODWORD(v22) = v11;
  LODWORD(v23) = v13;
  LODWORD(v24) = v15;
  v25 = -[CSVoiceTriggerSecondPassConfig initWithPreTriggerAudioTime:prependingAudioTime:trailingAudioTime:resourcePath:configPathNDAPI:useRecognizerCombination:configPathRecognizer:useKeywordSpotting:phraseConfigs:wearerDetectionConfig:quasarCheckerResultCutOffCount:useTimeBasedTriggerLength:](v9, "initWithPreTriggerAudioTime:prependingAudioTime:trailingAudioTime:resourcePath:configPathNDAPI:useRecognizerCombination:configPathRecognizer:useKeywordSpotting:phraseConfigs:wearerDetectionConfig:quasarCheckerResultCutOffCount:useTimeBasedTriggerLength:", v28, v16, HIDWORD(v27), v17, v18, v19, v22, v23, v24, v20, v21, v27);

  return v25;
}

+ (BOOL)decodeuseTimeBasedTriggerLength:(id)a3 fromCategory:(id)a4
{
  return objc_msgSend(a3, "getBoolForKey:category:default:", CFSTR("useTimeBaseTriggerLength"), a4, 0);
}

+ (id)decodeQuasarCheckerResultCutOffCount:(id)a3 fromCategory:(id)a4
{
  void *v4;
  float v5;
  float v6;
  void *v7;
  float v8;
  double v9;

  objc_msgSend(a3, "getNumberForKey:category:default:", CFSTR("quasarCheckerResultCutOffTime"), a4, &unk_1E68A1B88);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  *(float *)&v9 = v6 * v8;
  return (id)objc_msgSend(v7, "numberWithFloat:", v9);
}

+ (float)decodePreTriggerAudioTime:(id)a3 fromCategory:(id)a4
{
  void *v4;
  float v5;
  float v6;

  objc_msgSend(a3, "getNumberForKey:category:default:", CFSTR("preTriggerAudioTime"), a4, &unk_1E68A1B98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

+ (float)decodePrependingAudioTime:(id)a3 fromCategory:(id)a4
{
  void *v4;
  float v5;
  float v6;

  objc_msgSend(a3, "getNumberForKey:category:default:", CFSTR("analyzerPrependingAudioTime"), a4, &unk_1E68A1B98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

+ (float)decodeTrailingAudioTime:(id)a3 fromCategory:(id)a4
{
  void *v4;
  float v5;
  float v6;

  objc_msgSend(a3, "getNumberForKey:category:default:", CFSTR("analyzerTrailingAudioTime"), a4, &unk_1E68A1BA8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

+ (id)decodeConfigFileNDAPI:(id)a3 fromCategory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "resourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    v8 = CFSTR("config_marsh.txt");
  else
    v8 = CFSTR("config.txt");
  objc_msgSend(v6, "getStringForKey:category:default:", CFSTR("configFileNDAPI"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)decodeUseRecognizerCombination:(id)a3 fromCategory:(id)a4
{
  return objc_msgSend(a3, "containsKey:category:", CFSTR("configFileRecognizer"), a4);
}

+ (id)decodeConfigFileRecognizer:(id)a3 fromCategory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "resourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CSUtils horsemanDeviceType](CSUtils, "horsemanDeviceType") != 1
    || (objc_msgSend(v5, "getStringForKey:category:default:", CFSTR("configFileRecognizerB238"), v6, 0),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v5, "getStringForKey:category:default:", CFSTR("configFileRecognizer"), v6, CFSTR("recognizer.json"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)decodeUseKeywordSpotting:(id)a3 fromCategory:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a3, "getNumberForKey:category:default:", CFSTR("useKeywordSpotting"), a4, MEMORY[0x1E0C9AAA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (id)decodeWearerDetectionConfig:(id)a3 fromCategory:(id)a4
{
  id v5;
  id v6;
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
  void *v19;
  CSVoiceTriggerAirPodWearerDetectionConfig *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CSVoiceTriggerAirPodWearerDetectionConfig *v25;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "getNumberForKey:category:default:", CFSTR("remoteVADThreshold"), v5, &unk_1E68A1BB8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v6, "getNumberForKey:category:default:", CFSTR("minimumPhraseLengthForVADGating"), v5, &unk_1E68A1BC8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  objc_msgSend(v6, "getNumberForKey:category:default:", CFSTR("secondPassShadowMicScoreThresholdForVADGating"), v5, &unk_1E68A1BD8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  objc_msgSend(v6, "getNumberForKey:category:default:", CFSTR("remoteVADMyriadThreshold"), v5, &unk_1E68A1BB8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;

  objc_msgSend(v6, "getValueForKey:category:", v5, CFSTR("phrasesToSkipBoronDecisionMaking"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [CSVoiceTriggerAirPodWearerDetectionConfig alloc];
  LODWORD(v21) = v9;
  LODWORD(v22) = v12;
  LODWORD(v23) = v15;
  LODWORD(v24) = v18;
  v25 = -[CSVoiceTriggerAirPodWearerDetectionConfig initWithThreshold:minimumPhraseLength:shadowMicScoreThreshold:myriadThreshold:phrasesToSkipBoronDecisionMaking:](v20, "initWithThreshold:minimumPhraseLength:shadowMicScoreThreshold:myriadThreshold:phrasesToSkipBoronDecisionMaking:", v19, v21, v22, v23, v24);

  return v25;
}

+ (id)fetchAllVoiceTriggerSecondPassRecognizer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSAsset getConfigFileNameForAssetType:](CSAsset, "getConfigFileNameForAssetType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (+[CSUtils horsemanDeviceType](CSUtils, "horsemanDeviceType") != 1
    || (+[CSUtils readValuesFromJsonFile:keyword:](CSUtils, "readValuesFromJsonFile:keyword:", v5, CFSTR("configFileRecognizerB238")), v7 = (void *)objc_claimAutoreleasedReturnValue(), (v6 = v7) == 0)|| (v8 = v7, !objc_msgSend(v7, "count")))
  {
    +[CSUtils readValuesFromJsonFile:keyword:](CSUtils, "readValuesFromJsonFile:keyword:", v5, CFSTR("configFileRecognizer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v3, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByStandardizingPath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_msgSend(v9, "copy");
  return v17;
}

+ (id)getDefaultRecognizerForB238
{
  return CFSTR("configFileRecognizerB238");
}

+ (id)getDefaultRecognizerNameForB238
{
  return CFSTR("recognizerB238.json");
}

@end
