@implementation DTOSLogLoaderStartTicket

- (BOOL)needsHold
{
  return 0;
}

- (void)prepareAgent:(id)a3 loader:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  uint64_t v19;
  char v20;

  v14 = a3;
  v5 = a4;
  *((_BYTE *)v5 + 510) = 1;
  if (!*((_QWORD *)v5 + 12))
  {
    v6 = objc_opt_new();
    v7 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v6;

    v8 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = 0;

  }
  v9 = (void *)*((_QWORD *)v5 + 10);
  if (v9)
  {
    objc_msgSend(v9, "activate");
    objc_msgSend(*((id *)v5 + 6), "dynamicTracingEnabledSubsystems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_222B400AC(v10, 1);

    objc_msgSend(*((id *)v5 + 6), "logSubsystemCategoryPairsToEnable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = sub_222B42618;
    v18 = &unk_24EB292E8;
    v20 = 1;
    v19 = 0;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v15);

    objc_msgSend(*((id *)v5 + 6), "signpostSubsystemCategoryPairsToEnable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    v16 = 3221225472;
    v17 = sub_222B42618;
    v18 = &unk_24EB292E8;
    v20 = 1;
    v19 = 1;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", &v15);

  }
}

@end
