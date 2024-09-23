@implementation FMSynchronizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

- (FMSynchronizer)initWithDescription:(id)a3 andTimeout:(double)a4
{
  id v7;
  FMSynchronizer *v8;
  FMSynchronizer *v9;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *sem;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMSynchronizer;
  v8 = -[FMSynchronizer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_info, a3);
    v9->_timeout = a4;
    v10 = dispatch_semaphore_create(0);
    sem = v9->_sem;
    v9->_sem = (OS_dispatch_semaphore *)v10;

  }
  return v9;
}

- (void)signal
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1AEA5C000, a2, OS_LOG_TYPE_DEBUG, "Signaling end of wait for %@", (uint8_t *)&v4, 0xCu);

}

- (void)wait
{
  double v3;
  double v4;
  double v5;
  double v6;
  dispatch_time_t v7;
  NSObject *v8;
  intptr_t v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  const __CFString *v15;
  int v16;
  double v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[FMSynchronizer timeout](self, "timeout");
  if (v5 == -1.0)
  {
    v7 = -1;
  }
  else
  {
    -[FMSynchronizer timeout](self, "timeout");
    v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  }
  -[FMSynchronizer sem](self, "sem");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_semaphore_wait(v8, v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v11 = v10;
  if (v9)
    -[FMSynchronizer setTimeoutOccurred:](self, "setTimeoutOccurred:", 1);
  LogCategory_FMSynchronizer();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    -[FMSynchronizer info](self, "info");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[FMSynchronizer timeoutOccurred](self, "timeoutOccurred");
    v15 = CFSTR("replied");
    v16 = 134218498;
    v17 = v11 - v4;
    v18 = 2112;
    if (v14)
      v15 = CFSTR("timed out");
    v19 = v13;
    v20 = 2112;
    v21 = v15;
    _os_log_debug_impl(&dword_1AEA5C000, v12, OS_LOG_TYPE_DEBUG, "Done waiting (%f seconds) for %@. Status: %@", (uint8_t *)&v16, 0x20u);

  }
}

- (double)timeout
{
  return self->_timeout;
}

- (OS_dispatch_semaphore)sem
{
  return self->_sem;
}

- (BOOL)timeoutOccurred
{
  return self->_timeoutOccurred;
}

- (void)setTimeoutOccurred:(BOOL)a3
{
  self->_timeoutOccurred = a3;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void)setSem:(id)a3
{
  objc_storeStrong((id *)&self->_sem, a3);
}

@end
