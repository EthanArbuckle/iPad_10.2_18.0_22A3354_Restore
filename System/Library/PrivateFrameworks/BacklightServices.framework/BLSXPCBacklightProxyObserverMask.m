@implementation BLSXPCBacklightProxyObserverMask

+ (id)maskForObserver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObserver:", v4);

  return v5;
}

+ (id)maskForObservingDidCompleteUpdateToState:(BOOL)a3 observingEventsArray:(BOOL)a4 didChangeAlwaysOnEnabled:(BOOL)a5 activatingWithEvent:(BOOL)a6 deactivatingWithEvent:(BOOL)a7 performingEvent:(BOOL)a8
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithObservingDidCompleteUpdateToState:observingEventsArray:didChangeAlwaysOnEnabled:activatingWithEvent:deactivatingWithEvent:performingEvent:", a3, a4, a5, a6, a7, a8);
}

- (BLSXPCBacklightProxyObserverMask)initWithObservingDidCompleteUpdateToState:(BOOL)a3 observingEventsArray:(BOOL)a4 didChangeAlwaysOnEnabled:(BOOL)a5 activatingWithEvent:(BOOL)a6 deactivatingWithEvent:(BOOL)a7 performingEvent:(BOOL)a8
{
  BLSXPCBacklightProxyObserverMask *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BLSXPCBacklightProxyObserverMask;
  result = -[BLSXPCBacklightProxyObserverMask init](&v15, sel_init);
  if (result)
  {
    result->_observingDidCompleteUpdateToState = a3;
    result->_observingEventsArray = a4;
    result->_observingDidChangeAlwaysOnEnabled = a5;
    result->_observingActivatingWithEvent = a6;
    result->_observingDeactivatingWithEvent = a7;
    result->_observingPerformingEvent = a8;
  }
  return result;
}

- (BLSXPCBacklightProxyObserverMask)initWithObserver:(id)a3
{
  id v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  BLSXPCBacklightProxyObserverMask *v10;

  v4 = a3;
  v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) != 0)
    v6 = 1;
  else
    v6 = objc_opt_respondsToSelector();
  v7 = objc_opt_respondsToSelector();
  v8 = objc_opt_respondsToSelector();
  v9 = objc_opt_respondsToSelector();
  v10 = -[BLSXPCBacklightProxyObserverMask initWithObservingDidCompleteUpdateToState:observingEventsArray:didChangeAlwaysOnEnabled:activatingWithEvent:deactivatingWithEvent:performingEvent:](self, "initWithObservingDidCompleteUpdateToState:observingEventsArray:didChangeAlwaysOnEnabled:activatingWithEvent:deactivatingWithEvent:performingEvent:", v6 & 1, v5 & 1, v7 & 1, v8 & 1, v9 & 1, objc_opt_respondsToSelector() & 1);

  return v10;
}

- (BOOL)isObserving
{
  return self->_observingDidCompleteUpdateToState
      || self->_observingDidChangeAlwaysOnEnabled
      || self->_observingActivatingWithEvent
      || self->_observingDeactivatingWithEvent
      || self->_observingPerformingEvent;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_observingDidCompleteUpdateToState, CFSTR("didUpdateToState"), 1);
  v5 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_observingEventsArray, CFSTR("eventsArray"), 1);
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_observingDidChangeAlwaysOnEnabled, CFSTR("alwaysOnEnabled"), 1);
  v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_observingActivatingWithEvent, CFSTR("activating"), 1);
  v8 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_observingDeactivatingWithEvent, CFSTR("deactivating"), 1);
  v9 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_observingPerformingEvent, CFSTR("performingEvent"), 1);
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", self->_observingDidCompleteUpdateToState);
  v5 = (id)objc_msgSend(v3, "appendBool:", self->_observingEventsArray);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_observingDidChangeAlwaysOnEnabled);
  v7 = (id)objc_msgSend(v3, "appendBool:", self->_observingActivatingWithEvent);
  v8 = (id)objc_msgSend(v3, "appendBool:", self->_observingDeactivatingWithEvent);
  v9 = (id)objc_msgSend(v3, "appendBool:", self->_observingPerformingEvent);
  v10 = objc_msgSend(v3, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 observingDidCompleteUpdateToState;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 observingEventsArray;
  id v11;
  id v12;
  _BOOL8 observingDidChangeAlwaysOnEnabled;
  id v14;
  id v15;
  _BOOL8 observingActivatingWithEvent;
  id v17;
  id v18;
  _BOOL8 observingDeactivatingWithEvent;
  id v20;
  id v21;
  uint64_t observingPerformingEvent;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  observingDidCompleteUpdateToState = self->_observingDidCompleteUpdateToState;
  v7 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke;
  v39[3] = &unk_1E621ACF0;
  v8 = v4;
  v40 = v8;
  v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", observingDidCompleteUpdateToState, v39);
  observingEventsArray = self->_observingEventsArray;
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_2;
  v37[3] = &unk_1E621ACF0;
  v11 = v8;
  v38 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", observingEventsArray, v37);
  observingDidChangeAlwaysOnEnabled = self->_observingDidChangeAlwaysOnEnabled;
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_3;
  v35[3] = &unk_1E621ACF0;
  v14 = v11;
  v36 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", observingDidChangeAlwaysOnEnabled, v35);
  observingActivatingWithEvent = self->_observingActivatingWithEvent;
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_4;
  v33[3] = &unk_1E621ACF0;
  v17 = v14;
  v34 = v17;
  v18 = (id)objc_msgSend(v5, "appendBool:counterpart:", observingActivatingWithEvent, v33);
  observingDeactivatingWithEvent = self->_observingDeactivatingWithEvent;
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_5;
  v31[3] = &unk_1E621ACF0;
  v20 = v17;
  v32 = v20;
  v21 = (id)objc_msgSend(v5, "appendBool:counterpart:", observingDeactivatingWithEvent, v31);
  observingPerformingEvent = self->_observingPerformingEvent;
  v26 = v7;
  v27 = 3221225472;
  v28 = __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_6;
  v29 = &unk_1E621ACF0;
  v30 = v20;
  v23 = v20;
  v24 = (id)objc_msgSend(v5, "appendBool:counterpart:", observingPerformingEvent, &v26);
  LOBYTE(observingPerformingEvent) = objc_msgSend(v5, "isEqual", v26, v27, v28, v29);

  return observingPerformingEvent;
}

