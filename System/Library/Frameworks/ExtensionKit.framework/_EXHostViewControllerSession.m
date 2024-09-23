@implementation _EXHostViewControllerSession

+ (void)sessionWithProcess:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "configuration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sessionWithProcessConfiguration:configuration:completion:", v10, v9, v8);

}

+ (void)sessionWithProcessConfiguration:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _EXHostViewControllerSession *v10;
  id v11;
  _EXHostViewControllerSession *v12;
  _QWORD v13[4];
  _EXHostViewControllerSession *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_EXHostViewControllerSession initWithProcessConfiguration:configuration:detached:]([_EXHostViewControllerSession alloc], "initWithProcessConfiguration:configuration:detached:", v9, v8, 1);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __89___EXHostViewControllerSession_sessionWithProcessConfiguration_configuration_completion___block_invoke;
  v13[3] = &unk_24C3E3710;
  v14 = v10;
  v15 = v7;
  v11 = v7;
  v12 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

}

- (_EXHostViewControllerSession)initWithProcessConfiguration:(id)a3 configuration:(id)a4
{
  return -[_EXHostViewControllerSession initWithProcessConfiguration:configuration:detached:](self, "initWithProcessConfiguration:configuration:detached:", a3, a4, 0);
}

- (_EXHostViewControllerSession)initWithProcessConfiguration:(id)a3 configuration:(id)a4 detached:(BOOL)a5
{
  id v8;
  id v9;
  _EXHostViewControllerSession *v10;
  uint64_t v11;
  NSUUID *uuid;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  NSUUID *v17;
  uint64_t v18;
  _EXHostConfiguration *processConfiguration;
  uint64_t v20;
  _EXHostViewControllerSessionConfiguration *configuration;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *internalQueue;
  void *v25;
  void *v26;
  objc_super v28;
  uint8_t buf[4];
  NSUUID *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)_EXHostViewControllerSession;
  v10 = -[_EXHostViewControllerSession init](&v28, sel_init);
  if (v10)
  {
    v11 = objc_opt_new();
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;

    _EXSignpostLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_make_with_pointer(v13, v10->_uuid);
    if (v14)
    {
      v15 = v13;
      v16 = v15;
      if (v14 != -1 && os_signpost_enabled(v15))
      {
        v17 = v10->_uuid;
        *(_DWORD *)buf = 138412290;
        v30 = v17;
        _os_signpost_emit_with_name_impl(&dword_20AE73000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "extensionkit-lifecycle", "ID: %@", buf, 0xCu);
      }

    }
    v10->_signpost = v14;
    v18 = objc_msgSend(v8, "copy");
    processConfiguration = v10->_processConfiguration;
    v10->_processConfiguration = (_EXHostConfiguration *)v18;

    v20 = objc_msgSend(v9, "copy");
    configuration = v10->_configuration;
    v10->_configuration = (_EXHostViewControllerSessionConfiguration *)v20;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("_EXHostSession", v22);
    internalQueue = v10->_internalQueue;
    v10->_internalQueue = (OS_dispatch_queue *)v23;

    v10->_state = 0;
    objc_msgSend(v8, "extensionIdentity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "requiresSceneHosting"))
    {
      v10->_requiresFBSceneHosting = 1;
    }
    else
    {
      objc_msgSend(v8, "extensionIdentity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_requiresFBSceneHosting = objc_msgSend(v26, "requiresFBSceneHosting");

    }
    v10->_detached = a5;
    v10->_isLocked = 0;
  }

  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t signpost;
  objc_super v8;
  uint8_t buf[16];

  -[NSXPCConnection invalidate](self->_sceneSessionConnection, "invalidate");
  if (self->_signpost)
  {
    _EXSignpostLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (self->_signpost && os_signpost_enabled(v3))
    {
      v5 = v4;
      v6 = v5;
      signpost = self->_signpost;
      if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20AE73000, v6, OS_SIGNPOST_INTERVAL_END, signpost, "extensionkit-lifecycle", "dealloc", buf, 2u);
      }

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_EXHostViewControllerSession;
  -[_EXHostViewControllerSession dealloc](&v8, sel_dealloc);
}

- (void)setRemoteViewController:(id)a3
{
  _EXRemoteViewController *v4;
  _EXRemoteViewController *remoteViewController;

  v4 = (_EXRemoteViewController *)a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = v4;

}

- (void)setSceneViewController:(id)a3
{
  UIViewController *v4;
  UIViewController *sceneViewController;

  v4 = (UIViewController *)a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = v4;

}

- (_UIRemoteSheet)remoteSheet
{
  _UISceneHostingController *hostingController;

  hostingController = self->_hostingController;
  if (hostingController)
    return hostingController;
  -[_EXHostViewControllerSession remoteViewController](self, "remoteViewController");
  return (_UIRemoteSheet *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setDelegate:(id)a3
{
  _EXHostViewControllerSessionDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (id)makeXPCConnectionWithError:(id *)a3
{
  void *v3;

  -[_EXHostViewControllerSession _makeXPCConnectionWithError:](self, "_makeXPCConnectionWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = (void *)objc_opt_new();
  return v3;
}

- (id)_makeXPCConnectionWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (self->_requiresFBSceneHosting)
  {
    if (!a3)
      return 0;
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BDC79A8];
    v22 = *MEMORY[0x24BDD0BA0];
    v23[0] = CFSTR("XPC connection is not available for extension points that require scene hosting.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    goto LABEL_4;
  }
  if (self->_state - 2 > 2)
  {
    _EXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_EXHostViewControllerSession _makeXPCConnectionWithError:].cold.2();
  }
  else
  {
    -[_EXHostViewControllerSession remoteViewControllerEndpoint](self, "remoteViewControllerEndpoint");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v10);
      goto LABEL_12;
    }
    _EXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_EXHostViewControllerSession _makeXPCConnectionWithError:].cold.1();

    if (a3)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BDC79A8];
      v20 = *MEMORY[0x24BDD0BA0];
      v21 = CFSTR("Remote view controller XPC connection endpoint is nil, the extension probably exited.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 6, v15);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v9 = 0;
LABEL_12:

  if (!a3 || v9 || *a3)
    return v9;
  v16 = (void *)MEMORY[0x24BDD1540];
  v17 = *MEMORY[0x24BDC79A8];
  v18 = *MEMORY[0x24BDD0BA0];
  v19 = CFSTR("Attempt to make XPC connection on session in unsupported state.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
  *a3 = v8;

  return v9;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  _OWORD v17[2];

  v5 = a3;
  -[_EXHostViewControllerSession extensionProcess](self, "extensionProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BE04300]);
    -[_EXHostViewControllerSession extensionProcess](self, "extensionProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EXHostViewControllerSession extensionProcess](self, "extensionProcess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "auditToken");
    else
      memset(v17, 0, sizeof(v17));
    v12 = (void *)objc_msgSend(v7, "initWithExtensionIdentity:auditToken:", v9, v17);

    if (objc_msgSend(v5, "containsObject:", v12))
    {
      v13 = objc_msgSend(v12, "isEffectivelyLocked");
      _EXDefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v15)
          -[_EXHostViewControllerSession appProtectionSubjectsChanged:forSubscription:].cold.1(self, v14);

        self->_isLocked = 1;
        -[_EXHostViewControllerSession delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addShieldView");
      }
      else
      {
        if (v15)
          -[_EXHostViewControllerSession appProtectionSubjectsChanged:forSubscription:].cold.2(self, v14);

        self->_isLocked = 0;
        -[_EXHostViewControllerSession delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeShieldView");
      }

    }
  }

}

- (void)setState:(unint64_t)a3
{
  unint64_t state;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t signpost;
  APSubjectMonitorSubscription *subjectMonitorSubscription;
  APExtensionSubjectMonitorRegistry *subjectMonitorRegistry;
  id WeakRetained;
  void (**v16)(_QWORD);
  id invalidationHandler;
  NSXPCListener *hostListener;
  NSXPCConnection *sceneSessionConnection;
  _EXExtensionProcessHandle *extensionProcess;
  _EXRemoteViewController *remoteViewController;
  NSXPCListenerEndpoint *remoteViewControllerEndpoint;
  UIViewController *sceneViewController;
  _UISceneHostingController *hostingController;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  OS_os_activity *v35;
  OS_os_activity *osActivity;
  void *v37;
  id v38;
  NSObject *internalQueue;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  os_signpost_id_t v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  os_signpost_id_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  APExtensionSubjectMonitorRegistry *v55;
  APExtensionSubjectMonitorRegistry *v56;
  APSubjectMonitorSubscription *v57;
  APSubjectMonitorSubscription *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  os_signpost_id_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (**readyBlock)(id, uint64_t, uint64_t, uint64_t);
  id v69;
  NSObject *v70;
  _OWORD v71[2];
  _QWORD block[5];
  uint8_t buf[4];
  _EXHostViewControllerSession *v74;
  __int16 v75;
  unint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  state = self->_state;
  if (state == a3)
    return;
  if (state == 5)
  {
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a3 != 1)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v74 = self;
        v75 = 2048;
        v76 = a3;
        _os_log_impl(&dword_20AE73000, v7, OS_LOG_TYPE_DEFAULT, "Attempted transition of invalidated session %{public}@ to state %lu", buf, 0x16u);
      }

      return;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[_EXHostViewControllerSession setState:].cold.1();

    __break(1u);
    goto LABEL_69;
  }
  self->_state = a3;
  if (a3 == 5)
  {
    _EXSignpostLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (self->_signpost && os_signpost_enabled(v8))
    {
      v10 = v9;
      v11 = v10;
      signpost = self->_signpost;
      if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20AE73000, v11, OS_SIGNPOST_EVENT, signpost, "extensionkit-lifecycle", "_EXHostSessionStateInvalidated", buf, 2u);
      }

    }
    -[APSubjectMonitorSubscription invalidate](self->_subjectMonitorSubscription, "invalidate");
    subjectMonitorSubscription = self->_subjectMonitorSubscription;
    self->_subjectMonitorSubscription = 0;

    -[APExtensionSubjectMonitorRegistry invalidate](self->_subjectMonitorRegistry, "invalidate");
    subjectMonitorRegistry = self->_subjectMonitorRegistry;
    self->_subjectMonitorRegistry = 0;

    self->_isLocked = 0;
    -[_EXExtensionProcessHandle removeObserver:](self->_extensionProcess, "removeObserver:", self);
    -[NSXPCListener invalidate](self->_hostListener, "invalidate");
    -[NSXPCConnection invalidate](self->_sceneSessionConnection, "invalidate");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "hostSessionDidInvalidate:", self);

    v16 = (void (**)(_QWORD))_Block_copy(self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    if (v16)
      v16[2](v16);
    hostListener = self->_hostListener;
    self->_hostListener = 0;

    sceneSessionConnection = self->_sceneSessionConnection;
    self->_sceneSessionConnection = 0;

    extensionProcess = self->_extensionProcess;
    self->_extensionProcess = 0;

    objc_storeWeak((id *)&self->_delegate, 0);
    remoteViewController = self->_remoteViewController;
    self->_remoteViewController = 0;

    remoteViewControllerEndpoint = self->_remoteViewControllerEndpoint;
    self->_remoteViewControllerEndpoint = 0;

    sceneViewController = self->_sceneViewController;
    self->_sceneViewController = 0;

    hostingController = self->_hostingController;
    self->_hostingController = 0;

    _EXSignpostLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (self->_signpost && os_signpost_enabled(v25))
    {
      v27 = v26;
      v28 = v27;
      v29 = self->_signpost;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20AE73000, v28, OS_SIGNPOST_INTERVAL_END, v29, "extensionkit-lifecycle", "invalidated", buf, 2u);
      }

    }
    self->_signpost = 0;
    os_activity_scope_leave(&self->_activity.state);
    goto LABEL_23;
  }
  self->_maxState = a3;
  if (a3 != 1 || state)
  {
    if (a3 != 2 || state != 1)
    {
      if (a3 == 3 && state == 2)
      {
        _EXSignpostLog();
        v46 = objc_claimAutoreleasedReturnValue();
        v16 = (void (**)(_QWORD))v46;
        if (self->_signpost && os_signpost_enabled(v46))
        {
          v47 = v16;
          v48 = v47;
          v49 = self->_signpost;
          if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_20AE73000, v48, OS_SIGNPOST_EVENT, v49, "extensionkit-lifecycle", "_EXHostSessionStateViewControllerRequested", buf, 2u);
          }

        }
      }
      else
      {
        if (a3 != 4 || state != 3)
        {
LABEL_69:
          _EXDefaultLog();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
            -[_EXHostViewControllerSession setState:].cold.2();

          __break(1u);
          return;
        }
        v50 = objc_alloc(MEMORY[0x24BE04300]);
        -[_EXHostViewControllerSession extensionProcess](self, "extensionProcess");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "extensionIdentity");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[_EXHostViewControllerSession extensionProcess](self, "extensionProcess");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (v53)
          objc_msgSend(v53, "auditToken");
        else
          memset(v71, 0, sizeof(v71));
        v16 = (void (**)(_QWORD))objc_msgSend(v50, "initWithExtensionIdentity:auditToken:", v52, v71);

        v55 = (APExtensionSubjectMonitorRegistry *)objc_msgSend(objc_alloc(MEMORY[0x24BE04308]), "initWithExtensionSubject:", v16);
        v56 = self->_subjectMonitorRegistry;
        self->_subjectMonitorRegistry = v55;

        -[APExtensionSubjectMonitorRegistry addMonitor:](self->_subjectMonitorRegistry, "addMonitor:", self);
        v57 = (APSubjectMonitorSubscription *)objc_claimAutoreleasedReturnValue();
        v58 = self->_subjectMonitorSubscription;
        self->_subjectMonitorSubscription = v57;

        -[APExtensionSubjectMonitorRegistry resume](self->_subjectMonitorRegistry, "resume");
        self->_isLocked = objc_msgSend(v16, "isEffectivelyLocked");
        _EXSignpostLog();
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = v59;
        if (self->_signpost && os_signpost_enabled(v59))
        {
          v61 = v60;
          v62 = v61;
          v63 = self->_signpost;
          if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_20AE73000, v62, OS_SIGNPOST_EVENT, v63, "extensionkit-lifecycle", "_EXHostSessionStateViewControllerReady", buf, 2u);
          }

        }
        v64 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v64, "hostSessionViewControllerReady:", self);

        readyBlock = (void (**)(id, uint64_t, uint64_t, uint64_t))self->_readyBlock;
        if (readyBlock)
        {
          readyBlock[2](readyBlock, v65, v66, v67);
          v69 = self->_readyBlock;
          self->_readyBlock = 0;

        }
      }
