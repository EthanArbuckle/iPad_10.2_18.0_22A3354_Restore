@implementation InputUIApp

- (void)waitForSpringBoardToForegroundInputUIScene
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = sub_1000039F4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "RTI service will pause and wait for scene to be foreground", buf, 2u);
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sceneCreationSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v5 = sub_1000039F4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "RTI service is resumed", v7, 2u);
  }

}

- (void)resumeTextInputService
{
  void *v3;
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *sceneCreationSemaphore;
  void *v11;
  uint8_t v12[16];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InputUIApp servicePausedLock](self, "servicePausedLock"));
  objc_msgSend(v3, "lock");

  if (-[InputUIApp isServicePaused](self, "isServicePaused"))
  {
    v4 = sub_1000039F4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = os_signpost_id_generate(v5);

    v7 = sub_1000039F4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, v6, "resumeTextInputService", (const char *)&unk_10001A71E, v12, 2u);
    }

    sceneCreationSemaphore = self->_sceneCreationSemaphore;
    if (sceneCreationSemaphore)
      dispatch_semaphore_signal(sceneCreationSemaphore);
    -[InputUIApp setServicePaused:](self, "setServicePaused:", 0);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[InputUIApp servicePausedLock](self, "servicePausedLock"));
  objc_msgSend(v11, "unlock");

}

- (NSLock)servicePausedLock
{
  return self->_servicePausedLock;
}

- (void)setServicePaused:(BOOL)a3
{
  self->_servicePaused = a3;
}

- (BOOL)isServicePaused
{
  return self->_servicePaused;
}

