@implementation NSError(CRKEDUAdditions)

+ (uint64_t)crk_EDUProfileErrorWithCode:()CRKEDUAdditions errorDictionary:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ClassroomKit.profileError"), a3, a4);
}

+ (id)crk_badFieldTypeErrorWithField:()CRKEDUAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("CRKEDUProfileErrorField");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorDictionary:", 2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)crk_missingFieldErrorWithField:()CRKEDUAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("CRKEDUProfileErrorField");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorDictionary:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)crk_valueNotUniqueErrorWithField:()CRKEDUAdditions value:
{
  return objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorField:andValue:", 4, a3, a4);
}

+ (uint64_t)crk_unsupportedValueErrorWithField:()CRKEDUAdditions value:
{
  return objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorField:andValue:", 3, a3, a4);
}

+ (uint64_t)crk_malformedProfileErrorWithField:()CRKEDUAdditions value:
{
  return objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorField:andValue:", 0, a3, a4);
}

+ (id)crk_allOrNoneKeysErrorWithProvidedKeys:()CRKEDUAdditions allOrNoneKeys:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("ProvidedKeys");
  v12[1] = CFSTR("AllOrNoneKeys");
  v13[0] = a3;
  v13[1] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorDictionary:", 5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)crk_topLevelUserIsBothLeaderAndMemberErrorWithUserIdentifier:()CRKEDUAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("TopLevelUserIdentifier");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorDictionary:", 7, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)crk_topLevelUserIsNeitherLeaderNorMemberErrorWithUserIdentifier:()CRKEDUAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("TopLevelUserIdentifier");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorDictionary:", 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)crk_EDUProfileErrorWithCode:()CRKEDUAdditions errorField:andValue:
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("CRKEDUProfileErrorField");
  v14[1] = CFSTR("CRKEDUProfileErrorValue");
  v15[0] = a4;
  v15[1] = a5;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorDictionary:", a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
