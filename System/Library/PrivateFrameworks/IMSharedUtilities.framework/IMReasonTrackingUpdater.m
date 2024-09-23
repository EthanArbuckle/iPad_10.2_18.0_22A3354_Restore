@implementation IMReasonTrackingUpdater

- (IMReasonTrackingUpdater)initWithLogHandle:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  IMReasonTrackingUpdater *v9;
  IMReasonTrackingUpdater *v10;
  NSCountedSet *v11;
  NSCountedSet *reasonsForNeedsUpdates;
  NSCountedSet *v13;
  NSCountedSet *reasonsForHoldingUpdates;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IMReasonTrackingUpdater;
  v9 = -[IMReasonTrackingUpdater init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logHandle, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    reasonsForNeedsUpdates = v10->_reasonsForNeedsUpdates;
    v10->_reasonsForNeedsUpdates = v11;

    v13 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    reasonsForHoldingUpdates = v10->_reasonsForHoldingUpdates;
    v10->_reasonsForHoldingUpdates = v13;

  }
  return v10;
}

- (void)setNeedsDeferredUpdateWithReason:(id)a3
{
  id v4;
  NSObject *logHandle;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_19E239000, logHandle, OS_LOG_TYPE_INFO, "Deffered update needed for reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[NSCountedSet addObject:](self->_reasonsForNeedsUpdates, "addObject:", v4);
  -[IMReasonTrackingUpdater _scheduleDeferredUpdateFollowingHoldForReason:](self, "_scheduleDeferredUpdateFollowingHoldForReason:", 0);

}

- (BOOL)needsUpdate
{
  return -[NSCountedSet count](self->_reasonsForNeedsUpdates, "count") != 0;
}

- (BOOL)isHoldingUpdates
{
  return -[NSCountedSet count](self->_reasonsForHoldingUpdates, "count") != 0;
}

- (void)endAllHoldsOnUpdatesForReason:(id)a3 updateTriggeredIfNotHeldShouldBeDeferred:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSObject *logHandle;
  NSCountedSet *reasonsForHoldingUpdates;
  int v11;
  id v12;
  __int16 v13;
  NSCountedSet *v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[NSCountedSet countForObject:](self->_reasonsForHoldingUpdates, "countForObject:", v6);
  if (v7)
  {
    v8 = v7;
    do
    {
      -[NSCountedSet removeObject:](self->_reasonsForHoldingUpdates, "removeObject:", v6);
      --v8;
    }
    while (v8);
  }
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    reasonsForHoldingUpdates = self->_reasonsForHoldingUpdates;
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = reasonsForHoldingUpdates;
    _os_log_impl(&dword_19E239000, logHandle, OS_LOG_TYPE_INFO, "End all holds on updates for reason %{public}@ remaining hold reasons: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  -[IMReasonTrackingUpdater _handleReasonsForHoldingUpdatesChangeForReason:updateTriggeredIfNotHeldShouldBeDeferred:](self, "_handleReasonsForHoldingUpdatesChangeForReason:updateTriggeredIfNotHeldShouldBeDeferred:", v6, v4);

}

- (IMReasonTrackingUpdaterDelegate)delegate
{
  return (IMReasonTrackingUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)beginHoldingUpdatesForReason:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *logHandle;
  NSCountedSet *reasonsForHoldingUpdates;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  NSCountedSet *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IMReasonTrackingUpdater isHoldingUpdates](self, "isHoldingUpdates");
  -[NSCountedSet addObject:](self->_reasonsForHoldingUpdates, "addObject:", v4);
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    reasonsForHoldingUpdates = self->_reasonsForHoldingUpdates;
    v9 = 138543618;
    v10 = v4;
    v11 = 2114;
    v12 = reasonsForHoldingUpdates;
    _os_log_impl(&dword_19E239000, logHandle, OS_LOG_TYPE_INFO, "Begin holding updates for reason %{public}@ allHoldReasons: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  if (!v5)
  {
    -[IMReasonTrackingUpdater delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reasonTrackingUpdater:didBeginHoldingUpdatesWithInitialReason:", self, v4);

  }
}

- (void)_triggerNeedsUpdateFollowingHoldForReason:(id)a3
{
  id v4;
  NSObject *logHandle;
  NSCountedSet *reasonsForHoldingUpdates;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSCountedSet *v10;
  NSObject *v11;
  id WeakRetained;
  NSObject *v13;
  int v14;
  NSCountedSet *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_hasPendingDeferredUpdate = 0;
  if (-[IMReasonTrackingUpdater isHoldingUpdates](self, "isHoldingUpdates"))
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      reasonsForHoldingUpdates = self->_reasonsForHoldingUpdates;
      v14 = 138543362;
      v15 = reasonsForHoldingUpdates;
      v7 = "Did not trigger an update because we are holding updates for reasons: %{public}@";
      v8 = logHandle;
      v9 = 12;
LABEL_10:
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v14, v9);
    }
  }
  else if (-[IMReasonTrackingUpdater needsUpdate](self, "needsUpdate"))
  {
    v10 = (NSCountedSet *)-[NSCountedSet copy](self->_reasonsForNeedsUpdates, "copy");
    -[NSCountedSet removeAllObjects](self->_reasonsForNeedsUpdates, "removeAllObjects");
    v11 = self->_logHandle;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Triggering an update for reasons: %{public}@ following hold for reason: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "reasonTrackingUpdater:needsUpdateForReasons:followingHoldForReason:", self, v10, v4);

  }
  else
  {
    v13 = self->_logHandle;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      v7 = "Did not trigger an update because there was no pending update reason";
      v8 = v13;
      v9 = 2;
      goto LABEL_10;
    }
  }

}

