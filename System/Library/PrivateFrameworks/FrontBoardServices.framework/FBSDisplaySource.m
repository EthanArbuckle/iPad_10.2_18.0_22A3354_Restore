@implementation FBSDisplaySource

- (id)connectedConfigurations
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 23;
    os_unfair_lock_lock(a1 + 23);
    v1 = (id *)v1[10];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)invalidate
{
  NSObject *v3;
  unsigned int displayID;
  unsigned int instanceID;
  _DWORD v6[2];
  __int16 v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_not_owner(&self->_updateTransformsLock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_lock_invalidated = 1;
    objc_storeWeak((id *)&self->_lock_monitor, 0);
    os_unfair_lock_unlock(&self->_lock);
    if (self->_observing)
    {
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("tag"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("availableModes"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("connectionSeed"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("uniqueId"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("name"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("deviceName"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("processId"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("currentMode"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("preferredMode"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("cloningSupported"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("overscanned"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("overscanAdjustment"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("overscanAmounts"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("supportsExtendedColors"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("currentOrientation"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("latency"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("frame"), self);
      -[CADisplay removeObserver:forKeyPath:context:](self->_display, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), self);
    }
    BKLogDisplay();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      displayID = self->_displayID;
      instanceID = self->_instanceID;
      v6[0] = 67109376;
      v6[1] = displayID;
      v7 = 1024;
      v8 = instanceID;
      _os_log_impl(&dword_19A6D4000, v3, OS_LOG_TYPE_DEFAULT, "[FBSDisplaySource %u-%u] did invalidate", (uint8_t *)v6, 0xEu);
    }

  }
}

- (id)initWithDisplay:(char)a3 alwaysConnected:(uint64_t)a4 triggers:(void *)a5 monitor:
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  void *v20;
  void *v21;
  objc_super v22;

  v10 = a2;
  v11 = a5;
  v12 = v11;
  if (!a1)
    goto LABEL_12;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("display"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplaySource initWithDisplay:alwaysConnected:triggers:monitor:].cold.1();
LABEL_21:
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6F0318);
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("monitor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplaySource initWithDisplay:alwaysConnected:triggers:monitor:].cold.2();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6F037CLL);
  }
  objc_msgSend(v11, "callOutQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("callOutQueue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplaySource initWithDisplay:alwaysConnected:triggers:monitor:].cold.3();
    goto LABEL_21;
  }
  v14 = (void *)v13;
  v22.receiver = a1;
  v22.super_class = (Class)FBSDisplaySource;
  v15 = (id *)objc_msgSendSuper2(&v22, sel_init);
  v16 = (uint64_t)v15;
  if (v15)
  {
    objc_storeStrong(v15 + 1, a2);
    *(_BYTE *)(v16 + 120) = a3;
    *(_DWORD *)(v16 + 100) = objc_msgSend(v10, "displayId");
    objc_storeStrong((id *)(v16 + 24), v14);
    do
    {
      v17 = __ldxr((unsigned int *)&initWithDisplay_alwaysConnected_triggers_monitor____instanceCounter);
      v18 = v17 + 1;
    }
    while (__stxr(v18, (unsigned int *)&initWithDisplay_alwaysConnected_triggers_monitor____instanceCounter));
    *(_DWORD *)(v16 + 104) = v18;
    *(_DWORD *)(v16 + 88) = 0;
    objc_storeWeak((id *)(v16 + 16), v12);
    *(_DWORD *)(v16 + 92) = 0;
    *(_DWORD *)(v16 + 96) = 0;
    *(_BYTE *)(v16 + 121) = a4 != 0;
    *(_BYTE *)(v16 + 122) = a4 & 1;
    if ((a4 & 1) != 0)
    {
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("tag"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("availableModes"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("connectionSeed"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("uniqueId"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("name"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("deviceName"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("processId"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("currentMode"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("preferredMode"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("cloningSupported"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("overscanned"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("overscanAdjustment"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("overscanAmounts"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("supportsExtendedColors"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("currentOrientation"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("latency"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("frame"), 0, v16);
      objc_msgSend(*(id *)(v16 + 8), "addObserver:forKeyPath:options:context:", v16, CFSTR("bounds"), 0, v16);
    }
    -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](v16, 1, 0);
  }
  a1 = (id)v16;

LABEL_12:
  return a1;
}

- (void)_updateForInitialization:(int)a3 forTransformInvalidation:
{
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "immutableCopy");
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if (*(_BYTE *)(a1 + 125) || !*(_BYTE *)(a1 + 123) && !a2)
    {
LABEL_50:
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));

      return;
    }
    if (*(_BYTE *)(a1 + 120))
    {
      v7 = -[FBSDisplayConfiguration _initWithImmutableDisplay:originalDisplay:assertIfInvalid:]([FBSDisplayConfiguration alloc], "_initWithImmutableDisplay:originalDisplay:assertIfInvalid:", v6, *(_QWORD *)(a1 + 8), 1);
      if ((objc_msgSend(v7, "isMainDisplay") & 1) != 0)
      {
        -[FBSDisplaySource _lock_setRawConfiguration:](a1, v7);
        switch(*(_DWORD *)(a1 + 108))
        {
          case 0:
            BKLogDisplay();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              v9 = *(_DWORD *)(a1 + 100);
              v10 = *(_DWORD *)(a1 + 104);
              objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 67109634;
              v39 = v9;
              v40 = 1024;
              v41 = v10;
              v42 = 2114;
              v43 = v11;
              _os_log_impl(&dword_19A6D4000, v8, OS_LOG_TYPE_DEFAULT, "[FBSDisplaySource %u-%u] silently connecting raw configuration: %{public}@", buf, 0x18u);

            }
            -[FBSDisplaySource _lock_noteConnected](a1);
            goto LABEL_48;
          case 1:
          case 4:
            v33 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend((id)a1, "debugDescription");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "stringWithFormat:", CFSTR("mainDisplay cannot debounce nor disconnect : %@"), v34);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:].cold.2();
            goto LABEL_63;
          case 3:
            -[FBSDisplaySource _lock_noteUpdatedForTransformInvalidation:](a1, a3);
            goto LABEL_48;
          default:
            goto LABEL_48;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we failed to make a main display for %@ - created raw configuration=%@"), v6, v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:].cold.3();
LABEL_63:
      objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6F0890);
    }
    v12 = objc_msgSend(v6, "tag");
    objc_msgSend(v6, "availableModes");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v13 = *(id *)(a1 + 32);
    if (!v12 || !objc_msgSend(v7, "count"))
    {
      -[FBSDisplaySource _lock_setRawConfiguration:](a1, 0);
      goto LABEL_26;
    }
    if (v13)
    {
      v36 = v7;
      objc_msgSend(v13, "identity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "connectionSeed");
      if (v15 == objc_msgSend(v6, "connectionSeed")
        && (v16 = objc_msgSend(v13, "seed"), v16 == objc_msgSend(v6, "seed")))
      {
        v17 = objc_msgSend(v13, "tags");

        v18 = v17 == v12;
        v7 = v36;
        if (v18 && !a3)
          goto LABEL_26;
      }
      else
      {

        v7 = v36;
      }
    }
    v19 = -[FBSDisplayConfiguration _initWithImmutableDisplay:originalDisplay:assertIfInvalid:]([FBSDisplayConfiguration alloc], "_initWithImmutableDisplay:originalDisplay:assertIfInvalid:", v6, *(_QWORD *)(a1 + 8), 1);
    v20 = v19;
    if (!v19 || objc_msgSend(v19, "isMainDisplay"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we failed to make a non-main display for %@ -> created raw configuration: %@"), v6, v20);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:].cold.1();
      objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6F08ECLL);
    }
    -[FBSDisplaySource _lock_setRawConfiguration:](a1, v20);

LABEL_26:
    v21 = *(void **)(a1 + 32);
    if (!v21 || (objc_msgSend(v21, "isHiddenDisplay") & 1) != 0)
    {
      if ((*(_DWORD *)(a1 + 108) | 2) != 3)
        goto LABEL_47;
      goto LABEL_45;
    }
    v22 = *(_DWORD *)(a1 + 108);
    if (v22 != 3 && v22 != 1)
    {
      if (v22 || !*(_BYTE *)(a1 + 124) && objc_msgSend(*(id *)(a1 + 32), "type") == 7)
      {
LABEL_47:

LABEL_48:
        if (a2)
          *(_BYTE *)(a1 + 123) = 1;
        goto LABEL_50;
      }
      -[FBSDisplaySource _lock_noteConnected](a1);
      goto LABEL_36;
    }
    objc_msgSend(*(id *)(a1 + 40), "identity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSEqualObjects())
    {
      objc_msgSend(*(id *)(a1 + 40), "hardwareIdentifier");
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hardwareIdentifier");
      v35 = (void *)v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        v37 = v7;
        v29 = objc_msgSend(*(id *)(a1 + 40), "tags");
        v18 = v29 == objc_msgSend(*(id *)(a1 + 32), "tags");
        v7 = v37;
        if (v18)
        {
          if (*(_BYTE *)(a1 + 124))
          {

          }
          else
          {
            v30 = objc_msgSend(*(id *)(a1 + 32), "type");

            v18 = v30 == 7;
            v7 = v37;
            if (v18)
              goto LABEL_45;
          }
          if (*(_DWORD *)(a1 + 108) == 3)
            -[FBSDisplaySource _lock_noteUpdatedForTransformInvalidation:](a1, a3);
LABEL_36:
          v23 = *(id *)(a1 + 32);
          v24 = *(void **)(a1 + 40);
          *(_QWORD *)(a1 + 40) = v23;
LABEL_46:

          goto LABEL_47;
        }
      }

    }
LABEL_45:
    -[FBSDisplaySource _lock_noteDisconnecting](a1);
    v24 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;
    goto LABEL_46;
  }
}

- (void)_lock_setRawConfiguration:(uint64_t)a1
{
  const os_unfair_lock *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;

  if (a1)
  {
    v3 = (const os_unfair_lock *)(a1 + 88);
    v4 = a2;
    os_unfair_lock_assert_owner(v3);
    v5 = objc_msgSend(v4, "copy");

    v6 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v5;

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 92));
    objc_storeStrong((id *)(a1 + 64), *(id *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 92));
    BKLogDisplay();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[FBSDisplaySource _lock_setRawConfiguration:].cold.1(a1, (id *)(a1 + 32), v7);

  }
}

- (void)setAllowsUnknown:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 88);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if (*(unsigned __int8 *)(a1 + 124) == a2)
    {
      os_unfair_lock_unlock(v4);
    }
    else
    {
      *(_BYTE *)(a1 + 124) = a2;
      os_unfair_lock_unlock(v4);
      -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](a1, 0, 0);
    }
  }
}

- (void)_lock_noteConnected
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

- (void)_lock_setAttachment:(const os_unfair_lock *)a1
{
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 22);
    a1[27]._os_unfair_lock_opaque = a2;
    os_unfair_lock_lock((os_unfair_lock_t)&a1[23]);
    a1[28]._os_unfair_lock_opaque = a1[27]._os_unfair_lock_opaque;
    os_unfair_lock_unlock((os_unfair_lock_t)&a1[23]);
  }
}

- (id)_transformDisplaysIfNecessaryFromDisplayConfiguration:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "transformer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
      objc_msgSend(v5, "transformDisplayConfiguration:", v3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      if (objc_msgSend(v3, "isMainDisplay"))
      {
        objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global_32);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count") != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transformed display configurations must have one and only one mainRootDisplay."));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:].cold.1();
          objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A6F12FCLL);
        }
      }
      else
      {
        if (!objc_msgSend(v6, "count"))
        {
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v3, "succinctDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("Cannot suppress a display currently by transforming display configurations from: %@"), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:].cold.2();
          objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A6F1598);
        }
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v6 = v6;
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v25;
          do
          {
            v13 = 0;
            v14 = v11;
            do
            {
              if (*(_QWORD *)v25 != v12)
                objc_enumerationMutation(v6);
              v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
              if (objc_msgSend(v15, "isMainDisplay"))
              {
                v17 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v3, "succinctDescription");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "stringWithFormat:", CFSTR("May not transform a non-main display (%@) into a main display."), v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:].cold.3();
                objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
                _bs_set_crash_log_message();
                __break(0);
                JUMPOUT(0x19A6F14C8);
              }
              objc_msgSend(v15, "identity");
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v7, "containsObject:", v11))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transformed displays may not return the same display identity multiple times: %@"), v11);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:].cold.4();
                objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
                _bs_set_crash_log_message();
                __break(0);
                JUMPOUT(0x19A6F1524);
              }
              objc_msgSend(v7, "addObject:", v11);
              ++v13;
              v14 = v11;
            }
            while (v10 != v13);
            v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v10);

        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_lock_setRawReportedConfiguration:(void *)a3 effectiveReportedConfigurations:
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v13 = a2;
  v5 = a3;
  if (!a1)
    goto LABEL_6;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  v6 = (void *)v13;
  if (!(v13 | v5) || v13 && (v7 = objc_msgSend((id)v5, "count"), v6 = (void *)v13, v7))
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v8;

    v10 = objc_msgSend((id)v5, "copy");
    v11 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v10;

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 92));
    objc_storeStrong((id *)(a1 + 72), *(id *)(a1 + 48));
    objc_storeStrong((id *)(a1 + 80), *(id *)(a1 + 56));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 92));
