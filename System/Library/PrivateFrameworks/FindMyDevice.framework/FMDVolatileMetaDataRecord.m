@implementation FMDVolatileMetaDataRecord

- (FMDVolatileMetaDataRecord)init
{
  FMDVolatileMetaDataRecord *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDVolatileMetaDataRecord;
  v2 = -[FMDVolatileMetaDataRecord init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("FMDVolatileMetaDataRecordQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    -[FMDVolatileMetaDataRecord setDictionary:](v2, "setDictionary:", MEMORY[0x1E0C9AA70]);
  }
  return v2;
}

- (void)appendMetaData:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__FMDVolatileMetaDataRecord_appendMetaData___block_invoke;
  block[3] = &unk_1E829CA18;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __44__FMDVolatileMetaDataRecord_appendMetaData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fm_dictionaryByDeeplySettingValuesForKeysWithDictionary:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDictionary:", v2);

}

- (FMDVolatileMetaDataRecord)initWithDictionary:(id)a3
{
  id v4;
  FMDVolatileMetaDataRecord *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serialQueue;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDVolatileMetaDataRecord;
  v5 = -[FMDVolatileMetaDataRecord init](&v10, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("FMDVolatileMetaDataRecordQueue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    if (v4)
      v8 = v4;
    else
      v8 = (id)MEMORY[0x1E0C9AA70];
    -[FMDVolatileMetaDataRecord setDictionary:](v5, "setDictionary:", v8);
  }

  return v5;
}

- (NSDictionary)dictionaryValue
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__FMDVolatileMetaDataRecord_dictionaryValue__block_invoke;
  v5[3] = &unk_1E829CA40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __44__FMDVolatileMetaDataRecord_dictionaryValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (FMDVolatileMetaDataRecord)initWithCoder:(id)a3
{
  id v4;
  FMDVolatileMetaDataRecord *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serialQueue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FMDVolatileMetaDataRecord;
  v5 = -[FMDVolatileMetaDataRecord init](&v14, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("FMDVolatileMetaDataRecordQueue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_dictionary);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDVolatileMetaDataRecord setDictionary:](v5, "setDictionary:", v12);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *serialQueue;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__FMDVolatileMetaDataRecord_encodeWithCoder___block_invoke;
  v8[3] = &unk_1E829CA40;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(serialQueue, v8);
  v6 = v10[5];
  NSStringFromSelector(sel_dictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v7);

  _Block_object_dispose(&v9, 8);
}

void __45__FMDVolatileMetaDataRecord_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
