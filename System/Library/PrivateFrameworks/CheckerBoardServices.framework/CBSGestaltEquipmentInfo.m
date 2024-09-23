@implementation CBSGestaltEquipmentInfo

- (CBSGestaltEquipmentInfo)initWithSerialNumber:(id)a3 andMEID:(id)a4 andIMEIArray:(id)a5
{
  id v9;
  id v10;
  id v11;
  CBSGestaltEquipmentInfo *v12;
  CBSGestaltEquipmentInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CBSGestaltEquipmentInfo;
  v12 = -[CBSGestaltEquipmentInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serialNumber, a3);
    objc_storeStrong((id *)&v13->_meid, a4);
    objc_storeStrong((id *)&v13->_imeiArray, a5);
  }

  return v13;
}

+ (id)CurrentEquipmentInfo
{
  if (CurrentEquipmentInfo_dispatchOnceToken != -1)
    dispatch_once(&CurrentEquipmentInfo_dispatchOnceToken, &__block_literal_global);
  return (id)CurrentEquipmentInfo_currentEquipmentInfo;
}

void __47__CBSGestaltEquipmentInfo_CurrentEquipmentInfo__block_invoke()
{
  void *v0;
  dispatch_semaphore_t v1;
  id v2;
  NSObject *v3;
  dispatch_time_t v4;
  CBSGestaltEquipmentInfo *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v0 = (void *)MGCopyAnswer();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v1 = dispatch_semaphore_create(0);
  v2 = objc_alloc_init(MEMORY[0x24BDC2810]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__CBSGestaltEquipmentInfo_CurrentEquipmentInfo__block_invoke_3;
  v8[3] = &unk_24FCB1150;
  v10 = &v18;
  v11 = &v12;
  v3 = v1;
  v9 = v3;
  objc_msgSend(v2, "copyMobileEquipmentInfo:", v8);
  v4 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v3, v4);
  v5 = [CBSGestaltEquipmentInfo alloc];
  v6 = -[CBSGestaltEquipmentInfo initWithSerialNumber:andMEID:andIMEIArray:](v5, "initWithSerialNumber:andMEID:andIMEIArray:", v0, v19[5], v13[5]);
  v7 = (void *)CurrentEquipmentInfo_currentEquipmentInfo;
  CurrentEquipmentInfo_currentEquipmentInfo = v6;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

}

intptr_t __47__CBSGestaltEquipmentInfo_CurrentEquipmentInfo__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a2, "meInfoList", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "MEID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "MEID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "copy");
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v13 = *(void **)(v12 + 40);
          *(_QWORD *)(v12 + 40) = v11;

        }
        v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(v8, "IMEI");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(v14, "addObject:", v16);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)meid
{
  return self->_meid;
}

- (NSArray)imeiArray
{
  return self->_imeiArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imeiArray, 0);
  objc_storeStrong((id *)&self->_meid, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
