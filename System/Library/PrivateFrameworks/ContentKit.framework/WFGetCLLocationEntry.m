@implementation WFGetCLLocationEntry

id __WFGetCLLocationEntry_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WFCLLocationFromSerializedLocation(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __WFGetCLLocationEntry_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getCLLocationClass_softClass_3731;
  v12 = getCLLocationClass_softClass_3731;
  if (!getCLLocationClass_softClass_3731)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getCLLocationClass_block_invoke_3732;
    v8[3] = &unk_24C4E3118;
    v8[4] = &v9;
    __getCLLocationClass_block_invoke_3732((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = CFSTR("link.contentkit.location");
    WFSerializedLocationFromCLLocation(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
