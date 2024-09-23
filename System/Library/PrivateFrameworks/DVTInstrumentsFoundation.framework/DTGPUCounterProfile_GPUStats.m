@implementation DTGPUCounterProfile_GPUStats

+ (id)create:(id)a3
{
  id v3;
  DTGPUCounterProfile_GPUStats *v4;

  v3 = a3;
  v4 = -[DTGPUCounterProfile_GPUStats initWithProfile:device:]([DTGPUCounterProfile_GPUStats alloc], "initWithProfile:device:", 0, v3);

  return v4;
}

- (DTGPUCounterProfile_GPUStats)initWithProfile:(unint64_t)a3 device:(id)a4
{
  DTGPUCounterProfile_GPUStats *v4;
  DTGPUCounter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DTGPUCounterProfile_GPUStats;
  v4 = -[DTGPUCounterProfile initWithProfile:device:](&v7, sel_initWithProfile_device_, 0, a4);
  if (v4)
  {
    v5 = -[DTGPUCounter initWithName:maxValue:]([DTGPUCounter alloc], "initWithName:maxValue:", CFSTR("Utilization %"), 100);
    -[DTGPUCounter setCounterDescription:](v5, "setCounterDescription:", CFSTR("Device Utilization %"));
    -[DTGPUCounterProfile addCounter:](v4, "addCounter:", v5);
    -[DTGPUCounterProfile setDefaultSampleInterval:](v4, "setDefaultSampleInterval:", 1000000);

  }
  return v4;
}

- (BOOL)start:(unint64_t)a3
{
  self->_currentIORegSamplingInterval = 0;
  self->_deviceUtilization.coefficient = 0.095162582;
  return 1;
}

- (void)sampleCounters:(unint64_t)a3 callback:(id)a4
{
  unint64_t v6;
  void *v7;
  io_registry_entry_t v8;
  void *CFProperty;
  void *v10;
  unint64_t currentValue;
  _QWORD *v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  v6 = self->_currentIORegSamplingInterval + a3;
  self->_currentIORegSamplingInterval = v6;
  if (v6 > 0x98967F)
  {
    -[DTGPUCounterProfile device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "acceleratorPort");
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v8, CFSTR("PerformanceStatistics"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);

    objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("Device Utilization %"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_deviceUtilization.currentValue = (unint64_t)(self->_deviceUtilization.coefficient
                                                             * (double)self->_deviceUtilization.currentValue
                                                             + (1.0 - self->_deviceUtilization.coefficient)
                                                             * (double)(unint64_t)objc_msgSend(v10, "unsignedLongValue"));
    self->_currentIORegSamplingInterval = 0;

  }
  currentValue = self->_deviceUtilization.currentValue;
  v12 = operator new(8uLL);
  *v12 = currentValue;
  v13 = mach_absolute_time();
  (*((void (**)(id, _QWORD *, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, v12, 1, v13, 0, 0, 0);
  operator delete(v12);

}

@end
