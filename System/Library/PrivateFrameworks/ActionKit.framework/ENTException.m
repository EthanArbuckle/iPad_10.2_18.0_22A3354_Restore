@implementation ENTException

+ (id)exceptionWithName:(id)a3
{
  return (id)objc_msgSend(a1, "exceptionWithName:reason:error:", a3, CFSTR("unknown"), 0);
}

+ (id)exceptionWithName:(id)a3 reason:(id)a4
{
  return (id)objc_msgSend(a1, "exceptionWithName:reason:error:", a3, a4, 0);
}

+ (id)exceptionWithName:(id)a3 reason:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a5, CFSTR("error"));
    a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___ENTException;
  objc_msgSendSuper2(&v12, sel_exceptionWithName_reason_userInfo_, v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD16A8];
  -[ENTException name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENTException reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(": %@"), v6);

  -[ENTException userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ENTException userInfo](self, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  userInfo = %@"), v8);

  }
  return v5;
}

@end
