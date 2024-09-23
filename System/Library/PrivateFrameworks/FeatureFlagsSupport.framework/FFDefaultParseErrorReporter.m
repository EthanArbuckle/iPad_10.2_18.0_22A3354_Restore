@implementation FFDefaultParseErrorReporter

- (void)reportError:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "objectForKeyedSubscript:", FFParseErrorContextFilenameKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v15, "objectForKeyedSubscript:", FFParseErrorContextFilenameKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR(" in file \"%@\":"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E987FE78;
  }

  objc_msgSend(v15, "objectForKeyedSubscript:", FFParseErrorContextKeyKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v15, "objectForKeyedSubscript:", FFParseErrorContextKeyKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR(" while reading key \"%@\":"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_1E987FE78;
  }

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v15, "objectForKeyedSubscript:", FFParseErrorContextSeverityKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", FFParseErrorMessageKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@%@ %@"), v12, v6, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("%@"), v14);
}

@end