- (void)_scheduleDeferredUpdateFollowingHoldForReason:(id)a3
{
  id v4;
  NSObject *logHandle;
  NSCountedSet *reasonsForHoldingUpdates;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  _BOOL4 hasPendingDeferredUpdate;
  NSObject *v11;
  _BOOL4 v12;
  NSCountedSet *reasonsForNeedsUpdates;
  int v14;
  NSCountedSet *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMReasonTrackingUpdater isHoldingUpdates](self, "isHoldingUpdates"))
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      reasonsForHoldingUpdates = self->_reasonsForHoldingUpdates;
      v14 = 138543362;
      v15 = reasonsForHoldingUpdates;
      v7 = "Did not schedule a deferred update because we are stil holding updates for reasons: %{public}@";
      v8 = logHandle;
      v9 = 12;
LABEL_7:
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v14, v9);
    }
  }
  else
  {
    hasPendingDeferredUpdate = self->_hasPendingDeferredUpdate;
    v11 = self->_logHandle;
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (hasPendingDeferredUpdate)
    {
      if (v12)
      {
        LOWORD(v14) = 0;
        v7 = "Already have a pending deffered update, not necessary to schedule an additional deferred update";
        v8 = v11;
        v9 = 2;
        goto LABEL_7;
      }
    }
    else
    {
      if (v12)
      {
        reasonsForNeedsUpdates = self->_reasonsForNeedsUpdates;
        v14 = 138543618;
        v15 = reasonsForNeedsUpdates;
        v16 = 2114;
        v17 = v4;
        _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Scheduling a deffered update for reasons: %{public}@ following hold for reason: %{public}@", (uint8_t *)&v14, 0x16u);
      }
      self->_hasPendingDeferredUpdate = 1;
      -[IMReasonTrackingUpdater performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__triggerNeedsUpdateFollowingHoldForReason_, v4, 0.0);
    }
  }

}

