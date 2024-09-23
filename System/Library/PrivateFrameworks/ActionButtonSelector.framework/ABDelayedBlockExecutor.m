@implementation ABDelayedBlockExecutor

- (void)scheduleBlock:(double)a3 delay:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  dispatch_block_t v9;
  void *v10;
  dispatch_time_t v11;
  id v12;

  v12 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "_cancelScheduledBlock");
    v5 = MEMORY[0x23B7E420C](v12);
    v6 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v5;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v7;

    if (!*(_BYTE *)(a1 + 32))
    {
      v9 = dispatch_block_create((dispatch_block_flags_t)0, *(dispatch_block_t *)(a1 + 8));
      v10 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v9;

      v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      dispatch_after(v11, MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 16));
    }
  }

}

- (void)reschedulePendingBlock
{
  void *v2;
  double v3;
  void *v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 24);
    if (v2)
    {
      objc_msgSend(v2, "doubleValue");
      v4 = *(void **)(a1 + 8);
      if (v4)
        -[ABDelayedBlockExecutor scheduleBlock:delay:](a1, v4, v3);
    }
  }
}

- (void)cancelPendingBlock
{
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "_cancelScheduledBlock");
    v2 = (void *)a1[1];
    a1[1] = 0;

    v3 = (void *)a1[3];
    a1[3] = 0;

  }
}

- (void)pause
{
  if (a1)
  {
    if (!*((_BYTE *)a1 + 32))
    {
      *((_BYTE *)a1 + 32) = 1;
      return (void *)objc_msgSend(a1, "_cancelScheduledBlock");
    }
  }
  return a1;
}

- (void)resume
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 32))
    {
      *(_BYTE *)(a1 + 32) = 0;
      -[ABDelayedBlockExecutor reschedulePendingBlock](a1);
    }
  }
}

- (void)_cancelScheduledBlock
{
  id scheduledBlock;
  id v4;

  scheduledBlock = self->_scheduledBlock;
  if (scheduledBlock)
  {
    dispatch_block_cancel(scheduledBlock);
    v4 = self->_scheduledBlock;
    self->_scheduledBlock = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delay, 0);
  objc_storeStrong(&self->_scheduledBlock, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
