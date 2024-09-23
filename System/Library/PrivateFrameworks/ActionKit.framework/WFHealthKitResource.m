@implementation WFHealthKitResource

+ (BOOL)isSingleton
{
  return 1;
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

- (void)refreshAvailability
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(MEMORY[0x24BDD3C40], "isHealthDataAvailable");
  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BEC4638];
    v10[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("This device does not have the Health app."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v10[1] = *MEMORY[0x24BEC4640];
    WFLocalizedString(CFSTR("This shortcut requires the Health app, which this device does not have."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 0, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", v3, v4);

}

@end
