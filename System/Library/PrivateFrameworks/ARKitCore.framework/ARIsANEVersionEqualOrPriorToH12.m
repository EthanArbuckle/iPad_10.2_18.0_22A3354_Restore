@implementation ARIsANEVersionEqualOrPriorToH12

void __ARIsANEVersionEqualOrPriorToH12_block_invoke()
{
  void *v0;
  char v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  ARDeviceANEVersion();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isEqualToString:", CFSTR("m9")) & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    objc_msgSend(v5, "lowercaseString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("h10")) & 1) != 0)
    {
      v1 = 1;
    }
    else
    {
      objc_msgSend(v5, "lowercaseString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("h11")) & 1) != 0)
      {
        v1 = 1;
      }
      else
      {
        objc_msgSend(v5, "lowercaseString");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v1 = objc_msgSend(v4, "isEqualToString:", CFSTR("h12"));

      }
    }

  }
  ARIsANEVersionEqualOrPriorToH12_s_isANEVersionEqualOrPriorToH12 = v1;

}

@end
