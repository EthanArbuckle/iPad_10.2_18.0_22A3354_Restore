@implementation GKComponentSystem

- (GKComponentSystem)initWithComponentClass:(Class)cls
{
  GKComponentSystem *v4;
  GKComponentSystem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKComponentSystem;
  v4 = -[GKComponentSystem init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_componentClass, cls);
  return v5;
}

- (NSArray)components
{
  return (NSArray *)self->_components;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_components, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_components, "objectAtIndexedSubscript:", idx);
}

- (void)addComponent:(id)component
{
  uint64_t v4;
  Class componentClass;
  NSMutableArray *components;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v13 = component;
  v4 = objc_opt_class();
  componentClass = self->_componentClass;
  if ((Class)v4 != componentClass)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    v10 = *MEMORY[0x24BDBCAB8];
    v15 = CFSTR("supportedClass");
    v16[0] = componentClass;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, CFSTR("component class is not supported by this system"), v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v12);
  }
  objc_msgSend(v13, "setUsesPerComponentUpdate:", 1);
  components = self->_components;
  if (!components)
  {
    v7 = (NSMutableArray *)objc_opt_new();
    v8 = self->_components;
    self->_components = v7;

    components = self->_components;
  }
  -[NSMutableArray addObject:](components, "addObject:", v13, v13);
  objc_msgSend(v14, "setComponentSystem:", self);

}

- (void)addComponentWithEntity:(GKEntity *)entity
{
  void *v4;
  void *v5;

  -[GKEntity componentForClass:](entity, "componentForClass:", self->_componentClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[GKComponentSystem addComponent:](self, "addComponent:", v4);
    v4 = v5;
  }

}

- (void)removeComponentWithEntity:(GKEntity *)entity
{
  void *v4;
  void *v5;

  -[GKEntity componentForClass:](entity, "componentForClass:", self->_componentClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[GKComponentSystem removeComponent:](self, "removeComponent:", v4);
    v4 = v5;
  }

}

- (void)removeComponent:(id)component
{
  id v4;

  v4 = component;
  if (-[NSMutableArray containsObject:](self->_components, "containsObject:"))
  {
    -[NSMutableArray removeObject:](self->_components, "removeObject:", v4);
    objc_msgSend(v4, "setComponentSystem:", 0);
  }

}

- (void)updateWithDeltaTime:(NSTimeInterval)seconds
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_components;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "updateWithDeltaTime:", seconds, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  id v6;
  void (*v7)(_QWORD, SEL, id);
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[objc_class instancesRespondToSelector:](self->_componentClass, "instancesRespondToSelector:", a3))
  {
    v7 = (void (*)(_QWORD, SEL, id))-[objc_class instanceMethodForSelector:](self->_componentClass, "instanceMethodForSelector:", a3);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_components;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v7(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12++), a3, v6);
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    v13 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)GKComponentSystem;
    -[GKComponentSystem performSelector:withObject:](&v15, sel_performSelector_withObject_, a3, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKComponentSystem;
  if (-[GKComponentSystem respondsToSelector:](&v6, sel_respondsToSelector_))
    return 1;
  else
    return -[objc_class instancesRespondToSelector:](self->_componentClass, "instancesRespondToSelector:", a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;

  if (!-[NSMutableArray count](self->_components, "count"))
    return 0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_components, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "methodSignatureForSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSMutableArray count](self->_components, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = self->_components;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "invokeWithTarget:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GKComponentSystem;
    -[GKComponentSystem forwardInvocation:](&v10, sel_forwardInvocation_, v4);
  }

}

- (Class)componentClass
{
  return self->_componentClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentClass, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end
