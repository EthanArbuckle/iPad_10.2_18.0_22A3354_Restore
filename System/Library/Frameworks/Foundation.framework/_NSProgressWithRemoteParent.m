@implementation _NSProgressWithRemoteParent

- (void)setSequence:(unint64_t)a3
{
  self->_sequence = a3;
}

- (void)setParentConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSProgressWithRemoteParent;
  -[NSProgress dealloc](&v3, sel_dealloc);
}

- (void)_updateFractionCompleted:(_NSProgressFractionTuple *)a3
{
  __int128 v5;
  xpc_object_t v6;
  uint64_t total;
  uint64_t completed;
  _OWORD v9[3];
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_NSProgressWithRemoteParent;
  v5 = *(_OWORD *)&a3->var0.overflowed;
  v9[0] = *(_OWORD *)&a3->var0.completed;
  v9[1] = v5;
  v9[2] = *(_OWORD *)&a3->var1.total;
  -[NSProgress _updateFractionCompleted:](&v10, sel__updateFractionCompleted_, v9);
  if ((_NSProgressFractionIsEqual(&a3->var0.completed, &a3->var1.completed) & 1) == 0)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    completed = a3->var1.completed;
    total = a3->var1.total;
    xpc_dictionary_set_uint64(v6, "completedCount", completed);
    xpc_dictionary_set_uint64(v6, "totalCount", total);
    -[NSXPCConnection _sendProgressMessage:forSequence:]((uint64_t)self->_parentConnection, v6, self->_sequence);
    xpc_release(v6);
  }
}

- (void)_setUserInfoValue:(id)a3 forKey:(id)a4 fromChild:(BOOL)a5
{
  id v6;
  xpc_object_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_NSProgressWithRemoteParent;
  -[NSProgress _setUserInfoValue:forKey:fromChild:](&v17, sel__setUserInfoValue_forKey_fromChild_, a3, a4, a5);
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("NSProgressThroughputKey")))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "isUserInfo", 1);
    if (v6)
    {
      if (_NSIsNSNumber())
        v9 = objc_msgSend(v6, "unsignedLongLongValue");
      else
        v9 = 0;
      xpc_dictionary_set_uint64(v8, "userInfoVal", v9);
    }
    else
    {
      xpc_dictionary_set_BOOL(v8, "userInfoValNil", 1);
    }
    v12 = v8;
    v13 = 1;
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("NSProgressEstimatedTimeRemainingKey")))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "isUserInfo", 1);
    if (v6)
    {
      if (_NSIsNSNumber())
        v10 = objc_msgSend(v6, "unsignedLongLongValue");
      else
        v10 = 0;
      xpc_dictionary_set_uint64(v8, "userInfoVal", v10);
    }
    else
    {
      xpc_dictionary_set_BOOL(v8, "userInfoValNil", 1);
    }
    v12 = v8;
    v13 = 2;
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("_NSProgressRemoteLocalizedDescriptionKey")))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "isUserInfo", 1);
    v11 = _NSIsNSString();
    if (v6 && v11)
    {
      if ((unint64_t)objc_msgSend(v6, "length") >= 0x401)
        v6 = (id)objc_msgSend(v6, "substringWithRange:", 0, 1024);
      xpc_dictionary_set_string(v8, "userInfoVal", (const char *)objc_msgSend(v6, "UTF8String"));
    }
    else
    {
      xpc_dictionary_set_BOOL(v8, "userInfoValNil", 1);
    }
    v12 = v8;
    v13 = 3;
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("_NSProgressRemoteLocalizedAdditionalDescriptionKey")))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "isUserInfo", 1);
    v14 = _NSIsNSString();
    if (v6 && v14)
    {
      if ((unint64_t)objc_msgSend(v6, "length") >= 0x401)
        v6 = (id)objc_msgSend(v6, "substringWithRange:", 0, 1024);
      xpc_dictionary_set_string(v8, "userInfoVal", (const char *)objc_msgSend(v6, "UTF8String"));
    }
    else
    {
      xpc_dictionary_set_BOOL(v8, "userInfoValNil", 1);
    }
    v12 = v8;
    v13 = 4;
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("NSProgressFileCompletedCountKey")))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "isUserInfo", 1);
    if (v6)
    {
      if (_NSIsNSNumber())
        v15 = objc_msgSend(v6, "unsignedLongLongValue");
      else
        v15 = 0;
      xpc_dictionary_set_uint64(v8, "userInfoVal", v15);
    }
    else
    {
      xpc_dictionary_set_BOOL(v8, "userInfoValNil", 1);
    }
    v12 = v8;
    v13 = 6;
  }
  else
  {
    if (!objc_msgSend(a4, "isEqualToString:", CFSTR("NSProgressFileTotalCountKey")))
      return;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "isUserInfo", 1);
    if (v6)
    {
      if (_NSIsNSNumber())
        v16 = objc_msgSend(v6, "unsignedLongLongValue");
      else
        v16 = 0;
      xpc_dictionary_set_uint64(v8, "userInfoVal", v16);
    }
    else
    {
      xpc_dictionary_set_BOOL(v8, "userInfoValNil", 1);
    }
    v12 = v8;
    v13 = 5;
  }
  xpc_dictionary_set_uint64(v12, "userInfoKey", v13);
  if (v8)
  {
    -[NSXPCConnection _sendProgressMessage:forSequence:]((uint64_t)self->_parentConnection, v8, self->_sequence);
    xpc_release(v8);
  }
}

- (void)setCancellable:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)_NSProgressWithRemoteParent;
  -[NSProgress setCancellable:](&v5, sel_setCancellable_);
  -[_NSProgressWithRemoteParent _sendCancellableOrPausableUpdate:stringKey:intKey:](self, "_sendCancellableOrPausableUpdate:stringKey:intKey:", v3, "isCancellable", 7);
}

- (void)_setCancellable:(BOOL)a3 fromChild:(BOOL)a4
{
  -[_NSProgressWithRemoteParent _sendCancellableOrPausableUpdate:stringKey:intKey:](self, "_sendCancellableOrPausableUpdate:stringKey:intKey:", a3, "isCancellable", 7);
}

- (void)setPausable:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)_NSProgressWithRemoteParent;
  -[NSProgress setPausable:](&v5, sel_setPausable_);
  -[_NSProgressWithRemoteParent _sendCancellableOrPausableUpdate:stringKey:intKey:](self, "_sendCancellableOrPausableUpdate:stringKey:intKey:", v3, "isPausable", 8);
}

- (void)_setPausable:(BOOL)a3 fromChild:(BOOL)a4
{
  -[_NSProgressWithRemoteParent _sendCancellableOrPausableUpdate:stringKey:intKey:](self, "_sendCancellableOrPausableUpdate:stringKey:intKey:", a3, "isPausable", 8);
}

- (void)_sendCancellableOrPausableUpdate:(BOOL)a3 stringKey:(const char *)a4 intKey:(int)a5
{
  xpc_object_t v9;

  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v9, "isUserInfo", 1);
  xpc_dictionary_set_uint64(v9, "userInfoKey", a5);
  xpc_dictionary_set_BOOL(v9, a4, a3);
  -[NSXPCConnection _sendProgressMessage:forSequence:]((uint64_t)self->_parentConnection, v9, self->_sequence);
  xpc_release(v9);
}

- (NSXPCConnection)parentConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 120, 1);
}

- (unint64_t)sequence
{
  return self->_sequence;
}

@end
