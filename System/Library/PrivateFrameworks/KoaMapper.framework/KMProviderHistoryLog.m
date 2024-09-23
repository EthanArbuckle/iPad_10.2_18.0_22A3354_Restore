@implementation KMProviderHistoryLog

- (KMProviderHistoryLog)initWithDirectory:(id)a3 originAppId:(id)a4
{
  id v6;
  id v7;
  KMProviderHistoryLog *v8;
  NSObject *v9;
  KMProviderHistoryLog *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)KMProviderHistoryLog;
  v8 = -[KMProviderHistoryLog init](&v21, sel_init);
  if (v8)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    _sharedQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __54__KMProviderHistoryLog_initWithDirectory_originAppId___block_invoke;
    v12[3] = &unk_24D961280;
    v14 = &v15;
    v13 = v6;
    dispatch_sync(v9, v12);

    objc_storeStrong((id *)&v8->_log, (id)v16[5]);
    if (!v8->_log || (objc_storeStrong((id *)&v8->_originAppId, a4), !v8->_originAppId))
    {

      _Block_object_dispose(&v15, 8);
      v10 = 0;
      goto LABEL_7;
    }
    v8->_donationStartTimeRecorded = 0;

    _Block_object_dispose(&v15, 8);
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)getHistoryToken
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  _sharedQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__KMProviderHistoryLog_getHistoryToken__block_invoke;
  v6[3] = &unk_24D961280;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (unint64_t)getVersion
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  _sharedQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__KMProviderHistoryLog_getVersion__block_invoke;
  v6[3] = &unk_24D961280;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)getDonationStartTime
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  _sharedQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__KMProviderHistoryLog_getDonationStartTime__block_invoke;
  v6[3] = &unk_24D961280;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)recordDonationStartTime
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  _sharedQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__KMProviderHistoryLog_recordDonationStartTime__block_invoke;
  v5[3] = &unk_24D961280;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (id)getDonationEndTime
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  _sharedQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__KMProviderHistoryLog_getDonationEndTime__block_invoke;
  v6[3] = &unk_24D961280;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_recordVersion:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[KVDictionaryLog mutableDictionaryForKey:error:](self->_log, "mutableDictionaryForKey:error:", CFSTR("version"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, self->_originAppId);

  return v5;
}

- (id)_recordHistoryToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[KVDictionaryLog mutableDictionaryForKey:error:](self->_log, "mutableDictionaryForKey:error:", CFSTR("historyToken"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "setObject:forKey:", v4, self->_originAppId);
  else
    objc_msgSend(v5, "removeObjectForKey:", self->_originAppId);

  return v6;
}

- (id)_recordDonationEndTime
{
  void *v3;
  void *v4;

  -[KVDictionaryLog mutableDictionaryForKey:error:](self->_log, "mutableDictionaryForKey:error:", CFSTR("donationEndTime"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_donationStartTimeRecorded)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, self->_originAppId);

  }
  return v3;
}

- (BOOL)recordChangesAcceptedWithVersion:(unint64_t)a3 historyToken:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  _sharedQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__KMProviderHistoryLog_recordChangesAcceptedWithVersion_historyToken___block_invoke;
  v10[3] = &unk_24D9612A8;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a3;
  v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(self) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originAppId, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __70__KMProviderHistoryLog_recordChangesAcceptedWithVersion_historyToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_recordVersion:", *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_recordHistoryToken:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_recordDonationEndTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("version");
  v7[1] = CFSTR("historyToken");
  v7[2] = CFSTR("donationEndTime");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "writeUpdatedObjects:forKeys:error:", v5, v6, 0);

}

void __42__KMProviderHistoryLog_getDonationEndTime__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("donationEndTime"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __47__KMProviderHistoryLog_recordDonationStartTime__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableDictionaryForKey:error:", CFSTR("donationStartTime"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "writeUpdatedObject:forKey:error:", v3, CFSTR("donationStartTime"), 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;

}

void __44__KMProviderHistoryLog_getDonationStartTime__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("donationStartTime"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __34__KMProviderHistoryLog_getVersion__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("version"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "unsignedLongLongValue");

}

void __39__KMProviderHistoryLog_getHistoryToken__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("historyToken"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__KMProviderHistoryLog_initWithDirectory_originAppId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BE5E8C0]), "initWithFilename:directory:readOnly:error:", CFSTR("provider_log"), *(_QWORD *)(a1 + 32), 0, 0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
