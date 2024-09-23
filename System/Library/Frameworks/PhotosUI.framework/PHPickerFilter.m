@implementation PHPickerFilter

- (PHPickerFilter)init
{
  PHPickerFilter *v2;
  SEL v3;
  id v4;

  v2 = (PHPickerFilter *)_PFAssertFailHandler();
  return (PHPickerFilter *)-[PHPickerFilter isEqual:](v2, v3, v4);
}

- (BOOL)isEqual:(id)a3
{
  PHPickerFilter *v4;
  PHPickerFilter *v5;
  objc_class *v6;
  char v7;
  objc_class *v9;
  objc_class *v10;
  PHPickerFilter *v11;
  SEL v12;

  v4 = (PHPickerFilter *)a3;
  if (self == v4)
  {
    v7 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_8;
  }
  v5 = v4;
  v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PUPickerFilter isEqual:](self->__puPickerFilter, "isEqual:", v5->__puPickerFilter);

LABEL_8:
      return v7;
    }
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  v11 = (PHPickerFilter *)_PFAssertFailHandler();
  return -[PHPickerFilter hash](v11, v12);
}

- (unint64_t)hash
{
  return -[PUPickerFilter hash](self->__puPickerFilter, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  PHPickerFilter *v5;
  void *v6;
  id v7;

  v5 = [PHPickerFilter alloc];
  v6 = (void *)-[PUPickerFilter copyWithZone:](self->__puPickerFilter, "copyWithZone:", a3);
  v7 = -[PHPickerFilter _initWithPUPickerFilter:](v5, "_initWithPUPickerFilter:", v6);

  return v7;
}

- (id)_initWithPUPickerFilter:(id)a3
{
  id v5;
  void *v6;
  PHPickerFilter *v7;
  PHPickerFilter *v8;
  PHPickerFilter *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)PHPickerFilter;
    v7 = -[PHPickerFilter init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->__puPickerFilter, a3);

    return v8;
  }
  else
  {
    v10 = (PHPickerFilter *)_PFAssertFailHandler();
    return -[PHPickerFilter _puPickerFilter](v10, v11);
  }
}

- (PUPickerFilter)_puPickerFilter
{
  return self->__puPickerFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__puPickerFilter, 0);
}

+ (PHPickerFilter)imagesFilter
{
  PUPickerAssetPlaybackStyleFilter *v2;
  PUPickerAssetPlaybackStyleFilter *v3;
  PUPickerAssetPlaybackStyleFilter *v4;
  void *v5;
  PUPickerCompoundFilter *v6;
  id v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = -[PUPickerAssetPlaybackStyleFilter initWithPlaybackStyle:]([PUPickerAssetPlaybackStyleFilter alloc], "initWithPlaybackStyle:", 1);
  v3 = -[PUPickerAssetPlaybackStyleFilter initWithPlaybackStyle:]([PUPickerAssetPlaybackStyleFilter alloc], "initWithPlaybackStyle:", 2, v2);
  v9[1] = v3;
  v4 = -[PUPickerAssetPlaybackStyleFilter initWithPlaybackStyle:]([PUPickerAssetPlaybackStyleFilter alloc], "initWithPlaybackStyle:", 3);
  v9[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PUPickerCompoundFilter initWithFilterType:subfilters:]([PUPickerCompoundFilter alloc], "initWithFilterType:subfilters:", 0, v5);
  v7 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v6);

  return (PHPickerFilter *)v7;
}

+ (PHPickerFilter)videosFilter
{
  PUPickerAssetPlaybackStyleFilter *v2;
  PUPickerAssetPlaybackStyleFilter *v3;
  void *v4;
  PUPickerCompoundFilter *v5;
  id v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = -[PUPickerAssetPlaybackStyleFilter initWithPlaybackStyle:]([PUPickerAssetPlaybackStyleFilter alloc], "initWithPlaybackStyle:", 4);
  v8[0] = v2;
  v3 = -[PUPickerAssetPlaybackStyleFilter initWithPlaybackStyle:]([PUPickerAssetPlaybackStyleFilter alloc], "initWithPlaybackStyle:", 5);
  v8[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PUPickerCompoundFilter initWithFilterType:subfilters:]([PUPickerCompoundFilter alloc], "initWithFilterType:subfilters:", 0, v4);
  v6 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v5);

  return (PHPickerFilter *)v6;
}

