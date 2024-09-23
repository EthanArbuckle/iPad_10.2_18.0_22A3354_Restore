@implementation AVAssetProxy

+ (id)makePropertyListForMovieProxyHeader:(id)a3 name:(id)a4 prefersNominalDurations:(BOOL)a5
{
  id v5;
  _BOOL4 v6;
  void *v8;

  v5 = a3;
  if (a3)
  {
    v6 = a5;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a3, CFSTR("moop"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 1), CFSTR("mpvr"), 0);
    v5 = v8;
    if (v6)
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("prefers-nominal-durations"));
    if (a4)
      objc_msgSend(v5, "setObject:forKey:", a4, CFSTR("name"));
  }
  return v5;
}

+ (id)assetProxyWithPropertyList:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPropertyList:", a3);
}

- (AVAssetProxy)initWithPropertyList:(id)a3
{
  AVAssetProxy *v4;
  AVAssetProxyInternal *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAssetProxy;
  v4 = -[AVAsset init](&v9, sel_init);
  if (v4)
  {
    if (!objc_msgSend(a3, "objectForKey:", CFSTR("moop")))
      goto LABEL_13;
    v5 = objc_alloc_init(AVAssetProxyInternal);
    v4->_assetProxy = v5;
    if (!v5)
      goto LABEL_13;
    CFRetain(v5);
    v4->_assetProxy->makeTracksArrayOnce = objc_alloc_init(AVDispatchOnce);
    v6 = objc_msgSend(a3, "objectForKey:", CFSTR("name"));
    if (v6)
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v6, *MEMORY[0x1E0CC37D0]);
    figAssetCreationFlagsForAssetReferenceRestrictions(2);
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("mpvr")), "shortValue"))
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("prefers-nominal-durations")), "BOOLValue");
    v7 = FigAssetRemoteCreateWithMovieProxyData();
    if (!(_DWORD)v7)
      v4->_assetProxy->loader = (AVAssetInspectorLoader *)-[AVFigAssetInspectorLoader initWithFigAsset:forAsset:]([AVFigAssetInspectorLoader alloc], "initWithFigAsset:forAsset:", 0, v4);
    if (!v4->_assetProxy->loader)
      v4->_assetProxy->loader = (AVAssetInspectorLoader *)-[AVUnreachableAssetInspectorLoader initWithFigError:userInfo:]([AVUnreachableAssetInspectorLoader alloc], "initWithFigError:userInfo:", v7, 0);
    if (!v4->_assetProxy->loader)
    {
LABEL_13:

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  AVAssetProxyInternal *assetProxy;
  objc_super v4;

  assetProxy = self->_assetProxy;
  if (assetProxy)
  {

    CFRelease(self->_assetProxy);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetProxy;
  -[AVAsset dealloc](&v4, sel_dealloc);
}

- (BOOL)isProxy
{
  return 1;
}

- (OpaqueFigAsset)_figAsset
{
  return -[AVAssetInspectorLoader _figAsset](self->_assetProxy->loader, "_figAsset");
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  return -[AVAssetInspectorLoader _copyFormatReader](self->_assetProxy->loader, "_copyFormatReader");
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return 0;
}

- (id)_assetInspectorLoader
{
  return self->_assetProxy->loader;
}

- (id)_assetInspector
{
  return -[AVAssetInspectorLoader assetInspector](self->_assetProxy->loader, "assetInspector");
}

- (Class)_classForTrackInspectors
{
  return -[AVAssetInspectorLoader _classForTrackInspectors](self->_assetProxy->loader, "_classForTrackInspectors");
}

- (id)tracks
{
  AVDispatchOnce *makeTracksArrayOnce;
  _QWORD v5[5];

  makeTracksArrayOnce = self->_assetProxy->makeTracksArrayOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__AVAssetProxy_tracks__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](makeTracksArrayOnce, "runBlockOnce:", v5);
  return self->_assetProxy->tracks;
}

uint64_t __22__AVAssetProxy_tracks__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  uint64_t result;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_assetInspector"), "trackCount");
  if (v3 >= 1)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      v6 = -[AVAssetTrack _initWithAsset:trackIndex:]([AVAssetTrack alloc], "_initWithAsset:trackIndex:", *(_QWORD *)(a1 + 32), i);
      if (v6)
        objc_msgSend(v2, "addObject:", v6);
    }
  }
  result = objc_msgSend(v2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16) = result;
  return result;
}

@end
