@implementation SAError

+ (id)errorWithCode:(int64_t)a3
{
  __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  if (a3 < 4096)
  {
    switch(a3)
    {
      case 1:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("SAErrorNotAuthorized");
        goto LABEL_11;
      case 2:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("SAErrorNotAllowed");
        goto LABEL_11;
      case 3:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("SAErrorInvalidArgument");
        goto LABEL_11;
      case 4:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("SAErrorOperationFailed");
LABEL_11:
        objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_2505B3B28, 0);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        v5 = 0;
        break;
    }
  }
  else if (((a3 == 4096) & os_variant_has_internal_content()) != 0)
  {
    v5 = CFSTR("Place holder for future private errors");
  }
  else
  {
    v5 = 0;
  }
  switch(a3)
  {
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("SAErrorOperationFailed");
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("SAErrorNotAvailableRecovery");
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("SAErrorNotAuthorizedRecovery");
      break;
    default:
      v12 = 0;
      goto LABEL_20;
  }
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_2505B3B28, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  objc_msgSend(a1, "errorWithCode:description:recoverySuggestion:", a3, v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5
{
  return (id)objc_msgSend(a1, "errorWithCode:description:recoverySuggestion:underlyingError:", a3, a4, a5, 0);
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5 underlyingError:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD0FC8]);
  if (v10)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD0FF0]);
  if (v11)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD1398]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", SAErrorDomain, a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
