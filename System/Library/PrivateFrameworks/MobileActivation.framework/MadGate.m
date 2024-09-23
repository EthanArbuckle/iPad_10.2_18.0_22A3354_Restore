@implementation MadGate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (MadGate)init
{
  MadGate *v2;
  id v3;
  uint64_t v4;
  NSXPCConnection *connection;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MadGate;
  v2 = -[MadGate init](&v7, sel_init);
  if (v2)
  {
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFF00C90);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mobileactivationd"), 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v3);
    -[NSXPCConnection resume](v2->_connection, "resume");

  }
  return v2;
}

- (void)dealloc
{
  NSXPCConnection *v3;
  objc_super v4;

  v3 = -[MadGate connection](self, "connection");
  -[NSXPCConnection invalidate](v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)MadGate;
  -[MadGate dealloc](&v4, sel_dealloc);
}

- (id)getActivationState:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __30__MadGate_getActivationState___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);

  v11[0] = v5;
  v11[1] = 3254779904;
  v11[2] = __30__MadGate_getActivationState___block_invoke_91;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v6, "getActivationStateWithCompletionBlock:", v11);
  if (v14[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    v26 = v7;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v8 = (void *)v20[5];
  }
  v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

void __30__MadGate_getActivationState___block_invoke_91(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ActivationState"));
  v8 = isNSString(v7);

  if (v8)
  {
    v9 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ActivationState"));
    v10 = objc_msgSend(v9, "copy");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;

}

- (id)getUCRTActivationLockState:(id *)a3
{
  id v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = createMobileActivationError((uint64_t)"-[MadGate getUCRTActivationLockState:]", 59, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, 0, CFSTR("SPI not supported on iOS."));
  if (v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
  if (a3)
    *a3 = objc_retainAutorelease(v4);

  return 0;
}

void __30__MadGate_getActivationState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate getActivationState:]_block_invoke", 91, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)getActivationBuild:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __30__MadGate_getActivationBuild___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);

  v11[0] = v5;
  v11[1] = 3254779904;
  v11[2] = __30__MadGate_getActivationBuild___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v6, "getActivationBuildWithCompletionBlock:", v11);
  if (v14[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    v26 = v7;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v8 = (void *)v20[5];
  }
  v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __30__MadGate_getActivationBuild___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate getActivationBuild:]_block_invoke", 122, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __30__MadGate_getActivationBuild___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LastActivated"));
  v8 = isNSString(v7);

  if (v8)
  {
    v9 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LastActivated"));
    v10 = objc_msgSend(v9, "copy");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;

}

- (BOOL)isUCRTAvailable:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __27__MadGate_isUCRTAvailable___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);

  v11[0] = v5;
  v11[1] = 3254779904;
  v11[2] = __27__MadGate_isUCRTAvailable___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v6, "copyUCRTWithCompletionBlock:", v11);
  if (v14[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    v24 = v7;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v8 = *((unsigned __int8 *)v20 + 24);
  if (a3 && !*((_BYTE *)v20 + 24))
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v8 = *((unsigned __int8 *)v20 + 24);
  }
  v9 = v8 != 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

void __27__MadGate_isUCRTAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate isUCRTAvailable:]_block_invoke", 154, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __27__MadGate_isUCRTAvailable___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = (id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("UCRTData"));
  v7 = isNSData(v6);

  if (v7)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (id)copyPCRTToken:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __25__MadGate_copyPCRTToken___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);

  v11[0] = v5;
  v11[1] = 3254779904;
  v11[2] = __25__MadGate_copyPCRTToken___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v6, "copyPCRTTokenWithCompletionBlock:", v11);
  if (v14[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    v26 = v7;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v8 = (void *)v20[5];
  }
  v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __25__MadGate_copyPCRTToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate copyPCRTToken:]_block_invoke", 186, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __25__MadGate_copyPCRTToken___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PCRTToken"));
  v8 = isNSString(v7);

  if (v8)
  {
    v9 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PCRTToken"));
    v10 = objc_msgSend(v9, "copy");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;

}

