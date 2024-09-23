@implementation HMDAccessoryFirmwareUpdateSessionWingman

- (id)newSchedulerWithAccessory:(id)a3 firmwareUpdateSession:(id)a4 workQueue:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDAccessoryFirmwareUpdateScheduler *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDAccessoryFirmwareUpdateScheduler initWithAccessory:firmwareUpdateSession:workQueue:]([HMDAccessoryFirmwareUpdateScheduler alloc], "initWithAccessory:firmwareUpdateSession:workQueue:", v9, v8, v7);

  return v10;
}

- (unint64_t)initialSessionState
{
  return 1;
}

@end
