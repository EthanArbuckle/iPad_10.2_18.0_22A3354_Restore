@implementation HDStaticSyncTask

- (HDStaticSyncTask)initWithProfile:(id)a3 options:(unint64_t)a4 storeIdentifier:(id)a5
{
  id v8;
  id v9;
  HDStaticSyncTask *v10;
  HDStaticSyncTask *v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDStaticSyncTask;
  v10 = -[HDStaticSyncTask init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_profile, v8);
    v11->_options = a4;
    HKCreateSerialDispatchQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v11->_storeIdentifier, v9);
  }

  return v11;
}

- (id)runWithCompletion:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (id)objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