LABEL_6:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Raw and effective configurations must be consistent with nullability"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSDisplaySource _lock_setRawReportedConfiguration:effectiveReportedConfigurations:].cold.1();
  objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evlock_reportedEffectiveConfigurations, 0);
  objc_storeStrong((id *)&self->_evlock_reportedRawConfiguration, 0);
  objc_storeStrong((id *)&self->_evlock_rawConfiguration, 0);
  objc_storeStrong((id *)&self->_lock_reportedEffectiveConfigurations, 0);
  objc_storeStrong((id *)&self->_lock_reportedRawConfiguration, 0);
  objc_storeStrong((id *)&self->_lock_rawConfigurationOfLastTransition, 0);
  objc_storeStrong((id *)&self->_lock_rawConfiguration, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_destroyWeak((id *)&self->_lock_monitor);
  objc_storeStrong((id *)&self->_display, 0);
}

- (void)dealloc
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

- (FBSDisplaySource)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  FBSDisplaySource *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not allowed on %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = CFSTR("FBSDisplaySource.m");
    v20 = 1024;
    v21 = 78;
    v22 = 2114;
    v23 = v8;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
  JUMPOUT(0x19A74753CLL);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSDisplaySource succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  os_unfair_lock_s *p_externallyVisibleLock;
  void *v5;
  void *v6;
  FBSDisplayConfiguration *evlock_rawConfiguration;
  void *v8;
  id v9;
  NSUInteger v10;
  NSSet *evlock_reportedEffectiveConfigurations;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_externallyVisibleLock = &self->_externallyVisibleLock;
  os_unfair_lock_lock(&self->_externallyVisibleLock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u-%u"), self->_displayID, self->_instanceID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("instance"));

  FBSDisplayAttachmentDescription(self->_evlock_attachment);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("attachment"));

  evlock_rawConfiguration = self->_evlock_rawConfiguration;
  if (evlock_rawConfiguration)
  {
    -[FBSDisplayConfiguration succinctDescription](evlock_rawConfiguration, "succinctDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("rawConfig"));

    v10 = -[NSSet count](self->_evlock_reportedEffectiveConfigurations, "count");
    evlock_reportedEffectiveConfigurations = self->_evlock_reportedEffectiveConfigurations;
    if (v10 == 1)
    {
      -[NSSet anyObject](evlock_reportedEffectiveConfigurations, "anyObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "succinctDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v3, "appendObject:withName:", v13, CFSTR("effectiveConfig"));

    }
    else
    {
      -[NSSet allObjects](evlock_reportedEffectiveConfigurations, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v12, CFSTR("effectiveConfigs"), 1);
    }

  }
  os_unfair_lock_unlock(p_externallyVisibleLock);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSDisplaySource descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_externallyVisibleLock;
  void *v6;
  void *v7;
  FBSDisplayConfiguration *evlock_rawConfiguration;
  id v9;
  NSUInteger v10;
  NSSet *evlock_reportedEffectiveConfigurations;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_externallyVisibleLock = &self->_externallyVisibleLock;
  os_unfair_lock_lock(&self->_externallyVisibleLock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u-%u"), self->_displayID, self->_instanceID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("instance"));

  FBSDisplayAttachmentDescription(self->_evlock_attachment);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("attachment"));

  evlock_rawConfiguration = self->_evlock_rawConfiguration;
  if (evlock_rawConfiguration)
  {
    v9 = (id)objc_msgSend(v4, "appendObject:withName:", evlock_rawConfiguration, CFSTR("rawConfig"));
    v10 = -[NSSet count](self->_evlock_reportedEffectiveConfigurations, "count");
    evlock_reportedEffectiveConfigurations = self->_evlock_reportedEffectiveConfigurations;
    if (v10 == 1)
    {
      -[NSSet anyObject](evlock_reportedEffectiveConfigurations, "anyObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "succinctDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v4, "appendObject:withName:", v13, CFSTR("effectiveConfig"));

    }
    else
    {
      -[NSSet allObjects](evlock_reportedEffectiveConfigurations, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v12, CFSTR("effectiveConfigs"), 1);
    }

  }
  os_unfair_lock_unlock(p_externallyVisibleLock);
  return v4;
}

