@implementation MTRControllerFactory

- (BOOL)isRunning
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isRunning;

  objc_msgSend_sharedInstance(MTRDeviceControllerFactory, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isRunning = objc_msgSend_isRunning(v3, v4, v5);

  return isRunning;
}

+ (MTRControllerFactory)sharedInstance
{
  if (qword_2561591C8 != -1)
    dispatch_once(&qword_2561591C8, &unk_2504EE998);
  return (MTRControllerFactory *)(id)qword_2561591C0;
}

- (BOOL)startup:(MTRControllerFactoryParams *)startupParams
{
  MTRControllerFactoryParams *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  char started;

  v3 = startupParams;
  objc_msgSend_sharedInstance(MTRDeviceControllerFactory, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  started = objc_msgSend_startControllerFactory_error_(v6, v7, (uint64_t)v3, 0);

  return started;
}

- (void)shutdown
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_sharedInstance(MTRDeviceControllerFactory, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopControllerFactory(v5, v3, v4);

}

- (MTRDeviceController)startControllerOnExistingFabric:(MTRDeviceControllerStartupParams *)startupParams
{
  MTRDeviceControllerStartupParams *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = startupParams;
  objc_msgSend_sharedInstance(MTRDeviceControllerFactory, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createControllerOnExistingFabric_error_(v6, v7, (uint64_t)v3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTRDeviceController *)v8;
}

- (MTRDeviceController)startControllerOnNewFabric:(MTRDeviceControllerStartupParams *)startupParams
{
  MTRDeviceControllerStartupParams *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = startupParams;
  objc_msgSend_sharedInstance(MTRDeviceControllerFactory, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createControllerOnNewFabric_error_(v6, v7, (uint64_t)v3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTRDeviceController *)v8;
}

@end
