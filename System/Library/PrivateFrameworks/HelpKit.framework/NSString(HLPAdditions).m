@implementation NSString(HLPAdditions)

- (id)htmlDecodedString
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(v1, "dataUsingEncoding:", 4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x24BEBB370];
    v4 = *MEMORY[0x24BEBB338];
    v10[0] = *MEMORY[0x24BEBB348];
    v10[1] = v4;
    v11[0] = v3;
    v11[1] = &unk_24D33A420;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithData:options:documentAttributes:error:", v2, v5, 0, 0);
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "string");
      v8 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v8;
    }

  }
  return v1;
}

@end
