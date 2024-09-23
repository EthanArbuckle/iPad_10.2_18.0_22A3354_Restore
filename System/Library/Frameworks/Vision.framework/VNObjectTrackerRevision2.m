@implementation VNObjectTrackerRevision2

- (VNObjectTrackerRevision2)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  VNObjectTrackerRevision2 *v7;
  BOOL v8;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  VNObjectTrackerRevision2 *v18;
  id v20[2];
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v37;

  v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)VNObjectTrackerRevision2;
  v7 = -[VNTracker initWithOptions:error:](&v37, sel_initWithOptions_error_, v6, a4);
  if (v7
    && (v36 = 0,
        +[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v36, CFSTR("VNTrackingOption_InputImageMaxWidth"), v6, a4))&& (v35 = 0, +[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v35, CFSTR("VNTrackingOption_InputImageMaxHeight"), v6, a4)))
  {
    v34 = 0;
    v8 = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", &v34, objc_opt_class(), CFSTR("VNTrackerOption_RPNEspressoResources"), v6, a4);
    v9 = (id *)v34;
    if (v8)
    {
      v10 = (void *)objc_opt_class();
      v21 = 0;
      v20[0] = &off_1E453A3A8;
      v20[1] = 0;
      objc_msgSend(v10, "rpnInitQueue");
      v25 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "rpnTrackQueue");
      v29 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "serializeRPNInitializationQueue");
      v30 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "serializeRPNTrackingQueue");
      v31 = objc_claimAutoreleasedReturnValue();

      v32 = v36;
      v33 = v35;
      -[VNRPNTrackerEspressoResources rpnInitEspressoResources](v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v11, "network");
      v23 = v12;

      -[VNRPNTrackerEspressoResources rpnInitEspressoResources](v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v13, "plan");

      -[VNRPNTrackerEspressoResources rpnTrackEspressoResources](v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v14, "network");
      v27 = v15;

      -[VNRPNTrackerEspressoResources rpnTrackEspressoResources](v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v16, "plan");

      +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNTrackingOption_TrackingLevel"), v6, a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17
        && (std::shared_ptr<vision::mod::ObjectTrackerAbstract>::reset[abi:ne180100]<vision::mod::ObjectTrackerAbstract,void>((uint64_t)&v7->super.super.mTrackerImpl, (uint64_t)-[VNTracker _createTrackerWithLevel:options:error:](v7, "_createTrackerWithLevel:options:error:", v17, v20, a4)), v7->super.super.mTrackerImpl.__ptr_))
      {
        v18 = v7;
      }
      else
      {
        v18 = 0;
      }

      vision::mod::RPNTrackerOptions::~RPNTrackerOptions(v20);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4
{
  +[VNComputeDeviceUtilities espressoV1ModelComputeDevices](VNComputeDeviceUtilities, "espressoV1ModelComputeDevices", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)rpnTrackerInitProcessingQueueName
{
  return CFSTR("com.apple.Tracker.rpnInitQueue");
}

+ (id)rpnTrackerTrackProcessingQueueName
{
  return CFSTR("com.apple.Tracker.rpnTrackQueuee");
}

+ (NSString)rpnTrackerInitModelName
{
  return (NSString *)CFSTR("rpn_template_v5.espresso");
}

+ (NSString)rpnTrackerTrackModelName
{
  return (NSString *)CFSTR("rpn_track_v5.espresso");
}

+ (id)rpnInitQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__VNObjectTrackerRevision2_rpnInitQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNObjectTrackerRevision2 rpnInitQueue]::onceToken != -1)
    dispatch_once(&+[VNObjectTrackerRevision2 rpnInitQueue]::onceToken, block);
  return (id)+[VNObjectTrackerRevision2 rpnInitQueue]::rpnInitQueue;
}

+ (id)rpnTrackQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VNObjectTrackerRevision2_rpnTrackQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNObjectTrackerRevision2 rpnTrackQueue]::onceToken != -1)
    dispatch_once(&+[VNObjectTrackerRevision2 rpnTrackQueue]::onceToken, block);
  return (id)+[VNObjectTrackerRevision2 rpnTrackQueue]::rpnTrackQueue;
}

+ (id)serializeRPNInitializationQueue
{
  if (+[VNObjectTrackerRevision2 serializeRPNInitializationQueue]::onceToken != -1)
    dispatch_once(&+[VNObjectTrackerRevision2 serializeRPNInitializationQueue]::onceToken, &__block_literal_global_4851);
  return (id)+[VNObjectTrackerRevision2 serializeRPNInitializationQueue]::serializeRPNInitializationQueue;
}

+ (id)serializeRPNTrackingQueue
{
  if (+[VNObjectTrackerRevision2 serializeRPNTrackingQueue]::onceToken != -1)
    dispatch_once(&+[VNObjectTrackerRevision2 serializeRPNTrackingQueue]::onceToken, &__block_literal_global_29);
  return (id)+[VNObjectTrackerRevision2 serializeRPNTrackingQueue]::serializeRPNTrackingQueue;
}

void __53__VNObjectTrackerRevision2_serializeRPNTrackingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.VN.serializeRPNTrackingQueue", v2);
  v1 = (void *)+[VNObjectTrackerRevision2 serializeRPNTrackingQueue]::serializeRPNTrackingQueue;
  +[VNObjectTrackerRevision2 serializeRPNTrackingQueue]::serializeRPNTrackingQueue = (uint64_t)v0;

}

void __59__VNObjectTrackerRevision2_serializeRPNInitializationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.VN.serializeRPNInitializationQueue", v2);
  v1 = (void *)+[VNObjectTrackerRevision2 serializeRPNInitializationQueue]::serializeRPNInitializationQueue;
  +[VNObjectTrackerRevision2 serializeRPNInitializationQueue]::serializeRPNInitializationQueue = (uint64_t)v0;

}

void __41__VNObjectTrackerRevision2_rpnTrackQueue__block_invoke(uint64_t a1)
{
  const char *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "rpnTrackerTrackProcessingQueueName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = (const char *)objc_msgSend(v5, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create(v1, v2);
  v4 = (void *)+[VNObjectTrackerRevision2 rpnTrackQueue]::rpnTrackQueue;
  +[VNObjectTrackerRevision2 rpnTrackQueue]::rpnTrackQueue = (uint64_t)v3;

}

void __40__VNObjectTrackerRevision2_rpnInitQueue__block_invoke(uint64_t a1)
{
  const char *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "rpnTrackerInitProcessingQueueName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = (const char *)objc_msgSend(v5, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create(v1, v2);
  v4 = (void *)+[VNObjectTrackerRevision2 rpnInitQueue]::rpnInitQueue;
  +[VNObjectTrackerRevision2 rpnInitQueue]::rpnInitQueue = (uint64_t)v3;

}

@end
