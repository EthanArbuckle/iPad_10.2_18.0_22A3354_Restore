@implementation AUAudioUnit_RemoteV2

- (AUAudioUnit_RemoteV2)initWithXPCService:()unique_ptr<AUHostingServiceClient componentDescription:(std:(AudioComponentDescription *)a4 :(OpaqueAudioComponentInstance *)a5 default_delete<AUHostingServiceClient>>)a3 instance:(id)a6 instanceUUID:(id *)a7 error:
{
  id v13;
  AUAudioUnit_RemoteV2 *v14;
  AUAudioUnit_RemoteV2 *v15;
  unique_ptr<AUHostingServiceClient, std::default_delete<AUHostingServiceClient>> *p_service;
  AUHostingServiceClient *v17;
  AUHostingServiceClient *value;
  uint64_t (***v19)();
  uint64_t v20;
  id v21;
  AUAudioUnit_RemoteV2 *v22;
  id v23;
  void *v24;
  void *v25;
  AUAudioUnit_RemoteV2 *v26;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  id to;
  id location;
  objc_super v37;
  AudioComponentDescription v38;
  uint64_t (**v39)();
  id v40;
  uint64_t (***v41)();
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v13 = a6;
  v38 = *a4;
  v37.receiver = self;
  v37.super_class = (Class)AUAudioUnit_RemoteV2;
  v14 = -[AUAudioUnit initWithComponentDescription:options:error:](&v37, sel_initWithComponentDescription_options_error_, &v38, 0, a7);
  v15 = v14;
  if (!v14)
    goto LABEL_10;
  p_service = &v14->_service;
  v17 = *(AUHostingServiceClient **)a3.__ptr_.__value_;
  *(_QWORD *)a3.__ptr_.__value_ = 0;
  std::unique_ptr<AUHostingServiceClient>::reset[abi:ne180100](&v14->_service.__ptr_.__value_, v17);
  -[AUAudioUnit_XPC _setComponentInstance:](v15, "_setComponentInstance:", a5);
  objc_storeStrong((id *)&v15->_auInstanceUUID, a6);
  objc_initWeak(&location, v15);
  value = p_service->__ptr_.__value_;
  objc_copyWeak(&to, &location);
  v41 = 0;
  v39 = &off_1E28FFD98;
  objc_moveWeak(&v40, &to);
  v41 = &v39;
  objc_destroyWeak(&to);
  AUHostingServiceClient::setInvalidationHandler(*((std::recursive_mutex **)value + 7), (uint64_t)&v39);
  v19 = v41;
  if (v41 == &v39)
  {
    v20 = 4;
    v19 = &v39;
    goto LABEL_6;
  }
  if (v41)
  {
    v20 = 5;
LABEL_6:
    (*v19)[v20]();
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__12165;
  v33 = __Block_byref_object_dispose__12166;
  v34 = 0;
  v21 = *((id *)p_service->__ptr_.__value_ + 5);
  v22 = v15;
  v23 = v21;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16CDE0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  SetAllowedClassesForAUAudioUnitHostXPCInterface(v24);
  objc_msgSend(v23, "setExportedInterface:", v24);
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setAudioUnit:", v22);
  objc_msgSend(v23, "setExportedObject:", v25);

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __92__AUAudioUnit_RemoteV2_initWithXPCService_componentDescription_instance_instanceUUID_error___block_invoke;
  v28[3] = &unk_1E29224E8;
  v28[4] = &v29;
  -[AUAudioUnit_XPC _doOpen:completion:](v22, "_doOpen:completion:", v23, v28);

  if (a7)
    *a7 = objc_retainAutorelease((id)v30[5]);
  v26 = v22;
  _Block_object_dispose(&v29, 8);

  objc_destroyWeak(&location);
LABEL_10:

  return v15;
}

- (id)auInstanceUUID
{
  return self->_auInstanceUUID;
}

- (void)dealloc
{
  AUHostingServiceClient *value;
  _QWORD *v4;
  uint64_t v5;
  objc_super v6;
  _BYTE v7[24];
  _BYTE *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  value = self->_service.__ptr_.__value_;
  v8 = 0;
  AUHostingServiceClient::setInvalidationHandler(*((std::recursive_mutex **)value + 7), (uint64_t)v7);
  v4 = v8;
  if (v8 == v7)
  {
    v5 = 4;
    v4 = v7;
    goto LABEL_5;
  }
  if (v8)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  v6.receiver = self;
  v6.super_class = (Class)AUAudioUnit_RemoteV2;
  -[AUAudioUnit_XPC dealloc](&v6, sel_dealloc);
}

- (id)_valueForProperty:(id)a3 error:(id *)a4
{
  -[AUAudioUnit_XPC _getValueForProperty:error:](self, "_getValueForProperty:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  +[AUAudioUnit keyPathsForValuesAffectingAllParameterValues](AUAudioUnit, "keyPathsForValuesAffectingAllParameterValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v8);

  if (v10)
  {
    -[AUAudioUnit_XPC _setState:forKey:error:](self, "_setState:forKey:error:", v12, v8, a5);
  }
  else
  {
    +[AUAudioUnitProperty propertyWithKey:](AUAudioUnitProperty, "propertyWithKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUAudioUnit_XPC _setValue:forProperty:error:](self, "_setValue:forProperty:error:", v12, v11, a5);

  }
}

- (BOOL)providesUserInterface
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  -[AUAudioUnit cachedViewController](self, "cachedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  +[AUAudioUnitProperty propertyWithKey:v2propID:scope:element:](AUAudioUnitProperty, "propertyWithKey:v2propID:scope:element:", CFSTR("_v2bridge_providesUserInterface"), 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  -[AUAudioUnit_XPC _getValueForProperty:error:](self, "_getValueForProperty:error:", v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v6, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)requestViewControllerWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auInstanceUUID, 0);
  std::unique_ptr<AUHostingServiceClient>::reset[abi:ne180100](&self->_service.__ptr_.__value_, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 125) = 0;
  return self;
}

- (uint64_t)initWithXPCService:componentDescription:instance:instanceUUID:error:
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (void)initWithXPCService:componentDescription:instance:instanceUUID:error:
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "didInvalidate");

}

- (id)initWithXPCService:componentDescription:instance:instanceUUID:error:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E28FFD98;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end
