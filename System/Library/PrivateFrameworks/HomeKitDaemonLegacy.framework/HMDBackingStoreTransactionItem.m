@implementation HMDBackingStoreTransactionItem

- (HMDBackingStoreTransactionItem)initWithChange:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  HMDBackingStoreTransactionItem *v9;
  HMDBackingStoreTransactionItem *v10;
  uint64_t v11;
  NSSet *dependentUUIDs;
  char isKindOfClass;
  void *v14;
  HMDBackingStoreTransactionItem *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDBackingStoreTransactionItem;
  v9 = -[HMDBackingStoreTransactionItem init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_change, a3);
    objc_msgSend(v7, "dependentUUIDs");
    v11 = objc_claimAutoreleasedReturnValue();
    dependentUUIDs = v10->_dependentUUIDs;
    v10->_dependentUUIDs = (NSSet *)v11;

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v14 = v8;
    if ((isKindOfClass & 1) != 0)
      v14 = (void *)objc_msgSend(v8, "copy");
    objc_storeStrong((id *)&v10->_message, v14);
    if ((isKindOfClass & 1) != 0)

    v15 = v10;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[HMDBackingStoreTransactionItem change](self, "change");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "objectChangeType");
  if ((unint64_t)(v6 - 1) > 2)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E89B7420[v6 - 1];
  v8 = v7;
  objc_msgSend(v3, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreTransactionItem message](self, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@(%@) uuid:%@ parent:%@ message:%@>"), v5, v8, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (HMDBackingStoreModelObject)change
{
  return self->_change;
}

- (NSSet)dependentUUIDs
{
  return self->_dependentUUIDs;
}

- (HMFMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_dependentUUIDs, 0);
  objc_storeStrong((id *)&self->_change, 0);
}

@end
