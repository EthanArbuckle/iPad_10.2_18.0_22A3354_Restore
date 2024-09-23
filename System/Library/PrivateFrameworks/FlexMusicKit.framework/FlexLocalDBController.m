@implementation FlexLocalDBController

- (FlexLocalDBController)initWithDestinationURL:(id)a3
{
  id v5;
  FlexLocalDBController *v6;
  FlexLocalDBController *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSPersistentContainer *localSongDatabase;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSPersistentContainer *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v49[4];
  FlexLocalDBController *v50;
  objc_super v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v51.receiver = self;
  v51.super_class = (Class)FlexLocalDBController;
  v6 = -[FlexLocalDBController init](&v51, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_destinationURL, a3);
    v8 = (void *)MEMORY[0x24BDD1488];
    v9 = objc_opt_class();
    objc_msgSend_bundleForClass_(v8, v10, v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLForResource_withExtension_(v13, v14, (uint64_t)CFSTR("LocalDatabase"), (uint64_t)CFSTR("momd"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x24BDBB6B0]);
    v21 = (void *)objc_msgSend_initWithContentsOfURL_(v17, v18, (uint64_t)v16, v19, v20);
    objc_msgSend_persistentContainerWithName_managedObjectModel_(MEMORY[0x24BDBB700], v22, (uint64_t)CFSTR("SongDatabase"), (uint64_t)v21, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    localSongDatabase = v7->_localSongDatabase;
    v7->_localSongDatabase = (NSPersistentContainer *)v24;

    objc_msgSend_URLByAppendingPathComponent_(v7->_destinationURL, v26, (uint64_t)CFSTR("SongDatabase"), v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathExtension_(v29, v30, (uint64_t)CFSTR("sqlite"), v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_persistentStoreDescriptionWithURL_(MEMORY[0x24BDBB740], v34, (uint64_t)v33, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v37;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v38, (uint64_t)v52, 1, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPersistentStoreDescriptions_(v7->_localSongDatabase, v41, (uint64_t)v40, v42, v43);

    v44 = v7->_localSongDatabase;
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = sub_20D02847C;
    v49[3] = &unk_24C5F0188;
    v50 = v7;
    objc_msgSend_loadPersistentStoresWithCompletionHandler_(v44, v45, (uint64_t)v49, v46, v47);

  }
  return v7;
}

- (NSArray)allSongEntries
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  if (!objc_msgSend_isMainThread(MEMORY[0x24BDD17F0], a2, v2, v3, v4))
  {
    v18 = 0;
LABEL_8:
    v17 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_9;
  }
  objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], v6, (uint64_t)CFSTR("LocalSongs"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_viewContext(self->_localSongDatabase, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend_executeFetchRequest_error_(v14, v15, (uint64_t)v9, (uint64_t)&v24, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v24;

  if (!v17)
  {
    if (v18)
    {
      FlexLogForCategory(3uLL);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        sub_20D029DD8(v18, v19, v20, v21, v22);

    }
    goto LABEL_8;
  }
LABEL_9:

  return (NSArray *)v17;
}

- (BOOL)createSongEntryWithSongData:(id)a3 error:(id *)a4
{
  id v6;
  NSManagedObjectContext *backgroundContext;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  id v18;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_20D0287E4;
  v24 = sub_20D0287F4;
  v25 = 0;
  objc_initWeak(&location, self->_backgroundContext);
  backgroundContext = self->_backgroundContext;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_20D0287FC;
  v14[3] = &unk_24C5F01B0;
  objc_copyWeak(&v18, &location);
  v8 = v6;
  v15 = v8;
  v16 = &v20;
  v17 = &v26;
  objc_msgSend_performBlockAndWait_(backgroundContext, v9, (uint64_t)v14, v10, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v12 = *((_BYTE *)v27 + 24);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

- (BOOL)updateSongWithData:(id)a3 error:(id *)a4
{
  id v6;
  NSManagedObjectContext *backgroundContext;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  id v18;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_20D0287E4;
  v24 = sub_20D0287F4;
  v25 = 0;
  objc_initWeak(&location, self->_backgroundContext);
  backgroundContext = self->_backgroundContext;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_20D028E7C;
  v14[3] = &unk_24C5F01B0;
  objc_copyWeak(&v18, &location);
  v8 = v6;
  v15 = v8;
  v16 = &v20;
  v17 = &v26;
  objc_msgSend_performBlockAndWait_(backgroundContext, v9, (uint64_t)v14, v10, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v12 = *((_BYTE *)v27 + 24);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

- (BOOL)deleteFieldsForSongUID:(id)a3 deletions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSManagedObjectContext *backgroundContext;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  id v23;
  id location;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_20D0287E4;
  v29 = sub_20D0287F4;
  v30 = 0;
  objc_initWeak(&location, self->_backgroundContext);
  backgroundContext = self->_backgroundContext;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_20D02945C;
  v18[3] = &unk_24C5F01D8;
  objc_copyWeak(&v23, &location);
  v11 = v8;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v21 = &v25;
  v22 = &v31;
  objc_msgSend_performBlockAndWait_(backgroundContext, v13, (uint64_t)v18, v14, v15);
  if (a5)
    *a5 = objc_retainAutorelease((id)v26[5]);
  v16 = *((_BYTE *)v32 + 24);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v16;
}

- (NSDate)lastCloudCheckDate
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  NSManagedObjectContext *backgroundContext;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_20D0287E4;
  v20 = sub_20D0287F4;
  v21 = 0;
  objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], a2, (uint64_t)CFSTR("LastCloudUpdate"), v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundContext = self->_backgroundContext;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_20D02992C;
  v13[3] = &unk_24C5F0200;
  v13[4] = self;
  v7 = v5;
  v14 = v7;
  v15 = &v16;
  objc_msgSend_performBlockAndWait_(backgroundContext, v8, (uint64_t)v13, v9, v10);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return (NSDate *)v11;
}

- (void)setLastCloudCheckDate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSManagedObjectContext *backgroundContext;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], v5, (uint64_t)CFSTR("LastCloudUpdate"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundContext = self->_backgroundContext;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_20D029B28;
  v15[3] = &unk_24C5F0228;
  v15[4] = self;
  v16 = v8;
  v17 = v4;
  v10 = v4;
  v14 = v8;
  objc_msgSend_performBlockAndWait_(backgroundContext, v11, (uint64_t)v15, v12, v13);

}

- (void)_insertFirstCloudCheckDate:(id)a3 andSave:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  NSManagedObjectContext *backgroundContext;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSManagedObjectContext *v18;
  char v19;
  id v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDBB658];
  backgroundContext = self->_backgroundContext;
  v8 = a3;
  objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(v6, v9, (uint64_t)CFSTR("LastCloudUpdate"), (uint64_t)backgroundContext, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDate_(v11, v12, (uint64_t)v8, v13, v14);

  if (v4)
  {
    v18 = self->_backgroundContext;
    v25 = 0;
    v19 = objc_msgSend_save_(v18, v15, (uint64_t)&v25, v16, v17);
    v20 = v25;
    if ((v19 & 1) == 0)
    {
      FlexLogForCategory(0);
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
        sub_20D029FF0(v20, v21, v22, v23, v24);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundContext, 0);
  objc_storeStrong((id *)&self->_localSongDatabase, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
}

@end