- (NSString)debugDescription
{
  return (NSString *)-[FBSDisplaySource descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)updateTransforms
{
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 96));
    if (*(_BYTE *)(a1 + 121))
      -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](a1, 0, 1);
  }
}

- (void)_lock_noteUpdatedForTransformInvalidation:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  char *v20;
  char v21;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v5, "identity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_DWORD *)(a1 + 100);
      if (v7 != objc_msgSend(v6, "displayID"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayID must be consistent : expected=%u rawConfiguration=%@"), *(unsigned int *)(a1 + 100), *(_QWORD *)(a1 + 32));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBSDisplaySource _lock_noteUpdatedForTransformInvalidation:].cold.3();
        objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A747AFCLL);
      }
      if (*(_DWORD *)(a1 + 108) == 3)
      {
        v8 = *(NSObject **)(a1 + 24);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke;
        block[3] = &unk_1E38EDD48;
        block[4] = a1;
        v18 = v6;
        v19 = v5;
        v20 = sel__lock_noteUpdatedForTransformInvalidation_;
        v21 = a2;
        v9 = v5;
        v10 = v6;
        dispatch_async(v8, block);

        return;
      }
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)a1, "debugDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("attachment must be connected : %@"), v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSDisplaySource _lock_noteUpdatedForTransformInvalidation:].cold.2();
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)a1, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("raw configuration cannot be nil : %@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSDisplaySource _lock_noteUpdatedForTransformInvalidation:].cold.1();
    }
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A747A98);
  }
}

