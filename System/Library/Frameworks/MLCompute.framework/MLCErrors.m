@implementation MLCErrors

+ (id)createErrorWithCode:(int64_t)a3 description:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB35C8];
  +[MLCStrings errorDomainGeneric](MLCStrings, "errorDomainGeneric");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0CB2D50];
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCLog framework](MLCLog, "framework");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D4999000, v10, OS_LOG_TYPE_INFO, "%@ : %@", (uint8_t *)&v12, 0x16u);
  }

  return v9;
}

+ (id)invalidStateErrorForMethod:(id)a3 description:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: invalid state : %@"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)invalidInputErrorForMethod:(id)a3 description:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: invalid inputs : %@"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
