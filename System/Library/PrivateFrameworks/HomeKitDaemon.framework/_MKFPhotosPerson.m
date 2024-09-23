@implementation _MKFPhotosPerson

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_10623 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_10623, &__block_literal_global_10624);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_10625;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_255784110;
}

- (void)updateWithHMPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MKFPhotosPerson name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFPhotosPerson setName:](self, "setName:", v8);

  }
  -[_MKFPhotosPerson photoLibraryPersonUUID](self, "photoLibraryPersonUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalPersonUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HMFEqualObjects();

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v4, "externalPersonUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFPhotosPerson setPhotoLibraryPersonUUID:](self, "setPhotoLibraryPersonUUID:", v12);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "personLinks", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "personUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMCContext findHomePersonWithModelID:](HMCContext, "findHomePersonWithModelID:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          -[_MKFPhotosPerson setLinkedHomePerson:](self, "setLinkedHomePerson:", v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
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
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc(MEMORY[0x24BDD7848]);
  -[_MKFPhotosPerson modelID](self, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUID:", v4);

  -[_MKFPhotosPerson name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  -[_MKFPhotosPerson photoLibraryPersonUUID](self, "photoLibraryPersonUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExternalPersonUUID:", v7);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFPhotosPerson linkedHomePerson](self, "linkedHomePerson");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x24BDD76E8];
    objc_msgSend(v9, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modelID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "personManagerUUIDFromHomeUUID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x24BDD78A8]);
    objc_msgSend(v10, "modelID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithPersonUUID:personManagerUUID:", v16, v14);

    objc_msgSend(v8, "addObject:", v17);
  }
  objc_msgSend(v5, "setPersonLinks:", v8);
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

- (MKFPhotosPersonDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFPhotosPersonDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFPhotosPerson user](self, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFPhotosPerson"));
}

@end
