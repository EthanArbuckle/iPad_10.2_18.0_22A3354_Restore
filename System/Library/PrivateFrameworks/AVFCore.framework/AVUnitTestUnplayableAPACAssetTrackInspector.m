@implementation AVUnitTestUnplayableAPACAssetTrackInspector

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVUnitTestUnplayableAPACAssetTrackInspector;
  return -[AVFigAssetTrackInspector _initWithAsset:trackID:trackIndex:](&v6, sel__initWithAsset_trackID_trackIndex_, a3, *(_QWORD *)&a4, a5);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVUnitTestUnplayableAPACAssetTrackInspector;
  -[AVFigAssetTrackInspector dealloc](&v2, sel_dealloc);
}

- (BOOL)isPlayable
{
  const opaqueCMFormatDescription *v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVUnitTestUnplayableAPACAssetTrackInspector;
  v3 = (const opaqueCMFormatDescription *)objc_msgSend(-[AVFigAssetTrackInspector formatDescriptions](&v6, sel_formatDescriptions), "objectAtIndexedSubscript:", 0);
  if (CMFormatDescriptionGetMediaSubType(v3) == 1634754915)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)AVUnitTestUnplayableAPACAssetTrackInspector;
  return -[AVFigAssetTrackInspector isPlayable](&v5, sel_isPlayable);
}

@end
