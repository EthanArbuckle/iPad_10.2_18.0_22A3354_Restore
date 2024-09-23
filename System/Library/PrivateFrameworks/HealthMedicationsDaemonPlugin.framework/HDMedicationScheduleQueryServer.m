@implementation HDMedicationScheduleQueryServer

- (HDMedicationScheduleQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDMedicationScheduleQueryServer *v11;
  uint64_t v12;
  NSArray *sortDescriptors;
  objc_super v15;

  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDMedicationScheduleQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v11->_limit = objc_msgSend(v10, "limit");
    objc_msgSend(v10, "sortDescriptors");
    v12 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v11->_sortDescriptors;
    v11->_sortDescriptors = (NSArray *)v12;

  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *sortDescriptors;
  uint64_t v11;
  id v12;
  void *v13;
  unint64_t limit;
  id v15;
  int v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HDMedicationScheduleQueryServer;
  -[HDQueryServer _queue_start](&v22, sel__queue_start);
  -[HDQueryServer queryUUID](self, "queryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer clientProxy](self, "clientProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDQueryServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "healthMedicationsProfileExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "medicationScheduleManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  sortDescriptors = self->_sortDescriptors;
  if (sortDescriptors)
  {
    v21 = 0;
    objc_msgSend(v9, "orderingTermsForSortDescriptors:error:", sortDescriptors, &v21);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v21;
    v13 = v12;
    if (!v11)
    {
      objc_msgSend(v5, "client_deliverError:forQuery:", v12, v3);
      v17 = 0;
      goto LABEL_10;
    }

    v13 = (void *)v11;
  }
  else
  {
    v13 = 0;
  }
  limit = self->_limit;
  v20 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__HDMedicationScheduleQueryServer__queue_start__block_invoke;
  v18[3] = &unk_1E6E00418;
  v15 = v6;
  v19 = v15;
  v16 = objc_msgSend(v9, "enumerateMedicationSchedulesWithPredicate:limit:orderingTerms:error:enumerationHandler:", 0, limit, v13, &v20, v18);
  v17 = v20;
  if (v16)
    objc_msgSend(v5, "client_deliverSchedules:queryUUID:", v15, v3);
  else
    objc_msgSend(v5, "client_deliverError:forQuery:", v17, v3);

LABEL_10:
}

uint64_t __47__HDMedicationScheduleQueryServer__queue_start__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end
