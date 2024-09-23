@implementation MusicKit_SoftLinking_MPModelPlaylistCollaboratorKind

- (MusicKit_SoftLinking_MPModelPlaylistCollaboratorKind)init
{
  void *v3;
  MusicKit_SoftLinking_MPModelPlaylistCollaboratorKind *v4;
  objc_super v6;

  +[MusicKit_SoftLinking_MPModelKind _defaultPlaylistAuthorKind](MusicKit_SoftLinking_MPModelKind, "_defaultPlaylistAuthorKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_MPModelPlaylistCollaboratorKind;
  v4 = -[MusicKit_SoftLinking_MPModelKind _initWithUnderlyingKind:](&v6, sel__initWithUnderlyingKind_, v3);

  return v4;
}

- (MusicKit_SoftLinking_MPModelPlaylistCollaboratorKind)initWithVariants:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  MusicKit_SoftLinking_MPModelPlaylistCollaboratorKind *v9;
  MusicKit_SoftLinking_MPModelPlaylistCollaboratorKind *v10;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = -[MusicKit_SoftLinking_MPModelPlaylistCollaboratorKind _underlyingVariantsFromVariants:](self, "_underlyingVariantsFromVariants:");
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v6 = (void *)getMPModelPlaylistAuthorClass_softClass_0;
  v17 = getMPModelPlaylistAuthorClass_softClass_0;
  if (!getMPModelPlaylistAuthorClass_softClass_0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __getMPModelPlaylistAuthorClass_block_invoke_0;
    v13[3] = &unk_24CD1CC68;
    v13[4] = &v14;
    __getMPModelPlaylistAuthorClass_block_invoke_0((uint64_t)v13);
    v6 = (void *)v15[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v7, "kindWithVariants:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)MusicKit_SoftLinking_MPModelPlaylistCollaboratorKind;
  v9 = -[MusicKit_SoftLinking_MPModelKind _initWithUnderlyingKind:](&v12, sel__initWithUnderlyingKind_, v8);
  v10 = v9;
  if (v9)
    v9->_variants = a3;

  return v10;
}

- (unint64_t)_underlyingVariantsFromVariants:(unint64_t)a3
{
  return a3 & 7;
}

- (unint64_t)variants
{
  return self->_variants;
}

@end
