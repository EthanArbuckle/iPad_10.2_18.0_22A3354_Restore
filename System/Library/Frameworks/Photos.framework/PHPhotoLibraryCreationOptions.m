@implementation PHPhotoLibraryCreationOptions

+ (id)creationOptionsForDefaultApplicationLibraryWithContainerIdentifier:(id)a3
{
  void *v3;

  objc_msgSend(a1, "creationOptionsForApplicationLibraryWithContainerIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuid:", *MEMORY[0x1E0D72410]);
  return v3;
}

+ (id)creationOptionsForApplicationLibraryWithContainerIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setDomain:", 3);
  if (v4)
  {
    objc_msgSend(v5, "setContainerIdentifier:", v4);
  }
  else
  {
    +[PHPhotoLibraryIdentifier defaultApplicationContainerIdentifier](PHPhotoLibraryIdentifier, "defaultApplicationContainerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContainerIdentifier:", v6);

  }
  objc_msgSend(v5, "setInternalCreateOptions:", 115);

  return v5;
}

+ (id)creationOptionsForUserLibrary
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setDomain:", 2);
  objc_msgSend(v2, "setInternalCreateOptions:", 32);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[PHPhotoLibraryCreationOptions libraryURL](self, "libraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLibraryURL:", v5);

  objc_msgSend(v4, "setDomain:", -[PHPhotoLibraryCreationOptions domain](self, "domain"));
  -[PHPhotoLibraryCreationOptions userDescription](self, "userDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserDescription:", v6);

  -[PHPhotoLibraryCreationOptions containerIdentifier](self, "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainerIdentifier:", v7);

  objc_msgSend(v4, "setInternalCreateOptions:", -[PHPhotoLibraryCreationOptions internalCreateOptions](self, "internalCreateOptions"));
  -[PHPhotoLibraryCreationOptions uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUuid:", v8);

  return v4;
}

- (NSString)containerIdentifier
{
  NSString *v3;

  v3 = self->_containerIdentifier;
  if (!v3)
  {
    if (-[PHPhotoLibraryCreationOptions domain](self, "domain") == 3)
    {
      +[PHPhotoLibraryIdentifier defaultApplicationContainerIdentifier](PHPhotoLibraryIdentifier, "defaultApplicationContainerIdentifier");
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSString *)(id)*MEMORY[0x1E0D72458];
    }
  }
  return v3;
}

- (void)setContainerIdentifier:(id)a3
{
  NSString *v4;
  NSString *containerIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  containerIdentifier = self->_containerIdentifier;
  self->_containerIdentifier = v4;

}

- (NSString)userDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLibraryURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (unint64_t)internalCreateOptions
{
  return self->_internalCreateOptions;
}

- (void)setInternalCreateOptions:(unint64_t)a3
{
  self->_internalCreateOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end