- (void)_lock_noteDisconnecting
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

uint64_t __74__FBSDisplaySource__transformDisplaysIfNecessaryFromDisplayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMainRootDisplay");
}

void __39__FBSDisplaySource__lock_noteConnected__block_invoke(uint64_t a1)
{
  const os_unfair_lock **v2;
  const os_unfair_lock *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  int v8;
  id v9;
  void *v10;
  id v11;

  v2 = (const os_unfair_lock **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
  v3 = *v2;
  if ((*v2)[27]._os_unfair_lock_opaque == 1 && *(_DWORD *)(a1 + 56) == v3[29]._os_unfair_lock_opaque)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)&v3[8]._os_unfair_lock_opaque, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

    if ((v4 & 1) != 0)
    {
      -[FBSDisplaySource _lock_setAttachment:](*v2, 2u);
      v11 = *(id *)&(*v2)[8]._os_unfair_lock_opaque;
      os_unfair_lock_unlock((os_unfair_lock_t)&(*v2)[22]);
      if (v11)
      {
        -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:]((uint64_t)*v2, v11);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_lock((os_unfair_lock_t)&(*v2)[22]);
        -[FBSDisplaySource _lock_setAttachment:](*v2, 3u);
        -[FBSDisplaySource _lock_setRawReportedConfiguration:effectiveReportedConfigurations:]((uint64_t)*v2, v11, v6);
        WeakRetained = objc_loadWeakRetained((id *)&(*v2)[4]);
        v8 = objc_msgSend(WeakRetained, "canPostToBookendObserver");
        v9 = *(id *)&(*v2)[8]._os_unfair_lock_opaque;
        os_unfair_lock_unlock((os_unfair_lock_t)&(*v2)[22]);
        if (!LOBYTE((*v2)[30]._os_unfair_lock_opaque))
          -[FBSDisplaySource _callOutQueue_postToObservers:includeBookendObserver:connected:]((uint64_t)*v2, WeakRetained, v8, v6);
        if (v11 != v9)
          -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](*v2, 0, 0);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identity of debounced raw configuration must be consistent : configuration=%@ original=%@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __39__FBSDisplaySource__lock_noteConnected__block_invoke_cold_1();
      objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&v3[22]);
  }
}

