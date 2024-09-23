@implementation ECSecureMIMETrustEvaluation

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ECSecureMIMETrustEvaluation_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, block);
  return (OS_os_log *)(id)log_log_3;
}

void __34__ECSecureMIMETrustEvaluation_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;

}

+ (id)evaluateTrust:(__SecTrust *)a3 withOptions:(unint64_t)a4 signerEmailAddress:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTrust:options:signerEmailAddress:", a3, a4, v8);

  return v9;
}

+ (id)reevaluateWithNetworkAccessAllowed:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  id v17[5];

  v17[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "requiresReevaluationWithNetworkAccess") & 1) == 0)
  {
    v13 = v4;
    goto LABEL_12;
  }
  v17[0] = 0;
  serializeTrust(objc_msgSend(v4, "trust"), v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17[0];
  v7 = v6;
  if (!v5)
  {
    +[ECSecureMIMETrustEvaluation log](ECSecureMIMETrustEvaluation, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[ECSecureMIMETrustEvaluation reevaluateWithNetworkAccessAllowed:].cold.1();
    }
    goto LABEL_11;
  }
  v16 = v6;
  v8 = (const void *)copyDeserializedTrust((uint64_t)v5, &v16);
  v9 = v16;

  if (!v8)
  {
    +[ECSecureMIMETrustEvaluation log](ECSecureMIMETrustEvaluation, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[ECSecureMIMETrustEvaluation reevaluateWithNetworkAccessAllowed:].cold.2();
    }
    v7 = v9;
LABEL_11:

    v13 = 0;
    goto LABEL_12;
  }

  v10 = objc_msgSend(v4, "options");
  v11 = objc_msgSend(v4, "trust");
  objc_msgSend(v4, "signerEmailAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "evaluateTrust:withOptions:signerEmailAddress:", v11, v10 | 3, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  CFRelease(v8);
LABEL_12:

  return v13;
}

- (id)_initWithTrust:(__SecTrust *)a3 options:(unint64_t)a4 signerEmailAddress:(id)a5
{
  ECSecureMIMETrustEvaluation *v9;
  ECSecureMIMETrustEvaluation *v10;
  uint64_t v11;
  NSString *signerEmailAddress;
  __SecTrust *trust;
  unint64_t options;
  uint64_t Allowed;
  NSObject *v16;
  id v17;
  const __CFArray *v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  uint64_t i;
  uint64_t v23;
  const void *OidString;
  CFOptionFlags v25;
  SecPolicyRef Revocation;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSError *error;
  void *v32;
  CFArrayRef v33;
  id v34;
  objc_super v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CFArrayRef policies;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v34 = a5;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECSecureMIMETrustEvaluation.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trust"));

  }
  v35.receiver = self;
  v35.super_class = (Class)ECSecureMIMETrustEvaluation;
  v9 = -[ECSecureMIMETrustEvaluation init](&v35, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_trust = a3;
    CFRetain(a3);
    v10->_options = a4;
    v11 = objc_msgSend(v34, "copy");
    signerEmailAddress = v10->_signerEmailAddress;
    v10->_signerEmailAddress = (NSString *)v11;

    trust = v10->_trust;
    options = v10->_options;
    policies = 0;
    LODWORD(Allowed) = SecTrustCopyPolicies(trust, &policies);
    v33 = policies;
    if ((_DWORD)Allowed)
    {
      +[ECSecureMIMETrustEvaluation log](ECSecureMIMETrustEvaluation, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[ECSecureMIMETrustEvaluation _initWithTrust:options:signerEmailAddress:].cold.4(Allowed, v16);

    }
    else
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v18 = v33;
      v19 = -[__CFArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v37;
        v21 = (const void *)*MEMORY[0x1E0CD6F70];
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v37 != v20)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            OidString = (const void *)SecPolicyGetOidString();
            if (!CFEqual(v21, OidString))
              objc_msgSend(v17, "addObject:", v23);
          }
          v19 = -[__CFArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v19);
      }

      if ((options & 2) != 0)
      {
        if ((options & 1) != 0)
          v25 = 3;
        else
          v25 = 67;
        Revocation = SecPolicyCreateRevocation(v25);
        objc_msgSend(v17, "addObject:", Revocation);

      }
      Allowed = SecTrustSetPolicies(trust, v17);
      if ((_DWORD)Allowed)
      {
        +[ECSecureMIMETrustEvaluation log](ECSecureMIMETrustEvaluation, "log");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[ECSecureMIMETrustEvaluation _initWithTrust:options:signerEmailAddress:].cold.3((uint64_t)v17, Allowed, v27);
      }
      else
      {
        Allowed = SecTrustSetNetworkFetchAllowed(trust, options & 1);
        if ((_DWORD)Allowed)
        {
          +[ECSecureMIMETrustEvaluation log](ECSecureMIMETrustEvaluation, "log");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[ECSecureMIMETrustEvaluation _initWithTrust:options:signerEmailAddress:].cold.2(options & 1, Allowed, v27);
        }
        else
        {
          +[ECSecureMIMETrustEvaluation anchorCertificatesForTesting](ECSecureMIMETrustEvaluation, "anchorCertificatesForTesting");
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            LODWORD(Allowed) = SecTrustSetAnchorCertificates(trust, (CFArrayRef)v27);
            if ((_DWORD)Allowed)
            {
              +[ECSecureMIMETrustEvaluation log](ECSecureMIMETrustEvaluation, "log");
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                -[ECSecureMIMETrustEvaluation _initWithTrust:options:signerEmailAddress:].cold.1();

            }
          }
          else
          {
            LODWORD(Allowed) = 0;
          }
        }
      }

      if (!(_DWORD)Allowed)
      {
        -[ECSecureMIMETrustEvaluation _evaluate](v10, "_evaluate");
        goto LABEL_36;
      }
    }
    v10->_trustResult = 7;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], (int)Allowed, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    error = v10->_error;
    v10->_error = (NSError *)v29;

  }
