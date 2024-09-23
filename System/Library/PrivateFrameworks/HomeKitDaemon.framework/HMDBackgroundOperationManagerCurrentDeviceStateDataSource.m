@implementation HMDBackgroundOperationManagerCurrentDeviceStateDataSource

- (id)currentDate
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "now");
}

- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4 label:(id)a5
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a4, a3);
}

@end
