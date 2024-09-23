@implementation MKFCKSharedUserPhotosPerson

- (void)updateWithHMPerson:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  -[MKFCKSharedUserPhotosPerson name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects();

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v12, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKSharedUserPhotosPerson setName:](self, "setName:", v7);

  }
  -[MKFCKSharedUserPhotosPerson photoLibraryPersonUUID](self, "photoLibraryPersonUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "externalPersonUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HMFEqualObjects();

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v12, "externalPersonUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKSharedUserPhotosPerson setPhotoLibraryPersonUUID:](self, "setPhotoLibraryPersonUUID:", v11);

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

  v3 = objc_alloc(MEMORY[0x24BDD7848]);
  -[MKFCKSharedUserPhotosPerson modelID](self, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUID:", v4);

  -[MKFCKSharedUserPhotosPerson name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  -[MKFCKSharedUserPhotosPerson photoLibraryPersonUUID](self, "photoLibraryPersonUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExternalPersonUUID:", v7);

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKSharedUserPhotosPerson"));
}

@end