+ (PHPickerFilter)livePhotosFilter
{
  PUPickerAssetPlaybackStyleFilter *v2;
  id v3;

  v2 = -[PUPickerAssetPlaybackStyleFilter initWithPlaybackStyle:]([PUPickerAssetPlaybackStyleFilter alloc], "initWithPlaybackStyle:", 3);
  v3 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v2);

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)depthEffectPhotosFilter
{
  PUPickerAssetMediaSubtypeFilter *v2;
  id v3;

  v2 = -[PUPickerAssetMediaSubtypeFilter initWithFilterType:]([PUPickerAssetMediaSubtypeFilter alloc], "initWithFilterType:", 2);
  v3 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v2);

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)burstsFilter
{
  PUPickerAssetMediaSubtypeFilter *v2;
  id v3;

  v2 = -[PUPickerAssetMediaSubtypeFilter initWithFilterType:]([PUPickerAssetMediaSubtypeFilter alloc], "initWithFilterType:", 3);
  v3 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v2);

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)panoramasFilter
{
  PUPickerAssetMediaSubtypeFilter *v2;
  id v3;

  v2 = -[PUPickerAssetMediaSubtypeFilter initWithFilterType:]([PUPickerAssetMediaSubtypeFilter alloc], "initWithFilterType:", 0);
  v3 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v2);

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)screenshotsFilter
{
  PUPickerAssetMediaSubtypeFilter *v2;
  id v3;

  v2 = -[PUPickerAssetMediaSubtypeFilter initWithFilterType:]([PUPickerAssetMediaSubtypeFilter alloc], "initWithFilterType:", 1);
  v3 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v2);

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)screenRecordingsFilter
{
  PUPickerAssetMediaSubtypeFilter *v2;
  id v3;

  v2 = -[PUPickerAssetMediaSubtypeFilter initWithFilterType:]([PUPickerAssetMediaSubtypeFilter alloc], "initWithFilterType:", 8);
  v3 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v2);

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)slomoVideosFilter
{
  PUPickerAssetMediaSubtypeFilter *v2;
  id v3;

  v2 = -[PUPickerAssetMediaSubtypeFilter initWithFilterType:]([PUPickerAssetMediaSubtypeFilter alloc], "initWithFilterType:", 6);
  v3 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v2);

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)timelapseVideosFilter
{
  PUPickerAssetMediaSubtypeFilter *v2;
  id v3;

  v2 = -[PUPickerAssetMediaSubtypeFilter initWithFilterType:]([PUPickerAssetMediaSubtypeFilter alloc], "initWithFilterType:", 7);
  v3 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v2);

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)cinematicVideosFilter
{
  PUPickerAssetMediaSubtypeFilter *v2;
  id v3;

  v2 = -[PUPickerAssetMediaSubtypeFilter initWithFilterType:]([PUPickerAssetMediaSubtypeFilter alloc], "initWithFilterType:", 9);
  v3 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v2);

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)spatialMediaFilter
{
  PUPickerAssetMediaSubtypeFilter *v2;
  id v3;

  v2 = -[PUPickerAssetMediaSubtypeFilter initWithFilterType:]([PUPickerAssetMediaSubtypeFilter alloc], "initWithFilterType:", 10);
  v3 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v2);

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)playbackStyleFilter:(PHAssetPlaybackStyle)playbackStyle
{
  PUPickerAssetPlaybackStyleFilter *v3;
  id v4;
  void *v6;
  SEL v7;
  NSArray *v8;

  if (playbackStyle <= 0)
  {
    _PFAssertFailHandler();
  }
  else if ((unint64_t)playbackStyle < 6)
  {
    v3 = -[PUPickerAssetPlaybackStyleFilter initWithPlaybackStyle:]([PUPickerAssetPlaybackStyleFilter alloc], "initWithPlaybackStyle:", playbackStyle);
    v4 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v3);

    return (PHPickerFilter *)v4;
  }
  v6 = (void *)_PFAssertFailHandler();
  return +[PHPickerFilter anyFilterMatchingSubfilters:](v6, v7, v8);
}

