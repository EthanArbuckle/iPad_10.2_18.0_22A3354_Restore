@implementation AFHeartBeat

- (AFHeartBeat)initWithIdentifier:(id)a3 queue:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 heartBeatInterval:(double)a7 heartBeatHandler:(id)a8 invalidationHandler:(id)a9
{
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  id v40;
  double v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  id v45;
  dispatch_source_t v46;
  void *v47;
  NSObject *v48;
  dispatch_time_t v49;
  NSObject *v50;
  dispatch_source_t v51;
  void *v52;
  NSObject *v53;
  dispatch_time_t v54;
  NSObject *v55;
  id v56;
  _QWORD v58[4];
  id v59;
  _QWORD handler[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD block[4];
  id v65;
  _QWORD v66[4];
  id v67;
  objc_super v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  double v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v68.receiver = self;
  v68.super_class = (Class)AFHeartBeat;
  v21 = -[AFHeartBeat init](&v68, sel_init);
  if (!v21)
    goto LABEL_24;
  v22 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    v70 = "-[AFHeartBeat initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler:inv"
          "alidationHandler:]";
    v71 = 2048;
    v72 = v21;
    v73 = 2112;
    v74 = *(double *)&v16;
    v75 = 2112;
    v76 = *(double *)&v18;
    v77 = 2048;
    v78 = a6;
    v79 = 2048;
    v80 = a7;
    _os_log_impl(&dword_19AF50000, v22, OS_LOG_TYPE_INFO, "%s %p identifier = %@, effectiveDate = %@, expirationDuration = %f, heartBeatInterval = %f", buf, 0x3Eu);
  }
  v23 = objc_msgSend(v16, "copy");
  v24 = (void *)*((_QWORD *)v21 + 7);
  *((_QWORD *)v21 + 7) = v23;

  objc_storeStrong((id *)v21 + 1, a4);
  v25 = (void *)objc_msgSend(v18, "copy");
  v26 = v25;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)*((_QWORD *)v21 + 8);
  *((_QWORD *)v21 + 8) = v27;

  *((double *)v21 + 9) = a6;
  *((double *)v21 + 10) = a7;
  v29 = MEMORY[0x1A1AC0C3C](v19);
  v30 = (void *)*((_QWORD *)v21 + 4);
  *((_QWORD *)v21 + 4) = v29;

  v31 = MEMORY[0x1A1AC0C3C](v20);
  v32 = (void *)*((_QWORD *)v21 + 5);
  *((_QWORD *)v21 + 5) = v31;

  if (a7 > 0.0)
  {
    if (a6 < 0.0)
    {
      v33 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v70 = "-[AFHeartBeat initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler"
              ":invalidationHandler:]";
        v71 = 2048;
        v72 = v21;
        v73 = 2048;
        v74 = a6;
        _os_log_error_impl(&dword_19AF50000, v33, OS_LOG_TYPE_ERROR, "%s %p Expiration duration %f is invalid.", buf, 0x20u);
      }
      v34 = *((_QWORD *)v21 + 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_1;
      block[3] = &unk_1E3A36F30;
      v35 = v21;
      v65 = v35;
      dispatch_async(v34, block);
      v36 = v35;

      goto LABEL_25;
    }
    objc_msgSend(v18, "timeIntervalSinceNow");
    if (a6 > 0.0 && v41 < 0.0 && v41 + a6 < 0.0)
    {
      v42 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v70 = "-[AFHeartBeat initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler"
              ":invalidationHandler:]";
        v71 = 2048;
        v72 = v21;
        v73 = 2112;
        v74 = *(double *)&v18;
        v75 = 2048;
        v76 = a6;
        _os_log_error_impl(&dword_19AF50000, v42, OS_LOG_TYPE_ERROR, "%s %p Effective date %@ and expiration duration %f are in the past.", buf, 0x2Au);
      }
      v43 = *((_QWORD *)v21 + 1);
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_2;
      v62[3] = &unk_1E3A36F30;
      v44 = v21;
      v63 = v44;
      dispatch_async(v43, v62);
      v45 = v44;

      goto LABEL_25;
    }
    objc_initWeak((id *)buf, v21);
    v46 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v17);
    v47 = (void *)*((_QWORD *)v21 + 2);
    *((_QWORD *)v21 + 2) = v46;

    v48 = *((_QWORD *)v21 + 2);
    v49 = AFDispatchTimeGetFromDateAndOffset(v18, 0.0);
    dispatch_source_set_timer(v48, v49, (unint64_t)(a7 * 1000000000.0), 0);
    v50 = *((_QWORD *)v21 + 2);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_2;
    handler[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v61, (id *)buf);
    dispatch_source_set_event_handler(v50, handler);
    dispatch_resume(*((dispatch_object_t *)v21 + 2));
    if (a6 > 0.0)
    {
      v51 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v17);
      v52 = (void *)*((_QWORD *)v21 + 3);
      *((_QWORD *)v21 + 3) = v51;

      v53 = *((_QWORD *)v21 + 3);
      v54 = AFDispatchTimeGetFromDateAndOffset(v18, a6);
      dispatch_source_set_timer(v53, v54, 0xFFFFFFFFFFFFFFFFLL, 0);
      v55 = *((_QWORD *)v21 + 3);
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_3;
      v58[3] = &unk_1E3A35AE0;
      objc_copyWeak(&v59, (id *)buf);
      dispatch_source_set_event_handler(v55, v58);
      dispatch_resume(*((dispatch_object_t *)v21 + 3));
      objc_destroyWeak(&v59);
    }
    objc_destroyWeak(&v61);
    objc_destroyWeak((id *)buf);