LABEL_23:

      return;
    }
    _EXSignpostLog();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (self->_signpost && os_signpost_enabled(v40))
    {
      v42 = v41;
      v43 = v42;
      v44 = self->_signpost;
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20AE73000, v43, OS_SIGNPOST_EVENT, v44, "extensionkit-lifecycle", "_EXHostSessionStatePrepared", buf, 2u);
      }

    }
    v45 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v45, "hostSessionDidPrepareForHosting:", self);

    if (self->_requiresFBSceneHosting)
      -[_EXHostViewControllerSession makeSceneHostViewController](self, "makeSceneHostViewController");
    else
      -[_EXHostViewControllerSession requestRemoteViewController](self, "requestRemoteViewController");
  }
  else
  {
    _EXSignpostLog();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (self->_signpost && os_signpost_enabled(v30))
    {
      v32 = v31;
      v33 = v32;
      v34 = self->_signpost;
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20AE73000, v33, OS_SIGNPOST_EVENT, v34, "extensionkit-lifecycle", "_EXHostSessionStatePreparing", buf, 2u);
      }

    }
    v35 = (OS_os_activity *)_os_activity_create(&dword_20AE73000, "View session", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    self->_activity.state.opaque[0] = 0;
    osActivity = self->_activity.osActivity;
    self->_activity.state.opaque[1] = 0;
    self->_activity.osActivity = v35;

    os_activity_scope_enter((os_activity_t)self->_activity.osActivity, &self->_activity.state);
    -[_EXHostViewControllerSessionConfiguration invalidationHandler](self->_configuration, "invalidationHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = self->_invalidationHandler;
    self->_invalidationHandler = v37;

    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41___EXHostViewControllerSession_setState___block_invoke;
    block[3] = &unk_24C3E3738;
    block[4] = self;
    dispatch_async(internalQueue, block);
  }
}

