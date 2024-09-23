@implementation HDSharedSummaryQueryServer

- (HDSharedSummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDSharedSummaryQueryServer *v11;
  void *v12;
  uint64_t v13;
  HKSharedSummaryTransaction *transaction;
  void *v15;
  uint64_t v16;
  NSString *package;
  void *v18;
  uint64_t v19;
  NSSet *includedIdentifiers;
  void *v21;
  uint64_t v22;
  NSSet *includedObjectTypes;
  objc_super v25;

  v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HDSharedSummaryQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v25, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "transaction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    transaction = v11->_transaction;
    v11->_transaction = (HKSharedSummaryTransaction *)v13;

    objc_msgSend(v10, "package");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    package = v11->_package;
    v11->_package = (NSString *)v16;

    objc_msgSend(v10, "includedIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    includedIdentifiers = v11->_includedIdentifiers;
    v11->_includedIdentifiers = (NSSet *)v19;

    objc_msgSend(v10, "includedObjectTypes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    includedObjectTypes = v11->_includedObjectTypes;
    v11->_includedObjectTypes = (NSSet *)v22;

  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  id v3;
  void *v4;
  void *v5;
  HKSharedSummaryTransaction *transaction;
  NSString *package;
  NSSet *includedIdentifiers;
  NSSet *includedObjectTypes;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)HDSharedSummaryQueryServer;
  -[HDQueryServer _queue_start](&v20, sel__queue_start);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDQueryServer profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedSummaryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  transaction = self->_transaction;
  package = self->_package;
  includedIdentifiers = self->_includedIdentifiers;
  includedObjectTypes = self->_includedObjectTypes;
  v19 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __42__HDSharedSummaryQueryServer__queue_start__block_invoke;
  v17 = &unk_1E6D03E78;
  v10 = v3;
  v18 = v10;
  LODWORD(package) = objc_msgSend(v5, "enumerateSummariesInTransaction:package:names:includedObjectTypes:error:handler:", transaction, package, includedIdentifiers, includedObjectTypes, &v19, &v14);
  v11 = v19;

  -[HDQueryServer clientProxy](self, "clientProxy", v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer queryUUID](self, "queryUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)package)
    objc_msgSend(v12, "client_deliverSummaries:query:", v10, v13);
  else
    objc_msgSend(v12, "client_deliverError:forQuery:", v11, v13);

  -[HDQueryServer setDataCount:](self, "setDataCount:", objc_msgSend(v10, "count"));
}

uint64_t __42__HDSharedSummaryQueryServer__queue_start__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includedObjectTypes, 0);
  objc_storeStrong((id *)&self->_includedIdentifiers, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
