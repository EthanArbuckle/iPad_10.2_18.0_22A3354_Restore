@implementation MusicKit_SoftLinking_MPModelAlbumKind

- (MusicKit_SoftLinking_MPModelAlbumKind)initWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  MusicKit_SoftLinking_MPModelAlbumKind *v12;
  MusicKit_SoftLinking_MPModelAlbumKind *v13;
  objc_super v15;

  v7 = -[MusicKit_SoftLinking_MPModelAlbumKind _underlyingVariantsFromVariants:](self, "_underlyingVariantsFromVariants:");
  v8 = -[MusicKit_SoftLinking_MPModelAlbumKind _underlyingOptionsFromOptions:](self, "_underlyingOptionsFromOptions:", a4);
  v9 = (void *)objc_opt_class();
  if ((a4 & 2) != 0)
    objc_msgSend(v9, "_defaultSongKind");
  else
    objc_msgSend(v9, "_defaultSongKindForAudioOnly");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getMPModelAlbumClass(), "kindWithVariants:songKind:options:", v7, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)MusicKit_SoftLinking_MPModelAlbumKind;
  v12 = -[MusicKit_SoftLinking_MPModelKind _initWithUnderlyingKind:](&v15, sel__initWithUnderlyingKind_, v11);
  v13 = v12;
  if (v12)
  {
    v12->_options = a4;
    v12->_variants = a3;
  }

  return v13;
}

- (unint64_t)_underlyingVariantsFromVariants:(unint64_t)a3
{
  return a3 & 3;
}

- (unint64_t)_underlyingOptionsFromOptions:(unint64_t)a3
{
  return a3 & 1;
}

- (unint64_t)variants
{
  return self->_variants;
}

- (unint64_t)options
{
  return self->_options;
}

@end
