@implementation IRAVOutputContextController

- (IRAVOutputContextController)initWithOutputContextType:(int64_t)a3
{
  IRAVOutputContextController *v3;
  IRAVOutputContextController *v4;
  void *v5;
  void *v6;
  void *v7;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v9 = (os_log_t *)MEMORY[0x24BE5B270];
    v10 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_FAULT))
      -[IRAVOutputContextController initWithOutputContextType:].cold.1(v10);
    v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "/Library/Caches/com.apple.xbs/Sources/IntelligentRouting/IntelligentRoutingDaemon/DataProviders/AVOutputCont"
            "ext/IRAVOutputContextController.m";
      v15 = 1024;
      v16 = 31;
      v17 = 2080;
      v18 = "-[IRAVOutputContextController initWithOutputContextType:]";
      _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_INFO, "#output-context-controller, %s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  v12.receiver = self;
  v12.super_class = (Class)IRAVOutputContextController;
  v3 = -[IRAVOutputContextController init](&v12, sel_init);
  v4 = v3;
  if (v3)
  {
    -[IRAVOutputContextController setLock:](v3, "setLock:", 0);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRAVOutputContextController setObservers:](v4, "setObservers:", v5);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRAVOutputContextController setNotificationCenter:](v4, "setNotificationCenter:", v6);

    -[IRAVOutputContextController _associatedOutputContextForType:](v4, "_associatedOutputContextForType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRAVOutputContextController setOutputContext:](v4, "setOutputContext:", v7);

    -[IRAVOutputContextController _registerForAVOutputContextOutputDeviceDidChangeNotification](v4, "_registerForAVOutputContextOutputDeviceDidChangeNotification");
    -[IRAVOutputContextController _registerForAVOutputContextPredictedOutputDeviceDidChangeNotification](v4, "_registerForAVOutputContextPredictedOutputDeviceDidChangeNotification");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[IRAVOutputContextController _unregisterForAVOutputContextOutputDeviceDidChangeNotification](self, "_unregisterForAVOutputContextOutputDeviceDidChangeNotification");
  -[IRAVOutputContextController _unregisterForAVOutputContextPredictedOutputDeviceDidChangeNotification](self, "_unregisterForAVOutputContextPredictedOutputDeviceDidChangeNotification");
  v3.receiver = self;
  v3.super_class = (Class)IRAVOutputContextController;
  -[IRAVOutputContextController dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRAVOutputContextController observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v8);

  if ((v6 & 1) == 0)
  {
    -[IRAVOutputContextController observers](self, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRAVOutputContextController observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v8);

  if ((v6 & 1) != 0)
  {
    -[IRAVOutputContextController observers](self, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v8);

  }
  os_unfair_lock_unlock(p_lock);

}

- (id)getOutputDevice
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRAVOutputContextController outputContext](self, "outputContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRAVOutputDeviceDO AVOutputDeviceToDO:](IRAVOutputDeviceDO, "AVOutputDeviceToDO:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)getPredictedOutputDevice
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRAVOutputContextController outputContext](self, "outputContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictedOutputDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRAVOutputDeviceDO AVOutputDeviceToDO:](IRAVOutputDeviceDO, "AVOutputDeviceToDO:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_associatedOutputContextForType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      objc_msgSend(MEMORY[0x24BDB25D8], "sharedAudioPresentationOutputContext");
      self = (IRAVOutputContextController *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BDB25D8], "sharedSystemScreenContext");
      self = (IRAVOutputContextController *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      objc_msgSend(MEMORY[0x24BDB25D8], "sharedSystemAudioContext");
      self = (IRAVOutputContextController *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return self;
}

- (void)_didUpdateOutputDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[IRAVOutputContextController outputContext](self, "outputContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[IRAVOutputDeviceDO AVOutputDeviceToDO:](IRAVOutputDeviceDO, "AVOutputDeviceToDO:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
    -[IRAVOutputContextController _didUpdateOutputDevice:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[IRAVOutputContextController observers](self, "observers", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "context:didUpdateOutputDevice:", self, v7);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_didUpdatePredictedOutputDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[IRAVOutputContextController outputContext](self, "outputContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predictedOutputDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[IRAVOutputDeviceDO AVOutputDeviceToDO:](IRAVOutputDeviceDO, "AVOutputDeviceToDO:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
    -[IRAVOutputContextController _didUpdatePredictedOutputDevice:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[IRAVOutputContextController observers](self, "observers", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "context:didUpdatePredicatedOutputDevice:", self, v7);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_registerForAVOutputContextOutputDeviceDidChangeNotification
{
  uint64_t v3;
  void *v4;
  id v5;

  -[IRAVOutputContextController notificationCenter](self, "notificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDB1F00];
  -[IRAVOutputContextController outputContext](self, "outputContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__didUpdateOutputDevice_, v3, v4);

}

- (void)_unregisterForAVOutputContextOutputDeviceDidChangeNotification
{
  NSNotificationCenter *notificationCenter;
  uint64_t v4;
  id v5;

  notificationCenter = self->_notificationCenter;
  v4 = *MEMORY[0x24BDB1F00];
  -[IRAVOutputContextController outputContext](self, "outputContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter removeObserver:name:object:](notificationCenter, "removeObserver:name:object:", self, v4, v5);

}

- (void)_registerForAVOutputContextPredictedOutputDeviceDidChangeNotification
{
  uint64_t v3;
  void *v4;
  id v5;

  -[IRAVOutputContextController notificationCenter](self, "notificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDB1F10];
  -[IRAVOutputContextController outputContext](self, "outputContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__didUpdatePredictedOutputDevice_, v3, v4);

}

- (void)_unregisterForAVOutputContextPredictedOutputDeviceDidChangeNotification
{
  NSNotificationCenter *notificationCenter;
  uint64_t v4;
  id v5;

  notificationCenter = self->_notificationCenter;
  v4 = *MEMORY[0x24BDB1F10];
  -[IRAVOutputContextController outputContext](self, "outputContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter removeObserver:name:object:](notificationCenter, "removeObserver:name:object:", self, v4, v5);

}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (AVOutputContext)outputContext
{
  return self->_outputContext;
}

- (void)setOutputContext:(id)a3
{
  objc_storeStrong((id *)&self->_outputContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)initWithOutputContextType:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_23FFBA000, log, OS_LOG_TYPE_FAULT, "#output-context-controller, [ErrorId - AVOutputContext type] Currently only Audio output context type is supported", v1, 2u);
}

- (void)_didUpdateOutputDevice:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23FFBA000, a2, a3, "#output-context-controller, Output device has been updated: %@", a5, a6, a7, a8, 2u);
}

- (void)_didUpdatePredictedOutputDevice:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23FFBA000, a2, a3, "#output-context-controller, Predicted output device has been updated: %@", a5, a6, a7, a8, 2u);
}

@end
