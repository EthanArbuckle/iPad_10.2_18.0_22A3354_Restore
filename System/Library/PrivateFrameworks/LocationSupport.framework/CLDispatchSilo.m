@implementation CLDispatchSilo

- (void)assertInside
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (id)newTimer
{
  CLDispatchTimerScheduler *v3;
  __objc2_class **v4;
  void *v5;

  v3 = -[CLDispatchTimerScheduler initWithDispatchSilo:]([CLDispatchTimerScheduler alloc], "initWithDispatchSilo:", self);
  if (self->_useCLPermissiveTimer)
    v4 = off_1E45FA720;
  else
    v4 = &off_1E45FA748;
  v5 = (void *)objc_msgSend(objc_alloc(*v4), "initInSilo:withScheduler:", self, v3);

  return v5;
}

- (id)initMain
{
  CLDispatchSilo *v2;
  CLDispatchSilo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLDispatchSilo;
  v2 = -[CLSilo initWithIdentifier:](&v5, sel_initWithIdentifier_, CFSTR("MainSilo"));
  v3 = v2;
  if (v2)
    objc_storeStrong((id *)&v2->_queue, MEMORY[0x1E0C80D38]);
  return v3;
}

- (CLDispatchSilo)initWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  void *v15;
  NSObject *v16;
  objc_super v18;
  _QWORD v19[2];
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t buf;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1A1A02A2C;
  v28 = sub_1A1A029FC;
  dispatch_get_global_queue(0, 0);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  +[CLSilo globalConfiguration](CLSilo, "globalConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NameToCohortMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (objc_msgSend(&unk_1E4600288, "containsObject:", v4) & 1) == 0
    && (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("default")),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v20 = sub_1A1A11720;
    v21 = &unk_1E45FBAF8;
    v8 = v7;
    v22 = v8;
    v23 = &v24;
    v9 = qword_1ECE24D60;
    v10 = v19;
    if (v9 != -1)
      dispatch_once(&qword_1ECE24D60, &unk_1E45FBB90);
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECE24D40);
    v20((uint64_t)v10, (void *)qword_1ECE24D58);

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECE24D40);
  }
  else
  {
    v8 = 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)CLDispatchSilo;
  v11 = -[CLSilo initWithIdentifier:](&v18, sel_initWithIdentifier_, v4);
  if (v11)
  {
    v12 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create_with_target_V2(v12, v13, (dispatch_queue_t)v25[5]);
    v15 = (void *)*((_QWORD *)v11 + 7);
    *((_QWORD *)v11 + 7) = v14;

    objc_storeStrong((id *)v11 + 10, v8);
    dispatch_queue_set_specific(*((dispatch_queue_t *)v11 + 7), "dispatchSilo", v11, 0);
  }
  if (qword_1ECE24CB0 != -1)
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FBBB0);
  v16 = qword_1ECE24CA8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289538;
    v31 = 2082;
    v32 = &unk_1A1A18FAF;
    v33 = 2114;
    v34 = v4;
    v35 = 2114;
    v36 = v8;
    _os_log_impl(&dword_1A19F4000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting CohortId assignment for silo\", \"Silo\":%{public, location:escape_only}@, \"CohortId\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
  }

  _Block_object_dispose(&v24, 8);
  return (CLDispatchSilo *)v11;
}

- (CLDispatchSilo)initWithUnderlyingQueue:(id)a3 bePermissive:(BOOL)a4
{
  CLDispatchSilo *result;

  result = -[CLDispatchSilo initWithUnderlyingQueue:](self, "initWithUnderlyingQueue:", a3);
  if (result)
    result->_useCLPermissiveTimer = a4;
  return result;
}

- (CLDispatchSilo)initWithUnderlyingQueue:(id)a3
{
  NSObject *v5;
  void *v6;
  CLDispatchSilo *v7;
  CLDispatchSilo *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", dispatch_queue_get_label(v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CLDispatchSilo;
  v7 = -[CLSilo initWithIdentifier:](&v10, sel_initWithIdentifier_, v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_queue, a3);

  return v8;
}

- (void)afterInterval:(double)a3 async:(id)a4
{
  id v6;
  dispatch_time_t v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1A1A029B4;
  v10[3] = &unk_1E45FB910;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_after(v7, queue, v10);

}