- (BOOL)isDeviceABrick:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __26__MadGate_isDeviceABrick___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);

  v11[0] = v5;
  v11[1] = 3254779904;
  v11[2] = __26__MadGate_isDeviceABrick___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v6, "isDeviceBrickedWithCompletionBlock:", v11);
  if (v14[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    v24 = v7;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v8 = *((unsigned __int8 *)v20 + 24);
  if (a3 && *((_BYTE *)v20 + 24))
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v8 = *((unsigned __int8 *)v20 + 24);
  }
  v9 = v8 != 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

void __26__MadGate_isDeviceABrick___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate isDeviceABrick:]_block_invoke", 219, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __26__MadGate_isDeviceABrick___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BrickState"));
  v8 = isNSNumber(v7);

  if (v8)
  {
    v9 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BrickState"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v9, "BOOLValue");

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

}

- (id)createTunnel1SessionInfo:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __36__MadGate_createTunnel1SessionInfo___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);

  v11[0] = v5;
  v11[1] = 3254779904;
  v11[2] = __36__MadGate_createTunnel1SessionInfo___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v6, "createTunnel1SessionInfoWithCompletionBlock:", v11);
  if (v14[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    v26 = v7;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v8 = (void *)v20[5];
  }
  v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __36__MadGate_createTunnel1SessionInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate createTunnel1SessionInfo:]_block_invoke", 251, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __36__MadGate_createTunnel1SessionInfo___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(a2, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (id)createTunnel1ActivationInfo:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSXPCConnection *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v10 = -[MadGate connection](self, "connection");
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3254779904;
  v18[2] = __53__MadGate_createTunnel1ActivationInfo_options_error___block_invoke;
  v18[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v18[4] = &v19;
  v12 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v10, "synchronousRemoteObjectProxyWithErrorHandler:", v18);

  v17[0] = v11;
  v17[1] = 3254779904;
  v17[2] = __53__MadGate_createTunnel1ActivationInfo_options_error___block_invoke_2;
  v17[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend(v12, "createTunnel1ActivationInfo:options:withCompletionBlock:", v8, v9, v17);
  if (v20[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v20[5];
    *(_DWORD *)buf = 138543362;
    v32 = v13;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v14 = (void *)v26[5];
  if (a5 && !v14)
  {
    *a5 = objc_retainAutorelease((id)v20[5]);
    v14 = (void *)v26[5];
  }
  v15 = v14;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

void __53__MadGate_createTunnel1ActivationInfo_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate createTunnel1ActivationInfo:options:error:]_block_invoke", 280, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __53__MadGate_createTunnel1ActivationInfo_options_error___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(a2, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (id)createActivationInfo:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __32__MadGate_createActivationInfo___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);

  v11[0] = v5;
  v11[1] = 3254779904;
  v11[2] = __32__MadGate_createActivationInfo___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v6, "createActivationInfoWithCompletionBlock:", v11);
  if (v14[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    v26 = v7;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v8 = (void *)v20[5];
  }
  v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __32__MadGate_createActivationInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate createActivationInfo:]_block_invoke", 309, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __32__MadGate_createActivationInfo___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(a2, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (BOOL)handleActivationInfo:(id)a3 withError:(id *)a4
{
  id v6;
  NSXPCConnection *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v7 = -[MadGate connection](self, "connection");
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3254779904;
  v14[2] = __42__MadGate_handleActivationInfo_withError___block_invoke;
  v14[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v14[4] = &v15;
  v9 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);

  v13[0] = v8;
  v13[1] = 3254779904;
  v13[2] = __42__MadGate_handleActivationInfo_withError___block_invoke_2;
  v13[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v13[4] = &v15;
  objc_msgSend(v9, "handleActivationInfo:withCompletionBlock:", v6, v13);
  v10 = v16[5];
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v16[5];
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a4)
      *a4 = objc_retainAutorelease((id)v16[5]);
  }

  _Block_object_dispose(&v15, 8);
  return v10 == 0;
}

void __42__MadGate_handleActivationInfo_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate handleActivationInfo:withError:]_block_invoke", 338, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __42__MadGate_handleActivationInfo_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (BOOL)handleActivationInfoWithSession:(id)a3 activationSignature:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSXPCConnection *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v10 = -[MadGate connection](self, "connection");
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3254779904;
  v17[2] = __69__MadGate_handleActivationInfoWithSession_activationSignature_error___block_invoke;
  v17[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v17[4] = &v18;
  v12 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);

  v16[0] = v11;
  v16[1] = 3254779904;
  v16[2] = __69__MadGate_handleActivationInfoWithSession_activationSignature_error___block_invoke_2;
  v16[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v16[4] = &v18;
  objc_msgSend(v12, "handleActivationInfoWithSession:activationSignature:completionBlock:", v8, v9, v16);
  v13 = v19[5];
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v19[5];
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a5)
      *a5 = objc_retainAutorelease((id)v19[5]);
  }

  _Block_object_dispose(&v18, 8);
  return v13 == 0;
}

