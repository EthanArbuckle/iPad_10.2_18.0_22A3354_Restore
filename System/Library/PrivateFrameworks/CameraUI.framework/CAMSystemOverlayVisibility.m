@implementation CAMSystemOverlayVisibility

- (CAMSystemOverlayVisibility)init
{
  CAMSystemOverlayVisibility *v2;
  uint64_t v3;
  NSMutableSet *activeReasons;
  NSString *name;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMSystemOverlayVisibility;
  v2 = -[CAMSystemOverlayVisibility init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    activeReasons = v2->__activeReasons;
    v2->__activeReasons = (NSMutableSet *)v3;

    name = v2->_name;
    v2->_name = (NSString *)CFSTR("OverlayVisibility");

  }
  return v2;
}

- (BOOL)isVisible
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CAMSystemOverlayVisibility _activeReasons](self, "_activeReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[CAMSystemOverlayVisibility _delayedHidingTimer](self, "_delayedHidingTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)addReason:(int64_t)a3
{
  BOOL v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v5 = -[CAMSystemOverlayVisibility isVisible](self, "isVisible");
  -[CAMSystemOverlayVisibility _cancelTimer](self, "_cancelTimer");
  -[CAMSystemOverlayVisibility _activeReasons](self, "_activeReasons");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v10, "containsObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);

  if (v5)
  {
    if ((v7 & 1) == 0)
      -[CAMSystemOverlayVisibility _logReason:visibilityChanged:](self, "_logReason:visibilityChanged:", a3, 0);
  }
  else
  {
    -[CAMSystemOverlayVisibility _logReason:visibilityChanged:](self, "_logReason:visibilityChanged:", a3, 1);
    -[CAMSystemOverlayVisibility delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemOverlayVisibility:changedForReason:", self, a3);

  }
}

- (void)removeReason:(int64_t)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[CAMSystemOverlayVisibility _activeReasons](self, "_activeReasons");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v10, "containsObject:", v5);

  v7 = objc_msgSend(v10, "count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v8);

  v9 = objc_msgSend(v10, "count");
  if (v7 && !v9)
    -[CAMSystemOverlayVisibility _startTimerWithReason:](self, "_startTimerWithReason:", a3);
  if (v6)
    -[CAMSystemOverlayVisibility _logReason:visibilityChanged:](self, "_logReason:visibilityChanged:", a3, 0);

}

- (void)hideImmediately
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[CAMSystemOverlayVisibility isVisible](self, "isVisible"))
  {
    -[CAMSystemOverlayVisibility _cancelTimer](self, "_cancelTimer");
    -[CAMSystemOverlayVisibility _activeReasons](self, "_activeReasons");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllObjects");

    v4 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMSystemOverlayVisibility name](self, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Changed to NO for hideImmediately", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (void)showTransiently
{
  if (!-[CAMSystemOverlayVisibility isVisible](self, "isVisible"))
  {
    -[CAMSystemOverlayVisibility _startTimerWithReason:](self, "_startTimerWithReason:", -1);
    -[CAMSystemOverlayVisibility _logReason:visibilityChanged:](self, "_logReason:visibilityChanged:", -1, 1);
  }
}

- (void)_cancelTimer
{
  NSObject *v3;
  void *v4;
  NSObject *v5;

  -[CAMSystemOverlayVisibility _delayedHidingTimer](self, "_delayedHidingTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    dispatch_source_cancel(v3);
    -[CAMSystemOverlayVisibility _setDelayedHidingTimer:](self, "_setDelayedHidingTimer:", 0);
    -[CAMSystemOverlayVisibility delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemOverlayVisibilityCancelledHidingTimer:", self);

    v3 = v5;
  }

}

- (void)_startTimerWithReason:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  id v11;
  _QWORD handler[4];
  id v13;
  id v14[2];
  id from;
  id location;

  -[CAMSystemOverlayVisibility delayedHideDuration](self, "delayedHideDuration");
  if (v5 == 0.0)
  {
    -[CAMSystemOverlayVisibility delegate](self, "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemOverlayVisibility:changedForReason:", self, a3);

  }
  else
  {
    v6 = v5;
    -[CAMSystemOverlayVisibility _cancelTimer](self, "_cancelTimer");
    v7 = v6 * 1000000000.0;
    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v9 = dispatch_time(0, (uint64_t)v7);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)((double)(uint64_t)v7 * 0.1));
    -[CAMSystemOverlayVisibility _setDelayedHidingTimer:](self, "_setDelayedHidingTimer:", v8);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v8);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __52__CAMSystemOverlayVisibility__startTimerWithReason___block_invoke;
    handler[3] = &unk_1EA32BA50;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(v14, &from);
    v14[1] = (id)a3;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(v8);
    -[CAMSystemOverlayVisibility delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "systemOverlayVisibilityBeganHidingTimer:", self);

    objc_destroyWeak(v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

void __52__CAMSystemOverlayVisibility__startTimerWithReason___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleTimer:firedWithReason:", v2, *(_QWORD *)(a1 + 48));

}

