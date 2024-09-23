@implementation PHAssetCreationOptions

- (PHAssetCreationOptions)init
{
  PHAssetCreationOptions *result;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHAssetCreationOptions;
  result = -[PHAssetCreationOptions init](&v4, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&result->_stillSourceTime.value = *MEMORY[0x1E0CA2E18];
    result->_stillSourceTime.epoch = *(_QWORD *)(v3 + 16);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setShouldDownloadOrCloudReReferenceMissingResources:", -[PHAssetCreationOptions shouldDownloadOrCloudReReferenceMissingResources](self, "shouldDownloadOrCloudReReferenceMissingResources"));
  -[PHAssetCreationOptions adjustmentBakeInOptions](self, "adjustmentBakeInOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustmentBakeInOptions:", v5);

  -[PHAssetCreationOptions metadataCopyOptions](self, "metadataCopyOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadataCopyOptions:", v6);

  -[PHAssetCreationOptions stillSourceTime](self, "stillSourceTime");
  v8 = v10;
  v9 = v11;
  objc_msgSend(v4, "setStillSourceTime:", &v8);
  objc_msgSend(v4, "setResetUserSpecificMetadata:", -[PHAssetCreationOptions resetUserSpecificMetadata](self, "resetUserSpecificMetadata"));
  objc_msgSend(v4, "setCopyStillPhotoFromLivePhoto:", -[PHAssetCreationOptions copyStillPhotoFromLivePhoto](self, "copyStillPhotoFromLivePhoto"));
  objc_msgSend(v4, "setCopyOriginal:", -[PHAssetCreationOptions copyOriginal](self, "copyOriginal"));
  objc_msgSend(v4, "setCopySinglePhotoFromBurst:", -[PHAssetCreationOptions copySinglePhotoFromBurst](self, "copySinglePhotoFromBurst"));
  objc_msgSend(v4, "setCopyAsAlternateAsset:", -[PHAssetCreationOptions copyAsAlternateAsset](self, "copyAsAlternateAsset"));
  objc_msgSend(v4, "setUseRecoverableStagingDirectory:", -[PHAssetCreationOptions useRecoverableStagingDirectory](self, "useRecoverableStagingDirectory"));
  objc_msgSend(v4, "setShouldCreateScreenshot:", -[PHAssetCreationOptions shouldCreateScreenshot](self, "shouldCreateScreenshot"));
  objc_msgSend(v4, "setShouldUseAutomaticallyGeneratedOriginalFilename:", -[PHAssetCreationOptions shouldUseAutomaticallyGeneratedOriginalFilename](self, "shouldUseAutomaticallyGeneratedOriginalFilename"));
  return v4;
}

- (BOOL)shouldDownloadOrCloudReReferenceMissingResources
{
  return self->_shouldDownloadOrCloudReReferenceMissingResources;
}

- (void)setShouldDownloadOrCloudReReferenceMissingResources:(BOOL)a3
{
  self->_shouldDownloadOrCloudReReferenceMissingResources = a3;
}

- (PHAssetCreationAdjustmentBakeInOptions)adjustmentBakeInOptions
{
  return self->_adjustmentBakeInOptions;
}

- (void)setAdjustmentBakeInOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PHAssetCreationMetadataCopyOptions)metadataCopyOptions
{
  return self->_metadataCopyOptions;
}

- (void)setMetadataCopyOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillSourceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setStillSourceTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_stillSourceTime.epoch = a3->var3;
  *(_OWORD *)&self->_stillSourceTime.value = v3;
}

- (BOOL)resetUserSpecificMetadata
{
  return self->_resetUserSpecificMetadata;
}

- (void)setResetUserSpecificMetadata:(BOOL)a3
{
  self->_resetUserSpecificMetadata = a3;
}

- (BOOL)copyStillPhotoFromLivePhoto
{
  return self->_copyStillPhotoFromLivePhoto;
}

- (void)setCopyStillPhotoFromLivePhoto:(BOOL)a3
{
  self->_copyStillPhotoFromLivePhoto = a3;
}

- (BOOL)copyOriginal
{
  return self->_copyOriginal;
}

- (void)setCopyOriginal:(BOOL)a3
{
  self->_copyOriginal = a3;
}

- (BOOL)copySinglePhotoFromBurst
{
  return self->_copySinglePhotoFromBurst;
}

- (void)setCopySinglePhotoFromBurst:(BOOL)a3
{
  self->_copySinglePhotoFromBurst = a3;
}

- (BOOL)copyAsAlternateAsset
{
  return self->_copyAsAlternateAsset;
}

- (void)setCopyAsAlternateAsset:(BOOL)a3
{
  self->_copyAsAlternateAsset = a3;
}

- (BOOL)useRecoverableStagingDirectory
{
  return self->_useRecoverableStagingDirectory;
}

- (void)setUseRecoverableStagingDirectory:(BOOL)a3
{
  self->_useRecoverableStagingDirectory = a3;
}

- (BOOL)shouldCreateScreenshot
{
  return self->_shouldCreateScreenshot;
}

- (void)setShouldCreateScreenshot:(BOOL)a3
{
  self->_shouldCreateScreenshot = a3;
}

- (BOOL)shouldUseAutomaticallyGeneratedOriginalFilename
{
  return self->_shouldUseAutomaticallyGeneratedOriginalFilename;
}

- (void)setShouldUseAutomaticallyGeneratedOriginalFilename:(BOOL)a3
{
  self->_shouldUseAutomaticallyGeneratedOriginalFilename = a3;
}

- (BOOL)crashBeforeCreation
{
  return self->_crashBeforeCreation;
}

- (void)setCrashBeforeCreation:(BOOL)a3
{
  self->_crashBeforeCreation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataCopyOptions, 0);
  objc_storeStrong((id *)&self->_adjustmentBakeInOptions, 0);
}

@end
