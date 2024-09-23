@implementation LAPSErrorBuilder

+ (NSError)userCanceledError
{
  return (NSError *)objc_msgSend(a1, "_errorWithCode:debugDescription:", 0, CFSTR("User canceled"));
}

+ (id)clientCanceledError
{
  return (id)objc_msgSend(a1, "_errorWithCode:debugDescription:", 1, CFSTR("Client canceled"));
}

+ (id)systemCanceledErrorWithDebugDescription:(id)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:debugDescription:", 2, a3);
}

+ (id)invalidPasscodeError
{
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDD0BA0];
  v7[0] = CFSTR("Invalid passcode");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:userInfo:", 4, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)invalidPasscodeErrorWithFailedAttemptsCount:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = *MEMORY[0x24BDD0BA0];
  v8[1] = CFSTR("LAPSFailedAttemptsErrorKey");
  v9[0] = CFSTR("Invalid passcode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:userInfo:", 4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)invalidPasscodeErrorWithFailedAttemptsCount:(int64_t)a3 backoffTimeout:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDD0BA0];
  v13[0] = CFSTR("Invalid passcode");
  v12[0] = v6;
  v12[1] = CFSTR("LAPSFailedAttemptsErrorKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("LAPSBackOffTimeoutErrorKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:userInfo:", 4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)newPasscodeIsTooEasyError
{
  objc_msgSend(a1, "_errorWithCode:debugDescription:", 5, CFSTR("New passcode is too easy"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newPasscodeDoesNotMeetRequirementsErrorWithLocalizedDescription:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    +[LAPSErrorBuilder newPasscodeDoesNotMeetRequirementsErrorWithLocalizedDescription:].cold.1();
  v5 = v4;
  v6 = *MEMORY[0x24BDD0FC8];
  v10[0] = *MEMORY[0x24BDD0BA0];
  v10[1] = v6;
  v11[0] = CFSTR("Passcode does not meet requirements");
  v11[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:userInfo:", 6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)tooManyAttemptsError
{
  return (id)objc_msgSend(a1, "_errorWithCode:debugDescription:", 3, CFSTR("User failed to provided correct recovery passcode too many times"));
}

+ (id)deniedByMDMError
{
  return (id)objc_msgSend(a1, "_errorWithCode:debugDescription:", 7, CFSTR("Operation not allowed by MDM"));
}

+ (id)deniedByLAError
{
  return (id)objc_msgSend(a1, "_errorWithCode:debugDescription:", 8, CFSTR("Operation not allowed by LA"));
}

+ (id)genericError
{
  return (id)objc_msgSend(a1, "_genericErrorWithUserInfo:", 0);
}

+ (id)genericErrorWithUnderlyingError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    +[LAPSErrorBuilder genericErrorWithUnderlyingError:].cold.1();
  v5 = v4;
  v9 = *MEMORY[0x24BDD1398];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:userInfo:", 9, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)genericErrorWithUnderlyingError:(id)a3 debugDescription:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDD0BA0];
  v13[0] = *MEMORY[0x24BDD1398];
  v13[1] = v6;
  v14[0] = a3;
  v14[1] = a4;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "errorWithCode:userInfo:", 9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)checkError:(id)a3 hasCode:(int64_t)a4
{
  id v5;
  void *v6;
  int v7;
  BOOL v8;

  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.LocalAuthentication.LAPSErrorDomain"));

  if (v7)
    v8 = objc_msgSend(v5, "code") == a4;
  else
    v8 = 0;

  return v8;
}

+ (BOOL)checkErrorIsInteractive:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.LocalAuthentication.LAPSErrorDomain")))
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("LAPSInteractiveErrorKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.LocalAuthentication.LAPSErrorDomain"), a3, a4);
}

+ (id)_genericErrorWithDebugDescription:(id)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:debugDescription:", 9, a3);
}

+ (id)_genericErrorWithUserInfo:(id)a3
{
  return (id)objc_msgSend(a1, "errorWithCode:userInfo:", 9, a3);
}

+ (id)_errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0BA0];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.LocalAuthentication.LAPSErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)newPasscodeDoesNotMeetRequirementsErrorWithLocalizedDescription:.cold.1()
{
  __assert_rtn("+[LAPSErrorBuilder newPasscodeDoesNotMeetRequirementsErrorWithLocalizedDescription:]", "LAPSError.m", 67, "localizedDescription != nil");
}

+ (void)genericErrorWithUnderlyingError:.cold.1()
{
  __assert_rtn("+[LAPSErrorBuilder genericErrorWithUnderlyingError:]", "LAPSError.m", 96, "error != nil");
}

@end