- (void)_callOutQueue_postToObservers:(int)a3 includeBookendObserver:(void *)a4 connected:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v39;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[4];
  _BYTE v62[10];
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (a1)
  {
    BSDispatchQueueAssert();
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v35 = v7;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v55 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          BKLogDisplay();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = *(_DWORD *)(a1 + 100);
            v15 = *(_DWORD *)(a1 + 104);
            objc_msgSend(v12, "succinctDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v62 = v14;
            *(_WORD *)&v62[4] = 1024;
            *(_DWORD *)&v62[6] = v15;
            v63 = 2114;
            v64 = v16;
            _os_log_impl(&dword_19A6D4000, v13, OS_LOG_TYPE_DEFAULT, "[FBSDisplaySource %u-%u] connecting %{public}@", buf, 0x18u);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      }
      while (v9);
    }

    if (a3)
    {
      objc_msgSend(v6, "bookendObserver");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v18 = obj;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v51;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v51 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v22);
            BKLogDisplay();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v62 = v23;
              _os_log_debug_impl(&dword_19A6D4000, v24, OS_LOG_TYPE_DEBUG, "posting bookend connect %@", buf, 0xCu);
            }

            if (v17 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v23, "identity");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "displayMonitor:didConnectIdentity:withConfiguration:", v6, v25, v23);

            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
        }
        while (v20);
      }

    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v6, "observers");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    if (v39)
    {
      v37 = *(_QWORD *)v47;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v47 != v37)
            objc_enumerationMutation(v36);
          v41 = v26;
          v27 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v26);
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v28 = obj;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v43;
            do
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v43 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v33, "identity");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "displayMonitor:didConnectIdentity:withConfiguration:", v6, v34, v33);

                }
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
            }
            while (v30);
          }

          v26 = v41 + 1;
        }
        while (v41 + 1 != v39);
        v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
      }
      while (v39);
    }

    v7 = v35;
  }

}