- (InputUIApp)init
{
  InputUIApp *v2;
  id v3;
  NSObject *v4;
  NSLock *v5;
  NSLock *servicePausedLock;
  IUIRTISystemDelegateMultiplexer *v7;
  IUIRTISystemDelegateMultiplexer *systemDelegateMultiplexer;
  uint64_t v9;
  uint64_t v10;
  RTIInputSystemUIService *inputLaunchAngelService;
  uint64_t v12;
  RTIInputSystemService *textInputService;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *sessionCoordinatorQueue;
  IUISessionCoordinator *v20;
  IUISessionCoordinator *sessionCoordinator;
  Class v22;
  uint64_t v23;
  uint64_t v24;
  UIKeyboardUIService *keyboardUIService;
  uint64_t v26;
  ITTInputTeletypeServer *inputTeletypeServer;
  uint64_t v28;
  IUIDummyITTInputTeletypeServer *dummyInputTeletypeServer;
  uint64_t v30;
  RTIInputSystemUIService *autofillUILaunchAngelService;
  void *v32;
  objc_class *v33;
  RTIInputSystemDelegate *v34;
  RTIInputSystemDelegate *autofillUIServiceDelegate;
  RTIInputSystemDelegate *v36;
  void *v37;
  dispatch_queue_attr_t v38;
  NSObject *v39;
  dispatch_queue_t v40;
  void *v41;
  objc_class *v42;
  id v43;
  void *v44;
  AFUSServiceListener *v45;
  AFUSServiceListener *autofillUIServiceListener;
  void *v47;
  objc_super v49;
  uint8_t buf[8];
  uint64_t v51;
  Class (*v52)(uint64_t);
  void *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;

  v49.receiver = self;
  v49.super_class = (Class)InputUIApp;
  v2 = -[InputUIApp init](&v49, "init");
  if (v2)
  {
    v3 = sub_1000039F4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InputUI is launching", buf, 2u);
    }

    v5 = (NSLock *)objc_alloc_init((Class)NSLock);
    servicePausedLock = v2->_servicePausedLock;
    v2->_servicePausedLock = v5;

    v7 = objc_alloc_init(IUIRTISystemDelegateMultiplexer);
    systemDelegateMultiplexer = v2->_systemDelegateMultiplexer;
    v2->_systemDelegateMultiplexer = v7;

    -[IUIRTISystemDelegateMultiplexer setContextDelegate:](v2->_systemDelegateMultiplexer, "setContextDelegate:", v2);
    v9 = RTIInputUIServiceMachNameiOS;
    v10 = objc_claimAutoreleasedReturnValue(+[RTIInputSystemUIService sharedServiceWithDomainName:serviceName:](RTIInputSystemUIService, "sharedServiceWithDomainName:serviceName:", RTIInputUIServiceMachNameiOS, RTIInputUIServiceName));
    inputLaunchAngelService = v2->_inputLaunchAngelService;
    v2->_inputLaunchAngelService = (RTIInputSystemUIService *)v10;

    v12 = objc_claimAutoreleasedReturnValue(-[RTIInputSystemUIService rtiService](v2->_inputLaunchAngelService, "rtiService"));
    textInputService = v2->_textInputService;
    v2->_textInputService = (RTIInputSystemService *)v12;

    -[RTIInputSystemService setDelegate:](v2->_textInputService, "setDelegate:", v2->_systemDelegateMultiplexer);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INTERACTIVE, 0);
    v17 = objc_claimAutoreleasedReturnValue(v16);

    v18 = dispatch_queue_create("com.apple.InputUI.sessionCoordinator", v17);
    sessionCoordinatorQueue = v2->_sessionCoordinatorQueue;
    v2->_sessionCoordinatorQueue = (OS_dispatch_queue *)v18;

    v20 = -[IUISessionCoordinator initWithQueue:]([IUISessionCoordinator alloc], "initWithQueue:", v2->_sessionCoordinatorQueue);
    sessionCoordinator = v2->_sessionCoordinator;
    v2->_sessionCoordinator = v20;

    -[IUIRTISystemDelegateMultiplexer setPrimaryDelegate:](v2->_systemDelegateMultiplexer, "setPrimaryDelegate:", v2->_sessionCoordinator);
    -[InputUIApp pauseTextInputService](v2, "pauseTextInputService");
    -[RTIInputSystemService setEnabled:](v2->_textInputService, "setEnabled:", 1);
    v22 = NSClassFromString(CFSTR("UIKeyboardUIService"));
    if (v22)
    {
      v24 = objc_claimAutoreleasedReturnValue(-[objc_class sharedService](v22, "sharedService"));
      keyboardUIService = v2->_keyboardUIService;
      v2->_keyboardUIService = (UIKeyboardUIService *)v24;

    }
    if (objc_opt_class(ITTInputTeletypeServer, v23))
    {
      v26 = objc_claimAutoreleasedReturnValue(+[ITTInputTeletypeServer sharedServer](ITTInputTeletypeServer, "sharedServer"));
      inputTeletypeServer = v2->_inputTeletypeServer;
      v2->_inputTeletypeServer = (ITTInputTeletypeServer *)v26;

    }
    if (!v2->_inputTeletypeServer)
    {
      v28 = objc_claimAutoreleasedReturnValue(+[IUIDummyITTInputTeletypeServer sharedServer](IUIDummyITTInputTeletypeServer, "sharedServer"));
      dummyInputTeletypeServer = v2->_dummyInputTeletypeServer;
      v2->_dummyInputTeletypeServer = (IUIDummyITTInputTeletypeServer *)v28;

    }
    if ((+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP") & 1) == 0
      && +[UIKeyboard supportsAutoFillPanel](UIKeyboard, "supportsAutoFillPanel"))
    {
      v30 = objc_claimAutoreleasedReturnValue(+[RTIInputSystemUIService sharedServiceWithDomainName:serviceName:](RTIInputSystemUIService, "sharedServiceWithDomainName:serviceName:", v9, RTIServiceAutoFillName));
      autofillUILaunchAngelService = v2->_autofillUILaunchAngelService;
      v2->_autofillUILaunchAngelService = (RTIInputSystemUIService *)v30;

      v55 = 0;
      v56 = &v55;
      v57 = 0x2050000000;
      v32 = (void *)qword_100029380;
      v58 = qword_100029380;
      if (!qword_100029380)
      {
        *(_QWORD *)buf = _NSConcreteStackBlock;
        v51 = 3221225472;
        v52 = sub_100005248;
        v53 = &unk_10001C518;
        v54 = &v55;
        sub_100005248((uint64_t)buf);
        v32 = (void *)v56[3];
      }
      v33 = objc_retainAutorelease(v32);
      _Block_object_dispose(&v55, 8);
      v34 = (RTIInputSystemDelegate *)objc_alloc_init(v33);
      autofillUIServiceDelegate = v2->_autofillUIServiceDelegate;
      v2->_autofillUIServiceDelegate = v34;

      v36 = v2->_autofillUIServiceDelegate;
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemUIService rtiService](v2->_autofillUILaunchAngelService, "rtiService"));
      objc_msgSend(v37, "setDelegate:", v36);

      v38 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      v40 = dispatch_queue_create("com.apple.inputservice.AutoFillUIService", v39);
      -[InputUIApp setAutofillUIServiceQueue:](v2, "setAutofillUIServiceQueue:", v40);

      v55 = 0;
      v56 = &v55;
      v57 = 0x2050000000;
      v41 = (void *)qword_100029390;
      v58 = qword_100029390;
      if (!qword_100029390)
      {
        *(_QWORD *)buf = _NSConcreteStackBlock;
        v51 = 3221225472;
        v52 = sub_1000052FC;
        v53 = &unk_10001C518;
        v54 = &v55;
        sub_1000052FC((uint64_t)buf);
        v41 = (void *)v56[3];
      }
      v42 = objc_retainAutorelease(v41);
      _Block_object_dispose(&v55, 8);
      v43 = [v42 alloc];
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[InputUIApp autofillUIServiceQueue](v2, "autofillUIServiceQueue"));
      v45 = (AFUSServiceListener *)objc_msgSend(v43, "initDefaultServiceWithServiceQueue:", v44);
      autofillUIServiceListener = v2->_autofillUIServiceListener;
      v2->_autofillUIServiceListener = v45;

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemUIService rtiService](v2->_autofillUILaunchAngelService, "rtiService"));
      objc_msgSend(v47, "setEnabled:", 1);

    }
  }
  return v2;
}

