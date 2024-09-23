@implementation IMAVDaemonListener

- (IMAVDaemonListener)init
{
  IMAVDaemonListener *v2;
  IMAVDaemonListener *v3;
  IMAVDaemonListener *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMAVDaemonListener;
  v2 = -[IMAVDaemonListener init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_setupComplete = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_noteDisconnected
{
  *(_WORD *)&self->_setupComplete = 0;
}

- (void)addHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *handlers;
  NSMutableArray *v11;
  NSMutableArray *v12;
  id v13;

  v13 = a3;
  if ((objc_msgSend_containsObjectIdenticalTo_(self->_handlers, v4, (uint64_t)v13, v5, v6) & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v12 = self->_handlers;
      self->_handlers = v11;

      handlers = self->_handlers;
    }
    objc_msgSend_addObject_(handlers, v7, (uint64_t)v13, v8, v9);
  }

}

- (void)removeHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *handlers;

  objc_msgSend_removeObjectIdenticalTo_(self->_handlers, a2, (uint64_t)a3, v3, v4);
  if (!objc_msgSend_count(self->_handlers, v6, v7, v8, v9))
  {
    handlers = self->_handlers;
    self->_handlers = 0;

  }
}

- (void)setupComplete:(BOOL)a3 info:(id)a4
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  self->_setupComplete = 1;
  objc_msgSend_sharedInstance(IMAVDaemonController, a2, a3, (uint64_t)a4, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__noteSetupComplete(v9, v5, v6, v7, v8);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription;
  uint64_t v4;
  uint64_t v5;

  MethodDescription = protocol_getMethodDescription((Protocol *)&unk_25504A528, a3, 1, 1);
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDBCEB0], sel_signatureWithObjCTypes_, MethodDescription.types, v4, v5);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x219A284CC]();
  v10 = (void *)objc_msgSend__copyForEnumerating(self->_handlers, v6, v7, v8, v9);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v10;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v11);
        v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend_selector(v4, v13, v14, v15, v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v21 = (void *)MEMORY[0x219A284CC]();
          objc_msgSend_invokeWithTarget_(v4, v22, v20, v23, v24);
          objc_autoreleasePoolPop(v21);
        }
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v17);
  }

  objc_autoreleasePoolPop(v5);
}

- (BOOL)isSetupComplete
{
  return self->_setupComplete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end
