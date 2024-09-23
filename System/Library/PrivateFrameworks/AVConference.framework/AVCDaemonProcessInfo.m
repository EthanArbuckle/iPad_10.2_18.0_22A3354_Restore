@implementation AVCDaemonProcessInfo

+ (id)getDaemonProcessInfo
{
  id v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = +[AVConferenceXPCClient AVConferenceXPCClientSingleton](AVConferenceXPCClient, "AVConferenceXPCClientSingleton");
  v4 = CFSTR("vcGetDaemonProcessInfoUniquePid");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  return (id)objc_msgSend(v2, "sendMessageSync:arguments:xpcArguments:", "vcGetDaemonProcessInfo", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1), 0);
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenWithError:(SEL)a3
{
  id v6;
  void *v7;
  __int128 v8;
  void *v9;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  BOOL v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = +[AVConferenceXPCClient AVConferenceXPCClientSingleton](AVConferenceXPCClient, "AVConferenceXPCClientSingleton");
  v12 = CFSTR("vcDaemonProcessInfoAuditToken");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_msgSend(v6, "sendMessageSync:arguments:xpcArguments:", "vcGetDaemonProcessInfo", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1), 0);
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)retstr->var0 = v8;
  *(_OWORD *)&retstr->var0[4] = v8;
  v9 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ERROR"), VCUtil_AuditTokenForCurrentProcess(retstr));
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("vcDaemonProcessInfoAuditToken"));
  if (v9)
    v11 = 1;
  else
    v11 = result == 0;
  if (!v11)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 getBytes:length:](result, "getBytes:length:", retstr, 32);
  if (a4)
    *a4 = v9;
  return result;
}

@end
