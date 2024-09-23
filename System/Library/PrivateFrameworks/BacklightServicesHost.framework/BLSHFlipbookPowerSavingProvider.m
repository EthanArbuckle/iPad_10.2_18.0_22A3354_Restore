@implementation BLSHFlipbookPowerSavingProvider

- (BLSHFlipbookPowerSavingProvider)init
{
  BLSHFlipbookPowerSavingProvider *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BLSHFlipbookPowerSavingProvider;
  result = -[BLSHFlipbookPowerSavingProvider init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (BLSHFlipbook)flipbook
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_lock_flipbook);
  os_unfair_lock_unlock(p_lock);
  return (BLSHFlipbook *)WeakRetained;
}

- (void)setFlipbook:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  _BOOL8 v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = self->_lock_count == 0;
  objc_storeWeak((id *)&self->_lock_flipbook, v5);
  objc_msgSend(v5, "setPowerSavingEnabled:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isFlipbookPowerSavingEnabled
{
  os_unfair_lock_s *p_lock;
  char v4;
  id WeakRetained;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_count == 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lock_flipbook);
  v6 = WeakRetained;
  if (WeakRetained)
    v4 = objc_msgSend(WeakRetained, "isPowerSavingEnabled");
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)incrementDisablePowerSavingUsageCountForReason:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_count;
  NSObject *v7;
  NSObject *WeakRetained;
  void *v9;
  int v10;
  BLSHFlipbookPowerSavingProvider *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a3 >= 8)
    -[BLSHFlipbookPowerSavingProvider incrementDisablePowerSavingUsageCountForReason:].cold.1();
  lock_count = self->_lock_count;
  self->_lock_count = lock_count + 1;
  ++self->_lock_reasonsCount[a3];
  bls_assertions_log();
  v7 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v7;
  if (lock_count)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BLSHFlipbookPowerSavingProvider incrementDisablePowerSavingUsageCountForReason:].cold.2(self, WeakRetained);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[BLSHFlipbookPowerSavingProvider lock_description](self, "lock_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = self;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_2145AC000, WeakRetained, OS_LOG_TYPE_INFO, "%p did disable power savings: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_lock_flipbook);
    -[NSObject setPowerSavingEnabled:](WeakRetained, "setPowerSavingEnabled:", 0);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)decrementDisablePowerSavingUsageCountForReason:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_count;
  unint64_t v7;
  NSObject *v8;
  NSObject *WeakRetained;
  void *v10;
  int v11;
  BLSHFlipbookPowerSavingProvider *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_count = self->_lock_count;
  if (!lock_count)
    -[BLSHFlipbookPowerSavingProvider decrementDisablePowerSavingUsageCountForReason:].cold.1();
  if (a3 >= 8)
    -[BLSHFlipbookPowerSavingProvider decrementDisablePowerSavingUsageCountForReason:].cold.2();
  v7 = lock_count - 1;
  self->_lock_count = lock_count - 1;
  --self->_lock_reasonsCount[a3];
  bls_assertions_log();
  v8 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BLSHFlipbookPowerSavingProvider decrementDisablePowerSavingUsageCountForReason:].cold.3(self, a3, WeakRetained);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[BLSHFlipbookPowerSavingProvider lock_description](self, "lock_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218498;
      v12 = self;
      v13 = 2048;
      v14 = a3;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_2145AC000, WeakRetained, OS_LOG_TYPE_INFO, "%p did enable power savings after removing reason:%ld – %{public}@", (uint8_t *)&v11, 0x20u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_lock_flipbook);
    -[NSObject setPowerSavingEnabled:](WeakRetained, "setPowerSavingEnabled:", 1);
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHFlipbookPowerSavingProvider lock_description](self, "lock_description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (id)lock_description
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (!self->_lock_count)
    return CFSTR("powerSavingsEnabled");
  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__BLSHFlipbookPowerSavingProvider_lock_description__block_invoke;
  v6[3] = &unk_24D1BC900;
  v6[4] = self;
  objc_msgSend(v3, "appendCustomFormatWithName:block:", 0, v6);
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __51__BLSHFlipbookPowerSavingProvider_lock_description__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "appendFormat:", CFSTR("powerSavingsDisabled(%llu):"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD **)(a1 + 32);
  if (v3[5])
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("event(%llu), "), v3[5]);
    v3 = *(_QWORD **)(a1 + 32);
  }
  if (v3[6])
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("transitionStep(%llu), "), v3[6]);
    v3 = *(_QWORD **)(a1 + 32);
  }
  v4 = v6;
  if (v3[7])
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("session(%llu), "), v3[7]);
    v4 = v6;
    v3 = *(_QWORD **)(a1 + 32);
  }
  if (v3[8])
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("engineStep(%llu), "), v3[8]);
    v4 = v6;
    v3 = *(_QWORD **)(a1 + 32);
  }
  if (v3[9])
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("dates(%llu), "), v3[9]);
    v4 = v6;
    v3 = *(_QWORD **)(a1 + 32);
  }
  if (v3[10])
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("invalidate(%llu), "), v3[10]);
    v4 = v6;
    v3 = *(_QWORD **)(a1 + 32);
  }
  if (v3[11])
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("misc(%llu), "), v3[11]);
    v4 = v6;
    v3 = *(_QWORD **)(a1 + 32);
  }
  v5 = v3[4];
  if (v5)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("unknown(%llu), "), v5);
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lock_flipbook);
}

- (void)incrementDisablePowerSavingUsageCountForReason:.cold.1()
{
  __assert_rtn("-[BLSHFlipbookPowerSavingProvider incrementDisablePowerSavingUsageCountForReason:]", "BLSHAlwaysOnPresentationEngine.m", 2385, "reason < BLSHFlipbookPowerSavingDisabledReasonsCount");
}

- (void)incrementDisablePowerSavingUsageCountForReason:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "lock_description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4(&dword_2145AC000, a2, v4, "%p did increment power savings: %{public}@", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)decrementDisablePowerSavingUsageCountForReason:.cold.1()
{
  __assert_rtn("-[BLSHFlipbookPowerSavingProvider decrementDisablePowerSavingUsageCountForReason:]", "BLSHAlwaysOnPresentationEngine.m", 2399, "_lock_count > 0");
}

- (void)decrementDisablePowerSavingUsageCountForReason:.cold.2()
{
  __assert_rtn("-[BLSHFlipbookPowerSavingProvider decrementDisablePowerSavingUsageCountForReason:]", "BLSHAlwaysOnPresentationEngine.m", 2400, "reason < BLSHFlipbookPowerSavingDisabledReasonsCount");
}

- (void)decrementDisablePowerSavingUsageCountForReason:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "lock_description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218498;
  v9 = a1;
  v10 = 2048;
  v11 = a2;
  v12 = 2114;
  v13 = v6;
  OUTLINED_FUNCTION_19(&dword_2145AC000, a3, v7, "%p did decrement power savings after removing reason:%ld remaining: %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_14();
}

@end
