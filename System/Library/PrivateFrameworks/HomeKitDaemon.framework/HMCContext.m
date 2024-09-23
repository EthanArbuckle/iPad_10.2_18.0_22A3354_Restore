@implementation HMCContext

+ (id)findServiceGroupWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255772C48, a3, 0);
}

+ (id)findServiceGroupWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255772C48, a3, a4);
}

+ (id)findServiceGroupWithModelID:(id)a3
{
  return +[HMCContext findServiceGroupWithModelID:error:](HMCContext, "findServiceGroupWithModelID:error:", a3, 0);
}

+ (id)findServiceGroupWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findServiceGroupWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findServiceGroupWithModelID_error___hmf_once_t2, &__block_literal_global_289);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findServiceGroupWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255772C48, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __65__HMCContext_MKFServiceGroup__findServiceGroupWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findServiceGroupWithModelID_error___hmf_once_v3;
  findServiceGroupWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findAccountWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255778C70, a3, 0);
}

+ (id)findAccountWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255778C70, a3, a4);
}

+ (id)findAccountWithModelID:(id)a3
{
  return +[HMCContext findAccountWithModelID:error:](HMCContext, "findAccountWithModelID:error:", a3, 0);
}

+ (id)findAccountWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findAccountWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findAccountWithModelID_error___hmf_once_t0, &__block_literal_global_3540);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findAccountWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255778C70, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __55__HMCContext_MKFAccount__findAccountWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findAccountWithModelID_error___hmf_once_v1;
  findAccountWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findCharacteristicWriteActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25577D918, a3, 0);
}

+ (id)findCharacteristicWriteActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25577D918, a3, a4);
}

+ (id)findCharacteristicWriteActionWithModelID:(id)a3
{
  return +[HMCContext findCharacteristicWriteActionWithModelID:error:](HMCContext, "findCharacteristicWriteActionWithModelID:error:", a3, 0);
}

+ (id)findCharacteristicWriteActionWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findCharacteristicWriteActionWithModelID_error___hmf_once_t1;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findCharacteristicWriteActionWithModelID_error___hmf_once_t1, &__block_literal_global_5519);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findCharacteristicWriteActionWithModelID_error___hmf_once_v2;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25577D918, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __91__HMCContext_MKFCharacteristicWriteAction__findCharacteristicWriteActionWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findCharacteristicWriteActionWithModelID_error___hmf_once_v2;
  findCharacteristicWriteActionWithModelID_error___hmf_once_v2 = v0;

}

+ (id)findDurationEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255782960, a3, 0);
}

+ (id)findDurationEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255782960, a3, a4);
}

+ (id)findDurationEventWithModelID:(id)a3
{
  return +[HMCContext findDurationEventWithModelID:error:](HMCContext, "findDurationEventWithModelID:error:", a3, 0);
}

+ (id)findDurationEventWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findDurationEventWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findDurationEventWithModelID_error___hmf_once_t0, &__block_literal_global_9690);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findDurationEventWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255782960, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __67__HMCContext_MKFDurationEvent__findDurationEventWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findDurationEventWithModelID_error___hmf_once_v1;
  findDurationEventWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findPhotosPersonWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255784110, a3, 0);
}

+ (id)findPhotosPersonWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255784110, a3, a4);
}

+ (id)findPhotosPersonWithModelID:(id)a3
{
  return +[HMCContext findPhotosPersonWithModelID:error:](HMCContext, "findPhotosPersonWithModelID:error:", a3, 0);
}

+ (id)findPhotosPersonWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findPhotosPersonWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findPhotosPersonWithModelID_error___hmf_once_t2, &__block_literal_global_284);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findPhotosPersonWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255784110, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __65__HMCContext_MKFPhotosPerson__findPhotosPersonWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findPhotosPersonWithModelID_error___hmf_once_v3;
  findPhotosPersonWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findHomePersonManagerSettingWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557848E0, a3, 0);
}

+ (id)findHomePersonManagerSettingWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557848E0, a3, a4);
}

+ (id)findHomePersonManagerSettingWithModelID:(id)a3
{
  return +[HMCContext findHomePersonManagerSettingWithModelID:error:](HMCContext, "findHomePersonManagerSettingWithModelID:error:", a3, 0);
}

+ (id)findHomePersonManagerSettingWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHomePersonManagerSettingWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHomePersonManagerSettingWithModelID_error___hmf_once_t0, &__block_literal_global_11382);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHomePersonManagerSettingWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557848E0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __89__HMCContext_MKFHomePersonManagerSetting__findHomePersonManagerSettingWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHomePersonManagerSettingWithModelID_error___hmf_once_v1;
  findHomePersonManagerSettingWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findHomeManagerHomeWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557A2AB8, a3, 0);
}

+ (id)findHomeManagerHomeWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557A2AB8, a3, a4);
}

+ (id)findHomeManagerHomeWithModelID:(id)a3
{
  return +[HMCContext findHomeManagerHomeWithModelID:error:](HMCContext, "findHomeManagerHomeWithModelID:error:", a3, 0);
}

+ (id)findHomeManagerHomeWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHomeManagerHomeWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHomeManagerHomeWithModelID_error___hmf_once_t0, &__block_literal_global_16073);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHomeManagerHomeWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557A2AB8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __71__HMCContext_MKFHomeManagerHome__findHomeManagerHomeWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHomeManagerHomeWithModelID_error___hmf_once_v1;
  findHomeManagerHomeWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findAccessoryWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557AE758, a3, 0);
}

+ (id)findAccessoryWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557AE758, a3, a4);
}

+ (id)findAccessoryWithModelID:(id)a3
{
  return +[HMCContext findAccessoryWithModelID:error:](HMCContext, "findAccessoryWithModelID:error:", a3, 0);
}

+ (id)findAccessoryWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findAccessoryWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findAccessoryWithModelID_error___hmf_once_t2, &__block_literal_global_487);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findAccessoryWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557AE758, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __59__HMCContext_MKFAccessory__findAccessoryWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findAccessoryWithModelID_error___hmf_once_v3;
  findAccessoryWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findMediaPlaybackActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557B3368, a3, 0);
}

+ (id)findMediaPlaybackActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557B3368, a3, a4);
}

+ (id)findMediaPlaybackActionWithModelID:(id)a3
{
  return +[HMCContext findMediaPlaybackActionWithModelID:error:](HMCContext, "findMediaPlaybackActionWithModelID:error:", a3, 0);
}

+ (id)findMediaPlaybackActionWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findMediaPlaybackActionWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findMediaPlaybackActionWithModelID_error___hmf_once_t0, &__block_literal_global_23760);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findMediaPlaybackActionWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557B3368, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __79__HMCContext_MKFMediaPlaybackAction__findMediaPlaybackActionWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findMediaPlaybackActionWithModelID_error___hmf_once_v1;
  findMediaPlaybackActionWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findSignificantTimeEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557BB9D8, a3, 0);
}

+ (id)findSignificantTimeEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557BB9D8, a3, a4);
}

+ (id)findSignificantTimeEventWithModelID:(id)a3
{
  return +[HMCContext findSignificantTimeEventWithModelID:error:](HMCContext, "findSignificantTimeEventWithModelID:error:", a3, 0);
}

+ (id)findSignificantTimeEventWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findSignificantTimeEventWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findSignificantTimeEventWithModelID_error___hmf_once_t0, &__block_literal_global_30436);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findSignificantTimeEventWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557BB9D8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __81__HMCContext_MKFSignificantTimeEvent__findSignificantTimeEventWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findSignificantTimeEventWithModelID_error___hmf_once_v1;
  findSignificantTimeEventWithModelID_error___hmf_once_v1 = v0;

}

- (HMCContext)initWithContext:(id)a3 partition:(id)a4
{
  id v7;
  id v8;
  HMCContext *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *transactionAuthor;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMCContext;
  v9 = -[HMCContext init](&v15, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "name");
    v10 = objc_claimAutoreleasedReturnValue();
    name = v9->_name;
    v9->_name = (NSString *)v10;

    objc_msgSend(v7, "transactionAuthor");
    v12 = objc_claimAutoreleasedReturnValue();
    transactionAuthor = v9->_transactionAuthor;
    v9->_transactionAuthor = (NSString *)v12;

    objc_storeStrong((id *)&v9->_partition, a4);
    objc_storeStrong((id *)&v9->_managedObjectContext, a3);
    v9->_isExecuting = 0;
  }

  return v9;
}

- (void)assertIsExecuting
{
  HMCContext *v2;
  SEL v3;
  id v4;

  if (!-[HMCContext isExecuting](self, "isExecuting"))
  {
    v2 = (HMCContext *)_HMFPreconditionFailure();
    -[HMCContext performBlock:](v2, v3, v4);
  }
}

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMCContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __27__HMCContext_performBlock___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)performBlockWithPinnedQueryGeneration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMCContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__HMCContext_performBlockWithPinnedQueryGeneration___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)performBlockAndWaitWithPinnedQueryGeneration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMCContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMCContext_performBlockAndWaitWithPinnedQueryGeneration___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

