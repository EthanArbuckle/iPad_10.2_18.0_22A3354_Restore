@implementation NSError(FSKitAdditions)

+ (void)fskit_initLocalizationStrings
{
  if (fskit_initLocalizationStrings_pred != -1)
    dispatch_once(&fskit_initLocalizationStrings_pred, &__block_literal_global_6);
}

+ (id)_fskit_errorWithFSKitCode:()FSKitAdditions itemURL:debugDescription:message:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a1, "fskit_initLocalizationStrings");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD1328]);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD0BA0]);
  if (v10)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDBD378]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("FSKitErrorDomain"), a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_fskit_errorWithFSKitCode:()FSKitAdditions variant:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "fskit_initLocalizationStrings");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("FSKitErrorVariantKey"));

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("FSKitErrorDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)fskit_errorWithFSKitCode:()FSKitAdditions
{
  return objc_msgSend(a1, "_fskit_errorWithFSKitCode:itemURL:debugDescription:message:", a3, 0, 0, 0);
}

+ (id)fskit_errorWithPOSIXCode:()FSKitAdditions description:
{
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;

  v11 = (objc_class *)MEMORY[0x24BDD17C8];
  v12 = a4;
  v13 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, &a9);

  objc_msgSend(a1, "_fskit_errorWithFSKitCode:itemURL:debugDescription:message:", a3, 0, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)fskit_errorWithPOSIXCode:()FSKitAdditions itemURL:debugDescription:
{
  return objc_msgSend(a1, "_fskit_errorWithFSKitCode:itemURL:debugDescription:message:", a3, a4, a5, 0);
}

- (uint64_t)fskit_isFSKitError:()FSKitAdditions
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("FSKitErrorDomain")))
  {
    v6 = objc_msgSend(a1, "code");

    if (v6 == a3)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (id)fskit_userInfoValueForKey:()FSKitAdditions
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("FSKitErrorDomain"));

  if (v6)
  {
    objc_msgSend(a1, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FSKitErrorVariantKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD0FC8]) & 1) != 0)
    {
      v9 = &stru_250C33628;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD0FD8]) & 1) != 0)
    {
      v9 = CFSTR("-C");
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD0FF0]))
        goto LABEL_11;
      v9 = CFSTR("-R");
    }
    v11 = objc_msgSend(a1, "code");
    if ((unint64_t)(v11 - 4500) <= 5)
    {
      FSKitLocalizedStringWithKeyAndVariant(v11, off_250C32588[v11 - 4500], v9, v8, v12, v13, v14, v15, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

@end
