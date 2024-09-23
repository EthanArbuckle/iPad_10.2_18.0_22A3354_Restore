@implementation PHPhotoLibraryAppPrivateData

- (PHPhotoLibraryAppPrivateData)initWithLibrary:(id)a3
{
  id v4;
  PHPhotoLibraryAppPrivateData *v5;
  PHPhotoLibraryAppPrivateData *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  PLAppPrivateData *impl;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHPhotoLibraryAppPrivateData;
  v5 = -[PHPhotoLibraryAppPrivateData init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_photoLibrary, v4);
    v8 = (void *)MEMORY[0x1E0D73158];
    v9 = v7;
    objc_msgSend(v4, "photoLibraryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appPrivateDataForLibraryURL:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    impl = v6->_impl;
    v6->_impl = (PLAppPrivateData *)v11;

  }
  return v6;
}

- (id)debugDescription
{
  PLAppPrivateData *impl;

  impl = self->_impl;
  if (impl)
    -[PLAppPrivateData description](impl, "description");
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> (INVALIDATED)"), objc_opt_class(), self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)invalidate
{
  PLAppPrivateData *impl;

  impl = self->_impl;
  self->_impl = 0;

}

- (id)valueForKey:(id)a3
{
  return (id)-[PLAppPrivateData valueForKey:](self->_impl, "valueForKey:", a3);
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  return -[PLAppPrivateData setValue:forKey:error:](self->_impl, "setValue:forKey:error:", a3, a4, a5);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  BOOL v5;
  id v6;
  void *v7;
  id v8;

  v8 = 0;
  v5 = -[PHPhotoLibraryAppPrivateData setValue:forKey:error:](self, "setValue:forKey:error:", a3, a4, &v8);
  v6 = v8;
  if (!v5)
  {
    -[PHPhotoLibraryAppPrivateData photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appPrivateDataWriteFailedWithError:", v6);

  }
}

- (id)valueForKeyPath:(id)a3
{
  return (id)-[PLAppPrivateData valueForKeyPath:](self->_impl, "valueForKeyPath:", a3);
}

- (BOOL)setValue:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  return -[PLAppPrivateData setValue:forKeyPath:error:](self->_impl, "setValue:forKeyPath:error:", a3, a4, a5);
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  BOOL v5;
  id v6;
  void *v7;
  id v8;

  v8 = 0;
  v5 = -[PHPhotoLibraryAppPrivateData setValue:forKeyPath:error:](self, "setValue:forKeyPath:error:", a3, a4, &v8);
  v6 = v8;
  if (!v5)
  {
    -[PHPhotoLibraryAppPrivateData photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appPrivateDataWriteFailedWithError:", v6);

  }
}

- (id)dictionaryWithValuesForKeys:(id)a3
{
  return (id)-[PLAppPrivateData dictionaryWithValuesForKeys:](self->_impl, "dictionaryWithValuesForKeys:", a3);
}

- (BOOL)setValuesForKeysWithDictionary:(id)a3 error:(id *)a4
{
  return -[PLAppPrivateData setValuesForKeysWithDictionary:error:](self->_impl, "setValuesForKeysWithDictionary:error:", a3, a4);
}

- (void)setValuesForKeysWithDictionary:(id)a3
{
  BOOL v4;
  id v5;
  void *v6;
  id v7;

  v7 = 0;
  v4 = -[PHPhotoLibraryAppPrivateData setValuesForKeysWithDictionary:error:](self, "setValuesForKeysWithDictionary:error:", a3, &v7);
  v5 = v7;
  if (!v4)
  {
    -[PHPhotoLibraryAppPrivateData photoLibrary](self, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appPrivateDataWriteFailedWithError:", v5);

  }
}

- (PLAppPrivateData)impl
{
  return (PLAppPrivateData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setImpl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_photoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_impl, 0);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end
