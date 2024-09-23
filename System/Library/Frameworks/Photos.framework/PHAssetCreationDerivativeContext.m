@implementation PHAssetCreationDerivativeContext

- (int64_t)nextAvailableThumbnailIndex
{
  return self->_nextAvailableThumbnailIndex;
}

- (void)setNextAvailableThumbnailIndex:(int64_t)a3
{
  self->_nextAvailableThumbnailIndex = a3;
}

- (PLThumbnailManager)thumbnailManager
{
  return self->_thumbnailManager;
}

- (void)setThumbnailManager:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailManager, a3);
}

- (BOOL)thumbnailWriteSucceeded
{
  return self->_thumbnailWriteSucceeded;
}

- (void)setThumbnailWriteSucceeded:(BOOL)a3
{
  self->_thumbnailWriteSucceeded = a3;
}

- (NSString)thumbnailIdentifier
{
  return self->_thumbnailIdentifier;
}

- (void)setThumbnailIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)fileURLForThumbnailFile
{
  return self->_fileURLForThumbnailFile;
}

- (void)setFileURLForThumbnailFile:(id)a3
{
  objc_storeStrong((id *)&self->_fileURLForThumbnailFile, a3);
}

- (NSData)originalHash
{
  return self->_originalHash;
}

- (void)setOriginalHash:(id)a3
{
  objc_storeStrong((id *)&self->_originalHash, a3);
}

- (PLManagedAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (void)setAssetUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (signed)assetKind
{
  return self->_assetKind;
}

- (void)setAssetKind:(signed __int16)a3
{
  self->_assetKind = a3;
}

- (NSString)originalUTI
{
  return self->_originalUTI;
}

- (void)setOriginalUTI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)assetOrientation
{
  return self->_assetOrientation;
}

- (void)setAssetOrientation:(int64_t)a3
{
  self->_assetOrientation = a3;
}

- (CGSize)assetOrientedImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_assetOrientedImageSize.width;
  height = self->_assetOrientedImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAssetOrientedImageSize:(CGSize)a3
{
  self->_assetOrientedImageSize = a3;
}

- (CGSize)embeddedThumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_embeddedThumbnailSize.width;
  height = self->_embeddedThumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEmbeddedThumbnailSize:(CGSize)a3
{
  self->_embeddedThumbnailSize = a3;
}

- (int64_t)maxPixelSize
{
  return self->_maxPixelSize;
}

- (void)setMaxPixelSize:(int64_t)a3
{
  self->_maxPixelSize = a3;
}

- (NSString)assetExtension
{
  return self->_assetExtension;
}

- (void)setAssetExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (NSString)fullsizeRenderImagePath
{
  return self->_fullsizeRenderImagePath;
}

- (void)setFullsizeRenderImagePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)pathForOriginalFile
{
  return self->_pathForOriginalFile;
}

- (void)setPathForOriginalFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)pathForVideoPreviewFile
{
  return self->_pathForVideoPreviewFile;
}

- (void)setPathForVideoPreviewFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)fullsizeRenderVideoPath
{
  return self->_fullsizeRenderVideoPath;
}

- (void)setFullsizeRenderVideoPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)auxiliaryImageRecords
{
  return self->_auxiliaryImageRecords;
}

- (void)setAuxiliaryImageRecords:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryImageRecords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageRecords, 0);
  objc_storeStrong((id *)&self->_fullsizeRenderVideoPath, 0);
  objc_storeStrong((id *)&self->_pathForVideoPreviewFile, 0);
  objc_storeStrong((id *)&self->_pathForOriginalFile, 0);
  objc_storeStrong((id *)&self->_fullsizeRenderImagePath, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_assetExtension, 0);
  objc_storeStrong((id *)&self->_originalUTI, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_originalHash, 0);
  objc_storeStrong((id *)&self->_fileURLForThumbnailFile, 0);
  objc_storeStrong((id *)&self->_thumbnailIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailManager, 0);
}

@end
