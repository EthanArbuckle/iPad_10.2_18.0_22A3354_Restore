@implementation HMDAccessoryFirmwareUpdateSchedulerWingman

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
}

- (id)newBackgroundSchedulerWithIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD1470];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithIdentifier:", v4);

  return v5;
}

- (id)policyForAccessory:(id)a3 sessionState:(unint64_t)a4 workQueue:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v7 = a3;
  v8 = a5;
  if (a4 == 1)
  {
    v10 = 0;
    goto LABEL_5;
  }
  v9 = 0;
  if (a4 == 2)
  {
    v10 = 1;
LABEL_5:
    HMDFirmwareUpdatePolicyForAccessory(v7, v10, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)newInitialDelayTimerWithDelay:(double)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a4, a3);
}

@end
