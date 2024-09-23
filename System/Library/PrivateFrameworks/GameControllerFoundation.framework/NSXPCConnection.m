@implementation NSXPCConnection

- (id)gc_peerBundleIdentifier
{
  void *v0;
  __SecTask *v1;
  void *v2;
  id v3;
  void *v4;
  unint64_t v5;
  int v6;
  BOOL v8;
  void *v9;
  int v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  audit_token_t v16;
  audit_token_t token;
  uint64_t v18;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v18 = *MEMORY[0x1E0C80C00];
  if (!v0)
    goto LABEL_31;
  memset(&v16, 0, sizeof(v16));
  objc_msgSend(v0, "auditToken");
  memset(&token, 0, sizeof(token));
  v1 = SecTaskCreateWithAuditToken(0, &token);
  if (!v1 || (v2 = (void *)SecTaskCopyValueForEntitlement(v1, CFSTR("application-identifier"), 0)) == 0)
  {
LABEL_24:
    v10 = proc_pidpath_audittoken(&v16, &token, 0x1000u);
    if (v10 >= 1)
    {
      v11 = -[NSString initWithBytes:length:encoding:]([NSString_0 alloc], "initWithBytes:length:encoding:", &token, v10, 4);
      +[NSURL fileURLWithPath:](&off_1F03AA4A8, "fileURLWithPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)_CFBundleCopyBundleURLForExecutableURL();
        if (v13)
        {
          +[NSBundle bundleWithURL:](NSBundle_0, "bundleWithURL:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {

            return v9;
          }
        }

      }
    }
LABEL_31:
    v9 = 0;
    return v9;
  }
  v3 = v2;
  if ((unint64_t)objc_msgSend(v3, "length") >= 0xB
    && objc_msgSend(v3, "characterAtIndex:", 10) == 46)
  {
    objc_msgSend(v3, "substringWithRange:", 0, 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    do
    {
      v6 = objc_msgSend(v3, "characterAtIndex:", v5);
      v8 = (v6 - 65) < 0x1A || (v6 - 48) < 0xA;
      if (v5 > 8)
        break;
      ++v5;
    }
    while (v8);
    if (v8)
    {
      objc_msgSend(v3, "substringWithRange:", 11, objc_msgSend(v3, "length") - 11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        goto LABEL_21;
      goto LABEL_20;
    }

  }
  v4 = 0;
LABEL_20:
  v9 = (void *)CFRetain(v3);
LABEL_21:
  if (v4)
    CFRelease(v4);

  CFRelease(v3);
  if (!v9)
    goto LABEL_24;
  return v9;
}

@end
