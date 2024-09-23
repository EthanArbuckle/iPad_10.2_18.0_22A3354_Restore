@implementation LARatchetErrorBuilder

+ (id)errorNotArmedWithRatchetState:(id)a3
{
  id v4;
  LARatchetState *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[LARatchetState initWithState:]([LARatchetState alloc], "initWithState:", v4);

  v6 = *MEMORY[0x1E0CB2938];
  v10[0] = CFSTR("RatchetState");
  v10[1] = v6;
  v11[0] = v5;
  v11[1] = CFSTR("Ratchet not ready");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_errorWithCode:userInfo:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)genericErrorWithDebugDescription:(id)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:debugDescription:", 1, a3);
}

+ (id)genericErrorWithUnderlyingError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CB3388];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_errorWithCode:userInfo:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)notInteractiveErrorWithUserInfo:(id)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:userInfo:", 2, a3);
}

+ (id)userCustomCancelErrorWithUserInfo:(id)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:userInfo:", 3, a3);
}

+ (id)passcodeNotSetWithUserInfo:(id)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:userInfo:", 4, a3);
}

+ (id)biometryNotEnrolledWithUserInfo:(id)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:userInfo:", 5, a3);
}

+ (id)beforeFirstUnlockWithUserInfo:(id)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:userInfo:", 6, a3);
}

+ (id)deviceTypeNotSupportedWithUserInfo:(id)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:userInfo:", 7, a3);
}

+ (id)ratchetErrorWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:subcode:", v4, -1, 6))
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RatchetState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "errorNotArmedWithRatchetState:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:", v4, -1004))
    {
      objc_msgSend(v4, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "notInteractiveErrorWithUserInfo:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:", v4, -1027))
    {
      objc_msgSend(v4, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "deviceTypeNotSupportedWithUserInfo:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:", v4, -1025))
    {
      objc_msgSend(v4, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "userCustomCancelErrorWithUserInfo:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:", v4, -5))
    {
      objc_msgSend(v4, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "passcodeNotSetWithUserInfo:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:", v4, -7))
    {
      objc_msgSend(v4, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "biometryNotEnrolledWithUserInfo:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:subcode:", v4, -1008, 1))
      {
        objc_msgSend(a1, "genericErrorWithUnderlyingError:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      objc_msgSend(v4, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "beforeFirstUnlockWithUserInfo:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v8;
  }

LABEL_17:
  return v7;
}

+ (id)_errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0CB2938];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_errorWithCode:userInfo:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.LocalAuthentication.LARatchetErrorDomain"), a3, a4);
}

@end