LABEL_24:
    v56 = v21;
    goto LABEL_25;
  }
  v37 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v70 = "-[AFHeartBeat initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler:inv"
          "alidationHandler:]";
    v71 = 2048;
    v72 = v21;
    v73 = 2048;
    v74 = a7;
    _os_log_error_impl(&dword_19AF50000, v37, OS_LOG_TYPE_ERROR, "%s %p Heart beat interval %f is invalid.", buf, 0x20u);
  }
  v38 = *((_QWORD *)v21 + 1);
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke;
  v66[3] = &unk_1E3A36F30;
  v39 = v21;
  v67 = v39;
  dispatch_async(v38, v66);
  v40 = v39;

LABEL_25:
  return (AFHeartBeat *)v21;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *identifier;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  AFHeartBeat *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    v7 = "-[AFHeartBeat dealloc]";
    v8 = 2048;
    v9 = self;
    v10 = 2112;
    v11 = identifier;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p identifier = %@", buf, 0x20u);
  }
  -[AFHeartBeat _invalidate](self, "_invalidate");
  v5.receiver = self;
  v5.super_class = (Class)AFHeartBeat;
  -[AFHeartBeat dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  id v3;
  void *v4;
  NSDate *effectiveDate;
  NSString *identifier;
  double expirationDuration;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12.receiver = self;
  v12.super_class = (Class)AFHeartBeat;
  -[AFHeartBeat description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  effectiveDate = self->_effectiveDate;
  -[NSDate timeIntervalSinceNow](effectiveDate, "timeIntervalSinceNow");
  expirationDuration = self->_expirationDuration;
  v8 = atomic_load(&self->_numberOfHeartBeats);
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {identifier = %@, effectiveDate = %@ (%f seconds), expirationDuration = %f, numberOfHeartBeats = %llu}"), v4, identifier, effectiveDate, v9, *(_QWORD *)&expirationDuration, v8);

  return (NSString *)v10;
}

- (unint64_t)numberOfHeartBeats
{
  return atomic_load(&self->_numberOfHeartBeats);
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  AFHeartBeat *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[AFHeartBeat invalidate]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__AFHeartBeat_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_fire
{
  unint64_t *p_numberOfHeartBeats;
  unint64_t v4;
  NSObject *v5;
  void (**heartBeatHandler)(id, unint64_t);
  NSString *identifier;
  int v8;
  const char *v9;
  __int16 v10;
  AFHeartBeat *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_numberOfHeartBeats = &self->_numberOfHeartBeats;
  do
    v4 = __ldaxr(p_numberOfHeartBeats);
  while (__stlxr(v4 + 1, p_numberOfHeartBeats));
  if (0xCCCCCCCCCCCCCCCDLL * v4 <= 0x3333333333333333)
  {
    v5 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      v8 = 136315906;
      v9 = "-[AFHeartBeat _fire]";
      v10 = 2048;
      v11 = self;
      v12 = 2112;
      v13 = identifier;
      v14 = 2048;
      v15 = v4;
      _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s %p identifier = %@, index = %llu", (uint8_t *)&v8, 0x2Au);
    }
  }
  heartBeatHandler = (void (**)(id, unint64_t))self->_heartBeatHandler;
  if (heartBeatHandler)
    heartBeatHandler[2](heartBeatHandler, v4);
}

- (void)_invalidate
{
  unint64_t v3;
  NSObject *v4;
  NSObject *heartBeatTimer;
  OS_dispatch_source *v6;
  NSObject *expirationTimer;
  OS_dispatch_source *v8;
  void (**invalidationHandler)(id, unint64_t);
  id v10;
  NSString *identifier;
  int v12;
  const char *v13;
  __int16 v14;
  AFHeartBeat *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = atomic_load(&self->_numberOfHeartBeats);
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    identifier = self->_identifier;
    v12 = 136315906;
    v13 = "-[AFHeartBeat _invalidate]";
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = identifier;
    v18 = 2048;
    v19 = v3;
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s %p identifier = %@, count = %llu", (uint8_t *)&v12, 0x2Au);
  }
  heartBeatTimer = self->_heartBeatTimer;
  if (heartBeatTimer)
  {
    dispatch_source_cancel(heartBeatTimer);
    v6 = self->_heartBeatTimer;
    self->_heartBeatTimer = 0;

  }
  expirationTimer = self->_expirationTimer;
  if (expirationTimer)
  {
    dispatch_source_cancel(expirationTimer);
    v8 = self->_expirationTimer;
    self->_expirationTimer = 0;

  }
  invalidationHandler = (void (**)(id, unint64_t))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2](invalidationHandler, v3);
    v10 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (double)expirationDuration
{
  return self->_expirationDuration;
}

- (double)heartBeatInterval
{
  return self->_heartBeatInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_heartBeatHandler, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_heartBeatTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __25__AFHeartBeat_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_1(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fire");

}

void __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidate");

}

@end
