@implementation GKEventEmitter

+ (id)eventEmitterForProtocols:(id)a3 shouldQueue:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  GKEventEmitter *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[GKEventEmitter initWithSupportedProtocols:shouldQueue:]([GKEventEmitter alloc], "initWithSupportedProtocols:shouldQueue:", v5, v4);

  return v6;
}

- (GKEventEmitter)initWithSupportedProtocols:(id)a3 shouldQueue:(BOOL)a4
{
  id v6;
  GKEventEmitter *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKEventEmitter;
  v7 = -[GKEventEmitter init](&v12, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKEventEmitter setListeners:](v7, "setListeners:", v8);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKEventEmitter setSupportedProtocols:](v7, "setSupportedProtocols:", v9);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKEventEmitter setQueuedEvents:](v7, "setQueuedEvents:", v10);

    v7->_shouldQueue = a4;
  }

  return v7;
}

- (void)setSupportedProtocols:(id)a3
{
  objc_storeStrong((id *)&self->_supportedProtocols, a3);
}

- (void)setQueuedEvents:(id)a3
{
  objc_storeStrong((id *)&self->_queuedEvents, a3);
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

+ (id)eventEmitterForProtocols:(id)a3
{
  return +[GKEventEmitter eventEmitterForProtocols:shouldQueue:](GKEventEmitter, "eventEmitterForProtocols:shouldQueue:", a3, 1);
}

- (void)dispatchQueuedEventsToListener:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (-[NSMutableArray count](self->_queuedEvents, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_queuedEvents, "objectAtIndex:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = 0;
      while (1)
      {
        objc_msgSend(v5, "selector");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v5, "invokeWithTarget:", v8);
          -[NSMutableArray removeObjectAtIndex:](self->_queuedEvents, "removeObjectAtIndex:", v6);
        }
        else
        {
          ++v6;
        }
        if (v6 >= -[NSMutableArray count](self->_queuedEvents, "count"))
          break;
        -[NSMutableArray objectAtIndex:](self->_queuedEvents, "objectAtIndex:", v6);
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v7;
        if (!v7)
          goto LABEL_11;
      }

    }
  }
LABEL_11:

}

- (void)registerListener:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSHashTable containsObject:](self->_listeners, "containsObject:", v4))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_supportedProtocols;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          if (objc_msgSend(v4, "conformsToProtocol:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10))
          {
            -[NSHashTable addObject:](self->_listeners, "addObject:", v4);
            -[GKEventEmitter dispatchQueuedEventsToListener:](self, "dispatchQueuedEventsToListener:", v4);
            goto LABEL_12;
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)unregisterListener:(id)a3
{
  -[NSHashTable removeObject:](self->_listeners, "removeObject:", a3);
}

- (void)unregisterAllListeners
{
  -[NSHashTable removeAllObjects](self->_listeners, "removeAllObjects");
}

- (id)methodSignatureForProtocol:(id)a3 selector:(SEL)a4
{
  Protocol *v5;
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v8;
  void *v9;

  v5 = (Protocol *)a3;
  MethodDescription = protocol_getMethodDescription(v5, a4, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name || (v8 = protocol_getMethodDescription(v5, a4, 0, 1), types = v8.types, v8.name))
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)invocationForProtocol:(id)a3 selector:(SEL)a4
{
  void *v5;
  void *v6;

  -[GKEventEmitter methodSignatureForProtocol:selector:](self, "methodSignatureForProtocol:selector:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelector:", a4);

  return v6;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)GKEventEmitter;
  -[GKEventEmitter methodSignatureForSelector:](&v17, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_supportedProtocols;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[GKEventEmitter methodSignatureForProtocol:selector:](self, "methodSignatureForProtocol:selector:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), a3, (_QWORD)v13);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v5 = (void *)v11;
            goto LABEL_12;
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_12:

  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "selector");
  -[GKEventEmitter listeners](self, "listeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v8)
  {

LABEL_13:
    if (self->_shouldQueue)
    {
      objc_msgSend(v4, "retainArguments");
      -[NSMutableArray addObject:](self->_queuedEvents, "addObject:", v4);
    }
    goto LABEL_15;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v15 != v11)
        objc_enumerationMutation(v7);
      v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "invokeWithTarget:", v13, (_QWORD)v14);
        v10 = 1;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v9);

  if ((v10 & 1) == 0)
    goto LABEL_13;
LABEL_15:

}

- (BOOL)listenerRegisteredForSelector:(SEL)a3
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_listeners;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (NSMutableArray)supportedProtocols
{
  return self->_supportedProtocols;
}

- (BOOL)shouldQueue
{
  return self->_shouldQueue;
}

- (void)setShouldQueue:(BOOL)a3
{
  self->_shouldQueue = a3;
}

- (NSMutableArray)queuedEvents
{
  return self->_queuedEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedEvents, 0);
  objc_storeStrong((id *)&self->_supportedProtocols, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
