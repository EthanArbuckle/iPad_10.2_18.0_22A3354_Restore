@implementation PFUbiquityRecordsImporterSchedulingContext

- (PFUbiquityRecordsImporterSchedulingContext)init
{
  PFUbiquityRecordsImporterSchedulingContext *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityRecordsImporterSchedulingContext;
  v2 = -[PFUbiquityRecordsImporterSchedulingContext init](&v4, sel_init);
  if (v2)
  {
    v2->_pendingLogLocations = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_scheduledLogLocations = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_failedLogLocations = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_ignoredLogLocations = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_logLocationsToEncounteredErrors = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v2;
}

- (PFUbiquityRecordsImporterSchedulingContext)initWithPendingLogLocations:(id)a3
{
  PFUbiquityRecordsImporterSchedulingContext *v4;
  PFUbiquityRecordsImporterSchedulingContext *v5;

  v4 = -[PFUbiquityRecordsImporterSchedulingContext init](self, "init");
  v5 = v4;
  if (v4)
    -[NSMutableSet unionSet:](v4->_pendingLogLocations, "unionSet:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_pendingLogLocations = 0;
  self->_scheduledLogLocations = 0;

  self->_failedLogLocations = 0;
  self->_ignoredLogLocations = 0;

  self->_logLocationsToEncounteredErrors = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityRecordsImporterSchedulingContext;
  -[PFUbiquityRecordsImporterSchedulingContext dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityRecordsImporterSchedulingContext;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\tpendingLogs: %@\n\tscheduledLogs: %@\n\tfailedLogs: %@\n\tignoredlogs: %@\n\tencounteredErrors: %@\n"), -[PFUbiquityRecordsImporterSchedulingContext description](&v3, sel_description), self->_pendingLogLocations, self->_scheduledLogLocations, self->_failedLogLocations, self->_ignoredLogLocations, self->_logLocationsToEncounteredErrors);
}

- (void)transactionLogAtLocationWasScheduled:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 8), "addObject:", a2);
    objc_msgSend(*(id *)(a1 + 16), "removeObject:", a2);
    os_unfair_lock_unlock(v4);
  }
}

- (void)transactionLogAtLocationWasIgnored:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
    objc_msgSend(*(id *)(a1 + 16), "removeObject:", a2);
    os_unfair_lock_unlock(v4);
  }
}

- (void)transactionLogAtLocation:(void *)a3 failedToOpenWithError:
{
  if (a1)
  {
    if (objc_msgSend(a3, "code") == 134324)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Ignoring file: %@\nError: %@"), "-[PFUbiquityRecordsImporterSchedulingContext transactionLogAtLocation:failedToOpenWithError:]", 79, a2, a3);
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 24), "addObject:", a2);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", a3, a2);
      objc_msgSend(*(id *)(a1 + 16), "removeObject:", a2);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    }
  }
}

- (void)addPendingLogLocations:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 16), "unionSet:", a2);
    os_unfair_lock_unlock(v4);
  }
}

- (void)addPendingLogLocation:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 16), "addObject:", a2);
    os_unfair_lock_unlock(v4);
  }
}

@end
