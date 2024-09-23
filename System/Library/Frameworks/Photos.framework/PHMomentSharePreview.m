@implementation PHMomentSharePreview

- (PHMomentSharePreview)initWithThumbnailImageData:(id)a3 previewData:(id)a4
{
  id v7;
  id v8;
  PHMomentSharePreview *v9;
  PHMomentSharePreview *v10;
  uint64_t v11;
  CPLMomentSharePreviewData *previewData;
  uint64_t v13;
  NSArray *previewImageData;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PHAsset *keyAsset;
  NSString *v22;
  NSString *v23;
  void *v24;
  uint64_t v25;
  NSArray *curatedAssetIdentifiers;
  objc_super v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PHMomentSharePreview;
  v9 = -[PHMomentSharePreview init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_thumbnailImageData, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D113E0]), "initWithData:", v8);
    previewData = v10->_previewData;
    v10->_previewData = (CPLMomentSharePreviewData *)v11;

    -[CPLMomentSharePreviewData previewImageDatas](v10->_previewData, "previewImageDatas");
    v13 = objc_claimAutoreleasedReturnValue();
    previewImageData = v10->_previewImageData;
    v10->_previewImageData = (NSArray *)v13;

    -[CPLMomentSharePreviewData keyAssetIdentifier](v10->_previewData, "keyAssetIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      +[PHPhotoLibrary sharedMomentSharePhotoLibrary](PHPhotoLibrary, "sharedMomentSharePhotoLibrary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "librarySpecificFetchOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v29[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAsset fetchAssetsWithCloudIdentifiers:options:](PHAsset, "fetchAssetsWithCloudIdentifiers:options:", v18, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = objc_claimAutoreleasedReturnValue();
      keyAsset = v10->_keyAsset;
      v10->_keyAsset = (PHAsset *)v20;

    }
    -[CPLMomentSharePreviewData cropRectString](v10->_previewData, "cropRectString");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      v10->_cropRect = NSRectFromString(v22);
    -[CPLMomentSharePreviewData curatedAssetIdentifiers](v10->_previewData, "curatedAssetIdentifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
    {
      v25 = objc_msgSend(v24, "copy");
      curatedAssetIdentifiers = v10->_curatedAssetIdentifiers;
      v10->_curatedAssetIdentifiers = (NSArray *)v25;

    }
  }

  return v10;
}

- (NSString)keyAssetIdentifier
{
  return (NSString *)-[CPLMomentSharePreviewData keyAssetIdentifier](self->_previewData, "keyAssetIdentifier");
}

- (id)description
{
  void *v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[NSData length](self->_thumbnailImageData, "length");
  -[NSArray firstObject](self->_previewImageData, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  -[PHMomentSharePreview keyAssetIdentifier](self, "keyAssetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRect(self->_cropRect);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Thumbnail:%lu bytes Preview:%lu bytes Key Asset:%@ Crop rect:%@"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (void)setThumbnailImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)previewImageData
{
  return self->_previewImageData;
}

- (void)setPreviewImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setKeyAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (NSArray)curatedAssetIdentifiers
{
  return self->_curatedAssetIdentifiers;
}

- (void)setCuratedAssetIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_previewData, 0);
}

@end
