@implementation _LABKDeviceManager

+ (id)availableDevices
{
  return (id)objc_msgSend(a1, "availableDevicesWithFailure:", 0);
}

+ (id)availableDevicesWithFailure:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LAAuthenticationBiometricMethodShim sharedInstance](_LAAuthenticationBiometricMethodShim, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "biometricMethodState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTouchID");

  if (v8)
  {
    +[_LABKDeviceDescriptor deviceDescriptorForType:](_LABKDeviceDescriptor, "deviceDescriptorForType:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  +[_LAAuthenticationBiometricMethodShim sharedInstance](_LAAuthenticationBiometricMethodShim, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "biometricMethodState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isFaceID");

  if (v12)
  {
    +[_LABKDeviceDescriptor deviceDescriptorForType:](_LABKDeviceDescriptor, "deviceDescriptorForType:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

  }
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("-> %@"), v5);
  if (a3)
    *a3 = 0;
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

@end
