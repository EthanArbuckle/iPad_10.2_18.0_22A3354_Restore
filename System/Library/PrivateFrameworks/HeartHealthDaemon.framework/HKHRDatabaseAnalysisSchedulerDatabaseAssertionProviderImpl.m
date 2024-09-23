@implementation HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl

- (HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl)initWithProfile:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl *v8;
  HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl *v9;
  uint64_t v10;
  NSString *identifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl;
  v8 = -[HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    v10 = objc_msgSend(v7, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

  }
  return v9;
}

- (id)takeAssertionWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", self->_identifier, a3, 300.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
