@implementation HDTinkerPrivacyAlertCoordinator

- (HDTinkerPrivacyAlertCoordinator)initWithProfile:(id)a3
{
  id v4;
  HDTinkerPrivacyAlertCoordinator *v5;
  HDTinkerPrivacyAlertCoordinator *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  HDRestorableAlarm *v9;
  id WeakRetained;
  uint64_t v11;
  HDRestorableAlarm *scheduler;
  void *v13;
  HDRestorableAlarm *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDTinkerPrivacyAlertCoordinator;
  v5 = -[HDTinkerPrivacyAlertCoordinator init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = [HDRestorableAlarm alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v11 = -[HDRestorableAlarm initWithProfile:clientIdentifier:eventHandlerQueue:](v9, "initWithProfile:clientIdentifier:eventHandlerQueue:", WeakRetained, CFSTR("HDTinkerPrivacyAlertCoordinator"), v6->_queue);
    scheduler = v6->_scheduler;
    v6->_scheduler = (HDRestorableAlarm *)v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__userCharacteristicsDidChangeNotification_, CFSTR("HDUserCharacteristicsDidChangeNotification"), 0);

    objc_initWeak(&location, v6);
    v14 = v6->_scheduler;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__HDTinkerPrivacyAlertCoordinator_initWithProfile___block_invoke;
    v16[3] = &unk_1E6CFA5F0;
    objc_copyWeak(&v17, &location);
    -[HDRestorableAlarm beginReceivingEventsWithHandler:](v14, "beginReceivingEventsWithHandler:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __51__HDTinkerPrivacyAlertCoordinator_initWithProfile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  -[HDTinkerPrivacyAlertCoordinator _queue_alarm:didReceiveDueEvents:]((uint64_t)WeakRetained, v5);

}

- (BOOL)_queue_alarm:(uint64_t)a1 didReceiveDueEvents:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  HDSharedDataPrivacyNotification *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char valid;
  id v16;
  HDSharedDataPrivacyNotification *v17;
  _BOOL8 v18;
  HDSharedDataPrivacyNotification *v19;
  id v20;
  HDKeyValueDomain *v21;
  HDKeyValueDomain *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  id WeakRetained;
  id v28;
  char isKindOfClass;
  HDNotificationManager *v30;
  id v31;
  HDNotificationManager *v32;
  HDSharedDataPrivacyNotification *v33;
  void *v34;
  void *v35;
  HDSharedDataPrivacyNotification *v36;
  id v37;
  HDSharedDataPrivacyNotification *v38;
  NSObject *v39;
  void *v41;
  id v42;
  HDSharedDataPrivacyNotification *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  HDSharedDataPrivacyNotification *v52;
  __int16 v53;
  id v54;
  _BYTE v55[12];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      v6 = v4;
      objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
      v7 = (HDSharedDataPrivacyNotification *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = a1;
      v51 = 2114;
      v52 = v7;
      v53 = 2112;
      v54 = v3;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Received %{public}@ due events: %@ (#t0)", buf, 0x20u);

    }
    v43 = 0;
    v8 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, buf, 16);
    if (!v10)
      goto LABEL_12;
    v11 = v10;
    v12 = *(_QWORD *)v45;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v13), "eventIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        valid = HDIsValidTinkerEventIdentifier(v14);

        if ((valid & 1) != 0)
        {

          v20 = objc_loadWeakRetained((id *)(a1 + 8));
          v21 = [HDKeyValueDomain alloc];
          v22 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v21, "initWithCategory:domainName:profile:", 100, *MEMORY[0x1E0CB7648], v20);

          v23 = *MEMORY[0x1E0CB7640];
          v48 = 0;
          -[HDKeyValueDomain dateForKey:error:](v22, "dateForKey:error:", v23, &v48);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v48;
          if (v25)
          {
            _HKInitializeLogging();
            v26 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v55 = 138543362;
              *(_QWORD *)&v55[4] = v25;
              _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "Error reading sharing disabled date: %{public}@ (#t0)", v55, 0xCu);
            }
          }

          if (v24)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v43, 100, CFSTR("Sharing is disabled (#t0)"));
          }
          else if (-[HDTinkerPrivacyAlertCoordinator _shouldScheduleTransparencyAlertsWithError:](a1, (uint64_t)&v43))
          {
            WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
            *(_QWORD *)v55 = 0;
            objc_msgSend(WeakRetained, "pairedGuardianUserInfoWithError:", v55);
            v17 = (HDSharedDataPrivacyNotification *)objc_claimAutoreleasedReturnValue();
            v19 = (HDSharedDataPrivacyNotification *)*(id *)v55;

            v18 = v17 != 0;
            if (v17)
            {
              v28 = objc_loadWeakRetained((id *)(a1 + 8));
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_loadWeakRetained((id *)(a1 + 8));
                objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_showAlertIfRequiredForDueEvents_error_, a1, CFSTR("HDTinkerPrivacyAlertCoordinator.m"), 152, CFSTR("Profile %@ is not an instance of type HDPrimaryProfile (#t0)"), v42, v43, (_QWORD)v44);

              }
              v30 = [HDNotificationManager alloc];
              v31 = objc_loadWeakRetained((id *)(a1 + 8));
              v32 = -[HDNotificationManager initWithProfile:bundle:](v30, "initWithProfile:bundle:", v31, 1);

              v33 = [HDSharedDataPrivacyNotification alloc];
              -[HDSharedDataPrivacyNotification firstName](v17, "firstName");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[HDSharedDataPrivacyNotification lastName](v17, "lastName");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = -[HDSharedDataPrivacyNotification initWithNotificationManager:guardianFirstName:lastName:](v33, "initWithNotificationManager:guardianFirstName:lastName:", v32, v34, v35);

              -[HDNanoHealthNotification triggerNotification](v36, "triggerNotification");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 100, CFSTR("Unable to find guardian info (#t0)"), v19);
              v37 = (id)objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                v36 = (HDSharedDataPrivacyNotification *)objc_retainAutorelease(v37);
                v43 = v36;
                v32 = (HDNotificationManager *)v36;
              }
              else
              {
                v36 = 0;
                v32 = 0;
              }
            }

            goto LABEL_30;
          }
          v18 = 0;
          goto LABEL_31;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, buf, 16);
      if (v11)
        continue;
      break;
    }
