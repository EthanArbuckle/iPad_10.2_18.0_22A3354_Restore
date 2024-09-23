@implementation AVAssetTrackEnumerator

- (id)nextObject
{
  id i;
  NSString *mediaType;

  for (i = -[NSEnumerator nextObject](self->_enumerator, "nextObject");
        i;
        i = -[NSEnumerator nextObject](self->_enumerator, "nextObject"))
  {
    mediaType = self->_mediaType;
    if ((!mediaType || -[NSString isEqualToString:](mediaType, "isEqualToString:", objc_msgSend(i, "mediaType")))
      && (!self->_mediaCharacteristics || (objc_msgSend(i, "hasMediaCharacteristics:") & 1) != 0))
    {
      break;
    }
  }
  return i;
}

- (AVAssetTrackEnumerator)initWithAsset:(id)a3 mediaCharacteristics:(id)a4
{
  AVAssetTrackEnumerator *v5;

  v5 = -[AVAssetTrackEnumerator initWithAsset:](self, "initWithAsset:", a3);
  -[AVAssetTrackEnumerator setMediaCharacteristics:](v5, "setMediaCharacteristics:", a4);
  return v5;
}

- (void)setMediaCharacteristics:(id)a3
{
  id v5;

  v5 = a3;

  self->_mediaCharacteristics = (NSArray *)a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetTrackEnumerator;
  -[AVAssetTrackEnumerator dealloc](&v3, sel_dealloc);
}

- (AVAssetTrackEnumerator)initWithAsset:(id)a3 mediaType:(id)a4
{
  AVAssetTrackEnumerator *v5;

  v5 = -[AVAssetTrackEnumerator initWithAsset:](self, "initWithAsset:", a3);
  -[AVAssetTrackEnumerator setMediaType:](v5, "setMediaType:", a4);
  return v5;
}

- (void)setMediaType:(id)a3
{
  id v5;

  v5 = a3;

  self->_mediaType = (NSString *)a3;
}

- (AVAssetTrackEnumerator)initWithAsset:(id)a3
{
  AVAssetTrackEnumerator *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)AVAssetTrackEnumerator;
    v4 = -[AVAssetTrackEnumerator init](&v6, sel_init);
    if (v4)
      v4->_enumerator = (NSEnumerator *)(id)objc_msgSend((id)objc_msgSend(a3, "tracks"), "objectEnumerator");
  }
  else
  {

    return 0;
  }
  return v4;
}

+ (id)trackEnumeratorWithAsset:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAsset:", a3);
}

@end
