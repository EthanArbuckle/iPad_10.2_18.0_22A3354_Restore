@implementation BWStillImageProcessorCoordinator

- (BWStillImageProcessorCoordinator)initWithProcessorControllers:(id)a3
{
  BWStillImageProcessorCoordinator *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)BWStillImageProcessorCoordinator;
  v4 = -[BWStillImageProcessorCoordinator init](&v15, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a3, "count"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(a3);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "type")));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }
    v4->_processorControllersByType = (NSDictionary *)objc_msgSend(v5, "copy");
    v4->_processorControllersLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_processorControllersByType);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_msgSend(v3, "allKeys");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        objc_msgSend((id)objc_opt_class(), "description");
        FigCaptureCurrentProcessIsDeferredmediad();
        FigGetUpTimeNanoseconds();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v9);
        FigGetUpTimeNanoseconds();
        FigCaptureCurrentProcessIsDeferredmediad();
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  v10.receiver = self;
  v10.super_class = (Class)BWStillImageProcessorCoordinator;
  -[BWStillImageProcessorCoordinator dealloc](&v10, sel_dealloc);
}

- (id)controllerForType:(unint64_t)a3
{
  os_unfair_lock_s *p_processorControllersLock;
  id v6;

  p_processorControllersLock = &self->_processorControllersLock;
  os_unfair_lock_lock(&self->_processorControllersLock);
  v6 = -[NSDictionary objectForKeyedSubscript:](self->_processorControllersByType, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3));
  os_unfair_lock_unlock(p_processorControllersLock);
  return v6;
}

- (void)addController:(id)a3
{
  os_unfair_lock_s *p_processorControllersLock;
  void *v6;

  p_processorControllersLock = &self->_processorControllersLock;
  os_unfair_lock_lock(&self->_processorControllersLock);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_processorControllersByType);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "type")));

  self->_processorControllersByType = (NSDictionary *)objc_msgSend(v6, "copy");
  os_unfair_lock_unlock(p_processorControllersLock);
}

- (id)processorControllerNames
{
  void *v3;
  void *v4;
  os_unfair_lock_s *p_processorControllersLock;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)MEMORY[0x1A858DD40]();
  p_processorControllersLock = &self->_processorControllersLock;
  os_unfair_lock_lock(&self->_processorControllersLock);
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v6 = -[NSDictionary allValues](self->_processorControllersByType, "allValues", 0, 0);
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (objc_class *)objc_opt_class();
        objc_msgSend(v3, "addObject:", NSStringFromClass(v11));
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  os_unfair_lock_unlock(p_processorControllersLock);
  objc_autoreleasePoolPop(v4);
  return (id)objc_msgSend(v3, "copy");
}

@end
