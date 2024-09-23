@implementation AVTArchiverBasedStoreBackend

+ (id)storeLocationForDomainIdentifier:(id)a3 environment:(id)a4
{
  return (id)objc_msgSend(a4, "storeLocation", a3);
}

- (AVTArchiverBasedStoreBackend)initWithStoreLocation:(id)a3 domainIdentifier:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTArchiverBasedStoreBackend *v12;
  AVTArchiverBasedStoreBackend *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTArchiverBasedStoreBackend;
  v12 = -[AVTArchiverBasedStoreBackend init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storeLocation, a3);
    objc_storeStrong((id *)&v13->_domainIdentifier, a4);
    objc_storeStrong((id *)&v13->_environment, a5);
  }

  return v13;
}

- (BOOL)loadContentFromDiskIfNeeded:(id *)a3
{
  void *v5;

  -[AVTArchiverBasedStoreBackend model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 || -[AVTArchiverBasedStoreBackend loadContentFromDisk:](self, "loadContentFromDisk:", a3);
}

- (BOOL)loadContentFromDisk:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AVTArchiverBasedStoreBackend environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTArchiverBasedStoreBackend storeLocation](self, "storeLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTArchiverBasedStorePersistence readContentFromDiskAtLocation:logger:error:](AVTArchiverBasedStorePersistence, "readContentFromDiskAtLocation:logger:error:", v7, v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[AVTArchiverBasedStoreBackend loadModel:](self, "loadModel:", v8);

  return v8 != 0;
}

- (void)loadModel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "records");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "classifyRecordsByIdentifiers:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTArchiverBasedStoreBackend setModel:](self, "setModel:", v4);

  -[AVTArchiverBasedStoreBackend setSortedAvatars:](self, "setSortedAvatars:", v6);
  -[AVTArchiverBasedStoreBackend setAvatarsByIdentifiers:](self, "setAvatarsByIdentifiers:", v5);

}

- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  if (-[AVTArchiverBasedStoreBackend loadContentFromDiskIfNeeded:](self, "loadContentFromDiskIfNeeded:", a4))
  {
    v7 = objc_msgSend(v6, "criteria");
    v8 = (void *)MEMORY[0x24BDBD1A8];
    switch(v7)
    {
      case 0:
      case 4:
        -[AVTArchiverBasedStoreBackend allAvatars](self, "allAvatars");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
      case 2:
        objc_msgSend(v6, "identifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTArchiverBasedStoreBackend avatarsWithIdentifiers:error:](self, "avatarsWithIdentifiers:error:", v9, a4);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 3:
      case 7:
        break;
      case 6:
        objc_msgSend(v6, "excludingIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTArchiverBasedStoreBackend avatarsExcludingIdentifiers:error:](self, "avatarsExcludingIdentifiers:error:", v9, a4);
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v8 = (void *)v10;

        break;
      default:
        if (!a4)
          goto LABEL_7;
        +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 999, 0);
        v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
LABEL_7:
    v8 = 0;
  }

  return v8;
}

- (id)allAvatars
{
  void *v2;
  void *v3;

  -[AVTArchiverBasedStoreBackend sortedAvatars](self, "sortedAvatars");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)avatarsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9);
        -[AVTArchiverBasedStoreBackend sortedAvatars](self, "sortedAvatars");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[AVTAvatarRecord matchingIdentifierTest:](AVTAvatarRecord, "matchingIdentifierTest:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "indexOfObjectPassingTest:", v12);

        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v18, "addObject:", v10);
        }
        else
        {
          -[AVTArchiverBasedStoreBackend sortedAvatars](self, "sortedAvatars");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v15);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(v19, "copy");
  return v16;
}

- (id)avatarsExcludingIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  -[AVTArchiverBasedStoreBackend sortedAvatars](self, "sortedAvatars");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__AVTArchiverBasedStoreBackend_avatarsExcludingIdentifiers_error___block_invoke;
  v13[3] = &unk_24DD327F8;
  v14 = v5;
  v7 = v5;
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTArchiverBasedStoreBackend sortedAvatars](self, "sortedAvatars");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectsAtIndexes:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "copy");
  return v11;
}

