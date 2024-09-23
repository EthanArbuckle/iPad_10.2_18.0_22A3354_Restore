@implementation RecordStoreManager

- (RecordStoreManager)init
{
  RecordStoreManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RecordStoreManager;
  v2 = -[RecordStoreManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("DESRecordStoreManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)fetchRecordSetForBundleId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__RecordStoreManager_fetchRecordSetForBundleId_completion___block_invoke;
  v10[3] = &unk_2510B5F28;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[RecordStoreManager fetchSavedRecordInfoForBundleId:completion:](self, "fetchSavedRecordInfoForBundleId:completion:", v9, v10);

}

void __59__RecordStoreManager_fetchRecordSetForBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  RecordSet *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_msgSend(v7, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Successfully fetched records: %@"), v9);

    v10 = -[RecordSet initWithNativeRecords:nativeRecordInfo:]([RecordSet alloc], "initWithNativeRecords:nativeRecordInfo:", v11, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    NSLog(CFSTR("Fail to fetch records for %@"), *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)fetchSavedRecordInfoForBundleId:(id)a3 completion:(id)a4
{
  objc_class *v4;
  void (**v5)(id, id, id, void *);
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = (void (**)(id, id, id, void *))a4;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = 0;
  AddRecordsForType(CFSTR("com.apple.siri.speech-dictation-personalization"), v6, CFSTR("1"), &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  v10 = v9;
  if (v8)
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("com.apple.siri.speech-dictation-personalization"));
  else
    NSLog(CFSTR("Could not read records for %@: %@"), CFSTR("com.apple.siri.speech-dictation-personalization"), v9);
  v5[2](v5, v7, v6, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
