@implementation HMIPersonDataSourceDisk

- (HMIPersonDataSourceDisk)initWithHomeUUID:(id)a3 sourceUUID:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  HMIPersonDataSourceDisk *v11;
  HMIPersonDataSourceDisk *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *workQueue;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSURL *sourceURL;
  void *v26;
  void *v27;
  id v28;
  HMIPersonDataSourceDisk *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  objc_super v35;

  v9 = a3;
  v10 = a4;
  v35.receiver = self;
  v35.super_class = (Class)HMIPersonDataSourceDisk;
  v11 = -[HMIPersonDataSourceDisk init](&v35, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_4;
  HMIDispatchQueueNameString(v11, 0);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = dispatch_queue_create(v14, (dispatch_queue_attr_t)v15);
  workQueue = v12->_workQueue;
  v12->_workQueue = (OS_dispatch_queue *)v16;

  objc_storeStrong((id *)&v12->_homeUUID, a3);
  objc_storeStrong((id *)&v12->_sourceUUID, a4);
  v18 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend((id)objc_opt_class(), "getStoragePath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fileURLWithPath:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "URLByAppendingPathComponent:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "URLByAppendingPathComponent:", v23);
  v24 = objc_claimAutoreleasedReturnValue();
  sourceURL = v12->_sourceURL;
  v12->_sourceURL = (NSURL *)v24;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](v12->_sourceURL, "path");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  LOBYTE(v15) = objc_msgSend(v26, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v27, 1, 0, &v34);
  v28 = v34;

  if ((v15 & 1) != 0)
  {

LABEL_4:
    v29 = v12;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error initializing with home UUID: %@ source UUID:%@"), v9, v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1031, v30, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (a5)
    *a5 = objc_retainAutorelease(v31);
  HMIErrorLog(v12, v32);

  v29 = 0;
LABEL_8:

  return v29;
}

- (void)fetchAllPersonsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMIPersonDataSourceDisk workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMIPersonDataSourceDisk_fetchAllPersonsWithCompletion___block_invoke;
  v7[3] = &unk_24DBEA348;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __57__HMIPersonDataSourceDisk_fetchAllPersonsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMIPerson *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HMIPerson *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id obj;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, MEMORY[0x24BDBD1A8], 4, &v34);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v34;

  if (v4)
  {
    v25 = a1;
    v26 = v4;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      while (2)
      {
        v9 = 0;
        v10 = v5;
        do
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(obj);
          v11 = (void *)MEMORY[0x24BDBCE50];
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v9), "URLByAppendingPathComponent:", CFSTR("person.json"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "dataWithContentsOfURL:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = v10;
          objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v13, 0, &v29);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v29;

          if (!v14)
          {
            v21 = *(_QWORD *)(v25 + 40);
            objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1031, CFSTR("Error loading person from JSON"), v5);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v22);

            goto LABEL_12;
          }
          v15 = [HMIPerson alloc];
          v16 = objc_alloc(MEMORY[0x24BDD1880]);
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("UUID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithUUIDString:", v17);
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("displayName"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[HMIPerson initWithUUID:name:](v15, "initWithUUID:name:", v18, v19);

          objc_msgSend(v28, "addObject:", v20);
          ++v9;
          v10 = v5;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v7)
          continue;
        break;
      }
    }

    (*(void (**)(void))(*(_QWORD *)(v25 + 40) + 16))();
LABEL_12:
    v4 = v26;
  }
  else
  {
    v23 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1031, CFSTR("Error enumerating persons"), v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v24);

  }
}

- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMIPersonDataSourceDisk *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMIPersonDataSourceDisk workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__HMIPersonDataSourceDisk_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __72__HMIPersonDataSourceDisk_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFDictionary *v36;
  HMIPersonFaceCrop *v37;
  HMIPersonFaceCrop *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  CGRect rect;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _QWORD v71[2];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (!v4)
  {
    v6 = 0;
    goto LABEL_24;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v67;
  v49 = v3;
  v50 = *MEMORY[0x24BDBCCD0];
  v55 = v2;
  v56 = *MEMORY[0x24BDBCC60];
  v48 = a1;
  v45 = *(_QWORD *)v67;
LABEL_3:
  v8 = 0;
  v46 = v5;
  while (1)
  {
    if (*(_QWORD *)v67 != v7)
      objc_enumerationMutation(v3);
    v47 = v8;
    v9 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v8);
    objc_msgSend(*(id *)(a1 + 40), "sourceURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v9;
    objc_msgSend(v9, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v50;
    v71[1] = v56;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v6;
    objc_msgSend(v13, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v12, v14, 5, &v65);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v65;

    if (!v15)
      break;
    v51 = v12;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    if (!v18)
    {
      v6 = v16;
      goto LABEL_20;
    }
    v19 = v18;
    v20 = *(_QWORD *)v62;
    v6 = v16;
    v21 = 0x24BDBC000uLL;
    v54 = v17;
    while (2)
    {
      v22 = 0;
      v53 = v19;
      do
      {
        if (*(_QWORD *)v62 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v22);
        v60 = 0;
        objc_msgSend(v23, "getResourceValue:forKey:error:", &v60, v56, 0);
        v24 = v60;
        if (objc_msgSend(v24, "BOOLValue"))
        {
          v25 = *(void **)(v21 + 3664);
          objc_msgSend(v23, "URLByAppendingPathComponent:", CFSTR("facecrop.json"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dataWithContentsOfURL:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v59 = v6;
          objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v27, 0, &v59);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v59;

          if (v28)
          {
            v29 = objc_alloc(MEMORY[0x24BDD1880]);
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("UUID"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v29, "initWithUUIDString:", v30);

            v32 = *(void **)(v21 + 3664);
            objc_msgSend(v23, "URLByAppendingPathComponent:", CFSTR("facecrop.jpeg"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v16;
            objc_msgSend(v32, "dataWithContentsOfURL:options:error:", v33, 0, &v58);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v58;

            if (v34)
            {
              objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("dateCreated"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              memset(&rect, 0, sizeof(rect));
              objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("faceBoundingBox"));
              v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              CGRectMakeWithDictionaryRepresentation(v36, &rect);

              v37 = [HMIPersonFaceCrop alloc];
              v38 = -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:](v37, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v31, v34, v35, v52, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
              objc_msgSend(v55, "addObject:", v38);

              v21 = 0x24BDBC000;
              v19 = v53;
              v17 = v54;
              goto LABEL_16;
            }
            v40 = *(_QWORD *)(v48 + 48);
            objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1031, CFSTR("Error loading face crop image"), v6);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, void *))(v40 + 16))(v40, 0, v41);

            v16 = v6;
          }
          else
          {
            v39 = *(_QWORD *)(v48 + 48);
            objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1031, CFSTR("Error loading face crop from JSON"), v16);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, void *))(v39 + 16))(v39, 0, v28);
          }

          v42 = v54;
          v2 = v55;
          v43 = v54;
          v3 = v49;
          v12 = v51;
          goto LABEL_28;
        }
LABEL_16:

        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      if (v19)
        continue;
      break;
    }
LABEL_20:

    v8 = v47 + 1;
    v2 = v55;
    a1 = v48;
    v3 = v49;
    v7 = v45;
    if (v47 + 1 == v46)
    {
      v5 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      if (!v5)
      {
LABEL_24:

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        v16 = v6;
        goto LABEL_29;
      }
      goto LABEL_3;
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error enumerating face crops for person UUID:%@"), v52);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1031, v43, v16);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v44 + 16))(v44, 0, v42);
LABEL_28:

LABEL_29:
}

- (void)fetchAllFaceprintsWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = a3;
  objc_msgSend(v4, "hmfErrorWithCode:", 5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = a3;
  objc_msgSend(v4, "hmfErrorWithCode:", 5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "hmfErrorWithCode:", 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "hmfErrorWithCode:", 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

- (void)performCloudPullWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = a3;
  objc_msgSend(v4, "hmfErrorWithCode:", 5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)addFaceprints:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "hmfErrorWithCode:", 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

+ (id)getStoragePath
{
  void *v2;
  void *v3;

  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringPreferenceForKey:defaultValue:", CFSTR("personDataSourceDiskStoragePath"), CFSTR("/tmp/com.apple.HomeAI/familiar-face-data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)sourceURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
