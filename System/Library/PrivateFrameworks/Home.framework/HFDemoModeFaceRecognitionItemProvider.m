@implementation HFDemoModeFaceRecognitionItemProvider

- (id)initForMode:(int64_t)a3 home:(id)a4
{
  id v7;
  HFDemoModeFaceRecognitionItemProvider *v8;
  HFDemoModeFaceRecognitionItemProvider *v9;
  uint64_t v10;
  NSMutableSet *personItems;
  HFDemoModeFaceRecognitionDataSource *v12;
  HFDemoModeFaceRecognitionDataSource *dataSource;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HFDemoModeFaceRecognitionItemProvider;
  v8 = -[HFItemProvider init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    personItems = v9->_personItems;
    v9->_personItems = (NSMutableSet *)v10;

    v12 = objc_alloc_init(HFDemoModeFaceRecognitionDataSource);
    dataSource = v9->_dataSource;
    v9->_dataSource = v12;

    objc_storeStrong((id *)&v9->_home, a4);
  }

  return v9;
}

- (HFDemoModeFaceRecognitionItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initForMode_home_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDemoModeFaceRecognitionItemProvider.m"), 36, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFDemoModeFaceRecognitionItemProvider init]",
    v5);

  return 0;
}

- (id)reloadItems
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];

  v3 = -[HFDemoModeFaceRecognitionItemProvider mode](self, "mode");
  -[HFDemoModeFaceRecognitionItemProvider dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "knownToHouseholdEntries");
  else
    objc_msgSend(v4, "recentsEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__HFDemoModeFaceRecognitionItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_1EA73CED0;
  v12[4] = self;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v6, &__block_literal_global_193, &__block_literal_global_10_12, 0, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __52__HFDemoModeFaceRecognitionItemProvider_reloadItems__block_invoke_4;
  v11[3] = &unk_1EA72C438;
  v11[4] = self;
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __52__HFDemoModeFaceRecognitionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __52__HFDemoModeFaceRecognitionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "demoRecentsEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

HFDemoModeFaceRecognitionItem *__52__HFDemoModeFaceRecognitionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  HFDemoModeFaceRecognitionItem *v7;
  void *v8;
  HFDemoModeFaceRecognitionItem *v9;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = [HFDemoModeFaceRecognitionItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFDemoModeFaceRecognitionItem initWithRecentsData:home:](v7, "initWithRecentsData:home:", v6, v8);

  return v9;
}

id __52__HFDemoModeFaceRecognitionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "personItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(*(id *)(a1 + 32), "personItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (HFDemoModeFaceRecognitionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSMutableSet)personItems
{
  return self->_personItems;
}

- (void)setPersonItems:(id)a3
{
  objc_storeStrong((id *)&self->_personItems, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_personItems, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
