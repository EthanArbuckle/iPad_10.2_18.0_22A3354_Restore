@implementation HMCHIPEcosystem

uint64_t __54__HMCHIPEcosystem_HFAdditions__hf_ecosystemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "vendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isAppleVendor") & 1) == 0)
  {

LABEL_5:
    objc_msgSend(v4, "vendor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isAppleVendor"))
    {

    }
    else
    {
      objc_msgSend(v5, "vendor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isAppleVendor");

      if ((v12 & 1) != 0)
      {
        v9 = 1;
        goto LABEL_10;
      }
    }
    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v13, "localizedStandardCompare:", v14);

    goto LABEL_10;
  }
  objc_msgSend(v5, "vendor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAppleVendor");

  if (v8)
    goto LABEL_5;
  v9 = -1;
LABEL_10:

  return v9;
}

@end
