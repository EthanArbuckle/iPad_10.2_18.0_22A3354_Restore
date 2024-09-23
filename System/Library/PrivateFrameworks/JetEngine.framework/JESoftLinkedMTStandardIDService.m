@implementation JESoftLinkedMTStandardIDService

- (id)idFieldsForTopic:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[JESoftLinkedMTStandardIDService backing](self, "backing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "IDFieldsForTopic:options:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[JESoftLinkedMTStandardIDService mtPromiseToAMSPromise:](self, "mtPromiseToAMSPromise:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)mtPromiseToAMSPromise:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = (objc_class *)MEMORY[0x1E0CFDBB8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__JESoftLinkedMTStandardIDService_mtPromiseToAMSPromise___block_invoke;
  v14[3] = &unk_1E3DDF140;
  v7 = v5;
  v15 = v7;
  objc_msgSend(v4, "addErrorBlock:", v14);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __57__JESoftLinkedMTStandardIDService_mtPromiseToAMSPromise___block_invoke_2;
  v12[3] = &unk_1E3DDF168;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v4, "addSuccessBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

- (MTStandardIDService)backing
{
  return self->_backing;
}

- (JESoftLinkedMTStandardIDService)initWithAMSBag:(id)a3
{
  id v4;
  JESoftLinkedMTStandardIDService *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JESoftLinkedMTStandardIDService;
  v5 = -[JESoftLinkedMTStandardIDService init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)getMTStandardIDServiceClass()), "initWithAMSBag:", v4);
    -[JESoftLinkedMTStandardIDService setBacking:](v5, "setBacking:", v6);

  }
  return v5;
}

- (void)setBacking:(id)a3
{
  objc_storeStrong((id *)&self->_backing, a3);
}

uint64_t __57__JESoftLinkedMTStandardIDService_mtPromiseToAMSPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backing, 0);
}

- (JESoftLinkedMTStandardIDService)initWithConfigDictionary:(id)a3
{
  id v4;
  JESoftLinkedMTStandardIDService *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JESoftLinkedMTStandardIDService;
  v5 = -[JESoftLinkedMTStandardIDService init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)getMTStandardIDServiceClass()), "initWithConfigDictionary:", v4);
    -[JESoftLinkedMTStandardIDService setBacking:](v5, "setBacking:", v6);

  }
  return v5;
}

- (id)sync
{
  void *v3;
  void *v4;
  void *v5;

  -[JESoftLinkedMTStandardIDService backing](self, "backing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[JESoftLinkedMTStandardIDService mtPromiseToAMSPromise:](self, "mtPromiseToAMSPromise:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)resetIDForTopics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[JESoftLinkedMTStandardIDService backing](self, "backing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetIDForTopics:options:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[JESoftLinkedMTStandardIDService mtPromiseToAMSPromise:](self, "mtPromiseToAMSPromise:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)idFieldsForTopic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[JESoftLinkedMTStandardIDService backing](self, "backing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "IDFieldsForTopic:options:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[JESoftLinkedMTStandardIDService mtPromiseToAMSPromise:](self, "mtPromiseToAMSPromise:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)secretValueForNamespace:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[JESoftLinkedMTStandardIDService backing](self, "backing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secretValueForNamespace:options:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[JESoftLinkedMTStandardIDService mtPromiseToAMSPromise:](self, "mtPromiseToAMSPromise:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)queryIDForTopic:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  -[JESoftLinkedMTStandardIDService queryIDForTopic:type:options:completion:](self, "queryIDForTopic:type:options:completion:", a3, a4, 0, a5);
}

- (void)queryIDForTopic:(id)a3 type:(int64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[JESoftLinkedMTStandardIDService backing](self, "backing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__JESoftLinkedMTStandardIDService_queryIDForTopic_type_options_completion___block_invoke;
  v15[3] = &unk_1E3DDF118;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "queryIDForTopic:type:options:completion:", v12, a4, v11, v15);

}

void __75__JESoftLinkedMTStandardIDService_queryIDForTopic_type_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && (objc_msgSend(v5, "effectiveDate"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    v14[0] = CFSTR("idString");
    objc_msgSend(v5, "idString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v14[1] = CFSTR("idType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "idType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v9;
    v14[2] = CFSTR("effectiveDate");
    objc_msgSend(v5, "effectiveDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v10;
    v14[3] = CFSTR("expirationDate");
    objc_msgSend(v5, "expirationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v11;
    v14[4] = CFSTR("isSynchronized");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isSynchronized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __57__JESoftLinkedMTStandardIDService_mtPromiseToAMSPromise___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (void)performMaintenanceWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JESoftLinkedMTStandardIDService backing](self, "backing");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performMaintenanceWithCompletion:", v4);

}

@end