- (void)_executeBlockWithPinnedQueryGeneration:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  HMCContext *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMCContext *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  _BYTE buf[12];
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  -[HMCContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryGenerationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    _HMFPreconditionFailure();
  -[HMCContext managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBB758], "currentQueryGenerationToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v9 = objc_msgSend(v7, "setQueryGenerationFromToken:error:", v8, &v24);
  v10 = v24;

  if ((v9 & 1) != 0)
  {
    -[HMCContext setIsExecuting:](self, "setIsExecuting:", 1);
    *(_QWORD *)buf = _HMFThreadLocalAsyncContextPush();
    v4[2](v4);
    _HMFThreadLocalAsyncContextPop();
    -[HMCContext setIsExecuting:](self, "setIsExecuting:", 0);
    -[HMCContext managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v10;
    v12 = objc_msgSend(v11, "setQueryGenerationFromToken:error:", 0, &v23);
    v13 = v23;

    if ((v12 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v17;
        v26 = 2114;
        v27 = v13;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while unpinning the query generation : %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
    -[HMCContext managedObjectContext](self, "managedObjectContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reset");

    v10 = v13;
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v22;
      v26 = 2114;
      v27 = v10;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to pin context to current query generation: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (MKFHomeManager)homeManager
{
  void *v2;
  void *v3;
  HMCContext *v5;
  SEL v6;
  Class v7;

  -[HMCContext managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFHomeManager fetchWithContext:error:](_MKFHomeManager, "fetchWithContext:error:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return (MKFHomeManager *)v3;
  v5 = (HMCContext *)_HMFPreconditionFailure();
  return (MKFHomeManager *)-[HMCContext createNewModelOfClass:](v5, v6, v7);
}

- (id)createNewModelOfClass:(Class)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id result;
  HMCContext *v10;
  SEL v11;
  id v12;

  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x24BDBB698]);
    -[objc_class entity](a3, "entity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCContext managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, v7);

    return v8;
  }
  else
  {
    v10 = (HMCContext *)_HMFPreconditionFailure();
    -[HMCContext unsafeSynchronousBlock:](v10, v11, v12);
  }
  return result;
}

- (void)unsafeSynchronousBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMCContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__HMCContext_unsafeSynchronousBlock___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

- (void)deleteObject:(id)a3
{
  void *v4;
  HMCContext *v5;
  SEL v6;
  id *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HMCContext managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteObject:", v8);

  }
  else
  {
    v5 = (HMCContext *)_HMFPreconditionFailure();
    -[HMCContext save:](v5, v6, v7);
  }
}

- (BOOL)save:(id *)a3
{
  id *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v9;

  v9 = 0;
  if (a3)
    v4 = a3;
  else
    v4 = (id *)&v9;
  -[HMCContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hmd_saveWithTransactionAuthor:error:", 6, v4);

  -[HMCContext managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reset");

  return v6;
}

- (BOOL)save
{
  return -[HMCContext save:](self, "save:", 0);
}

- (void)rollback
{
  void *v3;
  id v4;

  -[HMCContext managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rollback");

  -[HMCContext managedObjectContext](self, "managedObjectContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

}

- (void)reset
{
  id v2;

  -[HMCContext managedObjectContext](self, "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (NSString)name
{
  return self->_name;
}

- (NSString)transactionAuthor
{
  return self->_transactionAuthor;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (HMDManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (HMCPartition)partition
{
  return self->_partition;
}

- (HMDBackingStore)backingStore
{
  return (HMDBackingStore *)objc_loadWeakRetained((id *)&self->_backingStore);
}

- (void)setBackingStore:(id)a3
{
  objc_storeWeak((id *)&self->_backingStore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backingStore);
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_transactionAuthor, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

uint64_t __37__HMCContext_unsafeSynchronousBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsExecuting:", 1);
  _HMFThreadLocalAsyncContextPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _HMFThreadLocalAsyncContextPop();
  return objc_msgSend(*(id *)(a1 + 32), "setIsExecuting:", 0);
}

uint64_t __59__HMCContext_performBlockAndWaitWithPinnedQueryGeneration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeBlockWithPinnedQueryGeneration:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__HMCContext_performBlockWithPinnedQueryGeneration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeBlockWithPinnedQueryGeneration:", *(_QWORD *)(a1 + 40));
}

uint64_t __27__HMCContext_performBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsExecuting:", 1);
  _HMFThreadLocalAsyncContextPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _HMFThreadLocalAsyncContextPop();
  return objc_msgSend(*(id *)(a1 + 32), "setIsExecuting:", 0);
}

+ (HMCContext)currentContext
{
  void *v2;
  void *v4;
  SEL v5;
  id v6;

  HMFRequireCurrentAsyncContext();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (HMCContext *)v2;
  objc_opt_class();
  v4 = (void *)_HMFPreconditionFailureWithFormat();
  return (HMCContext *)+[HMCContext managedObjectIsMKF:](v4, v5, v6);
}

+ (BOOL)managedObjectIsMKF:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = managedObjectIsMKF___hmf_once_t5;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&managedObjectIsMKF___hmf_once_t5, &__block_literal_global_34579);
  v5 = objc_msgSend((id)managedObjectIsMKF___hmf_once_v6, "objectConforms:", v4);

  return v5;
}

+ (Class)managedObjectClassFromProtocol:(id)a3
{
  id v3;
  Class v4;
  void *v5;
  int v6;
  objc_class *v7;
  void *v9;
  SEL v10;
  id v11;
  id v12;
  id *v13;

  v3 = a3;
  v4 = __managedObjectClassFromProtocol(v3);
  -[objc_class entity](v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAbstract");

  if (v6)
  {
    v9 = (void *)_HMFPreconditionFailure();
    return (Class)+[HMCContext findModelWithModelID:ofType:error:](v9, v10, v11, v12, v13);
  }
  else
  {
    v7 = v4;

    return v7;
  }
}

+ (id)findModelWithModelID:(id)a3 ofType:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = findModelWithModelID_ofType_error___hmf_once_t10;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&findModelWithModelID_ofType_error___hmf_once_t10, &__block_literal_global_249_34571);
  v15 = CFSTR("OBJECTID");
  v16[0] = v9;
  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = (id)findModelWithModelID_ofType_error___hmf_once_v11;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __findModelObjectOfType(v8, 0, v11, v12, (uint64_t *)a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)findAllModelsOfType:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[objc_class fetchRequest](__managedObjectClassFromProtocol(a3), "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)findModelObjectOfType:(id)a3 databaseID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  SEL v15;
  id v16;
  id v17;
  id v18;
  id *v19;

  v7 = a3;
  v8 = a4;
  __managedObjectClassFromProtocol(v7);
  +[HMCContext currentContext](HMCContext, "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "existingObjectWithID:error:", v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = (void *)_HMFPreconditionFailure();
    return +[HMCContext findModelObjectOfType:template:substitutions:error:](v14, v15, v16, v17, v18, v19);
  }
  else
  {

    return v12;
  }
}

+ (id)findModelObjectOfType:(id)a3 template:(id)a4 substitutions:(id)a5 error:(id *)a6
{
  return __findModelObjectOfType(a3, 0, a4, a5, (uint64_t *)a6);
}

+ (id)findModelObjectOfType:(id)a3 parentObjectID:(id)a4 template:(id)a5 substitutions:(id)a6 error:(id *)a7
{
  return __findModelObjectOfType(a3, a4, a5, a6, (uint64_t *)a7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_34552 != -1)
    dispatch_once(&logCategory__hmf_once_t14_34552, &__block_literal_global_264);
  return (id)logCategory__hmf_once_v15_34553;
}

void __25__HMCContext_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15_34553;
  logCategory__hmf_once_v15_34553 = v0;

}

void __48__HMCContext_findModelWithModelID_ofType_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $OBJECTID"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findModelWithModelID_ofType_error___hmf_once_v11;
  findModelWithModelID_ofType_error___hmf_once_v11 = v0;

}

void __33__HMCContext_managedObjectIsMKF___block_invoke()
{
  HMCConformanceCache *v0;
  void *v1;

  v0 = -[HMCConformanceCache initWithProtocol:]([HMCConformanceCache alloc], "initWithProtocol:", &unk_255772890);
  v1 = (void *)managedObjectIsMKF___hmf_once_v6;
  managedObjectIsMKF___hmf_once_v6 = (uint64_t)v0;

}

+ (id)synchronizationTokenFromLegacyModelID:(id)a3
{
  void *v3;
  _QWORD v5[3];

  v3 = a3;
  v5[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5[0] = 0;
    v5[1] = 0;
    objc_msgSend(a3, "getUUIDBytes:", v5);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, 16);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)findLocalAccountWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMCContext *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[_MKFAccount fetchRequest](_MKFAccount, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == 1"), CFSTR("local"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  objc_msgSend(v5, "execute:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
      _HMFPreconditionFailure();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_255778C70))
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *a3;
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local account: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (id)findRemoteAccountsWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[_MKFAccount fetchRequest](_MKFAccount, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == 0"), CFSTR("local"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "execute:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)findHomeManagerWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[_MKFHomeManager fetchRequest](_MKFHomeManager, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "execute:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)findInvitationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557C7980, a3, 0);
}

+ (id)findInvitationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557C7980, a3, a4);
}

+ (id)findInvitationWithModelID:(id)a3
{
  return +[HMCContext findInvitationWithModelID:error:](HMCContext, "findInvitationWithModelID:error:", a3, 0);
}

+ (id)findInvitationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findInvitationWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findInvitationWithModelID_error___hmf_once_t2, &__block_literal_global_301);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findInvitationWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557C7980, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __61__HMCContext_MKFInvitation__findInvitationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findInvitationWithModelID_error___hmf_once_v3;
  findInvitationWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findTimePeriodBulletinConditionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557CD560, a3, 0);
}

+ (id)findTimePeriodBulletinConditionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557CD560, a3, a4);
}

+ (id)findTimePeriodBulletinConditionWithModelID:(id)a3
{
  return +[HMCContext findTimePeriodBulletinConditionWithModelID:error:](HMCContext, "findTimePeriodBulletinConditionWithModelID:error:", a3, 0);
}

+ (id)findTimePeriodBulletinConditionWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findTimePeriodBulletinConditionWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findTimePeriodBulletinConditionWithModelID_error___hmf_once_t0, &__block_literal_global_41011);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findTimePeriodBulletinConditionWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557CD560, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __95__HMCContext_MKFTimePeriodBulletinCondition__findTimePeriodBulletinConditionWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findTimePeriodBulletinConditionWithModelID_error___hmf_once_v1;
  findTimePeriodBulletinConditionWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findPresenceBulletinConditionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D0A00, a3, 0);
}

+ (id)findPresenceBulletinConditionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D0A00, a3, a4);
}

+ (id)findPresenceBulletinConditionWithModelID:(id)a3
{
  return +[HMCContext findPresenceBulletinConditionWithModelID:error:](HMCContext, "findPresenceBulletinConditionWithModelID:error:", a3, 0);
}

+ (id)findPresenceBulletinConditionWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findPresenceBulletinConditionWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findPresenceBulletinConditionWithModelID_error___hmf_once_t0, &__block_literal_global_44250);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findPresenceBulletinConditionWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557D0A00, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __91__HMCContext_MKFPresenceBulletinCondition__findPresenceBulletinConditionWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findPresenceBulletinConditionWithModelID_error___hmf_once_v1;
  findPresenceBulletinConditionWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findIncomingInvitationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D0E98, a3, 0);
}

+ (id)findIncomingInvitationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D0E98, a3, a4);
}

+ (id)findIncomingInvitationWithModelID:(id)a3
{
  return +[HMCContext findIncomingInvitationWithModelID:error:](HMCContext, "findIncomingInvitationWithModelID:error:", a3, 0);
}

+ (id)findIncomingInvitationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findIncomingInvitationWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findIncomingInvitationWithModelID_error___hmf_once_t0, &__block_literal_global_44816);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findIncomingInvitationWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557D0E98, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __77__HMCContext_MKFIncomingInvitation__findIncomingInvitationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findIncomingInvitationWithModelID_error___hmf_once_v1;
  findIncomingInvitationWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findTimeOfDayTimeSpecificationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D1198, a3, 0);
}

+ (id)findTimeOfDayTimeSpecificationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D1198, a3, a4);
}

+ (id)findTimeOfDayTimeSpecificationWithModelID:(id)a3
{
  return +[HMCContext findTimeOfDayTimeSpecificationWithModelID:error:](HMCContext, "findTimeOfDayTimeSpecificationWithModelID:error:", a3, 0);
}

+ (id)findTimeOfDayTimeSpecificationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findTimeOfDayTimeSpecificationWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findTimeOfDayTimeSpecificationWithModelID_error___hmf_once_t0, &__block_literal_global_45521);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findTimeOfDayTimeSpecificationWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557D1198, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __93__HMCContext_MKFTimeOfDayTimeSpecification__findTimeOfDayTimeSpecificationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findTimeOfDayTimeSpecificationWithModelID_error___hmf_once_v1;
  findTimeOfDayTimeSpecificationWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findCalendarEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D2550, a3, 0);
}

+ (id)findCalendarEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D2550, a3, a4);
}

+ (id)findCalendarEventWithModelID:(id)a3
{
  return +[HMCContext findCalendarEventWithModelID:error:](HMCContext, "findCalendarEventWithModelID:error:", a3, 0);
}

+ (id)findCalendarEventWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findCalendarEventWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findCalendarEventWithModelID_error___hmf_once_t0, &__block_literal_global_46453);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findCalendarEventWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557D2550, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __67__HMCContext_MKFCalendarEvent__findCalendarEventWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findCalendarEventWithModelID_error___hmf_once_v1;
  findCalendarEventWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findHomeWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D65F0, a3, 0);
}

+ (id)findHomeWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D65F0, a3, a4);
}

+ (id)findHomeWithModelID:(id)a3
{
  return +[HMCContext findHomeWithModelID:error:](HMCContext, "findHomeWithModelID:error:", a3, 0);
}

+ (id)findHomeWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHomeWithModelID_error___hmf_once_t4;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHomeWithModelID_error___hmf_once_t4, &__block_literal_global_48708);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHomeWithModelID_error___hmf_once_v5;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557D65F0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __49__HMCContext_MKFHome__findHomeWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHomeWithModelID_error___hmf_once_v5;
  findHomeWithModelID_error___hmf_once_v5 = v0;

}

+ (id)findLocationEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D6A70, a3, 0);
}

+ (id)findLocationEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D6A70, a3, a4);
}

+ (id)findLocationEventWithModelID:(id)a3
{
  return +[HMCContext findLocationEventWithModelID:error:](HMCContext, "findLocationEventWithModelID:error:", a3, 0);
}

+ (id)findLocationEventWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findLocationEventWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findLocationEventWithModelID_error___hmf_once_t0, &__block_literal_global_49045);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findLocationEventWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557D6A70, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __67__HMCContext_MKFLocationEvent__findLocationEventWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findLocationEventWithModelID_error___hmf_once_v1;
  findLocationEventWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findHomeThreadNetworkWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D88A0, a3, 0);
}

+ (id)findHomeThreadNetworkWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D88A0, a3, a4);
}

+ (id)findHomeThreadNetworkWithModelID:(id)a3
{
  return +[HMCContext findHomeThreadNetworkWithModelID:error:](HMCContext, "findHomeThreadNetworkWithModelID:error:", a3, 0);
}

+ (id)findHomeThreadNetworkWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHomeThreadNetworkWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHomeThreadNetworkWithModelID_error___hmf_once_t2, &__block_literal_global_266_51217);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHomeThreadNetworkWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557D88A0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __75__HMCContext_MKFHomeThreadNetwork__findHomeThreadNetworkWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHomeThreadNetworkWithModelID_error___hmf_once_v3;
  findHomeThreadNetworkWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findIntegerCharacteristicWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557DD448, a3, 0);
}

+ (id)findIntegerCharacteristicWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557DD448, a3, a4);
}

+ (id)findIntegerCharacteristicWithInstanceID:(id)a3 service:(id)a4
{
  return +[HMCContext findIntegerCharacteristicWithInstanceID:service:error:](HMCContext, "findIntegerCharacteristicWithInstanceID:service:error:", a3, a4, 0);
}

+ (id)findIntegerCharacteristicWithInstanceID:(id)a3 service:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = findIntegerCharacteristicWithInstanceID_service_error___hmf_once_t0;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&findIntegerCharacteristicWithInstanceID_service_error___hmf_once_t0, &__block_literal_global_54329);
  v15[0] = CFSTR("PRIMARYKEY");
  v15[1] = CFSTR("SECONDARYKEY");
  v16[0] = v9;
  v16[1] = v8;
  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = (id)findIntegerCharacteristicWithInstanceID_service_error___hmf_once_v1;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557DD448, v11, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)findIntegerCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4
{
  return +[HMCContext findIntegerCharacteristicWithInstanceID:serviceDatabaseID:error:](HMCContext, "findIntegerCharacteristicWithInstanceID:serviceDatabaseID:error:", a3, a4, 0);
}

+ (id)findIntegerCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = findIntegerCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t2;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&findIntegerCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t2, &__block_literal_global_310_54322);
  v10 = (id)findIntegerCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3;
  objc_msgSend(v8, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("OBJECTID");
  v15[1] = CFSTR("SECONDARYKEY");
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:parentObjectID:template:substitutions:error:](HMCContext, "findModelObjectOfType:parentObjectID:template:substitutions:error:", &unk_2557DD448, v11, v10, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __104__HMCContext_MKFIntegerCharacteristic__findIntegerCharacteristicWithInstanceID_serviceDatabaseID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("service = $PARENT AND instanceID = $SECONDARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findIntegerCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3;
  findIntegerCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3 = v0;

}

void __94__HMCContext_MKFIntegerCharacteristic__findIntegerCharacteristicWithInstanceID_service_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("instanceID = $PRIMARYKEY AND service = $SECONDARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findIntegerCharacteristicWithInstanceID_service_error___hmf_once_v1;
  findIntegerCharacteristicWithInstanceID_service_error___hmf_once_v1 = v0;

}

+ (id)findHomeSettingWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557847A0, a3, 0);
}

+ (id)findHomeSettingWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557847A0, a3, a4);
}

+ (id)findHomeSettingWithModelID:(id)a3
{
  return +[HMCContext findHomeSettingWithModelID:error:](HMCContext, "findHomeSettingWithModelID:error:", a3, 0);
}

+ (id)findHomeSettingWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHomeSettingWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHomeSettingWithModelID_error___hmf_once_t2, &__block_literal_global_260);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHomeSettingWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557847A0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __63__HMCContext_MKFHomeSetting__findHomeSettingWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHomeSettingWithModelID_error___hmf_once_v3;
  findHomeSettingWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findUserWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557E6C28, a3, 0);
}

+ (id)findUserWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557E6C28, a3, a4);
}

+ (id)findUserWithModelID:(id)a3
{
  return +[HMCContext findUserWithModelID:error:](HMCContext, "findUserWithModelID:error:", a3, 0);
}

+ (id)findUserWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findUserWithModelID_error___hmf_once_t26;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findUserWithModelID_error___hmf_once_t26, &__block_literal_global_747);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findUserWithModelID_error___hmf_once_v27;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557E6C28, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __49__HMCContext_MKFUser__findUserWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findUserWithModelID_error___hmf_once_v27;
  findUserWithModelID_error___hmf_once_v27 = v0;

}

+ (id)findDeviceWithDeviceIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("(%K == $DEVICE_IDENTIFIER)"), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("DEVICE_IDENTIFIER");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557E8318, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)findDeviceWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557E8318, a3, 0);
}

+ (id)findDeviceWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557E8318, a3, a4);
}

+ (id)findDeviceWithModelID:(id)a3
{
  return +[HMCContext findDeviceWithModelID:error:](HMCContext, "findDeviceWithModelID:error:", a3, 0);
}

+ (id)findDeviceWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findDeviceWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findDeviceWithModelID_error___hmf_once_t0, &__block_literal_global_62749);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findDeviceWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557E8318, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __53__HMCContext_MKFDevice__findDeviceWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findDeviceWithModelID_error___hmf_once_v1;
  findDeviceWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findBulletinTimeSpecificationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D1048, a3, 0);
}

+ (id)findBulletinTimeSpecificationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557D1048, a3, a4);
}

+ (id)findBulletinTimeSpecificationWithModelID:(id)a3
{
  return +[HMCContext findBulletinTimeSpecificationWithModelID:error:](HMCContext, "findBulletinTimeSpecificationWithModelID:error:", a3, 0);
}

+ (id)findBulletinTimeSpecificationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findBulletinTimeSpecificationWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findBulletinTimeSpecificationWithModelID_error___hmf_once_t0, &__block_literal_global_63158);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findBulletinTimeSpecificationWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557D1048, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __91__HMCContext_MKFBulletinTimeSpecification__findBulletinTimeSpecificationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findBulletinTimeSpecificationWithModelID_error___hmf_once_v1;
  findBulletinTimeSpecificationWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findAppleMediaAccessoryPowerActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557E84C0, a3, 0);
}

+ (id)findAppleMediaAccessoryPowerActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557E84C0, a3, a4);
}

+ (id)findAppleMediaAccessoryPowerActionWithModelID:(id)a3
{
  return +[HMCContext findAppleMediaAccessoryPowerActionWithModelID:error:](HMCContext, "findAppleMediaAccessoryPowerActionWithModelID:error:", a3, 0);
}

+ (id)findAppleMediaAccessoryPowerActionWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findAppleMediaAccessoryPowerActionWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findAppleMediaAccessoryPowerActionWithModelID_error___hmf_once_t0, &__block_literal_global_63495);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findAppleMediaAccessoryPowerActionWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557E84C0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __101__HMCContext_MKFAppleMediaAccessoryPowerAction__findAppleMediaAccessoryPowerActionWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findAppleMediaAccessoryPowerActionWithModelID_error___hmf_once_v1;
  findAppleMediaAccessoryPowerActionWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findHomeNetworkRouterManagingDeviceSettingWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557E87F8, a3, 0);
}

+ (id)findHomeNetworkRouterManagingDeviceSettingWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557E87F8, a3, a4);
}

+ (id)findHomeNetworkRouterManagingDeviceSettingWithModelID:(id)a3
{
  return +[HMCContext findHomeNetworkRouterManagingDeviceSettingWithModelID:error:](HMCContext, "findHomeNetworkRouterManagingDeviceSettingWithModelID:error:", a3, 0);
}

