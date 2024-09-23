@implementation BLSHGenericSceneDelegateWithActionHandlers

- (BLSHGenericSceneDelegateWithActionHandlers)init
{
  BLSHGenericSceneDelegateWithActionHandlers *v2;
  BLSHGenericSceneDelegateWithActionHandlers *v3;
  uint64_t v4;
  NSMutableArray *actionHandlers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLSHGenericSceneDelegateWithActionHandlers;
  v2 = -[BLSHGenericSceneDelegateWithActionHandlers init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    actionHandlers = v3->_actionHandlers;
    v3->_actionHandlers = (NSMutableArray *)v4;

  }
  return v3;
}

- (void)addActionHandler:(id)a3 forScene:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v6;

  p_lock = &self->_lock;
  v6 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray addObject:](self->_actionHandlers, "addObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeActionHandler:(id)a3 forScene:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v6;

  p_lock = &self->_lock;
  v6 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray removeObject:](self->_actionHandlers, "removeObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (id)actionHandlers
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (id *)objc_msgSend(v1[1], "copy");
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[BLSHGenericSceneDelegateWithActionHandlers actionHandlers]((os_unfair_lock_s *)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "respondToActions:forFBScene:", v13, v6);
        v7 = (id)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionHandlers, 0);
}

@end
