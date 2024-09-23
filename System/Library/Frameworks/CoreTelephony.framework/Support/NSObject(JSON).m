@implementation NSObject(JSON)

+ (id)objectWithJSONString:()JSON
{
  void *v3;
  void *v4;

  if (*((char *)a3 + 23) < 0)
  {
    if (!a3[1])
    {
LABEL_7:
      v4 = 0;
      return v4;
    }
    a3 = (uint64_t *)*a3;
  }
  else if (!*((_BYTE *)a3 + 23))
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)jsonStringWithObject:()JSON
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a1;
  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v3) & 1) != 0)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 1, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v4)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
      v7 = v6;
      if (v6)
        std::string::basic_string[abi:ne180100]<0>(a2, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
      else
        std::string::basic_string[abi:ne180100]<0>(a2, "");

    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(a2, "");
    }

  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a2, "");
  }

}

@end
