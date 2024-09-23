@implementation HDMedicationSyncRequester

- (HDMedicationSyncRequester)initWithProfileExtension:(id)a3
{
  id v4;
  void *v5;
  HDMedicationSyncRequester *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)HDMedicationSyncRequester;
  v6 = -[HDSyncRequester initWithProfile:](&v9, sel_initWithProfile_, v5);

  if (v6)
  {
    objc_msgSend(v4, "medicationScheduleManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerObserver:queue:", v6, 0);

  }
  return v6;
}

- (void)scheduleManager:(id)a3 didAddOrModifySchedulesBySyncIdentity:(id)a4
{
  -[HDMedicationSyncRequester _triggerSyncIfNeededForSchedulesBySyncIdentity:](self, a4);
}

- (void)_triggerSyncIfNeededForSchedulesBySyncIdentity:(void *)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    objc_msgSend(a1, "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "syncIdentityManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentSyncIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "persistentID");

    objc_msgSend(v10, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v8, "containsObject:", v9);

    if ((_DWORD)v5)
      objc_msgSend(a1, "requestSyncsWithReason:options:", CFSTR("Did insert medication schedules"), 1);
  }

}

- (void)unitTesting_triggerSyncForSchedulesBySyncIdentity:(id)a3
{
  -[HDMedicationSyncRequester _triggerSyncIfNeededForSchedulesBySyncIdentity:](self, a3);
}

@end