void __69__MadGate_handleActivationInfoWithSession_activationSignature_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate handleActivationInfoWithSession:activationSignature:error:]_block_invoke", 368, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __69__MadGate_handleActivationInfoWithSession_activationSignature_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (BOOL)deactivateDevice:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3254779904;
  v11[2] = __28__MadGate_deactivateDevice___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);

  v10[0] = v5;
  v10[1] = 3254779904;
  v10[2] = __28__MadGate_deactivateDevice___block_invoke_2;
  v10[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v12;
  objc_msgSend(v6, "deactivateDeviceWithCompletionBlock:", v10);
  v7 = v13[5];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v13[5];
      *(_DWORD *)buf = 138543362;
      v19 = v8;
      _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a3)
      *a3 = objc_retainAutorelease((id)v13[5]);
  }

  _Block_object_dispose(&v12, 8);
  return v7 == 0;
}

void __28__MadGate_deactivateDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate deactivateDevice:]_block_invoke", 398, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __28__MadGate_deactivateDevice___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (BOOL)reactivateDevice:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3254779904;
  v11[2] = __28__MadGate_reactivateDevice___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);

  v10[0] = v5;
  v10[1] = 3254779904;
  v10[2] = __28__MadGate_reactivateDevice___block_invoke_2;
  v10[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v12;
  objc_msgSend(v6, "requestDeviceReactivationWithCompletionBlock:", v10);
  v7 = v13[5];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v13[5];
      *(_DWORD *)buf = 138543362;
      v19 = v8;
      _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a3)
      *a3 = objc_retainAutorelease((id)v13[5]);
  }

  _Block_object_dispose(&v12, 8);
  return v7 == 0;
}

void __28__MadGate_reactivateDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate reactivateDevice:]_block_invoke", 428, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __28__MadGate_reactivateDevice___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (id)copyActivationRecord:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __32__MadGate_copyActivationRecord___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);

  v11[0] = v5;
  v11[1] = 3254779904;
  v11[2] = __32__MadGate_copyActivationRecord___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v6, "copyActivationRecordWithCompletionBlock:", v11);
  if (v14[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    v26 = v7;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v8 = (void *)v20[5];
  }
  v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __32__MadGate_copyActivationRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate copyActivationRecord:]_block_invoke", 458, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __32__MadGate_copyActivationRecord___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(a2, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (BOOL)unbrickDevice:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3254779904;
  v11[2] = __25__MadGate_unbrickDevice___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);

  v10[0] = v5;
  v10[1] = 3254779904;
  v10[2] = __25__MadGate_unbrickDevice___block_invoke_2;
  v10[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v12;
  objc_msgSend(v6, "unbrickDeviceWithCompletionBlock:", v10);
  v7 = v13[5];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v13[5];
      *(_DWORD *)buf = 138543362;
      v19 = v8;
      _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a3)
      *a3 = objc_retainAutorelease((id)v13[5]);
  }

  _Block_object_dispose(&v12, 8);
  return v7 == 0;
}

void __25__MadGate_unbrickDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate unbrickDevice:]_block_invoke", 487, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __25__MadGate_unbrickDevice___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (BOOL)recertifyDeviceWithError:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3254779904;
  v11[2] = __36__MadGate_recertifyDeviceWithError___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);

  v10[0] = v5;
  v10[1] = 3254779904;
  v10[2] = __36__MadGate_recertifyDeviceWithError___block_invoke_2;
  v10[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v12;
  objc_msgSend(v6, "recertifyDeviceWithCompletionBlock:", v10);
  v7 = v13[5];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v13[5];
      *(_DWORD *)buf = 138543362;
      v19 = v8;
      _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a3)
      *a3 = objc_retainAutorelease((id)v13[5]);
  }

  _Block_object_dispose(&v12, 8);
  return v7 == 0;
}

