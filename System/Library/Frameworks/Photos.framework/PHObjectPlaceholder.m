@implementation PHObjectPlaceholder

- (PHObjectPlaceholder)initWithLocalIdentifier:(id)a3
{
  id v4;
  PHObjectPlaceholder *v5;
  uint64_t v6;
  NSString *localIdentifier;
  uint64_t v8;
  NSString *uuid;
  uint64_t v10;
  PHPhotoLibrary *photoLibrary;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHObjectPlaceholder;
  v5 = -[PHObjectPlaceholder init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v6;

    +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v5->_localIdentifier);
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v5->super._uuid;
    v5->super._uuid = (NSString *)v8;

    +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
    v10 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v10;

  }
  return v5;
}

- (id)localIdentifier
{
  return self->_localIdentifier;
}

- (id)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)isEqual:(id)a3
{
  PHObjectPlaceholder *v4;
  PHObjectPlaceholder *v5;
  void *v6;
  void *v7;
  char IsEqual;

  v4 = (PHObjectPlaceholder *)a3;
  if (self == v4)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PHObjectPlaceholder localIdentifier](self, "localIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHObjectPlaceholder localIdentifier](v5, "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      IsEqual = PLObjectIsEqual();
    }
    else
    {
      IsEqual = 0;
    }
  }

  return IsEqual;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PHObjectPlaceholder localIdentifier](self, "localIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)assetMediaType
{
  return self->_assetMediaType;
}

- (void)setAssetMediaType:(int64_t)a3
{
  self->_assetMediaType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end
