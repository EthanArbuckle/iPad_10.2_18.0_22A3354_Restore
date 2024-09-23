@implementation NNMKAnalytics

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)_instance;
}

void __31__NNMKAnalytics_sharedInstance__block_invoke()
{
  NNMKAnalytics *v0;
  void *v1;

  v0 = objc_alloc_init(NNMKAnalytics);
  v1 = (void *)_instance;
  _instance = (uint64_t)v0;

}

- (void)reportFetch:(unint64_t)a3 inMode:(unint64_t)a4 accountType:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;
  unint64_t v13;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__NNMKAnalytics_reportFetch_inMode_accountType___block_invoke;
  v10[3] = &unk_24F9F5DA0;
  v12 = a3;
  v13 = a4;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.fetch"), v10);

}

id __48__NNMKAnalytics_reportFetch_inMode_accountType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("type");
  objc_msgSend(*(id *)(a1 + 32), "stringForFetchType:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("mode");
  objc_msgSend(*(id *)(a1 + 32), "stringForDeviceMode:", *(_QWORD *)(a1 + 56));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v8[2] = CFSTR("accountType");
  v5 = *(const __CFString **)(a1 + 40);
  if (!v5)
    v5 = CFSTR("unknown");
  v9[1] = v3;
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reportFailedFetchWithType:(unint64_t)a3 inMode:(unint64_t)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__NNMKAnalytics_reportFailedFetchWithType_inMode___block_invoke;
  v4[3] = &unk_24F9F5DC8;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.fetch.failure"), v4);
}