void __36__MadGate_recertifyDeviceWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate recertifyDeviceWithError:]_block_invoke", 517, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __36__MadGate_recertifyDeviceWithError___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (id)issueClientCertificateLegacy:(id)a3 error:(id *)a4
{
  id v6;
  NSXPCConnection *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v7 = -[MadGate connection](self, "connection");
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3254779904;
  v15[2] = __46__MadGate_issueClientCertificateLegacy_error___block_invoke;
  v15[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v15[4] = &v16;
  v9 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);

  v14[0] = v8;
  v14[1] = 3254779904;
  v14[2] = __46__MadGate_issueClientCertificateLegacy_error___block_invoke_2;
  v14[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v9, "issueClientCertificateLegacy:WithCompletionBlock:", v6, v14);
  if (v17[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v17[5];
    *(_DWORD *)buf = 138543362;
    v29 = v10;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v11 = (void *)v23[5];
  if (a4 && !v11)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v11 = (void *)v23[5];
  }
  v12 = v11;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __46__MadGate_issueClientCertificateLegacy_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate issueClientCertificateLegacy:error:]_block_invoke", 547, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __46__MadGate_issueClientCertificateLegacy_error___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = (id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("RKCertification"));
  v7 = isNSData(v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (BOOL)isInFieldCollected:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __30__MadGate_isInFieldCollected___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);

  v11[0] = v5;
  v11[1] = 3254779904;
  v11[2] = __30__MadGate_isInFieldCollected___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v6, "isInFieldCollectedWithCompletionBlock:", v11);
  if (v14[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    v24 = v7;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v8 = *((unsigned __int8 *)v20 + 24);
  if (a3 && !*((_BYTE *)v20 + 24))
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v8 = *((unsigned __int8 *)v20 + 24);
  }
  v9 = v8 != 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

void __30__MadGate_isInFieldCollected___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate isInFieldCollected:]_block_invoke", 576, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __30__MadGate_isInFieldCollected___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CollectionLastPerformed"));
  v8 = isNSNumber(v7);

  if (v8)
  {
    v9 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CollectionLastPerformed"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v9, "BOOLValue");

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

}

- (void)updateBasebandTicket:(__SecKey *)a3 baaCert:(__SecCertificate *)a4 baaIntermediateCert:(__SecCertificate *)a5 options:(id)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id *v15;
  id v16;
  id v17;
  CFDataRef v18;
  CFDataRef v19;
  NSXPCConnection *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  id obj;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  if (!a3 || !a4 || !a5)
  {
    v22 = createMobileActivationError((uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]", 618, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input(s)."));
    v16 = 0;
    v18 = 0;
    v14 = 0;
    v17 = 0;
    goto LABEL_12;
  }
  v14 = (void *)objc_msgSend(v12, "mutableCopy");
  v15 = (id *)(v35 + 5);
  obj = (id)v35[5];
  v33 = 0;
  v16 = security_create_external_representation(a3, &v33, &obj);
  v17 = v33;
  objc_storeStrong(v15, obj);
  if (!v16)
  {
    v22 = createMobileActivationError((uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]", 626, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, (void *)v35[5], CFSTR("Failed to encode RK as data."));
    v16 = 0;
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("SigningKeyAttributes"));
  v18 = SecCertificateCopyData(a4);
  if (!v18)
  {
    v22 = createMobileActivationError((uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]", 634, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy certificate data."));
    goto LABEL_11;
  }
  v19 = SecCertificateCopyData(a5);
  if (v19)
  {
    v20 = -[MadGate connection](self, "connection");
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3254779904;
    v29[2] = __83__MadGate_updateBasebandTicket_baaCert_baaIntermediateCert_options_withCompletion___block_invoke;
    v29[3] = &__block_descriptor_48_e8_32bs40r_e17_v16__0__NSError_8l;
    v31 = &v34;
    v21 = v13;
    v30 = v21;
    v25 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v20, "remoteObjectProxyWithErrorHandler:", v29);

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3254779904;
    v26[2] = __83__MadGate_updateBasebandTicket_baaCert_baaIntermediateCert_options_withCompletion___block_invoke_99;
    v26[3] = &__block_descriptor_56_e8_32s40bs48r_e34_v24__0__NSDictionary_8__NSError_16l;
    v28 = &v34;
    v26[4] = self;
    v27 = v21;
    objc_msgSend(v25, "updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:", v16, v18, v19, v14, v26);

    goto LABEL_17;
  }
  v22 = createMobileActivationError((uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]", 640, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy certificate data."));
