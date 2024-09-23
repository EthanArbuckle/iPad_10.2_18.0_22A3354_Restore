@implementation CAMClosedViewfinderController

- (CAMClosedViewfinderController)init
{
  CAMClosedViewfinderController *v2;
  NSMutableSet *v3;
  NSMutableSet *reasonsForClosingViewfinder;
  void *v5;
  CAMClosedViewfinderController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMClosedViewfinderController;
  v2 = -[CAMClosedViewfinderController init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    reasonsForClosingViewfinder = v2->__reasonsForClosingViewfinder;
    v2->__reasonsForClosingViewfinder = v3;

    -[CAMClosedViewfinderController _setReferenceTime:](v2, "_setReferenceTime:", CFAbsoluteTimeGetCurrent());
    -[CAMClosedViewfinderController _setReferenceTimeEvent:](v2, "_setReferenceTimeEvent:", 0);
    +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:priority:selector:name:object:", v2, 0, sel__handleApplicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);
    objc_msgSend(v5, "addObserver:priority:selector:name:object:", v2, 0, sel__handleApplicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);
    objc_msgSend(v5, "addObserver:priority:selector:name:object:", v2, 0, sel__handleApplicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
    v6 = v2;

  }
  return v2;
}

- (void)_setReferenceTime:(double)a3
{
  self->__referenceTime = a3;
}

- (void)_setReferenceTimeEvent:(int64_t)a3
{
  self->__referenceTimeEvent = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isViewfinderClosed
{
  void *v2;
  BOOL v3;

  -[CAMClosedViewfinderController _reasonsForClosingViewfinder](self, "_reasonsForClosingViewfinder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSMutableSet)_reasonsForClosingViewfinder
{
  return self->__reasonsForClosingViewfinder;
}

- (void)removeClosedViewfinderReason:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CAMClosedViewfinderController cancelDelayedRemovalOfReason:](self, "cancelDelayedRemovalOfReason:");
  -[CAMClosedViewfinderController _reasonsForClosingViewfinder](self, "_reasonsForClosingViewfinder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v7);

  v8 = objc_msgSend(v5, "count");
  v9 = v8;
  if (v6 && !v8)
  {
    -[CAMClosedViewfinderController descriptionForTimeBetweenReferenceAndNow](self, "descriptionForTimeBetweenReferenceAndNow");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMClosedViewfinderController _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Opening closed viewfinder for final reason %{public}@ %{public}@", (uint8_t *)&v15, 0x16u);

    }
    -[CAMClosedViewfinderController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "closedViewfinderController:wantsViewfinderOpenForReason:", self, a3);
    -[CAMClosedViewfinderController _cancelDelayedLoggingForClosedViewfinder](self, "_cancelDelayedLoggingForClosedViewfinder");
    goto LABEL_9;
  }
  if (v6 != v8)
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:

      goto LABEL_11;
    }
    -[CAMClosedViewfinderController _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMClosedViewfinderController _descriptionForReasons:](self, "_descriptionForReasons:", v5);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v13;
    v17 = 2114;
    v18 = v14;
    _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Removed closed viewfinder reason %{public}@: %{public}@", (uint8_t *)&v15, 0x16u);

LABEL_9:
    goto LABEL_10;
  }
LABEL_11:
  if ((a3 | 4) == 0xC && v9 && -[CAMClosedViewfinderController _referenceTimeEvent](self, "_referenceTimeEvent") == 1)
    -[CAMClosedViewfinderController _updateReferenceTimeToNowForEvent:](self, "_updateReferenceTimeToNowForEvent:", 1);

}

- (void)cancelDelayedRemovalOfReason:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CAMClosedViewfinderController _reasonsForClosingViewfinder](self, "_reasonsForClosingViewfinder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[CAMClosedViewfinderController _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMClosedViewfinderController _descriptionForReasons:](self, "_descriptionForReasons:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_debug_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEBUG, "ClosedViewfinderController: Cancelling delayed removal of closed viewfinder reason %{public}@: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMClosedViewfinderController cancelPreviousPerformRequestsWithTarget:selector:object:](CAMClosedViewfinderController, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__performDelayedRemovalOfReason_, v7);

}

- (void)_handleApplicationDidBecomeActive:(id)a3
{
  if ((unint64_t)(-[CAMClosedViewfinderController _referenceTimeEvent](self, "_referenceTimeEvent", a3) - 1) <= 1)
    -[CAMClosedViewfinderController _updateReferenceTimeToNowForEvent:](self, "_updateReferenceTimeToNowForEvent:", 2);
}

- (int64_t)_referenceTimeEvent
{
  return self->__referenceTimeEvent;
}

