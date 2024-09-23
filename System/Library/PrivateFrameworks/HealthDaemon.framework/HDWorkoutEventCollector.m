@implementation HDWorkoutEventCollector

+ (BOOL)isAvailableInCurrentHardware
{
  return 1;
}

- (HDWorkoutEventCollector)initWithProfile:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  HDWorkoutEventCollector *v8;
  HDWorkoutEventCollector *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDWorkoutEventCollector;
  v8 = -[HDWorkoutEventCollector init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
  }

  return v9;
}

- (void)startWithSessionId:(id)a3
{
  NSUUID *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSUUID *sessionId;
  int v9;
  HDWorkoutEventCollector *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (NSUUID *)a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NSUUID UUIDString](v4, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%@: Starting with session ID %@", (uint8_t *)&v9, 0x16u);

  }
  sessionId = self->_sessionId;
  self->_sessionId = v4;

}

- (HDWorkoutEventCollectorDelegate)delegate
{
  return (HDWorkoutEventCollectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)stop
{
  void *v3;
  NSUUID *sessionId;
  NSObject *v5;
  void *v6;
  NSUUID *v7;
  int v8;
  HDWorkoutEventCollector *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    sessionId = self->_sessionId;
    v5 = v3;
    -[NSUUID UUIDString](sessionId, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%@: Stopping with session ID %@", (uint8_t *)&v8, 0x16u);

  }
  v7 = self->_sessionId;
  self->_sessionId = 0;

}

+ (BOOL)supportsWorkoutActivityType:(unint64_t)a3
{
  return 1;
}

- (void)requestPendingEventsThroughDate:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

- (NSUUID)sessionId
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