+ (id)findHomeNetworkRouterManagingDeviceSettingWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHomeNetworkRouterManagingDeviceSettingWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHomeNetworkRouterManagingDeviceSettingWithModelID_error___hmf_once_t0, &__block_literal_global_64219);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHomeNetworkRouterManagingDeviceSettingWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557E87F8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __117__HMCContext_MKFHomeNetworkRouterManagingDeviceSetting__findHomeNetworkRouterManagingDeviceSettingWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHomeNetworkRouterManagingDeviceSettingWithModelID_error___hmf_once_v1;
  findHomeNetworkRouterManagingDeviceSettingWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findAirPlayAccessoryWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557EAD38, a3, 0);
}

+ (id)findAirPlayAccessoryWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557EAD38, a3, a4);
}

+ (id)findAirPlayAccessoryWithModelID:(id)a3
{
  return +[HMCContext findAirPlayAccessoryWithModelID:error:](HMCContext, "findAirPlayAccessoryWithModelID:error:", a3, 0);
}

+ (id)findAirPlayAccessoryWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findAirPlayAccessoryWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findAirPlayAccessoryWithModelID_error___hmf_once_t2, &__block_literal_global_482);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findAirPlayAccessoryWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557EAD38, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __73__HMCContext_MKFAirPlayAccessory__findAirPlayAccessoryWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findAirPlayAccessoryWithModelID_error___hmf_once_v3;
  findAirPlayAccessoryWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findHomeAccessCodeWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557EAF40, a3, 0);
}

+ (id)findHomeAccessCodeWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557EAF40, a3, a4);
}

+ (id)findHomeAccessCodeWithModelID:(id)a3
{
  return +[HMCContext findHomeAccessCodeWithModelID:error:](HMCContext, "findHomeAccessCodeWithModelID:error:", a3, 0);
}

+ (id)findHomeAccessCodeWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHomeAccessCodeWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHomeAccessCodeWithModelID_error___hmf_once_t0, &__block_literal_global_66137);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHomeAccessCodeWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557EAF40, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __69__HMCContext_MKFHomeAccessCode__findHomeAccessCodeWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHomeAccessCodeWithModelID_error___hmf_once_v1;
  findHomeAccessCodeWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findPresenceEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557ECED0, a3, 0);
}

+ (id)findPresenceEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557ECED0, a3, a4);
}

+ (id)findPresenceEventWithModelID:(id)a3
{
  return +[HMCContext findPresenceEventWithModelID:error:](HMCContext, "findPresenceEventWithModelID:error:", a3, 0);
}

+ (id)findPresenceEventWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findPresenceEventWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findPresenceEventWithModelID_error___hmf_once_t2, &__block_literal_global_306);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findPresenceEventWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557ECED0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __67__HMCContext_MKFPresenceEvent__findPresenceEventWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findPresenceEventWithModelID_error___hmf_once_v3;
  findPresenceEventWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findPersonWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255783F88, a3, 0);
}

+ (id)findPersonWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255783F88, a3, a4);
}

+ (id)findPersonWithModelID:(id)a3
{
  return +[HMCContext findPersonWithModelID:error:](HMCContext, "findPersonWithModelID:error:", a3, 0);
}

+ (id)findPersonWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findPersonWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findPersonWithModelID_error___hmf_once_t0, &__block_literal_global_70389);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findPersonWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255783F88, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __53__HMCContext_MKFPerson__findPersonWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findPersonWithModelID_error___hmf_once_v1;
  findPersonWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findGuestAccessCodeWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557F0758, a3, 0);
}

+ (id)findGuestAccessCodeWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557F0758, a3, a4);
}

+ (id)findGuestAccessCodeWithModelID:(id)a3
{
  return +[HMCContext findGuestAccessCodeWithModelID:error:](HMCContext, "findGuestAccessCodeWithModelID:error:", a3, 0);
}

+ (id)findGuestAccessCodeWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findGuestAccessCodeWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findGuestAccessCodeWithModelID_error___hmf_once_t2, &__block_literal_global_277);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findGuestAccessCodeWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557F0758, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __71__HMCContext_MKFGuestAccessCode__findGuestAccessCodeWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findGuestAccessCodeWithModelID_error___hmf_once_v3;
  findGuestAccessCodeWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findRoomWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557F08D0, a3, 0);
}

+ (id)findRoomWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557F08D0, a3, a4);
}

+ (id)findRoomWithModelID:(id)a3
{
  return +[HMCContext findRoomWithModelID:error:](HMCContext, "findRoomWithModelID:error:", a3, 0);
}

+ (id)findRoomWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findRoomWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findRoomWithModelID_error___hmf_once_t2, &__block_literal_global_289_71561);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findRoomWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557F08D0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __49__HMCContext_MKFRoom__findRoomWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findRoomWithModelID_error___hmf_once_v3;
  findRoomWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findServiceWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557FDAC8, a3, 0);
}

+ (id)findServiceWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557FDAC8, a3, a4);
}

+ (id)findServiceWithModelID:(id)a3
{
  return +[HMCContext findServiceWithModelID:error:](HMCContext, "findServiceWithModelID:error:", a3, 0);
}

+ (id)findServiceWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findServiceWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findServiceWithModelID_error___hmf_once_t2, &__block_literal_global_401);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findServiceWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557FDAC8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)findServiceWithInstanceID:(id)a3 accessory:(id)a4
{
  return +[HMCContext findServiceWithInstanceID:accessory:error:](HMCContext, "findServiceWithInstanceID:accessory:error:", a3, a4, 0);
}

+ (id)findServiceWithInstanceID:(id)a3 accessory:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = findServiceWithInstanceID_accessory_error___hmf_once_t4;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&findServiceWithInstanceID_accessory_error___hmf_once_t4, &__block_literal_global_407_78638);
  v15[0] = CFSTR("PRIMARYKEY");
  v15[1] = CFSTR("SECONDARYKEY");
  v16[0] = v9;
  v16[1] = v8;
  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = (id)findServiceWithInstanceID_accessory_error___hmf_once_v5;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557FDAC8, v11, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)findServiceWithInstanceID:(id)a3 accessoryDatabaseID:(id)a4
{
  return +[HMCContext findServiceWithInstanceID:accessoryDatabaseID:error:](HMCContext, "findServiceWithInstanceID:accessoryDatabaseID:error:", a3, a4, 0);
}

+ (id)findServiceWithInstanceID:(id)a3 accessoryDatabaseID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = findServiceWithInstanceID_accessoryDatabaseID_error___hmf_once_t6;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&findServiceWithInstanceID_accessoryDatabaseID_error___hmf_once_t6, &__block_literal_global_412);
  v10 = (id)findServiceWithInstanceID_accessoryDatabaseID_error___hmf_once_v7;
  objc_msgSend(v8, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("OBJECTID");
  v15[1] = CFSTR("SECONDARYKEY");
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:parentObjectID:template:substitutions:error:](HMCContext, "findModelObjectOfType:parentObjectID:template:substitutions:error:", &unk_2557FDAC8, v11, v10, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __78__HMCContext_MKFService__findServiceWithInstanceID_accessoryDatabaseID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accessory = $PARENT AND instanceID = $SECONDARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findServiceWithInstanceID_accessoryDatabaseID_error___hmf_once_v7;
  findServiceWithInstanceID_accessoryDatabaseID_error___hmf_once_v7 = v0;

}

void __68__HMCContext_MKFService__findServiceWithInstanceID_accessory_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("instanceID = $PRIMARYKEY AND accessory = $SECONDARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findServiceWithInstanceID_accessory_error___hmf_once_v5;
  findServiceWithInstanceID_accessory_error___hmf_once_v5 = v0;

}

void __55__HMCContext_MKFService__findServiceWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findServiceWithModelID_error___hmf_once_v3;
  findServiceWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findHAPMetadataWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557FF400, a3, 0);
}

+ (id)findHAPMetadataWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557FF400, a3, a4);
}

+ (id)findHAPMetadataWithModelID:(id)a3
{
  return +[HMCContext findHAPMetadataWithModelID:error:](HMCContext, "findHAPMetadataWithModelID:error:", a3, 0);
}

+ (id)findHAPMetadataWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHAPMetadataWithModelID_error___hmf_once_t1;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHAPMetadataWithModelID_error___hmf_once_t1, &__block_literal_global_80567);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHAPMetadataWithModelID_error___hmf_once_v2;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557FF400, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __63__HMCContext_MKFHAPMetadata__findHAPMetadataWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHAPMetadataWithModelID_error___hmf_once_v2;
  findHAPMetadataWithModelID_error___hmf_once_v2 = v0;

}

+ (id)findHomeNetworkRouterSettingWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557FF628, a3, 0);
}

+ (id)findHomeNetworkRouterSettingWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557FF628, a3, a4);
}

+ (id)findHomeNetworkRouterSettingWithModelID:(id)a3
{
  return +[HMCContext findHomeNetworkRouterSettingWithModelID:error:](HMCContext, "findHomeNetworkRouterSettingWithModelID:error:", a3, 0);
}

+ (id)findHomeNetworkRouterSettingWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHomeNetworkRouterSettingWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHomeNetworkRouterSettingWithModelID_error___hmf_once_t2, &__block_literal_global_80918);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHomeNetworkRouterSettingWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557FF628, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __89__HMCContext_MKFHomeNetworkRouterSetting__findHomeNetworkRouterSettingWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHomeNetworkRouterSettingWithModelID_error___hmf_once_v3;
  findHomeNetworkRouterSettingWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findCameraAccessModeBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557FFFE8, a3, 0);
}

+ (id)findCameraAccessModeBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557FFFE8, a3, a4);
}

+ (id)findCameraAccessModeBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findCameraAccessModeBulletinRegistrationWithModelID:error:](HMCContext, "findCameraAccessModeBulletinRegistrationWithModelID:error:", a3, 0);
}

+ (id)findCameraAccessModeBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findCameraAccessModeBulletinRegistrationWithModelID_error___hmf_once_t1;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findCameraAccessModeBulletinRegistrationWithModelID_error___hmf_once_t1, &__block_literal_global_81743);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findCameraAccessModeBulletinRegistrationWithModelID_error___hmf_once_v2;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557FFFE8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __113__HMCContext_MKFCameraAccessModeBulletinRegistration__findCameraAccessModeBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findCameraAccessModeBulletinRegistrationWithModelID_error___hmf_once_v2;
  findCameraAccessModeBulletinRegistrationWithModelID_error___hmf_once_v2 = v0;

}

+ (id)findCameraSignificantEventBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255802E48, a3, 0);
}

+ (id)findCameraSignificantEventBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255802E48, a3, a4);
}

+ (id)findCameraSignificantEventBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findCameraSignificantEventBulletinRegistrationWithModelID:error:](HMCContext, "findCameraSignificantEventBulletinRegistrationWithModelID:error:", a3, 0);
}