id __50__NNMKAnalytics_reportFailedFetchWithType_inMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("type");
  objc_msgSend(*(id *)(a1 + 32), "stringForFetchType:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("mode");
  v7[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "stringForDeviceMode:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reportMessageReceivedWithId:(id)a3 willGenerateNotification:(BOOL)a4 fullSyncVersion:(unint64_t)a5 dateSynced:(id)a6
{
  id v10;
  int64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  unint64_t v16;
  BOOL v17;

  v10 = a3;
  v11 = -[NNMKAnalytics _delayInMSFromDate:](self, "_delayInMSFromDate:", a6);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __97__NNMKAnalytics_reportMessageReceivedWithId_willGenerateNotification_fullSyncVersion_dateSynced___block_invoke;
  v13[3] = &unk_24F9F5DF0;
  v14 = v10;
  v15 = v11;
  v17 = a4;
  v16 = a5;
  v12 = v10;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.messageReceived"), v13);

}

id __97__NNMKAnalytics_reportMessageReceivedWithId_willGenerateNotification_fullSyncVersion_dateSynced___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("delay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v9[0] = v2;
  v9[1] = v3;
  v8[1] = CFSTR("messageId");
  v8[2] = CFSTR("willGenerateNotification");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("fullSyncVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reportMoreMessagesReceivedConversationSpecific:(BOOL)a3 fullSyncVersion:(unint64_t)a4 dateSynced:(id)a5
{
  int64_t v8;
  _QWORD v9[6];
  BOOL v10;

  v8 = -[NNMKAnalytics _delayInMSFromDate:](self, "_delayInMSFromDate:", a5);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __91__NNMKAnalytics_reportMoreMessagesReceivedConversationSpecific_fullSyncVersion_dateSynced___block_invoke;
  v9[3] = &__block_descriptor_49_e19___NSDictionary_8__0l;
  v10 = a3;
  v9[4] = v8;
  v9[5] = a4;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.moreMessagesReceived"), v9);
}

id __91__NNMKAnalytics_reportMoreMessagesReceivedConversationSpecific_fullSyncVersion_dateSynced___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("forConversation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("delay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("fullSyncVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)reportMessageUpdateReceivedForMessageWithId:(id)a3 fullSyncVersion:(unint64_t)a4 dateSynced:(id)a5
{
  id v8;
  int64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;
  unint64_t v14;

  v8 = a3;
  v9 = -[NNMKAnalytics _delayInMSFromDate:](self, "_delayInMSFromDate:", a5);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__NNMKAnalytics_reportMessageUpdateReceivedForMessageWithId_fullSyncVersion_dateSynced___block_invoke;
  v11[3] = &unk_24F9F5DC8;
  v12 = v8;
  v13 = v9;
  v14 = a4;
  v10 = v8;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.messageUpdated"), v11);

}

id __88__NNMKAnalytics_reportMessageUpdateReceivedForMessageWithId_fullSyncVersion_dateSynced___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("delay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = CFSTR("messageId");
  v7[2] = CFSTR("fullSyncVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)reportMessageDeletionReceivedForMessageWithId:(id)a3 fullSyncVersion:(unint64_t)a4 dateSynced:(id)a5
{
  id v8;
  int64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;
  unint64_t v14;

  v8 = a3;
  v9 = -[NNMKAnalytics _delayInMSFromDate:](self, "_delayInMSFromDate:", a5);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __90__NNMKAnalytics_reportMessageDeletionReceivedForMessageWithId_fullSyncVersion_dateSynced___block_invoke;
  v11[3] = &unk_24F9F5DC8;
  v12 = v8;
  v13 = v9;
  v14 = a4;
  v10 = v8;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.messageDeleted"), v11);

}

id __90__NNMKAnalytics_reportMessageDeletionReceivedForMessageWithId_fullSyncVersion_dateSynced___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("delay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = CFSTR("messageId");
  v7[2] = CFSTR("fullSyncVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)reportOpenedMailboxWithFilter:(id)a3 mailboxType:(unint64_t)a4 accountType:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  NNMKAnalytics *v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__NNMKAnalytics_reportOpenedMailboxWithFilter_mailboxType_accountType___block_invoke;
  v12[3] = &unk_24F9F5E38;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v16 = a4;
  v10 = v9;
  v11 = v8;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.Mailbox.Displayed"), v12);

}

id __71__NNMKAnalytics_reportOpenedMailboxWithFilter_mailboxType_accountType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "mailboxIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("size"));

  objc_msgSend(*(id *)(a1 + 32), "mailboxIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
    objc_msgSend(*(id *)(a1 + 40), "stringForMailboxFilterType:", objc_msgSend(*(id *)(a1 + 32), "mailboxType"));
  else
    objc_msgSend(*(id *)(a1 + 40), "stringForMailboxType:", *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("type"));

  if (objc_msgSend(*(id *)(a1 + 48), "length"))
  {
    if (*(_QWORD *)(a1 + 48))
      v8 = *(const __CFString **)(a1 + 48);
    else
      v8 = CFSTR("unknown");
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("accountType"));
  }
  return v2;
}

- (void)reportThreadViewedWithMessageCount:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__NNMKAnalytics_reportThreadViewedWithMessageCount___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.Thread.Displayed"), v3);
}

id __52__NNMKAnalytics_reportThreadViewedWithMessageCount___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("size");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportOriginalMessageContentSizeInBytes:(unint64_t)a3 source:(unint64_t)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__NNMKAnalytics_reportOriginalMessageContentSizeInBytes_source___block_invoke;
  v4[3] = &unk_24F9F5DC8;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.addedContent"), v4);
}

id __64__NNMKAnalytics_reportOriginalMessageContentSizeInBytes_source___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("size");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)*(unint64_t *)(a1 + 40) / 1000.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("source");
  v7[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "stringForDeviceSource:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reportContentSyncedForMessageWithId:(id)a3 textSizeInBytes:(unint64_t)a4 htmlSizeInBytes:(unint64_t)a5 fullSyncVersion:(unint64_t)a6 dateSynced:(id)a7
{
  id v12;
  int64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;

  v12 = a3;
  v13 = -[NNMKAnalytics _delayInMSFromDate:](self, "_delayInMSFromDate:", a7);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __112__NNMKAnalytics_reportContentSyncedForMessageWithId_textSizeInBytes_htmlSizeInBytes_fullSyncVersion_dateSynced___block_invoke;
  v15[3] = &unk_24F9F5E80;
  v18 = a5;
  v19 = v13;
  v16 = v12;
  v17 = a4;
  v20 = a6;
  v14 = v12;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.contentReceived"), v15);

}

id __112__NNMKAnalytics_reportContentSyncedForMessageWithId_textSizeInBytes_htmlSizeInBytes_fullSyncVersion_dateSynced___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("textSize");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)a1[5] / 1000.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("htmlSize");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)a1[6] / 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("delay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a1[7]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[4];
  v10[2] = v4;
  v10[3] = v5;
  v9[3] = CFSTR("messageId");
  v9[4] = CFSTR("fullSyncVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)reportContentDownloadedForMessageWithId:(id)a3 textSizeInBytes:(unint64_t)a4 htmlSizeInBytes:(unint64_t)a5 startTime:(id)a6
{
  id v10;
  int64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;

  v10 = a3;
  v11 = -[NNMKAnalytics _delayInMSFromDate:](self, "_delayInMSFromDate:", a6);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __99__NNMKAnalytics_reportContentDownloadedForMessageWithId_textSizeInBytes_htmlSizeInBytes_startTime___block_invoke;
  v13[3] = &unk_24F9F5EA8;
  v16 = a5;
  v17 = v11;
  v14 = v10;
  v15 = a4;
  v12 = v10;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.contentDownloaded"), v13);

}

id __99__NNMKAnalytics_reportContentDownloadedForMessageWithId_textSizeInBytes_htmlSizeInBytes_startTime___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("textSize");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)a1[5] / 1000.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("htmlSize");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)a1[6] / 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a1[7]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = CFSTR("messageId");
  v5 = a1[4];
  v9[2] = v4;
  v9[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reportContentDownloadFailedInMode:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__NNMKAnalytics_reportContentDownloadFailedInMode___block_invoke;
  v3[3] = &unk_24F9F5ED0;
  v3[4] = self;
  v3[5] = a3;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.contentDownload.failure"), v3);
}

id __51__NNMKAnalytics_reportContentDownloadFailedInMode___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("mode");
  objc_msgSend(*(id *)(a1 + 32), "stringForDeviceMode:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportAttachmentDataReceivedWithType:(unint64_t)a3 sizeInBytes:(unint64_t)a4 mode:(unint64_t)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__NNMKAnalytics_reportAttachmentDataReceivedWithType_sizeInBytes_mode___block_invoke;
  v5[3] = &unk_24F9F5EA8;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a3;
  v5[7] = a5;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.attachmentReceived"), v5);
}

id __71__NNMKAnalytics_reportAttachmentDataReceivedWithType_sizeInBytes_mode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)*(unint64_t *)(a1 + 40) / 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("size"));

  objc_msgSend(*(id *)(a1 + 32), "stringForAttachmentType:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  objc_msgSend(*(id *)(a1 + 32), "stringForDeviceMode:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("mode"));

  return v2;
}

- (void)reportAttachmentDisplayedWithType:(unint64_t)a3 actionable:(BOOL)a4 source:(unint64_t)a5
{
  _QWORD v5[7];
  BOOL v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__NNMKAnalytics_reportAttachmentDisplayedWithType_actionable_source___block_invoke;
  v5[3] = &unk_24F9F5DF0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a5;
  v6 = a4;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.attachmentDisplayed"), v5);
}

id __69__NNMKAnalytics_reportAttachmentDisplayedWithType_actionable_source___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  objc_msgSend(*(id *)(a1 + 32), "stringForAttachmentType:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("type"));

  objc_msgSend(*(id *)(a1 + 32), "stringForSource:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("source"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("actionable"));

  return v2;
}

- (void)reportAttachmentTappedWithType:(unint64_t)a3 actionable:(BOOL)a4 source:(unint64_t)a5
{
  _QWORD v5[7];
  BOOL v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__NNMKAnalytics_reportAttachmentTappedWithType_actionable_source___block_invoke;
  v5[3] = &unk_24F9F5DF0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a5;
  v6 = a4;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.attachmentTapped"), v5);
}

id __66__NNMKAnalytics_reportAttachmentTappedWithType_actionable_source___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  objc_msgSend(*(id *)(a1 + 32), "stringForAttachmentType:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("type"));

  objc_msgSend(*(id *)(a1 + 32), "stringForSource:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("source"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("actionable"));

  return v2;
}

- (void)reportAttachmentDownloadFailedInMode:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__NNMKAnalytics_reportAttachmentDownloadFailedInMode___block_invoke;
  v3[3] = &unk_24F9F5ED0;
  v3[4] = self;
  v3[5] = a3;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.attachmentDownload.failure"), v3);
}

id __54__NNMKAnalytics_reportAttachmentDownloadFailedInMode___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("mode");
  objc_msgSend(*(id *)(a1 + 32), "stringForDeviceMode:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportReachedActionButtonsWithSource:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__NNMKAnalytics_reportReachedActionButtonsWithSource___block_invoke;
  v3[3] = &unk_24F9F5ED0;
  v3[4] = self;
  v3[5] = a3;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.action.reached"), v3);
}

id __54__NNMKAnalytics_reportReachedActionButtonsWithSource___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("source");
  objc_msgSend(*(id *)(a1 + 32), "stringForSource:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportAppLaunched
{
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.app.launched"), &__block_literal_global_175);
}

uint64_t __34__NNMKAnalytics_reportAppLaunched__block_invoke()
{
  return 0;
}

- (void)reportAppResumed
{
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.app.resumed"), &__block_literal_global_176);
}

uint64_t __33__NNMKAnalytics_reportAppResumed__block_invoke()
{
  return 0;
}

- (void)reportAppBackgroundRefreshed
{
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.app.backgroundRefreshed"), &__block_literal_global_177);
}

uint64_t __45__NNMKAnalytics_reportAppBackgroundRefreshed__block_invoke()
{
  return 0;
}

- (void)reportNotificationReceivedInMode:(unint64_t)a3 accountType:(id)a4
{
  -[NNMKAnalytics reportNotificationReceivedInMode:isPCC:accountType:](self, "reportNotificationReceivedInMode:isPCC:accountType:", a3, 0, a4);
}

- (void)reportNotificationReceivedInMode:(unint64_t)a3 isPCC:(BOOL)a4 accountType:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;
  BOOL v13;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__NNMKAnalytics_reportNotificationReceivedInMode_isPCC_accountType___block_invoke;
  v10[3] = &unk_24F9F5F78;
  v11 = v8;
  v12 = a3;
  v13 = a4;
  v10[4] = self;
  v9 = v8;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.notification.received"), v10);

}

id __68__NNMKAnalytics_reportNotificationReceivedInMode_isPCC_accountType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("mode");
  objc_msgSend(*(id *)(a1 + 32), "stringForDeviceMode:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("pccNotification");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v8[2] = CFSTR("accountType");
  v5 = *(const __CFString **)(a1 + 40);
  if (!v5)
    v5 = CFSTR("unknown");
  v9[1] = v3;
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reportRenderedNotificationUsingLocalContent:(BOOL)a3 mailboxSynced:(BOOL)a4 messageSynced:(BOOL)a5 contentDownloaded:(BOOL)a6
{
  const __CFString *v6;
  _QWORD v7[4];
  __CFString *v8;

  v6 = CFSTR("forwardedContentNotDownloadedByCompanion");
  if (a6)
    v6 = CFSTR("forwardedContentNotSynced");
  if (!a5)
    v6 = CFSTR("forwardedMessageAndContent");
  if (!a4)
    v6 = CFSTR("mailboxNotSynced");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __107__NNMKAnalytics_reportRenderedNotificationUsingLocalContent_mailboxSynced_messageSynced_contentDownloaded___block_invoke;
  v7[3] = &unk_24F9F5FA0;
  if (a3)
    v6 = CFSTR("realContent");
  v8 = (__CFString *)v6;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.notificationRendered"), v7);

}

id __107__NNMKAnalytics_reportRenderedNotificationUsingLocalContent_mailboxSynced_messageSynced_contentDownloaded___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("type");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportSubscribedToNotificationForAccountType:(id)a3 isPCC:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__NNMKAnalytics_reportSubscribedToNotificationForAccountType_isPCC___block_invoke;
  v8[3] = &unk_24F9F5FC8;
  v10 = a4;
  v9 = v6;
  v7 = v6;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.notification.subscribed"), v8);

}

id __68__NNMKAnalytics_reportSubscribedToNotificationForAccountType_isPCC___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("pccNotification");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("accountType");
  v7[0] = v2;
  v3 = *(const __CFString **)(a1 + 32);
  if (!v3)
    v3 = CFSTR("unknown");
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reportFullSyncRequestedFromDevice:(unint64_t)a3 corruptionDetected:(BOOL)a4 migrationRelated:(BOOL)a5 idsFailureRelated:(BOOL)a6 fullSyncVersionMatchRelated:(BOOL)a7
{
  const __CFString *v7;
  _QWORD v8[4];
  __CFString *v9;
  NNMKAnalytics *v10;
  unint64_t v11;

  v7 = CFSTR("none");
  if (a7)
    v7 = CFSTR("versionMatch");
  if (a6)
    v7 = CFSTR("IDSFailure");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __133__NNMKAnalytics_reportFullSyncRequestedFromDevice_corruptionDetected_migrationRelated_idsFailureRelated_fullSyncVersionMatchRelated___block_invoke;
  v8[3] = &unk_24F9F5FF0;
  if (a5)
    v7 = CFSTR("migration");
  if (a4)
    v7 = CFSTR("corruption");
  v9 = (__CFString *)v7;
  v10 = self;
  v11 = a3;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.fullSync"), v8);

}

id __133__NNMKAnalytics_reportFullSyncRequestedFromDevice_corruptionDetected_migrationRelated_idsFailureRelated_fullSyncVersionMatchRelated___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  v1 = (void *)a1[5];
  v6[0] = CFSTR("reason");
  v6[1] = CFSTR("source");
  v7[0] = v2;
  objc_msgSend(v1, "stringForDeviceSource:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reportHaltSyncRequestedFromSource:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__NNMKAnalytics_reportHaltSyncRequestedFromSource___block_invoke;
  v3[3] = &unk_24F9F5ED0;
  v3[4] = self;
  v3[5] = a3;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.haltSyncRequested"), v3);
}

id __51__NNMKAnalytics_reportHaltSyncRequestedFromSource___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("source");
  objc_msgSend(*(id *)(a1 + 32), "stringForDeviceSource:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportContentDisplayedForMessageWithId:(id)a3 hasMainAlternative:(BOOL)a4 hasTextAlternative:(BOOL)a5
{
  _QWORD v5[4];
  BOOL v6;
  BOOL v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __94__NNMKAnalytics_reportContentDisplayedForMessageWithId_hasMainAlternative_hasTextAlternative___block_invoke;
  v5[3] = &__block_descriptor_34_e19___NSDictionary_8__0l;
  v6 = a4;
  v7 = a5;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.Content.Text.Rendered"), v5);
}

id __94__NNMKAnalytics_reportContentDisplayedForMessageWithId_hasMainAlternative_hasTextAlternative___block_invoke(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 32))
  {
    v1 = CFSTR("main");
  }
  else if (*(_BYTE *)(a1 + 33))
  {
    v1 = CFSTR("text");
  }
  else
  {
    v1 = CFSTR("none");
  }
  v3 = CFSTR("alternativeType");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportDisplayingMessageWithType:(unint64_t)a3 isNotification:(BOOL)a4
{
  _QWORD v4[6];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__NNMKAnalytics_reportDisplayingMessageWithType_isNotification___block_invoke;
  v4[3] = &unk_24F9F6038;
  v4[4] = self;
  v4[5] = a3;
  v5 = a4;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.Content.Displayed"), v4);
}

id __64__NNMKAnalytics_reportDisplayingMessageWithType_isNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("type");
  objc_msgSend(*(id *)(a1 + 32), "stringForMessageType:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("source");
  v7[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "stringForSource:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reportWebKitRenderingProcessCrash
{
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.WebView.RenderingProcess.Crash"), &__block_literal_global_179);
}

uint64_t __50__NNMKAnalytics_reportWebKitRenderingProcessCrash__block_invoke()
{
  return 0;
}

- (void)reportMailboxSelectionChanged:(id)a3 source:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__NNMKAnalytics_reportMailboxSelectionChanged_source___block_invoke;
  v8[3] = &unk_24F9F5FF0;
  v9 = v6;
  v10 = a4;
  v8[4] = self;
  v7 = v6;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.mailboxSelectionChanged"), v8);

}

id __54__NNMKAnalytics_reportMailboxSelectionChanged_source___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCED8]);
  v32[0] = CFSTR("source");
  objc_msgSend(*(id *)(a1 + 32), "stringForDeviceSource:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = CFSTR("mailboxCount");
  v33[0] = v3;
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 40), "allMailboxesSyncEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithDictionary:", v7);

  objc_msgSend(*(id *)(a1 + 40), "aggregatedMailboxes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("allInboxes"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("vip"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 4));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("flagged"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("unread"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 16));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("toOrCC"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 32));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("importantThreads"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMailboxFilterEnabled:", 64));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("today"));

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "mailboxesWithAllMessagesSyncEnabled", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(a1 + 32), "stringForMailboxType:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22), "type"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v24, "intValue") - 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v20);
    }

  }
  return v8;
}

