@implementation CSAsset(SpeakerRecognition)

- (uint64_t)containsSpeakerRecognitionCategory
{
  return objc_msgSend(a1, "containsCategory:", CFSTR("speakerRecognition"));
}

- (id)getPhraseConfig:()SpeakerRecognition
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getValueForKey:category:", CFSTR("phrase"), CFSTR("speakerRecognition"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count") <= a3)
  {
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[CSAsset(SpeakerRecognition) getPhraseConfig:]";
      v11 = 1024;
      v12 = a3;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Config for ph: %d doesn't exist, use default", (uint8_t *)&v9, 0x12u);
    }
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (float)satScoreThresholdForPhId:()SpeakerRecognition
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  float v8;

  objc_msgSend(a1, "getPhraseConfig:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("satThreshold")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("satThreshold"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;

  }
  else
  {
    objc_msgSend(a1, "satScoreThreshold");
    v7 = v8;
  }

  return v7;
}

- (float)satScoreThreshold
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("satThreshold"), CFSTR("speakerRecognition"), &unk_1E7C643D0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (unint64_t)multiUserLowScoreThresholdForPhId:()SpeakerRecognition
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  unint64_t v7;

  objc_msgSend(a1, "getPhraseConfig:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("multiUserLowScoreThreshold")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("multiUserLowScoreThreshold"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = (unint64_t)v6;

  }
  else
  {
    v7 = objc_msgSend(a1, "multiUserLowScoreThreshold");
  }

  return v7;
}

- (uint64_t)multiUserLowScoreThreshold
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("multiUserLowScoreThreshold"), CFSTR("speakerRecognition"), &unk_1E7C63AB8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (unint64_t)multiUserHighScoreThresholdForPhId:()SpeakerRecognition
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  unint64_t v7;

  objc_msgSend(a1, "getPhraseConfig:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("multiUserHighScoreThreshold")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("multiUserHighScoreThreshold"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = (unint64_t)v6;

  }
  else
  {
    v7 = objc_msgSend(a1, "multiUserHighScoreThreshold");
  }

  return v7;
}

- (uint64_t)multiUserHighScoreThreshold
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("multiUserHighScoreThreshold"), CFSTR("speakerRecognition"), &unk_1E7C63AD0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (unint64_t)multiUserConfidentScoreThresholdForPhId:()SpeakerRecognition
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  unint64_t v7;

  objc_msgSend(a1, "getPhraseConfig:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("multiUserConfidentScoreThreshold")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("multiUserConfidentScoreThreshold"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = (unint64_t)v6;

  }
  else
  {
    v7 = objc_msgSend(a1, "multiUserConfidentScoreThreshold");
  }

  return v7;
}

- (uint64_t)multiUserConfidentScoreThreshold
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("multiUserConfidentScoreThreshold"), CFSTR("speakerRecognition"), &unk_1E7C63AE8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (unint64_t)multiUserDeltaScoreThresholdForPhId:()SpeakerRecognition
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  unint64_t v7;

  objc_msgSend(a1, "getPhraseConfig:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("multiUserDeltaScoreThreshold")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("multiUserDeltaScoreThreshold"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = (unint64_t)v6;

  }
  else
  {
    v7 = objc_msgSend(a1, "multiUserDeltaScoreThreshold");
  }

  return v7;
}

