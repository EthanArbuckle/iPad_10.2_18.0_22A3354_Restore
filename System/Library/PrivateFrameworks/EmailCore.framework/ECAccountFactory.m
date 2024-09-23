@implementation ECAccountFactory

+ (id)accountWithSystemAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __objc2_class **v7;
  void *v8;
  int v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accountType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F0D0]) & 1) != 0)
    {
      v7 = off_1E711FC20;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F080]) & 1) != 0)
    {
      v7 = off_1E711FBC8;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F118]) & 1) != 0)
    {
      v7 = off_1E711FC90;
    }
    else
    {
      v9 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F138]);
      v7 = off_1E711FB18;
      if (v9)
        v7 = off_1E711FCB8;
    }
    v8 = (void *)objc_msgSend(objc_alloc(*v7), "initWithSystemAccount:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
