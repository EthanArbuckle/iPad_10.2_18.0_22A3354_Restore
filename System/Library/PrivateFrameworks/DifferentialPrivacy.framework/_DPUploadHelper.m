@implementation _DPUploadHelper

+ (id)ipsFilePathForDate:(id)a3 useGMT:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  +[_DPStrings ipsDirectoryPath](_DPStrings, "ipsDirectoryPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "submissionFilePathInDirectory:uploadName:forDate:useGMT:suffix:", v7, CFSTR("DifferentialPrivacy"), v6, v4, CFSTR("diff_privacy.anon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)writeFileForDA:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ipsFilePathForDate:useGMT:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v4, "writeToFile:atomically:encoding:error:", v6, 1, 4, 0))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)writeFileForParsec:(id)a3 inDirectory:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99D68];
  v8 = a4;
  objc_msgSend(v7, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "submissionFilePathInDirectory:uploadName:forDate:useGMT:suffix:", v8, CFSTR("DifferentialPrivacy"), v9, 1, CFSTR("json.anon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v14 = 0;
    if (objc_msgSend(v6, "writeToFile:atomically:encoding:error:", v10, 1, 4, &v14))
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)writeFileForParsec:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[_DPStrings reportsDirectoryPath](_DPStrings, "reportsDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "writeFileForParsec:inDirectory:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)writeDediscoSubmission:(id)a3 toFileInDirectory:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99D68];
  v8 = a4;
  objc_msgSend(v7, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "submissionFilePathInDirectory:uploadName:forDate:useGMT:suffix:", v8, CFSTR("PrivacyPreservingMeasurement"), v9, 0, CFSTR("json.anon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend(v6, "writeToFile:atomically:encoding:error:", v10, 1, 4, 0))
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)writeFileForDedisco:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[_DPStrings transparencyLogDirectoryPath](_DPStrings, "transparencyLogDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "writeDediscoSubmission:toFileInDirectory:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)submissionFilePathInDirectory:(id)a3 uploadName:(id)a4 forDate:(id)a5 useGMT:(BOOL)a6 suffix:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = (void *)MEMORY[0x1D8256B78]();
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'-'HHmmss"));
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTimeZone:", v17);

  }
  objc_msgSend(v16, "stringFromDate:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@_%@.%@"), v11, v12, v18, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v15);
  return v19;
}

@end