- (void)removeClosedViewfinderReason:(int64_t)a3 afterDelay:(double)a4
{
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CAMClosedViewfinderController _reasonsForClosingViewfinder](self, "_reasonsForClosingViewfinder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v8))
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMClosedViewfinderController _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMClosedViewfinderController _descriptionForReasons:](self, "_descriptionForReasons:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2048;
      v15 = a4;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Will remove closed viewfinder reason %{public}@ after delay %f: %{public}@", (uint8_t *)&v12, 0x20u);

    }
    -[CAMClosedViewfinderController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performDelayedRemovalOfReason_, v8, a4);
  }

}

- (id)descriptionForTimeBetweenReferenceAndNow
{
  double Current;
  double v4;
  double v5;
  void *v6;
  void *v7;

  Current = CFAbsoluteTimeGetCurrent();
  -[CAMClosedViewfinderController _referenceTime](self, "_referenceTime");
  v5 = Current - v4;
  -[CAMClosedViewfinderController _descriptionStringForReferenceTimeEvent:](self, "_descriptionStringForReferenceTimeEvent:", -[CAMClosedViewfinderController _referenceTimeEvent](self, "_referenceTimeEvent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f seconds after %@"), *(_QWORD *)&v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)_referenceTime
{
  return self->__referenceTime;
}

- (id)_descriptionStringForReferenceTimeEvent:(int64_t)a3
{
  unint64_t v3;

  v3 = -[CAMClosedViewfinderController _referenceTimeEvent](self, "_referenceTimeEvent", a3);
  if (v3 > 3)
    return &stru_1EA3325A0;
  else
    return off_1EA32B970[v3];
}

- (void)addClosedViewfinderReason:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CAMClosedViewfinderController cancelDelayedRemovalOfReason:](self, "cancelDelayedRemovalOfReason:");
  -[CAMClosedViewfinderController _reasonsForClosingViewfinder](self, "_reasonsForClosingViewfinder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  v8 = objc_msgSend(v5, "count");
  if (!v6 && v8)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMClosedViewfinderController _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v10;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Closed viewfinder for reason %{public}@", (uint8_t *)&v16, 0xCu);

    }
    -[CAMClosedViewfinderController delegate](self, "delegate");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject closedViewfinderController:wantsViewfinderClosedForReason:](v11, "closedViewfinderController:wantsViewfinderClosedForReason:", self, a3);
    -[CAMClosedViewfinderController _updateReferenceTimeToNowForEvent:](self, "_updateReferenceTimeToNowForEvent:", 1);
    goto LABEL_16;
  }
  if (v6 != v8)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMClosedViewfinderController _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMClosedViewfinderController _descriptionForReasons:](self, "_descriptionForReasons:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Added closed viewfinder reason %{public}@: %{public}@", (uint8_t *)&v16, 0x16u);

    }
LABEL_16:

    if ((unint64_t)a3 <= 0x16 && ((1 << a3) & 0x7FD980) != 0)
      goto LABEL_18;
    goto LABEL_19;
  }
  if ((unint64_t)a3 <= 0x16)
  {
    if (((1 << a3) & 0x7FD980) != 0)
    {
LABEL_18:
      -[CAMClosedViewfinderController _cancelDelayedLoggingForClosedViewfinder](self, "_cancelDelayedLoggingForClosedViewfinder");
      goto LABEL_19;
    }
    if (!a3 && objc_msgSend(v5, "count") == 1)
    {
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Viewfinder closed for device position change reversal", (uint8_t *)&v16, 2u);
      }

      -[CAMClosedViewfinderController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "closedViewfinderController:wantsViewfinderClosedForReason:", self, 0);

    }
  }
LABEL_19:

}

- (id)_descriptionStringForReason:(int64_t)a3
{
  if ((unint64_t)a3 > 0x16)
    return 0;
  else
    return off_1EA32B990[a3];
}

