@implementation FMFSynchronizer

- (FMFSynchronizer)initWithDescription:(id)a3 andTimeout:(double)a4
{
  id v7;
  FMFSynchronizer *v8;
  FMFSynchronizer *v9;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *sem;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMFSynchronizer;
  v8 = -[FMFSynchronizer init](&v13, sel_init);
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
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[FMFSynchronizer sem](self, "sem");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v3);

  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[FMFSynchronizer info](self, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1DC81B000, v4, OS_LOG_TYPE_DEFAULT, "Signaling end of wait for %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)wait
{
  double v3;
  double v4;
  double v5;
  dispatch_time_t v6;
  NSObject *v7;
  intptr_t v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  int v15;
  double v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[FMFSynchronizer timeout](self, "timeout");
  v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  -[FMFSynchronizer sem](self, "sem");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_semaphore_wait(v7, v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v10 = v9;
  LogCategory_Daemon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[FMFSynchronizer info](self, "info");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("timed out");
    v15 = 134218498;
    v16 = v10 - v4;
    v17 = 2112;
    if (!v8)
      v14 = CFSTR("replied");
    v18 = v12;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_1DC81B000, v11, OS_LOG_TYPE_DEFAULT, "Done waiting (%f seconds) for %@. Status: %@", (uint8_t *)&v15, 0x20u);

  }
}

- (id)loggingID
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FMFSynchronizer info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@(0x%X)"), v4, objc_opt_class(), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)timeoutOccurred
{
  return self->_timeoutOccurred;
}

- (void)setTimeoutOccurred:(BOOL)a3
{
  self->_timeoutOccurred = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (OS_dispatch_semaphore)sem
{
  return self->_sem;
}

- (void)setSem:(id)a3
{
  objc_storeStrong((id *)&self->_sem, a3);
}

- (NSString)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_sem, 0);
}

@end
