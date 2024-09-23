@implementation NSXPCConnection(SLClientAuthentication)

- (const)sl_clientHasEntitlement:()SLClientAuthentication
{
  uint64_t v3;
  id v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  CFTypeID v8;
  void *v9;
  void *v10;
  int v11;
  char *v12;
  const char *v13;
  id v15;
  size_t v16;

  v5 = a3;
  v6 = (const __CFBoolean *)objc_msgSend(a1, "valueForEntitlement:", v5);
  v7 = v6;
  if (v6)
  {
    v8 = CFGetTypeID(v6);
    if (v8 == CFBooleanGetTypeID())
      v7 = (const __CFBoolean *)(CFBooleanGetValue(v7) != 0);
    else
      v7 = 0;
  }
  else
  {
    v15 = v5;
    _SLLog(v3, 3, CFSTR("Unable to get entitlement '%@'"));
  }
  objc_msgSend(a1, "sl_localizedClientName", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v16 = 648;
    dword_1EF4938DC = objc_msgSend(a1, "processIdentifier");
    byte_1EF49404B = 0;
    v11 = sysctl(getprocname_name, 4u, &getprocname_kp, &v16, 0, 0);
    if (byte_1EF49404B)
      v12 = &byte_1EF49404B;
    else
      v12 = "exited?";
    if (v11)
      v13 = "?";
    else
      v13 = v12;
    objc_msgSend(v10, "stringWithCString:encoding:", v13, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _SLLog(v3, 6, CFSTR("Entitlement %@ verified for %@: %@"));

  return v7;
}

- (id)sl_localizedClientName
{
  const __CFArray *v1;
  const __CFArray *v2;
  void *v3;

  objc_msgSend(a1, "processIdentifier");
  v1 = (const __CFArray *)SBSCopyDisplayIdentifiersForProcessID();
  if (v1)
  {
    v2 = v1;
    if (CFArrayGetCount(v1))
    {
      CFArrayGetValueAtIndex(v2, 0);
      v3 = (void *)SBSCopyLocalizedApplicationNameForDisplayIdentifier();
    }
    else
    {
      v3 = 0;
    }
    CFRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_clientBundleID
{
  objc_msgSend(a1, "processIdentifier");
  return (id)SBSCopyBundleInfoValueForKeyAndProcessID();
}

@end
