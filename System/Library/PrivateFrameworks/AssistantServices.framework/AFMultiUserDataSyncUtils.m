@implementation AFMultiUserDataSyncUtils

+ (id)suiteName
{
  return CFSTR("com.apple.assistant");
}

+ (id)audioAppSignalsDataKey
{
  return CFSTR("SiriInferenceAudioSignals");
}

+ (id)audioAppSignalsTimestampKey
{
  return CFSTR("SiriInferenceAudioSignalsTimestamp");
}

+ (id)audioAppSignalsLastSyncTimestampKey
{
  return CFSTR("SiriInferenceAudioSignalsLastSyncTimestamp");
}

+ (void)storeAudioAppSignals:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99EA0];
    v5 = a3;
    v6 = [v4 alloc];
    objc_msgSend(a1, "suiteName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v6, "initWithSuiteName:", v7);

    objc_msgSend(a1, "audioAppSignalsDataKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v5, v8);

    objc_msgSend(a1, "localTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "audioAppSignalsTimestampKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v10, v11);

  }
}

+ (id)retrieveAudioAppSignals
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  objc_msgSend(a1, "suiteName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuiteName:", v4);

  objc_msgSend(a1, "localTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "audioAppSignalsLastSyncTimestampKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, v8);

  objc_msgSend(a1, "audioAppSignalsDataKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)localTime
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "secondsFromGMTForDate:", v2);
  v6 = (double)(objc_msgSend(v4, "secondsFromGMTForDate:", v2) - v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v2, v6);

  return v7;
}

@end
