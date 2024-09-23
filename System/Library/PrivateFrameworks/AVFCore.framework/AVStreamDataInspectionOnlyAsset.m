@implementation AVStreamDataInspectionOnlyAsset

- (AVStreamDataInspectionOnlyAsset)initWithFigAsset:(OpaqueFigAsset *)a3
{
  AVFigAssetInspectorLoader *v4;
  uint64_t v5;
  objc_super v7;

  v4 = -[AVFigAssetInspectorLoader initWithFigAsset:forAsset:]([AVFigAssetInspectorLoader alloc], "initWithFigAsset:forAsset:", a3, 0);
  if (v4 && (v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v4, 0x1E3039198, 0)) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)AVStreamDataInspectionOnlyAsset;
    return -[AVURLAsset initWithURL:options:](&v7, sel_initWithURL_options_, 0, v5);
  }
  else
  {

    return 0;
  }
}

- (BOOL)isPlayable
{
  return 0;
}

- (BOOL)isExportable
{
  return 0;
}

- (BOOL)isReadable
{
  return 0;
}

- (BOOL)isComposable
{
  return 0;
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  return 0;
}

- (BOOL)isCompatibleWithAirPlayVideo
{
  return 0;
}

- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3
{
  return 0;
}

@end
