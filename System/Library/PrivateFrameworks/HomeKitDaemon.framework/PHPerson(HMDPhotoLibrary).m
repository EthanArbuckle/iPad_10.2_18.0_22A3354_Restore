@implementation PHPerson(HMDPhotoLibrary)

- (HMDPhotoLibraryPerson)createPhotoLibraryPerson
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDPhotoLibraryPerson *v7;

  v2 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(a1, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithUUIDString:", v3);

  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(a1, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  v7 = -[HMDPhotoLibraryPerson initWithUUID:name:]([HMDPhotoLibraryPerson alloc], "initWithUUID:name:", v4, v6);
  return v7;
}

@end
