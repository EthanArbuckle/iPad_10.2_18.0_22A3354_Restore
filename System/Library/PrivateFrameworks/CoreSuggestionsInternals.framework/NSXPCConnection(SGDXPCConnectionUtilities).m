@implementation NSXPCConnection(SGDXPCConnectionUtilities)

- (id)sgd_clientName
{
  __SecTask *v2;
  __SecTask *v3;
  void *v4;
  audit_token_t token;
  _OWORD buffer[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "auditToken");
  v2 = SecTaskCreateWithAuditToken(0, &token);
  if (!v2
    || (v3 = v2,
        v4 = (void *)SecTaskCopyValueForEntitlement(v2, CFSTR("application-identifier"), 0),
        CFRelease(v3),
        !v4))
  {
    memset(buffer, 0, 255);
    if (proc_name(objc_msgSend(a1, "processIdentifier"), buffer, 0xFFu) <= 0
      || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), objc_msgSend(a1, "processIdentifier"));
    }
  }
  return v4;
}

@end
