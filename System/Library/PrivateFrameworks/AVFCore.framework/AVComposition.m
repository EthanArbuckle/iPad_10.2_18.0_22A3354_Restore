@implementation AVComposition

+ (void)initialize
{
  objc_opt_class();
}

- (int)_createEmptyMutableCompositionIfNeeded
{
  if (self->_priv->mutableComposition)
    return 0;
  else
    return FigMutableCompositionCreateRemote();
}

- (id)_initWithComposition:(id)a3
{
  AVComposition *v4;
  AVCompositionInternal *v5;
  uint64_t v6;
  AVCompositionInternal *priv;
  uint64_t (*v8)(_QWORD, uint64_t, OpaqueFigMutableComposition **);
  int v9;
  CGSize *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVComposition;
  v4 = -[AVAsset init](&v12, sel_init);
  if (!v4)
    return v4;
  v5 = objc_alloc_init(AVCompositionInternal);
  v4->_priv = v5;
  if (!v5)
    goto LABEL_12;
  CFRetain(v5);
  v4->_priv->mutableComposition = 0;
  v4->_priv->formatReaderInitializationOnce = objc_alloc_init(AVDispatchOnce);
  v4->_priv->assetInspectorInitializationOnce = objc_alloc_init(AVDispatchOnce);
  v4->_priv->tracksInitializationOnce = objc_alloc_init(AVDispatchOnce);
  v4->_priv->figAssetInitializationOnce = objc_alloc_init(AVDispatchOnce);
  v4->_priv->assetInspector = 0;
  v4->_priv->formatReader = 0;
  v4->_priv->figAsset = 0;
  v4->_priv->naturalSize = (CGSize)*MEMORY[0x1E0C9D820];
  if (objc_msgSend(a3, "_mutableComposition"))
  {
    v6 = objc_msgSend(a3, "_mutableComposition");
    priv = v4->_priv;
    v8 = *(uint64_t (**)(_QWORD, uint64_t, OpaqueFigMutableComposition **))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 8);
    if (v8)
    {
      v9 = v8(*MEMORY[0x1E0C9AE00], v6, &priv->mutableComposition);
      if (!a3)
        goto LABEL_11;
      goto LABEL_8;
    }
LABEL_12:

    return 0;
  }
  v9 = -[AVComposition _createEmptyMutableCompositionIfNeeded](v4, "_createEmptyMutableCompositionIfNeeded");
  if (!a3)
    goto LABEL_11;
LABEL_8:
  if (!v9)
  {
    v10 = (CGSize *)*((_QWORD *)a3 + 2);
    if (v10)
    {
      v4->_priv->naturalSize = v10[4];
      v4->_priv->URLAssetInitializationOptions = (NSDictionary *)objc_msgSend(*(id *)(*((_QWORD *)a3 + 2) + 80), "copy");
    }
    return v4;
  }
LABEL_11:
  if (v9)
    goto LABEL_12;
  return v4;
}

- (AVComposition)init
{
  return (AVComposition *)-[AVComposition _initWithComposition:](self, "_initWithComposition:", 0);
}

