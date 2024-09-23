@implementation NSXPCConnection(MicroLocationUtilities)

+ (id)signingIdentityForSelf
{
  _OWORD v3[2];
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v6;

  *(_OWORD *)task_info_out = 0u;
  v6 = 0u;
  task_info_outCnt = 8;
  if (task_info(*MEMORY[0x24BDAEC58], 0xFu, task_info_out, &task_info_outCnt))
    return 0;
  v3[0] = *(_OWORD *)task_info_out;
  v3[1] = v6;
  objc_msgSend(a1, "_signingIdentityForAuditToken:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)signingIdentity
{
  void *v2;
  uint64_t v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "auditToken");
  objc_msgSend(v2, "_signingIdentityForAuditToken:", &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)hasBooleanEntitlement:()MicroLocationUtilities
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (id)_signingIdentityForAuditToken:()MicroLocationUtilities
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = xpc_copy_code_signing_identity_for_token();
  if (v0)
  {
    v1 = (void *)v0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    free(v1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
