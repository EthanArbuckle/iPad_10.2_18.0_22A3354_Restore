@implementation NSError(HMIError)

+ (id)_hmiErrorWithCode:()HMIError description:reason:suggestion:underlyingError:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (v11 || v12 || v13 || v14)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", v11, &stru_24DBF1B40, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BDD0FC8]);

    }
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", v12, &stru_24DBF1B40, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BDD0FD8]);

    }
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", v13, &stru_24DBF1B40, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BDD0FF0]);

    }
    if (v15)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD1398]);
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMIErrorDomain"), a3, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (uint64_t)hmiErrorWithCode:()HMIError underlyingError:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "_hmiErrorWithCode:description:reason:suggestion:underlyingError:", a3, 0, 0, 0, a4);
}

+ (uint64_t)hmiErrorWithCode:()HMIError
{
  return objc_msgSend(MEMORY[0x24BDD1540], "_hmiErrorWithCode:description:reason:suggestion:underlyingError:", a3, 0, 0, 0, 0);
}

+ (uint64_t)hmiErrorWithCode:()HMIError description:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "_hmiErrorWithCode:description:reason:suggestion:underlyingError:", a3, a4, 0, 0, 0);
}

+ (uint64_t)hmiErrorWithCode:()HMIError description:underlyingError:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "_hmiErrorWithCode:description:reason:suggestion:underlyingError:", a3, a4, 0, 0, a5);
}

+ (uint64_t)hmiPrivateErrorWithCode:()HMIError underlyingError:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "_hmiErrorWithCode:description:reason:suggestion:underlyingError:", a3, 0, 0, 0, a4);
}

+ (uint64_t)hmiPrivateErrorWithCode:()HMIError
{
  return objc_msgSend(MEMORY[0x24BDD1540], "_hmiErrorWithCode:description:reason:suggestion:underlyingError:", a3, 0, 0, 0, 0);
}

+ (uint64_t)hmiPrivateErrorWithCode:()HMIError description:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "_hmiErrorWithCode:description:reason:suggestion:underlyingError:", a3, a4, 0, 0, 0);
}

+ (uint64_t)hmiPrivateErrorWithCode:()HMIError description:underlyingError:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "_hmiErrorWithCode:description:reason:suggestion:underlyingError:", a3, a4, 0, 0, a5);
}

+ (uint64_t)hmiPrivateErrorWithCode:()HMIError description:suggestion:underlyingError:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "_hmiErrorWithCode:description:reason:suggestion:underlyingError:", a3, a4, 0, a5, a6);
}

@end