BOOL __66__AVTArchiverBasedStoreBackend_avatarsExcludingIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "indexOfObject:", v3) == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (BOOL)saveAvatars:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (!-[AVTArchiverBasedStoreBackend saveAvatar:error:](self, "saveAvatar:error:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), a4, (_QWORD)v13))
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)saveAvatar:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v6 = a3;
  if (!-[AVTArchiverBasedStoreBackend loadContentFromDiskIfNeeded:](self, "loadContentFromDiskIfNeeded:", a4))
    goto LABEL_7;
  -[AVTArchiverBasedStoreBackend sortedAvatars](self, "sortedAvatars");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarRecord matchingIdentifierTest:](AVTAvatarRecord, "matchingIdentifierTest:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "indexOfObjectPassingTest:", v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL
    && !-[AVTArchiverBasedStoreBackend canCreateAvatarWithError:](self, "canCreateAvatarWithError:", 0))
  {
    if (a4)
    {
      +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 578, 0);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  -[AVTArchiverBasedStoreBackend environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_class();
  -[AVTArchiverBasedStoreBackend domainIdentifier](self, "domainIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTArchiverBasedStoreBackend model](self, "model");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rootBySavingAvatarRecord:afterAvatarRecord:forDomainIdentifier:toRoot:", v6, 0, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[AVTArchiverBasedStoreBackend saveModel:logger:error:](self, "saveModel:logger:error:", v16, v12, a4);
LABEL_8:

  return v17;
}

- (BOOL)deleteAvatarWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v6 = a3;
  if (-[AVTArchiverBasedStoreBackend loadContentFromDiskIfNeeded:](self, "loadContentFromDiskIfNeeded:", a4))
  {
    -[AVTArchiverBasedStoreBackend environment](self, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "logDeletingRecordWithIdentifier:", v6);
    v9 = (void *)objc_opt_class();
    -[AVTArchiverBasedStoreBackend model](self, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rootByRemovingAvatarWithIdentifier:fromRoot:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[AVTArchiverBasedStoreBackend saveModel:logger:error:](self, "saveModel:logger:error:", v11, v8, a4);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)duplicateAvatarRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  AVTAvatarRecord *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AVTAvatarRecord *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  AVTAvatarRecord *v20;
  AVTAvatarRecord *v21;

  v6 = a3;
  if (!-[AVTArchiverBasedStoreBackend loadContentFromDiskIfNeeded:](self, "loadContentFromDiskIfNeeded:", a4))
    goto LABEL_9;
  if (!-[AVTArchiverBasedStoreBackend canCreateAvatarWithError:](self, "canCreateAvatarWithError:", 0))
  {
    if (a4)
    {
      +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 578, 0);
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v21 = 0;
    goto LABEL_10;
  }
  -[AVTArchiverBasedStoreBackend environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logDuplicatingRecordWithIdentifier:", v9);

  v10 = [AVTAvatarRecord alloc];
  objc_msgSend(v6, "avatarData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v6, "orderDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingTimeInterval:", 0.5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AVTAvatarRecord initWithAvatarData:orderDate:](v10, "initWithAvatarData:orderDate:", v12, v14);

  v16 = (void *)objc_opt_class();
  -[AVTArchiverBasedStoreBackend domainIdentifier](self, "domainIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTArchiverBasedStoreBackend model](self, "model");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rootBySavingAvatarRecord:afterAvatarRecord:forDomainIdentifier:toRoot:", v15, v6, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AVTArchiverBasedStoreBackend saveModel:logger:error:](self, "saveModel:logger:error:", v19, v8, a4))
    v20 = v15;
  else
    v20 = 0;
  v21 = v20;

LABEL_10:
  return v21;
}

- (BOOL)canCreateAvatarWithError:(id *)a3
{
  BOOL v4;
  void *v5;
  unint64_t v6;

  if (-[AVTArchiverBasedStoreBackend avatarCountWithError:](self, "avatarCountWithError:", a3) == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[AVTArchiverBasedStoreBackend sortedAvatars](self, "sortedAvatars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v4 = v6 < objc_msgSend((id)objc_opt_class(), "maximumNumberOfSavableAvatars");

  return v4;
}

- (BOOL)saveModel:(id)a3 logger:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;

  v8 = a3;
  v9 = a4;
  -[AVTArchiverBasedStoreBackend storeLocation](self, "storeLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[AVTArchiverBasedStorePersistence writeContent:toDiskAtLocation:logger:error:](AVTArchiverBasedStorePersistence, "writeContent:toDiskAtLocation:logger:error:", v8, v10, v9, a5);

  if (v11)
    -[AVTArchiverBasedStoreBackend loadModel:](self, "loadModel:", v8);

  return v11;
}

- (unint64_t)avatarCountWithError:(id *)a3
{
  void *v4;
  unint64_t v5;

  if (!-[AVTArchiverBasedStoreBackend loadContentFromDiskIfNeeded:](self, "loadContentFromDiskIfNeeded:", a3))
    return 0x7FFFFFFFFFFFFFFFLL;
  -[AVTArchiverBasedStoreBackend sortedAvatars](self, "sortedAvatars");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

+ (id)rootBySavingAvatarRecord:(id)a3 afterAvatarRecord:(id)a4 forDomainIdentifier:(id)a5 toRoot:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  AVTArchiverBasedDomain *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  AVTArchiverBasedStoreRoot *v35;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v12, "domains");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __102__AVTArchiverBasedStoreBackend_rootBySavingAvatarRecord_afterAvatarRecord_forDomainIdentifier_toRoot___block_invoke;
  v39[3] = &unk_24DD32888;
  v15 = v11;
  v40 = v15;
  v16 = objc_msgSend(v14, "indexOfObjectPassingTest:", v39);
  v38 = v15;
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = [AVTArchiverBasedDomain alloc];
    objc_msgSend(v9, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[AVTArchiverBasedDomain initWithDomainIdentifier:primaryAvatarIdentifier:](v17, "initWithDomainIdentifier:primaryAvatarIdentifier:", v15, v18);

    v37 = (void *)v19;
    objc_msgSend(v14, "addObject:", v19);
  }
  else
  {
    v20 = v16;
    objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "domainBySettingPrimaryAvatarIdentifier:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v23;
    objc_msgSend(v14, "replaceObjectAtIndex:withObject:", v20, v23);
  }
  objc_msgSend(v12, "records");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(v24, "mutableCopy");
  objc_msgSend(v9, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarRecord matchingIdentifierTest:](AVTAvatarRecord, "matchingIdentifierTest:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v25, "indexOfObjectPassingTest:", v27);

  v29 = objc_msgSend(v25, "count");
  if (v10)
  {
    v30 = v10;
    objc_msgSend(v10, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTAvatarRecord matchingIdentifierTest:](AVTAvatarRecord, "matchingIdentifierTest:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v25, "indexOfObjectPassingTest:", v32);

  }
  else
  {
    v30 = 0;
    v33 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v33 == 0x7FFFFFFFFFFFFFFFLL)
      v34 = v29;
    else
      v34 = v33 + 1;
    objc_msgSend(v25, "insertObject:atIndex:", v9, v34);
  }
  else
  {
    objc_msgSend(v25, "replaceObjectAtIndex:withObject:", v28, v9);
  }
  v35 = -[AVTArchiverBasedStoreRoot initWithDomains:records:]([AVTArchiverBasedStoreRoot alloc], "initWithDomains:records:", v14, v25);

  return v35;
}

uint64_t __102__AVTArchiverBasedStoreBackend_rootBySavingAvatarRecord_afterAvatarRecord_forDomainIdentifier_toRoot___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "domainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)rootByRemovingAvatarWithIdentifier:(id)a3 fromRoot:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  AVTArchiverBasedStoreRoot *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  AVTArchiverBasedStoreRoot *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "records");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  +[AVTAvatarRecord matchingIdentifierTest:](AVTAvatarRecord, "matchingIdentifierTest:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "indexOfObjectPassingTest:", v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (AVTArchiverBasedStoreRoot *)v6;
  }
  else
  {
    objc_msgSend(v8, "removeObjectAtIndex:", v10);
    objc_msgSend(v6, "domains");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    v14 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __76__AVTArchiverBasedStoreBackend_rootByRemovingAvatarWithIdentifier_fromRoot___block_invoke;
    v24[3] = &unk_24DD32888;
    v25 = v5;
    objc_msgSend(v13, "indexesOfObjectsPassingTest:", v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v14;
    v20 = 3221225472;
    v21 = __76__AVTArchiverBasedStoreBackend_rootByRemovingAvatarWithIdentifier_fromRoot___block_invoke_2;
    v22 = &unk_24DD328B0;
    v23 = v13;
    v16 = v13;
    objc_msgSend(v15, "enumerateIndexesUsingBlock:", &v19);
    v17 = [AVTArchiverBasedStoreRoot alloc];
    v11 = -[AVTArchiverBasedStoreRoot initWithDomains:records:](v17, "initWithDomains:records:", v16, v8, v19, v20, v21, v22);

  }
  return v11;
}

uint64_t __76__AVTArchiverBasedStoreBackend_rootByRemovingAvatarWithIdentifier_fromRoot___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "primaryAvatarIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __76__AVTArchiverBasedStoreBackend_rootByRemovingAvatarWithIdentifier_fromRoot___block_invoke_2(uint64_t a1, uint64_t a2)
{
  AVTArchiverBasedDomain *v4;
  void *v5;
  AVTArchiverBasedDomain *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [AVTArchiverBasedDomain alloc];
  objc_msgSend(v7, "domainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVTArchiverBasedDomain initWithDomainIdentifier:primaryAvatarIdentifier:](v4, "initWithDomainIdentifier:primaryAvatarIdentifier:", v5, 0);

  objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", a2, v6);
}

+ (id)classifyRecordsByIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (AVTStoreBackendDelegate)backendDelegate
{
  return 0;
}

- (AVTAvatarRecordChangeTracker)recordChangeTracker
{
  return 0;
}

- (NSURL)storeLocation
{
  return self->_storeLocation;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (AVTArchiverBasedStoreRoot)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSDictionary)avatarsByIdentifiers
{
  return self->_avatarsByIdentifiers;
}

- (void)setAvatarsByIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)sortedAvatars
{
  return self->_sortedAvatars;
}

- (void)setSortedAvatars:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedAvatars, 0);
  objc_storeStrong((id *)&self->_avatarsByIdentifiers, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_storeLocation, 0);
}

@end