- (void)_handleTimer:(id)a3 firedWithReason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[CAMSystemOverlayVisibility _delayedHidingTimer](self, "_delayedHidingTimer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v9 && v9 == v6)
  {
    -[CAMSystemOverlayVisibility _cancelTimer](self, "_cancelTimer");
    -[CAMSystemOverlayVisibility _logReason:visibilityChanged:](self, "_logReason:visibilityChanged:", a4, 1);
    -[CAMSystemOverlayVisibility delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemOverlayVisibility:changedForReason:", self, a4);

    v7 = v9;
  }

}

- (void)_logReason:(int64_t)a3 visibilityChanged:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  os_log_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  unint64_t v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  const __CFString *v23;
  const __CFString *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  -[CAMSystemOverlayVisibility name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a3 + 1) > 4)
  {
    v8 = 0;
    if (!v4)
      goto LABEL_3;
  }
  else
  {
    v8 = off_1EA32BA70[a3 + 1];
    if (!v4)
    {
LABEL_3:
      -[CAMSystemOverlayVisibility _activeReasons](self, "_activeReasons");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "containsObject:", v10);

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = v9;
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "integerValue", (_QWORD)v25) + 1;
            if (v18 > 4)
              v19 = 0;
            else
              v19 = off_1EA32BA70[v18];
            objc_msgSend(v12, "addObject:", v19);
          }
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        }
        while (v15);
      }

      objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = os_log_create("com.apple.camera.overlay", "Angel");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v24 = CFSTR("removed");
        *(_DWORD *)buf = 138544130;
        v30 = v7;
        v31 = 2114;
        if (v11)
          v24 = CFSTR("added");
        v32 = v24;
        v33 = 2114;
        v34 = v8;
        v35 = 2114;
        v36 = v20;
        _os_log_debug_impl(&dword_1DB760000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ reason %{public}@: [%{public}@]", buf, 0x2Au);
      }

      goto LABEL_20;
    }
  }
  v13 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v22 = -[CAMSystemOverlayVisibility isVisible](self, "isVisible");
    v23 = CFSTR("NO");
    *(_DWORD *)buf = 138543874;
    v30 = v7;
    v31 = 2114;
    if (v22)
      v23 = CFSTR("YES");
    v32 = v23;
    v33 = 2114;
    v34 = v8;
    _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Changed to %{public}@ for reason %{public}@", buf, 0x20u);
  }
LABEL_20:

}

- (double)delayedHideDuration
{
  return self->_delayedHideDuration;
}

- (void)setDelayedHideDuration:(double)a3
{
  self->_delayedHideDuration = a3;
}

- (CAMSystemOverlayVisibilityDelegate)delegate
{
  return (CAMSystemOverlayVisibilityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSMutableSet)_activeReasons
{
  return self->__activeReasons;
}

- (OS_dispatch_source)_delayedHidingTimer
{
  return self->__delayedHidingTimer;
}

- (void)_setDelayedHidingTimer:(id)a3
{
  objc_storeStrong((id *)&self->__delayedHidingTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__delayedHidingTimer, 0);
  objc_storeStrong((id *)&self->__activeReasons, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
