@implementation BCLogger

- (void)mt_log_icloud_messages_apps_businessframework:(id)a3 version:(int64_t)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __66__BCLogger_mt_log_icloud_messages_apps_businessframework_version___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v6[0] = CFSTR("messageType");
  v6[1] = CFSTR("payloadVersion");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)logEventWithName:(id)a3 businessURI:(id)a4 callToActionText:(id)a5 bizItemReturnedAfterAction:(BOOL)a6 latency:(int64_t)a7
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
  {
    v12 = v10;
    v13 = v11;
    AnalyticsSendEventLazy();

  }
}

id __93__BCLogger_logEventWithName_businessURI_callToActionText_bizItemReturnedAfterAction_latency___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("bizIdCallToAction");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("chatSuggestLatencyInMiliSeconds");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("bizItemReturnedAfterAction");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)logEventWithName:(id)a3 version:(int64_t)a4 authDomain:(id)a5 status:(id)a6
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v10 = a6;
  v8 = v7;
  v9 = v10;
  AnalyticsSendEventLazy();

}

id __55__BCLogger_logEventWithName_version_authDomain_status___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = a1[4];
  v6[0] = CFSTR("authStatus");
  v6[1] = CFSTR("payloadVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = CFSTR("authProvider");
  v3 = a1[5];
  v7[1] = v2;
  v7[2] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
