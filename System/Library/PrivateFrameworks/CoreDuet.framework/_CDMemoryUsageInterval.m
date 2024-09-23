@implementation _CDMemoryUsageInterval

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)dealloc
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a1[10];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_ERROR, "[error] id=%lu name=%@ client=%@ not explicitly ended, this can lead to incorrect measurements", (uint8_t *)&v7, 0x20u);

}

- (void)end
{
  void *v3;

  if (self->_state == 1)
  {
    +[_CDMemoryUsageIntervalTracker sharedInstance]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDMemoryUsageIntervalTracker endInterval:]((uint64_t)v3, self);

    legacy_log_signpost(self, 0);
    self->_state = 2;
  }
}

- (void)begin
{
  void *v3;

  if (!self->_state)
  {
    self->_startTime = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX);
    +[_CDMemoryUsageIntervalTracker sharedInstance]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDMemoryUsageIntervalTracker beginInterval:]((uint64_t)v3, self);

    legacy_log_signpost(self, 1);
    self->_state = 1;
  }
}

- (_CDMemoryUsageInterval)initWithName:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  _CDMemoryUsageInterval *v8;
  _CDMemoryUsageInterval *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *client;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CDMemoryUsageInterval;
  v8 = -[_CDMemoryUsageInterval init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_num = 0;
    v10 = objc_msgSend(v6, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v12 = objc_msgSend(v7, "copy");
    client = v9->_client;
    v9->_client = (NSString *)v12;

    v9->_state = 0;
    v9->_startTime = 0;
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)client
{
  return self->_client;
}

@end