+ (PHPickerFilter)anyFilterMatchingSubfilters:(NSArray *)subfilters
{
  NSArray *v3;
  NSArray *v4;
  void *v5;
  PUPickerCompoundFilter *v6;
  id v7;
  void *v9;
  SEL v10;
  NSArray *v11;

  v3 = subfilters;
  if (v3)
  {
    v4 = v3;
    if (-[NSArray count](v3, "count"))
    {
      PFMap();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PUPickerCompoundFilter initWithFilterType:subfilters:]([PUPickerCompoundFilter alloc], "initWithFilterType:subfilters:", 0, v5);
      v7 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v6);

      return (PHPickerFilter *)v7;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  v9 = (void *)_PFAssertFailHandler();
  return +[PHPickerFilter allFilterMatchingSubfilters:](v9, v10, v11);
}

+ (PHPickerFilter)allFilterMatchingSubfilters:(NSArray *)subfilters
{
  NSArray *v3;
  NSArray *v4;
  void *v5;
  PUPickerCompoundFilter *v6;
  id v7;
  void *v9;
  SEL v10;
  PHPickerFilter *v11;

  v3 = subfilters;
  if (v3)
  {
    v4 = v3;
    if (-[NSArray count](v3, "count"))
    {
      PFMap();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PUPickerCompoundFilter initWithFilterType:subfilters:]([PUPickerCompoundFilter alloc], "initWithFilterType:subfilters:", 1, v5);
      v7 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v6);

      return (PHPickerFilter *)v7;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  v9 = (void *)_PFAssertFailHandler();
  return +[PHPickerFilter notFilterOfSubfilter:](v9, v10, v11);
}

+ (PHPickerFilter)notFilterOfSubfilter:(PHPickerFilter *)subfilter
{
  PHPickerFilter *v3;
  PHPickerFilter *v4;
  PUPickerCompoundFilter *v5;
  void *v6;
  void *v7;
  PUPickerCompoundFilter *v8;
  id v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = subfilter;
  if (!v3)
    _PFAssertFailHandler();
  v4 = v3;
  v5 = [PUPickerCompoundFilter alloc];
  -[PHPickerFilter _puPickerFilter](v4, "_puPickerFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUPickerCompoundFilter initWithFilterType:subfilters:](v5, "initWithFilterType:subfilters:", 2, v7);

  v9 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v8);
  return (PHPickerFilter *)v9;
}

+ (PHPickerFilter)_stickersFilter
{
  PUPickerOtherFilter *v2;
  id v3;

  v2 = -[PUPickerOtherFilter initWithFilterType:]([PUPickerOtherFilter alloc], "initWithFilterType:", 0);
  v3 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v2);

  return (PHPickerFilter *)v3;
}

+ (PHPickerFilter)_styleabilityFilter
{
  PUPickerAssetMediaSubtypeFilter *v2;
  id v3;

  v2 = -[PUPickerAssetMediaSubtypeFilter initWithFilterType:]([PUPickerAssetMediaSubtypeFilter alloc], "initWithFilterType:", 4);
  v3 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v2);

  return (PHPickerFilter *)v3;
}

+ (id)_itemIdentifiersFilter:(id)a3
{
  id v3;
  PUPickerItemIdentifiersFilter *v4;
  id v5;

  v3 = a3;
  v4 = -[PUPickerItemIdentifiersFilter initWithItemIdentifiers:]([PUPickerItemIdentifiersFilter alloc], "initWithItemIdentifiers:", v3);

  v5 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v4);
  return v5;
}

uint64_t __46__PHPickerFilter_allFilterMatchingSubfilters___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_puPickerFilter");
}

uint64_t __46__PHPickerFilter_anyFilterMatchingSubfilters___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_puPickerFilter");
}

@end
