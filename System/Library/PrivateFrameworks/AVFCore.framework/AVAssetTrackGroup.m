@implementation AVAssetTrackGroup

- (AVAssetTrackGroup)initWithAsset:(id)a3 trackIDs:(id)a4
{
  AVAssetTrackGroup *v6;
  AVAssetTrackGroupInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAssetTrackGroup;
  v6 = -[AVAssetTrackGroup init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVAssetTrackGroupInternal);
    v6->_assetTrackGroup = v7;
    if (v7)
    {
      CFRetain(v7);
      v6->_assetTrackGroup->assetComparisonToken = (id)objc_msgSend(a3, "_comparisonToken");
      v6->_assetTrackGroup->trackIDs = (NSArray *)objc_msgSend(a4, "copy");
      if (!v6->_assetTrackGroup->trackIDs)
        v6->_assetTrackGroup->trackIDs = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVAssetTrackGroup)init
{
  return -[AVAssetTrackGroup initWithAsset:trackIDs:](self, "initWithAsset:trackIDs:", 0, 0);
}

- (void)dealloc
{
  AVAssetTrackGroupInternal *assetTrackGroup;
  objc_super v4;

  assetTrackGroup = self->_assetTrackGroup;
  if (assetTrackGroup)
  {

    CFRelease(self->_assetTrackGroup);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetTrackGroup;
  -[AVAssetTrackGroup dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSArray *v6;
  uint64_t v7;

  if (a3 == self)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  v5 = objc_msgSend(-[AVAssetTrackGroup _assetComparisonToken](self, "_assetComparisonToken"), "isEqual:", objc_msgSend(a3, "_assetComparisonToken"));
  if (v5)
  {
    v6 = -[AVAssetTrackGroup trackIDs](self, "trackIDs");
    v7 = objc_msgSend(a3, "trackIDs");
    if (v6 != (NSArray *)v7)
    {
      LOBYTE(v5) = -[NSArray isEqual:](v6, "isEqual:", v7);
      return v5;
    }
LABEL_6:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](-[AVAssetTrackGroup trackIDs](self, "trackIDs"), "hash");
  return objc_msgSend(-[AVAssetTrackGroup _assetComparisonToken](self, "_assetComparisonToken"), "hash") ^ v3;
}

- (NSArray)trackIDs
{
  return self->_assetTrackGroup->trackIDs;
}

- (id)_assetComparisonToken
{
  return self->_assetTrackGroup->assetComparisonToken;
}

@end
