@implementation BWFigCaptureDeviceVendorDeviceState

- (NSMutableSet)portTypesToCheckForToFAFEstimator
{
  return self->_portTypesToCheckForToFAFEstimator;
}

- (NSMutableSet)portTypesToCheckForAFDriverShortStatistics
{
  return self->_portTypesToCheckForAFDriverShortStatistics;
}

- (BWFigCaptureDeviceVendorDeviceState)initWithDevice:(id)a3
{
  BWFigCaptureDeviceVendorDeviceState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWFigCaptureDeviceVendorDeviceState;
  v4 = -[BWFigCaptureDeviceVendorDeviceState init](&v6, sel_init);
  if (v4)
  {
    v4->_device = (BWFigCaptureDevice *)a3;
    v4->_controlledStreams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_streamsToKeepControlled = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_streamsInUse = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_streamsControlledByOtherClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_portTypesAllowingStreamControlLoss = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_portTypesToCheckForToFAFEstimator = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4->_tofAFEstimatorResultsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_tofAFEstimatorResultsStreamingTimeByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_tofAFEstimatorClientApplicationIDByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_portTypesToCheckForAFDriverShortStatistics = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4->_afDriverShortStatisticsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v4;
}

- (OS_dispatch_source)deviceCloseTimer
{
  return self->_deviceCloseTimer;
}

- (void)setDeviceCloseTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BWFigCaptureDevice)device
{
  return self->_device;
}

- (int)deviceUsageCount
{
  return self->_deviceUsageCount;
}

- (void)setDeviceUsageCount:(int)a3
{
  self->_deviceUsageCount = a3;
}

- (NSMutableArray)streamsControlledByOtherClients
{
  return self->_streamsControlledByOtherClients;
}

- (NSMutableArray)controlledStreams
{
  return self->_controlledStreams;
}

- (NSMutableArray)streamsInUse
{
  return self->_streamsInUse;
}

- (void)dealloc
{
  NSObject *deviceCloseTimer;
  objc_super v4;

  deviceCloseTimer = self->_deviceCloseTimer;
  if (deviceCloseTimer)
    dispatch_release(deviceCloseTimer);

  v4.receiver = self;
  v4.super_class = (Class)BWFigCaptureDeviceVendorDeviceState;
  -[BWFigCaptureDeviceVendorDeviceState dealloc](&v4, sel_dealloc);
}

- (NSArray)streamsRequiringControlControlledByOtherClients
{
  NSArray *v3;
  NSMutableArray *streamsControlledByOtherClients;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  streamsControlledByOtherClients = self->_streamsControlledByOtherClients;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamsControlledByOtherClients, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(streamsControlledByOtherClients);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_portTypesAllowingStreamControlLoss, "containsObject:", objc_msgSend(v9, "portType")) & 1) == 0)-[NSArray addObject:](v3, "addObject:", v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamsControlledByOtherClients, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("device: %@"), -[BWFigCaptureDevice deviceID](self->_device, "deviceID"));
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[BWFigCaptureDeviceVendorDeviceState debugDescription](self, "debugDescription"));
}

- (BOOL)inUseForPublishing
{
  return self->_inUseForPublishing;
}

- (void)setInUseForPublishing:(BOOL)a3
{
  self->_inUseForPublishing = a3;
}

- (BOOL)inUseForVibeMitigation
{
  return self->_inUseForVibeMitigation;
}

- (void)setInUseForVibeMitigation:(BOOL)a3
{
  self->_inUseForVibeMitigation = a3;
}

- (NSMutableArray)streamsToKeepControlled
{
  return self->_streamsToKeepControlled;
}

- (NSMutableArray)portTypesAllowingStreamControlLoss
{
  return self->_portTypesAllowingStreamControlLoss;
}

- (void)setPortTypesAllowingStreamControlLoss:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableDictionary)tofAFEstimatorResultsByPortType
{
  return self->_tofAFEstimatorResultsByPortType;
}

- (NSMutableDictionary)tofAFEstimatorResultsStreamingTimeByPortType
{
  return self->_tofAFEstimatorResultsStreamingTimeByPortType;
}

- (NSMutableDictionary)tofAFEstimatorClientApplicationIDByPortType
{
  return self->_tofAFEstimatorClientApplicationIDByPortType;
}

- (NSMutableDictionary)afDriverShortStatisticsByPortType
{
  return self->_afDriverShortStatisticsByPortType;
}

- (BOOL)shutDownDueToSystemPressure
{
  return self->_shutDownDueToSystemPressure;
}

- (void)setShutDownDueToSystemPressure:(BOOL)a3
{
  self->_shutDownDueToSystemPressure = a3;
}

@end
