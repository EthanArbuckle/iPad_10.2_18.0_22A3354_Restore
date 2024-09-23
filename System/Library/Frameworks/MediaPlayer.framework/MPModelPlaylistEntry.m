@implementation MPModelPlaylistEntry

+ (id)__universalIdentifier_KEY
{
  return CFSTR("MPModelPropertyPlaylistEntryUniversalIdentifier");
}

+ (id)__tvEpisode_KEY
{
  return CFSTR("MPModelRelationshipPlaylistEntryTVEpisode");
}

+ (id)__song_KEY
{
  return CFSTR("MPModelRelationshipPlaylistEntrySong");
}

+ (id)__socialContributor_KEY
{
  return CFSTR("MPModelRelationshipPlaylistEntrySocialContributor");
}

+ (id)__position_KEY
{
  return CFSTR("MPModelPropertyPlaylistEntryPosition");
}

+ (id)__positionUniversalIdentifier_KEY
{
  return CFSTR("MPModelPropertyPlaylistEntryPositionUniversalIdentifier");
}

+ (id)__playlist_KEY
{
  return CFSTR("MPModelRelationshipPlaylistEntryPlaylist");
}

+ (id)__movie_KEY
{
  return CFSTR("MPModelRelationshipPlaylistEntryMovie");
}

+ (id)___artworkCatalog_KEY
{
  return CFSTR("_MPModelPropertyPlaylistEntryArtwork");
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  MPPropertySet *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v7 = CFSTR("MPModelRelationshipPlaylistEntrySong");
  +[MPModelSong requiredLibraryAddStatusObservationProperties](MPModelSong, "requiredLibraryAddStatusObservationProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", MEMORY[0x1E0C9AA60], v4);

  return v5;
}

+ (id)requiredLibraryRemovalProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  MPPropertySet *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v7 = CFSTR("MPModelRelationshipPlaylistEntrySong");
  +[MPModelSong requiredLibraryRemovalProperties](MPModelSong, "requiredLibraryRemovalProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", MEMORY[0x1E0C9AA60], v4);

  return v5;
}

+ (id)requiredKeepLocalStatusObservationProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  MPPropertySet *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v7 = CFSTR("MPModelRelationshipPlaylistEntrySong");
  +[MPModelSong requiredKeepLocalStatusObservationProperties](MPModelSong, "requiredKeepLocalStatusObservationProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", MEMORY[0x1E0C9AA60], v4);

  return v5;
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPPropertySet *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v9[0] = CFSTR("MPModelRelationshipPlaylistEntrySong");
  +[MPModelSong requiredStoreLibraryPersonalizationProperties](MPModelSong, "requiredStoreLibraryPersonalizationProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("MPModelRelationshipPlaylistEntryMovie");
  +[MPModelMovie requiredStoreLibraryPersonalizationProperties](MPModelMovie, "requiredStoreLibraryPersonalizationProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("MPModelRelationshipPlaylistEntryTVEpisode");
  +[MPModelTVEpisode requiredStoreLibraryPersonalizationProperties](MPModelTVEpisode, "requiredStoreLibraryPersonalizationProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", MEMORY[0x1E0C9AA60], v6);

  return v7;
}

+ (BOOL)supportsKeepLocalStatusObservation
{
  return 1;
}

+ (id)kindWithKinds:(id)a3
{
  return +[MPModelPlaylistEntryKind kindWithKinds:](MPModelPlaylistEntryKind, "kindWithKinds:", a3);
}

- (id)mediaItemPropertyValues
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[MPModelPlaylistEntry type](self, "type");
  switch(v3)
  {
    case 3:
      -[MPModelPlaylistEntry movie](self, "movie");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[MPModelPlaylistEntry tvEpisode](self, "tvEpisode");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[MPModelPlaylistEntry song](self, "song");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      return v6;
  }
  v5 = v4;
  objc_msgSend(v4, "mediaItemPropertyValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  void *v2;
  uint64_t v3;

  -[MPModelPlaylistEntry song](self, "song");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "libraryAddStatusObserverConfiguration");

  return (MPLibraryAddStatusObserverConfiguration)v3;
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 1;
}

- (int64_t)libraryRemovalSupportedOptions
{
  void *v2;
  int64_t v3;

  -[MPModelPlaylistEntry song](self, "song");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "libraryRemovalSupportedOptions");

  return v3;
}

+ (BOOL)supportsLibraryRemoval
{
  return 1;
}

- (id)newKeepLocalStatusObserverConfiguration
{
  void *v2;
  void *v3;

  -[MPModelPlaylistEntry song](self, "song");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newKeepLocalStatusObserverConfiguration");

  return v3;
}

