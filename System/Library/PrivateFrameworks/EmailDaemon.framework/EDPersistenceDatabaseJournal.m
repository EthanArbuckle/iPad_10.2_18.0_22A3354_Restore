@implementation EDPersistenceDatabaseJournal

- (EDPersistenceDatabaseJournal)initWithJournalManager:(id)a3 number:(unint64_t)a4
{
  id v7;
  EDPersistenceDatabaseJournal *v8;
  EDPersistenceDatabaseJournal *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EDPersistenceDatabaseJournal;
  v8 = -[EDPersistenceDatabaseJournal init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_journalManager, a3);
    v9->_number = a4;
    v9->_referenceCountLock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)EDPersistenceDatabaseJournal;
  -[EDPersistenceDatabaseJournal description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ number: %lu, referenceCount: %lu"), v4, -[EDPersistenceDatabaseJournal number](self, "number"), -[EDPersistenceDatabaseJournal referenceCount](self, "referenceCount"));

  return v5;
}

- (NSString)path
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[EDPersistenceDatabaseJournal journalManager](self, "journalManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "journalDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EDPersistenceDatabaseJournal number](self, "number"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)checkOut
{
  NSObject *v3;
  int v4;
  EDPersistenceDatabaseJournal *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Checking out %@", (uint8_t *)&v4, 0xCu);
  }

  os_unfair_lock_lock(&self->_referenceCountLock);
  ++self->_referenceCount;
  os_unfair_lock_unlock(&self->_referenceCountLock);
}

- (void)checkIn
{
  NSObject *v4;
  unint64_t referenceCount;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  EDPersistenceDatabaseJournal *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Checking in %@", (uint8_t *)&v9, 0xCu);
  }

  os_unfair_lock_lock(&self->_referenceCountLock);
  referenceCount = self->_referenceCount;
  if (!referenceCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabaseJournal.m"), 72, CFSTR("reference count should be non-zero"));

    referenceCount = self->_referenceCount;
  }
  v6 = referenceCount - 1;
  self->_referenceCount = referenceCount - 1;
  os_unfair_lock_unlock(&self->_referenceCountLock);
  if (!v6)
  {
    -[EDPersistenceDatabaseJournal journalManager](self, "journalManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_journalNoLongerReferenced:", self);

  }
}

- (unint64_t)referenceCount
{
  os_unfair_lock_s *p_referenceCountLock;
  unint64_t referenceCount;

  p_referenceCountLock = &self->_referenceCountLock;
  os_unfair_lock_lock(&self->_referenceCountLock);
  referenceCount = self->_referenceCount;
  os_unfair_lock_unlock(p_referenceCountLock);
  return referenceCount;
}

- (unint64_t)number
{
  return self->_number;
}

- (EDPersistenceDatabaseJournalManager)journalManager
{
  return self->_journalManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_journalManager, 0);
}

@end
