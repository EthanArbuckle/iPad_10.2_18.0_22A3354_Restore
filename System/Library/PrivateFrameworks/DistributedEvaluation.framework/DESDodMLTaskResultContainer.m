@implementation DESDodMLTaskResultContainer

- (DESDodMLTaskResultContainer)initWithJSONResult:(id)a3 binaryResultURL:(id)a4 sandboxExtension:(id)a5 duration:(double)a6
{
  id v11;
  id v12;
  id v13;
  DESDodMLTaskResultContainer *v14;
  DESDodMLTaskResultContainer *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DESDodMLTaskResultContainer;
  v14 = -[DESDodMLTaskResultContainer init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_JSONResult, a3);
    objc_storeStrong((id *)&v15->_binaryResultURL, a4);
    objc_storeStrong((id *)&v15->_sandboxExtension, a5);
    v15->_duration = a6;
  }

  return v15;
}

- (id)taskResultWithError:(id *)a3
{
  NSURL **p_binaryResultURL;
  NSString **p_sandboxExtension;
  DESSandBoxManager *v7;
  void *v8;
  DESSandBoxManager *v9;
  BOOL v10;
  id v11;
  DESMMappedFile *v12;
  DESMMappedFile *v13;
  DESDodMLMMappedTaskResult *v14;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  NSString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  p_binaryResultURL = &self->_binaryResultURL;
  if (!self->_binaryResultURL)
    return -[DESInternalDodMLTaskResult initWithJSONResult:binaryResult:deferred:deferralURL:duration:]([DESInternalDodMLTaskResult alloc], "initWithJSONResult:binaryResult:deferred:deferralURL:duration:", self->_JSONResult, 0, 0, 0, self->_duration);
  p_sandboxExtension = &self->_sandboxExtension;
  if (self->_sandboxExtension)
  {
    v7 = [DESSandBoxManager alloc];
    v27 = *p_sandboxExtension;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[DESSandBoxManager initWithExtensions:](v7, "initWithExtensions:", v8);

    v24 = 0;
    v10 = -[DESSandBoxManager consumeExtensionsWithError:](v9, "consumeExtensionsWithError:", &v24);
    v11 = v24;
    if (v10)
    {
      v12 = -[DESMMappedFile initWithURL:]([DESMMappedFile alloc], "initWithURL:", *p_binaryResultURL);
      if (v12)
      {
        v13 = v12;
        v14 = -[DESDodMLMMappedTaskResult initWithJSONResult:sandboxManager:mmappedFile:duration:]([DESDodMLMMappedTaskResult alloc], "initWithJSONResult:sandboxManager:mmappedFile:duration:", self->_JSONResult, v9, v12, self->_duration);
        if (!a3)
          goto LABEL_16;
      }
      else
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0CB2D50];
        v26 = CFSTR("Fail to mmap file.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 7003, v21);
        v22 = objc_claimAutoreleasedReturnValue();

        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[DESDodMLTaskResultContainer taskResultWithError:].cold.2();

        v14 = 0;
        v13 = 0;
        v11 = (id)v22;
        if (!a3)
          goto LABEL_16;
      }
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[DESDodMLTaskResultContainer taskResultWithError:].cold.3();

      v14 = 0;
      v13 = 0;
      if (!a3)
        goto LABEL_16;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("Missing  sandboxExtension.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 7002, v17);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[DESDodMLTaskResultContainer taskResultWithError:].cold.1(v18);

    v14 = 0;
    v13 = 0;
    v9 = 0;
    if (!a3)
      goto LABEL_16;
  }
  *a3 = objc_retainAutorelease(v11);
LABEL_16:

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(binaryResultURL=%@, JSONResult=%@, sandboxExtension=%@, duration=%.1f)"), v5, self->_binaryResultURL, self->_JSONResult, self->_sandboxExtension, *(_QWORD *)&self->_duration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *JSONResult;
  NSURL *binaryResultURL;
  NSString *sandboxExtension;
  id v8;

  v4 = a3;
  JSONResult = self->_JSONResult;
  v8 = v4;
  if (JSONResult)
  {
    objc_msgSend(v4, "encodeObject:forKey:", JSONResult, CFSTR("JSONResult"));
    v4 = v8;
  }
  binaryResultURL = self->_binaryResultURL;
  if (binaryResultURL)
  {
    objc_msgSend(v8, "encodeObject:forKey:", binaryResultURL, CFSTR("BinaryResultURL"));
    v4 = v8;
  }
  sandboxExtension = self->_sandboxExtension;
  if (sandboxExtension)
  {
    objc_msgSend(v8, "encodeObject:forKey:", sandboxExtension, CFSTR("SandboxExtension"));
    v4 = v8;
  }
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("Duration"), self->_duration);

}

- (DESDodMLTaskResultContainer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  DESDodMLTaskResultContainer *v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("JSONResult")))
  {
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("JSONResult"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("BinaryResultURL")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BinaryResultURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("SandboxExtension")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SandboxExtension"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Duration"));
  v14 = -[DESDodMLTaskResultContainer initWithJSONResult:binaryResultURL:sandboxExtension:duration:](self, "initWithJSONResult:binaryResultURL:sandboxExtension:duration:", v11, v12, v13);

  return v14;
}

- (NSDictionary)JSONResult
{
  return self->_JSONResult;
}

- (NSURL)binaryResultURL
{
  return self->_binaryResultURL;
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_binaryResultURL, 0);
  objc_storeStrong((id *)&self->_JSONResult, 0);
}

- (void)taskResultWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B96E5000, log, OS_LOG_TYPE_ERROR, "Missing sandboxExtension.", v1, 2u);
}

- (void)taskResultWithError:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(&dword_1B96E5000, v0, v1, "Fail to mmap file=%@ with errror=%@.");
}

- (void)taskResultWithError:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(&dword_1B96E5000, v0, v1, "Fail to consume sandbox extension=%@ with errror=%@.");
}

@end