- (void)resume
{
  OUTLINED_FUNCTION_6_0(&dword_20AE73000, a2, a3, "%s - %s:%d: extension is nil for configuration: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)resumeWithReadyNotification:(id)a3
{
  void *v4;
  id readyBlock;

  v4 = _Block_copy(a3);
  readyBlock = self->_readyBlock;
  self->_readyBlock = v4;

  -[_EXHostViewControllerSession resume](self, "resume");
}

- (void)invalidate
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[_EXHostViewControllerSession setState:](self, "setState:", 5);
}

- (void)processDidInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  _QWORD block[4];
  void (**v10)(_QWORD);
  _QWORD aBlock[5];
  id v12;

  v4 = a3;
  _EXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_EXHostViewControllerSession processDidInvalidate:].cold.1(self, v5);

  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __53___EXHostViewControllerSession_processDidInvalidate___block_invoke;
  aBlock[3] = &unk_24C3E3760;
  aBlock[4] = self;
  v7 = v4;
  v12 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v8[2](v8);
  }
  else
  {
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __53___EXHostViewControllerSession_processDidInvalidate___block_invoke_2;
    block[3] = &unk_24C3E3788;
    v10 = v8;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
}

- (void)_invalidateSession
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extensionProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_20AE73000, a2, OS_LOG_TYPE_DEBUG, "The extension proceess '%{public}@' providing the UI did invalidate session: '%{public}@'", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_4_0();
}

