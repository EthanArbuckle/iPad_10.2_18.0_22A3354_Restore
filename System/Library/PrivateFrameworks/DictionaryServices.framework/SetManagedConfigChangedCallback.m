@implementation SetManagedConfigChangedCallback

IMP __SetManagedConfigChangedCallback_block_invoke(uint64_t a1)
{
  objc_class *Class;
  BOOL v3;
  void (*v4)(void);
  _BOOL4 v5;
  IMP result;
  id v7;

  Class = objc_getClass("NSObject");
  SetManagedConfigChangedCallback__MyClass = (uint64_t)objc_allocateClassPair(Class, "DCSManagedConfigChangeReceiver", 0);
  v3 = class_addIvar((Class)SetManagedConfigChangedCallback__MyClass, "_callbackBlock", 8uLL, 3u, "@");
  objc_registerClassPair((Class)SetManagedConfigChangedCallback__MyClass);
  if (v3)
  {
    v4 = imp_implementationWithBlock(&__block_literal_global_2);
    v5 = class_addMethod((Class)SetManagedConfigChangedCallback__MyClass, sel_setCallbackBlock_, v4, "v@:@");
    result = imp_implementationWithBlock(&__block_literal_global_11);
    if (v5)
    {
      result = (IMP)class_addMethod((Class)SetManagedConfigChangedCallback__MyClass, sel_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo_, result, "v@:@@");
      if ((_DWORD)result)
      {
        SetManagedConfigChangedCallback__MyReceiverObj = (uint64_t)objc_msgSend((id)SetManagedConfigChangedCallback__MyClass, sel_new);
        v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), sel_sharedConnection);
        return (IMP)objc_msgSend(v7, sel_addObserver_, SetManagedConfigChangedCallback__MyReceiverObj);
      }
    }
  }
  else
  {
    if (SetManagedConfigChangedCallback__MyClass)
      objc_disposeClassPair((Class)SetManagedConfigChangedCallback__MyClass);
    SetManagedConfigChangedCallback__MyClass = 0;
    imp_implementationWithBlock(&__block_literal_global_2);
    return imp_implementationWithBlock(&__block_literal_global_11);
  }
  return result;
}

void __SetManagedConfigChangedCallback_block_invoke_2(uint64_t a1, void *a2, const void *a3)
{
  objc_ivar *InstanceVariable;
  id Ivar;
  void *v7;

  InstanceVariable = class_getInstanceVariable((Class)SetManagedConfigChangedCallback__MyClass, "_callbackBlock");
  Ivar = object_getIvar(a2, InstanceVariable);
  if (Ivar)

  v7 = _Block_copy(a3);
  object_setIvar(a2, InstanceVariable, v7);
}

uint64_t (**__SetManagedConfigChangedCallback_block_invoke_3(uint64_t a1, void *a2))(void)
{
  objc_ivar *InstanceVariable;
  uint64_t (**result)(void);

  InstanceVariable = class_getInstanceVariable((Class)SetManagedConfigChangedCallback__MyClass, "_callbackBlock");
  result = (uint64_t (**)(void))object_getIvar(a2, InstanceVariable);
  if (result)
    return (uint64_t (**)(void))result[2]();
  return result;
}

@end
