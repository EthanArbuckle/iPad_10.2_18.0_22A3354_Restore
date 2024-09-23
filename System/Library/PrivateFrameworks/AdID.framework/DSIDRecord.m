@implementation DSIDRecord

void __62__DSIDRecord_Private__resetDeviceNewsPlusSubscriberIDIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (objc_msgSend(v13, "intValue") == 6)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setID:", v7);

    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "DSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "intValue");
    ClientTypeToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Created ID %@ for DSID %@ and client type %@(%@)"), v9, v10, v13, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
}

@end
