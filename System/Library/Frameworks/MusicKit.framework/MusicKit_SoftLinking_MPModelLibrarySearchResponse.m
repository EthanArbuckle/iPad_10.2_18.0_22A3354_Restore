@implementation MusicKit_SoftLinking_MPModelLibrarySearchResponse

- (void)enumerateSectionLegacyObjectTypesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[MusicKit_SoftLinking_MPModelResponse results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_underlyingSectionedCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __97__MusicKit_SoftLinking_MPModelLibrarySearchResponse_enumerateSectionLegacyObjectTypesUsingBlock___block_invoke;
  v8[3] = &unk_24CD1D898;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v7, "enumerateSectionsUsingBlock:", v8);

}

+ (int64_t)_modelObjectTypeForLibrarySearchResultModelKind:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  Class (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v4 = (void *)getMPModelGenericObjectKindClass_softClass_0;
  v26 = getMPModelGenericObjectKindClass_softClass_0;
  if (!getMPModelGenericObjectKindClass_softClass_0)
  {
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __getMPModelGenericObjectKindClass_block_invoke_0;
    v21 = &unk_24CD1CC68;
    v22 = &v23;
    __getMPModelGenericObjectKindClass_block_invoke_0((uint64_t)&v18);
    v4 = (void *)v24[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 11;
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v7 = (void *)getMPModelAlbumKindClass_softClass_1;
    v26 = getMPModelAlbumKindClass_softClass_1;
    if (!getMPModelAlbumKindClass_softClass_1)
    {
      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __getMPModelAlbumKindClass_block_invoke_1;
      v21 = &unk_24CD1CC68;
      v22 = &v23;
      __getMPModelAlbumKindClass_block_invoke_1((uint64_t)&v18);
      v7 = (void *)v24[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v23, 8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x2050000000;
      v9 = (void *)getMPModelArtistKindClass_softClass;
      v26 = getMPModelArtistKindClass_softClass;
      if (!getMPModelArtistKindClass_softClass)
      {
        v18 = MEMORY[0x24BDAC760];
        v19 = 3221225472;
        v20 = __getMPModelArtistKindClass_block_invoke;
        v21 = &unk_24CD1CC68;
        v22 = &v23;
        __getMPModelArtistKindClass_block_invoke((uint64_t)&v18);
        v9 = (void *)v24[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v23, 8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = 2;
      }
      else
      {
        v23 = 0;
        v24 = &v23;
        v25 = 0x2050000000;
        v11 = (void *)getMPModelComposerKindClass_softClass;
        v26 = getMPModelComposerKindClass_softClass;
        if (!getMPModelComposerKindClass_softClass)
        {
          v18 = MEMORY[0x24BDAC760];
          v19 = 3221225472;
          v20 = __getMPModelComposerKindClass_block_invoke;
          v21 = &unk_24CD1CC68;
          v22 = &v23;
          __getMPModelComposerKindClass_block_invoke((uint64_t)&v18);
          v11 = (void *)v24[3];
        }
        v12 = objc_retainAutorelease(v11);
        _Block_object_dispose(&v23, 8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = 3;
        }
        else
        {
          v23 = 0;
          v24 = &v23;
          v25 = 0x2050000000;
          v13 = (void *)getMPModelMovieKindClass_softClass;
          v26 = getMPModelMovieKindClass_softClass;
          if (!getMPModelMovieKindClass_softClass)
          {
            v18 = MEMORY[0x24BDAC760];
            v19 = 3221225472;
            v20 = __getMPModelMovieKindClass_block_invoke;
            v21 = &unk_24CD1CC68;
            v22 = &v23;
            __getMPModelMovieKindClass_block_invoke((uint64_t)&v18);
            v13 = (void *)v24[3];
          }
          v14 = objc_retainAutorelease(v13);
          _Block_object_dispose(&v23, 8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v6 = 13;
          }
          else
          {
            v23 = 0;
            v24 = &v23;
            v25 = 0x2050000000;
            v15 = (void *)getMPModelPlaylistKindClass_softClass_2;
            v26 = getMPModelPlaylistKindClass_softClass_2;
            if (!getMPModelPlaylistKindClass_softClass_2)
            {
              v18 = MEMORY[0x24BDAC760];
              v19 = 3221225472;
              v20 = __getMPModelPlaylistKindClass_block_invoke_2;
              v21 = &unk_24CD1CC68;
              v22 = &v23;
              __getMPModelPlaylistKindClass_block_invoke_2((uint64_t)&v18);
              v15 = (void *)v24[3];
            }
            v16 = objc_retainAutorelease(v15);
            _Block_object_dispose(&v23, 8);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v6 = 15;
            }
            else
            {
              getMPModelSongKindClass_0();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v6 = 30;
              }
              else
              {
                getMPModelTVEpisodeKindClass();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v6 = 31;
                else
                  v6 = 26;
              }
            }
          }
        }
      }
    }
  }

  return v6;
}

@end