LABEL_12:
  v23 = (void *)v35[5];
  v35[5] = (uint64_t)v22;

  if (v35[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v24 = v35[5];
    *(_DWORD *)buf = 138543362;
    v41 = v24;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  if (v13)
    (*((void (**)(id, _QWORD, uint64_t))v13 + 2))(v13, 0, v35[5]);
LABEL_17:

  _Block_object_dispose(&v34, 8);
}

uint64_t __83__MadGate_updateBasebandTicket_baaCert_baaIntermediateCert_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = createMobileActivationError((uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]_block_invoke", 648, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

void __83__MadGate_updateBasebandTicket_baaCert_baaIntermediateCert_options_withCompletion___block_invoke_99(uint64_t a1, int a2, id a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v9, 0xCu);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "connection");
  objc_msgSend(v8, "invalidate");

}

- (id)getDCRTState:(id)a3 withError:(id *)a4
{
  id v6;
  NSXPCConnection *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v7 = -[MadGate connection](self, "connection");
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3254779904;
  v15[2] = __34__MadGate_getDCRTState_withError___block_invoke;
  v15[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v15[4] = &v16;
  v9 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);

  v14[0] = v8;
  v14[1] = 3254779904;
  v14[2] = __34__MadGate_getDCRTState_withError___block_invoke_2;
  v14[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v9, "getDCRTStateWithCompletionBlock:withCompletion:", v6, v14);
  if (v17[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v17[5];
    *(_DWORD *)buf = 138543362;
    v29 = v10;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v11 = (void *)v23[5];
  if (a4 && !v11)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v11 = (void *)v23[5];
  }
  v12 = v11;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __34__MadGate_getDCRTState_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate getDCRTState:withError:]_block_invoke", 696, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __34__MadGate_getDCRTState_withError___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DCRTState"));
  v8 = isNSString(v7);

  if (v8)
  {
    v9 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DCRTState"));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;

}

- (id)copyDCRT:(id)a3 withError:(id *)a4
{
  id v6;
  NSXPCConnection *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v7 = -[MadGate connection](self, "connection");
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3254779904;
  v15[2] = __30__MadGate_copyDCRT_withError___block_invoke;
  v15[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v15[4] = &v16;
  v9 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);

  v14[0] = v8;
  v14[1] = 3254779904;
  v14[2] = __30__MadGate_copyDCRT_withError___block_invoke_2;
  v14[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v9, "copyDCRTWithCompletionBlock:withCompletion:", v6, v14);
  if (v17[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v17[5];
    *(_DWORD *)buf = 138543362;
    v29 = v10;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v11 = (void *)v23[5];
  if (a4 && !v11)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v11 = (void *)v23[5];
  }
  v12 = v11;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __30__MadGate_copyDCRT_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate copyDCRT:withError:]_block_invoke", 728, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __30__MadGate_copyDCRT_withError___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DCRTData"));
  v8 = isNSData(v7);

  if (v8)
  {
    v9 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DCRTData"));
    v10 = objc_msgSend(v9, "copy");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;

}

- (void)issueDCRT:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a3;
  v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  v21 = 0;
  v8 = -[MadGate connection](self, "connection");
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3254779904;
  v17[2] = __36__MadGate_issueDCRT_withCompletion___block_invoke;
  v17[3] = &__block_descriptor_48_e8_32bs40r_e17_v16__0__NSError_8l;
  v19 = v20;
  v10 = v7;
  v18 = v10;
  v11 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v8, "remoteObjectProxyWithErrorHandler:", v17);

  v13[0] = v9;
  v13[1] = 3254779904;
  v13[2] = __36__MadGate_issueDCRT_withCompletion___block_invoke_100;
  v13[3] = &__block_descriptor_64_e8_32s40bs48r56r_e34_v24__0__NSDictionary_8__NSError_16l;
  v15 = v22;
  v16 = v20;
  v12 = v10;
  v13[4] = self;
  v14 = v12;
  objc_msgSend(v11, "issueDCRT:withCompletionBlock:", v6, v13);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

}

uint64_t __36__MadGate_issueDCRT_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = createMobileActivationError((uint64_t)"-[MadGate issueDCRT:withCompletion:]_block_invoke", 763, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __36__MadGate_issueDCRT_withCompletion___block_invoke_100(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RKCertification"));
  v8 = isNSData(v7);

  if (v8)
  {
    v9 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RKCertification"));
    v10 = objc_msgSend(v9, "copy");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v16 = 138543362;
    v17 = v13;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v16, 0xCu);
  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v14 + 16))(v14, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "connection");
  objc_msgSend(v15, "invalidate");

}