LABEL_12:

    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Did not any find valid events, not firing alert (#t0)"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (HDSharedDataPrivacyNotification *)objc_retainAutorelease(v16);
      v18 = 0;
      v43 = v17;
      v19 = v17;
    }
    else
    {
      v17 = 0;
      v19 = 0;
      v18 = 0;
    }
LABEL_30:

LABEL_31:
    v38 = v43;
    if (v38)
    {
      _HKInitializeLogging();
      v39 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v50 = a1;
        v51 = 2114;
        v52 = v38;
        _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "%{public}@ Did not fire alert, error: %{public}@ (#t0)", buf, 0x16u);
      }
    }
    objc_msgSend((id)a1, "_queue_clearDueEvents:", v9);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_queue_clearDueEvents:(id)a3
{
  NSObject *queue;
  id v5;
  HDRestorableAlarm *scheduler;
  BOOL v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  HDTinkerPrivacyAlertCoordinator *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  scheduler = self->_scheduler;
  v10 = 0;
  v7 = -[HDRestorableAlarm removeEvents:error:](scheduler, "removeEvents:error:", v5, &v10);

  v8 = v10;
  if (!v7)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Error removing events %{public}@ (#t0)", buf, 0x16u);
    }
  }

}

- (BOOL)_unitTest_didReceiveDueEvents:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HDTinkerPrivacyAlertCoordinator__unitTest_didReceiveDueEvents___block_invoke;
  block[3] = &unk_1E6CF6BF8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

