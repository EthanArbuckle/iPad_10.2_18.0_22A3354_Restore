@implementation HMIThermalMonitorService

- (HMIThermalMonitorService)initWithService:(__IOHIDServiceClient *)a3
{
  HMIThermalMonitorService *v4;
  HMIThermalMonitorService *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMIThermalMonitorService;
  v4 = -[HMIThermalMonitorService init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_service = a3;
    CFRetain(a3);
  }
  return v5;
}

- (double)readValue
{
  uint64_t v2;
  const void *v3;
  double v4;
  float v5;

  v2 = IOHIDServiceClientCopyEvent();
  if (!v2)
    return 0.0;
  v3 = (const void *)v2;
  IOHIDEventGetFloatValue();
  v5 = v4;
  CFRelease(v3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_service);
  v3.receiver = self;
  v3.super_class = (Class)HMIThermalMonitorService;
  -[HMIThermalMonitorService dealloc](&v3, sel_dealloc);
}

@end