uint64_t __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isObservingDidCompleteUpdateToState");
}

uint64_t __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isObservingEventsArray");
}

uint64_t __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isObservingDidChangeAlwaysOnEnabled");
}

uint64_t __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isObservingActivatingWithEvent");
}

uint64_t __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isObservingDeactivatingWithEvent");
}

uint64_t __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isObservingPerformingEvent");
}

- (BLSXPCBacklightProxyObserverMask)initWithXPCDictionary:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v16;

  v4 = a3;
  v5 = (const char *)objc_msgSend(CFSTR("didUpdateToState"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("eventsArray"), "UTF8String");
  v7 = (const char *)objc_msgSend(CFSTR("alwaysOnEnabled"), "UTF8String");
  v8 = (const char *)objc_msgSend(CFSTR("activating"), "UTF8String");
  v9 = (const char *)objc_msgSend(CFSTR("deactivating"), "UTF8String");
  v10 = (const char *)objc_msgSend(CFSTR("performingEvent"), "UTF8String");
  v11 = xpc_dictionary_get_BOOL(v4, v5);
  v12 = xpc_dictionary_get_BOOL(v4, v6);
  v13 = xpc_dictionary_get_BOOL(v4, v7);
  v14 = xpc_dictionary_get_BOOL(v4, v8);
  v15 = xpc_dictionary_get_BOOL(v4, v9);
  v16 = xpc_dictionary_get_BOOL(v4, v10);

  return -[BLSXPCBacklightProxyObserverMask initWithObservingDidCompleteUpdateToState:observingEventsArray:didChangeAlwaysOnEnabled:activatingWithEvent:deactivatingWithEvent:performingEvent:](self, "initWithObservingDidCompleteUpdateToState:observingEventsArray:didChangeAlwaysOnEnabled:activatingWithEvent:deactivatingWithEvent:performingEvent:", v11, v12, v13, v14, v15, v16);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  xpc_object_t xdict;

  xdict = a3;
  v4 = (const char *)objc_msgSend(CFSTR("didUpdateToState"), "UTF8String");
  v5 = (const char *)objc_msgSend(CFSTR("eventsArray"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("alwaysOnEnabled"), "UTF8String");
  v7 = (const char *)objc_msgSend(CFSTR("activating"), "UTF8String");
  v8 = (const char *)objc_msgSend(CFSTR("deactivating"), "UTF8String");
  v9 = (const char *)objc_msgSend(CFSTR("performingEvent"), "UTF8String");
  xpc_dictionary_set_BOOL(xdict, v4, self->_observingDidCompleteUpdateToState);
  xpc_dictionary_set_BOOL(xdict, v5, self->_observingEventsArray);
  xpc_dictionary_set_BOOL(xdict, v6, self->_observingDidChangeAlwaysOnEnabled);
  xpc_dictionary_set_BOOL(xdict, v7, self->_observingActivatingWithEvent);
  xpc_dictionary_set_BOOL(xdict, v8, self->_observingDeactivatingWithEvent);
  xpc_dictionary_set_BOOL(xdict, v9, self->_observingPerformingEvent);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSXPCBacklightProxyObserverMask)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didUpdateToState"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("eventsArray"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("alwaysOnEnabled"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("activating"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deactivating"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("performingEvent"));

  return -[BLSXPCBacklightProxyObserverMask initWithObservingDidCompleteUpdateToState:observingEventsArray:didChangeAlwaysOnEnabled:activatingWithEvent:deactivatingWithEvent:performingEvent:](self, "initWithObservingDidCompleteUpdateToState:observingEventsArray:didChangeAlwaysOnEnabled:activatingWithEvent:deactivatingWithEvent:performingEvent:", v5, v6, v7, v8, v9, v10);
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 observingDidCompleteUpdateToState;
  id v5;

  observingDidCompleteUpdateToState = self->_observingDidCompleteUpdateToState;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", observingDidCompleteUpdateToState, CFSTR("didUpdateToState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_observingEventsArray, CFSTR("eventsArray"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_observingDidChangeAlwaysOnEnabled, CFSTR("alwaysOnEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_observingActivatingWithEvent, CFSTR("activating"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_observingDeactivatingWithEvent, CFSTR("deactivating"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_observingPerformingEvent, CFSTR("performingEvent"));

}

- (BOOL)isObservingDidCompleteUpdateToState
{
  return self->_observingDidCompleteUpdateToState;
}

- (BOOL)isObservingEventsArray
{
  return self->_observingEventsArray;
}

- (BOOL)isObservingDidChangeAlwaysOnEnabled
{
  return self->_observingDidChangeAlwaysOnEnabled;
}

- (BOOL)isObservingActivatingWithEvent
{
  return self->_observingActivatingWithEvent;
}

- (BOOL)isObservingDeactivatingWithEvent
{
  return self->_observingDeactivatingWithEvent;
}

- (BOOL)isObservingPerformingEvent
{
  return self->_observingPerformingEvent;
}

@end
