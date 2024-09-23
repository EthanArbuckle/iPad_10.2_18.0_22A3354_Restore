@implementation _MKFHomePerson

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_146065 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_146065, &__block_literal_global_146066);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_146067;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_25584B408;
}

- (void)updateWithHMPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MKFHomePerson name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomePerson setName:](self, "setName:", v8);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "personLinks", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        -[_MKFHomePerson photosPersonForPersonLink:](self, "photosPersonForPersonLink:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          -[_MKFHomePerson setLinkedPhotosPerson:](self, "setLinkedPhotosPerson:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (id)createHMPerson
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc(MEMORY[0x24BDD7848]);
  -[_MKFHomePerson modelID](self, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUID:", v4);

  -[_MKFHomePerson name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFHomePerson linkedPhotosPerson](self, "linkedPhotosPerson");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x24BDD78B8];
    objc_msgSend(v8, "user");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modelID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "personManagerUUIDFromUserUUID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x24BDD78A8]);
    objc_msgSend(v9, "modelID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithPersonUUID:personManagerUUID:", v15, v13);

    objc_msgSend(v7, "addObject:", v16);
  }
  objc_msgSend(v5, "setPersonLinks:", v7);
  v17 = (void *)objc_msgSend(v5, "copy");

  return v17;
}

- (id)photosPersonForPersonLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_MKFHomePerson home](self, "home", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)MEMORY[0x24BDD78B8];
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "modelID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "personManagerUUIDFromUserUUID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "personManagerUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v12);

        if ((v14 & 1) != 0)
        {
          objc_msgSend(v4, "personUUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMCContext findPhotosPersonWithModelID:](HMCContext, "findPhotosPersonWithModelID:", v15);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (MKFHomePersonDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFHomePersonDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFHomePerson"));
}

@end
