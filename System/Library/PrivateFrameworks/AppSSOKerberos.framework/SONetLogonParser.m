@implementation SONetLogonParser

+ (id)parseNetLoginUsingData:(id)a3
{
  id v3;
  char *v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  char v9;
  __CFString *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[2];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v21 = (id)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  v20[1] = v20;
  v4 = (char *)v20 - ((objc_msgSend(v3, "length") + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v3, "getBytes:length:", v4, objc_msgSend(v3, "length"));
  v5 = 0;
  v6 = 1;
  v7 = 24;
  do
  {
    if (objc_msgSend(v3, "length") <= (unint64_t)v7)
    {
      v10 = &stru_24D3EC758;
    }
    else
    {
      v8 = v7;
      v9 = 1;
      v10 = &stru_24D3EC758;
      while (1)
      {
        v11 = v4[v8];
        if (!v11)
          break;
        if ((v11 & 0xC0) != 0)
        {
          v12 = v7 + 1;
          if (!v5)
            v5 = v7 + 2;
          v7 = v4[v12];
          if (objc_msgSend(v3, "length") < (unint64_t)v7)
          {
            v7 = v12;
            goto LABEL_20;
          }
        }
        else
        {
          if ((v9 & 1) == 0)
          {
            -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("."));
            v13 = objc_claimAutoreleasedReturnValue();

            v10 = (__CFString *)v13;
          }
          v14 = v7 + 1;
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v4[v14], v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v15, 4);
          -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", v16);
          v17 = objc_claimAutoreleasedReturnValue();

          v7 = v14 + v11;
          v9 = 0;
          v10 = (__CFString *)v17;
        }
        v8 = v7;
        if (objc_msgSend(v3, "length") <= (unint64_t)v7)
          goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", (__int16)v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v10, v18);

      if (v5)
        v7 = v5;
      else
        ++v7;
      v5 = 0;
    }
LABEL_20:

    ++v6;
  }
  while (v6 != 9);

  return v21;
}

@end
