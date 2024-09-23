@implementation AVAssetSynchronousInspectorLoader

- (AVAssetSynchronousInspectorLoader)initWithAssetInspector:(id)a3
{
  AVAssetSynchronousInspectorLoader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAssetSynchronousInspectorLoader;
  v4 = -[AVAssetInspectorLoader init](&v6, sel_init);
  if (v4)
    v4->_assetInspector = (AVAssetInspector *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetSynchronousInspectorLoader;
  -[AVAssetInspectorLoader dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[AVAssetInspector isEqual:](self->_assetInspector, "isEqual:", objc_msgSend(a3, "assetInspector"));
  else
    return 0;
}

- (unint64_t)hash
{
  return -[AVAssetInspector hash](self->_assetInspector, "hash");
}

- (id)assetInspector
{
  return self->_assetInspector;
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  return 2;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 keysForCollectionKeys:(id)a4 completionHandler:(id)a5
{
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_assetInspector;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE duration](result, "duration");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (id)lyrics
{
  return -[AVAssetInspector lyrics](self->_assetInspector, "lyrics");
}

- (BOOL)isPlayable
{
  return -[AVAssetInspector isPlayable](self->_assetInspector, "isPlayable");
}

- (BOOL)isExportable
{
  return -[AVAssetInspector isExportable](self->_assetInspector, "isExportable");
}

- (BOOL)isReadable
{
  return -[AVAssetInspector isReadable](self->_assetInspector, "isReadable");
}

- (BOOL)isComposable
{
  return -[AVAssetInspector isComposable](self->_assetInspector, "isComposable");
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  return -[AVAssetInspector isCompatibleWithSavedPhotosAlbum](self->_assetInspector, "isCompatibleWithSavedPhotosAlbum");
}

@end
