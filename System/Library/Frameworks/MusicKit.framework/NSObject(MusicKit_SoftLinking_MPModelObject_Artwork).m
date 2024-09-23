@implementation NSObject(MusicKit_SoftLinking_MPModelObject_Artwork)

- (id)musicKit_artworkCatalogForProperty:()MusicKit_SoftLinking_MPModelObject_Artwork
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  char v11;
  uint64_t v12;
  void *v13;
  _Unwind_Exception *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v5 = (void *)getMPModelObjectClass_softClass_2;
  v24 = getMPModelObjectClass_softClass_2;
  if (!getMPModelObjectClass_softClass_2)
  {
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = (uint64_t)__getMPModelObjectClass_block_invoke_2;
    v19 = &unk_24CD1CC68;
    v20 = &v21;
    __getMPModelObjectClass_block_invoke_2((uint64_t)&v16);
    v5 = (void *)v22[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v21, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = a1;
    if (objc_msgSend(v7, "hasLoadedValueForKey:", v4))
    {
      v16 = 0;
      v17 = (uint64_t)&v16;
      v18 = 0x2020000000;
      v8 = (id *)getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr_0;
      v19 = (void *)getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr_0;
      if (!getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr_0)
      {
        v9 = (void *)MediaPlayerLibrary_11();
        v8 = (id *)dlsym(v9, "MPModelPropertyPlaylistTracksTiledArtwork");
        *(_QWORD *)(v17 + 24) = v8;
        getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr_0 = (uint64_t)v8;
      }
      _Block_object_dispose(&v16, 8);
      if (!v8)
      {
        v15 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
        _Block_object_dispose(&v16, 8);
        _Unwind_Resume(v15);
      }
      v10 = *v8;
      if (objc_msgSend(v4, "isEqualToString:", v10))
      {
        v11 = objc_opt_respondsToSelector();

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v7, "tracksTiledArtworkCatalogWithRows:columns:", 2, 2);
          v12 = objc_claimAutoreleasedReturnValue();
LABEL_15:
          v13 = (void *)v12;
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "artworkCatalog");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    v13 = 0;
    goto LABEL_17;
  }
  v13 = 0;
LABEL_18:

  return v13;
}

@end
