@implementation ALAssetsFilter

- (ALAssetsFilter)init
{
  ALAssetsFilter *v2;
  ALAssetsFilterInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ALAssetsFilter;
  v2 = -[ALAssetsFilter init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ALAssetsFilterInternal);
    -[ALAssetsFilter setInternal:](v2, "setInternal:", v3);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ALAssetsFilter setInternal:](self, "setInternal:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALAssetsFilter;
  -[ALAssetsFilter dealloc](&v3, sel_dealloc);
}

- (int)_filter
{
  return -[ALAssetsFilterInternal filter](-[ALAssetsFilter internal](self, "internal"), "filter");
}

- (void)_setFilter:(int)a3
{
  -[ALAssetsFilterInternal setFilter:](-[ALAssetsFilter internal](self, "internal"), "setFilter:", *(_QWORD *)&a3);
}

- (ALAssetsFilterInternal)internal
{
  return (ALAssetsFilterInternal *)self->_internal;
}

- (void)setInternal:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

+ (ALAssetsFilter)allPhotos
{
  ALAssetsFilter *v2;

  v2 = objc_alloc_init(ALAssetsFilter);
  -[ALAssetsFilter _setFilter:](v2, "_setFilter:", 1);
  return v2;
}

+ (ALAssetsFilter)allVideos
{
  ALAssetsFilter *v2;

  v2 = objc_alloc_init(ALAssetsFilter);
  -[ALAssetsFilter _setFilter:](v2, "_setFilter:", 2);
  return v2;
}

+ (ALAssetsFilter)allAssets
{
  ALAssetsFilter *v2;

  v2 = objc_alloc_init(ALAssetsFilter);
  -[ALAssetsFilter _setFilter:](v2, "_setFilter:", 0);
  return v2;
}

@end
