@implementation PHImportBatch

- (PHImportBatch)init
{
  PHImportBatch *v2;
  uint64_t v3;
  NSDate *start;
  uint64_t v5;
  NSMutableArray *records;
  uint64_t v7;
  PHImportTimerCollection *timers;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *semaphore;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PHImportBatch;
  v2 = -[PHImportBatch init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    start = v2->_start;
    v2->_start = (NSDate *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 100);
    v5 = objc_claimAutoreleasedReturnValue();
    records = v2->_records;
    v2->_records = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    timers = v2->_timers;
    v2->_timers = (PHImportTimerCollection *)v7;

    v9 = dispatch_semaphore_create(0);
    semaphore = v2->_semaphore;
    v2->_semaphore = (OS_dispatch_semaphore *)v9;

  }
  return v2;
}

- (double)duration
{
  double v2;

  -[NSDate timeIntervalSinceNow](self->_start, "timeIntervalSinceNow");
  return -v2;
}

- (NSMutableArray)records
{
  return self->_records;
}

- (PHImportTimerCollection)timers
{
  return self->_timers;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
