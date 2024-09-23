@implementation NTNewsSourceAvailabilityEntry

- (NTNewsSourceAvailabilityEntry)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTNewsSourceAvailabilityEntry init]";
    v9 = 2080;
    v10 = "NTNewsSourceAvailabilityEntry.m";
    v11 = 1024;
    v12 = 28;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTNewsSourceAvailabilityEntry init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTNewsSourceAvailabilityEntry)initWithNetworkReachability:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  NTNewsSourceAvailabilityEntry *v9;
  NTNewsSourceAvailabilityEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsSourceAvailabilityEntry initWithNetworkReachability:queue:].cold.2();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsSourceAvailabilityEntry initWithNetworkReachability:queue:].cold.1();
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)NTNewsSourceAvailabilityEntry;
  v9 = -[NTNewsSourceAvailabilityEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_networkReachability, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    v10->_available = objc_msgSend(v7, "offlineReason") != 3;
  }

  return v10;
}

- (Class)todayResultsFetchDescriptorClass
{
  return (Class)objc_opt_class();
}

- (id)availabilityChangedNotificationBlock
{
  return self->_availabilityChangedNotificationBlock;
}

- (void)setAvailabilityChangedNotificationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (FCNetworkReachability)networkReachability
{
  return self->_networkReachability;
}

- (void)setNetworkReachability:(id)a3
{
  objc_storeStrong((id *)&self->_networkReachability, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong(&self->_availabilityChangedNotificationBlock, 0);
}

- (void)initWithNetworkReachability:queue:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queue", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithNetworkReachability:queue:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"networkReachability", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
