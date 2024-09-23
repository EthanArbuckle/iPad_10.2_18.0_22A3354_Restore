@implementation PHImportAssetThumbnailDataRequest

- (id)description
{
  return CFSTR("thumbnail");
}

- (PHImportAssetThumbnailDataRequest)initWithAsset:(id)a3 longestSide:(unint64_t)a4 priority:(unsigned __int8)a5
{
  PHImportAssetThumbnailDataRequest *result;

  result = -[PHImportAssetDataRequest initWithAsset:](self, "initWithAsset:", a3);
  if (result)
  {
    result->_longestSide = a4;
    result->_priority = a5;
  }
  return result;
}

- (id)requestAsset
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PHImportAssetDataRequest asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "largeRender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PHImportAssetDataRequest asset](self, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "largeMovieRender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[PHImportAssetDataRequest asset](self, "asset");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v10;

  }
  return v6;
}

- (unint64_t)longestSide
{
  return self->_longestSide;
}

- (unsigned)priority
{
  return self->_priority;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
