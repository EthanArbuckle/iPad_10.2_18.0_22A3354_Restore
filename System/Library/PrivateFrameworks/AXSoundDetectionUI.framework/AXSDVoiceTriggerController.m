@implementation AXSDVoiceTriggerController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_3);
  return (id)sharedInstance___SharedController_1;
}

void __44__AXSDVoiceTriggerController_sharedInstance__block_invoke()
{
  AXSDVoiceTriggerController *v0;
  void *v1;

  v0 = objc_alloc_init(AXSDVoiceTriggerController);
  v1 = (void *)sharedInstance___SharedController_1;
  sharedInstance___SharedController_1 = (uint64_t)v0;

}

- (AXSDVoiceTriggerController)init
{
  AXSDVoiceTriggerController *v2;
  int v3;
  __objc2_class **v4;
  _TtP18AXSoundDetectionUI26AXSDSoundActionsController_ *v5;
  _TtP18AXSoundDetectionUI26AXSDSoundActionsController_ *controller;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXSDVoiceTriggerController;
  v2 = -[AXSDVoiceTriggerController init](&v8, sel_init);
  if (v2)
  {
    v3 = AXIsSoundDetectionMedinaSupportEnabled();
    v4 = off_24DDF6178;
    if (!v3)
      v4 = off_24DDF6170;
    v5 = (_TtP18AXSoundDetectionUI26AXSDSoundActionsController_ *)objc_alloc_init(*v4);
    controller = v2->_controller;
    v2->_controller = v5;

    -[AXSDSoundActionsController setDelegate:](v2->_controller, "setDelegate:", v2);
  }
  return v2;
}

- (void)startListening
{
  -[AXSDSoundActionsController startListening](self->_controller, "startListening");
}

- (void)startListeningOnQueue:(id)a3
{
  -[AXSDSoundActionsController startListening](self->_controller, "startListening", a3);
}

- (void)stopListening
{
  _TtP18AXSoundDetectionUI26AXSDSoundActionsController_ *controller;
  _TtC18AXSoundDetectionUI34AXSASecureControllerImplementation *v4;
  _TtP18AXSoundDetectionUI26AXSDSoundActionsController_ *v5;

  -[AXSDSoundActionsController stopListening](self->_controller, "stopListening");
  if (AXIsSoundDetectionMedinaSupportEnabled())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      controller = self->_controller;
      self->_controller = 0;

      v4 = objc_alloc_init(_TtC18AXSoundDetectionUI34AXSASecureControllerImplementation);
      v5 = self->_controller;
      self->_controller = (_TtP18AXSoundDetectionUI26AXSDSoundActionsController_ *)v4;

      -[AXSDSoundActionsController setDelegate:](self->_controller, "setDelegate:", self);
    }
  }
}

- (void)postEventToSystemWithSoundActionEvent:(int64_t)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE buf[24];
  void *v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  AXLogSoundActions();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    v5 = *(id *)&buf[4];
    _os_log_impl(&dword_21ACD4000, v4, OS_LOG_TYPE_DEFAULT, "[%@]: posting voice trigger event to system: %ld", buf, 0x16u);

  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v6 = (void *)getAXEventRepresentationClass_softClass;
  v15 = getAXEventRepresentationClass_softClass;
  if (!getAXEventRepresentationClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getAXEventRepresentationClass_block_invoke;
    v17 = &unk_24DDF66B8;
    v18 = &v12;
    __getAXEventRepresentationClass_block_invoke((uint64_t)buf);
    v6 = (void *)v13[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v7, "accessibilityEventRepresentationWithSender:usagePage:usage:", 4, 3, a3, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v9 = (void *)getAXEventTapManagerClass_softClass;
  v15 = getAXEventTapManagerClass_softClass;
  if (!getAXEventTapManagerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getAXEventTapManagerClass_block_invoke;
    v17 = &unk_24DDF66B8;
    v18 = &v12;
    __getAXEventTapManagerClass_block_invoke((uint64_t)buf);
    v9 = (void *)v13[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v10, "sharedManager", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendHIDSystemEvent:senderID:", v8, 0x8000000817319383);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