- (void)sync:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CLDispatchSilo intendToSync](self, "intendToSync");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A19F539C;
  block[3] = &unk_1E45FB910;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)intendToSync
{
  uint64_t v3;
  CLDispatchSilo *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSString *identifier;
  NSNumber *cohortId;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  NSNumber *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (+[CLAutoCohortUtilities autoCohortingEnabled](CLAutoCohortUtilities, "autoCohortingEnabled"))
  {
    dispatch_get_specific("dispatchSilo");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = self;
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBBB0);
      v5 = qword_1ECE24CA8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEBUG))
      {
        v6 = *(void **)(v3 + 8);
        v7 = *(void **)(v3 + 80);
        identifier = v4->super._identifier;
        cohortId = v4->_cohortId;
        *(_DWORD *)buf = 68290050;
        v25 = 0;
        v26 = 2082;
        v27 = &unk_1A1A18FAF;
        v28 = 2114;
        v29 = v6;
        v30 = 2114;
        v31 = v7;
        v32 = 2114;
        v33 = identifier;
        v34 = 2114;
        v35 = cohortId;
        _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Cohorting Intend to sync\", \"FromDispatchSilo\":%{public, location:escape_only}@, \"FromCohortId\":%{public, location:escape_only}@, \"ToDispatchSilo\":%{public, location:escape_only}@, \"ToCohortId\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      v10 = objc_msgSend(*(id *)(v3 + 80), "intValue");
      if (v10 <= -[NSNumber intValue](v4->_cohortId, "intValue"))
      {
        os_unfair_lock_lock((os_unfair_lock_t)&unk_1EE64C758);
        objc_msgSend((id)v3, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSilo identifier](v4, "identifier", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = +[CLAutoCohortUtilities isEdgeKnownToCauseCycle:](CLAutoCohortUtilities, "isEdgeKnownToCauseCycle:", v13);

        if (!v14)
        {
          sub_1A1A117D8();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend((id)v3, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[CLSilo identifier](v4, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68289538;
            v25 = 0;
            v26 = 2082;
            v27 = &unk_1A1A18FAF;
            v28 = 2114;
            v29 = v16;
            v30 = 2114;
            v31 = v17;
            _os_log_impl(&dword_1A19F4000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Cohorting Persist sync-get edge\", \"fromSiloIdentifier\":%{public, location:escape_only}@, \"toSiloIdentifier\":%{public, location:escape_only}@}", buf, 0x26u);

          }
          sub_1A1A117D8();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v18))
          {
            objc_msgSend((id)v3, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[CLSilo identifier](v4, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68289538;
            v25 = 0;
            v26 = 2082;
            v27 = &unk_1A1A18FAF;
            v28 = 2114;
            v29 = v19;
            v30 = 2114;
            v31 = v20;
            _os_signpost_emit_with_name_impl(&dword_1A19F4000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Cohorting Persist sync-get edge", "{\"msg%{public}.0s\":\"#Cohorting Persist sync-get edge\", \"fromSiloIdentifier\":%{public, location:escape_only}@, \"toSiloIdentifier\":%{public, location:escape_only}@}", buf, 0x26u);

          }
          objc_msgSend((id)v3, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLSilo identifier](v4, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[CLAutoCohortUtilities persistEdgeFrom:to:](CLAutoCohortUtilities, "persistEdgeFrom:to:", v21, v22);

          _Exit(0);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE64C758);
      }

    }
  }
}

- (void)async:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A19F5304;
  v7[3] = &unk_1E45FB910;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)queue
{
  return self->_queue;
}

- (void)assertOutside
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
}

- (id)operationQueue
{
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CLDispatchSilo assertInside](self, "assertInside");
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    v6 = (void *)MEMORY[0x1E0CB3940];
    -[CLSilo identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.NSOperationQueue"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](self->_operationQueue, "setName:", v8);

    -[NSOperationQueue setUnderlyingQueue:](self->_operationQueue, "setUnderlyingQueue:", self->_queue);
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (BOOL)inPermissiveMode
{
  return self->_useCLPermissiveTimer;
}

- (id)getTimeCoercibleVariantInstance
{
  return -[CLTimeCoercibleDispatchSilo initWithUnderlyingQueue:]([CLTimeCoercibleDispatchSilo alloc], "initWithUnderlyingQueue:", self->_queue);
}

- (void)suspend
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_isQueueSuspended)
  {
    sub_1A1A117D8();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "!_isQueueSuspended";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Intersilo currently does not support reference counting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A117D8();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "!_isQueueSuspended";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Intersilo currently does not support reference counting", "{\"msg%{public}.0s\":\"Intersilo currently does not support reference counting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A117D8();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "!_isQueueSuspended";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Intersilo currently does not support reference counting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  self->_isQueueSuspended = 1;
  dispatch_suspend((dispatch_object_t)self->_queue);
}

- (void)resume
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_isQueueSuspended)
  {
    sub_1A1A117D8();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v7 = 0;
      v8 = 2082;
      v9 = &unk_1A1A18FAF;
      v10 = 2082;
      v11 = "assert";
      v12 = 2081;
      v13 = "_isQueueSuspended";
      _os_log_impl(&dword_1A19F4000, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Intersilo currently does not support reference counting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A117D8();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)buf = 68289539;
      v7 = 0;
      v8 = 2082;
      v9 = &unk_1A1A18FAF;
      v10 = 2082;
      v11 = "assert";
      v12 = 2081;
      v13 = "_isQueueSuspended";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Intersilo currently does not support reference counting", "{\"msg%{public}.0s\":\"Intersilo currently does not support reference counting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A117D8();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v7 = 0;
      v8 = 2082;
      v9 = &unk_1A1A18FAF;
      v10 = 2082;
      v11 = "assert";
      v12 = 2081;
      v13 = "_isQueueSuspended";
      _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Intersilo currently does not support reference counting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  dispatch_resume((dispatch_object_t)self->_queue);
  self->_isQueueSuspended = 0;
}

- (BOOL)isSuspended
{
  return self->_isQueueSuspended;
}

- (void)_setLatchedAbsoluteTimestamp:(double)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->super._currentLatchedAbsoluteTimestamp <= a3)
  {
    self->super._currentLatchedAbsoluteTimestamp = a3;
  }
  else
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBBB0);
    v3 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A19F4000, v3, OS_LOG_TYPE_DEFAULT, "#Warning Time should not be moved backwards; systems based on monotonic time (like CLTimer) will misbehave.",
        v4,
        2u);
    }
  }
}

- (double)currentLatchedAbsoluteTimestamp
{
  return self->super._currentLatchedAbsoluteTimestamp;
}

- (void)heartBeat:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CLDispatchSilo *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A1A11DBC;
  v7[3] = &unk_1E45FB960;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CLDispatchSilo: %s"), dispatch_queue_get_label((dispatch_queue_t)self->_queue));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortId, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