- (uint64_t)multiUserDeltaScoreThreshold
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("multiUserDeltaScoreThreshold"), CFSTR("speakerRecognition"), &unk_1E7C63B00);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (float)psrCombinationWeight
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("combinationWeight"), CFSTR("speakerRecognition"), &unk_1E7C63F10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)satImplicitProfileThreshold
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  objc_msgSend(a1, "satScoreThreshold");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("implicitProfileThreshold"), CFSTR("speakerRecognition"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (float)satImplicitProfileDeltaThreshold
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("implicitProfileDeltaThreshold"), CFSTR("speakerRecognition"), &unk_1E7C63F20);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)satVTImplicitThreshold
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("implicitVTThreshold"), CFSTR("speakerRecognition"), &unk_1E7C643E0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)pruningExplicitUttThresholdSAT
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("pruningExplicitSATThreshold"), CFSTR("speakerRecognition"), &unk_1E7C643E0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)pruningExplicitUttThresholdPSR
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("pruningExplicitPSRThreshold"), CFSTR("speakerRecognition"), &unk_1E7C643E0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)pruningThresholdSAT
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("pruningSATThreshold"), CFSTR("speakerRecognition"), &unk_1E7C643E0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)pruningThresholdPSR
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("pruningPSRThreshold"), CFSTR("speakerRecognition"), &unk_1E7C643E0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)pruningNumRetentionUtterance
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("numPruningRetentionUtt"), CFSTR("speakerRecognition"), &unk_1E7C63B18);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (uint64_t)maxAllowedEnrollmentUtterances
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("maxEnrollmentUtterances"), CFSTR("speakerRecognition"), &unk_1E7C63B30);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (uint64_t)voiceProfilePruningCookie
{
  return objc_msgSend(a1, "getStringForKey:category:default:", CFSTR("pruningCookie"), CFSTR("speakerRecognition"), 0);
}

- (id)keywordDetectorQuasarConfigFilePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "resourcePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType") != 1
    || (objc_msgSend(MEMORY[0x1E0D192A0], "getDefaultRecognizerForB238"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "getStringForKey:category:default:", v3, CFSTR("voiceTriggerSecondPass"), 0),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    objc_msgSend(a1, "getStringForKey:category:default:", CFSTR("configFileRecognizer"), CFSTR("voiceTriggerSecondPassAOP"), CFSTR("recognizer.json"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)keywordDetectorNDAPIConfigFilePath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "resourcePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getStringForKey:category:default:", CFSTR("configFileNDAPI"), CFSTR("voiceTriggerSecondPassAOP"), CFSTR("config.txt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)satImplicitTrainingEnabled
{
  _BOOL8 v2;

  v2 = (CSIsIOS() & 1) != 0 || CSIsMac();
  return objc_msgSend(a1, "getBoolForKey:category:default:", CFSTR("implicit_training_enabled"), CFSTR("speakerRecognition"), v2);
}

- (BOOL)containsMultiUserThresholds
{
  void *v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", v1);

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v10 = *MEMORY[0x1E0D18F60];
      v8 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSAsset(SpeakerRecognition) containsMultiUserThresholds]";
        v18 = 2114;
        v19 = v1;
        _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
        v8 = 0;
      }
      goto LABEL_17;
    }
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    if (v6)
    {
      v7 = *MEMORY[0x1E0D18F60];
      v8 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136315650;
      v17 = "-[CSAsset(SpeakerRecognition) containsMultiUserThresholds]";
      v18 = 2114;
      v19 = v1;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Could not decode contents of: %{public}@: err: %{public}@", buf, 0x20u);
    }
    else if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("speakerRecognition"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("speakerRecognition"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("multiUserConfidentScoreThreshold"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v13 != 0;

      }
      else
      {
        v8 = 0;
      }

      goto LABEL_16;
    }
    v8 = 0;
    goto LABEL_16;
  }
  v9 = *MEMORY[0x1E0D18F60];
  v8 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[CSAsset(SpeakerRecognition) containsMultiUserThresholds]";
    v18 = 2114;
    v19 = v1;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@ doesnt exist", buf, 0x16u);
    v8 = 0;
  }
LABEL_18:

  return v8;
}

- (uint64_t)useSpeakerRecognitionAsset
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("useSpeakerRecognitionAsset"), CFSTR("speakerRecognition"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)useTDTIEnrollment
{
  return objc_msgSend(a1, "getBoolForKey:category:default:", CFSTR("useTDTIEnrollment"), CFSTR("speakerRecognition"), 0);
}

@end
