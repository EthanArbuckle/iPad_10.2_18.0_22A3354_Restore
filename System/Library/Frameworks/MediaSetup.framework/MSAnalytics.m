@implementation MSAnalytics

+ (void)sendSetupEvent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v5 = v3;
  AnalyticsSendEventLazy();

}

uint64_t __30__MSAnalytics_sendSetupEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encoded");
}

+ (void)sendServiceEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "eventType") == 2)
  {
    v16[0] = CFSTR("duration");
    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "stopwatch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "elapsedTimeMS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v16[1] = CFSTR("didSucceed");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "didSucceed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14[0] = CFSTR("service");
    objc_msgSend(v3, "serviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    v14[1] = CFSTR("duration");
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "stopwatch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v7, "elapsedTimeMS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v10;
    v14[2] = CFSTR("didSucceed");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "didSucceed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "eventName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v8;
  AnalyticsSendEventLazy();

}

id __32__MSAnalytics_sendServiceEvent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendServiceRequestLapseEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("service");
  v3 = a3;
  objc_msgSend(v3, "serviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("durationBetweenRequestAndRecordCreation");
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "durationBetweenRequestAndRecordCreation");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("durationBetweenRequestAndReadyToUse");
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "durationBetweenRequestAndReadyToUse");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  AnalyticsSendEventLazy();

}

id __44__MSAnalytics_sendServiceRequestLapseEvent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendRemovalEvent:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("service");
  objc_msgSend(a3, "serviceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  AnalyticsSendEventLazy();

}

id __32__MSAnalytics_sendRemovalEvent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendConfigEvent:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("service");
  objc_msgSend(a3, "serviceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  AnalyticsSendEventLazy();

}

id __31__MSAnalytics_sendConfigEvent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendUserRegisteredNumberOfServices:(int)a3
{
  void *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("numServices");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  AnalyticsSendEventLazy();

}

id __50__MSAnalytics_sendUserRegisteredNumberOfServices___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendPlayIntent:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v3 = a3;
  v16[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleForKey:", CFSTR("cloudMediaServicesPlayBackIntentDate"));
  v6 = v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;

  if (v6 == 0.0)
    v10 = v9;
  else
    v10 = v6;
  v15[0] = CFSTR("secondsSinceLastPlayIntent");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9 - v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("isFromEndpoint");
  v16[0] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDouble:forKey:", CFSTR("cloudMediaServicesPlayBackIntentDate"), v9);

}

+ (void)sendPrimaryUserUpdatedOn:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("automatic");
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a3;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isAutomatic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("isOwner");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "changedToHomeOwner"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("otherAccount");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v4, "changedToUserNotInHome");

  objc_msgSend(v7, "numberWithBool:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

@end
