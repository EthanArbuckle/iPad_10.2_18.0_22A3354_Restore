@implementation VNObjectTrackerRevision1

- (VNObjectTrackerRevision1)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  VNObjectTrackerRevision1 *v7;
  void *v8;
  VNObjectTrackerRevision1 *v9;
  uint64_t (**v11)(vision::mod::ObjectTrackerOptions *__hidden);
  id v12;
  int v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNObjectTrackerRevision1;
  v7 = -[VNTracker initWithOptions:error:](&v14, sel_initWithOptions_error_, v6, a4);
  if (v7)
  {
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNTrackingOption_TrackingLevel"), v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v11 = &off_1E453A560;
      v12 = 0;
      v13 = 0;
      std::shared_ptr<vision::mod::ObjectTrackerAbstract>::reset[abi:ne180100]<vision::mod::ObjectTrackerAbstract,void>((uint64_t)&v7->super.super.mTrackerImpl, (uint64_t)-[VNTracker _createTrackerWithLevel:options:error:](v7, "_createTrackerWithLevel:options:error:", v8, &v11, a4));
      if (v7->super.super.mTrackerImpl.__ptr_)
        v9 = v7;
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4
{
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
