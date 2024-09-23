@implementation EDPersistenceHookRegistry

- (void)_initializeMethodSignatures
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  Protocol *v8;
  objc_method_description *v9;
  objc_method_description *v10;
  unint64_t v11;
  char **p_types;
  unint64_t v13;
  char **v14;
  unsigned int v15;
  unsigned int outCount;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = (void *)objc_msgSend((id)objc_opt_class(), "_proxiedProtocols");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(Protocol **)(*((_QWORD *)&v17 + 1) + 8 * i);
        outCount = -1431655766;
        v9 = protocol_copyMethodDescriptionList(v8, 1, 1, &outCount);
        v15 = -1431655766;
        v10 = protocol_copyMethodDescriptionList(v8, 0, 1, &v15);
        if (outCount)
        {
          v11 = 0;
          p_types = &v9->types;
          do
          {
            -[EDPersistenceHookRegistry _registerSelector:](self, "_registerSelector:", *(p_types - 1), *p_types);
            ++v11;
            p_types += 2;
          }
          while (v11 < outCount);
        }
        if (v15)
        {
          v13 = 0;
          v14 = &v10->types;
          do
          {
            -[EDPersistenceHookRegistry _registerSelector:](self, "_registerSelector:", *(v14 - 1), *v14);
            ++v13;
            v14 += 2;
          }
          while (v13 < v15);
        }
        if (v9)
          free(v9);
        if (v10)
          free(v10);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
}

- (void)_registerSelector:(objc_method_description)a3
{
  char *types;
  const char *name;
  void *v6;
  uint64_t v7;
  void (*v8)(void);
  objc_class *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  types = a3.types;
  name = a3.name;
  if (!a3.types)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceHookRegistry.m"), 119, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to initialize Hook Registry. Found no types for selector: %@"), NSStringFromSelector(a3.name)));
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
  v7 = objc_msgSend(v6, "numberOfArguments");
  if (v7 == 2)
  {
    v8 = (void (*)(void))__HookResponderCallOut0__;
LABEL_5:
    v9 = (objc_class *)objc_opt_class();
    class_addMethod(v9, name, v8, types);
  }
  else
  {
    v10 = v7;
    v11 = v7 - 3;
    if ((unint64_t)(v7 - 3) <= 3)
    {
      v12 = 2;
      while (1)
      {
        v13 = objc_msgSend(v6, "_classForObjectAtArgumentIndex:", v12);
        if (!(v13 | objc_msgSend(v6, "_protocolsForObjectAtArgumentIndex:", v12)))
          break;
        if (v10 == ++v12)
        {
          if (v11 >= 3)
            v8 = (void (*)(void))__HookResponderCallOut4__;
          else
            v8 = (void (*)(void))off_1E949F990[v11];
          goto LABEL_5;
        }
      }
      if (v10 == 4 && !strcmp((const char *)objc_msgSend(v6, "getArgumentTypeAtIndex:", 3), "B"))
      {
        v8 = (void (*)(void))__HookResponderCallOut1WithBool__;
        goto LABEL_5;
      }
    }
  }
  CFDictionarySetValue(self->_methodSignaturesBySelector, name, v6);
}

- (void)registerProtectedDataReconciliationHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCC2610);
}

- (void)_registerHookResponder:(id)a3 protocol:(id)a4
{
  objc_method_description *v8;
  objc_method_description *v9;
  unint64_t v10;
  objc_method_description *v11;
  unint64_t v12;
  objc_method_description *v13;
  unsigned int v14;
  unsigned int outCount;

  outCount = -1431655766;
  v8 = protocol_copyMethodDescriptionList((Protocol *)a4, 1, 1, &outCount);
  v14 = -1431655766;
  v9 = protocol_copyMethodDescriptionList((Protocol *)a4, 0, 1, &v14);
  os_unfair_lock_lock(&self->_lock);
  if (outCount)
  {
    v10 = 0;
    v11 = v8;
    do
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceHookRegistry.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[hookResponder respondsToSelector:requiredMethod]"));
      -[EDPersistenceHookRegistry _registerHookResponder:withMethodDescription:](self, "_registerHookResponder:withMethodDescription:", a3, v11->name, v11->types);
      ++v10;
      ++v11;
    }
    while (v10 < outCount);
  }
  if (v14)
  {
    v12 = 0;
    v13 = v9;
    do
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[EDPersistenceHookRegistry _registerHookResponder:withMethodDescription:](self, "_registerHookResponder:withMethodDescription:", a3, v13->name, v13->types);
      ++v12;
      ++v13;
    }
    while (v12 < v14);
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
    free(v8);
  if (v9)
    free(v9);
}

- (void)_registerHookResponder:(id)a3 withMethodDescription:(objc_method_description)a4
{
  SEL name;
  void *Value;

  name = a4.name;
  Value = (void *)CFDictionaryGetValue(self->_hookRespondersBySelector, a4.name);
  if (!Value)
  {
    Value = (void *)objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    CFDictionarySetValue(self->_hookRespondersBySelector, name, Value);
  }
  objc_msgSend(Value, "addObject:", a3);
}

- (void)registerMessageChangeHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCC1618);
}

- (void)registerMailboxChangeHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCCDB70);
}

- (void)registerThreadChangeHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCDADE0);
}

os_log_t __32__EDPersistenceHookRegistry_log__block_invoke(uint64_t a1)
{
  const char *v1;
  os_log_t result;

  v1 = -[NSString UTF8String](NSStringFromClass(*(Class *)(a1 + 32)), "UTF8String");
  result = os_log_create("com.apple.email", v1);
  log_log_66 = (uint64_t)result;
  return result;
}