- (void)_internalQueue_prepareToHost
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_20AE73000, log, OS_LOG_TYPE_FAULT, "Attempt to host remote user interface from non-UI extension point '%{public}@'", buf, 0xCu);

}

- (void)requestRemoteViewController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "Using legacy view services path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)makeSceneHostViewController
{
  os_log_t v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = "_requiresFBSceneHosting";
  v3 = 2080;
  v1 = 136315650;
  OUTLINED_FUNCTION_1();
  v4 = 755;
  _os_log_fault_impl(&dword_20AE73000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: Cannot vend a scene to an extension when the extension point does not require FBScene hosting", (uint8_t *)&v1, 0x1Cu);
  OUTLINED_FUNCTION_10();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  BOOL v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = (NSXPCListener *)a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v8 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (self->_hostListener == v6)
  {
    -[_EXHostViewControllerSession delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67___EXHostViewControllerSession_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_24C3E38E8;
    v15 = &v16;
    v13 = v9;
    v14 = v7;
    v10 = v9;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

    v8 = *((_BYTE *)v17 + 24) != 0;
  }
  _Block_object_dispose(&v16, 8);

  return v8;
}

- (void)clientIsReady
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "UISceneHostingController is ready", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (APExtensionSubjectMonitorRegistry)subjectMonitorRegistry
{
  return (APExtensionSubjectMonitorRegistry *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSubjectMonitorRegistry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (APSubjectMonitorSubscription)subjectMonitorSubscription
{
  return (APSubjectMonitorSubscription *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSubjectMonitorSubscription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (_UISceneHostingController)hostingController
{
  return (_UISceneHostingController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHostingController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (_EXRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (UIViewController)sceneViewController
{
  return self->_sceneViewController;
}

- (_EXHostViewControllerSessionDelegate)delegate
{
  return (_EXHostViewControllerSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)state
{
  return self->_state;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)requiresFBSceneHosting
{
  return self->_requiresFBSceneHosting;
}

- (NSXPCConnection)sceneSessionConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSceneSessionConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSXPCListener)hostListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHostListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (UIView)hostView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_hostView);
}

- (void)setHostView:(id)a3
{
  objc_storeWeak((id *)&self->_hostView, a3);
}

- (unint64_t)signpost
{
  return self->_signpost;
}

- (void)setSignpost:(unint64_t)a3
{
  self->_signpost = a3;
}

- (id)readyBlock
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setReadyBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 136, 1);
}

- ($80EAFF0CD8238926FA3B8E6E6D99B750)activity
{
  $80EAFF0CD8238926FA3B8E6E6D99B750 *result;

  objc_copyCppObjectAtomic(retstr, &self->_activity, (void (__cdecl *)(void *, const void *))__copy_constructor_8_8_t0w16_s16);
  return result;
}

- (void)setActivity:(id *)a3
{
  objc_copyCppObjectAtomic(&self->_activity, a3, (void (__cdecl *)(void *, const void *))__move_assignment_8_8_t0w16_s16);
}

- (unint64_t)maxState
{
  return self->_maxState;
}

- (void)setMaxState:(unint64_t)a3
{
  self->_maxState = a3;
}

- (_EXHostConfiguration)processConfiguration
{
  return self->_processConfiguration;
}

- (_EXHostViewControllerSessionConfiguration)configuration
{
  return self->_configuration;
}

- (_EXExtensionProcessHandle)extensionProcess
{
  return (_EXExtensionProcessHandle *)objc_getProperty(self, a2, 168, 1);
}

- (void)setExtensionProcess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (BOOL)detached
{
  return self->_detached;
}

- (void)setDetached:(BOOL)a3
{
  self->_detached = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (NSXPCListenerEndpoint)remoteViewControllerEndpoint
{
  return self->_remoteViewControllerEndpoint;
}

- (void)setRemoteViewControllerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewControllerEndpoint, a3);
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_remoteViewControllerEndpoint, 0);
  objc_storeStrong((id *)&self->_extensionProcess, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_processConfiguration, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_readyBlock, 0);
  objc_destroyWeak((id *)&self->_hostView);
  objc_storeStrong((id *)&self->_hostListener, 0);
  objc_storeStrong((id *)&self->_sceneSessionConnection, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_subjectMonitorSubscription, 0);
  objc_storeStrong((id *)&self->_subjectMonitorRegistry, 0);
}

- (void)_makeXPCConnectionWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_20AE73000, v0, v1, "Remote session XPC connection endpoint is nil, the extension probably exited.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)_makeXPCConnectionWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_20AE73000, v0, v1, "Remote view controller XPC connection endpoint is nil, the extension probably exited.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)appProtectionSubjectsChanged:(void *)a1 forSubscription:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extensionProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_20AE73000, a2, v6, "Extension was locked %@:", v7);

  OUTLINED_FUNCTION_4_0();
}

- (void)appProtectionSubjectsChanged:(void *)a1 forSubscription:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extensionProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_20AE73000, a2, v6, "Extension was unlocked %@:", v7);

  OUTLINED_FUNCTION_4_0();
}

- (void)setState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_0(&dword_20AE73000, v0, v1, "%s - %s:%d: Attempt to resume invalidated session %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)setState:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = 136316162;
  v4 = "false";
  v5 = 2080;
  OUTLINED_FUNCTION_1();
  v6 = 420;
  v7 = 2048;
  v8 = v0;
  v9 = 2048;
  v10 = v1;
  _os_log_fault_impl(&dword_20AE73000, v2, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unhandled state transition %lu -> %lu", (uint8_t *)&v3, 0x30u);
}

- (void)processDidInvalidate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extensionProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_20AE73000, a2, v4, "The extension proceess '%{public}@' providing the UI did invalidate", v5);

  OUTLINED_FUNCTION_10();
}

@end
