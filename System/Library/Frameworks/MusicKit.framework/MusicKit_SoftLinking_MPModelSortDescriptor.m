@implementation MusicKit_SoftLinking_MPModelSortDescriptor

- (MusicKit_SoftLinking_MPModelSortDescriptor)initWithKey:(id)a3 isAscending:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  MusicKit_SoftLinking_MPModelSortDescriptor *v7;
  uint64_t v8;
  NSSortDescriptor *sortDescriptor;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPModelSortDescriptor;
  v7 = -[MusicKit_SoftLinking_MPModelSortDescriptor init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", v6, v4);
    sortDescriptor = v7->_sortDescriptor;
    v7->_sortDescriptor = (NSSortDescriptor *)v8;

  }
  return v7;
}

- (MusicKit_SoftLinking_MPModelSortDescriptor)initWithKeyPath:(id)a3 isAscending:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  MusicKit_SoftLinking_MPModelSortDescriptor *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSSortDescriptor *sortDescriptor;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a4;
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MusicKit_SoftLinking_MPModelSortDescriptor;
  v7 = -[MusicKit_SoftLinking_MPModelSortDescriptor init](&v13, sel_init);
  if (v7)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v8 = (void *)getMPModelSortDescriptorClass_softClass;
    v18 = getMPModelSortDescriptorClass_softClass;
    if (!getMPModelSortDescriptorClass_softClass)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __getMPModelSortDescriptorClass_block_invoke;
      v14[3] = &unk_24CD1CC68;
      v14[4] = &v15;
      __getMPModelSortDescriptorClass_block_invoke((uint64_t)v14);
      v8 = (void *)v16[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v15, 8);
    objc_msgSend(v9, "sortDescriptorWithKeyPath:ascending:", v6, v4);
    v10 = objc_claimAutoreleasedReturnValue();
    sortDescriptor = v7->_sortDescriptor;
    v7->_sortDescriptor = (NSSortDescriptor *)v10;

  }
  return v7;
}

+ (NSSortDescriptor)recentlyAddedModelObjectSortDescriptor
{
  id MPMultiSortDescriptorClass;
  void *v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  id *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  _QWORD v28[3];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  MPMultiSortDescriptorClass = getMPMultiSortDescriptorClass();
  getMPModelRelationshipGenericAlbum_1();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = (id *)getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr_0;
  v26 = getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr_0)
  {
    v5 = (void *)MediaPlayerLibrary_13();
    v4 = (id *)dlsym(v5, "MPModelPropertyAlbumLibraryAddedDate");
    v24[3] = (uint64_t)v4;
    getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr_0 = (uint64_t)v4;
  }
  _Block_object_dispose(&v23, 8);
  if (!v4)
    goto LABEL_14;
  v6 = *v4;
  v28[0] = v6;
  getMPModelRelationshipGenericMovie_1();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v7;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v8 = (id *)getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr_0;
  v26 = getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr_0)
  {
    v9 = (void *)MediaPlayerLibrary_13();
    v8 = (id *)dlsym(v9, "MPModelPropertyMovieLibraryAddedDate");
    v24[3] = (uint64_t)v8;
    getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr_0 = (uint64_t)v8;
  }
  _Block_object_dispose(&v23, 8);
  if (!v8)
    goto LABEL_14;
  v10 = *v8;
  v28[1] = v10;
  getMPModelRelationshipGenericPlaylist_1();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v11;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v12 = (id *)getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr_0;
  v26 = getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr_0)
  {
    v13 = (void *)MediaPlayerLibrary_13();
    v12 = (id *)dlsym(v13, "MPModelPropertyPlaylistLibraryAddedDate");
    v24[3] = (uint64_t)v12;
    getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr_0 = (uint64_t)v12;
  }
  _Block_object_dispose(&v23, 8);
  if (!v12)
    goto LABEL_14;
  v14 = *v12;
  v28[2] = v14;
  getMPModelRelationshipGenericTVSeason_1();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v15;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v16 = (id *)getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr_0;
  v26 = getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr_0)
  {
    v17 = (void *)MediaPlayerLibrary_13();
    v16 = (id *)dlsym(v17, "MPModelPropertyTVSeasonLibraryAddedDate");
    v24[3] = (uint64_t)v16;
    getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr_0 = (uint64_t)v16;
  }
  _Block_object_dispose(&v23, 8);
  if (!v16)
  {
LABEL_14:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v29 = *v16;
  v18 = (void *)MEMORY[0x24BDBCE70];
  v19 = v29;
  objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MPMultiSortDescriptorClass, "sortDescriptorWithRelatedProperties:ascending:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSortDescriptor *)v21;
}

+ (NSSortDescriptor)recentlyDownloadedModelObjectSortDescriptor
{
  id MPMultiSortDescriptorClass;
  void *v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  id *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  _QWORD v28[3];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  MPMultiSortDescriptorClass = getMPMultiSortDescriptorClass();
  getMPModelRelationshipGenericAlbum_1();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = (id *)getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr_0;
  v26 = getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr_0)
  {
    v5 = (void *)MediaPlayerLibrary_13();
    v4 = (id *)dlsym(v5, "MPModelPropertyAlbumDownloadedDate");
    v24[3] = (uint64_t)v4;
    getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr_0 = (uint64_t)v4;
  }
  _Block_object_dispose(&v23, 8);
  if (!v4)
    goto LABEL_14;
  v6 = *v4;
  v28[0] = v6;
  getMPModelRelationshipGenericMovie_1();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v7;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v8 = (id *)getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr_0;
  v26 = getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr_0)
  {
    v9 = (void *)MediaPlayerLibrary_13();
    v8 = (id *)dlsym(v9, "MPModelPropertyMovieDownloadedDate");
    v24[3] = (uint64_t)v8;
    getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr_0 = (uint64_t)v8;
  }
  _Block_object_dispose(&v23, 8);
  if (!v8)
    goto LABEL_14;
  v10 = *v8;
  v28[1] = v10;
  getMPModelRelationshipGenericPlaylist_1();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v11;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v12 = (id *)getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr_0;
  v26 = getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr_0)
  {
    v13 = (void *)MediaPlayerLibrary_13();
    v12 = (id *)dlsym(v13, "MPModelPropertyPlaylistDownloadedDate");
    v24[3] = (uint64_t)v12;
    getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr_0 = (uint64_t)v12;
  }
  _Block_object_dispose(&v23, 8);
  if (!v12)
    goto LABEL_14;
  v14 = *v12;
  v28[2] = v14;
  getMPModelRelationshipGenericTVSeason_1();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v15;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v16 = (id *)getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr_0;
  v26 = getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr_0)
  {
    v17 = (void *)MediaPlayerLibrary_13();
    v16 = (id *)dlsym(v17, "MPModelPropertyTVSeasonDownloadedDate");
    v24[3] = (uint64_t)v16;
    getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr_0 = (uint64_t)v16;
  }
  _Block_object_dispose(&v23, 8);
  if (!v16)
  {
LABEL_14:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v29 = *v16;
  v18 = (void *)MEMORY[0x24BDBCE70];
  v19 = v29;
  objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MPMultiSortDescriptorClass, "sortDescriptorWithRelatedProperties:ascending:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSortDescriptor *)v21;
}

- (NSSortDescriptor)sortDescriptor
{
  return self->_sortDescriptor;
}

- (void)setSortDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptor, 0);
}

@end
