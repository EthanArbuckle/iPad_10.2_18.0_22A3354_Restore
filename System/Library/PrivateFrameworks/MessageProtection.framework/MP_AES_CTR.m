@implementation MP_AES_CTR

+ (id)crypt:(id)a3 key:(id)a4 IV:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = (objc_class *)MEMORY[0x24BDBCEC8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithLength:", objc_msgSend(v10, "length"));
  ccaes_ctr_crypt_mode();
  objc_msgSend(v9, "length");
  v12 = objc_retainAutorelease(v9);
  objc_msgSend(v12, "bytes");

  v13 = objc_retainAutorelease(v8);
  objc_msgSend(v13, "bytes");

  objc_msgSend(v10, "length");
  v14 = objc_retainAutorelease(v10);
  objc_msgSend(v14, "bytes");

  v15 = objc_retainAutorelease(v11);
  objc_msgSend(v15, "bytes");
  if (ccctr_one_shot())
    v16 = 0;
  else
    v16 = v15;

  return v16;
}

@end
