@implementation CALNNotificationRecordsDiff

- (CALNNotificationRecordsDiff)initWithAddedRecords:(id)a3 removedRecords:(id)a4 modifiedRecords:(id)a5
{
  id v8;
  id v9;
  id v10;
  CALNNotificationRecordsDiff *v11;
  uint64_t v12;
  NSArray *addedRecords;
  uint64_t v14;
  NSArray *removedRecords;
  uint64_t v16;
  NSArray *modifiedRecords;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CALNNotificationRecordsDiff;
  v11 = -[CALNNotificationRecordsDiff init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    addedRecords = v11->_addedRecords;
    v11->_addedRecords = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    removedRecords = v11->_removedRecords;
    v11->_removedRecords = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    modifiedRecords = v11->_modifiedRecords;
    v11->_modifiedRecords = (NSArray *)v16;

  }
  return v11;
}

+ (id)diffWithAddedRecords:(id)a3 removedRecords:(id)a4 modifiedRecords:(id)a5
{
  id v7;
  id v8;
  id v9;
  CALNNotificationRecordsDiff *v10;
  CALNNotificationRecordsDiff *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count") || objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
  {
    v10 = -[CALNNotificationRecordsDiff initWithAddedRecords:removedRecords:modifiedRecords:]([CALNNotificationRecordsDiff alloc], "initWithAddedRecords:removedRecords:modifiedRecords:", v7, v8, v9);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "emptyDiff");
    v10 = (CALNNotificationRecordsDiff *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (id)emptyDiff
{
  if (emptyDiff_onceToken != -1)
    dispatch_once(&emptyDiff_onceToken, &__block_literal_global_0);
  return (id)emptyDiff_emptyDiff;
}

void __40__CALNNotificationRecordsDiff_emptyDiff__block_invoke()
{
  CALNNotificationRecordsDiff *v0;
  uint64_t v1;
  void *v2;

  v0 = [CALNNotificationRecordsDiff alloc];
  v1 = -[CALNNotificationRecordsDiff initWithAddedRecords:removedRecords:modifiedRecords:](v0, "initWithAddedRecords:removedRecords:modifiedRecords:", MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);
  v2 = (void *)emptyDiff_emptyDiff;
  emptyDiff_emptyDiff = v1;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CALNNotificationRecordsDiff addedRecords](self, "addedRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecordsDiff removedRecords](self, "removedRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecordsDiff modifiedRecords](self, "modifiedRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(\naddedRecords = %@\nremovedRecords = %@\nmodifiedRecords = %@\n)"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)addedRecords
{
  return self->_addedRecords;
}

- (NSArray)removedRecords
{
  return self->_removedRecords;
}

- (NSArray)modifiedRecords
{
  return self->_modifiedRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedRecords, 0);
  objc_storeStrong((id *)&self->_removedRecords, 0);
  objc_storeStrong((id *)&self->_addedRecords, 0);
}

@end
