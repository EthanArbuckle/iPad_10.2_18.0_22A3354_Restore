@implementation NTKPhotosReader

- (NTKPhotosReader)initWithResourceDirectory:(id)a3
{
  id v4;
  NTKPhotosReader *v5;
  uint64_t v6;
  NSString *resourceDirectory;
  NSString *assetCollectionIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKPhotosReader;
  v5 = -[NTKPhotosReader init](&v10, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "copy");
      resourceDirectory = v5->_resourceDirectory;
      v5->_resourceDirectory = (NSString *)v6;

    }
    assetCollectionIdentifier = v5->_assetCollectionIdentifier;
    v5->_assetCollectionIdentifier = 0;

  }
  return v5;
}

+ (id)readerForResourceDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  __objc2_class *v9;
  id v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v6)
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[NTKPhotosReader readerForResourceDirectory:].cold.1();

    goto LABEL_5;
  }
  if (objc_msgSend(v5, "containsObject:", CFSTR("Info.plist")))
  {
    v9 = _NTKLegacySidecarPhotosReader;
LABEL_10:
    v8 = (void *)objc_msgSend([v9 alloc], "initWithResourceDirectory:", v3);
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "containsObject:", CFSTR("Images.plist")))
  {
    v9 = _NTKImageListPhotosReader;
    goto LABEL_10;
  }
LABEL_5:
  v8 = 0;
LABEL_11:

  return v8;
}

+ (id)readerForSyncedAlbumWithResourceDirectory:(id)a3
{
  id v3;
  _NTKImageListPhotosReader *v4;

  v3 = a3;
  v4 = -[_NTKImageListPhotosReader initWithResourceDirectory:]([_NTKImageListPhotosReader alloc], "initWithResourceDirectory:", v3);

  return v4;
}

+ (id)readerForMemoriesWithResourceDirectory:(id)a3
{
  id v3;
  _NTKImageListPhotosReader *v4;

  v3 = a3;
  v4 = -[_NTKImageListPhotosReader initWithResourceDirectory:]([_NTKImageListPhotosReader alloc], "initWithResourceDirectory:", v3);

  return v4;
}

- (unint64_t)count
{
  return 0;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)firstObject
{
  void *v3;

  v3 = -[NTKPhotosReader count](self, "count");
  if (v3)
  {
    -[NTKPhotosReader objectAtIndex:](self, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)lastObject
{
  void *v3;

  v3 = -[NTKPhotosReader count](self, "count");
  if (v3)
  {
    -[NTKPhotosReader objectAtIndex:](self, "objectAtIndex:", -[NTKPhotosReader count](self, "count") - 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id *v11;

  a3->var2 = &self->_mutationCount;
  a3->var0 = 1;
  v8 = a3->var3[0];
  v9 = v8 + a5;
  if (v8 + a5 > -[NTKPhotosReader count](self, "count"))
    v9 = -[NTKPhotosReader count](self, "count");
  v10 = v9 - v8;
  if (v9 > v8)
  {
    v11 = a4;
    do
      *v11++ = -[NTKPhotosReader objectAtIndex:](self, "objectAtIndex:", v8++);
    while (v9 != v8);
  }
  a3->var3[0] = v9;
  a3->var1 = a4;
  return v10;
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (NTKPhotosReaderDelegate)delegate
{
  return (NTKPhotosReaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)assetCollectionIdentifier
{
  return self->_assetCollectionIdentifier;
}

- (void)setAssetCollectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionIdentifier, a3);
}

- (unint64_t)mutationCount
{
  return self->_mutationCount;
}

- (void)setMutationCount:(unint64_t)a3
{
  self->_mutationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resourceDirectory, 0);
}

+ (void)readerForResourceDirectory:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_9(v0);
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "%@: cannot read contents of %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

@end