- (CAMClosedViewfinderControllerDelegate)delegate
{
  return (CAMClosedViewfinderControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_updateReferenceTimeToNowForEvent:(int64_t)a3
{
  -[CAMClosedViewfinderController _setReferenceTime:](self, "_setReferenceTime:", CFAbsoluteTimeGetCurrent());
  -[CAMClosedViewfinderController _setReferenceTimeEvent:](self, "_setReferenceTimeEvent:", a3);
  -[CAMClosedViewfinderController _scheduleLogWarningIfViewfinderStillClosedAfterDelay:](self, "_scheduleLogWarningIfViewfinderStillClosedAfterDelay:", 3.0);
}

- (void)_scheduleLogWarningIfViewfinderStillClosedAfterDelay:(double)a3
{
  -[CAMClosedViewfinderController _cancelDelayedLoggingForClosedViewfinder](self, "_cancelDelayedLoggingForClosedViewfinder");
  -[CAMClosedViewfinderController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__logWarningIfViewfinderStillClosed, 0, a3);
}

- (void)_cancelDelayedLoggingForClosedViewfinder
{
  +[CAMClosedViewfinderController cancelPreviousPerformRequestsWithTarget:selector:object:](CAMClosedViewfinderController, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__logWarningIfViewfinderStillClosed, 0);
}

- (id)_descriptionForReasons:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  __CFString *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, unint64_t);
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  CAMClosedViewfinderController *v23;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __56__CAMClosedViewfinderController__descriptionForReasons___block_invoke;
    v21[3] = &unk_1EA32B838;
    v22 = v5;
    v23 = self;
    v7 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v21);
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v6;
    v16 = 3221225472;
    v17 = __56__CAMClosedViewfinderController__descriptionForReasons___block_invoke_3;
    v18 = &unk_1EA32B8A0;
    v10 = objc_retain((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("(")));
    v19 = v10;
    v20 = v9;
    v11 = v9;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v15);
    objc_msgSend(v10, "appendString:", CFSTR(")"), v15, v16, v17, v18);
    v12 = v20;
    v13 = (__CFString *)v10;

  }
  else
  {
    v13 = &stru_1EA3325A0;
  }

  return v13;
}

void __56__CAMClosedViewfinderController__descriptionForReasons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(a2, "integerValue");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_descriptionStringForReason:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

uint64_t __56__CAMClosedViewfinderController__descriptionForReasons___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CAMClosedViewfinderController;
  -[CAMClosedViewfinderController dealloc](&v4, sel_dealloc);
}

- (BOOL)hasClosedViewfinderReason:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[CAMClosedViewfinderController _reasonsForClosingViewfinder](self, "_reasonsForClosingViewfinder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (void)_performDelayedRemovalOfReason:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CAMClosedViewfinderController _reasonsForClosingViewfinder](self, "_reasonsForClosingViewfinder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", v4))
    {
      v6 = objc_msgSend(v4, "integerValue");
      v7 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMClosedViewfinderController _descriptionStringForReason:](self, "_descriptionStringForReason:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v8;
        _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Removing closed viewfinder reason %{public}@ since delay has passed", (uint8_t *)&v9, 0xCu);

      }
      -[CAMClosedViewfinderController removeClosedViewfinderReason:](self, "removeClosedViewfinderReason:", v6);
    }

  }
}

- (void)_handleApplicationWillEnterForeground:(id)a3
{
  if ((-[CAMClosedViewfinderController _referenceTimeEvent](self, "_referenceTimeEvent", a3) | 2) == 3)
    -[CAMClosedViewfinderController _updateReferenceTimeToNowForEvent:](self, "_updateReferenceTimeToNowForEvent:", 3);
}

- (void)_logWarningIfViewfinderStillClosed
{
  void *v3;
  double Current;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  double v12;
  __int16 v13;
  NSObject *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[CAMClosedViewfinderController isViewfinderClosed](self, "isViewfinderClosed"))
  {
    -[CAMClosedViewfinderController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[CAMClosedViewfinderController _referenceTime](self, "_referenceTime");
      v6 = Current - v5;
      -[CAMClosedViewfinderController _descriptionStringForReferenceTimeEvent:](self, "_descriptionStringForReferenceTimeEvent:", -[CAMClosedViewfinderController _referenceTimeEvent](self, "_referenceTimeEvent"));
      v7 = objc_claimAutoreleasedReturnValue();
      -[CAMClosedViewfinderController _reasonsForClosingViewfinder](self, "_reasonsForClosingViewfinder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMClosedViewfinderController _descriptionForReasons:](self, "_descriptionForReasons:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 134218498;
        v12 = v6;
        v13 = 2114;
        v14 = v7;
        v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Viewfinder still closed %.3f seconds after %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);

      }
      -[CAMClosedViewfinderController _scheduleLogWarningIfViewfinderStillClosedAfterDelay:](self, "_scheduleLogWarningIfViewfinderStillClosedAfterDelay:", v6 * 0.5);

    }
    else
    {
      v7 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Stopping logging of closed viewfinder because delegate is gone", (uint8_t *)&v11, 2u);
      }
    }

  }
}

uint64_t __56__CAMClosedViewfinderController__descriptionForReasons___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (result - 1 > a3)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reasonsForClosingViewfinder, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