- (void)pauseTextInputService
{
  void *v3;
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  OS_dispatch_semaphore *v10;
  OS_dispatch_semaphore *sceneCreationSemaphore;
  NSObject *v12;
  void *v13;
  _QWORD block[5];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InputUIApp servicePausedLock](self, "servicePausedLock"));
  objc_msgSend(v3, "lock");

  if (!-[InputUIApp isServicePaused](self, "isServicePaused"))
  {
    v4 = sub_1000039F4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = os_signpost_id_generate(v5);

    v7 = sub_1000039F4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, v6, "pauseTextInputService", (const char *)&unk_10001A71E, buf, 2u);
    }

    -[InputUIApp setServicePaused:](self, "setServicePaused:", 1);
    if (!self->_sceneCreationSemaphore)
    {
      v10 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      sceneCreationSemaphore = self->_sceneCreationSemaphore;
      self->_sceneCreationSemaphore = v10;

    }
    v12 = objc_claimAutoreleasedReturnValue(-[InputUIApp sessionCoordinatorQueue](self, "sessionCoordinatorQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004E9C;
    block[3] = &unk_10001C4F0;
    block[4] = self;
    dispatch_async(v12, block);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[InputUIApp servicePausedLock](self, "servicePausedLock"));
  objc_msgSend(v13, "unlock");

}

- (void)inputSystemService:(id)a3 prepareForInputSession:(id)a4 options:(id)a5
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  if ((((uint64_t (*)(void))objc_opt_respondsToSelector)() & 1) != 0)
    v5 = objc_msgSend(v10, "enhancedWindowingModeEnabled");
  else
    v5 = 0;
  v6 = -[objc_class performSelector:](NSClassFromString(CFSTR("_UIKeyboardArbiterClientInputUIHost")), "performSelector:", "automaticSharedArbiterClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if ((objc_opt_respondsToSelector(v7, "presentationModeManager") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "performSelector:", "presentationModeManager"));
    if ((objc_opt_respondsToSelector(v8, "_enhancedWindowingModeEnabledDidChange:") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
      objc_msgSend(v8, "performSelector:withObject:", "_enhancedWindowingModeEnabledDidChange:", v9);

    }
  }

}

