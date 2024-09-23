@implementation FBSSceneObserver

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void (**clintSettingsHandler)(id, id, id);
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "settingsDiff");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FBSSceneObserver _matchesClientDiff:]((uint64_t)self, v7);

  if (v8)
  {
    clintSettingsHandler = (void (**)(id, id, id))self->_clintSettingsHandler;
    if (clintSettingsHandler)
    {
      clintSettingsHandler[2](clintSettingsHandler, v11, v6);
    }
    else if (self->_respondsToClientSettings)
    {
      -[FBSSceneObserver observer](self, "observer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scene:didUpdateClientSettings:", v11, v6);

    }
  }

}

- (uint64_t)_matchesClientDiff:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && (*(_QWORD *)(a1 + 64) || *(_BYTE *)(a1 + 90)))
  {
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v5);
            if ((-[FBSSettingsDiff _containsSetting:](v3, *(void **)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
            {
              v6 = 1;
              goto LABEL_15;
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_15:

    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void (**settingsHandler)(id, id, id);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v6, "settingsDiff");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FBSSceneObserver _matchesDiff:]((uint64_t)self, v7);

  if (v8)
  {
    settingsHandler = (void (**)(id, id, id))self->_settingsHandler;
    if (settingsHandler)
    {
      settingsHandler[2](settingsHandler, v16, v6);
    }
    else if (self->_respondsToSettings)
    {
      -[FBSSceneObserver observer](self, "observer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scene:didUpdateSettings:", v16, v6);

    }
  }
  objc_msgSend(v6, "transitionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v11, "actions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneObserver scene:handleActions:](self, "scene:handleActions:", v16, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
    {
      v15 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v15, "minusSet:", v14);
      objc_msgSend(v11, "setActions:", v15);

    }
  }

}

- (id)observer
{
  return objc_loadWeakRetained((id *)&self->_observer);
}

- (uint64_t)_matchesDiff:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && (*(_QWORD *)(a1 + 56) || *(_BYTE *)(a1 + 89)))
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v5);
            if ((-[FBSSettingsDiff _containsSetting:](v3, *(void **)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
            {
              v6 = 1;
              goto LABEL_15;
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_15:

    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (FBSSceneObserver)initWithObserver:(id)a3
{
  id v4;
  void *v5;
  FBSSceneObserver *v6;
  FBSSceneObserver *v7;
  FBSSceneObserver *result;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = -[FBSSceneObserver init](self, "init");
    v7 = v6;
    if (v6)
    {
      objc_storeWeak((id *)&v6->_observer, v5);
      v7->_observerAddress = (unint64_t)v5;
      v7->_respondsToHostHandle = objc_opt_respondsToSelector() & 1;
      v7->_respondsToSettings = objc_opt_respondsToSelector() & 1;
      v7->_respondsToClientSettings = objc_opt_respondsToSelector() & 1;
      v7->_respondsToActions = objc_opt_respondsToSelector() & 1;
      v7->_respondsToInvalidate = objc_opt_respondsToSelector() & 1;
    }

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("observer != ((void *)0)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneObserver initWithObserver:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (FBSSceneObserver *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSSceneObserver)initWithComponent:(id)a3
{
  id v5;
  FBSSceneObserver *v6;
  FBSSceneObserver *v7;

  v5 = a3;
  v6 = -[FBSSceneObserver initWithObserver:](self, "initWithObserver:", v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_component, a3);
    v7->_respondsToPrivateActions = objc_opt_respondsToSelector() & 1;
  }

  return v7;
}

- (id)component
{
  return self->_component;
}

- (id)_matchesActions:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (a1[9] || *((_BYTE *)a1 + 91))
    {
      if (a1[6])
      {
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        v14 = 0u;
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
        {
          v6 = v5;
          v7 = 0;
          v8 = *(_QWORD *)v14;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v14 != v8)
                objc_enumerationMutation(v4);
              v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
              if (objc_msgSend(a1[6], "containsObject:", objc_opt_class()))
              {
                if (!v7)
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v7 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v7, "addObject:", v10);
              }
            }
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          }
          while (v6);
        }
        else
        {
          v7 = 0;
        }
        if (objc_msgSend(v7, "count"))
          v11 = v7;
        else
          v11 = 0;
        a1 = v11;

      }
      else
      {
        a1 = (id *)v3;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)scene:(id)a3 didUpdateHostHandle:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (self->_respondsToHostHandle)
  {
    v6 = a4;
    v7 = a3;
    -[FBSSceneObserver observer](self, "observer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scene:didUpdateHostHandle:", v7, v6);

  }
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v6;
  void *v7;
  void (**actionHandler)(id, id, void *);
  void *v9;
  void *v10;

  v6 = a3;
  -[FBSSceneObserver _matchesActions:]((id *)&self->super.isa, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
    goto LABEL_6;
  actionHandler = (void (**)(id, id, void *))self->_actionHandler;
  if (!actionHandler)
  {
    if (self->_respondsToActions)
    {
      -[FBSSceneObserver observer](self, "observer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scene:handleActions:", v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  actionHandler[2](actionHandler, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v9;
}

- (void)sceneWillInvalidate:(id)a3
{
  id v4;
  void (**invalidationHandler)(void);
  void *v6;
  id v7;

  v4 = a3;
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    v7 = v4;
    invalidationHandler[2]();
LABEL_5:
    v4 = v7;
    goto LABEL_6;
  }
  if (self->_respondsToInvalidate)
  {
    v7 = v4;
    -[FBSSceneObserver observer](self, "observer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneWillInvalidate:", v7);

    goto LABEL_5;
  }
LABEL_6:

}

- (id)scene:(id)a3 handlePrivateActions:(id)a4
{
  id v6;
  id v7;
  FBSSceneComponent *component;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  component = self->_component;
  if (component && self->_respondsToPrivateActions)
  {
    -[FBSSceneComponent handlePrivateActions:](component, "handlePrivateActions:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FBSSceneObserver scene:handleActions:](self, "scene:handleActions:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (void)settings:(SEL)a3
{
  void *v5;
  void *v6;
  SEL *v7;
  void *v8;
  SEL *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v9 = (SEL *)&v10;
    do
    {
      NSStringFromSelector(a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

      v7 = v9++;
      a3 = *v7;
    }
    while (*v7);
  }
  objc_msgSend(v5, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneObserver settingNames:](self, "settingNames:", v8);

}

- (void)clientSettings:(SEL)a3
{
  void *v5;
  void *v6;
  SEL *v7;
  void *v8;
  SEL *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v9 = (SEL *)&v10;
    do
    {
      NSStringFromSelector(a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

      v7 = v9++;
      a3 = *v7;
    }
    while (*v7);
  }
  objc_msgSend(v5, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneObserver clientSettingNames:](self, "clientSettingNames:", v8);

}

- (void)actions:(Class)a3
{
  void *v5;
  Class *v6;
  void *v7;
  Class *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v8 = (Class *)&v9;
    do
    {
      objc_msgSend(v5, "addObject:", a3);
      v6 = v8++;
      a3 = *v6;
    }
    while (*v6);
  }
  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneObserver actionClasses:](self, "actionClasses:", v7);

}

- (void)settingNames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSString *v11;
  SEL v12;
  SEL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSSet *v17;
  NSSet *settings;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(NSString **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v12 = NSSelectorFromString(v11);
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No known selector for setting name: %@"), v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSSceneObserver settingNames:].cold.1();
          objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A73A398);
        }
        v13 = v12;
        v14 = (void *)objc_opt_class();
        FBSSettingForExtensionSelector(v14, v13);
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromSelector(v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("No known setting for selector: %@"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSSceneObserver settingNames:].cold.2();
          objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A73A40CLL);
        }
        v16 = (void *)v15;
        objc_msgSend(v5, "addObject:", v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v17 = (NSSet *)objc_msgSend(v5, "copy");
    settings = self->_settings;
    self->_settings = v17;
  }
  else
  {
    settings = self->_settings;
    self->_settings = 0;
  }

}

- (void)clientSettingNames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSString *v11;
  SEL v12;
  SEL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSSet *v17;
  NSSet *clientSettings;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(NSString **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v12 = NSSelectorFromString(v11);
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No known selector for setting name: %@"), v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSSceneObserver clientSettingNames:].cold.1();
          objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A73A5F0);
        }
        v13 = v12;
        v14 = (void *)objc_opt_class();
        FBSSettingForExtensionSelector(v14, v13);
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromSelector(v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("No known setting for selector: %@"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSSceneObserver clientSettingNames:].cold.2();
          objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A73A664);
        }
        v16 = (void *)v15;
        objc_msgSend(v5, "addObject:", v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v17 = (NSSet *)objc_msgSend(v5, "copy");
    clientSettings = self->_clientSettings;
    self->_clientSettings = v17;
  }
  else
  {
    clientSettings = self->_clientSettings;
    self->_clientSettings = 0;
  }

}

