@implementation HDAlertSuppressor

- (HDAlertSuppressor)initWithDaemon:(id)a3
{
  id v4;
  HDAlertSuppressor *v5;
  HDAlertSuppressor *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  HDAssertionManager *v9;
  HDAssertionManager *assertionManager;
  NSMutableSet *v11;
  NSMutableSet *waitingForSuspension;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDAlertSuppressor;
  v5 = -[HDAlertSuppressor init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    assertionManager = v6->_assertionManager;
    v6->_assertionManager = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    waitingForSuspension = v6->_waitingForSuspension;
    v6->_waitingForSuspension = v11;

    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v6->_assertionManager, "addObserver:forAssertionIdentifier:queue:", v6, CFSTR("HDWorkoutSessionAssertionIdentifierAlertSuppression"), v6->_queue);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[HDAssertionManager removeObserver:forAssertionIdentifier:](self->_assertionManager, "removeObserver:forAssertionIdentifier:", self, CFSTR("HDWorkoutSessionAssertionIdentifierAlertSuppression"));
  v3.receiver = self;
  v3.super_class = (Class)HDAlertSuppressor;
  -[HDAlertSuppressor dealloc](&v3, sel_dealloc);
}

- (id)createAndTakeAssertionForOwnerIdentifier:(id)a3 processBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  _HDAlertSuppressorAssertion *v8;
  id v9;
  uint64_t v10;
  NSString *processBundleIdentifier;
  _HDAlertSuppressorAssertion *v12;
  _HDAlertSuppressorAssertion *v13;
  objc_super v15;

  if (!a4)
    return 0;
  v6 = a4;
  v7 = a3;
  v8 = [_HDAlertSuppressorAssertion alloc];
  v9 = v6;
  if (v8)
  {
    v15.receiver = v8;
    v15.super_class = (Class)_HDAlertSuppressorAssertion;
    v8 = -[HDAlertSuppressor initWithAssertionIdentifier:ownerIdentifier:](&v15, sel_initWithAssertionIdentifier_ownerIdentifier_, CFSTR("HDWorkoutSessionAssertionIdentifierAlertSuppression"), v7);
    if (v8)
    {
      v10 = objc_msgSend(v9, "copy");
      processBundleIdentifier = v8->_processBundleIdentifier;
      v8->_processBundleIdentifier = (NSString *)v10;

    }
  }

  if (-[HDAssertionManager takeAssertion:](self->_assertionManager, "takeAssertion:", v8))
    v12 = v8;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (void)assertionManager:(id)a3 assertionTaken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  os_log_t *v11;
  NSObject *v12;
  NSObject *v13;
  id WeakRetained;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id location;
  __int128 handler;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25[3];

  v25[2] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAlertSuppressor.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[assertion isKindOfClass:[_HDAlertSuppressorAssertion class]]"));

  }
  v7 = v6;
  v8 = v7;
  if (v7)
    v9 = (void *)*((_QWORD *)v7 + 10);
  else
    v9 = 0;
  v10 = v9;
  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x1E0CB5380];
  v12 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    LODWORD(handler) = 138412290;
    *(_QWORD *)((char *)&handler + 4) = v10;
    _os_log_debug_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEBUG, "Alert suppressor starting for workout client: %@", (uint8_t *)&handler, 0xCu);
  }
  -[HDAlertSuppressor _queue_clearSuppressionTimerForAssertion:]((uint64_t)self, v8);
  if (-[NSMutableSet containsObject:](self->_waitingForSuspension, "containsObject:", v10))
  {
    _HKInitializeLogging();
    v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(handler) = 138412290;
      *(_QWORD *)((char *)&handler + 4) = v10;
      _os_log_debug_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEBUG, "Starting an alert suppression again for app for which we were waiting to go to background: %@", (uint8_t *)&handler, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_msgSend(WeakRetained, "processStateManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unregisterObserver:forBundleIdentifier:", self, v10);

    -[NSMutableSet removeObject:](self->_waitingForSuspension, "removeObject:", v10);
  }
  -[HDAlertSuppressor _queue_suppressActivityAlertsForProcessIdentifier:]((uint64_t)self, v10);
  v16 = v10;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  dispatch_source_set_timer(v17, 0, 0x8BB2C97000uLL, 0xDF8475800uLL);
  *(_QWORD *)&handler = MEMORY[0x1E0C809B0];
  *((_QWORD *)&handler + 1) = 3221225472;
  v22 = __75__HDAlertSuppressor__queue_startAlertSuppressionTimerForProcessIdentifier___block_invoke;
  v23 = &unk_1E6CED848;
  v18 = v16;
  v24 = v18;
  objc_copyWeak(v25, &location);
  dispatch_source_set_event_handler(v17, &handler);
  dispatch_resume(v17);
  objc_destroyWeak(v25);

  objc_destroyWeak(&location);
  -[_HDAlertSuppressorAssertion setKeepaliveTimer:]((uint64_t)v8, v17);

}

