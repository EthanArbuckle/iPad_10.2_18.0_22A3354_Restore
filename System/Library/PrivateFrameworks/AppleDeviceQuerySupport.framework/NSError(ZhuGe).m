@implementation NSError(ZhuGe)

+ (id)errorWithZhuGeErrorCode:()ZhuGe underlyingError:
{
  id v5;
  void *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id *v33;
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[6];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.zhuge"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (uint64_t *)MEMORY[0x24BDD0FD8];
  v8 = (uint64_t *)MEMORY[0x24BDD1398];
  if (a3 != 1)
  {
    if (a3 >= 0x51)
    {
      v9 = (uint64_t *)MEMORY[0x24BDD1398];
      v10 = (id)qword_2563E12D8;
      v15 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("ZhuGeErrorCode %@ exceed maximum"), v16);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      v14 = CFSTR("Please file a radar against \"ZhuGe|all\");
      a3 = 1;
      goto LABEL_10;
    }
    v17 = (_QWORD *)((char *)&ZhuGeErrorTable + 32 * a3);
    if (*v17 != a3)
    {
      v9 = (uint64_t *)MEMORY[0x24BDD1398];
      v10 = (id)qword_2563E12D8;
      v20 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Index %@ of ZhuGeErrorCode table got a wrong code %@"), v16, v21);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    v18 = v5;
    if (isObjectNilOrZhuGeNull(v5))
    {
      v9 = v8;
      v19 = v6;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
LABEL_17:
        v33 = (id *)((char *)&ZhuGeErrorTable + 32 * a3);
        v10 = v33[1];
        v13 = (__CFString *)v33[2];
        v14 = (__CFString *)v33[3];
        v5 = v18;
        goto LABEL_11;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = v8;
        v10 = (id)qword_2563E12D8;
        v14 = CFSTR("Please check latest code that using ZhuGe error API");
        a3 = 1;
        v18 = v6;
        v13 = CFSTR("UnderlyingError can only be NSError, NSString, ZHUGE_NULL or nil");
        goto LABEL_11;
      }
      v29 = (void *)MEMORY[0x24BDD1540];
      v30 = *v7;
      v36[0] = *MEMORY[0x24BDD0FC8];
      v36[1] = v30;
      v37[0] = v5;
      v37[1] = off_2563E1300[0];
      v9 = v8;
      v31 = *v8;
      v36[2] = *MEMORY[0x24BDD0FF0];
      v36[3] = v31;
      v37[2] = off_2563E1308;
      v37[3] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.zhuge"), 2, v32);
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    v18 = v19;
    goto LABEL_17;
  }
  v9 = (uint64_t *)MEMORY[0x24BDD1398];
  v10 = (id)qword_2563E12D8;
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Reserved ZhuGeErrorCode %@ shall not be the argument"), v12);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Please check newly added code that calling ZhuGeError API"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v18 = v6;
LABEL_11:
  v22 = v18;
  v23 = (void *)MEMORY[0x24BDD1540];
  v24 = *MEMORY[0x24BDD0FD8];
  v34[0] = *MEMORY[0x24BDD0FC8];
  v34[1] = v24;
  v35[0] = v10;
  v35[1] = v13;
  v25 = *v9;
  v34[2] = *MEMORY[0x24BDD0FF0];
  v34[3] = v25;
  v35[2] = v14;
  v35[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.zhuge"), a3, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (__CFString)descriptionFromZhuGeErrorCode:()ZhuGe
{
  __CFString *v3;

  if (a3 <= 0x50)
  {
    if (ZhuGeErrorTable[4 * a3] == (id)a3)
      v3 = (__CFString *)ZhuGeErrorTable[4 * a3 + 1];
    else
      v3 = CFSTR("Invalid ZhuGe Error Code!");
  }
  else
  {
    v3 = CFSTR("Illegal ZhuGe Error Code!");
  }
  return v3;
}

- (id)_ZhuGeDescriptionWithLayer:()ZhuGe
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;

  v5 = 4 * a3;
  objc_msgSend(&stru_2507BF7D0, "stringByPaddingToLength:withString:startingAtIndex:", 4 * a3, CFSTR(" "), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_2507BF7D0, "stringByPaddingToLength:withString:startingAtIndex:", (4 * a3) | 2, CFSTR(" "), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_2507BF7D0, "stringByPaddingToLength:withString:startingAtIndex:", v5 + 4, CFSTR(" "), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.zhuge"));

  if ((v10 & 1) != 0)
  {
    objc_msgSend(a1, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD0FC8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0FD8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDD0FF0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BDD1398]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "_ZhuGeDescriptionWithLayer:", a3 + 1);
      v18 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v18;
    }
    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "code"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("\n%@{\n%@Domain   = %@\n%@Code     = %@\n%@UserInfo = {\n%@Description        = %@\n%@FailureReason      = %@\n%@RecoverySuggestion = %@\n%@UnderlyingError    = %@\n%@}"), v6, v7, v19, v7, v20, v7, v8, v12, v8, v25, v8, v15, v8, v17, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("{\n%@%@\n%@}"), v8, v12, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (uint64_t)ZhuGeDescription
{
  return objc_msgSend(a1, "_ZhuGeDescriptionWithLayer:", 0);
}

@end
