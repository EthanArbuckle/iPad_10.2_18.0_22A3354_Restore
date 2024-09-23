@implementation HMIExternalPersonDataSourceDisk

- (void)addPerson:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMIPersonDataSourceDisk workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HMIExternalPersonDataSourceDisk_addPerson_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __56__HMIExternalPersonDataSourceDisk_addPerson_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "sourceURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v8 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v21);
  v9 = v21;

  if ((v8 & 1) != 0)
  {
    v23[0] = CFSTR("0.1");
    v22[0] = CFSTR("version");
    v22[1] = CFSTR("UUID");
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v11;
    v22[2] = CFSTR("displayName");
    objc_msgSend(*(id *)(a1 + 40), "name");
    v12 = objc_claimAutoreleasedReturnValue();
    v23[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("person.json"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    LOBYTE(v12) = +[HMIFaceUtilities serializeJSONObject:url:error:](HMIFaceUtilities, "serializeJSONObject:url:error:", v13, v14, &v20);
    v15 = v20;

    if ((v12 & 1) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error saving metadata to disk for person:%@"), *(_QWORD *)(a1 + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1031, v17, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

    }
    v9 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error creating directory for person:%@"), *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1031, v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v14);
  }

}

- (void)addPersonFaceCrops:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMIExternalPersonDataSourceDisk *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMIPersonDataSourceDisk workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMIExternalPersonDataSourceDisk_addPersonFaceCrops_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __65__HMIExternalPersonDataSourceDisk_addPersonFaceCrops_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  CFDictionaryRef DictionaryRepresentation;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  _QWORD v42[4];
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;

  v44 = *MEMORY[0x24BDAC8D0];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = *(id *)(a1 + 32);
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v38;
LABEL_3:
    v1 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v32)
        objc_enumerationMutation(obj);
      v2 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v1);
      objc_msgSend(*(id *)(a1 + 40), "sourceURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "personUUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "URLByAppendingPathComponent:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v12 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v36);
      v13 = v36;

      if ((v12 & 1) == 0)
        break;
      v34 = v6;
      v42[0] = CFSTR("0.1");
      v41[0] = CFSTR("version");
      v41[1] = CFSTR("UUID");
      objc_msgSend(v2, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v15;
      v41[2] = CFSTR("faceBoundingBox");
      objc_msgSend(v2, "faceBoundingBox");
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v45);
      v42[2] = DictionaryRepresentation;
      v41[3] = CFSTR("dateCreated");
      objc_msgSend(v2, "dateCreated");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HMIJSONFormattedStringForDate(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v42[3] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("facecrop.json"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v13;
      LOBYTE(DictionaryRepresentation) = +[HMIFaceUtilities serializeJSONObject:url:error:](HMIFaceUtilities, "serializeJSONObject:url:error:", v19, v20, &v35);
      v21 = v35;

      if ((DictionaryRepresentation & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error saving metadata to disk for person face crop:%@"), v2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1031, v26, v21);
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      objc_msgSend(v2, "dataRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("facecrop.jpeg"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "writeToURL:atomically:", v23, 0);

      if ((v24 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error saving face crop image to disk for person face crop:%@"), v2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1031, v26);
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v29 = (void *)v28;
        (*(void (**)(uint64_t, uint64_t))(v27 + 16))(v27, v28);

        v6 = v34;
LABEL_16:

        return;
      }

      if (v31 == ++v1)
      {
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        if (v31)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error creating directory for person face crop:%@"), v2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1031, v19, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v20);
    v21 = v13;
    goto LABEL_16;
  }
LABEL_11:

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchSettingsWithCompletion:(id)a3
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

@end
