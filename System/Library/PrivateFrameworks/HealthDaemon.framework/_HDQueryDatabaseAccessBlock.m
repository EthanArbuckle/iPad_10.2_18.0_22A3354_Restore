@implementation _HDQueryDatabaseAccessBlock

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSString *processBundleIdentifier;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_queryServer);
  objc_msgSend(WeakRetained, "queryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringFromQoS();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  processBundleIdentifier = self->_processBundleIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_creationTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ query:%@ QoS:%@ process:%@ timestamp:%@>"), v5, v7, v8, processBundleIdentifier, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_queryServer);
  objc_storeStrong(&self->_block, 0);
}

@end
