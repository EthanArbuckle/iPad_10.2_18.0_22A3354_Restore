@implementation _ANEDeviceController

- (void)start
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __29___ANEDeviceController_start__block_invoke;
  v2[3] = &unk_1E95164E8;
  v2[4] = self;
  v2[5] = a2;
  dispatch_sync((dispatch_queue_t)gANEControllerQueue, v2);
}

- (int64_t)usecount
{
  return self->_usecount;
}

- (void)setUsecount:(int64_t)a3
{
  self->_usecount = a3;
}

- (unint64_t)programHandle
{
  return self->_programHandle;
}

- (void)setDevice:(ANEDeviceStruct *)a3
{
  self->_device = a3;
}

- (BOOL)isPrivileged
{
  return self->_isPrivileged;
}

+ (_ANEDeviceController)controllerWithProgramHandle:(unint64_t)a3
{
  return (_ANEDeviceController *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithProgramHandle:priviledged:", a3, 0);
}

- (_ANEDeviceController)initWithProgramHandle:(unint64_t)a3 priviledged:(BOOL)a4
{
  _ANEDeviceController *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_ANEDeviceController;
  result = -[_ANEDeviceController init](&v7, sel_init);
  if (result)
  {
    result->_usecount = 0;
    result->_device = 0;
    result->_programHandle = a3;
    result->_isPrivileged = a4;
  }
  return result;
}

+ (id)sharedPrivilegedConnection
{
  if (+[_ANEDeviceController sharedPrivilegedConnection]::onceToken != -1)
    dispatch_once(&+[_ANEDeviceController sharedPrivilegedConnection]::onceToken, &__block_literal_global_2_1);
  return (id)+[_ANEDeviceController sharedPrivilegedConnection]::conn;
}

- (ANEDeviceStruct)device
{
  return self->_device;
}

+ (void)initialize
{
  if (+[_ANEDeviceController initialize]::onceToken != -1)
    dispatch_once(&+[_ANEDeviceController initialize]::onceToken, &__block_literal_global_5);
}

+ (_ANEDeviceController)new
{
  return 0;
}

- (_ANEDeviceController)init
{

  return 0;
}

+ (_ANEDeviceController)controllerWithPrivilegedVM:(BOOL)a3
{
  return (_ANEDeviceController *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithANEPrivilegedVM:", a3);
}

- (_ANEDeviceController)initWithANEPrivilegedVM:(BOOL)a3
{
  _ANEDeviceController *v4;
  NSObject *v5;
  void *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_ANEDeviceController;
  v4 = -[_ANEDeviceController init](&v8, sel_init, a3);
  if (v4)
  {
    +[_ANELog common](_ANELog, "common");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEDeviceController initWithANEPrivilegedVM:].cold.1();
    }

    os_unfair_lock_lock_with_options();
    v6 = (void *)dylib_handle;
    if (dylib_handle
      || (v6 = dlopen("/System/Library/PrivateFrameworks/ANEServices.framework/ANEServices", 4),
          (dylib_handle = (uint64_t)v6) != 0))
    {
      if (!factory_function_checkPrivilegedVMAccess)
        factory_function_checkPrivilegedVMAccess = dlsym(v6, "H11ANECheckPrivilegedVMAccess");
      os_unfair_lock_unlock((os_unfair_lock_t)&_sync_lock);
      if (factory_function_checkPrivilegedVMAccess)
        ((void (*)(void))factory_function_checkPrivilegedVMAccess)();
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&_sync_lock);
    }
  }
  return v4;
}

- (void)stop
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __28___ANEDeviceController_stop__block_invoke;
  v2[3] = &unk_1E95164E8;
  v2[4] = self;
  v2[5] = a2;
  dispatch_sync((dispatch_queue_t)gANEControllerQueue, v2);
}

- (void)initWithANEPrivilegedVM:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5();
  *(_DWORD *)v1 = 138412290;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, v3, (uint64_t)v3, "%@: ANEDeviceController calling ANECheckPrivilegedVMAccess", v4);

  OUTLINED_FUNCTION_2_0();
}

@end
