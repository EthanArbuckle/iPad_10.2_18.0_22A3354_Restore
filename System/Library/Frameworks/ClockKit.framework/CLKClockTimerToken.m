@implementation CLKClockTimerToken

- (CLKClockTimerToken)initWithID:(int64_t)a3
{
  CLKClockTimerToken *v4;
  uint64_t v5;
  NSNumber *id;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKClockTimerToken;
  v4 = -[CLKClockTimerToken init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    id = v4->_id;
    v4->_id = (NSNumber *)v5;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CLKClockTimerToken *v4;
  CLKClockTimerToken *v5;
  char v6;

  v4 = (CLKClockTimerToken *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4)
  {
    v6 = -[NSNumber isEqual:](v4->_id, "isEqual:", self->_id);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSNumber hash](self->_id, "hash");
}

- (id)description
{
  void *v3;
  NSNumber *id;
  const __CFString *v5;
  uint64_t v6;
  void (**v7)(void);
  void *v8;
  unint64_t v9;
  void (**v10)(void);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v3 = (void *)MEMORY[0x24BDD17C8];
  id = self->_id;
  if (self->_isActive)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = CLKClockTimerFrameIntervalForUpdateFrequency[self->_updateFrequency];
  -[CLKClockTimerToken log](self, "log");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  -[CLKClockTimerToken log](self, "log");
  v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v10[2]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 > 0x40)
  {
    objc_msgSend(v11, "substringToIndex:", 64);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingString:", CFSTR(" ..."));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v3;
    v17 = (void *)v15;
    objc_msgSend(v16, "stringWithFormat:", CFSTR("<CLKClockTimerToken: %p, id:%@, active: %@, interval:%ld>: %@"), self, id, v5, v6, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<CLKClockTimerToken: %p, id:%@, active: %@, interval:%ld>: %@"), self, id, v5, v6, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)dealloc
{
  void (**v3)(void);
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "log");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_2114F4000, a2, OS_LOG_TYPE_ERROR, "CLKClockTimerToken with id=\"%@\" was not properly stopped", (uint8_t *)&v5, 0xCu);

}

uint64_t __29__CLKClockTimerToken_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplayLink");
}

- (int64_t)updateFrequency
{
  return self->_updateFrequency;
}

- (void)setUpdateFrequency:(int64_t)a3
{
  self->_updateFrequency = a3;
}

- (BOOL)wantsCommit
{
  return self->_wantsCommit;
}

- (void)setWantsCommit:(BOOL)a3
{
  self->_wantsCommit = a3;
}

- (BOOL)wantsHighAccuracy
{
  return self->_wantsHighAccuracy;
}

- (void)setWantsHighAccuracy:(BOOL)a3
{
  self->_wantsHighAccuracy = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CLKClockTimer)owner
{
  return (CLKClockTimer *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong(&self->_log, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
