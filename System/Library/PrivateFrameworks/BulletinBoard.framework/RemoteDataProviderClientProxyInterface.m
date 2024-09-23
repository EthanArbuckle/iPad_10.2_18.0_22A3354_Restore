@implementation RemoteDataProviderClientProxyInterface

void __RemoteDataProviderClientProxyInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549A3D08);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RemoteDataProviderClientProxyInterface___interface;
  RemoteDataProviderClientProxyInterface___interface = v0;

  v2 = (void *)RemoteDataProviderClientProxyInterface___interface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_bulletinsWithRequestParameters_lastCleared_completion_, 0, 1);

  v6 = (void *)RemoteDataProviderClientProxyInterface___interface;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_clearedInfoForBulletins_lastClearedInfo_completion_, 0, 0);

  v10 = (void *)RemoteDataProviderClientProxyInterface___interface;
  BBAllowedClasses();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_clearedInfoForBulletins_lastClearedInfo_completion_, 1, 0);

  v12 = (void *)RemoteDataProviderClientProxyInterface___interface;
  BBAllowedClasses();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_clearedInfoForBulletins_lastClearedInfo_completion_, 0, 1);

  v14 = (void *)RemoteDataProviderClientProxyInterface___interface;
  BBAllowedClasses();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion_, 0, 0);

  v16 = (void *)RemoteDataProviderClientProxyInterface___interface;
  BBAllowedClasses();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion_, 0, 1);

  v18 = (void *)RemoteDataProviderClientProxyInterface___interface;
  v19 = (void *)MEMORY[0x24BDBCF20];
  v31 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion_, 0, 0);

  v22 = (void *)RemoteDataProviderClientProxyInterface___interface;
  v23 = (void *)MEMORY[0x24BDBCF20];
  v30 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion_, 1, 0);

  v26 = (void *)RemoteDataProviderClientProxyInterface___interface;
  BBAllowedClasses();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion_, 2, 0);

  v28 = (void *)RemoteDataProviderClientProxyInterface___interface;
  BBAllowedClasses();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion_, 0, 1);

}

@end