- (void)_queue_clearSuppressionTimerForAssertion:(uint64_t)a1
{
  NSObject *v3;
  _QWORD *v4;

  v4 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (v4)
    {
      v3 = v4[11];
      if (v3)
      {
        dispatch_source_cancel(v3);
        -[_HDAlertSuppressorAssertion setKeepaliveTimer:]((uint64_t)v4, 0);
      }
    }
  }

}

- (void)_queue_suppressActivityAlertsForProcessIdentifier:(uint64_t)a1
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  if (a1)
  {
    v3 = *(NSObject **)(a1 + 16);
    v4 = a2;
    dispatch_assert_queue_V2(v3);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "alertSuppressionService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 3600.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suppressActivityAlertsForIdentifier:suppressionReason:timeoutUntilDate:", v4, 0, v6);

  }
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAlertSuppressor.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[assertion isKindOfClass:[_HDAlertSuppressorAssertion class]]"));

  }
  v7 = v6;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    if (v7)
      v15 = v7[10];
    else
      v15 = 0;
    *(_DWORD *)buf = 138412290;
    v19 = v15;
    v16 = v8;
    _os_log_debug_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEBUG, "Alert suppressor stopping for workout client: %@", buf, 0xCu);

  }
  -[HDAlertSuppressor _queue_clearSuppressionTimerForAssertion:]((uint64_t)self, v7);
  if (v7)
    v9 = (void *)v7[10];
  else
    v9 = 0;
  v10 = v9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_msgSend(WeakRetained, "processStateManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "isApplicationStateForegroundForBundleIdentifier:", v10) & 1) != 0)
    {
      objc_msgSend(v12, "registerObserver:forBundleIdentifier:", self, v10);
      -[NSMutableSet addObject:](self->_waitingForSuspension, "addObject:", v10);
    }
    else
    {
      v13 = objc_loadWeakRetained((id *)&self->_daemon);
      objc_msgSend(v13, "alertSuppressionService");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "invalidateActivityAlertSuppressionForIdentifier:", v10);

    }
  }

}

void __75__HDAlertSuppressor__queue_startAlertSuppressionTimerForProcessIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_INFO, "Periodic alert suppression for workout client: %@", (uint8_t *)&v5, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[HDAlertSuppressor _queue_suppressActivityAlertsForProcessIdentifier:]((uint64_t)WeakRetained, *(void **)(a1 + 32));

}

- (void)processSuspended:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEBUG, "Activity alert suppression. Suspended: %@", (uint8_t *)&v6, 0xCu);
  }
  -[HDAlertSuppressor _invalidateSuppressActivityAlertsForSuspendedProcess:]((uint64_t)self, v4);

}

- (void)_invalidateSuppressActivityAlertsForSuspendedProcess:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 16);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__HDAlertSuppressor__invalidateSuppressActivityAlertsForSuspendedProcess___block_invoke;
    v6[3] = &unk_1E6CE8080;
    v7 = v3;
    v8 = a1;
    dispatch_async(v5, v6);

  }
}

- (void)processTerminated:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEBUG, "Activity alert suppression. Terminated: %@", (uint8_t *)&v6, 0xCu);
  }
  -[HDAlertSuppressor _invalidateSuppressActivityAlertsForSuspendedProcess:]((uint64_t)self, v4);

}

- (void)processDidEnterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEBUG, "Activity alert suppression. Background: %@", (uint8_t *)&v6, 0xCu);
  }
  -[HDAlertSuppressor _invalidateSuppressActivityAlertsForSuspendedProcess:]((uint64_t)self, v4);

}

- (void)processResumed:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_debug_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEBUG, "Activity alert suppression. Resumed: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)processDidEnterForeground:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_debug_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEBUG, "Activity alert suppression. Foreground: %@", (uint8_t *)&v5, 0xCu);
  }

}

uint64_t __74__HDAlertSuppressor__invalidateSuppressActivityAlertsForSuspendedProcess___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E0CB5380];
  v3 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_INFO, "Invalidating activity alert suppression after process %@ was suspended", (uint8_t *)&v12, 0xCu);
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138543362;
      v13 = v11;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Invalidating activity alert supression for wrong bundle identifier. received: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "alertSuppressionService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateActivityAlertSuppressionForIdentifier:", *(_QWORD *)(a1 + 32));

  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(v8, "processStateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unregisterObserver:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForSuspension, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

@end