+ (id)findCameraSignificantEventBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findCameraSignificantEventBulletinRegistrationWithModelID_error___hmf_once_t1;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findCameraSignificantEventBulletinRegistrationWithModelID_error___hmf_once_t1, &__block_literal_global_86219);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findCameraSignificantEventBulletinRegistrationWithModelID_error___hmf_once_v2;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255802E48, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __125__HMCContext_MKFCameraSignificantEventBulletinRegistration__findCameraSignificantEventBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findCameraSignificantEventBulletinRegistrationWithModelID_error___hmf_once_v2;
  findCameraSignificantEventBulletinRegistrationWithModelID_error___hmf_once_v2 = v0;

}

+ (id)findResidentSelectionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558038B8, a3, 0);
}

+ (id)findResidentSelectionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558038B8, a3, a4);
}

+ (id)findResidentSelectionWithModelID:(id)a3
{
  return +[HMCContext findResidentSelectionWithModelID:error:](HMCContext, "findResidentSelectionWithModelID:error:", a3, 0);
}

+ (id)findResidentSelectionWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findResidentSelectionWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findResidentSelectionWithModelID_error___hmf_once_t2, &__block_literal_global_277_86871);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findResidentSelectionWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558038B8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __75__HMCContext_MKFResidentSelection__findResidentSelectionWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findResidentSelectionWithModelID_error___hmf_once_v3;
  findResidentSelectionWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findCharacteristicValueEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255808150, a3, 0);
}

+ (id)findCharacteristicValueEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255808150, a3, a4);
}

+ (id)findCharacteristicValueEventWithModelID:(id)a3
{
  return +[HMCContext findCharacteristicValueEventWithModelID:error:](HMCContext, "findCharacteristicValueEventWithModelID:error:", a3, 0);
}

+ (id)findCharacteristicValueEventWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findCharacteristicValueEventWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findCharacteristicValueEventWithModelID_error___hmf_once_t0, &__block_literal_global_91169);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findCharacteristicValueEventWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255808150, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __89__HMCContext_MKFCharacteristicValueEvent__findCharacteristicValueEventWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findCharacteristicValueEventWithModelID_error___hmf_once_v1;
  findCharacteristicValueEventWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findResidentWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25580C660, a3, 0);
}

+ (id)findResidentWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25580C660, a3, a4);
}

+ (id)findResidentWithModelID:(id)a3
{
  return +[HMCContext findResidentWithModelID:error:](HMCContext, "findResidentWithModelID:error:", a3, 0);
}

+ (id)findResidentWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findResidentWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findResidentWithModelID_error___hmf_once_t2, &__block_literal_global_311);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findResidentWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25580C660, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __57__HMCContext_MKFResident__findResidentWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findResidentWithModelID_error___hmf_once_v3;
  findResidentWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findAppleMediaAccessoryWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255810480, a3, 0);
}

+ (id)findAppleMediaAccessoryWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255810480, a3, a4);
}

+ (id)findAppleMediaAccessoryWithModelID:(id)a3
{
  return +[HMCContext findAppleMediaAccessoryWithModelID:error:](HMCContext, "findAppleMediaAccessoryWithModelID:error:", a3, 0);
}

+ (id)findAppleMediaAccessoryWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findAppleMediaAccessoryWithModelID_error___hmf_once_t8;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findAppleMediaAccessoryWithModelID_error___hmf_once_t8, &__block_literal_global_96984);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findAppleMediaAccessoryWithModelID_error___hmf_once_v9;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255810480, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __79__HMCContext_MKFAppleMediaAccessory__findAppleMediaAccessoryWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findAppleMediaAccessoryWithModelID_error___hmf_once_v9;
  findAppleMediaAccessoryWithModelID_error___hmf_once_v9 = v0;

}

+ (id)findUserAccessCodeWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255811430, a3, 0);
}

+ (id)findUserAccessCodeWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255811430, a3, a4);
}

+ (id)findUserAccessCodeWithModelID:(id)a3
{
  return +[HMCContext findUserAccessCodeWithModelID:error:](HMCContext, "findUserAccessCodeWithModelID:error:", a3, 0);
}

+ (id)findUserAccessCodeWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findUserAccessCodeWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findUserAccessCodeWithModelID_error___hmf_once_t2, &__block_literal_global_269);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findUserAccessCodeWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255811430, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __69__HMCContext_MKFUserAccessCode__findUserAccessCodeWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findUserAccessCodeWithModelID_error___hmf_once_v3;
  findUserAccessCodeWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25577D7A0, a3, 0);
}

+ (id)findActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25577D7A0, a3, a4);
}

+ (id)findActionWithModelID:(id)a3
{
  return +[HMCContext findActionWithModelID:error:](HMCContext, "findActionWithModelID:error:", a3, 0);
}

+ (id)findActionWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findActionWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findActionWithModelID_error___hmf_once_t2, &__block_literal_global_263);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findActionWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25577D7A0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __53__HMCContext_MKFAction__findActionWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findActionWithModelID_error___hmf_once_v3;
  findActionWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findHomeManagerWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255821150, a3, 0);
}

+ (id)findHomeManagerWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255821150, a3, a4);
}

+ (id)findHomeManagerWithModelID:(id)a3
{
  return +[HMCContext findHomeManagerWithModelID:error:](HMCContext, "findHomeManagerWithModelID:error:", a3, 0);
}

+ (id)findHomeManagerWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHomeManagerWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHomeManagerWithModelID_error___hmf_once_t2, &__block_literal_global_109114);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHomeManagerWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255821150, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __63__HMCContext_MKFHomeManager__findHomeManagerWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHomeManagerWithModelID_error___hmf_once_v3;
  findHomeManagerWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findBulletinConditionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557CCEC8, a3, 0);
}

+ (id)findBulletinConditionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557CCEC8, a3, a4);
}

+ (id)findBulletinConditionWithModelID:(id)a3
{
  return +[HMCContext findBulletinConditionWithModelID:error:](HMCContext, "findBulletinConditionWithModelID:error:", a3, 0);
}

+ (id)findBulletinConditionWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findBulletinConditionWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findBulletinConditionWithModelID_error___hmf_once_t2, &__block_literal_global_263_109464);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findBulletinConditionWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557CCEC8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __75__HMCContext_MKFBulletinCondition__findBulletinConditionWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findBulletinConditionWithModelID_error___hmf_once_v3;
  findBulletinConditionWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findCharacteristicWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557DD298, a3, 0);
}

+ (id)findCharacteristicWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557DD298, a3, a4);
}

+ (id)findCharacteristicWithInstanceID:(id)a3 service:(id)a4
{
  return +[HMCContext findCharacteristicWithInstanceID:service:error:](HMCContext, "findCharacteristicWithInstanceID:service:error:", a3, a4, 0);
}

+ (id)findCharacteristicWithInstanceID:(id)a3 service:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = findCharacteristicWithInstanceID_service_error___hmf_once_t2;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&findCharacteristicWithInstanceID_service_error___hmf_once_t2, &__block_literal_global_305);
  v15[0] = CFSTR("PRIMARYKEY");
  v15[1] = CFSTR("SECONDARYKEY");
  v16[0] = v9;
  v16[1] = v8;
  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = (id)findCharacteristicWithInstanceID_service_error___hmf_once_v3;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557DD298, v11, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)findCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4
{
  return +[HMCContext findCharacteristicWithInstanceID:serviceDatabaseID:error:](HMCContext, "findCharacteristicWithInstanceID:serviceDatabaseID:error:", a3, a4, 0);
}

+ (id)findCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = findCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t4;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&findCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t4, &__block_literal_global_313);
  v10 = (id)findCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v5;
  objc_msgSend(v8, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("OBJECTID");
  v15[1] = CFSTR("SECONDARYKEY");
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:parentObjectID:template:substitutions:error:](HMCContext, "findModelObjectOfType:parentObjectID:template:substitutions:error:", &unk_2557DD298, v11, v10, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __90__HMCContext_MKFCharacteristic__findCharacteristicWithInstanceID_serviceDatabaseID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("service = $PARENT AND instanceID = $SECONDARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v5;
  findCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v5 = v0;

}

void __80__HMCContext_MKFCharacteristic__findCharacteristicWithInstanceID_service_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("instanceID = $PRIMARYKEY AND service = $SECONDARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findCharacteristicWithInstanceID_service_error___hmf_once_v3;
  findCharacteristicWithInstanceID_service_error___hmf_once_v3 = v0;

}

+ (id)findUserActivityStatusWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255825278, a3, 0);
}

+ (id)findUserActivityStatusWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255825278, a3, a4);
}

+ (id)findUserActivityStatusWithModelID:(id)a3
{
  return +[HMCContext findUserActivityStatusWithModelID:error:](HMCContext, "findUserActivityStatusWithModelID:error:", a3, 0);
}

+ (id)findUserActivityStatusWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findUserActivityStatusWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findUserActivityStatusWithModelID_error___hmf_once_t2, &__block_literal_global_113553);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findUserActivityStatusWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255825278, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __77__HMCContext_MKFUserActivityStatus__findUserActivityStatusWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findUserActivityStatusWithModelID_error___hmf_once_v3;
  findUserActivityStatusWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557FFEC8, a3, 0);
}

+ (id)findBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557FFEC8, a3, a4);
}

+ (id)findBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findBulletinRegistrationWithModelID:error:](HMCContext, "findBulletinRegistrationWithModelID:error:", a3, 0);
}

+ (id)findBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findBulletinRegistrationWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findBulletinRegistrationWithModelID_error___hmf_once_t2, &__block_literal_global_311_115729);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findBulletinRegistrationWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557FFEC8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __81__HMCContext_MKFBulletinRegistration__findBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findBulletinRegistrationWithModelID_error___hmf_once_v3;
  findBulletinRegistrationWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findTimerTriggerWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25582D570, a3, 0);
}

+ (id)findTimerTriggerWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25582D570, a3, a4);
}

+ (id)findTimerTriggerWithModelID:(id)a3
{
  return +[HMCContext findTimerTriggerWithModelID:error:](HMCContext, "findTimerTriggerWithModelID:error:", a3, 0);
}

+ (id)findTimerTriggerWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findTimerTriggerWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findTimerTriggerWithModelID_error___hmf_once_t2, &__block_literal_global_334);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findTimerTriggerWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25582D570, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __65__HMCContext_MKFTimerTrigger__findTimerTriggerWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findTimerTriggerWithModelID_error___hmf_once_v3;
  findTimerTriggerWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findCameraReachabilityBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255830938, a3, 0);
}

+ (id)findCameraReachabilityBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255830938, a3, a4);
}

