@implementation NSKeyedUnarchiver(CATSecureCoding)

+ (id)cat_unarchiveObjectOfClass:()CATSecureCoding withData:
{
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSKeyedUnarchiver+SecureCoding.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aClass"));

  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cat_unarchiveObjectOfClasses:withData:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)cat_unarchiveObjectOfClass:()CATSecureCoding withData:error:
{
  id v9;
  void *v10;
  void *v11;
  void *v13;

  v9 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSKeyedUnarchiver+SecureCoding.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aClass"));

  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cat_unarchiveObjectOfClasses:withData:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)cat_unarchiveObjectOfClasses:()CATSecureCoding withData:
{
  return objc_msgSend(a1, "cat_unarchiveObjectOfClasses:withData:error:", a3, a4, 0);
}

+ (id)cat_unarchiveObjectOfClasses:()CATSecureCoding withData:error:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSKeyedUnarchiver+SecureCoding.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("classes"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:", v9, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v12;
}

+ (uint64_t)cat_unarchivePropertyListObjectWithData:()CATSecureCoding
{
  return objc_msgSend(a1, "cat_unarchivePropertyListObjectWithData:error:", a3, 0);
}

+ (id)cat_unarchivePropertyListObjectWithData:()CATSecureCoding error:
{
  id v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v6 = a3;
    v7 = (void *)objc_msgSend([a1 alloc], "initForReadingFromData:error:", v6, a4);

    objc_msgSend(v7, "decodePropertyListForKey:", *MEMORY[0x24BDD0E88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