- (void)actionClasses:(id)a3
{
  NSSet *v4;
  NSSet *actions;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = (NSSet *)objc_msgSend(v6, "copy");
    actions = self->_actions;
    self->_actions = v4;
  }
  else
  {
    actions = self->_actions;
    self->_actions = 0;
  }

}

- (void)updateHandler:(id)a3
{
  void *v4;
  id settingsHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  settingsHandler = self->_settingsHandler;
  self->_settingsHandler = v4;

}

- (void)clientUpdateHandler:(id)a3
{
  void *v4;
  id clintSettingsHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  clintSettingsHandler = self->_clintSettingsHandler;
  self->_clintSettingsHandler = v4;

}

- (void)actionHandler:(id)a3
{
  void *v4;
  id actionHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  actionHandler = self->_actionHandler;
  self->_actionHandler = v4;

}

- (void)invalidationHandler:(id)a3
{
  void *v4;
  id invalidationHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = v4;

}

- (void)invalidate
{
  FBSSceneComponent *component;
  id settingsHandler;
  id clintSettingsHandler;
  id actionHandler;
  id invalidationHandler;

  -[FBSSceneComponent invalidate](self->_component, "invalidate");
  component = self->_component;
  self->_component = 0;

  objc_storeWeak((id *)&self->_observer, 0);
  settingsHandler = self->_settingsHandler;
  self->_settingsHandler = 0;

  clintSettingsHandler = self->_clintSettingsHandler;
  self->_clintSettingsHandler = 0;

  actionHandler = self->_actionHandler;
  self->_actionHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  *(_DWORD *)&self->_respondsToSettings = 0;
}

- (unint64_t)hash
{
  return self->_observerAddress;
}

- (BOOL)isEqual:(id)a3
{
  FBSSceneObserver *v4;
  uint64_t v5;
  id WeakRetained;
  id v7;
  BOOL v8;

  v4 = (FBSSceneObserver *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() && v4->_observerAddress == self->_observerAddress)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v4->_observer);
      v7 = objc_loadWeakRetained((id *)&self->_observer);
      v8 = WeakRetained == v7;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong(&self->_clintSettingsHandler, 0);
  objc_storeStrong(&self->_settingsHandler, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_clientSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_component, 0);
  objc_destroyWeak((id *)&self->_observer);
}

- (void)initWithObserver:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)settingNames:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)settingNames:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)clientSettingNames:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)clientSettingNames:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