+ (id)findCameraReachabilityBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findCameraReachabilityBulletinRegistrationWithModelID:error:](HMCContext, "findCameraReachabilityBulletinRegistrationWithModelID:error:", a3, 0);
}

+ (id)findCameraReachabilityBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findCameraReachabilityBulletinRegistrationWithModelID_error___hmf_once_t1;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findCameraReachabilityBulletinRegistrationWithModelID_error___hmf_once_t1, &__block_literal_global_124382);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findCameraReachabilityBulletinRegistrationWithModelID_error___hmf_once_v2;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255830938, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __117__HMCContext_MKFCameraReachabilityBulletinRegistration__findCameraReachabilityBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findCameraReachabilityBulletinRegistrationWithModelID_error___hmf_once_v2;
  findCameraReachabilityBulletinRegistrationWithModelID_error___hmf_once_v2 = v0;

}

+ (id)findEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255782840, a3, 0);
}

+ (id)findEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255782840, a3, a4);
}

+ (id)findEventWithModelID:(id)a3
{
  return +[HMCContext findEventWithModelID:error:](HMCContext, "findEventWithModelID:error:", a3, 0);
}

+ (id)findEventWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findEventWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findEventWithModelID_error___hmf_once_t2, &__block_literal_global_270_128219);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findEventWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255782840, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __51__HMCContext_MKFEvent__findEventWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findEventWithModelID_error___hmf_once_v3;
  findEventWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findShortcutActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255840698, a3, 0);
}

+ (id)findShortcutActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255840698, a3, a4);
}

+ (id)findShortcutActionWithModelID:(id)a3
{
  return +[HMCContext findShortcutActionWithModelID:error:](HMCContext, "findShortcutActionWithModelID:error:", a3, 0);
}

+ (id)findShortcutActionWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findShortcutActionWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findShortcutActionWithModelID_error___hmf_once_t0, &__block_literal_global_133111);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findShortcutActionWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255840698, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __69__HMCContext_MKFShortcutAction__findShortcutActionWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findShortcutActionWithModelID_error___hmf_once_v1;
  findShortcutActionWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findSoftwareUpdateWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255841240, a3, 0);
}

+ (id)findSoftwareUpdateWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255841240, a3, a4);
}

+ (id)findSoftwareUpdateWithModelID:(id)a3
{
  return +[HMCContext findSoftwareUpdateWithModelID:error:](HMCContext, "findSoftwareUpdateWithModelID:error:", a3, 0);
}

+ (id)findSoftwareUpdateWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findSoftwareUpdateWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findSoftwareUpdateWithModelID_error___hmf_once_t2, &__block_literal_global_296);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findSoftwareUpdateWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255841240, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __69__HMCContext_MKFSoftwareUpdate__findSoftwareUpdateWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findSoftwareUpdateWithModelID_error___hmf_once_v3;
  findSoftwareUpdateWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findMediaAccessoryWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557EAAE0, a3, 0);
}

+ (id)findMediaAccessoryWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2557EAAE0, a3, a4);
}

+ (id)findMediaAccessoryWithModelID:(id)a3
{
  return +[HMCContext findMediaAccessoryWithModelID:error:](HMCContext, "findMediaAccessoryWithModelID:error:", a3, 0);
}

+ (id)findMediaAccessoryWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findMediaAccessoryWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findMediaAccessoryWithModelID_error___hmf_once_t0, &__block_literal_global_137676);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findMediaAccessoryWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2557EAAE0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __69__HMCContext_MKFMediaAccessory__findMediaAccessoryWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findMediaAccessoryWithModelID_error___hmf_once_v1;
  findMediaAccessoryWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findGuestWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558459A0, a3, 0);
}

+ (id)findGuestWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558459A0, a3, a4);
}

+ (id)findGuestWithModelID:(id)a3
{
  return +[HMCContext findGuestWithModelID:error:](HMCContext, "findGuestWithModelID:error:", a3, 0);
}

+ (id)findGuestWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findGuestWithModelID_error___hmf_once_t10;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findGuestWithModelID_error___hmf_once_t10, &__block_literal_global_596);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findGuestWithModelID_error___hmf_once_v11;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558459A0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __51__HMCContext_MKFGuest__findGuestWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findGuestWithModelID_error___hmf_once_v11;
  findGuestWithModelID_error___hmf_once_v11 = v0;

}

+ (id)findHomePersonWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25584B408, a3, 0);
}

+ (id)findHomePersonWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25584B408, a3, a4);
}

+ (id)findHomePersonWithModelID:(id)a3
{
  return +[HMCContext findHomePersonWithModelID:error:](HMCContext, "findHomePersonWithModelID:error:", a3, 0);
}

+ (id)findHomePersonWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHomePersonWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHomePersonWithModelID_error___hmf_once_t2, &__block_literal_global_277_146366);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHomePersonWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25584B408, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __61__HMCContext_MKFHomePerson__findHomePersonWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHomePersonWithModelID_error___hmf_once_v3;
  findHomePersonWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findStringCharacteristicWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25584D1D0, a3, 0);
}

+ (id)findStringCharacteristicWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25584D1D0, a3, a4);
}

+ (id)findStringCharacteristicWithInstanceID:(id)a3 service:(id)a4
{
  return +[HMCContext findStringCharacteristicWithInstanceID:service:error:](HMCContext, "findStringCharacteristicWithInstanceID:service:error:", a3, a4, 0);
}

+ (id)findStringCharacteristicWithInstanceID:(id)a3 service:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = findStringCharacteristicWithInstanceID_service_error___hmf_once_t0;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&findStringCharacteristicWithInstanceID_service_error___hmf_once_t0, &__block_literal_global_148875);
  v15[0] = CFSTR("PRIMARYKEY");
  v15[1] = CFSTR("SECONDARYKEY");
  v16[0] = v9;
  v16[1] = v8;
  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = (id)findStringCharacteristicWithInstanceID_service_error___hmf_once_v1;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25584D1D0, v11, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)findStringCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4
{
  return +[HMCContext findStringCharacteristicWithInstanceID:serviceDatabaseID:error:](HMCContext, "findStringCharacteristicWithInstanceID:serviceDatabaseID:error:", a3, a4, 0);
}

+ (id)findStringCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = findStringCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t2;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&findStringCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t2, &__block_literal_global_298);
  v10 = (id)findStringCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3;
  objc_msgSend(v8, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("OBJECTID");
  v15[1] = CFSTR("SECONDARYKEY");
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:parentObjectID:template:substitutions:error:](HMCContext, "findModelObjectOfType:parentObjectID:template:substitutions:error:", &unk_25584D1D0, v11, v10, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __102__HMCContext_MKFStringCharacteristic__findStringCharacteristicWithInstanceID_serviceDatabaseID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("service = $PARENT AND instanceID = $SECONDARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findStringCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3;
  findStringCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3 = v0;

}

void __92__HMCContext_MKFStringCharacteristic__findStringCharacteristicWithInstanceID_service_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("instanceID = $PRIMARYKEY AND service = $SECONDARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findStringCharacteristicWithInstanceID_service_error___hmf_once_v1;
  findStringCharacteristicWithInstanceID_service_error___hmf_once_v1 = v0;

}

+ (id)findMatterLocalKeyValuePairWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558513B8, a3, 0);
}

+ (id)findMatterLocalKeyValuePairWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558513B8, a3, a4);
}

+ (id)findMatterLocalKeyValuePairWithKey:(id)a3
{
  return +[HMCContext findMatterLocalKeyValuePairWithKey:error:](HMCContext, "findMatterLocalKeyValuePairWithKey:error:", a3, 0);
}

+ (id)findMatterLocalKeyValuePairWithKey:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findMatterLocalKeyValuePairWithKey_error___hmf_once_t3;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findMatterLocalKeyValuePairWithKey_error___hmf_once_t3, &__block_literal_global_254_154603);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findMatterLocalKeyValuePairWithKey_error___hmf_once_v4;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558513B8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __83__HMCContext_MKFMatterLocalKeyValuePair__findMatterLocalKeyValuePairWithKey_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("key = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findMatterLocalKeyValuePairWithKey_error___hmf_once_v4;
  findMatterLocalKeyValuePairWithKey_error___hmf_once_v4 = v0;

}

+ (id)findHAPAccessoryWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255852958, a3, 0);
}

+ (id)findHAPAccessoryWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255852958, a3, a4);
}

+ (id)findHAPAccessoryWithModelID:(id)a3
{
  return +[HMCContext findHAPAccessoryWithModelID:error:](HMCContext, "findHAPAccessoryWithModelID:error:", a3, 0);
}

+ (id)findHAPAccessoryWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHAPAccessoryWithModelID_error___hmf_once_t9;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHAPAccessoryWithModelID_error___hmf_once_t9, &__block_literal_global_797);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHAPAccessoryWithModelID_error___hmf_once_v10;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255852958, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __65__HMCContext_MKFHAPAccessory__findHAPAccessoryWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHAPAccessoryWithModelID_error___hmf_once_v10;
  findHAPAccessoryWithModelID_error___hmf_once_v10 = v0;

}

+ (id)findOutgoingInvitationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255857640, a3, 0);
}

+ (id)findOutgoingInvitationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255857640, a3, a4);
}

+ (id)findOutgoingInvitationWithModelID:(id)a3
{
  return +[HMCContext findOutgoingInvitationWithModelID:error:](HMCContext, "findOutgoingInvitationWithModelID:error:", a3, 0);
}

+ (id)findOutgoingInvitationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findOutgoingInvitationWithModelID_error___hmf_once_t4;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findOutgoingInvitationWithModelID_error___hmf_once_t4, &__block_literal_global_385);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findOutgoingInvitationWithModelID_error___hmf_once_v5;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255857640, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __77__HMCContext_MKFOutgoingInvitation__findOutgoingInvitationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findOutgoingInvitationWithModelID_error___hmf_once_v5;
  findOutgoingInvitationWithModelID_error___hmf_once_v5 = v0;

}

+ (id)findAccountHandleWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25585F460, a3, 0);
}

+ (id)findAccountHandleWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25585F460, a3, a4);
}

+ (id)findAccountHandleWithModelID:(id)a3
{
  return +[HMCContext findAccountHandleWithModelID:error:](HMCContext, "findAccountHandleWithModelID:error:", a3, 0);
}

+ (id)findAccountHandleWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findAccountHandleWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findAccountHandleWithModelID_error___hmf_once_t0, &__block_literal_global_168542);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findAccountHandleWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25585F460, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __67__HMCContext_MKFAccountHandle__findAccountHandleWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findAccountHandleWithModelID_error___hmf_once_v1;
  findAccountHandleWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findNotificationRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558680B0, a3, 0);
}

