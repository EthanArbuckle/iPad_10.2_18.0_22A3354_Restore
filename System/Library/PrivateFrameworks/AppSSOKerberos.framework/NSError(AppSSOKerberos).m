@implementation NSError(AppSSOKerberos)

+ (uint64_t)credentialMissing
{
  return objc_msgSend(a1, "kerberosErrorWithCode:withDescription:", -110, CFSTR("No gss credentials or errors found during authentication"));
}

+ (uint64_t)passwordChangeNotEnabled
{
  return objc_msgSend(a1, "kerberosErrorWithCode:withDescription:", -111, CFSTR("Password change is not enabled"));
}

+ (uint64_t)servicePrincipalNameMissing
{
  return objc_msgSend(a1, "kerberosErrorWithCode:withDescription:", -112, CFSTR("Service principal name is missing"));
}

+ (uint64_t)invalidKerberosOperation
{
  return objc_msgSend(a1, "kerberosErrorWithCode:withDescription:", -113, CFSTR("Invalid Kerberos operation"));
}

+ (uint64_t)hostNameMissing
{
  return objc_msgSend(a1, "kerberosErrorWithCode:withDescription:", -114, CFSTR("Host name missing"));
}

+ (uint64_t)unhandledKerberosResult
{
  return objc_msgSend(a1, "kerberosErrorWithCode:withDescription:", -115, CFSTR("Kerberos result unhandled"));
}

+ (uint64_t)sourceAppNotAllowed
{
  return objc_msgSend(a1, "kerberosErrorWithCode:withDescription:", -116, CFSTR("Source app not allowed"));
}

+ (uint64_t)KDCUnreachable
{
  return objc_msgSend(a1, "kerberosErrorWithCode:withDescription:", -118, CFSTR("KDC unreachable"));
}

+ (id)kerberosErrorWithCode:()AppSSOKerberos withDescription:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD1540];
  v6 = a4;
  v7 = [v5 alloc];
  v11 = *MEMORY[0x24BDD0FC8];
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("com.apple.AppSSO"), a3, v8);
  return v9;
}

+ (uint64_t)passwordSyncNotEnabled
{
  return objc_msgSend(a1, "kerberosErrorWithCode:withDescription:", -117, CFSTR("Password sync is not enabled"));
}

@end
