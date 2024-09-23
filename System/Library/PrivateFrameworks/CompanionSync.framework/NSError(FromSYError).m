@implementation NSError(FromSYError)

+ (id)errorFromSYErrorInfo:()FromSYError
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1620], "sy_unarchivedObjectFromData:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v4, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "code");

    objc_msgSend(a1, "errorWithDomain:code:userInfo:", v8, v9, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