+ (id)findNotificationRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558680B0, a3, a4);
}

+ (id)findNotificationRegistrationWithModelID:(id)a3
{
  return +[HMCContext findNotificationRegistrationWithModelID:error:](HMCContext, "findNotificationRegistrationWithModelID:error:", a3, 0);
}

+ (id)findNotificationRegistrationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findNotificationRegistrationWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findNotificationRegistrationWithModelID_error___hmf_once_t2, &__block_literal_global_285);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findNotificationRegistrationWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558680B0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __89__HMCContext_MKFNotificationRegistration__findNotificationRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findNotificationRegistrationWithModelID_error___hmf_once_v3;
  findNotificationRegistrationWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findZoneWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255868908, a3, 0);
}

+ (id)findZoneWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255868908, a3, a4);
}

+ (id)findZoneWithModelID:(id)a3
{
  return +[HMCContext findZoneWithModelID:error:](HMCContext, "findZoneWithModelID:error:", a3, 0);
}

+ (id)findZoneWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findZoneWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findZoneWithModelID_error___hmf_once_t2, &__block_literal_global_275_178097);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findZoneWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255868908, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __49__HMCContext_MKFZone__findZoneWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findZoneWithModelID_error___hmf_once_v3;
  findZoneWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findAnalysisEventBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255868AF8, a3, 0);
}

+ (id)findAnalysisEventBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255868AF8, a3, a4);
}

+ (id)findAnalysisEventBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findAnalysisEventBulletinRegistrationWithModelID:error:](HMCContext, "findAnalysisEventBulletinRegistrationWithModelID:error:", a3, 0);
}

+ (id)findAnalysisEventBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findAnalysisEventBulletinRegistrationWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findAnalysisEventBulletinRegistrationWithModelID_error___hmf_once_t0, &__block_literal_global_178529);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findAnalysisEventBulletinRegistrationWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255868AF8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __107__HMCContext_MKFAnalysisEventBulletinRegistration__findAnalysisEventBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findAnalysisEventBulletinRegistrationWithModelID_error___hmf_once_v1;
  findAnalysisEventBulletinRegistrationWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findAccessoryNetworkProtectionGroupWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558690E0, a3, 0);
}

+ (id)findAccessoryNetworkProtectionGroupWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558690E0, a3, a4);
}

+ (id)findAccessoryNetworkProtectionGroupWithModelID:(id)a3
{
  return +[HMCContext findAccessoryNetworkProtectionGroupWithModelID:error:](HMCContext, "findAccessoryNetworkProtectionGroupWithModelID:error:", a3, 0);
}

+ (id)findAccessoryNetworkProtectionGroupWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findAccessoryNetworkProtectionGroupWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findAccessoryNetworkProtectionGroupWithModelID_error___hmf_once_t2, &__block_literal_global_273_179303);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findAccessoryNetworkProtectionGroupWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558690E0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __103__HMCContext_MKFAccessoryNetworkProtectionGroup__findAccessoryNetworkProtectionGroupWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findAccessoryNetworkProtectionGroupWithModelID_error___hmf_once_v3;
  findAccessoryNetworkProtectionGroupWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findNotificationRegistrationMediaPropertyWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25586E750, a3, 0);
}

+ (id)findNotificationRegistrationMediaPropertyWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25586E750, a3, a4);
}

+ (id)findNotificationRegistrationMediaPropertyWithModelID:(id)a3
{
  return +[HMCContext findNotificationRegistrationMediaPropertyWithModelID:error:](HMCContext, "findNotificationRegistrationMediaPropertyWithModelID:error:", a3, 0);
}

+ (id)findNotificationRegistrationMediaPropertyWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findNotificationRegistrationMediaPropertyWithModelID_error___hmf_once_t1;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findNotificationRegistrationMediaPropertyWithModelID_error___hmf_once_t1, &__block_literal_global_183925);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findNotificationRegistrationMediaPropertyWithModelID_error___hmf_once_v2;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25586E750, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __115__HMCContext_MKFNotificationRegistrationMediaProperty__findNotificationRegistrationMediaPropertyWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findNotificationRegistrationMediaPropertyWithModelID_error___hmf_once_v2;
  findNotificationRegistrationMediaPropertyWithModelID_error___hmf_once_v2 = v0;

}

+ (id)findYearDayScheduleRuleWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25586F4D8, a3, 0);
}

+ (id)findYearDayScheduleRuleWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25586F4D8, a3, a4);
}

+ (id)findYearDayScheduleRuleWithModelID:(id)a3
{
  return +[HMCContext findYearDayScheduleRuleWithModelID:error:](HMCContext, "findYearDayScheduleRuleWithModelID:error:", a3, 0);
}

+ (id)findYearDayScheduleRuleWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findYearDayScheduleRuleWithModelID_error___hmf_once_t4;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findYearDayScheduleRuleWithModelID_error___hmf_once_t4, &__block_literal_global_185031);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findYearDayScheduleRuleWithModelID_error___hmf_once_v5;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25586F4D8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __79__HMCContext_MKFYearDayScheduleRule__findYearDayScheduleRuleWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findYearDayScheduleRuleWithModelID_error___hmf_once_v5;
  findYearDayScheduleRuleWithModelID_error___hmf_once_v5 = v0;

}

+ (id)findActionSetWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558748D0, a3, 0);
}

+ (id)findActionSetWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558748D0, a3, a4);
}

+ (id)findActionSetWithModelID:(id)a3
{
  return +[HMCContext findActionSetWithModelID:error:](HMCContext, "findActionSetWithModelID:error:", a3, 0);
}

+ (id)findActionSetWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findActionSetWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findActionSetWithModelID_error___hmf_once_t2, &__block_literal_global_344);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findActionSetWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558748D0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __59__HMCContext_MKFActionSet__findActionSetWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findActionSetWithModelID_error___hmf_once_v3;
  findActionSetWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findApplicationDataWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255875BC8, a3, 0);
}

+ (id)findApplicationDataWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255875BC8, a3, a4);
}

+ (id)findApplicationDataWithModelID:(id)a3
{
  return +[HMCContext findApplicationDataWithModelID:error:](HMCContext, "findApplicationDataWithModelID:error:", a3, 0);
}

+ (id)findApplicationDataWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findApplicationDataWithModelID_error___hmf_once_t5;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findApplicationDataWithModelID_error___hmf_once_t5, &__block_literal_global_318);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findApplicationDataWithModelID_error___hmf_once_v6;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255875BC8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __71__HMCContext_MKFApplicationData__findApplicationDataWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findApplicationDataWithModelID_error___hmf_once_v6;
  findApplicationDataWithModelID_error___hmf_once_v6 = v0;

}

+ (id)findSunriseSunsetTimeSpecificationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558766F8, a3, 0);
}

+ (id)findSunriseSunsetTimeSpecificationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558766F8, a3, a4);
}

+ (id)findSunriseSunsetTimeSpecificationWithModelID:(id)a3
{
  return +[HMCContext findSunriseSunsetTimeSpecificationWithModelID:error:](HMCContext, "findSunriseSunsetTimeSpecificationWithModelID:error:", a3, 0);
}

+ (id)findSunriseSunsetTimeSpecificationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findSunriseSunsetTimeSpecificationWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findSunriseSunsetTimeSpecificationWithModelID_error___hmf_once_t0, &__block_literal_global_192357);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findSunriseSunsetTimeSpecificationWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558766F8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __101__HMCContext_MKFSunriseSunsetTimeSpecification__findSunriseSunsetTimeSpecificationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findSunriseSunsetTimeSpecificationWithModelID_error___hmf_once_v1;
  findSunriseSunsetTimeSpecificationWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findHomeMediaSettingWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255877C38, a3, 0);
}

+ (id)findHomeMediaSettingWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255877C38, a3, a4);
}

+ (id)findHomeMediaSettingWithModelID:(id)a3
{
  return +[HMCContext findHomeMediaSettingWithModelID:error:](HMCContext, "findHomeMediaSettingWithModelID:error:", a3, 0);
}

+ (id)findHomeMediaSettingWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHomeMediaSettingWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHomeMediaSettingWithModelID_error___hmf_once_t0, &__block_literal_global_193621);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHomeMediaSettingWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255877C38, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __73__HMCContext_MKFHomeMediaSetting__findHomeMediaSettingWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHomeMediaSettingWithModelID_error___hmf_once_v1;
  findHomeMediaSettingWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findTriggerWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25582D3E0, a3, 0);
}

+ (id)findTriggerWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25582D3E0, a3, a4);
}

+ (id)findTriggerWithModelID:(id)a3
{
  return +[HMCContext findTriggerWithModelID:error:](HMCContext, "findTriggerWithModelID:error:", a3, 0);
}

+ (id)findTriggerWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findTriggerWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findTriggerWithModelID_error___hmf_once_t2, &__block_literal_global_300);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findTriggerWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25582D3E0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __55__HMCContext_MKFTrigger__findTriggerWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findTriggerWithModelID_error___hmf_once_v3;
  findTriggerWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findNaturalLightingActionWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25588BEA0, a3, 0);
}

+ (id)findNaturalLightingActionWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25588BEA0, a3, a4);
}

+ (id)findNaturalLightingActionWithModelID:(id)a3
{
  return +[HMCContext findNaturalLightingActionWithModelID:error:](HMCContext, "findNaturalLightingActionWithModelID:error:", a3, 0);
}

+ (id)findNaturalLightingActionWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findNaturalLightingActionWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findNaturalLightingActionWithModelID_error___hmf_once_t0, &__block_literal_global_207790);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findNaturalLightingActionWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25588BEA0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __83__HMCContext_MKFNaturalLightingAction__findNaturalLightingActionWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findNaturalLightingActionWithModelID_error___hmf_once_v1;
  findNaturalLightingActionWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findEventTriggerWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25588C5F8, a3, 0);
}

+ (id)findEventTriggerWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25588C5F8, a3, a4);
}

+ (id)findEventTriggerWithModelID:(id)a3
{
  return +[HMCContext findEventTriggerWithModelID:error:](HMCContext, "findEventTriggerWithModelID:error:", a3, 0);
}

+ (id)findEventTriggerWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findEventTriggerWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findEventTriggerWithModelID_error___hmf_once_t2, &__block_literal_global_377);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findEventTriggerWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25588C5F8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __65__HMCContext_MKFEventTrigger__findEventTriggerWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findEventTriggerWithModelID_error___hmf_once_v3;
  findEventTriggerWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findCharacteristicBulletinRegistrationWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25589B890, a3, 0);
}

+ (id)findCharacteristicBulletinRegistrationWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25589B890, a3, a4);
}