void __39__FBSDisplaySource__lock_noteConnected__block_invoke_105(uint64_t a1)
{
  id WeakRetained;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
  -[FBSDisplaySource _lock_setAttachment:](*(const os_unfair_lock **)(a1 + 32), 3u);
  -[FBSDisplaySource _lock_setRawReportedConfiguration:effectiveReportedConfigurations:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v8);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = objc_msgSend(WeakRetained, "canPostToBookendObserver");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v4 + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 88));
  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v7 + 120))
    -[FBSDisplaySource _callOutQueue_postToObservers:includeBookendObserver:connected:](v7, WeakRetained, v3, v8);
  if (v5 != v6)
    -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](*(_QWORD *)(a1 + 32), 0, 0);

}

uint64_t __39__FBSDisplaySource__lock_noteConnected__block_invoke_2(uint64_t a1)
{
  return -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](*(_QWORD *)(a1 + 32), 0, 0);
}

void __39__FBSDisplaySource__lock_noteConnected__block_invoke_3(uint64_t a1)
{
  -[FBSDisplaySource _callOutQueue_postToObservers:includeBookendObserver:connected:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(void **)(a1 + 48));
  if (*(_BYTE *)(a1 + 57))
    -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](*(_QWORD *)(a1 + 32), 0, 0);
}

void __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke(uint64_t a1)
{
  os_unfair_lock_s **v2;
  void *v3;
  char v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id WeakRetained;
  uint64_t v31;
  uint64_t *v32;
  void *v33;
  id v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(*(id *)&(*v2)[12]._os_unfair_lock_opaque, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BSEqualObjects();

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rawConfiguration.identity must match on update : old=%@ new=%@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(a1 + 48));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke_cold_1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7489C8);
  }
  if (BSEqualObjects())
  {
    v5 = *(unsigned __int8 *)(a1 + 64);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
    if (!v5)
      return;
  }
  else
  {
    os_unfair_lock_unlock(*v2 + 22);
  }
  -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v29 = objc_msgSend(WeakRetained, "canPostToBookendObserver");
  v31 = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
  v33 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke_115;
  v47[3] = &unk_1E38EDD20;
  v10 = v8;
  v48 = v10;
  v34 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v47);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v45[0] = v9;
  v45[1] = 3221225472;
  v45[2] = __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke_2;
  v45[3] = &unk_1E38EDD20;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v46 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v45);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v17, "identity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v14, "addObject:", v17);
          objc_msgSend(v33, "removeObject:", v17);
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }
  v32 = (uint64_t *)v2;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = v34;
  v20 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v35);
        v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(v25, "identity");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          if (!v22)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v22, "addObject:", v25);
        }
      }
      v21 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }

  if (objc_msgSend(v22, "count"))
    -[FBSDisplaySource _callOutQueue_postToObservers:includeBookendObserver:disconnected:](*v32, WeakRetained, v29, v22);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(v31 + 32) + 88));
  -[FBSDisplaySource _lock_setRawReportedConfiguration:effectiveReportedConfigurations:](*(_QWORD *)(v31 + 32), *(void **)(v31 + 48), obj);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(v31 + 32) + 88));
  if (objc_msgSend(v14, "count"))
    -[FBSDisplaySource _callOutQueue_postToObservers:includeBookendObserver:connected:](*v32, WeakRetained, v29, v14);
  if (objc_msgSend(v33, "count"))
    -[FBSDisplaySource _callOutQueue_postToObservers:includeBookendObserver:updated:](*v32, WeakRetained, v29, v33);

}