LABEL_36:

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_trust);
  v3.receiver = self;
  v3.super_class = (Class)ECSecureMIMETrustEvaluation;
  -[ECSecureMIMETrustEvaluation dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ECSecureMIMETrustEvaluation)initWithCoder:(id)a3
{
  id v4;
  ECSecureMIMETrustEvaluation *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSString *signerEmailAddress;
  uint64_t v12;
  NSError *error;
  void *v14;
  void *v15;
  id v17[5];

  v17[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ECSecureMIMETrustEvaluation init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_trust"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = 0;
    v7 = copyDeserializedTrust((uint64_t)v6, v17);
    v8 = v17[0];
    if (!v7)
    {
      +[ECSecureMIMETrustEvaluation log](ECSecureMIMETrustEvaluation, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[ECSecureMIMETrustEvaluation initWithCoder:].cold.1();
      }

    }
    v5->_trust = (__SecTrust *)v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_signerEmailAddress"));
    v10 = objc_claimAutoreleasedReturnValue();
    signerEmailAddress = v5->_signerEmailAddress;
    v5->_signerEmailAddress = (NSString *)v10;

    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_options"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_error"));
    v12 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v12;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("EFPropertyKey_trustResult"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_trustResult = objc_msgSend(v15, "unsignedIntValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11[5];

  v11[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v11[0] = 0;
  serializeTrust((uint64_t)-[ECSecureMIMETrustEvaluation trust](self, "trust"), v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11[0];
  if (!v5)
  {
    +[ECSecureMIMETrustEvaluation log](ECSecureMIMETrustEvaluation, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[ECSecureMIMETrustEvaluation encodeWithCoder:].cold.1();
    }

  }
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_trust"));
  -[ECSecureMIMETrustEvaluation signerEmailAddress](self, "signerEmailAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_signerEmailAddress"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ECSecureMIMETrustEvaluation options](self, "options"), CFSTR("EFPropertyKey_options"));
  -[ECSecureMIMETrustEvaluation error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_error"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ECSecureMIMETrustEvaluation trustResult](self, "trustResult"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("EFPropertyKey_trustResult"));

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  const char *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = self->_trustResult - 1;
  if (v5 > 6)
    v6 = "kSecTrustResultInvalid";
  else
    v6 = off_1E7121AB0[v5];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p trust=%@ signerEmailAddress=%@ options=%d trustResult=%s(%d) error=%@>"), v4, self, self->_trust, self->_signerEmailAddress, self->_options, v6, self->_trustResult, self->_error);
}

- (void)_evaluate
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1B9ADE000, v0, v1, "SecTrustGetTrustResult returned %d, evaluation=%@");
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)requiresReevaluationWithNetworkAccess
{
  void *v3;
  NSInteger v4;
  int v5;
  CFDictionaryRef v6;
  void *v7;

  if ((self->_options & 1) != 0)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  -[NSError domain](self->_error, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CB2F90]))
  {

    goto LABEL_7;
  }
  v4 = -[NSError code](self->_error, "code");

  if (v4 != -25318)
  {
LABEL_7:
    v6 = SecTrustCopyResult(self->_trust);
    -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD7070]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "BOOLValue") ^ 1;

    return v5;
  }
  LOBYTE(v5) = 1;
  return v5;
}

