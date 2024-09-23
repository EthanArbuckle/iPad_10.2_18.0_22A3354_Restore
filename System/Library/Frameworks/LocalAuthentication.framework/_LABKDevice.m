@implementation _LABKDevice

- (_LABKDevice)initWithDescriptor:(id)a3 error:(id *)a4
{
  id v8;
  _LABKDevice *v9;
  _LABKDevice *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  BKDevice *BKDevice;
  uint64_t v18;
  _LAAuthenticationBiometricMethodShim *shim;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_super v25;
  uint64_t v26;
  uint64_t v27;
  Class (*v28)(uint64_t);
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_LABKDevice;
  v9 = -[_LABKDevice init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptor, a3);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v11 = (void *)getBKDeviceDescriptorClass_softClass;
    v34 = getBKDeviceDescriptorClass_softClass;
    if (!getBKDeviceDescriptorClass_softClass)
    {
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __getBKDeviceDescriptorClass_block_invoke;
      v29 = &unk_1E70792C0;
      v30 = &v31;
      __getBKDeviceDescriptorClass_block_invoke((uint64_t)&v26);
      v11 = (void *)v32[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v31, 8);
    objc_msgSend(v12, "deviceDescriptorForType:", objc_msgSend(v8, "type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v14 = (void *)getBKDeviceClass_softClass;
    v34 = getBKDeviceClass_softClass;
    if (!getBKDeviceClass_softClass)
    {
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __getBKDeviceClass_block_invoke;
      v29 = &unk_1E70792C0;
      v30 = &v31;
      __getBKDeviceClass_block_invoke((uint64_t)&v26);
      v14 = (void *)v32[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v31, 8);
    objc_msgSend(v15, "deviceWithDescriptor:error:", v13, a4);
    v16 = objc_claimAutoreleasedReturnValue();
    BKDevice = v10->__BKDevice;
    v10->__BKDevice = (BKDevice *)v16;

    +[_LAAuthenticationBiometricMethodShim sharedInstance](_LAAuthenticationBiometricMethodShim, "sharedInstance");
    v18 = objc_claimAutoreleasedReturnValue();
    shim = v10->_shim;
    v10->_shim = (_LAAuthenticationBiometricMethodShim *)v18;

    v20 = objc_opt_class();
    -[_LABKDevice descriptor](v10, "descriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "type");
    -[_LABKDevice _BKDevice](v10, "_BKDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", v20, a2, CFSTR("-> deviceType:%d, BKDevice=%@"), v22, v23);

  }
  return v10;
}

+ (id)deviceWithDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  __objc2_class **v8;
  void *v9;

  v6 = a3;
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, &stru_1E707B3F8);
  v7 = objc_msgSend(v6, "type");
  if (v7 == 1)
  {
    v8 = off_1E7078930;
  }
  else
  {
    if (v7 != 2)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = off_1E7078928;
  }
  v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithDescriptor:error:", v6, a4);
LABEL_7:

  return v9;
}

- (id)identitiesWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, &stru_1E707B3F8);
  -[_LABKDevice shim](self, "shim");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "biometricMethod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEnrolled"))
  {
    v6 = (void *)objc_opt_new();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (BOOL)bioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v14;

  v14 = 0;
  v7 = -[_LABKDevice extendedBioLockoutState:forUser:error:](self, "extendedBioLockoutState:forUser:error:", &v14, *(_QWORD *)&a4, a5);
  if (v7)
  {
    v8 = 2;
    v9 = 4;
    v10 = 6;
    v11 = 7;
    if ((v14 & 0x40) == 0)
      v11 = 1;
    if ((v14 & 8) == 0)
      v10 = v11;
    if ((v14 & 4) == 0)
      v9 = v10;
    if ((v14 & 1) == 0)
      v8 = v9;
    if ((v14 & 2) != 0)
      v12 = 3;
    else
      v12 = v8;
    *a3 = v12;
    +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("-> %d"), *a3);
  }
  return v7;
}

- (BOOL)extendedBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  id v13;
  _Unwind_Exception *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  -[_LABKDevice shim](self, "shim", a3, *(_QWORD *)&a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "biometricMethodState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *a3 = 0;
    if ((objc_msgSend(v8, "lockoutState") & 4) != 0)
      *a3 |= 4uLL;
    if ((objc_msgSend(v8, "lockoutState") & 2) != 0)
      *a3 |= 2uLL;
    if ((objc_msgSend(v8, "lockoutState") & 1) != 0)
      *a3 |= 1uLL;
    if ((objc_msgSend(v8, "lockoutState") & 0x10) != 0)
      *a3 |= 0x40uLL;
    if ((objc_msgSend(v8, "lockoutState") & 8) != 0)
      *a3 |= 0x10uLL;
    *a3 = objc_msgSend(v8, "lockoutState");
  }
  else if (a5)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v10 = (id *)getBKErrorDomainSymbolLoc_ptr;
    v19 = getBKErrorDomainSymbolLoc_ptr;
    if (!getBKErrorDomainSymbolLoc_ptr)
    {
      v11 = (void *)BiometricKitLibrary();
      v10 = (id *)dlsym(v11, "BKErrorDomain");
      v17[3] = (uint64_t)v10;
      getBKErrorDomainSymbolLoc_ptr = (uint64_t)v10;
    }
    _Block_object_dispose(&v16, 8);
    if (!v10)
    {
      v15 = (_Unwind_Exception *)_LAMKBLockDevice_cold_1();
      _Block_object_dispose(&v16, 8);
      _Unwind_Resume(v15);
    }
    v12 = *v10;
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v12, 1, 0, v16);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    *a5 = v13;
  }

  return v8 != 0;
}

- (id)createMatchOperationWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("override"));
  -[_LABKDevice _BKDevice](self, "_BKDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createMatchOperationWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[_LABKOperation _wrapperForBKOperation:device:](_LABKOperation, "_wrapperForBKOperation:device:", v6, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)createPresenceDetectOperationWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("override"));
  -[_LABKDevice _BKDevice](self, "_BKDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createPresenceDetectOperationWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[_LABKOperation _wrapperForBKOperation:device:](_LABKOperation, "_wrapperForBKOperation:device:", v6, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a3, CFSTR("forwarding to BK"));
  return -[_LABKDevice _BKDevice](self, "_BKDevice");
}

- (BKDevice)_BKDevice
{
  return self->__BKDevice;
}

- (BKDeviceDescriptor)descriptor
{
  return self->_descriptor;
}

- (_LAAuthenticationBiometricMethodShim)shim
{
  return self->_shim;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shim, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->__BKDevice, 0);
}

@end
