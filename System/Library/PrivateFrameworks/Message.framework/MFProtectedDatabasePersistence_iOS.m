@implementation MFProtectedDatabasePersistence_iOS

- (BOOL)supportsJournaling
{
  return 1;
}

+ (id)protectedDatabaseName
{
  return CFSTR("protected");
}

- (BOOL)protectedDataAvailable
{
  void *v3;
  BOOL v4;
  objc_super v6;

  +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "allowedToAccessProtectedData"))
  {
    v6.receiver = self;
    v6.super_class = (Class)MFProtectedDatabasePersistence_iOS;
    v4 = -[EDProtectedDatabasePersistence protectedDataAvailable](&v6, sel_protectedDataAvailable);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)finishJournalReconciliation:(unint64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFProtectedDatabasePersistence_iOS;
  -[EDProtectedDatabasePersistence finishJournalReconciliation:](&v5, sel_finishJournalReconciliation_);
  if (a3 == 2)
  {
    +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "journalReconciliationFailed");
  }
  else
  {
    if (a3)
      return;
    +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "journalWasReconciled");
  }

}

+ (id)journalDatabaseName
{
  return CFSTR("journal");
}

- (void)addAdditionalCriteriaToCleanupActivity:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFProtectedDatabasePersistence_iOS;
  -[EDProtectedDatabasePersistence addAdditionalCriteriaToCleanupActivity:](&v5, sel_addAdditionalCriteriaToCleanupActivity_, v4);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808A8], 1);

}

@end
