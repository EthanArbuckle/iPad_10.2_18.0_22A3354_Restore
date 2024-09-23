@implementation NSError(WCError)

+ (id)wcErrorWithCode:()WCError userInfo:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "userInfoDictionaryWithErrorStringsForErrorCode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v6);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WCErrorDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)wcErrorWithCode:()WCError
{
  return objc_msgSend(a1, "wcErrorWithCode:userInfo:", a3, 0);
}

+ (id)userInfoDictionaryWithErrorStringsForErrorCode:()WCError
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (userInfoDictionaryWithErrorStringsForErrorCode__onceToken != -1)
    dispatch_once(&userInfoDictionaryWithErrorStringsForErrorCode__onceToken, &__block_literal_global_0);
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Err%d"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)userInfoDictionaryWithErrorStringsForErrorCode__bundle, "localizedStringForKey:value:table:", v5, &stru_24D662AF0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-C"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)userInfoDictionaryWithErrorStringsForErrorCode__bundle, "localizedStringForKey:value:table:", v7, &stru_24D662AF0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD0FD8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-R"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)userInfoDictionaryWithErrorStringsForErrorCode__bundle, "localizedStringForKey:value:table:", v9, &stru_24D662AF0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD0FF0]);

  return v4;
}

+ (id)wcErrorFromReceivedCode:()WCError
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (a3 == 7010)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = 7014;
    v3 = 7010;
LABEL_6:
    objc_msgSend(v5, "wcErrorWithCode:underlyingWCErrorWithCode:", v6, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  v3 = a3;
  if (a3 != 7014)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = 7011;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7014);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

+ (id)wcErrorWithCode:()WCError underlyingError:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD1398];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "wcErrorWithCode:userInfo:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)wcErrorWithCode:()WCError underlyingWCErrorWithCode:
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "wcErrorWithCode:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wcErrorWithCode:underlyingError:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)wcInternalErrorWithCode:()WCError
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WCInternalErrorDomain"), a3, 0);
}

+ (id)wcErrorFromInternalError:()WCError
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("WCInternalErrorDomain"));

  v6 = v3;
  if ((v5 & 1) == 0)
  {
    v6 = v3;
    if ((unint64_t)(objc_msgSend(v3, "code") - 7501) <= 1)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:underlyingError:", 7001, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

@end