- (BOOL)issueUCRT:(id)a3 withError:(id *)a4
{
  id v6;
  NSXPCConnection *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v7 = -[MadGate connection](self, "connection");
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3254779904;
  v14[2] = __31__MadGate_issueUCRT_withError___block_invoke;
  v14[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v14[4] = &v15;
  v9 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);

  v13[0] = v8;
  v13[1] = 3254779904;
  v13[2] = __31__MadGate_issueUCRT_withError___block_invoke_2;
  v13[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v13[4] = &v15;
  objc_msgSend(v9, "issueUCRT:withCompletionBlock:", v6, v13);
  v10 = v16[5];
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v16[5];
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a4)
      *a4 = objc_retainAutorelease((id)v16[5]);
  }

  _Block_object_dispose(&v15, 8);
  return v10 == 0;
}

void __31__MadGate_issueUCRT_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate issueUCRT:withError:]_block_invoke", 807, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __31__MadGate_issueUCRT_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (void)issueCollection:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSXPCConnection *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v8 = -[MadGate connection](self, "connection");
  v9 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __42__MadGate_issueCollection_withCompletion___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v10 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);

  v11[0] = v9;
  v11[1] = 3254779904;
  v11[2] = __42__MadGate_issueCollection_withCompletion___block_invoke_2;
  v11[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v13;
  objc_msgSend(v10, "issueCollection:withCompletionBlock:", v6, v11);
  v7[2](v7, v14[5]);

  _Block_object_dispose(&v13, 8);
}

void __42__MadGate_issueCollection_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate issueCollection:withCompletion:]_block_invoke", 836, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __42__MadGate_issueCollection_withCompletion___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (BOOL)ucrtUpgradeRequired:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __31__MadGate_ucrtUpgradeRequired___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);

  v11[0] = v5;
  v11[1] = 3254779904;
  v11[2] = __31__MadGate_ucrtUpgradeRequired___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v6, "ucrtUpgradeRequiredWithCompletionBlock:", v11);
  if (v14[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    v24 = v7;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v8 = *((unsigned __int8 *)v20 + 24);
  if (a3 && !*((_BYTE *)v20 + 24))
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v8 = *((unsigned __int8 *)v20 + 24);
  }
  v9 = v8 != 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

void __31__MadGate_ucrtUpgradeRequired___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate ucrtUpgradeRequired:]_block_invoke", 856, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __31__MadGate_ucrtUpgradeRequired___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UCRTUpgradeRequired"));
  v8 = isNSNumber(v7);

  if (v8)
  {
    v9 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UCRTUpgradeRequired"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v9, "BOOLValue");

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

}