BOOL __65__HDTinkerPrivacyAlertCoordinator__unitTest_didReceiveDueEvents___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = -[HDTinkerPrivacyAlertCoordinator _queue_alarm:didReceiveDueEvents:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)allScheduledEventsWithError:(id *)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__104;
  v20 = __Block_byref_object_dispose__104;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__104;
  v14 = __Block_byref_object_dispose__104;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HDTinkerPrivacyAlertCoordinator_allScheduledEventsWithError___block_invoke;
  block[3] = &unk_1E6CEF868;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(queue, block);
  v5 = (id)v17[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __63__HDTinkerPrivacyAlertCoordinator_allScheduledEventsWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = *(void **)(a1[4] + 16);
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "allScheduledEventsWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)allScheduledDueDatesWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[HDTinkerPrivacyAlertCoordinator allScheduledEventsWithError:](self, "allScheduledEventsWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_map:", &__block_literal_global_114);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __65__HDTinkerPrivacyAlertCoordinator_allScheduledDueDatesWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentDueDate");
}

- (BOOL)scheduleEventIfRequiredForDateComponents:(id)a3 eventIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  _QWORD block[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__104;
  v26 = __Block_byref_object_dispose__104;
  v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__HDTinkerPrivacyAlertCoordinator_scheduleEventIfRequiredForDateComponents_eventIdentifier_error___block_invoke;
  block[3] = &unk_1E6CFA658;
  v20 = &v28;
  block[4] = self;
  v11 = v8;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v21 = &v22;
  dispatch_sync(queue, block);
  v13 = (id)v23[5];
  v14 = v13;
  if (v13)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    else
      _HKLogDroppedError();
  }

  v15 = *((_BYTE *)v29 + 24);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __98__HDTinkerPrivacyAlertCoordinator_scheduleEventIfRequiredForDateComponents_eventIdentifier_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = -[HDTinkerPrivacyAlertCoordinator _queue_scheduleEventIfRequiredForDateComponents:eventIdentifier:error:](v2, v3, v4, (uint64_t *)&obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

- (uint64_t)_queue_scheduleEventIfRequiredForDateComponents:(void *)a3 eventIdentifier:(uint64_t *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
    goto LABEL_8;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if ((HDIsValidTinkerEventIdentifier(v8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Invalid event identifier %@ (#t0)"), v8);
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if ((-[HDTinkerPrivacyAlertCoordinator _shouldScheduleTransparencyAlertsWithError:](a1, (uint64_t)a4) & 1) == 0)
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v15 = *a4;
      *(_DWORD *)buf = 138543618;
      v18 = a1;
      v19 = 2114;
      v20 = v15;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Not scheduling event %{public}@ (#t0)", buf, 0x16u);
    }
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 16), "eventWithIdentifier:dueDateComponents:eventOptions:", v8, v7, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 16);
  v16 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "scheduleEvents:error:", v11, a4);

LABEL_9:
  return v12;
}

- (uint64_t)_shouldScheduleTransparencyAlertsWithError:(uint64_t)a1
{
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v16;

  v3 = (id *)(a1 + 8);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(WeakRetained, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "tinkerModeEnabled");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained(v3);
    v16 = 0;
    objc_msgSend(v8, "pairedGuardianUserInfoWithError:", &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;

    if (v9
      && (objc_msgSend(v9, "firstName"), (v11 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v12 = (void *)v11,
          objc_msgSend(v9, "lastName"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13))
    {
      v14 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a2, 100, CFSTR("Error fetching guardian name (#t0)"), v10);
      v14 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a2, 100, CFSTR("Device not in tinker mode (#t0)"));
    return 0;
  }
  return v14;
}

- (uint64_t)_queue_scheduleTransparencyAlertIfRequiredForBirthdate:(uint64_t *)a3 error:
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t v21[16];

  if (!a1)
    return 0;
  v5 = a1[3];
  v6 = a2;
  dispatch_assert_queue_V2(v5);
  objc_msgSend(v6, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 4, 13, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, 1, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_unitTest_currentDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  if ((objc_msgSend(v14, "hk_isBeforeDate:", v10) & 1) != 0)
  {
    objc_msgSend(v7, "components:fromDate:", 30, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCalendar:", v7);
    v16 = (void *)a1[5];
    a1[5] = v15;
    v17 = v15;

    v18 = -[HDTinkerPrivacyAlertCoordinator _queue_scheduleEventIfRequiredForDateComponents:eventIdentifier:error:]((uint64_t)a1, v17, CFSTR("TinkerPrivacyAlertEventBirthday"), a3);
  }
  else
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "User's already passed age limitations, not scheduling alert.", v21, 2u);
    }
    v18 = 1;
  }

  return v18;
}

- (void)_userCharacteristicsDidChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HDTinkerPrivacyAlertCoordinator__userCharacteristicsDidChangeNotification___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __77__HDTinkerPrivacyAlertCoordinator__userCharacteristicsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "userCharacteristicForType:error:", v2, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (v5)
  {
    v7 = *(_QWORD **)(a1 + 32);
    v12 = 0;
    v8 = -[HDTinkerPrivacyAlertCoordinator _queue_scheduleTransparencyAlertIfRequiredForBirthdate:error:](v7, v5, (uint64_t *)&v12);
    v9 = v12;
    if ((v8 & 1) == 0 && (HKIsUnitTesting() & 1) == 0)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v9;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Error scheduling birthdate transparency alert: %{public}@ (#t0)", buf, 0xCu);
      }
    }

  }
  else if ((HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Could not fetch date of birth components from DB: %{public}@ (#t0)", buf, 0xCu);
    }
  }

}

