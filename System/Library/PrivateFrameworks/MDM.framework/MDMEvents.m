@implementation MDMEvents

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__MDMEvents_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance__sharedInstance_1;
}

void __27__MDMEvents_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance__sharedInstance_1;
  sharedInstance__sharedInstance_1 = (uint64_t)v1;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MDMEventsFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MDMEventsFilePath();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "DMCWriteToBinaryFile:", v7);

    MDMEventsFilePath();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    DMCSetSkipBackupAttributeToItemAtPath();

  }
}

- (MDMEvents)init
{
  MDMEvents *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *writerQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MDMEvents;
  v2 = -[MDMEvents init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MDMEventQueue", 0);
    writerQueue = v2->_writerQueue;
    v2->_writerQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)recordDateForEvent:(id)a3
{
  id v4;
  NSObject *writerQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  writerQueue = self->_writerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__MDMEvents_recordDateForEvent___block_invoke;
  block[3] = &unk_24EB68230;
  v8 = v4;
  v6 = v4;
  dispatch_async(writerQueue, block);

}

void __32__MDMEvents_recordDateForEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCED8];
  MDMEventsFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

  MDMEventsFilePath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "DMCWriteToBinaryFile:", v5);

}

- (void)recordData:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  NSObject *writerQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  writerQueue = self->_writerQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __33__MDMEvents_recordData_forEvent___block_invoke;
  v11[3] = &unk_24EB68258;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(writerQueue, v11);

}

void __33__MDMEvents_recordData_forEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDBCED8];
  MDMEventsFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  MDMEventsFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "DMCWriteToBinaryFile:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writerQueue, 0);
}

@end
