@implementation CADSpotlightLogger

+ (void)logError:(id)a3
{
  uint64_t v3;

  objc_msgSend(a1, "_logWithFormat:args:prependErrorMarker:", a3, &v3, 1);
}

+ (void)log:(id)a3
{
  uint64_t v3;

  objc_msgSend(a1, "_logWithFormat:args:prependErrorMarker:", a3, &v3, 0);
}

+ (void)_logWithFormat:(id)a3 args:(char *)a4 prependErrorMarker:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  id v15;

  v5 = a5;
  v7 = a3;
  if (_logWithFormat_args_prependErrorMarker__onceToken != -1)
    dispatch_once(&_logWithFormat_args_prependErrorMarker__onceToken, &__block_literal_global_2);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v7, a4);
  v9 = (void *)_logWithFormat_args_prependErrorMarker__dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v5)
    v13 = CFSTR("%@ SPOTLIGHT_ERROR %@\n");
  else
    v13 = CFSTR("%@ %@\n");
  v14 = (void *)objc_msgSend(v12, "initWithFormat:", v13, v11, v8);
  objc_msgSend(v14, "dataUsingEncoding:", 4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  DACPLoggingAppendDataToLogFile();

}

void __61__CADSpotlightLogger__logWithFormat_args_prependErrorMarker___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0D1C458];
  v0 = DACustomLogDirectory();
  v1 = *MEMORY[0x1E0D1C468];
  v10[0] = v0;
  v10[1] = CFSTR("SpotlightLog");
  v2 = *MEMORY[0x1E0D1C470];
  v9[1] = v1;
  v9[2] = v2;
  v9[3] = *MEMORY[0x1E0D1C460];
  v10[2] = &unk_1E6A503F0;
  v10[3] = CFSTR("DALogLevel");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1C3E8], "DAManagedDefaultForKey:", CFSTR("DALogLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && objc_msgSend(MEMORY[0x1E0D1C3E8], "isAppleInternalInstall"))
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E6A50408, *MEMORY[0x1E0D1C478]);

    v3 = v5;
  }
  v8 = CFSTR("SpotlightLog");
  MEMORY[0x1BCC9CEB0](objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1), v3);
  v6 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v7 = (void *)_logWithFormat_args_prependErrorMarker__dateFormatter;
  _logWithFormat_args_prependErrorMarker__dateFormatter = (uint64_t)v6;

  objc_msgSend((id)_logWithFormat_args_prependErrorMarker__dateFormatter, "setFormatOptions:", 4083);
}

void __61__CADSpotlightLogger__logWithFormat_args_prependErrorMarker___block_invoke_15(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

@end
