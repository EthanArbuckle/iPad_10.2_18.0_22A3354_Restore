@implementation LACDomainStateDecorator

+ (id)saltHash:(id)a3 withBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendData:", v9);

    objc_msgSend(a1, "_hashData:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v6;
  }

  return v10;
}

+ (id)_hashData:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ccsha256_di();
    objc_msgSend(v3, "length");
    objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v5 = objc_retainAutorelease(v4);
    objc_msgSend(v5, "mutableBytes");
    ccdigest();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
