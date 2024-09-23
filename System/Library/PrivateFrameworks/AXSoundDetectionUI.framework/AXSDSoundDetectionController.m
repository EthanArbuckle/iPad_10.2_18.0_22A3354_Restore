@implementation AXSDSoundDetectionController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_2);
  return (id)sharedInstance___SharedController_0;
}

void __46__AXSDSoundDetectionController_sharedInstance__block_invoke()
{
  AXSDSoundDetectionController *v0;
  void *v1;

  v0 = objc_alloc_init(AXSDSoundDetectionController);
  v1 = (void *)sharedInstance___SharedController_0;
  sharedInstance___SharedController_0 = (uint64_t)v0;

}

- (AXSDSoundDetectionController)init
{
  AXSDSoundDetectionController *v2;
  _TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation *v3;
  _TtP18AXSoundDetectionUI28AXSDControllerImplementation_ *controller;
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v5;
  _TtP18AXSoundDetectionUI28AXSDControllerImplementation_ *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXSDSoundDetectionController;
  v2 = -[AXSDSoundDetectionController init](&v12, sel_init);
  if (v2)
  {
    if (AXIsSoundDetectionMedinaSupportEnabled())
    {
      v3 = objc_alloc_init(_TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation);
      controller = v2->_controller;
      v2->_controller = (_TtP18AXSoundDetectionUI28AXSDControllerImplementation_ *)v3;

    }
    else
    {
      v5 = objc_alloc_init(_TtC18AXSoundDetectionUI30AXSDNSControllerImplementation);
      v6 = v2->_controller;
      v2->_controller = (_TtP18AXSoundDetectionUI28AXSDControllerImplementation_ *)v5;

      objc_initWeak(&location, v2);
      objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __36__AXSDSoundDetectionController_init__block_invoke;
      v9[3] = &unk_24DDF6738;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v7, "registerUpdateBlock:forRetrieveSelector:withListener:", v9, sel_pipedInFile, v2);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

void __36__AXSDSoundDetectionController_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pipedInFileUpdated");

}

- (void)enrollForDataCollection
{
  if (objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall"))
    +[AXSDUltronInternalRecordingManager enroll](AXSDUltronInternalRecordingManager, "enroll");
}

- (void)unenrollFromDataCollection
{
  +[AXSDUltronInternalRecordingManager unenroll](AXSDUltronInternalRecordingManager, "unenroll");
}

+ (BOOL)isEnrolledInDataCollection
{
  return +[AXSDUltronInternalRecordingManager isEnrolled](AXSDUltronInternalRecordingManager, "isEnrolled");
}

+ (BOOL)wasPromptedForDataCollection
{
  return +[AXSDUltronInternalRecordingManager wasPrompted](AXSDUltronInternalRecordingManager, "wasPrompted");
}

+ (void)setPromptedForDataCollection
{
  +[AXSDUltronInternalRecordingManager setPrompted](AXSDUltronInternalRecordingManager, "setPrompted");
}

- (void)assetsReadyAndDetectorsAdded
{
  -[AXSDControllerImplementation startListening](self->_controller, "startListening");
}

- (NSSet)currentDetectionTypes
{
  return (NSSet *)-[AXSDControllerImplementation currentDetectionTypes](self->_controller, "currentDetectionTypes");
}

- (void)addListenType:(id)a3
{
  -[AXSDControllerImplementation addWithListenType:](self->_controller, "addWithListenType:", a3);
}

- (void)removeListenType:(id)a3
{
  -[AXSDControllerImplementation removeWithListenType:](self->_controller, "removeWithListenType:", a3);
}

- (BOOL)containsListenType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[AXSDSoundDetectionController currentDetectionTypes](self, "currentDetectionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)removeAllListenTypes
{
  -[AXSDControllerImplementation removeAllListenTypes](self->_controller, "removeAllListenTypes");
}

- (void)startListening
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  AXLogUltron();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = v4;
    objc_msgSend(v5, "numberWithBool:", -[AXSDSoundDetectionController _hasMedinaSupport](self, "_hasMedinaSupport"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_21ACD4000, v3, OS_LOG_TYPE_DEFAULT, "[%@]: Will start listening. Has Medina Support Enabled: %@", (uint8_t *)&v8, 0x16u);

  }
  -[AXSDControllerImplementation startListening](self->_controller, "startListening");
}

- (void)stopListening
{
  -[AXSDControllerImplementation stopListening](self->_controller, "stopListening");
}

- (BOOL)isListening
{
  return -[AXSDControllerImplementation isListening](self->_controller, "isListening");
}

- (void)_pipedInFileUpdated
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pipedInFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AXSDSoundDetectionController pipeInFile:](self, "pipeInFile:", v3);

}

- (id)pipeInFile:(id)a3
{
  id v4;
  _TtP18AXSoundDetectionUI28AXSDControllerImplementation_ *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v11;

  v4 = a3;
  if (-[AXSDControllerImplementation conformsToProtocol:](self->_controller, "conformsToProtocol:", &unk_25511E368))
  {
    v5 = self->_controller;
    v11 = 0;
    -[AXSDControllerImplementation pipeInFilePath:error:](v5, "pipeInFilePath:error:", v4, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v7)
    {
      AXLogUltron();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AXSDSoundDetectionController pipeInFile:].cold.1((uint64_t)v7, v8);

      v9 = 0;
    }
    else
    {
      v9 = v6;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (AXSDDetectorManager)detectorManager
{
  return self->_detectorManager;
}

- (void)setDetectorManager:(id)a3
{
  objc_storeStrong((id *)&self->_detectorManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorManager, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

- (void)pipeInFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21ACD4000, a2, OS_LOG_TYPE_ERROR, "Error while piping file. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end
