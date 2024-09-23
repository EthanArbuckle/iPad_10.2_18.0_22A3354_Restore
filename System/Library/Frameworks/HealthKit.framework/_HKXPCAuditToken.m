@implementation _HKXPCAuditToken

- (_HKXPCAuditToken)initWithAuditToken:(id *)a3
{
  _HKXPCAuditToken *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKXPCAuditToken;
  result = -[_HKXPCAuditToken init](&v6, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = v5;
  }
  return result;
}

- (int)processIdentifier
{
  return self->_auditToken.val[5];
}

- (NSString)signingIdentifier
{
  void *v3;
  __int128 v4;
  _OWORD v6[2];

  v3 = (void *)objc_opt_class();
  v4 = *(_OWORD *)&self->_auditToken.val[4];
  v6[0] = *(_OWORD *)self->_auditToken.val;
  v6[1] = v4;
  objc_msgSend(v3, "signingIdentifierFromAuditToken:", v6);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)auditTokenForCurrentTask
{
  id v2;
  _OWORD v4[2];
  mach_msg_type_number_t task_info_outCnt;

  v2 = objc_alloc((Class)a1);
  task_info_outCnt = 8;
  memset(v4, 0, sizeof(v4));
  task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)v4, &task_info_outCnt);
  return (id)objc_msgSend(v2, "initWithAuditToken:", v4);
}

+ (id)signingIdentifierFromAuditToken:(id *)a3
{
  __int128 v3;
  __SecTask *v4;
  __SecTask *v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  audit_token_t cf;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0, &cf);
  if (v4)
  {
    v5 = v4;
    *(_QWORD *)cf.val = 0;
    v6 = (__CFString *)SecTaskCopySigningIdentifier(v4, (CFErrorRef *)&cf);
    if (!v6 && *(_QWORD *)cf.val)
    {
      _HKInitializeLogging();
      v7 = HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
        +[_HKXPCAuditToken signingIdentifierFromAuditToken:].cold.2((uint64_t *)&cf, v7);
      CFRelease(*(CFTypeRef *)cf.val);
    }
    CFRelease(v5);
  }
  else
  {
    _HKInitializeLogging();
    v8 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      +[_HKXPCAuditToken signingIdentifierFromAuditToken:].cold.1(v8);
    v6 = 0;
  }
  return v6;
}

- (unint64_t)hash
{
  return -[_HKXPCAuditToken processIdentifier](self, "processIdentifier");
}

- (BOOL)isEqual:(id)a3
{
  _HKXPCAuditToken *v4;
  BOOL v8;

  v4 = (_HKXPCAuditToken *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    v8 = (objc_opt_isKindOfClass() & 1) != 0
      && *(_QWORD *)self->_auditToken.val == *(_QWORD *)v4->_auditToken.val
      && *(_QWORD *)&self->_auditToken.val[2] == *(_QWORD *)&v4->_auditToken.val[2]
      && *(_QWORD *)&self->_auditToken.val[4] == *(_QWORD *)&v4->_auditToken.val[4]
      && *(_QWORD *)&self->_auditToken.val[6] == *(_QWORD *)&v4->_auditToken.val[6];
  }

  return v8;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

+ (void)signingIdentifierFromAuditToken:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "Unable to create SecTask for audit token", v1, 2u);
}

+ (void)signingIdentifierFromAuditToken:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "Unable to get signing identifier from task: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
