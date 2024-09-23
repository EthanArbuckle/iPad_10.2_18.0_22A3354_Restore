@implementation DTOSLogLoaderStopTicket

- (void)holdAgent:(id)a3 loader:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)*((_QWORD *)v6 + 13);
  *((_QWORD *)v6 + 13) = v7;

  v9 = (void *)*((_QWORD *)v6 + 8);
  if (v9)
  {
    objc_msgSend(v9, "invalidate");
  }
  else
  {
    v10 = (void *)*((_QWORD *)v6 + 10);
    if (!v10)
    {
      objc_msgSend(v6, "_welcomeAgent:", v11);
      goto LABEL_6;
    }
    objc_msgSend(v10, "invalidate");
    +[DTOSLogLoader heartbeat](DTOSLogLoader, "heartbeat");
  }
  objc_storeStrong((id *)v6 + 15, a3);
LABEL_6:

}

- (void)prepareAgent:(id)a3 loader:(id)a4
{
  id *v5;
  id *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  uint64_t v16;
  char v17;

  v11 = a3;
  v5 = (id *)a4;
  v6 = v5;
  if (v5[8] || v5[10])
    __assert_rtn("-[DTOSLogLoaderStopTicket prepareAgent:loader:]", "DTOSLogLoader.mm", 1950, "loader->_loggedStream == nil && loader->_liveStream == nil");
  *((_BYTE *)v5 + 510) = 0;
  objc_msgSend(v5[6], "mode");
  objc_msgSend(v6[6], "dynamicTracingEnabledSubsystems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_222B400AC(v7, 0);

  objc_msgSend(v6[6], "logSubsystemCategoryPairsToEnable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = sub_222B42618;
  v15 = &unk_24EB292E8;
  v17 = 0;
  v16 = 0;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v12);

  objc_msgSend(v6[6], "signpostSubsystemCategoryPairsToEnable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  v13 = 3221225472;
  v14 = sub_222B42618;
  v15 = &unk_24EB292E8;
  v17 = 0;
  v16 = 1;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &v12);

}

@end