- (BOOL)removeAllEventsWithError:(id *)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  char v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__104;
  v18 = __Block_byref_object_dispose__104;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HDTinkerPrivacyAlertCoordinator_removeAllEventsWithError___block_invoke;
  block[3] = &unk_1E6CEF868;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v14;
  dispatch_async(queue, block);
  v5 = (id)v15[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __60__HDTinkerPrivacyAlertCoordinator_removeAllEventsWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = *(void **)(a1[4] + 16);
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "removeAllEventsWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

- (BOOL)_unitTest_scheduleTransparencyAlertIfRequiredForBirthdate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__104;
  v21 = __Block_byref_object_dispose__104;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__HDTinkerPrivacyAlertCoordinator__unitTest_scheduleTransparencyAlertIfRequiredForBirthdate_error___block_invoke;
  v13[3] = &unk_1E6CEF9D0;
  v15 = &v23;
  v13[4] = self;
  v8 = v6;
  v14 = v8;
  v16 = &v17;
  dispatch_sync(queue, v13);
  v9 = (id)v18[5];
  v10 = v9;
  if (v9)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v9);
    else
      _HKLogDroppedError();
  }

  v11 = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v11;
}

void __99__HDTinkerPrivacyAlertCoordinator__unitTest_scheduleTransparencyAlertIfRequiredForBirthdate_error___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (_QWORD *)a1[4];
  v3 = (void *)a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = -[HDTinkerPrivacyAlertCoordinator _queue_scheduleTransparencyAlertIfRequiredForBirthdate:error:](v2, v3, (uint64_t *)&obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

- (NSDate)_unitTest_currentDate
{
  return self->__unitTest_currentDate;
}

- (void)set_unitTest_currentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDateComponents)_unitTest_scheduledBirthdayTransparencyAlertComponents
{
  return self->__unitTest_scheduledBirthdayTransparencyAlertComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__unitTest_scheduledBirthdayTransparencyAlertComponents, 0);
  objc_storeStrong((id *)&self->__unitTest_currentDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