- (void)dealloc
{
  AVCompositionInternal *priv;
  AVCompositionInternal *v4;
  OpaqueFigFormatReader *formatReader;
  OpaqueFigAsset *figAsset;
  OpaqueFigMutableComposition *mutableComposition;
  AVCompositionInternal *v8;
  objc_super v9;

  priv = self->_priv;
  if (priv)
  {

    v4 = self->_priv;
    formatReader = v4->formatReader;
    if (formatReader)
    {
      CFRelease(formatReader);
      self->_priv->formatReader = 0;
      v4 = self->_priv;
    }
    figAsset = v4->figAsset;
    if (figAsset)
    {
      CFRelease(figAsset);
      self->_priv->figAsset = 0;
      v4 = self->_priv;
    }
    mutableComposition = v4->mutableComposition;
    if (mutableComposition)
    {
      CFRelease(mutableComposition);
      self->_priv->mutableComposition = 0;
      v4 = self->_priv;
    }

    v8 = self->_priv;
    if (v8)
    {
      CFRelease(v8);
      self->_priv = 0;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)AVComposition;
  -[AVAsset dealloc](&v9, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p tracks = %@>"), NSStringFromClass(v4), self, -[AVComposition tracks](self, "tracks"));
}

- (OpaqueFigMutableComposition)_mutableComposition
{
  return self->_priv->mutableComposition;
}

- (void)_loadAssetInspectorAndLoaderOnce
{
  AVDispatchOnce *assetInspectorInitializationOnce;
  _QWORD v3[5];

  assetInspectorInitializationOnce = self->_priv->assetInspectorInitializationOnce;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__AVComposition__loadAssetInspectorAndLoaderOnce__block_invoke;
  v3[3] = &unk_1E302FA10;
  v3[4] = self;
  -[AVDispatchOnce runBlockOnce:](assetInspectorInitializationOnce, "runBlockOnce:", v3);
}

void __49__AVComposition__loadAssetInspectorAndLoaderOnce__block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_copyFormatReader");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 56) = -[AVFormatReaderInspector initWithFormatReader:]([AVCompositionFormatReaderInspector alloc], "initWithFormatReader:", v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 48) = -[AVAssetSynchronousInspectorLoader initWithAssetInspector:]([AVAssetSynchronousInspectorLoader alloc], "initWithAssetInspector:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)+ 56));
  if (v2)
    CFRelease(v2);
}

- (id)_assetInspectorLoader
{
  -[AVComposition _loadAssetInspectorAndLoaderOnce](self, "_loadAssetInspectorAndLoaderOnce");
  return self->_priv->assetInspectorLoader;
}

- (id)_assetInspector
{
  -[AVComposition _loadAssetInspectorAndLoaderOnce](self, "_loadAssetInspectorAndLoaderOnce");
  return self->_priv->assetInspector;
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  AVDispatchOnce *formatReaderInitializationOnce;
  OpaqueFigFormatReader *result;
  _QWORD v5[5];

  if (-[AVComposition _mutableComposition](self, "_mutableComposition"))
  {
    formatReaderInitializationOnce = self->_priv->formatReaderInitializationOnce;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34__AVComposition__copyFormatReader__block_invoke;
    v5[3] = &unk_1E302FA10;
    v5[4] = self;
    -[AVDispatchOnce runBlockOnce:](formatReaderInitializationOnce, "runBlockOnce:", v5);
  }
  result = self->_priv->formatReader;
  if (result)
    return (OpaqueFigFormatReader *)CFRetain(result);
  return result;
}

uint64_t __34__AVComposition__copyFormatReader__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD, uint64_t);

  v2 = objc_msgSend(*(id *)(a1 + 32), "_mutableComposition");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(result + 16) + 16);
  if (v5)
    return v5(v2, 0, 0, v3 + 40);
  return result;
}

- (OpaqueFigAsset)_figAsset
{
  AVDispatchOnce *figAssetInitializationOnce;
  _QWORD v5[5];

  if (-[AVComposition _mutableComposition](self, "_mutableComposition"))
  {
    figAssetInitializationOnce = self->_priv->figAssetInitializationOnce;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __26__AVComposition__figAsset__block_invoke;
    v5[3] = &unk_1E302FA10;
    v5[4] = self;
    -[AVDispatchOnce runBlockOnce:](figAssetInitializationOnce, "runBlockOnce:", v5);
  }
  return self->_priv->figAsset;
}

uint64_t __26__AVComposition__figAsset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD, uint64_t);

  v2 = objc_msgSend(*(id *)(a1 + 32), "_mutableComposition");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(result + 16) + 208);
  if (v5)
    return v5(v2, 0, 0, v3 + 104);
  return result;
}

- (Class)_classForTrackInspectors
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[AVMutableComposition _initWithComposition:](+[AVMutableComposition allocWithZone:](AVMutableComposition, "allocWithZone:", a3), "_initWithComposition:", self);
}

- (id)_newTrackForIndex:(int64_t)a3
{
  return -[AVAssetTrack _initWithAsset:trackIndex:]([AVCompositionTrack alloc], "_initWithAsset:trackIndex:", self, a3);
}

- (id)_mutableTracks
{
  AVDispatchOnce *tracksInitializationOnce;
  _QWORD v5[5];

  tracksInitializationOnce = self->_priv->tracksInitializationOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__AVComposition__mutableTracks__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](tracksInitializationOnce, "runBlockOnce:", v5);
  return self->_priv->tracks;
}