+ (id)findCharacteristicBulletinRegistrationWithModelID:(id)a3
{
  return +[HMCContext findCharacteristicBulletinRegistrationWithModelID:error:](HMCContext, "findCharacteristicBulletinRegistrationWithModelID:error:", a3, 0);
}

+ (id)findCharacteristicBulletinRegistrationWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findCharacteristicBulletinRegistrationWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findCharacteristicBulletinRegistrationWithModelID_error___hmf_once_t0, &__block_literal_global_217695);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findCharacteristicBulletinRegistrationWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25589B890, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __109__HMCContext_MKFCharacteristicBulletinRegistration__findCharacteristicBulletinRegistrationWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findCharacteristicBulletinRegistrationWithModelID_error___hmf_once_v1;
  findCharacteristicBulletinRegistrationWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findFloatCharacteristicWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25589BD50, a3, 0);
}

+ (id)findFloatCharacteristicWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_25589BD50, a3, a4);
}

+ (id)findFloatCharacteristicWithInstanceID:(id)a3 service:(id)a4
{
  return +[HMCContext findFloatCharacteristicWithInstanceID:service:error:](HMCContext, "findFloatCharacteristicWithInstanceID:service:error:", a3, a4, 0);
}

+ (id)findFloatCharacteristicWithInstanceID:(id)a3 service:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = findFloatCharacteristicWithInstanceID_service_error___hmf_once_t0;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&findFloatCharacteristicWithInstanceID_service_error___hmf_once_t0, &__block_literal_global_218445);
  v15[0] = CFSTR("PRIMARYKEY");
  v15[1] = CFSTR("SECONDARYKEY");
  v16[0] = v9;
  v16[1] = v8;
  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = (id)findFloatCharacteristicWithInstanceID_service_error___hmf_once_v1;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_25589BD50, v11, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)findFloatCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4
{
  return +[HMCContext findFloatCharacteristicWithInstanceID:serviceDatabaseID:error:](HMCContext, "findFloatCharacteristicWithInstanceID:serviceDatabaseID:error:", a3, a4, 0);
}

+ (id)findFloatCharacteristicWithInstanceID:(id)a3 serviceDatabaseID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = findFloatCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t2;
  v8 = a4;
  v9 = a3;
  if (v7 != -1)
    dispatch_once(&findFloatCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_t2, &__block_literal_global_304_218438);
  v10 = (id)findFloatCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3;
  objc_msgSend(v8, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("OBJECTID");
  v15[1] = CFSTR("SECONDARYKEY");
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:parentObjectID:template:substitutions:error:](HMCContext, "findModelObjectOfType:parentObjectID:template:substitutions:error:", &unk_25589BD50, v11, v10, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __100__HMCContext_MKFFloatCharacteristic__findFloatCharacteristicWithInstanceID_serviceDatabaseID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("service = $PARENT AND instanceID = $SECONDARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findFloatCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3;
  findFloatCharacteristicWithInstanceID_serviceDatabaseID_error___hmf_once_v3 = v0;

}

void __90__HMCContext_MKFFloatCharacteristic__findFloatCharacteristicWithInstanceID_service_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("instanceID = $PRIMARYKEY AND service = $SECONDARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findFloatCharacteristicWithInstanceID_service_error___hmf_once_v1;
  findFloatCharacteristicWithInstanceID_service_error___hmf_once_v1 = v0;

}

+ (id)findRemovedUserAccessCodeWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558B19C0, a3, 0);
}

+ (id)findRemovedUserAccessCodeWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558B19C0, a3, a4);
}

+ (id)findRemovedUserAccessCodeWithModelID:(id)a3
{
  return +[HMCContext findRemovedUserAccessCodeWithModelID:error:](HMCContext, "findRemovedUserAccessCodeWithModelID:error:", a3, 0);
}

+ (id)findRemovedUserAccessCodeWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findRemovedUserAccessCodeWithModelID_error___hmf_once_t2;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findRemovedUserAccessCodeWithModelID_error___hmf_once_t2, &__block_literal_global_280);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findRemovedUserAccessCodeWithModelID_error___hmf_once_v3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558B19C0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __83__HMCContext_MKFRemovedUserAccessCode__findRemovedUserAccessCodeWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findRemovedUserAccessCodeWithModelID_error___hmf_once_v3;
  findRemovedUserAccessCodeWithModelID_error___hmf_once_v3 = v0;

}

+ (id)findHomeSoftwareUpdateSettingWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558B6EC0, a3, 0);
}

+ (id)findHomeSoftwareUpdateSettingWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558B6EC0, a3, a4);
}

+ (id)findHomeSoftwareUpdateSettingWithModelID:(id)a3
{
  return +[HMCContext findHomeSoftwareUpdateSettingWithModelID:error:](HMCContext, "findHomeSoftwareUpdateSettingWithModelID:error:", a3, 0);
}

+ (id)findHomeSoftwareUpdateSettingWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findHomeSoftwareUpdateSettingWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findHomeSoftwareUpdateSettingWithModelID_error___hmf_once_t0, &__block_literal_global_240322);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findHomeSoftwareUpdateSettingWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558B6EC0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __91__HMCContext_MKFHomeSoftwareUpdateSetting__findHomeSoftwareUpdateSettingWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findHomeSoftwareUpdateSettingWithModelID_error___hmf_once_v1;
  findHomeSoftwareUpdateSettingWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findCharacteristicEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255808030, a3, 0);
}

+ (id)findCharacteristicEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_255808030, a3, a4);
}

+ (id)findCharacteristicEventWithModelID:(id)a3
{
  return +[HMCContext findCharacteristicEventWithModelID:error:](HMCContext, "findCharacteristicEventWithModelID:error:", a3, 0);
}

+ (id)findCharacteristicEventWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findCharacteristicEventWithModelID_error___hmf_once_t1;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findCharacteristicEventWithModelID_error___hmf_once_t1, &__block_literal_global_242844);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findCharacteristicEventWithModelID_error___hmf_once_v2;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_255808030, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __79__HMCContext_MKFCharacteristicEvent__findCharacteristicEventWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findCharacteristicEventWithModelID_error___hmf_once_v2;
  findCharacteristicEventWithModelID_error___hmf_once_v2 = v0;

}

+ (id)findNotificationRegistrationActionSetWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558B8DF0, a3, 0);
}

+ (id)findNotificationRegistrationActionSetWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558B8DF0, a3, a4);
}

+ (id)findNotificationRegistrationActionSetWithModelID:(id)a3
{
  return +[HMCContext findNotificationRegistrationActionSetWithModelID:error:](HMCContext, "findNotificationRegistrationActionSetWithModelID:error:", a3, 0);
}

+ (id)findNotificationRegistrationActionSetWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findNotificationRegistrationActionSetWithModelID_error___hmf_once_t1;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findNotificationRegistrationActionSetWithModelID_error___hmf_once_t1, &__block_literal_global_243469);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findNotificationRegistrationActionSetWithModelID_error___hmf_once_v2;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558B8DF0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __107__HMCContext_MKFNotificationRegistrationActionSet__findNotificationRegistrationActionSetWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findNotificationRegistrationActionSetWithModelID_error___hmf_once_v2;
  findNotificationRegistrationActionSetWithModelID_error___hmf_once_v2 = v0;

}

+ (id)findCharacteristicRangeEventWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558BABE8, a3, 0);
}

+ (id)findCharacteristicRangeEventWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558BABE8, a3, a4);
}

+ (id)findCharacteristicRangeEventWithModelID:(id)a3
{
  return +[HMCContext findCharacteristicRangeEventWithModelID:error:](HMCContext, "findCharacteristicRangeEventWithModelID:error:", a3, 0);
}

+ (id)findCharacteristicRangeEventWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findCharacteristicRangeEventWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findCharacteristicRangeEventWithModelID_error___hmf_once_t0, &__block_literal_global_245362);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findCharacteristicRangeEventWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558BABE8, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __89__HMCContext_MKFCharacteristicRangeEvent__findCharacteristicRangeEventWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findCharacteristicRangeEventWithModelID_error___hmf_once_v1;
  findCharacteristicRangeEventWithModelID_error___hmf_once_v1 = v0;

}

+ (id)findWeekDayScheduleRuleWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558BCAD0, a3, 0);
}

+ (id)findWeekDayScheduleRuleWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558BCAD0, a3, a4);
}

+ (id)findWeekDayScheduleRuleWithModelID:(id)a3
{
  return +[HMCContext findWeekDayScheduleRuleWithModelID:error:](HMCContext, "findWeekDayScheduleRuleWithModelID:error:", a3, 0);
}

+ (id)findWeekDayScheduleRuleWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findWeekDayScheduleRuleWithModelID_error___hmf_once_t5;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findWeekDayScheduleRuleWithModelID_error___hmf_once_t5, &__block_literal_global_246363);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findWeekDayScheduleRuleWithModelID_error___hmf_once_v6;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558BCAD0, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __79__HMCContext_MKFWeekDayScheduleRule__findWeekDayScheduleRuleWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findWeekDayScheduleRuleWithModelID_error___hmf_once_v6;
  findWeekDayScheduleRuleWithModelID_error___hmf_once_v6 = v0;

}

+ (id)findNotificationRegistrationCharacteristicWithDatabaseID:(id)a3
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558C5758, a3, 0);
}

+ (id)findNotificationRegistrationCharacteristicWithDatabaseID:(id)a3 error:(id *)a4
{
  return +[HMCContext findModelObjectOfType:databaseID:error:](HMCContext, "findModelObjectOfType:databaseID:error:", &unk_2558C5758, a3, a4);
}

+ (id)findNotificationRegistrationCharacteristicWithModelID:(id)a3
{
  return +[HMCContext findNotificationRegistrationCharacteristicWithModelID:error:](HMCContext, "findNotificationRegistrationCharacteristicWithModelID:error:", a3, 0);
}

+ (id)findNotificationRegistrationCharacteristicWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = findNotificationRegistrationCharacteristicWithModelID_error___hmf_once_t0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&findNotificationRegistrationCharacteristicWithModelID_error___hmf_once_t0, &__block_literal_global_254492);
  v12 = CFSTR("PRIMARYKEY");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = (id)findNotificationRegistrationCharacteristicWithModelID_error___hmf_once_v1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findModelObjectOfType:template:substitutions:error:](HMCContext, "findModelObjectOfType:template:substitutions:error:", &unk_2558C5758, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __117__HMCContext_MKFNotificationRegistrationCharacteristic__findNotificationRegistrationCharacteristicWithModelID_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("modelID = $PRIMARYKEY"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)findNotificationRegistrationCharacteristicWithModelID_error___hmf_once_v1;
  findNotificationRegistrationCharacteristicWithModelID_error___hmf_once_v1 = v0;

}

@end
