@implementation FCHeadlineThumbnail

- (FCAssetHandle)thumbnailAssetHandle
{
  return self->_thumbnailAssetHandle;
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

+ (FCHeadlineThumbnail)headlineThumbnailWithAssetHandle:(id)a3 thumbnailSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  BOOL v7;
  FCHeadlineThumbnail *v8;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  if (!v6 || (width == *MEMORY[0x1E0C9D820] ? (v7 = height == *(double *)(MEMORY[0x1E0C9D820] + 8)) : (v7 = 0), v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_alloc_init(FCHeadlineThumbnail);
    -[FCHeadlineThumbnail setThumbnailAssetHandle:](v8, "setThumbnailAssetHandle:", v6);
    -[FCHeadlineThumbnail setThumbnailSize:](v8, "setThumbnailSize:", width, height);
  }

  return v8;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (void)setThumbnailAssetHandle:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailAssetHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailAssetHandle, 0);
}

@end