+ (int64_t)genericObjectType
{
  return 5;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__165;
  v15 = __Block_byref_object_dispose__166;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__personalizationScopedPropertiesForProperties___block_invoke;
  v8[3] = &unk_1E31635A8;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)relativeModelObjectForStoreLibraryPersonalization
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__165;
  v9 = __Block_byref_object_dispose__166;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __111__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__relativeModelObjectForStoreLibraryPersonalization__block_invoke;
  v4[3] = &unk_1E3163580;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v4);
  objc_msgSend((id)v6[5], "relativeModelObjectForStoreLibraryPersonalization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[MPModelObject identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __119__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke;
  v9[3] = &unk_1E315D720;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v7 = -[MPModelObject copyWithIdentifiers:block:](self, "copyWithIdentifiers:block:", v5, v9);

  return v7;
}

void __119__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __119__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke_2;
  v6[3] = &unk_1E3163698;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v6);

}

void __119__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "song");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "song");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectWithStoreLibraryPersonalizationRelativeModelObject:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSong:", v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "movie");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "movie");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectWithStoreLibraryPersonalizationRelativeModelObject:", *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMovie:", v4);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        return;
      v8 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectWithStoreLibraryPersonalizationRelativeModelObject:", *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTvEpisode:", v4);
    }
  }

}

void __111__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__relativeModelObjectForStoreLibraryPersonalization__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "song");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "movie");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }
}

void __107__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__personalizationScopedPropertiesForProperties___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "song");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "song");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "relationships");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("MPModelRelationshipPlaylistEntrySong"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v3, "movie");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v8, "movie");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "relationships");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("MPModelRelationshipPlaylistEntryMovie"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(v8, "tvEpisode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        return;
      objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "relationships");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("MPModelRelationshipPlaylistEntryTVEpisode"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  objc_msgSend(v13, "personalizationScopedPropertiesForProperties:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (!v5)
  {

    v5 = 0;
  }

}

- (id)humanDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MPModelPlaylistEntry anyObject](self, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "humanDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelObject identifiers](self, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "humanDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("playlist entry %@+%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)anyObject
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__41747;
  v9 = __Block_byref_object_dispose__41748;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__MPModelPlaylistEntry_anyObject__block_invoke;
  v4[3] = &unk_1E3163580;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (int64_t)type
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__MPModelPlaylistEntry_type__block_invoke;
  v4[3] = &unk_1E3163580;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __28__MPModelPlaylistEntry_type__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "song");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v3 = 2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        return;
      v3 = 3;
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

void __33__MPModelPlaylistEntry_anyObject__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "song");
  v3 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v3;
  if (v3)
  {
    v4 = 0;
    v5 = (void *)v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
    v6 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)v6;
    if (v6)
    {
      v4 = 0;
      v5 = (void *)v6;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 1;
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
  if (v4)

  v7 = v8;
  if (!v8)
  {

    v7 = 0;
  }

}

+ (void)__MPModelPropertyPlaylistEntryPosition__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntry.m"), 77, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistEntryPosition"));

}

+ (void)__MPModelPropertyPlaylistEntryUniversalIdentifier__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntry.m"), 78, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistEntryUniversalIdentifier"));

}

+ (void)__MPModelPropertyPlaylistEntryPositionUniversalIdentifier__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntry.m"), 79, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistEntryPositionUniversalIdentifier"));

}

+ (void)__MPModelRelationshipPlaylistEntryPlaylist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntry.m"), 80, CFSTR("Translator was missing mapping for MPModelRelationshipPlaylistEntryPlaylist"));

}

+ (void)__MPModelRelationshipPlaylistEntrySong__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntry.m"), 81, CFSTR("Translator was missing mapping for MPModelRelationshipPlaylistEntrySong"));

}

+ (void)__MPModelRelationshipPlaylistEntryTVEpisode__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntry.m"), 82, CFSTR("Translator was missing mapping for MPModelRelationshipPlaylistEntryTVEpisode"));

}

+ (void)__MPModelRelationshipPlaylistEntryMovie__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntry.m"), 83, CFSTR("Translator was missing mapping for MPModelRelationshipPlaylistEntryMovie"));

}

+ (void)__MPModelRelationshipPlaylistEntrySocialContributor__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntry.m"), 84, CFSTR("Translator was missing mapping for MPModelRelationshipPlaylistEntrySocialContributor"));

}

+ (void)___MPModelPropertyPlaylistEntryArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntry.m"), 86, CFSTR("Translator was missing mapping for _MPModelPropertyPlaylistEntryArtwork"));

}

@end
