@implementation WFGetMPMediaItemEntry

id __WFGetMPMediaItemEntry_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.archivedmpmediaitem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", getMPMediaItemClass(), v3, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __WFGetMPMediaItemEntry_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  getMPMediaItemClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (objc_msgSend(v3, "length"))
    {
      v8 = CFSTR("link.contentkit.archivedmpmediaitem");
      v9[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
