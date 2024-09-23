@implementation AXObserverWrapper

- (AXObserverWrapper)initWithSystemElement:(id)a3 runloop:(id)a4 notifications:(id)a5 handler:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  AXObserverWrapper *v16;
  AXObserverWrapper *v17;
  AXError v18;
  AXObserverWrapper *v19;
  __CFRunLoop *v20;
  __CFRunLoopSource *RunLoopSource;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  const __CFString *v27;
  __AXObserver *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  AXObserverRef outObserver;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v40.receiver = self;
  v40.super_class = (Class)AXObserverWrapper;
  v16 = -[AXObserverWrapper init](&v40, sel_init);
  v17 = v16;
  if (!v16)
  {
LABEL_15:
    v19 = v17;
    goto LABEL_16;
  }
  -[AXObserverWrapper setRunloop:](v16, "setRunloop:", v13);
  -[AXObserverWrapper setNotifications:](v17, "setNotifications:", v14);
  outObserver = 0;
  -[AXObserverWrapper setHandler:](v17, "setHandler:", v15);
  -[AXObserverWrapper setSystemElement:](v17, "setSystemElement:", v12);
  v18 = AXObserverCreate(objc_msgSend(v12, "pid"), (AXObserverCallback)_axEventHandler, &outObserver);
  if (v18 == kAXErrorSuccess)
  {
    -[AXObserverWrapper setObserver:](v17, "setObserver:", outObserver);
    CFRelease(outObserver);
    v20 = (__CFRunLoop *)objc_msgSend(v13, "getCFRunLoop");
    RunLoopSource = AXObserverGetRunLoopSource(-[AXObserverWrapper observer](v17, "observer"));
    CFRunLoopAddSource(v20, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v22 = v14;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v23)
    {
      v24 = v23;
      v32 = v15;
      v33 = v14;
      v34 = v13;
      v25 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(v22);
          v27 = (const __CFString *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "intValue");
          v28 = -[AXObserverWrapper observer](v17, "observer");
          -[AXObserverWrapper systemElement](v17, "systemElement");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "uiElement");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          AXObserverAddNotification(v28, (AXUIElementRef)objc_msgSend(v30, "axElement"), v27, v17);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v24);

      v14 = v33;
      v13 = v34;
      v15 = v32;
    }
    else
    {

    }
    goto LABEL_15;
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("HoverText"), CFSTR("Could not make observer. error: %ld"), v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = 0;
LABEL_16:

  return v19;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  __AXObserver *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFRunLoop *v13;
  __CFRunLoopSource *RunLoopSource;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AXObserverWrapper notifications](self, "notifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = (const __CFString *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v7), "intValue");
        v9 = -[AXObserverWrapper observer](self, "observer");
        -[AXObserverWrapper systemElement](self, "systemElement");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uiElement");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        AXObserverRemoveNotification(v9, (AXUIElementRef)objc_msgSend(v11, "axElement"), v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  -[AXObserverWrapper runloop](self, "runloop");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (__CFRunLoop *)objc_msgSend(v12, "getCFRunLoop");
  RunLoopSource = AXObserverGetRunLoopSource(-[AXObserverWrapper observer](self, "observer"));
  CFRunLoopRemoveSource(v13, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);

  v15.receiver = self;
  v15.super_class = (Class)AXObserverWrapper;
  -[AXObserverWrapper dealloc](&v15, sel_dealloc);
}

- (AXElement)systemElement
{
  return self->_systemElement;
}

- (void)setSystemElement:(id)a3
{
  objc_storeStrong((id *)&self->_systemElement, a3);
}

- (__AXObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(__AXObserver *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_notifications, a3);
}

- (NSRunLoop)runloop
{
  return self->_runloop;
}

- (void)setRunloop:(id)a3
{
  objc_storeStrong((id *)&self->_runloop, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runloop, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_systemElement, 0);
}

@end
