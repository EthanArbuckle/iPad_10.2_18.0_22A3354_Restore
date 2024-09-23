@implementation MusicKit_SoftLinking_MPMediaLibraryAlbumAppData

- (MusicKit_SoftLinking_MPMediaLibraryAlbumAppData)init
{
  MusicKit_SoftLinking_MPMediaLibraryAlbumAppData *v2;
  void *v3;
  objc_class *v4;
  MPMediaLibraryAlbumAppData *v5;
  MPMediaLibraryAlbumAppData *underlyingAlbumAppData;
  id v7;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPMediaLibraryAlbumAppData;
  v2 = -[MusicKit_SoftLinking_MPMediaLibraryAlbumAppData init](&v9, sel_init);
  if (v2)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v3 = (void *)getMPMediaLibraryAlbumAppDataClass_softClass;
    v14 = getMPMediaLibraryAlbumAppDataClass_softClass;
    if (!getMPMediaLibraryAlbumAppDataClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getMPMediaLibraryAlbumAppDataClass_block_invoke;
      v10[3] = &unk_1E9C05688;
      v10[4] = &v11;
      __getMPMediaLibraryAlbumAppDataClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v11, 8);
    v5 = (MPMediaLibraryAlbumAppData *)objc_alloc_init(v4);
    underlyingAlbumAppData = v2->_underlyingAlbumAppData;
    v2->_underlyingAlbumAppData = v5;

    v7 = (id)-[MPMediaLibraryAlbumAppData createAppDataDictionary](v2->_underlyingAlbumAppData, "createAppDataDictionary");
  }
  return v2;
}

- (MPMediaLibraryAlbumAppData)_underlyingAlbumAppData
{
  return self->_underlyingAlbumAppData;
}

- (void)setSongPopularity:(double)a3 forAdamID:(int64_t)a4
{
  MPMediaLibraryAlbumAppData *underlyingAlbumAppData;
  id v6;

  underlyingAlbumAppData = self->_underlyingAlbumAppData;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryAlbumAppData setSongPopularity:forAdamID:](underlyingAlbumAppData, "setSongPopularity:forAdamID:", v6, a4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAlbumAppData, 0);
}

@end
