@implementation BUBlockCallThrottler

- (BUBlockCallThrottler)init
{
  BUBlockCallThrottler *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BUBlockCallThrottler;
  result = -[BUBlockCallThrottler init](&v3, sel_init);
  if (result)
    result->_minimumTimeBetweenCalls = 2.0;
  return result;
}

- (void)runBlock:(id)a3
{
  MEMORY[0x24BEDD108](self, sel__runBlock_throttle_, a3);
}

- (BOOL)runBlockThrottled:(id)a3
{
  return MEMORY[0x24BEDD108](self, sel__runBlock_throttle_, a3);
}

- (BOOL)_runBlock:(id)a3 throttle:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD *);
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  BOOL v28;
  _QWORD v30[5];

  v4 = a4;
  v6 = (void (**)(id, _QWORD *))a3;
  objc_msgSend_date(MEMORY[0x24BDBCE60], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minimumTimeBetweenCalls(self, v10, v11);
  v13 = v12;
  objc_msgSend_lastBlockCallDate(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_lastBlockCallDate(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceDate_(v9, v20, (uint64_t)v19);
    v22 = v21;

  }
  else
  {
    v22 = v13 + 1.0;
  }
  if ((objc_msgSend_running(self, v17, v18) & 1) != 0
    || v4 && (objc_msgSend_minimumTimeBetweenCalls(self, v23, v24), v22 < v25))
  {
    objc_msgSend_date(MEMORY[0x24BDBCE60], v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastBlockCallDate_(self, v27, (uint64_t)v26);

  }
  else if (v6)
  {
    v28 = 1;
    objc_msgSend_setRunning_(self, v23, 1);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = sub_212E64D04;
    v30[3] = &unk_24CED9E10;
    v30[4] = self;
    v6[2](v6, v30);
    goto LABEL_11;
  }
  v28 = 0;
LABEL_11:

  return v28;
}

- (double)minimumTimeBetweenCalls
{
  return self->_minimumTimeBetweenCalls;
}

- (void)setMinimumTimeBetweenCalls:(double)a3
{
  self->_minimumTimeBetweenCalls = a3;
}

- (NSDate)lastBlockCallDate
{
  return self->_lastBlockCallDate;
}

- (void)setLastBlockCallDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastBlockCallDate, a3);
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBlockCallDate, 0);
}

@end
