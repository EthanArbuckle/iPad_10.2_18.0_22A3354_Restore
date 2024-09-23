@implementation MKPhotoLibraryAsset

- (MKPhotoLibraryAsset)initWithPath:(id)a3 filename:(id)a4 collection:(id)a5 originalFilename:(id)a6 size:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MKPhotoLibraryAsset *v16;
  MKPhotoLibraryAsset *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MKPhotoLibraryAsset;
  v16 = -[MKPhotoLibraryAsset init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[MKPhotoLibraryAsset setSize:](v16, "setSize:", a7);
    -[MKPhotoLibraryAsset setPath:](v17, "setPath:", v12);
    -[MKPhotoLibraryAsset setFilename:](v17, "setFilename:", v13);
    -[MKPhotoLibraryAsset setCollection:](v17, "setCollection:", v14);
    -[MKPhotoLibraryAsset setOriginalFilename:](v17, "setOriginalFilename:", v15);
  }

  return v17;
}

- (MKPhotoLibraryAsset)initWithIdentifier:(id)a3
{
  id v4;
  MKPhotoLibraryAsset *v5;
  MKPhotoLibraryAsset *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKPhotoLibraryAsset;
  v5 = -[MKPhotoLibraryAsset init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MKPhotoLibraryAsset setIdentifier:](v5, "setIdentifier:", v4);

  return v6;
}

- (int64_t)rowID
{
  return self->_rowID;
}

- (void)setRowID:(int64_t)a3
{
  self->_rowID = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