- (__SecIdentity)copyLegacyDeviceIdentity:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  __SecIdentity *v7;
  SecKeyRef v8;
  SecCertificateRef v9;
  const __CFDictionary *v10;
  const __CFData *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[7];
  _QWORD v21[5];
  CFErrorRef error;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  error = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3254779904;
  v21[2] = __36__MadGate_copyLegacyDeviceIdentity___block_invoke;
  v21[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v21[4] = &v35;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v21);

  v20[0] = v5;
  v20[1] = 3254779904;
  v20[2] = __36__MadGate_copyLegacyDeviceIdentity___block_invoke_2;
  v20[3] = &__block_descriptor_56_e8_32r40r48r_e34_v24__0__NSDictionary_8__NSError_16l;
  v20[4] = &v29;
  v20[5] = &v23;
  v20[6] = &v35;
  objc_msgSend(v6, "copyLegacyDeviceIdentityWithCompletionBlock:", v20);
  if (!v36[5])
  {
    v11 = (const __CFData *)v30[5];
    if (v11 && v24[5])
    {
      v9 = SecCertificateCreateWithData(0, v11);
      if (v9)
      {
        v12 = *MEMORY[0x1E0CD6A70];
        v13 = *MEMORY[0x1E0CD69F8];
        v43[0] = *MEMORY[0x1E0CD6A38];
        v43[1] = v13;
        v14 = *MEMORY[0x1E0CD6A00];
        v44[0] = v12;
        v44[1] = v14;
        v10 = (const __CFDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
        v8 = SecKeyCreateWithData((CFDataRef)v24[5], v10, &error);
        if (v8)
        {
          v7 = (__SecIdentity *)SecIdentityCreate();
          if (v7)
            goto LABEL_12;
          v15 = createMobileActivationError((uint64_t)"-[MadGate copyLegacyDeviceIdentity:]", 938, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create identity."));
        }
        else
        {
          v15 = createMobileActivationError((uint64_t)"-[MadGate copyLegacyDeviceIdentity:]", 932, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to decode private key."));
          v8 = 0;
        }
LABEL_11:
        v17 = (void *)v36[5];
        v36[5] = (uint64_t)v15;

        v7 = 0;
        goto LABEL_12;
      }
      v16 = createMobileActivationError((uint64_t)"-[MadGate copyLegacyDeviceIdentity:]", 922, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to decode certificate."));
    }
    else
    {
      v16 = createMobileActivationError((uint64_t)"-[MadGate copyLegacyDeviceIdentity:]", 916, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid response."));
    }
    v15 = v16;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_11;
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
LABEL_12:
  if (v36[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v18 = v36[5];
    *(_DWORD *)buf = 138543362;
    v42 = v18;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  if (a3 && !v7)
    *a3 = objc_retainAutorelease((id)v36[5]);
  if (v9)
    CFRelease(v9);
  if (v8)
    CFRelease(v8);
  if (error)
    CFRelease(error);
  error = 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v7;
}

void __36__MadGate_copyLegacyDeviceIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate copyLegacyDeviceIdentity:]_block_invoke", 895, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __36__MadGate_copyLegacyDeviceIdentity___block_invoke_2(_QWORD *a1, id a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v5 = a2;
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LegacyDeviceIdentityCertificateDataBlob"));
  v8 = isNSData(v7);

  if (v8)
  {
    v9 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LegacyDeviceIdentityCertificateDataBlob"));
    v10 = objc_msgSend(v9, "copy");
    v11 = *(_QWORD *)(a1[4] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  v13 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LegacyDeviceIdentityPrivateKeyDataBlob"));
  v14 = isNSData(v13);

  if (v14)
  {
    v15 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LegacyDeviceIdentityPrivateKeyDataBlob"));
    v16 = objc_msgSend(v15, "copy");
    v17 = *(_QWORD *)(a1[5] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  v19 = *(_QWORD *)(a1[6] + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v6;

}

- (BOOL)deleteLegacyDeviceIdentity:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3254779904;
  v11[2] = __38__MadGate_deleteLegacyDeviceIdentity___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);

  v10[0] = v5;
  v10[1] = 3254779904;
  v10[2] = __38__MadGate_deleteLegacyDeviceIdentity___block_invoke_2;
  v10[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v12;
  objc_msgSend(v6, "deleteLegacyDeviceIdentityWithCompletionBlock:", v10);
  v7 = v13[5];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v13[5];
      *(_DWORD *)buf = 138543362;
      v19 = v8;
      _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    if (a3)
      *a3 = objc_retainAutorelease((id)v13[5]);
  }

  _Block_object_dispose(&v12, 8);
  return v7 == 0;
}

void __38__MadGate_deleteLegacyDeviceIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate deleteLegacyDeviceIdentity:]_block_invoke", 972, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __38__MadGate_deleteLegacyDeviceIdentity___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (id)copyUCRTVersionInfo:(id *)a3
{
  NSXPCConnection *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v4 = -[MadGate connection](self, "connection");
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __31__MadGate_copyUCRTVersionInfo___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);

  v11[0] = v5;
  v11[1] = 3254779904;
  v11[2] = __31__MadGate_copyUCRTVersionInfo___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v6, "copyUCRTVersionInfoWithCompletionBlock:", v11);
  if (v14[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    v26 = v7;
    _os_log_impl(&dword_1D4F3E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v8 = (void *)v20[5];
  }
  v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __31__MadGate_copyUCRTVersionInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = createMobileActivationError((uint64_t)"-[MadGate copyUCRTVersionInfo:]_block_invoke", 1002, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __31__MadGate_copyUCRTVersionInfo___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UCRTVersionInfo"));
  v8 = isNSDictionary(v7);

  if (v8)
  {
    v9 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UCRTVersionInfo"));
    v10 = objc_msgSend(v9, "copy");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;

}

@end
