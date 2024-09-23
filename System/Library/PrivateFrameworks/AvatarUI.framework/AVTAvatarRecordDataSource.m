@implementation AVTAvatarRecordDataSource

- (AVTAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AVTAvatarRecordDataSource *v9;

  v6 = a4;
  v7 = a3;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVTAvatarRecordDataSource initWithRecordStore:fetchRequest:environment:](self, "initWithRecordStore:fetchRequest:environment:", v7, v6, v8);

  return v9;
}

- (AVTAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTAvatarRecordDataSource *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  AVTPAvatarRecordDataSource *persistenceAvatarRecordDataSource;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVTAvatarRecordDataSource;
  v12 = -[AVTAvatarRecordDataSource init](&v19, sel_init);
  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0D00870]);
    objc_msgSend(v9, "internalStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coreEnvironment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "initWithRecordStore:fetchRequest:environment:", v14, v10, v15);
    persistenceAvatarRecordDataSource = v12->_persistenceAvatarRecordDataSource;
    v12->_persistenceAvatarRecordDataSource = (AVTPAvatarRecordDataSource *)v16;

    objc_storeStrong((id *)&v12->_avatarStore, a3);
  }

  return v12;
}

- (id)internalRecordStore
{
  void *v3;
  AVTAvatarStore *v4;
  void *v5;
  void *v6;
  AVTAvatarStore *v7;

  -[AVTAvatarRecordDataSource observableWrappedAvatarStore](self, "observableWrappedAvatarStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [AVTAvatarStore alloc];
    -[AVTAvatarRecordDataSource persistenceAvatarRecordDataSource](self, "persistenceAvatarRecordDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internalRecordStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AVTAvatarStore initWithPersistenceAvatarStore:](v4, "initWithPersistenceAvatarStore:", v6);

    -[AVTAvatarRecordDataSource setObservableWrappedAvatarStore:](self, "setObservableWrappedAvatarStore:", v7);
  }
  return -[AVTAvatarRecordDataSource observableWrappedAvatarStore](self, "observableWrappedAvatarStore");
}

- (void)addPriorityObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTAvatarRecordDataSource persistenceAvatarRecordDataSource](self, "persistenceAvatarRecordDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addPriorityObserver:", v4);

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTAvatarRecordDataSource persistenceAvatarRecordDataSource](self, "persistenceAvatarRecordDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTAvatarRecordDataSource persistenceAvatarRecordDataSource](self, "persistenceAvatarRecordDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)flushRecordsForEnteringBackground
{
  id v2;

  -[AVTAvatarRecordDataSource persistenceAvatarRecordDataSource](self, "persistenceAvatarRecordDataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushRecordsForEnteringBackground");

}

- (unint64_t)numberOfRecords
{
  void *v2;
  unint64_t v3;

  -[AVTAvatarRecordDataSource persistenceAvatarRecordDataSource](self, "persistenceAvatarRecordDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfRecords");

  return v3;
}

- (id)recordAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[AVTAvatarRecordDataSource persistenceAvatarRecordDataSource](self, "persistenceAvatarRecordDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)recordStore
{
  void *v2;
  void *v3;

  -[AVTAvatarRecordDataSource persistenceAvatarRecordDataSource](self, "persistenceAvatarRecordDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)indexesOfRecordsPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AVTAvatarRecordDataSource persistenceAvatarRecordDataSource](self, "persistenceAvatarRecordDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexesOfRecordsPassingTest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)indexOfRecordPassingTest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[AVTAvatarRecordDataSource persistenceAvatarRecordDataSource](self, "persistenceAvatarRecordDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfRecordPassingTest:", v4);

  return v6;
}

- (id)indexSetForEditableRecords
{
  void *v2;
  void *v3;

  -[AVTAvatarRecordDataSource persistenceAvatarRecordDataSource](self, "persistenceAvatarRecordDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexSetForEditableRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AVTPAvatarRecordDataSource)persistenceAvatarRecordDataSource
{
  return self->_persistenceAvatarRecordDataSource;
}

- (void)setPersistenceAvatarRecordDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceAvatarRecordDataSource, a3);
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (void)setAvatarStore:(id)a3
{
  objc_storeStrong((id *)&self->_avatarStore, a3);
}

- (AVTAvatarStore)observableWrappedAvatarStore
{
  return self->_observableWrappedAvatarStore;
}

- (void)setObservableWrappedAvatarStore:(id)a3
{
  objc_storeStrong((id *)&self->_observableWrappedAvatarStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observableWrappedAvatarStore, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_persistenceAvatarRecordDataSource, 0);
}

+ (id)defaultUIDataSourceWithDomainIdentifier:(id)a3
{
  id v4;
  AVTAvatarStore *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(MEMORY[0x1E0D00878]);
  v5 = -[AVTAvatarStore initWithPersistenceAvatarStore:]([AVTAvatarStore alloc], "initWithPersistenceAvatarStore:", v4);
  objc_msgSend(MEMORY[0x1E0D00840], "requestForAllAvatars");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRecordStore:fetchRequest:", v5, v6);

  return v7;
}

@end
