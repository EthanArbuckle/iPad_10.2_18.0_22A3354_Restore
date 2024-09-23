@implementation NSError(NanoPassKit)

- (id)npk_errorWithDomain:()NanoPassKit code:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v6 = a3;
  v7 = a1;
  if (v7)
  {
    v8 = *MEMORY[0x24BDD1398];
    do
    {
      objc_msgSend(v7, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v6))
      {
        v10 = objc_msgSend(v7, "code");

        if (v10 == a4)
          break;
      }
      else
      {

      }
      objc_msgSend(v7, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v8);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v12;
    }
    while (v12);
  }

  return v7;
}

@end