+ (NSArray)anchorCertificatesForTesting
{
  return (NSArray *)(id)objc_msgSend((id)sAnchorCertificatesForTesting, "copy");
}

+ (void)setAnchorCertificatesForTesting:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)sAnchorCertificatesForTesting;
  sAnchorCertificatesForTesting = v3;

}

- (__SecTrust)trust
{
  return self->_trust;
}

- (NSString)signerEmailAddress
{
  return self->_signerEmailAddress;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSError)error
{
  return self->_error;
}

- (unsigned)trustResult
{
  return self->_trustResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_signerEmailAddress, 0);
}

+ (void)reevaluateWithNetworkAccessAllowed:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1B9ADE000, v3, v4, "Failed to serialize trust when copying trust: %{public}@", v5);

  OUTLINED_FUNCTION_3();
}

+ (void)reevaluateWithNetworkAccessAllowed:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1B9ADE000, v3, v4, "Failed to deserialize trust when copying trust: %{public}@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)_initWithTrust:options:signerEmailAddress:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1B9ADE000, v0, v1, "SecTrustSetAnchorCertificates returned %d, certificates = %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)_initWithTrust:(char)a1 options:(uint64_t)a2 signerEmailAddress:(NSObject *)a3 .cold.2(char a1, uint64_t a2, NSObject *a3)
{
  const char *v3;
  const char *v4;

  v3 = "false";
  if (a1)
    v3 = "true";
  LODWORD(v4) = 136315394;
  HIDWORD(v4) = (_DWORD)v3;
  OUTLINED_FUNCTION_0_2(&dword_1B9ADE000, a2, a3, "SecTrustSetNetworkFetchAllowed(%s) returned %d", v4, HIDWORD(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)_initWithTrust:(uint64_t)a1 options:(uint64_t)a2 signerEmailAddress:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2114;
  *(_QWORD *)((char *)&v4 + 2) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1B9ADE000, a2, a3, "SecTrustSetPolicies returned %d, policies = %{public}@", v3, (_QWORD)v4, WORD4(v4));
  OUTLINED_FUNCTION_1_0();
}

- (void)_initWithTrust:(int)a1 options:(NSObject *)a2 signerEmailAddress:.cold.4(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B9ADE000, a2, OS_LOG_TYPE_ERROR, "SecTrustCopyPolicies returned %d", (uint8_t *)v2, 8u);
}

- (void)initWithCoder:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1B9ADE000, v3, v4, "Failed to deserialize trust when decoding: %{public}@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)encodeWithCoder:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1B9ADE000, v3, v4, "Failed to serialize trust when encoding: %{public}@", v5);

  OUTLINED_FUNCTION_3();
}

@end
