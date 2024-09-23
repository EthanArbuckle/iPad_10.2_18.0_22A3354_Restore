@implementation HMDPhotoLibraryPerson

- (HMDPhotoLibraryPerson)initWithHMPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HMDPhotoLibraryPerson *v10;

  v4 = a3;
  objc_msgSend(v4, "externalPersonUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "UUID");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDPhotoLibraryPerson initWithUUID:name:](self, "initWithUUID:name:", v8, v9);

  return v10;
}

- (HMDPhotoLibraryPerson)initWithUUID:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDPhotoLibraryPerson *v9;
  uint64_t v10;
  NSUUID *UUID;
  uint64_t v12;
  NSString *name;
  HMDPhotoLibraryPerson *v15;
  SEL v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    v17.receiver = self;
    v17.super_class = (Class)HMDPhotoLibraryPerson;
    v9 = -[HMDPhotoLibraryPerson init](&v17, sel_init);
    if (v9)
    {
      v10 = objc_msgSend(v6, "copy");
      UUID = v9->_UUID;
      v9->_UUID = (NSUUID *)v10;

      v12 = objc_msgSend(v8, "copy");
      name = v9->_name;
      v9->_name = (NSString *)v12;

    }
    return v9;
  }
  else
  {
    v15 = (HMDPhotoLibraryPerson *)_HMFPreconditionFailure();
    return (HMDPhotoLibraryPerson *)-[HMDPhotoLibraryPerson createHMPerson](v15, v16);
  }
}

- (id)createHMPerson
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDPhotoLibraryPerson UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA6D8]), "initWithUUID:", v3);
  -[HMDPhotoLibraryPerson updateHMPerson:](self, "updateHMPerson:", v4);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)updateHMPerson:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDPhotoLibraryPerson name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  -[HMDPhotoLibraryPerson UUID](self, "UUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExternalPersonUUID:", v6);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDPhotoLibraryPerson UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMDPhotoLibraryPerson name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = HMFEqualObjects();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDPhotoLibraryPerson UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDPhotoLibraryPerson UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("UUID"), v5);
  objc_msgSend(v3, "addObject:", v6);

  -[HMDPhotoLibraryPerson name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDPhotoLibraryPerson name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Name"), v9);
    objc_msgSend(v3, "addObject:", v10);

  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