- (void)_messageRespondersWithInvocation:(id)a3
{
  id v4;
  OS_os_log *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[EDPersistenceHookRegistry _copyRespondersForSelector:](self, "_copyRespondersForSelector:", objc_msgSend(a3, "selector"));
  v5 = +[EDPersistenceHookRegistry log](EDPersistenceHookRegistry, "log");
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG))
    -[EDPersistenceHookRegistry _messageRespondersWithInvocation:].cold.1(a3, (uint64_t)v4, v5);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D824B334]();
        objc_msgSend(a3, "invokeWithTarget:", v10);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)_copyRespondersForSelector:(SEL)a3
{
  os_unfair_lock_s *p_lock;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (id)objc_msgSend((id)CFDictionaryGetValue(self->_hookRespondersBySelector, a3), "setRepresentation");
  os_unfair_lock_unlock(p_lock);
  return v6;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__EDPersistenceHookRegistry_log__block_invoke;
  block[3] = &unk_1E949F970;
  block[4] = a1;
  if (log_onceToken_66 != -1)
    dispatch_once(&log_onceToken_66, block);
  return (OS_os_log *)log_log_66;
}

- (void)registerCloudStorageChangeHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCFBEF8);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EDPersistenceHookRegistry;
  return -[EDPersistenceHookRegistry respondsToSelector:](&v6, sel_respondsToSelector_)
      || CFDictionaryGetValue(self->_methodSignaturesBySelector, a3) != 0;
}

- (void)registerDatabaseChangeHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCE79F0);
}

- (void)registerOneTimeCodeChangeHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCD18C8);
}

- (void)registerAccountChangeHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCBF958);
}

- (void)registerActivityHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCBFCD8);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)CFDictionaryGetValue(self->_methodSignaturesBySelector, a3);
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)EDPersistenceHookRegistry;
    return -[EDPersistenceHookRegistry methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_, a3);
  }
  return result;
}

- (EDPersistenceHookRegistry)init
{
  EDPersistenceHookRegistry *v2;
  EDPersistenceHookRegistry *v3;
  const CFDictionaryValueCallBacks *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EDPersistenceHookRegistry;
  v2 = -[EDPersistenceHookRegistry init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    v2->_hookRespondersBySelector = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
    v3->_methodSignaturesBySelector = CFDictionaryCreateMutable(0, 0, 0, v4);
    -[EDPersistenceHookRegistry _initializeMethodSignatures](v3, "_initializeMethodSignatures");
  }
  return v3;
}

- (void)unregisterHookResponder:(id)a3
{
  void *v5;
  id context;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1D824B334](self, a2);
    os_unfair_lock_lock(&self->_lock);
    context = a3;
    CFDictionaryApplyFunction(self->_hookRespondersBySelector, (CFDictionaryApplierFunction)_unregistrationWalker, &context);
    os_unfair_lock_unlock(&self->_lock);
    objc_autoreleasePoolPop(v5);
  }
}

- (void)registerSenderBucketChangeHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCFC078);
}

+ (id)_proxiedProtocols
{
  _QWORD v3[16];

  v3[15] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1EFCBF958;
  v3[1] = &unk_1EFCBFCD8;
  v3[2] = &unk_1EFCFBEF8;
  v3[3] = &unk_1EFCE79F0;
  v3[4] = &unk_1EFCCDB70;
  v3[5] = &unk_1EFCC1618;
  v3[6] = &unk_1EFCC8C88;
  v3[7] = &unk_1EFCC2610;
  v3[8] = &unk_1EFCFBF58;
  v3[9] = &unk_1EFCDADE0;
  v3[10] = &unk_1EFCFBFB8;
  v3[11] = &unk_1EFCC8C08;
  v3[12] = &unk_1EFCFC018;
  v3[13] = &unk_1EFCD18C8;
  v3[14] = &unk_1EFCFC078;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 15);
}

- (void)dealloc
{
  __CFDictionary *hookRespondersBySelector;
  __CFDictionary *methodSignaturesBySelector;
  objc_super v5;

  hookRespondersBySelector = self->_hookRespondersBySelector;
  if (hookRespondersBySelector)
    CFRelease(hookRespondersBySelector);
  methodSignaturesBySelector = self->_methodSignaturesBySelector;
  if (methodSignaturesBySelector)
    CFRelease(methodSignaturesBySelector);
  v5.receiver = self;
  v5.super_class = (Class)EDPersistenceHookRegistry;
  -[EDPersistenceHookRegistry dealloc](&v5, sel_dealloc);
}

- (void)unregisterAllHookResponders
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFDictionaryRemoveAllValues(self->_hookRespondersBySelector);
  os_unfair_lock_unlock(p_lock);
}

- (void)registerSearchableIndexHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCFBF58);
}

- (void)registerCategoryChangeHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCC8C08);
}

- (void)registerBusinessChangeHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCFBFB8);
}

- (void)registerMessageDeliveryHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCC8C88);
}

- (void)registerBrandIndicatorChangeHookResponder:(id)a3
{
  -[EDPersistenceHookRegistry _registerHookResponder:protocol:](self, "_registerHookResponder:protocol:", a3, &unk_1EFCFC018);
}

- (void)_messageRespondersWithInvocation:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  NSString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138543618;
  v6 = NSStringFromSelector((SEL)objc_msgSend(a1, "selector"));
  v7 = 2114;
  v8 = a2;
}

@end