- (void)_handleReasonsForHoldingUpdatesChangeForReason:(id)a3 updateTriggeredIfNotHeldShouldBeDeferred:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *logHandle;
  uint8_t v9[16];

  v4 = a4;
  v6 = a3;
  if (!-[IMReasonTrackingUpdater isHoldingUpdates](self, "isHoldingUpdates"))
  {
    -[IMReasonTrackingUpdater delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reasonTrackingUpdater:didEndHoldingUpdatesWithFinalReason:", self, v6);

    if (-[IMReasonTrackingUpdater needsUpdate](self, "needsUpdate"))
    {
      if (v4)
        -[IMReasonTrackingUpdater _scheduleDeferredUpdateFollowingHoldForReason:](self, "_scheduleDeferredUpdateFollowingHoldForReason:", v6);
      else
        -[IMReasonTrackingUpdater _triggerNeedsUpdateFollowingHoldForReason:](self, "_triggerNeedsUpdateFollowingHoldForReason:", v6);
    }
    else
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_19E239000, logHandle, OS_LOG_TYPE_INFO, "There are no remaining holds on updates, but an update is not currently needed.", v9, 2u);
      }
    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMReasonTrackingUpdater;
  -[IMReasonTrackingUpdater description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ reasonsForNeedsUpdates: %@ reasonsForHoldingUpdates: %@"), v4, self->_reasonsForNeedsUpdates, self->_reasonsForHoldingUpdates);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)activeUpdaterHoldsCount
{
  return -[NSCountedSet count](self->_reasonsForHoldingUpdates, "count");
}

- (BOOL)isHoldingUpdatesForReason:(id)a3
{
  return -[NSCountedSet countForObject:](self->_reasonsForHoldingUpdates, "countForObject:", a3) != 0;
}

- (void)updateImmediatelyWithReason:(id)a3
{
  id v4;
  NSObject *logHandle;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_19E239000, logHandle, OS_LOG_TYPE_INFO, "Immediate update needed for reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[NSCountedSet addObject:](self->_reasonsForNeedsUpdates, "addObject:", v4);
  -[IMReasonTrackingUpdater _triggerNeedsUpdateFollowingHoldForReason:](self, "_triggerNeedsUpdateFollowingHoldForReason:", 0);

}

- (void)updateImmediatelyIfNeeded
{
  -[IMReasonTrackingUpdater _triggerNeedsUpdateFollowingHoldForReason:](self, "_triggerNeedsUpdateFollowingHoldForReason:", 0);
}

- (void)endHoldingUpdatesForReason:(id)a3 updateTriggeredIfNotHeldShouldBeDeferred:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *logHandle;
  NSCountedSet *reasonsForHoldingUpdates;
  int v9;
  id v10;
  __int16 v11;
  NSCountedSet *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSCountedSet removeObject:](self->_reasonsForHoldingUpdates, "removeObject:", v6);
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    reasonsForHoldingUpdates = self->_reasonsForHoldingUpdates;
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = reasonsForHoldingUpdates;
    _os_log_impl(&dword_19E239000, logHandle, OS_LOG_TYPE_INFO, "End holding updates for reason %{public}@ remaining hold reasons: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  -[IMReasonTrackingUpdater _handleReasonsForHoldingUpdatesChangeForReason:updateTriggeredIfNotHeldShouldBeDeferred:](self, "_handleReasonsForHoldingUpdatesChangeForReason:updateTriggeredIfNotHeldShouldBeDeferred:", v6, v4);

}

- (void)endHoldingUpdatesForAllReasonsWithPotentialUpdateDeferred:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t *p_reasonsForHoldingUpdates;
  NSObject *logHandle;
  void *v7;

  v3 = a3;
  p_reasonsForHoldingUpdates = (uint64_t *)&self->_reasonsForHoldingUpdates;
  if (-[NSCountedSet count](self->_reasonsForHoldingUpdates, "count"))
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      sub_19E36D0F0(p_reasonsForHoldingUpdates, logHandle);
    -[NSCountedSet anyObject](self->_reasonsForHoldingUpdates, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet removeAllObjects](self->_reasonsForHoldingUpdates, "removeAllObjects");
    -[IMReasonTrackingUpdater _handleReasonsForHoldingUpdatesChangeForReason:updateTriggeredIfNotHeldShouldBeDeferred:](self, "_handleReasonsForHoldingUpdatesChangeForReason:updateTriggeredIfNotHeldShouldBeDeferred:", v7, v3);

  }
}

- (void)cancelAllPendingDeferredUpdates
{
  void *v3;
  NSObject *logHandle;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_hasPendingDeferredUpdate)
  {
    self->_hasPendingDeferredUpdate = 0;
    v3 = (void *)-[NSCountedSet copy](self->_reasonsForNeedsUpdates, "copy");
    -[NSCountedSet removeAllObjects](self->_reasonsForNeedsUpdates, "removeAllObjects");
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_19E239000, logHandle, OS_LOG_TYPE_INFO, "Cancelling pending deferred update for reasons %{public}@. Update was already triggered externally.", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (void)setLogHandle:(id)a3
{
  objc_storeStrong((id *)&self->_logHandle, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSCountedSet)reasonsForNeedsUpdates
{
  return self->_reasonsForNeedsUpdates;
}

- (void)setReasonsForNeedsUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_reasonsForNeedsUpdates, a3);
}

- (NSCountedSet)reasonsForHoldingUpdates
{
  return self->_reasonsForHoldingUpdates;
}

- (void)setReasonsForHoldingUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_reasonsForHoldingUpdates, a3);
}

- (BOOL)hasPendingDeferredUpdate
{
  return self->_hasPendingDeferredUpdate;
}

- (void)setHasPendingDeferredUpdate:(BOOL)a3
{
  self->_hasPendingDeferredUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonsForHoldingUpdates, 0);
  objc_storeStrong((id *)&self->_reasonsForNeedsUpdates, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logHandle, 0);
}

@end
