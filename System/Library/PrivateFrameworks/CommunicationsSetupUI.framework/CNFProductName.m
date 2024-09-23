@implementation CNFProductName

void __CNFProductName_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  id v7;

  _CFGetProductName();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("_%@"), v7);
    v1 = (void *)CNFProductName_sProductName;
    CNFProductName_sProductName = v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "model");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1)
    {
      objc_msgSend(v1, "rangeOfString:options:", CFSTR("iPad"), 9);
      if (v3)
      {
        v4 = CFSTR("_ipad");
      }
      else
      {
        objc_msgSend(v1, "rangeOfString:options:", CFSTR("iPod"), 9);
        v4 = CFSTR("_ipod");
        if (!v5)
          v4 = CFSTR("_iphone");
      }
      v6 = (void *)CNFProductName_sProductName;
      CNFProductName_sProductName = (uint64_t)v4;

    }
  }

}

@end