void __31__AVComposition__mutableTracks__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const void *v4;
  unsigned int (*v5)(const void *, uint64_t *);
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 88) = v2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_copyFormatReader");
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = *(unsigned int (**)(const void *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v5)
    {
      if (v5(v4, &v8))
        v6 = 1;
      else
        v6 = v8 < 1;
      if (!v6)
      {
        v7 = 0;
        do
          objc_msgSend(v2, "addObject:", (id)objc_msgSend(*(id *)(a1 + 32), "_newTrackForIndex:", v7++));
        while (v7 < v8);
      }
    }
    CFRelease(v4);
  }
}

- (NSArray)tracks
{
  return (NSArray *)(id)objc_msgSend(-[AVComposition _mutableTracks](self, "_mutableTracks"), "copy");
}

- (AVCompositionTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVComposition;
  return (AVCompositionTrack *)-[AVAsset trackWithTrackID:](&v4, sel_trackWithTrackID_, *(_QWORD *)&trackID);
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVComposition;
  return -[AVAsset tracksWithMediaType:](&v4, sel_tracksWithMediaType_, mediaType);
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVComposition;
  return -[AVAsset tracksWithMediaCharacteristic:](&v4, sel_tracksWithMediaCharacteristic_, mediaCharacteristic);
}

- (BOOL)_clientProvidesNaturalSize
{
  AVCompositionInternal *priv;
  double height;
  BOOL v4;

  priv = self->_priv;
  height = priv->naturalSize.height;
  v4 = priv->naturalSize.width != *MEMORY[0x1E0C9D820];
  return height != *(double *)(MEMORY[0x1E0C9D820] + 8) || v4;
}

- (CGSize)naturalSize
{
  AVCompositionInternal *priv;
  double width;
  double height;
  NSArray *v6;
  CGSize result;

  if (-[AVComposition _clientProvidesNaturalSize](self, "_clientProvidesNaturalSize"))
  {
    priv = self->_priv;
    width = priv->naturalSize.width;
    height = priv->naturalSize.height;
  }
  else
  {
    v6 = -[AVComposition tracksWithMediaType:](self, "tracksWithMediaType:", CFSTR("vide"));
    if (-[NSArray count](v6, "count"))
    {
      objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", 0), "naturalSize");
    }
    else
    {
      width = 0.0;
      height = 0.0;
    }
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setNaturalSize:(CGSize)a3
{
  self->_priv->naturalSize = a3;
}

- (id)_mediaSelectionGroupDictionaries
{
  OpaqueFigMutableComposition *mutableComposition;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, _QWORD, OpaqueFigMutableComposition **);
  OpaqueFigMutableComposition *v6;

  v6 = 0;
  mutableComposition = self->_priv->mutableComposition;
  if (mutableComposition)
  {
    FigBaseObject = FigMutableCompositionGetFigBaseObject();
    v4 = *(void (**)(uint64_t, _QWORD, _QWORD, OpaqueFigMutableComposition **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                        + 48);
    if (v4)
    {
      v4(FigBaseObject, *MEMORY[0x1E0CC5F78], *MEMORY[0x1E0C9AE00], &v6);
      mutableComposition = v6;
    }
    else
    {
      mutableComposition = 0;
    }
  }
  return mutableComposition;
}

- (BOOL)_setURLAssetInitializationOptions:(id)a3 error:(id *)a4
{
  NSDictionary *v6;
  id v7;
  uint64_t FigBaseObject;
  void (*v9)(uint64_t, _QWORD, id);
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, _QWORD, uint64_t);
  uint64_t v14;

  v6 = (NSDictionary *)objc_msgSend(a3, "copy");

  self->_priv->URLAssetInitializationOptions = v6;
  v14 = 0;
  v7 = +[AVURLAsset _getFigAssetCreationOptionsFromURLAssetInitializationOptions:assetLoggingIdentifier:figAssetCreationFlags:error:](AVURLAsset, "_getFigAssetCreationOptionsFromURLAssetInitializationOptions:assetLoggingIdentifier:figAssetCreationFlags:error:", v6, 0, &v14, a4);
  if (v7)
  {
    -[AVComposition _mutableComposition](self, "_mutableComposition");
    FigBaseObject = FigMutableCompositionGetFigBaseObject();
    v9 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v9)
      v9(FigBaseObject, *MEMORY[0x1E0CC4828], v7);
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
    v11 = FigMutableCompositionGetFigBaseObject();
    v12 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v12)
      v12(v11, *MEMORY[0x1E0CC4820], v10);
  }
  return v7 != 0;
}