void __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke_115(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

- (void)_callOutQueue_postToObservers:(int)a3 includeBookendObserver:(void *)a4 disconnected:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  _BYTE v59[10];
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v33 = a3;
    BSDispatchQueueAssert();
    v34 = v8;
    objc_msgSend(v8, "bs_map:", &__block_literal_global_128);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v52 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          BKLogDisplay();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = *(_DWORD *)(a1 + 100);
            v16 = *(_DWORD *)(a1 + 104);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v59 = v15;
            *(_WORD *)&v59[4] = 1024;
            *(_DWORD *)&v59[6] = v16;
            v60 = 2114;
            v61 = v13;
            _os_log_impl(&dword_19A6D4000, v14, OS_LOG_TYPE_DEFAULT, "[FBSDisplaySource %u-%u] disconnecting %{public}@", buf, 0x18u);
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      }
      while (v10);
    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v7, "observers");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    if (v37)
    {
      v36 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v48 != v36)
            objc_enumerationMutation(v35);
          v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v19 = obj;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v44;
            do
            {
              for (k = 0; k != v21; ++k)
              {
                if (*(_QWORD *)v44 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * k);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v18, "displayMonitor:willDisconnectIdentity:", v7, v24);
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
            }
            while (v21);
          }

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      }
      while (v37);
    }

    if (v33)
    {
      objc_msgSend(v7, "bookendObserver");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v26 = obj;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v40;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v40 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v30);
            BKLogDisplay();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v59 = v31;
              _os_log_debug_impl(&dword_19A6D4000, v32, OS_LOG_TYPE_DEBUG, "posting bookend disconnect %@", buf, 0xCu);
            }

            if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v25, "displayMonitor:willDisconnectIdentity:", v7, v31);
            ++v30;
          }
          while (v28 != v30);
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
        }
        while (v28);
      }

    }
    v8 = v34;
  }

}

- (void)_callOutQueue_postToObservers:(int)a3 includeBookendObserver:(void *)a4 updated:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v39;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[4];
  _BYTE v62[10];
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (a1)
  {
    BSDispatchQueueAssert();
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v35 = v7;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v55 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          BKLogDisplay();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = *(_DWORD *)(a1 + 100);
            v15 = *(_DWORD *)(a1 + 104);
            objc_msgSend(v12, "succinctDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v62 = v14;
            *(_WORD *)&v62[4] = 1024;
            *(_DWORD *)&v62[6] = v15;
            v63 = 2114;
            v64 = v16;
            _os_log_impl(&dword_19A6D4000, v13, OS_LOG_TYPE_DEFAULT, "[FBSDisplaySource %u-%u] updating %{public}@", buf, 0x18u);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      }
      while (v9);
    }

    if (a3)
    {
      objc_msgSend(v6, "bookendObserver");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v18 = obj;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v51;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v51 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v22);
            BKLogDisplay();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v62 = v23;
              _os_log_debug_impl(&dword_19A6D4000, v24, OS_LOG_TYPE_DEBUG, "posting bookend update %@", buf, 0xCu);
            }

            if (v17 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v23, "identity");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "displayMonitor:didUpdateIdentity:withConfiguration:", v6, v25, v23);

            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
        }
        while (v20);
      }

    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v6, "observers");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    if (v39)
    {
      v37 = *(_QWORD *)v47;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v47 != v37)
            objc_enumerationMutation(v36);
          v41 = v26;
          v27 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v26);
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v28 = obj;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v43;
            do
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v43 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v33, "identity");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "displayMonitor:didUpdateIdentity:withConfiguration:", v6, v34, v33);

                }
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
            }
            while (v30);
          }

          v26 = v41 + 1;
        }
        while (v41 + 1 != v39);
        v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
      }
      while (v39);
    }

    v7 = v35;
  }

}

