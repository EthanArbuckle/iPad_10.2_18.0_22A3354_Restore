@implementation AXSDCustomDetectionController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_7);
  return (id)sharedInstance___SharedController_2;
}

void __47__AXSDCustomDetectionController_sharedInstance__block_invoke()
{
  AXSDCustomDetectionController *v0;
  void *v1;

  v0 = objc_alloc_init(AXSDCustomDetectionController);
  v1 = (void *)sharedInstance___SharedController_2;
  sharedInstance___SharedController_2 = (uint64_t)v0;

}

- (AXSDCustomDetectionController)init
{
  AXSDCustomDetectionController *v2;
  int v3;
  __objc2_class **v4;
  _TtP18AXSoundDetectionUI33AXSDKShotControllerImplementation_ *v5;
  _TtP18AXSoundDetectionUI33AXSDKShotControllerImplementation_ *controller;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXSDCustomDetectionController;
  v2 = -[AXSDCustomDetectionController init](&v8, sel_init);
  if (v2)
  {
    v3 = AXIsSoundDetectionMedinaSupportEnabled();
    v4 = &off_24DDF6188;
    if (!v3)
      v4 = off_24DDF6180;
    v5 = (_TtP18AXSoundDetectionUI33AXSDKShotControllerImplementation_ *)objc_alloc_init(*v4);
    controller = v2->_controller;
    v2->_controller = v5;

  }
  return v2;
}

- (id)currentCustomDetectors
{
  return (id)-[AXSDKShotControllerImplementation currentDetectionTypes](self->_controller, "currentDetectionTypes");
}

- (void)addCustomDetector:(id)a3
{
  -[AXSDKShotControllerImplementation addWithCustomDetector:](self->_controller, "addWithCustomDetector:", a3);
}

- (void)removeCustomDetector:(id)a3
{
  -[AXSDKShotControllerImplementation removeWithCustomDetector:](self->_controller, "removeWithCustomDetector:", a3);
}

- (void)removeAllListenTypes
{
  -[AXSDKShotControllerImplementation removeAllListenTypes](self->_controller, "removeAllListenTypes");
}

- (BOOL)containsCustomDetector:(id)a3
{
  _TtP18AXSoundDetectionUI33AXSDKShotControllerImplementation_ *controller;
  id v4;
  void *v5;
  void *v6;

  controller = self->_controller;
  v4 = a3;
  -[AXSDKShotControllerImplementation currentDetectionTypes](controller, "currentDetectionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (void)startListening
{
  -[AXSDKShotControllerImplementation startListening](self->_controller, "startListening");
}

- (void)stopListening
{
  -[AXSDKShotControllerImplementation stopListening](self->_controller, "stopListening");
}

- (BOOL)isListening
{
  return -[AXSDKShotControllerImplementation isListening](self->_controller, "isListening");
}

- (AXSDKShotModelManager)modelManager
{
  return self->_modelManager;
}

- (void)setModelManager:(id)a3
{
  objc_storeStrong((id *)&self->_modelManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelManager, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
