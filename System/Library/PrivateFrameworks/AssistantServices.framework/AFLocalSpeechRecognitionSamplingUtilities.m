@implementation AFLocalSpeechRecognitionSamplingUtilities

+ (id)component
{
  return CFSTR("LocalSpeechRecognition");
}

+ (id)sampledSubDirectoryPath
{
  return CFSTR("/Caches/com.apple.speech.localspeechrecognition/lsr_audio_dumps");
}

+ (id)sampledCachesSubDirectoryPath
{
  return CFSTR("com.apple.speech.localspeechrecognition/lsr_audio_dumps");
}

+ (id)sampledSubDirectoryNameFormat
{
  return CFSTR("yyyyMMdd-HHmmss");
}

+ (id)samplingDateAsString
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isFileNameValid:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "dateFromFileName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (int64_t)calculateFileNameAgeInDays:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(a1, "dateFromFileName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:toDate:options:", 16, v3, v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "day");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)dateFromFileName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB38E8];
  v5 = a3;
  objc_msgSend(v4, "regularExpressionWithPattern:options:error:", CFSTR("^\\D+-"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), &stru_1E3A37708);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\.\\d+(\\.\\w+)?$"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), &stru_1E3A37708);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateFromString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
