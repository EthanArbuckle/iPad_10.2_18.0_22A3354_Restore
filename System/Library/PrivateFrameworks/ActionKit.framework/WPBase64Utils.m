@implementation WPBase64Utils

+ (id)encodeData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  id v7;
  void *v8;
  uint64_t v10;

  v10 = 0;
  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  v6 = NewBase64Encode(v4, v5, 0, &v10);
  v7 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8 = (void *)objc_msgSend(v7, "initWithBytes:length:encoding:", v6, v10, 1);
  free(v6);
  return v8;
}

+ (void)encodeInputStream:(id)a3 withChunkHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BYTE v13[18000];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(v6, "open");
  if (objc_msgSend(v6, "hasBytesAvailable"))
  {
    do
    {
      v8 = objc_msgSend(v6, "read:maxLength:", v13, 18000);
      if (v8)
      {
        v9 = v8;
        v10 = (void *)MEMORY[0x22E315218]();
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v13, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "encodeData:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v12);

        objc_autoreleasePoolPop(v10);
      }
    }
    while ((objc_msgSend(v6, "hasBytesAvailable") & 1) != 0);
  }
  objc_msgSend(v6, "close");

}

+ (void)encodeFileHandle:(id)a3 withChunkHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(v10, "readDataOfLength:", 18000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    do
    {
      objc_msgSend(a1, "encodeData:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v8);
      objc_msgSend(v10, "readDataOfLength:", 18000);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v9;
    }
    while (objc_msgSend(v9, "length"));
  }
  else
  {
    v9 = v7;
  }

}

+ (id)decodeString:(id)a3
{
  id v3;
  _BYTE *v4;
  void *v5;
  uint64_t v7;

  objc_msgSend(a3, "dataUsingEncoding:", 1);
  v7 = 0;
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = NewBase64Decode((char *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), &v7);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  free(v4);

  return v5;
}

@end
