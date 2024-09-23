@implementation HKUserDomainConceptSemanticIdentifier(HealthDaemon)

+ (id)semanticIdentifierFromSemanticIdentifierString:()HealthDaemon profile:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a4, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userDomainConceptEntityRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_semanticIdentifierFromSemanticIdentifierString:userDomainConceptEntityRegistry:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_semanticIdentifierFromSemanticIdentifierString:()HealthDaemon userDomainConceptEntityRegistry:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a4;
  objc_msgSend(a3, "componentsSeparatedByString:", *MEMORY[0x1E0CB6090]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB6088]))
      v9 = 0;
    else
      v9 = v8;
    v10 = v9;
    v11 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberFromString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D48]), "initWithCode:schema:", objc_msgSend(v13, "integerValue"), v10);
      objc_msgSend(v6, "subarrayWithRange:", 2, objc_msgSend(v6, "count") - 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "userDomainConceptEntityClassForTypeIdentifier:", v14), "userDomainConceptSemanticIdentifierClass"), "semanticIdentifierWithComponents:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v16;
      if (v16)
        v17 = v16;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