- (IUIRTISystemDelegateMultiplexer)systemDelegateMultiplexer
{
  return self->_systemDelegateMultiplexer;
}

- (void)setSystemDelegateMultiplexer:(id)a3
{
  objc_storeStrong((id *)&self->_systemDelegateMultiplexer, a3);
}

- (RTIInputSystemService)textInputService
{
  return self->_textInputService;
}

- (IUISessionCoordinator)sessionCoordinator
{
  return self->_sessionCoordinator;
}

- (OS_dispatch_queue)sessionCoordinatorQueue
{
  return self->_sessionCoordinatorQueue;
}

- (AFUSServiceListener)autofillUIServiceListener
{
  return self->_autofillUIServiceListener;
}

- (OS_dispatch_queue)autofillUIServiceQueue
{
  return self->_autofillUIServiceQueue;
}

- (void)setAutofillUIServiceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_autofillUIServiceQueue, a3);
}

- (RTIInputSystemUIService)inputLaunchAngelService
{
  return self->_inputLaunchAngelService;
}

- (void)setInputLaunchAngelService:(id)a3
{
  objc_storeStrong((id *)&self->_inputLaunchAngelService, a3);
}

- (RTIInputSystemUIService)autofillUILaunchAngelService
{
  return self->_autofillUILaunchAngelService;
}

- (void)setAutofillUILaunchAngelService:(id)a3
{
  objc_storeStrong((id *)&self->_autofillUILaunchAngelService, a3);
}

- (RTIInputSystemDelegate)autofillUIServiceDelegate
{
  return self->_autofillUIServiceDelegate;
}

- (void)setAutofillUIServiceDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_autofillUIServiceDelegate, a3);
}

- (UIKeyboardUIService)keyboardUIService
{
  return self->_keyboardUIService;
}

- (void)setKeyboardUIService:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardUIService, a3);
}

- (ITTInputTeletypeServer)inputTeletypeServer
{
  return self->_inputTeletypeServer;
}

- (void)setInputTeletypeServer:(id)a3
{
  objc_storeStrong((id *)&self->_inputTeletypeServer, a3);
}

- (IUIDummyITTInputTeletypeServer)dummyInputTeletypeServer
{
  return self->_dummyInputTeletypeServer;
}

- (void)setDummyInputTeletypeServer:(id)a3
{
  objc_storeStrong((id *)&self->_dummyInputTeletypeServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dummyInputTeletypeServer, 0);
  objc_storeStrong((id *)&self->_inputTeletypeServer, 0);
  objc_storeStrong((id *)&self->_keyboardUIService, 0);
  objc_storeStrong((id *)&self->_autofillUIServiceDelegate, 0);
  objc_storeStrong((id *)&self->_autofillUILaunchAngelService, 0);
  objc_storeStrong((id *)&self->_inputLaunchAngelService, 0);
  objc_storeStrong((id *)&self->_autofillUIServiceQueue, 0);
  objc_storeStrong((id *)&self->_autofillUIServiceListener, 0);
  objc_storeStrong((id *)&self->_servicePausedLock, 0);
  objc_storeStrong((id *)&self->_sessionCoordinatorQueue, 0);
  objc_storeStrong((id *)&self->_sessionCoordinator, 0);
  objc_storeStrong((id *)&self->_textInputService, 0);
  objc_storeStrong((id *)&self->_systemDelegateMultiplexer, 0);
  objc_storeStrong((id *)&self->_sceneCreationSemaphoreForAutofillUIService, 0);
  objc_storeStrong((id *)&self->_sceneCreationSemaphoreForAutofillAngel, 0);
  objc_storeStrong((id *)&self->_sceneCreationSemaphore, 0);
}

@end