- (void)reportAction:(unint64_t)a3 source:(unint64_t)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__NNMKAnalytics_reportAction_source___block_invoke;
  v4[3] = &unk_24F9F5DC8;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.action"), v4);
}

id __37__NNMKAnalytics_reportAction_source___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("type");
  objc_msgSend(*(id *)(a1 + 32), "stringForAction:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("source");
  v7[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "stringForSource:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reportCellRighSwipeActionChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__NNMKAnalytics_reportCellRighSwipeActionChanged___block_invoke;
  v6[3] = &unk_24F9F5FA0;
  v7 = v4;
  v5 = v4;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.cellSwipe.changed"), v6);

}

id __50__NNMKAnalytics_reportCellRighSwipeActionChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = CFSTR("type");
  v3[1] = CFSTR("side");
  v4[0] = v1;
  v4[1] = CFSTR("right");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportWebKitLinkTapped
{
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.WebView.Interaction.Link"), &__block_literal_global_182);
}

uint64_t __39__NNMKAnalytics_reportWebKitLinkTapped__block_invoke()
{
  return 0;
}

- (void)reportMessageSentFrom:(int64_t)a3 sendingType:(unint64_t)a4 attachmentCount:(unint64_t)a5 sizeInBytes:(unint64_t)a6
{
  _QWORD v6[9];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__NNMKAnalytics_reportMessageSentFrom_sendingType_attachmentCount_sizeInBytes___block_invoke;
  v6[3] = &unk_24F9F5E80;
  v6[4] = self;
  v6[5] = a4;
  v6[6] = a6;
  v6[7] = a3;
  v6[8] = a5;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.composedMessage"), v6);
}

id __79__NNMKAnalytics_reportMessageSentFrom_sendingType_attachmentCount_sizeInBytes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("type");
  objc_msgSend(*(id *)(a1 + 32), "stringForSendingType:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("size");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)*(unint64_t *)(a1 + 48) / 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("source");
  objc_msgSend(*(id *)(a1 + 32), "stringForCompositionSource:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("includesAttachments");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)(a1 + 64) != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reportMessageDeliveryFailedInMode:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__NNMKAnalytics_reportMessageDeliveryFailedInMode___block_invoke;
  v3[3] = &unk_24F9F5ED0;
  v3[4] = self;
  v3[5] = a3;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.composedMessage.failure"), v3);
}

id __51__NNMKAnalytics_reportMessageDeliveryFailedInMode___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("mode");
  objc_msgSend(*(id *)(a1 + 32), "stringForDeviceMode:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportMessageDeliveryDurationWithStartDate:(id)a3 inMode:(unint64_t)a4
{
  int64_t v6;
  _QWORD v7[7];

  v6 = -[NNMKAnalytics _delayInMSFromDate:](self, "_delayInMSFromDate:", a3);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__NNMKAnalytics_reportMessageDeliveryDurationWithStartDate_inMode___block_invoke;
  v7[3] = &unk_24F9F5DC8;
  v7[4] = self;
  v7[5] = v6;
  v7[6] = a4;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.messageDelivery.duration"), v7);
}

id __67__NNMKAnalytics_reportMessageDeliveryDurationWithStartDate_inMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("mode");
  v7[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "stringForDeviceMode:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reportCannedReplyUsed:(id)a3 sendingType:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__NNMKAnalytics_reportCannedReplyUsed_sendingType___block_invoke;
  v8[3] = &unk_24F9F5FF0;
  v9 = v6;
  v10 = a4;
  v8[4] = self;
  v7 = v6;
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.composedMessage.cannedReply"), v8);

}

id __51__NNMKAnalytics_reportCannedReplyUsed_sendingType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("type");
  objc_msgSend(*(id *)(a1 + 32), "stringForSendingType:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("value");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)reportCredentialsExpired
{
  -[NNMKAnalytics NNMKSendEventLazyWithKey:metadataBuilder:](self, "NNMKSendEventLazyWithKey:metadataBuilder:", CFSTR("com.apple.NanoMail.standalone.credentialsExpired"), &__block_literal_global_183);
}

uint64_t __41__NNMKAnalytics_reportCredentialsExpired__block_invoke()
{
  return 0;
}

+ (BOOL)_reportingEnabled
{
  return 1;
}

- (void)NNMKSendEventLazyWithKey:(id)a3 metadataBuilder:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

uint64_t __58__NNMKAnalytics_NNMKSendEventLazyWithKey_metadataBuilder___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)_delayInMSFromDate:(id)a3
{
  double v3;
  double v4;

  objc_msgSend(a3, "timeIntervalSinceNow");
  v4 = v3 * -1000.0;
  if ((unint64_t)(uint64_t)v4 <= 0xEA60)
    return (uint64_t)v4;
  else
    return 0;
}

- (id)stringForAction:(unint64_t)a3
{
  if (a3 - 1 > 0xA)
    return CFSTR("read");
  else
    return off_24F9F60E0[a3 - 1];
}

- (id)stringForDeviceSource:(unint64_t)a3
{
  if (a3)
    return CFSTR("watch");
  else
    return CFSTR("phone");
}

- (id)stringForSource:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("messageView");
  if (a3 == 1)
    v3 = CFSTR("notification");
  if (a3 == 2)
    return CFSTR("swipeAction");
  else
    return (id)v3;
}

- (id)stringForMailboxType:(unint64_t)a3
{
  if (a3 - 1 > 8)
    return CFSTR("none");
  else
    return off_24F9F6138[a3 - 1];
}

- (id)stringForMailboxFilterType:(unint64_t)a3
{
  id result;
  const __CFString *v4;
  const __CFString *v5;

  result = CFSTR("unknown");
  if ((uint64_t)a3 > 15)
  {
    v4 = CFSTR("importantThreads");
    v5 = CFSTR("today");
    if (a3 != 64)
      v5 = CFSTR("unknown");
    if (a3 != 32)
      v4 = v5;
    if (a3 == 16)
      return CFSTR("toOrCC");
    else
      return (id)v4;
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        result = CFSTR("allInboxes");
        break;
      case 2uLL:
        result = CFSTR("vip");
        break;
      case 4uLL:
        result = CFSTR("flagged");
        break;
      case 8uLL:
        result = CFSTR("unread");
        break;
      default:
        return result;
    }
  }
  return result;
}

- (id)stringForSendingType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("reply");
  if (a3 == 1)
    v3 = CFSTR("compose");
  if (a3 == 4)
    return CFSTR("forward");
  else
    return (id)v3;
}

- (id)stringForDeviceMode:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("sync");
  if (a3 == 1)
    v3 = CFSTR("standalone");
  if (a3 == 2)
    return CFSTR("cloud");
  else
    return (id)v3;
}

- (id)stringForFetchType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("manual");
  if (a3 == 1)
    v3 = CFSTR("resume");
  if (a3 == 2)
    return CFSTR("older");
  else
    return (id)v3;
}

- (id)stringForMessageType:(unint64_t)a3
{
  if (a3)
    return CFSTR("html");
  else
    return CFSTR("text");
}

- (id)stringForAttachmentType:(unint64_t)a3
{
  if (a3 - 1 > 0x16)
    return CFSTR("unknown");
  else
    return off_24F9F6180[a3 - 1];
}

- (id)stringForCompositionSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return CFSTR("nanoMail");
  else
    return off_24F9F6238[a3 - 1];
}

@end
