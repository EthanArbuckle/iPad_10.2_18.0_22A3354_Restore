@implementation ARTechniqueService

- (ARTechniqueService)initWithConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ARTechniqueService *v7;
  objc_super v9;

  v4 = a3;
  ARRemoteTechniqueServiceInterfaceWithProtocol();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ARRemoteTechniqueClientInterfaceWithProtocol();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)ARTechniqueService;
  v7 = -[ARDaemonService initWithConnection:exportedInterface:remoteObjectInterface:](&v9, sel_initWithConnection_exportedInterface_remoteObjectInterface_, v4, v5, v6);

  if (v7)
    -[ARTechniqueService _initCommon:](v7, "_initCommon:", v4);

  return v7;
}

- (ARTechniqueService)initWithConnection:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5
{
  id v8;
  ARTechniqueService *v9;
  ARTechniqueService *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARTechniqueService;
  v9 = -[ARDaemonService initWithConnection:exportedInterface:remoteObjectInterface:](&v12, sel_initWithConnection_exportedInterface_remoteObjectInterface_, v8, a4, a5);
  v10 = v9;
  if (v9)
    -[ARTechniqueService _initCommon:](v9, "_initCommon:", v8);

  return v10;
}

- (void)_initCommon:(id)a3
{
  ARRemoteTechniqueClient *v4;
  ARRemoteTechniqueClient *clientProxy;

  objc_msgSend(a3, "remoteObjectProxy");
  v4 = (ARRemoteTechniqueClient *)objc_claimAutoreleasedReturnValue();
  clientProxy = self->_clientProxy;
  self->_clientProxy = v4;

  -[ARDaemonService setActive:](self, "setActive:", 0);
}

- (void)invalidationHandler
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ARTechniqueService;
  -[ARDaemonService invalidationHandler](&v2, sel_invalidationHandler);
}

- (void)interruptionHandler
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ARTechniqueService;
  -[ARDaemonService interruptionHandler](&v2, sel_interruptionHandler);
}

- (void)isActiveWithReply:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, BOOL, _QWORD))a3 + 2))(v5, -[ARDaemonService isActive](self, "isActive"), 0);

}

- (void)captureBehaviorWithReply:(id)a3
{
  ARTechnique *technique;
  void (**v4)(id, uint64_t, _QWORD);

  technique = self->_technique;
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v4[2](v4, -[ARTechnique captureBehavior](technique, "captureBehavior"), 0);

}

- (void)numberOfActiveConnectionsWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  void (**v6)(id, uint64_t, _QWORD);

  v6 = (void (**)(id, uint64_t, _QWORD))a3;
  -[ARDaemonService dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfActiveConnectionsForService:", self);

  v6[2](v6, v5, 0);
}

- (void)prepare:(BOOL)a3
{
  -[ARTechnique prepare:](self->_technique, "prepare:", a3);
}

- (id)processData:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  ARTechniqueService *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[ARDaemonService isActive](self, "isActive"))
  {
    -[ARTechnique processData:](self->_technique, "processData:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ARLogDaemon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2048;
      v14 = self;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_235C46000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Service not active; skipping processing of data: %@",
        (uint8_t *)&v11,
        0x20u);

    }
    v5 = v4;
  }
  v9 = v5;

  return v9;
}

- (void)processData:(id)a3 reply:(id)a4
{
  void (**v6)(id, id, _QWORD);
  id v7;

  v6 = (void (**)(id, id, _QWORD))a4;
  -[ARTechniqueService processData:](self, "processData:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);

}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  ARTechniqueService *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[ARDaemonService isActive](self, "isActive"))
  {
    -[ARTechnique requestResultDataAtTimestamp:context:](self->_technique, "requestResultDataAtTimestamp:context:", v6, a3);
  }
  else
  {
    _ARLogDaemon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v9;
      v12 = 2048;
      v13 = self;
      v14 = 2048;
      v15 = a3;
      _os_log_impl(&dword_235C46000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Service not active; skipping request for result data at timestamp: %f",
        (uint8_t *)&v10,
        0x20u);

    }
    -[ARRemoteTechniqueClient techniqueDidOutputResultData:timestamp:context:](self->_clientProxy, "techniqueDidOutputResultData:timestamp:context:", MEMORY[0x24BDBD1A8], v6, a3);
  }

}

- (void)requiredSensorDataTypesWithReply:(id)a3
{
  ARTechnique *technique;
  void (**v4)(id, uint64_t, _QWORD);

  technique = self->_technique;
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v4[2](v4, -[ARTechnique requiredSensorDataTypes](technique, "requiredSensorDataTypes"), 0);

}

- (void)requiredTimeIntervalWithReply:(id)a3
{
  ARTechnique *technique;
  void (**v4)(id, _QWORD);

  technique = self->_technique;
  v4 = (void (**)(id, _QWORD))a3;
  -[ARTechnique requiredTimeInterval](technique, "requiredTimeInterval");
  v4[2](v4, 0);

}

- (void)resultDataClassesWithReply:(id)a3
{
  ARTechnique *technique;
  void (**v4)(id, void *, _QWORD);
  void *v5;
  id v6;

  technique = self->_technique;
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[ARTechnique resultDataClasses](technique, "resultDataClasses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ar_map:", &__block_literal_global);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, 0);

}

NSString *__49__ARTechniqueService_resultDataClassesWithReply___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

+ (id)serviceName
{
  return &stru_250702C60;
}

- (void)technique:(id)a3 didFailWithError:(id)a4
{
  -[ARRemoteTechniqueClient techniqueDidFailWithError:](self->_clientProxy, "techniqueDidFailWithError:", a4);
}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6
{
  -[ARRemoteTechniqueClient techniqueDidOutputResultData:timestamp:context:](self->_clientProxy, "techniqueDidOutputResultData:timestamp:context:", a4, a6, a5);
}

- (ARRemoteTechniqueClient)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (ARTechnique)technique
{
  return self->_technique;
}

- (void)setTechnique:(id)a3
{
  objc_storeStrong((id *)&self->_technique, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_technique, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

@end
