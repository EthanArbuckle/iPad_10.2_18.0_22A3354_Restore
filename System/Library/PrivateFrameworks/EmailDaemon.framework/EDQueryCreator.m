@implementation EDQueryCreator

- (EDQueryCreator)initWithQueryType:(id)a3
{
  id v5;
  EDQueryCreator *v6;
  EDQueryCreator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDQueryCreator;
  v6 = -[EDQueryCreator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queryType, a3);

  return v7;
}

- (id)queryWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[EDQueryCreator queryType](self, "queryType");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9 == *MEMORY[0x1E0D1DE48])
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForSendLaterMessagesWithStartDate:endDate:", v7, v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForExcludingMessagesInMailboxesWithTypes:", &unk_1E94E5578);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3528];
    v28[0] = v13;
    v28[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (v9 == *MEMORY[0x1E0D1DE28])
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForReadLaterMessagesWithStartDate:endDate:", v7, v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl())
    {
      v13 = v13;
      v12 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInMailboxWithType:", 7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB3528];
      v27[0] = v13;
      v27[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_8:

    if (v12)
      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDQueryCreator.m"), 44, CFSTR("The query type isn't allowed."));

  v12 = 0;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v10, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v22 = objc_opt_class();
  v26 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v21, "initWithTargetClass:predicate:sortDescriptors:", v22, v12, v23);

  return v24;
}

- (NSString)queryType
{
  return self->_queryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryType, 0);
}

@end
