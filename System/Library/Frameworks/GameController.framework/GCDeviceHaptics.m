@implementation GCDeviceHaptics

- (CHHapticEngine)createEngineWithLocality:(GCHapticsLocality)locality
{
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  GCController **p_controller;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  int isInternalBuild;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  GCDeviceHaptics *v34;
  id *location;
  void *v36;
  void *v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  _QWORD v41[6];
  _QWORD v42[8];

  v42[6] = *MEMORY[0x24BDAC8D0];
  v4 = locality;
  if (v4 && -[NSMutableSet containsObject:](self->_supportedLocalities, "containsObject:", v4))
  {
    -[GCHapticCapabilityGraph nodes](self->_capabilityGraph, "nodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = GCCurrentProcessLinkedOnAfter(0x7E70901FFFFFFFFuLL) ^ 1;
    v42[0] = CFSTR("com.apple.GameController.gamecontrollerd.haptics");
    v41[0] = CFSTR("MachServiceName");
    v41[1] = CFSTR("actuators");
    v37 = v6;
    objc_msgSend(v6, "actuators");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](&off_254E12798, "archivedDataWithRootObject:requiringSecureCoding:error:", v36, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v8;
    v41[2] = CFSTR("controllerIdentifier");
    v34 = self;
    p_controller = &self->_controller;
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v11;
    v41[3] = CFSTR("persistentControllerIdentifier");
    v12 = objc_loadWeakRetained((id *)p_controller);
    objc_msgSend(v12, "persistentIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v13;
    v41[4] = CFSTR("controllerProductCategory");
    location = (id *)p_controller;
    v14 = objc_loadWeakRetained((id *)p_controller);
    objc_msgSend(v14, "productCategory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v15;
    v41[5] = CFSTR("shouldSquareContinuousIntensity");
    +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v16;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v42, v41, 6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v17;
        _os_log_impl(&dword_215181000, v31, OS_LOG_TYPE_DEFAULT, "Creating CHHapticEngine with options %@", buf, 0xCu);
      }

    }
    v38 = 0;
    v18 = (void *)objc_msgSend(objc_alloc((Class)&off_254DF6390), "initWithOptions:error:", v17, &v38);
    v19 = v38;
    isInternalBuild = gc_isInternalBuild();
    if (v19)
    {
      if (isInternalBuild)
      {
        getGCLogger();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[GCDeviceHaptics createEngineWithLocality:].cold.1((uint64_t)v17, (uint64_t)v19, v32);

      }
      +[GCAnalytics instance](GCAnalytics, "instance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      currentProcessBundleIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_loadWeakRetained(location);
      objc_msgSend(v23, "productCategory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sendHapticsErrorRaisedEventFromSource:productCategory:errorType:", v22, v24, CFSTR("CHHapticEngineCreationFailure"));

      v25 = 0;
    }
    else
    {
      if (isInternalBuild)
      {
        getGCLogger();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v18;
          _os_log_impl(&dword_215181000, v33, OS_LOG_TYPE_DEFAULT, "Created CHHapticEngine %@", buf, 0xCu);
        }

      }
      +[GCAnalytics instance](GCAnalytics, "instance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      currentProcessBundleIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[GCDeviceHaptics controller](v34, "controller");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "productCategory");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sendHapticsEngineCreatedEventForBundleID:productCategory:hapticsLocality:", v27, v29, v4);

      v25 = v18;
    }

  }
  else
  {
    v25 = 0;
  }

  return (CHHapticEngine *)v25;
}

- (NSSet)supportedLocalities
{
  return &self->_supportedLocalities->super;
}

- (void)setSupportedLocalities:(id)a3
{
  objc_storeStrong((id *)&self->_supportedLocalities, a3);
}

- (GCController)controller
{
  return (GCController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_supportedLocalities, 0);
  objc_storeStrong((id *)&self->_capabilityGraph, 0);
}

- (GCDeviceHaptics)initWithCapabilityGraph:(id)a3
{
  id v5;
  GCDeviceHaptics *v6;
  GCDeviceHaptics *v7;
  void *v8;
  uint64_t v9;
  NSMutableSet *supportedLocalities;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCDeviceHaptics;
  v6 = -[GCDeviceHaptics init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_capabilityGraph, a3);
    objc_msgSend(v5, "exposedCapabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    supportedLocalities = v7->_supportedLocalities;
    v7->_supportedLocalities = (NSMutableSet *)v9;

  }
  return v7;
}

- (GCHapticCapabilityGraph)capabilityGraph
{
  return self->_capabilityGraph;
}

- (void)createEngineWithLocality:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_215181000, log, OS_LOG_TYPE_ERROR, "Error creating CHHapticEngine with options %@ - %@", (uint8_t *)&v3, 0x16u);
}

@end