void __43__FBSDisplaySource__lock_noteDisconnecting__block_invoke(uint64_t a1)
{
  os_unfair_lock_s **v1;
  id *v2;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v1 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
  v2 = (id *)*v1;
  if (*(_QWORD *)&(*v1)[12]._os_unfair_lock_opaque)
  {
    v3 = v2 + 2;
    v4 = v2[7];
    WeakRetained = objc_loadWeakRetained(v3);
    os_unfair_lock_unlock(*v1 + 22);
    -[FBSDisplaySource _callOutQueue_postToObservers:includeBookendObserver:disconnected:]((uint64_t)*v1, WeakRetained, objc_msgSend(WeakRetained, "canPostToBookendObserver"), v4);
    os_unfair_lock_lock(*v1 + 22);
    -[FBSDisplaySource _lock_setAttachment:](*v1, 0);
    -[FBSDisplaySource _lock_setRawReportedConfiguration:effectiveReportedConfigurations:]((uint64_t)*v1, 0, 0);
    os_unfair_lock_unlock(*v1 + 22);
    -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](*v1, 0, 0);

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("reported configuration cannot be nil : %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __43__FBSDisplaySource__lock_noteDisconnecting__block_invoke_cold_1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __86__FBSDisplaySource__callOutQueue_postToObservers_includeBookendObserver_disconnected___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identity");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  NSObject *v8;
  unsigned int displayID;
  unsigned int instanceID;
  _DWORD v11[2];
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  BKLogDisplay();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    displayID = self->_displayID;
    instanceID = self->_instanceID;
    v11[0] = 67109634;
    v11[1] = displayID;
    v12 = 1024;
    v13 = instanceID;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19A6D4000, v8, OS_LOG_TYPE_DEFAULT, "[FBSDisplaySource %u-%u] KVO: did change %@", (uint8_t *)v11, 0x18u);
  }

  -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:]((uint64_t)self, 0, 0);
}

- (uint64_t)displayID
{
  if (result)
    return *(unsigned int *)(result + 100);
  return result;
}

- (void)initWithDisplay:alwaysConnected:triggers:monitor:.cold.1()
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

- (void)initWithDisplay:alwaysConnected:triggers:monitor:.cold.2()
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

- (void)initWithDisplay:alwaysConnected:triggers:monitor:.cold.3()
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

- (void)_updateForInitialization:forTransformInvalidation:.cold.1()
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

- (void)_updateForInitialization:forTransformInvalidation:.cold.2()
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

- (void)_updateForInitialization:forTransformInvalidation:.cold.3()
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

- (void)_lock_setRawConfiguration:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  int v4;
  int v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 100);
  v5 = *(_DWORD *)(a1 + 104);
  objc_msgSend(*a2, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109634;
  v7[1] = v4;
  v8 = 1024;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  _os_log_debug_impl(&dword_19A6D4000, a3, OS_LOG_TYPE_DEBUG, "[FBSDisplaySource %u-%u] raw config updated to %@", (uint8_t *)v7, 0x18u);

}

- (void)_lock_setRawReportedConfiguration:effectiveReportedConfigurations:.cold.1()
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

- (void)_lock_noteUpdatedForTransformInvalidation:.cold.1()
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

- (void)_lock_noteUpdatedForTransformInvalidation:.cold.2()
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

- (void)_lock_noteUpdatedForTransformInvalidation:.cold.3()
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

- (void)_transformDisplaysIfNecessaryFromDisplayConfiguration:.cold.1()
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

- (void)_transformDisplaysIfNecessaryFromDisplayConfiguration:.cold.2()
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

- (void)_transformDisplaysIfNecessaryFromDisplayConfiguration:.cold.3()
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

- (void)_transformDisplaysIfNecessaryFromDisplayConfiguration:.cold.4()
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

void __39__FBSDisplaySource__lock_noteConnected__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(*(SEL *)(v1 + 48));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_17_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(*(SEL *)(v1 + 56));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_17_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __43__FBSDisplaySource__lock_noteDisconnecting__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(*(SEL *)(v1 + 40));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_17_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
