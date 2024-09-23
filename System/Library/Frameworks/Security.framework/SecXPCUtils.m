@implementation SecXPCUtils

+ (BOOL)clientCanEditPreferenceOwnership
{
  void *v2;
  void *v3;
  void *v4;
  __SecTask *v5;
  __SecTask *v7;
  void *v8;
  CFTypeID v9;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "valueForEntitlement:", CFSTR("keychain-access-groups"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
      && (objc_msgSend(v4, "containsObject:", CFSTR("*")) & 1) != 0)
    {

      LOBYTE(v5) = 1;
      goto LABEL_8;
    }

LABEL_7:
    LOBYTE(v5) = 0;
    goto LABEL_8;
  }
  v7 = SecTaskCreateFromSelf(0);
  v5 = v7;
  if (!v7)
    goto LABEL_8;
  v8 = (void *)SecTaskCopyValueForEntitlement(v7, CFSTR("keychain-access-groups"), 0);
  CFRelease(v5);
  if (!v8)
    goto LABEL_7;
  v9 = CFGetTypeID(v8);
  if (v9 == CFArrayGetTypeID())
    LOBYTE(v5) = objc_msgSend(v8, "containsObject:", CFSTR("*"));
  else
    LOBYTE(v5) = 0;
  CFRelease(v8);
LABEL_8:

  return (char)v5;
}

+ (__CFString)copySigningIdentifier:(id)a3
{
  id v3;
  void *v4;
  SecTaskRef v5;
  SecTaskRef v6;
  __CFString *v7;
  audit_token_t v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "auditToken");
    v5 = SecTaskCreateWithAuditToken(0, &v9);
  }
  else
  {
    v5 = SecTaskCreateFromSelf(0);
  }
  v6 = v5;
  if (v5)
  {
    v7 = (__CFString *)SecTaskCopyIdentifier((uint64_t)v5, 11, 0);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (__CFString)copyApplicationIdentifierFromSelf
{
  __SecTask *v2;
  __SecTask *v3;
  __CFString *v4;
  __CFString *v5;
  CFTypeID v6;

  v2 = SecTaskCreateFromSelf(0);
  if (!v2)
    return +[SecXPCUtils copySigningIdentifier:](SecXPCUtils, "copySigningIdentifier:", 0);
  v3 = v2;
  v4 = (__CFString *)SecTaskCopyValueForEntitlement(v2, CFSTR("application-identifier"), 0);
  if (v4)
  {
    v5 = v4;
    CFRelease(v3);
  }
  else
  {
    v5 = (__CFString *)SecTaskCopyValueForEntitlement(v3, CFSTR("com.apple.application-identifier"), 0);
    CFRelease(v3);
    if (!v5)
      return +[SecXPCUtils copySigningIdentifier:](SecXPCUtils, "copySigningIdentifier:", 0);
  }
  v6 = CFGetTypeID(v5);
  if (v6 == CFStringGetTypeID())
    return v5;
  CFRelease(v5);
  return +[SecXPCUtils copySigningIdentifier:](SecXPCUtils, "copySigningIdentifier:", 0);
}

+ (__CFString)copyApplicationIdentifierFromConnection:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *Copy;

  v3 = a3;
  objc_msgSend(v3, "valueForEntitlement:", CFSTR("application-identifier"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v4
    && (objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.application-identifier")),
        (v4 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0)
    || !-[__CFString isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
    || (Copy = (__CFString *)CFStringCreateCopy(0, v4)) == 0)
  {
    Copy = +[SecXPCUtils copySigningIdentifier:](SecXPCUtils, "copySigningIdentifier:", v3);
  }

  return Copy;
}

+ (__CFString)copyApplicationIdentifier
{
  void *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = +[SecXPCUtils copyApplicationIdentifierFromConnection:](SecXPCUtils, "copyApplicationIdentifierFromConnection:", v2);
  else
    v3 = +[SecXPCUtils copyApplicationIdentifierFromSelf](SecXPCUtils, "copyApplicationIdentifierFromSelf");
  v4 = v3;

  return v4;
}

@end
