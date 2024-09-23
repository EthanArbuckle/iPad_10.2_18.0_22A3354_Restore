@implementation MKApplicationAnalytics

- (void)send:(unint64_t)a3 mismatchedApps:(unint64_t)a4
{
  AnalyticsSendEventLazy();
}

id __46__MKApplicationAnalytics_send_mismatchedApps___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("matched_apps");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("mismatched_apps");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
