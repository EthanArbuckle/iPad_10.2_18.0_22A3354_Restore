@implementation MusicKit_SoftLinking_MPModelSongKind

- (MusicKit_SoftLinking_MPModelSongKind)initWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  void *v7;
  MusicKit_SoftLinking_MPModelSongKind *v8;
  MusicKit_SoftLinking_MPModelSongKind *v9;
  objc_super v11;

  objc_msgSend(getMPModelSongClass(), "kindWithVariants:options:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPModelSongKind;
  v8 = -[MusicKit_SoftLinking_MPModelKind _initWithUnderlyingKind:](&v11, sel__initWithUnderlyingKind_, v7);
  v9 = v8;
  if (v8)
  {
    v8->_options = a4;
    v8->_variants = a3;
  }

  return v9;
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