- (NSDictionary)URLAssetInitializationOptions
{
  NSDictionary *result;

  result = self->_priv->URLAssetInitializationOptions;
  if (!result)
    return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  return result;
}

- (BOOL)isDefunct
{
  OpaqueFigMutableComposition *mutableComposition;
  _QWORD *v3;
  unsigned int (*v4)(OpaqueFigMutableComposition *, unsigned __int8 *);
  BOOL v5;
  int v6;
  unsigned __int8 v8;

  v8 = 0;
  mutableComposition = self->_priv->mutableComposition;
  v3 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v3 < 5uLL)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = (unsigned int (*)(OpaqueFigMutableComposition *, unsigned __int8 *))v3[11];
    if (v4)
    {
      v5 = v4(mutableComposition, &v8) == 0;
      LODWORD(v4) = v8;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  if (v5)
    v6 = (int)v4;
  else
    v6 = 1;
  if (!(_DWORD)v4)
    LODWORD(v4) = v6;
  return (_DWORD)v4 == 1;
}

- (AVComposition)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  AVMutableCompositionTrack *v30;
  AVMutableCompositionTrack *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  const void *v49;
  BOOL v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  id v58;
  id obj;
  uint64_t v62;
  AVMutableComposition *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[6];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  CGSize size;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  obj = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0), CFSTR("tracks"));
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0), CFSTR("naturalSize"));
  v63 = +[AVMutableComposition compositionWithURLAssetInitializationOptions:](AVMutableComposition, "compositionWithURLAssetInitializationOptions:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[AVURLAsset _initializationOptionsClasses](AVURLAsset, "_initializationOptionsClasses"), CFSTR("URLAssetInitializationOptions")));
  if (v13)
  {
    size = (CGSize)*MEMORY[0x1E0C9D820];
    if (CGSizeMakeWithDictionaryRepresentation(v13, &size))
      -[AVMutableComposition setNaturalSize:](v63, "setNaturalSize:", size.width, size.height);
  }
  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0), CFSTR("compositionMetadataArray"));
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v81 != v22)
          objc_enumerationMutation(v18);
        v24 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i));
        if (v24)
          objc_msgSend(v19, "addObject:", v24);
      }
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
    }
    while (v21);
  }
  if (v19)
    -[AVMutableComposition setMetadata:](v63, "setMetadata:", v19);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
  if (v64)
  {
    v62 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v64; ++j)
      {
        if (*(_QWORD *)v77 != v62)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
        v27 = objc_msgSend(v26, "objectForKey:", CFSTR("mediaType"));
        v28 = objc_msgSend((id)objc_msgSend(v26, "objectForKey:", CFSTR("trackID")), "integerValue");
        v29 = objc_msgSend(v26, "objectForKey:", CFSTR("segments"));
        v30 = -[AVMutableComposition addMutableTrackWithMediaType:preferredTrackID:](v63, "addMutableTrackWithMediaType:preferredTrackID:", v27, v28);
        if (v30)
        {
          v31 = v30;
          -[AVMutableCompositionTrack setSegments:](v30, "setSegments:", v29);
          v32 = (void *)objc_msgSend(v26, "objectForKey:", CFSTR("naturalTimeScale"));
          if (v32)
            -[AVMutableCompositionTrack setNaturalTimeScale:](v31, "setNaturalTimeScale:", objc_msgSend(v32, "integerValue"));
          v33 = objc_msgSend(v26, "objectForKey:", CFSTR("languageCode"));
          if (v33)
            -[AVMutableCompositionTrack setLanguageCode:](v31, "setLanguageCode:", v33);
          v34 = objc_msgSend(v26, "objectForKey:", CFSTR("extendedLanguageTag"));
          if (v34)
            -[AVMutableCompositionTrack setExtendedLanguageTag:](v31, "setExtendedLanguageTag:", v34);
          if (objc_msgSend(v26, "objectForKey:", CFSTR("preferredTransform")))
          {
            CGAffineTransformFromNSArray(v75);
            -[AVMutableCompositionTrack setPreferredTransform:](v31, "setPreferredTransform:", v75);
          }
          v35 = (void *)objc_msgSend(v26, "objectForKey:", CFSTR("preferredVolume"));
          if (v35)
          {
            objc_msgSend(v35, "floatValue");
            -[AVMutableCompositionTrack setPreferredVolume:](v31, "setPreferredVolume:");
          }
          v36 = (void *)objc_msgSend(v26, "objectForKey:", CFSTR("alternateGroupID"));
          if (v36)
            -[AVMutableCompositionTrack setAlternateGroupID:](v31, "setAlternateGroupID:", (int)objc_msgSend(v36, "intValue"));
          v65 = v26;
          v66 = j;
          v37 = (void *)objc_msgSend(v26, "objectForKey:", CFSTR("formatDescriptionReplacements"));
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v72;
            do
            {
              v41 = 0;
              do
              {
                if (*(_QWORD *)v72 != v40)
                  objc_enumerationMutation(v37);
                v42 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v41);
                v43 = (void *)objc_msgSend(v42, "objectForKey:", CFSTR("originalFormatDescription"));
                v44 = objc_msgSend(v42, "objectForKey:", CFSTR("replacementFormatDescription"));
                if (v43)
                  v45 = v44 == 0;
                else
                  v45 = 1;
                if (!v45)
                {
                  v46 = (void *)v44;
                  v47 = AVFormatDescriptionFromSerializedAtomData(v43);
                  v48 = AVFormatDescriptionFromSerializedAtomData(v46);
                  v49 = v48;
                  if (v47)
                    v50 = v48 == 0;
                  else
                    v50 = 1;
                  if (v50)
                  {
                    if (!v47)
                    {
                      if (!v48)
                        goto LABEL_50;
LABEL_49:
                      CFRelease(v49);
                      goto LABEL_50;
                    }
                  }
                  else
                  {
                    -[AVMutableCompositionTrack replaceFormatDescription:withFormatDescription:](v31, "replaceFormatDescription:withFormatDescription:", v47, v48);
                  }
                  CFRelease(v47);
                  if (v49)
                    goto LABEL_49;
                }
LABEL_50:
                ++v41;
              }
              while (v39 != v41);
              v51 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
              v39 = v51;
            }
            while (v51);
          }
          v52 = (void *)objc_msgSend(v65, "objectForKey:", CFSTR("trackMetadataArray"));
          v53 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v52, "count"));
          v67 = 0u;
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v68;
            do
            {
              for (k = 0; k != v55; ++k)
              {
                if (*(_QWORD *)v68 != v56)
                  objc_enumerationMutation(v52);
                v58 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k));
                if (v58)
                  objc_msgSend(v53, "addObject:", v58);
              }
              v55 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
            }
            while (v55);
          }
          j = v66;
          if (v53)
            -[AVMutableCompositionTrack setMetadata:](v31, "setMetadata:", v53);
        }
      }
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
    }
    while (v64);
  }
  return (AVComposition *)-[AVComposition _initWithComposition:](self, "_initWithComposition:", v63);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  NSDictionary *v31;
  NSArray *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  NSArray *obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _QWORD v72[2];
  _QWORD v73[2];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;
  CGSize v77;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = -[AVComposition tracks](self, "tracks");
  v46 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v3, "count"));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v3;
  v47 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v47)
  {
    v45 = *(_QWORD *)v67;
    v4 = 0x1E0CB3000uLL;
    v43 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v44 = *MEMORY[0x1E0C9BAA8];
    v42 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v67 != v45)
          objc_enumerationMutation(obj);
        v50 = v5;
        v6 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v5);
        v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", objc_msgSend(v6, "mediaType"), CFSTR("mediaType"), objc_msgSend(*(id *)(v4 + 2024), "numberWithInteger:", (int)objc_msgSend(v6, "trackID")), CFSTR("trackID"), objc_msgSend(v6, "segments"), CFSTR("segments"), 0);
        v8 = objc_msgSend(v6, "naturalTimeScale");
        if (v8)
          objc_msgSend(v7, "setObject:forKey:", objc_msgSend(*(id *)(v4 + 2024), "numberWithInteger:", v8), CFSTR("naturalTimeScale"));
        v9 = objc_msgSend(v6, "languageCode");
        if (v9)
          objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("languageCode"));
        v10 = objc_msgSend(v6, "extendedLanguageTag");
        if (v10)
          objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("extendedLanguageTag"));
        memset(&v65, 0, sizeof(v65));
        if (v6)
          objc_msgSend(v6, "preferredTransform");
        t1 = v65;
        *(_OWORD *)&t2.a = v44;
        *(_OWORD *)&t2.c = v43;
        *(_OWORD *)&t2.tx = v42;
        if (!CGAffineTransformEqualToTransform(&t1, &t2))
        {
          t1 = v65;
          objc_msgSend(v7, "setObject:forKey:", NSArrayFromCGAffineTransform(), CFSTR("preferredTransform"));
        }
        objc_msgSend(v6, "preferredVolume");
        if (v11 != 1.0)
          objc_msgSend(v7, "setObject:forKey:", objc_msgSend(*(id *)(v4 + 2024), "numberWithFloat:"), CFSTR("preferredVolume"));
        v12 = objc_msgSend(v6, "alternateGroupID");
        if (v12)
          objc_msgSend(v7, "setObject:forKey:", objc_msgSend(*(id *)(v4 + 2024), "numberWithInteger:", v12), CFSTR("alternateGroupID"));
        v48 = v6;
        v49 = v7;
        v13 = (void *)objc_msgSend(v6, "formatDescriptionReplacements");
        v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v60 != v17)
                objc_enumerationMutation(v13);
              v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
              v20 = (void *)AVSerializedAtomDataFromFormatDescription((void *)objc_msgSend(v19, "originalFormatDescription"));
              v21 = AVSerializedAtomDataFromFormatDescription((void *)objc_msgSend(v19, "replacementFormatDescription"));
              v22 = (void *)v21;
              if (v20)
                v23 = v21 == 0;
              else
                v23 = 1;
              if (!v23)
              {
                v72[0] = CFSTR("originalFormatDescription");
                v72[1] = CFSTR("replacementFormatDescription");
                v73[0] = v20;
                v73[1] = v21;
                objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2));
              }

            }
            v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
          }
          while (v16);
        }
        if (objc_msgSend(v14, "count"))
          objc_msgSend(v49, "setObject:forKey:", v14, CFSTR("formatDescriptionReplacements"));
        v24 = (void *)objc_msgSend(v48, "metadata");
        v25 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v56 != v28)
                objc_enumerationMutation(v24);
              v30 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "_figMetadataDictionary");
              if (v30)
                objc_msgSend(v25, "addObject:", v30);
            }
            v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          }
          while (v27);
        }
        if (objc_msgSend(v25, "count"))
          objc_msgSend(v49, "setObject:forKey:", v25, CFSTR("trackMetadataArray"));
        objc_msgSend(v46, "addObject:", v49);
        v5 = v50 + 1;
        v4 = 0x1E0CB3000;
      }
      while (v50 + 1 != v47);
      v47 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v47);
  }
  objc_msgSend(a3, "encodeObject:forKey:", v46, CFSTR("tracks"));
  if (-[AVComposition _clientProvidesNaturalSize](self, "_clientProvidesNaturalSize"))
  {
    -[AVComposition naturalSize](self, "naturalSize");
    objc_msgSend(a3, "encodeObject:forKey:", CGSizeCreateDictionaryRepresentation(v77), CFSTR("naturalSize"));
  }
  v31 = -[AVComposition URLAssetInitializationOptions](self, "URLAssetInitializationOptions");
  if (-[NSDictionary count](v31, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", v31, CFSTR("URLAssetInitializationOptions"));
  v32 = -[AVAsset metadata](self, "metadata");
  v33 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v32, "count"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(v32);
        v38 = objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * k), "_figMetadataDictionary");
        if (v38)
          objc_msgSend(v33, "addObject:", v38);
      }
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
    }
    while (v35);
  }
  if (objc_msgSend(v33, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", v33, CFSTR("compositionMetadataArray"));
}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 0;
}

@end
