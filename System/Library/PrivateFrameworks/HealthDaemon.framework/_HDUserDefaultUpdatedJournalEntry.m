@implementation _HDUserDefaultUpdatedJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  void *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v6 = v8;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Unsupported journal entry %{public}@", (uint8_t *)&v7, 0xCu);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDUserDefaultUpdatedJournalEntry)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_HDUserDefaultUpdatedJournalEntry;
  return -[HDJournalEntry initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LegacyProtectedDataJournalSupport.m"), 38, CFSTR("Encoding is not supported"));

}

- (HDUserDefault)userDefault
{
  return self->_userDefault;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefault, 0);
}

@end
