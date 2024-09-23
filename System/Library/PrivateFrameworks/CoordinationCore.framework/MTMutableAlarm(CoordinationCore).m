@implementation MTMutableAlarm(CoordinationCore)

- (void)co_setHomeKitSaveDate:()CoordinationCore
{
  objc_setAssociatedObject(a1, sel_co_HomeKitSaveDate, a3, (void *)1);
}

- (void)co_setTargetReference:()CoordinationCore
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(a1, "siriContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "mutableCopy");

    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v5, "setObject:forKey:", v11, *MEMORY[0x24BE19C48]);
    v6 = a1;
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "co_targetReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (!v9)
      goto LABEL_7;
    objc_msgSend(a1, "siriContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 1)
    {
      v10 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v10, "removeObjectForKey:", *MEMORY[0x24BE19C48]);
      objc_msgSend(a1, "setSiriContext:", v10);

      goto LABEL_6;
    }
    v6 = a1;
    v7 = 0;
  }
  objc_msgSend(v6, "setSiriContext:", v7);
LABEL_6:

LABEL_7:
}

- (void)co_setIsMediaSystemOriginating
{
  void *v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(a1, "siriContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "mutableCopy");

  v3 = v4;
  if (!v4)
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = v3;
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("COAlarmSiriContextIsMediaSystemKey"));
  objc_msgSend(a1, "setSiriContext:", v5);

}

@end
